unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, System.UITypes,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls, Datasnap.DBClient, Vcl.Mask;

type
  TFrmPrincipal = class(TForm)
    PGControl: TPageControl;
    TSPedidos: TTabSheet;
    TSItens: TTabSheet;
    GridPedidos: TDBGrid;
    GBImpVendas: TGroupBox;
    RGCondPgto: TRadioGroup;
    GBPersonalizada: TGroupBox;
    LblPercentual: TLabel;
    EdtPercentPerson: TEdit;
    BtnSimulaVda: TButton;
    LblTitulo: TLabel;
    PnlBotoes: TPanel;
    BtnNovo: TButton;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    PnlCamposPed: TPanel;
    LblTitNunPed: TLabel;
    LblTitCliente: TLabel;
    LblTitEnd: TLabel;
    LblTitCidade: TLabel;
    LblTitUF: TLabel;
    GridItens: TDBGrid;
    PnlLancItens: TPanel;
    Label15: TLabel;
    LblTitQuant: TLabel;
    LblTitProduto: TLabel;
    BtnNav: TDBNavigator;
    PnlBtnItens: TPanel;
    BtnCancPed: TButton;
    BtnGravaPed: TButton;
    LblTituloIItens: TLabel;
    LblItens: TLabel;
    LblLancItens: TLabel;
    CDS: TClientDataSet;
    CDSnped: TStringField;
    CDScliente: TStringField;
    CDSendereco: TStringField;
    CDScidade: TStringField;
    CDSuf: TStringField;
    CDSvalor: TFloatField;
    DS: TDataSource;
    CDSItem: TClientDataSet;
    DSItem: TDataSource;
    CDSItemidped: TIntegerField;
    CDSItemproduto: TStringField;
    CDSItemqtd: TFloatField;
    CDSItemvlrUnit: TFloatField;
    CDSItemvlrtotal: TFloatField;
    DBEditNPed: TDBEdit;
    DBEditCliente: TDBEdit;
    DBEditEnd: TDBEdit;
    DBEditUF: TDBEdit;
    DBEditProduto: TDBEdit;
    DBEditVlrUnit: TDBEdit;
    DBEditQtd: TDBEdit;
    DBEditCidade: TDBEdit;
    procedure BtnSimulaVdaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravaPedClick(Sender: TObject);
    procedure BtnNavClick(Sender: TObject; Button: TNavigateBtn);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancPedClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure GridItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBEditVlrUnitChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  Nped: Integer;

implementation

{$R *.dfm}

uses uPrintPDV, uControladores;

procedure TFrmPrincipal.BtnCancPedClick(Sender: TObject);
begin
  CDS.Close;
  CDS.Open;
  CDSItem.Close;
  CDSItem.Open;
  InitializePed(FrmPrincipal);
end;

procedure TFrmPrincipal.BtnEditarClick(Sender: TObject);
begin
  TSItens.Enabled:= True;
  CDS.Edit;
  TSItens.Show;
  DBEditCliente.SetFocus;
end;

procedure TFrmPrincipal.BtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma a exclus�o?', mtWarning, [mbYes, mbNo], 0) = IDYES then
    DelPed(CDSnped.AsString);
end;

procedure TFrmPrincipal.BtnGravaPedClick(Sender: TObject);
begin
  SavePed;
end;

procedure TFrmPrincipal.BtnNavClick(Sender: TObject; Button: TNavigateBtn);
begin
  if ( CDSItem.State in [dsInsert] ) then
  begin
    DBEditProduto.Enabled := True;
    DBEditQtd.Enabled     := True;
    DBEditVlrUnit.Enabled := True;
    CDSItemidped.AsInteger:= StrToInt(DBEditNPed.Text);
    DBEditProduto.SetFocus;
  end;
end;

procedure TFrmPrincipal.BtnNovoClick(Sender: TObject);
begin
  NewPed;
end;

procedure TFrmPrincipal.BtnSimulaVdaClick(Sender: TObject);
begin
  SimularVda;
end;

procedure TFrmPrincipal.DBEditVlrUnitChange(Sender: TObject);
begin
    if ( CDSItem.State in [dsInsert] ) then
    if (Length(DBEditVlrUnit.Text) > 0) then
    CDSItemvlrtotal.Value:= StrToFloat(DBEditVlrUnit.Text) * StrToFloat(DBEditQtd.Text);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  InitializePed(FrmPrincipal);
end;

procedure TFrmPrincipal.GridItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    if Odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
      (Sender as TDBGrid).Canvas.Brush.Color:= clWhite
    else
      (Sender as TDBGrid).Canvas.Brush.Color:= $00F1F2F3;

    (Sender as TDBGrid).Canvas.Font.Color:= clBlack;

    (Sender as TDBGrid).Canvas.FillRect(Rect);
    (Sender as TDBGrid).Canvas.TextOut(Rect.Left + 2, Rect.Top,
    Column.Field.DisplayText);
  end;
end;

end.

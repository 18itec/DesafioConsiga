unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
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
    procedure DBEditVlrUnitExit(Sender: TObject);
    procedure BtnCancPedClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uPrintPDV, uControladores;

procedure TFrmPrincipal.BtnCancPedClick(Sender: TObject);
begin
  CDSItem.First;
  While not CDSItem.Eof do
  begin
    if (CDSItemidped.Value = StrToInt(CDSnped.Value)) then
      CDSItem.Delete;
    CDSItem.Next;
  end;
  CDS.Delete;

  CDS.Close;
  CDS.Open;
  CDSItem.Close;
  CDSItem.Open;
  TSPedidos.Show;
  TSItens.Enabled:= false;
end;

procedure TFrmPrincipal.BtnEditarClick(Sender: TObject);
begin
  TSItens.Enabled:= True;
  CDS.Open;
  CDSItem.Open;
  CDS.Edit;
  TSItens.Show;
  DBEditNPed.SetFocus;
  GridItens.Enabled:= False;
end;

procedure TFrmPrincipal.BtnExcluirClick(Sender: TObject);
begin
  //CDS.DisableControls;
  //CDSItem.DisableControls;

  if MessageDlg('Confirma a exclus�o?', mtWarning, [mbYes, mbNo], 0) = IDYES then
  begin
    CDSItem.First;
    While not CDSItem.Eof do
    begin
      if (CDSItemidped.Value = StrToInt(CDSnped.Value)) then
        CDSItem.Delete;
      CDSItem.Next;
    end;
    CDS.Delete;
  end;
end;

procedure TFrmPrincipal.BtnGravaPedClick(Sender: TObject);
var
  Res: Double;
begin
  Res:=0;
  CDSItem.First;
  While not CDSItem.Eof do
  begin
    if (CDSItemidped.Value = StrToInt(CDSnped.Value)) then
      Res:= Res+ CDSItemvlrtotal.Value;
    CDSItem.Next;
  end;
  CDSvalor.AsFloat := Res;
  CDS.Post;
  GridItens.Enabled:= True;
  CDS.Close;
  CDS.Open;
  CDSItem.Close;
  CDSItem.Open;
  TSPedidos.Show;
  Application.MessageBox('Pedido salvo com sucesso.','Aviso', MB_OK + MB_ICONINFORMATION);
  CDSItem.EnableControls;
  TSItens.Enabled:= false;
end;

procedure TFrmPrincipal.BtnNavClick(Sender: TObject; Button: TNavigateBtn);
begin
  if ( CDSItem.State in [dsInsert] ) then
    begin
      DBEditProduto.Enabled:= True;
      DBEditQtd.Enabled:= True;
      DBEditVlrUnit.Enabled:= True;
      DBEditProduto.SetFocus;
      CDSItemidped.AsInteger:= StrToInt(DBEditNPed.Text);
    end;

end;

procedure TFrmPrincipal.BtnNovoClick(Sender: TObject);
begin
  TSItens.Enabled:= True;
  CDS.Open;
  CDSItem.Open;
  CDS.Insert;
  CDSItem.Insert;
  TSItens.Show;
  DBEditNPed.SetFocus;
  GridItens.Enabled:= False;
end;

procedure TFrmPrincipal.BtnSimulaVdaClick(Sender: TObject);
var
  PipeLine: String;
  i:integer;
begin

  FrmPrintPDV := TFrmPrintPDV.Create(Application);
  for i:=0 to 190 do
  PipeLine:= PipeLine + '.';


  FrmPrintPDV.MPrint.Lines.Clear;
  FrmPrintPDV.MPrint.Lines.Add(PipeLine);
  FrmPrintPDV.MPrint.Lines.Add('Venda :'+CDSnped.Value);
  FrmPrintPDV.MPrint.Lines.Add('Cliente :'+CDScliente.Value);
  FrmPrintPDV.MPrint.Lines.Add('Endere�o :'+CDSendereco.Value);
  FrmPrintPDV.MPrint.Lines.Add('Cidade/UF :'+CDScidade.Value+'/'+CDSuf.Value);
  FrmPrintPDV.MPrint.Lines.Add(PipeLine);
  FrmPrintPDV.MPrint.Lines.Add('Produto                                                                                                                                                                             Quantidade         Unit�rio           Total');
  FrmPrintPDV.MPrint.Lines.Add(PipeLine);
  //loop dos produtos
  FrmPrintPDV.MPrint.Lines.Add(PipeLine);
  FrmPrintPDV.MPrint.Lines.Add('                                                                                                                                                                                                                              Total '+formatfloat('#,##0', CDSvalor.Value));
  FrmPrintPDV.MPrint.Lines.Add(PipeLine);

  Case RGCondPgto.ItemIndex of
    0 : FrmPrintPDV.MPrint.Lines.Add('A vista Sem Desconto');
    1 : FrmPrintPDV.MPrint.Lines.Add('A vista com 5% de Desconto');
    2 : FrmPrintPDV.MPrint.Lines.Add('A vista com 10% de Desconto');
    3 : FrmPrintPDV.MPrint.Lines.Add('A vista com '+EdtPercentPerson.Text+'% de Desconto');
    4 : FrmPrintPDV.MPrint.Lines.Add('Acrescimo de 10%');
    5 : FrmPrintPDV.MPrint.Lines.Add('Acrescimo de 12%');
    6 : FrmPrintPDV.MPrint.Lines.Add('Acrescimo de '+EdtPercentPerson.Text+'%');
  end;

  FrmPrintPDV.MPrint.Lines.Add(PipeLine);
  FrmPrintPDV.Show;
end;


procedure TFrmPrincipal.DBEditVlrUnitExit(Sender: TObject);
begin
  if DBEditVlrUnit.Text <> '' then
    CDSItemvlrtotal.Value:= StrToFloat(DBEditVlrUnit.Text) *StrToFloat(DBEditQtd.Text);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  RGCondPgto.ItemIndex:=0;
   InitializePed(FrmPrincipal);
   EdtPercentPerson.Text:='0';
end;

end.

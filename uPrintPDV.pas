unit uPrintPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmPrintPDV = class(TForm)
    MPrint: TMemo;
    PnlBotao: TPanel;
    BtnVoltar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrintPDV: TFrmPrintPDV;

implementation

{$R *.dfm}

uses uControladores;

procedure TFrmPrintPDV.BtnVoltarClick(Sender: TObject);
begin
  DestroyForm(FrmPrintPDV);
end;

procedure TFrmPrintPDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DestroyForm(FrmPrintPDV);
end;

end.

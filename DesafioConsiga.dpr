program DesafioConsiga;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uPrintPDV in 'uPrintPDV.pas' {FrmPrintPDV},
  uControladores in 'Controllers\uControladores.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmPrintPDV, FrmPrintPDV);
  Application.Run;
end.

unit uControladores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls,XMLIntf, XMLDoc, Datasnap.DBClient;

procedure InitializePed(const Owner: TWinControl);
procedure DestroyForm(const Owner: TForm);

implementation

//Limpar Forms da m�moria para evitar MemLeak
procedure DestroyForm(const Owner: TForm);
begin
  try
    Owner.Free;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message );
  end;
end;

//Inicializa componentes do Form
procedure InitializePed(const Owner: TWinControl);
var
  i: Integer;
begin
  try
    for i := 0 to Owner.ComponentCount - 1 do
    begin
      if Owner.Components[i] is TEdit       then TEdit(Owner.Components[i]).Clear;
      if Owner.Components[i] is TMemo       then TMemo(Owner.Components[i]).Lines.Clear;
      if Owner.Components[i] is TComboBox   then TComboBox(Owner.Components[i]).ItemIndex := -1;
      if (Owner.Components[i] is TTabSheet) and  (TTabSheet(Owner.Components[i]).PageIndex = 0) then
        TTabSheet(Owner.Components[i]).Show;

    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message );
  end;
end;

end.

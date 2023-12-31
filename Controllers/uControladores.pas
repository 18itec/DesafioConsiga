unit uControladores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls,XMLIntf, XMLDoc, Datasnap.DBClient;

procedure InitializePed(const Owner: TWinControl);
procedure DestroyForm(const Owner: TForm);
function FormatSpace(const TypePipe, WriteSender, ColW: String):String;
procedure SimularVda;
procedure NewPed;
procedure SavePed;
function DelPed(Nped:String):Boolean;

implementation

uses uPrincipal, uPrintPDV;

function DelPed(Nped:String):Boolean;
begin
  try
    with FrmPrincipal do
    begin
      (CDS as TClientDataSet).Locate('nped', Nped, []);
      CDSItem.First;
      While not CDSItem.Eof do
      begin
        if (CDSItemidped.Value = CDSnped.AsInteger) then
          CDSItem.Delete;
        CDSItem.Next;
      end;
      CDS.Delete;
    end;
    Result:= True;
  except
    on E: Exception do
    begin
      Raise Exception.CreateFmt('Erro : ''%s''', [E.Message]);
    end;
  end;
end;

procedure SavePed;
var
  Res: Double;
begin
  with FrmPrincipal do
  begin
    Res:=0;
    CDSItem.DisableControls;
    CDSItem.First;
    While not CDSItem.Eof do
    begin
      if (CDSItemidped.Value = StrToInt(DBEditNPed.Text)) then
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
  end;
end;

procedure NewPed;
begin
  with FrmPrincipal do
  begin
    TSItens.Enabled:= True;
    CDS.Open;
    CDS.Prior;
    if (CDSnped.Value <> '') then
      Nped:= CDSnped.AsInteger + 1
    else
      Nped:= 1;
    CDS.Insert;
    CDSItem.Insert;
    DBEditNPed.Text:= IntToStr(Nped);
    TSItens.Show;
    DBEditCliente.SetFocus;
   (CDSItem as TClientDataSet).Locate('idped',Nped.ToString, []);
  end;
end;

procedure SimularVda;
var
  TAMg, qtdx: String;
begin
  with FrmPrincipal do
  begin
    FrmPrintPDV := TFrmPrintPDV.Create(Application);
    CDSItem.DisableControls;
    FrmPrintPDV.MPrint.Lines.Clear;
    FrmPrintPDV.MPrint.Lines.Add(FormatSpace('P','',''));
    FrmPrintPDV.MPrint.Lines.Add('Venda : ' + CDSnped.AsString);
    FrmPrintPDV.MPrint.Lines.Add('Cliente : '+CDScliente.AsString);
    FrmPrintPDV.MPrint.Lines.Add('Endere�o : '+CDSendereco.AsString);
    FrmPrintPDV.MPrint.Lines.Add('Cidade - UF : '+CDScidade.AsString+' - '+CDSuf.AsString);
    FrmPrintPDV.MPrint.Lines.Add(FormatSpace('P', '',''));

    TAMg := 'Produto'+FormatSpace('S', 'Unit�rioQuantidade', 'H1') +
                                  'Quantidade'+ FormatSpace('S', 'Unit�rio', 'U') +
                                  'Unit�rio' + FormatSpace('S', 'Total ', 'T') +
                                  'Total';

    FrmPrintPDV.MPrint.Lines.Add(TAMg) ;
    FrmPrintPDV.MPrint.Lines.Add(FormatSpace('P', '',''));
    CDSItem.Open;
    CDSItem.First;
    While not CDSItem.Eof do
    begin
      qtdx:= Format('%5.5d',[CDSItemqtd.AsInteger]);
      if (CDSItemidped.Value = CDSnped.AsInteger) then
        FrmPrintPDV.MPrint.Lines.Add( Copy(CDSItemproduto.Value,1,7) +
                                      FormatSpace('S',qtdx+CDSItemproduto.AsString, 'P')+
                                      qtdx +
                                      FormatSpace('S', FormatFloat(' ###,###,##0.00',CDSItemvlrUnit.AsFloat), 'U') +
                                      FormatFloat(' ###,###,##0.00',CDSItemvlrUnit.Value)  +
                                      FormatSpace('S', FormatFloat(' ###,###,##0.00',CDSItemvlrUnit.AsFloat), 'T') +
                                      FormatFloat(' ###,###,##0.00',CDSItemvlrtotal.Value));
      CDSItem.Next;
    end;

    //loop dos produtos
    FrmPrintPDV.MPrint.Lines.Add(FormatSpace('P', '',''));
    FrmPrintPDV.MPrint.Lines.Add(FormatSpace('S',TAMg+'   ', 'G')+ 'Total '+FormatFloat(' ###,###,##0.00', CDSvalor.AsFloat));
    FrmPrintPDV.MPrint.Lines.Add(FormatSpace('P', '',''));

    Case RGCondPgto.ItemIndex of
      0 : FrmPrintPDV.MPrint.Lines.Add('A vista Sem Desconto');
      1 : FrmPrintPDV.MPrint.Lines.Add('A vista com 5% de Desconto');
      2 : FrmPrintPDV.MPrint.Lines.Add('A vista com 10% de Desconto');
      3 : FrmPrintPDV.MPrint.Lines.Add('A vista com '+EdtPercentPerson.Text+'% de Desconto');
      4 : FrmPrintPDV.MPrint.Lines.Add('Acrescimo de 10%');
      5 : FrmPrintPDV.MPrint.Lines.Add('Acrescimo de 12%');
      6 : FrmPrintPDV.MPrint.Lines.Add('Acrescimo de '+EdtPercentPerson.Text+'%');
    end;

    FrmPrintPDV.MPrint.Lines.Add(FormatSpace('P', '',''));
    FrmPrintPDV.Show;
    CDSItem.EnableControls;
  end;

end;

function FormatSpace(const TypePipe, WriteSender, ColW: String):String;
var
  TamWrite, i: Integer;
  SepTg: String;
const
  PipSpace  = ' ';
  PipDot    = '.';
begin
  SepTg:='';

  if TypePipe = 'S' then
  begin

    if ColW = 'H1' then
    begin
      TamWrite:=  (142);
      for i:=1 to TamWrite do
        SepTg:= SepTg + PipSpace;
    end;


    if ColW = 'P' then
    begin
      TamWrite:=  (150);
      for i:=1 to TamWrite do
        SepTg:= SepTg + PipSpace;
    end;

    if ColW = 'U' then
    begin
      TamWrite:=  ( 28 - Length(WriteSender));
      for i:=1 to TamWrite do
        SepTg:= SepTg + PipSpace;
    end;

    if ColW = 'T' then
    begin
      TamWrite:=  (13 - Length(WriteSender));
      for i:=1 to TamWrite do
        SepTg:= SepTg + PipSpace;
    end;

    if ColW = 'G' then
    begin
      TamWrite:=  (Length(WriteSender));
      for i:=1 to TamWrite do
        SepTg:= SepTg + PipSpace;
    end;
  end
  else
    for i:=1 to 168 do
    SepTg:= SepTg + PipDot;

    Result:= SepTg;

end;

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
      if Owner.Components[i] is TRadioGroup then TRadioGroup(Owner.Components[i]).ItemIndex:=0;
    end;
    FrmPrincipal.EdtPercentPerson.Text:='0';
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message );
  end;
end;

end.

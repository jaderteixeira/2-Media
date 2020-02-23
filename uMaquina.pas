unit uMaquina;

interface

uses
  uIMaquina, Classes;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

function TMaquina.MontarTroco(aTroco: Double): TList;
var numeroCedula: array [0..11] of Integer;
    I: Integer;
begin
I := 0;
while (aTroco <> 0) do
  begin
  numeroCedula[I] := trunc(aTroco/CValorCedula[I]);
  aTroco := FloatToCurr(aTroco - CValorCedula[I] * numeroCedula[I]);
  Inc(I);
  end;

for I := 0 to 11 do
  begin
  Memo1.Lines.Add(FloatToStr(CValorCedula[I])+' - '+IntToStr(numeroCedula[I]));
  end;
end;

end.


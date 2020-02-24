unit uMaquina;

interface

uses
  uIMaquina, Classes, SysUtils, uTroco;

type
  TMaquina = class(TInterfacedObject, IMaquina)
  private
    FTroco : TList;
  public
    constructor Create;
    function MontarTroco(aTroco: Double): TList;
  end;

const
  Valor: array [0..11] of Double = (100, 50, 20, 10, 5, 2, 1, 0.5, 0.25, 0.1, 0.05, 0.01);

implementation

constructor TMaquina.Create;
begin
  inherited Create;
  FTroco := TList.Create;
end;

function TMaquina.MontarTroco(aTroco: Double): TList;
var numeroCedula: Integer;
    I: Integer;
begin
I := 0;
while (aTroco <> 0) do
  begin
  numeroCedula := trunc(aTroco/Valor[I]);
  if (numeroCedula > 0) then
    begin
    aTroco := FloatToCurr(aTroco - (Valor[I] * numeroCedula));
    FTroco.Add(TTroco.Create(TCedula(I),numeroCedula));
    end;
  Inc(I);
  end;
Result := FTroco;
end;

end.


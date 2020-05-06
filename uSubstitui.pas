unit uSubstitui;

interface
uses
  uISubstitui, Windows, SysUtils, Classes, Forms;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
    function Substituir(aStr, aVelho, aNovo: String): String;

  end;

implementation

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
var
  resultado,texto,texto2,texto3 : String;
  //frase : TStringList;
  i,qtdCaracter,posicao1,posicao2 : Integer;
  contaPassada : Integer; //Conta a quantidade que passou no for
  restanteDaFrase : String; //Armazena o restante da frase após a posição que trocou
  contador, contador2 : Integer;
  qtdNovo : Integer; //Quantidade de caracteres da string nova
  cont : Integer;
  finalFrase : Boolean; //Indica se chegou no fim da frase

begin
    //frase := TStringList.Create;
    //frase.Clear;
    //frase.Add(aStr);
    texto := aStr;
    qtdCaracter := Length(texto);
    qtdNovo := Length(aNovo);

    //resultado := StringReplace(frase.Text,aVelho,aNovo,[rfReplaceAll,rfIgnoreCase]);
    //Result := resultado;

    cont := qtdCaracter+qtdNovo;

    For i := 0 to cont do
    begin
      if (texto[i] = aVelho[1]) and (texto[i+1] = aVelho[2]) then
      begin
          posicao1 := i;
          contaPassada := i;
          posicao2 := i+1;

          //Pega o restante da frase
          For contador := posicao2 to (qtdCaracter+qtdNovo) do
          begin
              restanteDaFrase := restanteDaFrase + texto[contador+1];
          end;

          //Insere a String aNovo na posição
          contaPassada := 0;
          finalFrase := False;
          For contador := posicao1 to (posicao1+qtdNovo) -1 do
          begin
              if (texto[posicao1+contaPassada] <> '') and (contador <> (posicao1+qtdNovo))then
              begin
                  texto[posicao1+contaPassada] := aNovo[contaPassada+1];
              end else
              begin
                  texto := texto + aNovo[contaPassada+1];
              end;
              contaPassada := contaPassada+1;
          end;

          if (restanteDaFrase = '') then
          begin
              finalFrase := True;
          end;

          //Limpa a frase da posição atual para frente
          texto3 := texto;
          For contador2 := (posicao2+1) to (qtdCaracter) do
          begin
              texto3[contador2+(qtdNovo-2)] := ' ';
          end;

          texto2 := TrimRight(texto3) + TrimRight(restanteDaFrase);

          //Se estiver no final da frase não adiciona o restante
          if not finalFrase then
          begin
              texto := texto2;
          end;

          resultado := texto;
          contaPassada := 0;
          restanteDaFrase := '';

          Result := resultado;
          end;
      end;
    end;

end.



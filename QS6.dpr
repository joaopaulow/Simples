program QS6;


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,


  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas';

var
substitui : uSubstitui.TSubstitui;
resultado : String;

{$R *.RES}

begin

substitui := uSubstitui.TSubstitui.Create;


//String aVelho deve conter no maximo 2 caracteres e String aNovo deve conter no maximo 5 caracteres
resultado := substitui.Substituir('O rato roeu a roupa do rei de roma', 'ro','teste');

ShowMessage(resultado);

end.


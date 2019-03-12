unit StopWatchWindow;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TStopWatchForm = class(TForm)
    lblMinute: TLabel;
    lblMtoS: TLabel;
    lblStoM: TLabel;
    lblSecond: TLabel;
    lblMilisec: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  swForm : TStopWatchForm;

implementation

{$R *.fmx}

end.

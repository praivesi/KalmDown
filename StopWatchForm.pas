unit StopWatchForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,
  DateUtils, Windows, FMX.Ani;

type
  TswForm = class(TForm)
    lblMinute: TLabel;
    lblMtoS: TLabel;
    lblSecond: TLabel;
    lblMilliSecond: TLabel;
    lblStoM: TLabel;
    procedure StopWatchForm_OnCreate(Sender: TObject);
    procedure ShowRemaining(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  swForm: TswForm;
  deadline: TDateTime;
  timer : TTimer;
  deadMinute : Word;
  hour, min, sec, milli : Word;
  prevMin, prevSec : Word;

implementation

{$R *.fmx}

procedure TswForm.StopWatchForm_OnCreate(Sender: TObject);
var t : cardinal;

begin
   // Initialize
   deadMinute := 5;

   deadline := Now;
   deadline := IncMinute(deadline, deadMinute);

   timer := TTimer.Create(nil);
   timer.Enabled := false;
   timer.Interval := 10;
   timer.OnTimer := swForm.ShowRemaining;
   timer.Enabled := true;
end;

procedure TswForm.ShowRemaining(Sender: TObject);
var distance : TDateTime;

begin
  distance := deadline - Now;

  if(distance < 0) then // When dealine is reached
  begin
    (*
      if previous value is 0 : 00 : 000 then disable timer.
      The reason why looping one more time is that
      if directly disables timer after setting 0 : 00 : 000,
      these values ar not applied to UI components
      coz timer is already disabled before applying.
    *)
    if(swForm.lblMinute.Text.Equals('0') and
        swForm.lblSecond.Text.Equals('00') and
        swForm.lblMilliSecond.Text.Equals('000'))
    then
    begin
      timer.Enabled := false;
    end
    else
    begin
      // set 0 : 00 : 000
      swForm.lblMinute.Text := '0';
      swForm.lblSecond.Text := '00';
      swForm.lblMilliSecond.Text := '000';
    end;
  end
  else // deadline is not yet reached
  begin
    // decode the gap between Now and deadline
    DecodeTime(distance, hour, min, sec, milli);

    // set UI Components' value
    swForm.lblMinute.Text := format('%.1d', [min]);
    swForm.lblSecond.Text := format('%.2d', [sec]);
    swForm.lblMilliSecond.Text := format('%.3d', [milli]);

    // if 1 second decreased then bounces lblSecond
    if prevSec <> sec then
    begin
      TAnimator.AnimateFloat(lblSecond, 'Position.Y', 0, 0);
      TAnimator.AnimateFloat(lblSecond, 'Position.Y', 17, 1,
        TAnimationType.Out, TInterpolationType.Bounce);
    end;

    // if 1 minute decreased then bounces lblMinute
    if prevMin <> min then
    begin
      TAnimator.AnimateFloat(lblMinute, 'Position.Y', -20, 0);
      TAnimator.AnimateFloat(lblMinute, 'Position.Y', 17, 1,
        TAnimationType.Out, TInterpolationType.Bounce);
    end;

    // caching current minute and second
    prevMin := min;
    prevSec := sec;
  end;
end;

end.

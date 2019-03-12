unit StopWatchForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,
  DateUtils, Windows;

type
  TswForm = class(TForm)
    lblMinute: TLabel;
    lblMtoS: TLabel;
    lblSecond: TLabel;
    lblMilliSecond: TLabel;
    lblStoM: TLabel;
    procedure StopWatchForm_OnCreate(Sender: TObject);
    procedure ShowRemaning(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  swForm: TswForm;
  //time: TDateTime;
  deadline: TDateTime;
  timer : TTimer;
  hour, min, sec, milli : Word;

implementation

{$R *.fmx}

procedure TswForm.StopWatchForm_OnCreate(Sender: TObject);
var t : cardinal;

begin
   deadline := Now;
   deadline := IncMinute(deadline, 5);

   timer := TTimer.Create(nil);
   timer.Enabled := false;
   timer.Interval := 10;
   timer.OnTimer := swForm.ShowRemaning;
   timer.Enabled := true;

   {
   time := EncodeDateTime(2019, 1, 1, 1, 5, 0, 0);
   timer := TTimer.Create(nil);
   timer.Enabled := false;
   timer.Interval := 10;
   timer.OnTimer := swForm.OnTimer;
   timer.Enabled := true;
   }
end;

procedure TswForm.ShowRemaning(Sender: TObject);
var distance : TDateTime;

begin
//  TTimeSpan distance := deadline. ;
  distance := deadline - Now;

  if(distance < 0) then timer.Enabled := false;

  DecodeTime(distance, hour, min, sec, milli);

  swForm.lblMinute.Text := IntToStr(min);
  swForm.lblSecond.Text := IntToStr(sec);
  swForm.lblMilliSecond.Text := IntToStr(milli);


  {
  time := IncMilliSecond(time, -10);
  swForm.lblMinute.Text := IntToStr(MinuteOf(time)).Substring(0, 2);
  swForm.lblSecond.Text := IntToStr(SecondOf(time)).Substring(0, 2);
  swForm.lblMiliSecond.Text := IntToStr(MilliSecondOf(time)).Substring(0, 2);
  }
end;

end.

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdDICT, Vcl.Grids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Timer1: TTimer;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    SIRA_NOSU: TLabel;
    SIRA_NO: TLabel;
    StringGrid1: TStringGrid;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
StringGrid1.Cells[0,0]:='Sýra';
StringGrid1.Cells[1,0]:='sýcaklýk';
StringGrid1.Cells[2,0]:='Tarih/Saat';
StringGrid1.Cells[3,0]:='Hangi kat';

StringGrid1.ColWidths[0]:=50;
StringGrid1.ColWidths[1]:=50;
StringGrid1.ColWidths[2]:=150;
StringGrid1.ColWidths[3]:=120;

end;

procedure TForm1.Timer1Timer(Sender: TObject);

var
sicaklik:integer;
begin

if Edit1.Text<>'' then

sicaklik:=Random(StrToInt(Edit1.Text));
Label4.Caption:=IntToStr(sicaklik);
// o anda okunan sýcaklýk deðeri hangi mekana ait bilgisini döndürür.

                 if RadioGroup1.ItemIndex=0 then  RadioGroup1.ItemIndex:=1 else

                 if RadioGroup1.ItemIndex=1 then  RadioGroup1.ItemIndex:=2 else

                 if RadioGroup1.ItemIndex=2 then  RadioGroup1.ItemIndex:=0;

// sýra no labeli için otomatik artan sayý üretelim
SIRA_NO.Caption:=IntToStr(StrToInt(SIRA_NO.Caption)+1);
StringGrid1.RowCount:=StringGrid1.RowCount+1;

    StringGrid1.Cells[0,StrToInt(SIRA_NO.Caption)]:=SIRA_NO.Caption;
    StringGrid1.Cells[1,StrToInt(SIRA_NO.Caption)]:=Label4.Caption;
    StringGrid1.Cells[2,StrToInt(SIRA_NO.Caption)]:=DateTimeToStr(Now);
    if RadioGroup1.ItemIndex=0 then StringGrid1.Cells[3,StrToInt(SIRA_NO.Caption)]:='yukarý kat'  else
    if RadioGroup1.ItemIndex=1 then StringGrid1.Cells[3,StrToInt(SIRA_NO.Caption)]:='orta kat' else
    if RadioGroup1.ItemIndex=2 then StringGrid1.Cells[3,StrToInt(SIRA_NO.Caption)]:='aþaðý kat';

end;

end.

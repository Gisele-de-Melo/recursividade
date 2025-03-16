//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse c�digo foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto n�o me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit untRecursividade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.IOUtils;

type
  TForm1 = class(TForm)
    edtDirectory: TEdit;
    btnListFiles: TButton;
    memoFiles: TMemo;
    lblDirectory: TLabel;
    procedure btnListFilesClick(Sender: TObject);
  private
    procedure ListFilesRecursive(const Dir: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ListFilesRecursive(const Dir: string);
var
  FileItem: string;
  SubDir: string;
begin
  try
    // Tentando acessar os arquivos do diret�rio
    try
      for FileItem in TDirectory.GetFiles(Dir) do
        begin
          memoFiles.Lines.Add(FileItem);
          Application.ProcessMessages;
        end;
    except
      on E: Exception do
        memoFiles.Lines.Add('Erro ao acessar arquivos em: ' + Dir + ' - ' + E.Message);
    end;

    // Tentando acessar os subdiret�rios
    try
      for SubDir in TDirectory.GetDirectories(Dir) do
      begin
        ListFilesRecursive(SubDir);
        Application.ProcessMessages; //Esse c�digo evita que a tela fique travada quando existem muitos arquivos para serem exibidos.
      end;
    except
      on E: Exception do
        memoFiles.Lines.Add('Erro ao acessar diret�rio: ' + Dir + ' - ' + E.Message);
    end;

  except
    on E: Exception do
      memoFiles.Lines.Add('Erro inesperado: ' + E.Message);
  end;
end;

procedure TForm1.btnListFilesClick(Sender: TObject);
var
  Dir: string;
begin
  Dir := edtDirectory.Text;

  if not DirectoryExists(Dir) then
  begin
    ShowMessage('Diret�rio inv�lido. Insira um caminho v�lido.');
    Exit;
  end;

  memoFiles.Clear;
  ListFilesRecursive(Dir);

end;

end.

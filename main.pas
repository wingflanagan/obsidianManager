unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ActnList, JSONPropStorage, EditBtn;

type

  { TFormMain }

  TFormMain = class(TForm)
    btnArchive: TButton;
    btnSelectFiles: TButton;
    cbArchiveByDate: TCheckBox;
    cbArchiveByFileName: TCheckBox;
    cbIncludeAttachmentsByDate: TCheckBox;
    cbIncludeAttachmentsByFilename: TCheckBox;
    cbIncludeLinkedImagesByDate: TCheckBox;
    cbIncludeLinkedImagesByFilename: TCheckBox;
    dtStartDate: TDateEdit;
    dtEndDate: TDateEdit;
    deArchiveFolder: TDirectoryEdit;
    deObsidianVault: TDirectoryEdit;
    fnTxtDateArchiveName: TFileNameEdit;
    grpArchiveByFileNames: TGroupBox;
    grpArchiveByDate: TGroupBox;
    JSONPropStorage: TJSONPropStorage;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    lblArchiveName: TLabel;
    LabelArchiveFolder: TLabel;
    LabelObsidianVault: TLabel;
    ListBox1: TListBox;
    OpenDialog: TOpenDialog;
    pcMain: TPageControl;
    tsOptions: TTabSheet;
    tsArchive: TTabSheet;
    procedure btnSelectFilesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JSONPropStorageRestoringProperties(Sender: TObject);
    procedure JSONPropStorageSavingProperties(Sender: TObject);
    procedure tsOptionsExit(Sender: TObject);
  private

  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.lfm}

{ TFormMain }


procedure TFormMain.FormCreate(Sender: TObject);
begin
  JSONPropStorage.Restore;
end;

procedure TFormMain.btnSelectFilesClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
     ListBox1.Items.Assign(OpenDialog.Files);
end;

procedure TFormMain.JSONPropStorageRestoringProperties(Sender: TObject);
begin
  deObsidianVault.Text := JSONPropStorage.StoredValue['ObsidianVault'];
  deArchiveFolder.Text := JSONPropStorage.StoredValue['ArchiveFolder'];
end;

procedure TFormMain.JSONPropStorageSavingProperties(Sender: TObject);
begin
  JSONPropStorage.StoredValue['ObsidianVault'] := deObsidianVault.Text;
  JSONPropStorage.StoredValue['ArchiveFolder'] := deArchiveFolder.Text;
end;

procedure TFormMain.tsOptionsExit(Sender: TObject);
begin
  JSONPropStorage.Save;
end;

end.

unit MNG0002BView;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseRegister.View, cxGraphics,
   cxLookAndFeels,
   cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinDevExpressDarkStyle,
   dxSkinDevExpressStyle,
   Vcl.StdCtrls, cxButtons, RzLabel, dxGDIPlusClasses, Vcl.ExtCtrls, RzPanel,
   Base.View.interf, Types.Controllers, cxControls, cxContainer, cxEdit,
   cxTextEdit, cxLabel,
   Country.Controller.interf, dxSkinOffice2007Black, dxSkinOffice2007Blue,
   dxSkinOffice2007Green,
   dxSkinOffice2007Silver, System.Actions, Vcl.ActnList, dxSkinDarkRoom,
   dxSkinDarkSide,
   ERGTextEdit;

type
   TFMNG0002BView = class(TFBaseRegisterView, iBaseRegisterView)
      LbUpdatedAt: TcxLabel;
      LbCreatedAt: TcxLabel;
      TxUpdatedAt: TcxTextEdit;
      TxCreatedAt: TcxTextEdit;
      LbName: TcxLabel;
      TxCountryId: TcxTextEdit;
      LbCountryId: TcxLabel;
      TxName: TERGTextEdit;
      procedure FormCreate(Sender: TObject);
      procedure BtConfirmarClick(Sender: TObject);
      procedure TxNamePropertiesChange(Sender: TObject);
   private
      FCountryController: iCountryController;

   public

      class function new: iBaseRegisterView;

      function operation(AValue: TTypeOperation): iBaseRegisterView;
      function selectedRecord(AValue: string): iBaseRegisterView;

      procedure insertRecord;
      procedure updateRecord;
      procedure deleteRecord;
      procedure duplicateRecord;

      procedure save;
      procedure showDataOnScreen;
      procedure disableFields;

      procedure &end;
   end;

var
   FMNG0002BView: TFMNG0002BView;

implementation

{$R *.dfm}

uses Facade.Controller;
{ TFMNG0002BView }

procedure TFMNG0002BView.BtConfirmarClick(Sender: TObject);
begin
   if not(validate) then
      Exit;

   save;

   Close;
end;

procedure TFMNG0002BView.deleteRecord;
begin
   FCountryController.delete.save;
end;

procedure TFMNG0002BView.disableFields;
begin
   TxName.Enabled := not(FOperation in [toShow, toDelete]);

   PnButtonConfirm.Visible := not(FOperation = toShow);
   BtConfirmar.Visible := not(FOperation = toShow);
end;

procedure TFMNG0002BView.duplicateRecord;
begin
   FCountryController.duplicate.name(TxName.Text).save;
end;

procedure TFMNG0002BView.&end;
begin
   showDataOnScreen;
   disableFields;
   showCurrentOperation;

   ShowModal;
end;

procedure TFMNG0002BView.FormCreate(Sender: TObject);
begin
   inherited;
   FCountryController := TFacadeController.new.ModulesFacadeController.
     ManagmentFactoryController.countryController
end;

procedure TFMNG0002BView.insertRecord;
begin
   FCountryController.insert.name(TxName.Text).save;
end;

class function TFMNG0002BView.new: iBaseRegisterView;
begin
   Result := Self.Create(nil);
end;

function TFMNG0002BView.operation(AValue: TTypeOperation): iBaseRegisterView;
begin
   Result := Self;
   FOperation := AValue;
end;

procedure TFMNG0002BView.save;
begin
   case FOperation of
      toInsert:
         insertRecord;

      toUpdate:
         updateRecord;

      toDelete:
         deleteRecord;

      toDuplicate:
         duplicateRecord;
   end;
end;

function TFMNG0002BView.selectedRecord(AValue: string): iBaseRegisterView;
begin
   Result := Self;
   FSelectedRecord := AValue;
end;

procedure TFMNG0002BView.showDataOnScreen;
begin
   if (FOperation in [toInsert]) or (FSelectedRecord = EmptyStr) then
      Exit;

   FCountryController.find(FSelectedRecord);

   TxCountryId.Text := FCountryController.countryId;
   TxName.Text := FCountryController.description;

   TxCreatedAt.Text := FCountryController.createdDate;
   TxUpdatedAt.Text := FCountryController.updatedDate;

   if not(FOperation in [toDelete]) then
      BtConfirmar.Enabled := False;
end;

procedure TFMNG0002BView.TxNamePropertiesChange(Sender: TObject);
begin
   inherited;
   changeDataAnyFields;
end;

procedure TFMNG0002BView.updateRecord;
begin
   FCountryController.update.name(TxName.Text).save;
end;

end.

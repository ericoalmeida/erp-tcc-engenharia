unit ServiceUpdate.Controller;

interface

uses Service.Controller.Interf, Service.Model.Interf,
  TORDSERVICE.Entity.Model,
  System.SysUtils;

type
  TServiceUpdateController = class(TInterfacedObject, iServiceUpdateController)
  private
    FServiceModel: IServiceModel;
    FSelectedRecord: TTORDSERVICE;

    FCompanyId: string;
    FDescription: string;
    FMeasuredUnit: string;
    FPrice: Double;
    FStatus: Integer;
    FUserId: string;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: iServiceUpdateController;

    function serviceModel(AValue: IServiceModel): iServiceUpdateController;
    function selectedRecord(AValue: TTORDSERVICE): iServiceUpdateController;

    function companyId(AValue: string): iServiceUpdateController;
    function description(AValue: string): iServiceUpdateController;
    function measuredUnit(AValue: string): iServiceUpdateController;
    function price(AValue: string): iServiceUpdateController;
    function status(AValue: Integer): iServiceUpdateController;
    function userId(AValue: string): iServiceUpdateController;

    procedure save;
  end;

implementation

{ TServiceUpdateController }

function TServiceUpdateController.serviceModel(AValue: IServiceModel)
  : iServiceUpdateController;
begin
  Result := Self;
  FServiceModel := AValue;
end;

function TServiceUpdateController.companyId(AValue: string): iServiceUpdateController;
begin
 Result := Self;
 FCompanyId := AValue;
end;

function TServiceUpdateController.status(AValue: Integer): iServiceUpdateController;
begin
 Result := Self;
 FStatus := AValue;
end;

function TServiceUpdateController.userId(AValue: string): iServiceUpdateController;
begin
 Result := Self;
 FUserId := AValue;
end;

constructor TServiceUpdateController.Create;
begin

end;

function TServiceUpdateController.description(AValue: string): iServiceUpdateController;
begin
 Result := Self;
 FDescription := AValue;
end;

destructor TServiceUpdateController.Destroy;
begin

  inherited;
end;

function TServiceUpdateController.measuredUnit(AValue: string): iServiceUpdateController;
begin
 Result := Self;
 FMeasuredUnit := AValue;
end;

class function TServiceUpdateController.New: iServiceUpdateController;
begin
  Result := Self.Create;
end;

function TServiceUpdateController.price(AValue: string): iServiceUpdateController;
begin
 Result := Self;
 FPrice := AValue.ToDouble;
end;

procedure TServiceUpdateController.save;
begin
  FServiceModel.DAO.Modify(FSelectedRecord);

  FSelectedRecord.COMPANYID    := FCompanyId;
  FSelectedRecord.DESCRIPTION  := FDescription;
  FSelectedRecord.MEASUREDUNIT := FMeasuredUnit;
  FSelectedRecord.PRICE        := FPrice;
  FSelectedRecord.STATUS       := FStatus;
  FSelectedRecord.UPDATEDAT    := Now;

  FServiceModel.DAO.Update(FSelectedRecord);
end;

function TServiceUpdateController.selectedRecord(AValue: TTORDSERVICE)
  : iServiceUpdateController;
begin
  Result := Self;
  FSelectedRecord := AValue;
end;

end.

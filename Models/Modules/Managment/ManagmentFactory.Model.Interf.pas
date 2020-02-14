unit ManagmentFactory.Model.Interf;

interface

uses Districts.Model.Interf, Country.Model.Interf;

type
  iManagmentFactoryModel = interface
    ['{147732FD-A51B-4706-BF9F-AFC50408A707}']
    function districtModel: iDistrictModel;
    function countryModel: ICountryModel;
  end;

implementation

end.
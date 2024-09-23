@implementation HKRPOxygenSaturationAvailability

+ (HKCountrySet)allowedCountrySet
{
  return (HKCountrySet *)objc_msgSend(MEMORY[0x24BDD3AB0], "localAvailabilityForHKFeatureIdentifierOxygenSaturationRecording");
}

+ (NSSet)allowedCountryCodesISO3166
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)objc_opt_class(), "allowedCountrySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allCountryCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

+ (BOOL)isCountryAllowed:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allowedCountrySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsCountryCode:", v3);

  return v5;
}

- (HKRPOxygenSaturationAvailability)init
{
  _HKRPOxygenSaturationAvailabilityDataSource *v3;
  HKRPOxygenSaturationAvailability *v4;

  v3 = objc_alloc_init(_HKRPOxygenSaturationAvailabilityDataSource);
  v4 = -[HKRPOxygenSaturationAvailability initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (HKRPOxygenSaturationAvailability)initWithDevice:(id)a3
{
  id v4;
  _HKRPOxygenSaturationAvailabilityDataSource *v5;
  HKRPOxygenSaturationAvailability *v6;

  v4 = a3;
  v5 = -[_HKRPOxygenSaturationAvailabilityDataSource initWithDevice:]([_HKRPOxygenSaturationAvailabilityDataSource alloc], "initWithDevice:", v4);

  v6 = -[HKRPOxygenSaturationAvailability initWithDataSource:](self, "initWithDataSource:", v5);
  return v6;
}

- (HKRPOxygenSaturationAvailability)initWithDataSource:(id)a3
{
  id v5;
  HKRPOxygenSaturationAvailability *v6;
  HKRPOxygenSaturationAvailability *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRPOxygenSaturationAvailability;
  v6 = -[HKRPOxygenSaturationAvailability init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (BOOL)isDeviceSupported
{
  if ((-[HKRPOxygenSaturationAvailabilityDataSource skipHardwareCheck](self->_dataSource, "skipHardwareCheck") & 1) != 0)
    return 1;
  else
    return -[HKRPOxygenSaturationAvailabilityDataSource deviceIsSupported](self->_dataSource, "deviceIsSupported");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end

@implementation FMDFMIPUnregisterDeviceInfoAccessoryAdaptor

- (FMDFMIPUnregisterDeviceInfoAccessoryAdaptor)initWithAccessory:(id)a3 unregisterToken:(id)a4
{
  id v6;
  id v7;
  FMDFMIPUnregisterDeviceInfoAccessoryAdaptor *v8;
  FMDFMIPUnregisterDeviceInfoAccessoryAdaptor *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FMDFMIPUnregisterDeviceInfoAccessoryAdaptor;
  v8 = -[FMDFMIPUnregisterDeviceInfoAccessoryAdaptor init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    -[FMDFMIPUnregisterDeviceInfoAccessoryAdaptor setAccessory:](v8, "setAccessory:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "udid"));
    -[FMDFMIPUnregisterDeviceInfo setUdid:](v9, "setUdid:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
    -[FMDFMIPUnregisterDeviceInfo setSerialNumber:](v9, "setSerialNumber:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "productType"));
    -[FMDFMIPUnregisterDeviceInfo setProductType:](v9, "setProductType:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "productVersion"));
    -[FMDFMIPUnregisterDeviceInfo setProductVersion:](v9, "setProductVersion:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buildVersion"));
    -[FMDFMIPUnregisterDeviceInfo setBuildVersion:](v9, "setBuildVersion:", v14);

    -[FMDFMIPUnregisterDeviceInfo setPaired:](v9, "setPaired:", objc_msgSend(v6, "paired"));
    -[FMDFMIPUnregisterDeviceInfo setMigrationConfirmed:](v9, "setMigrationConfirmed:", objc_msgSend(v6, "migrationPossible"));
    -[FMDFMIPUnregisterDeviceInfo setDisableContext:](v9, "setDisableContext:", 7);
    -[FMDFMIPUnregisterDeviceInfo setUnregisterToken:](v9, "setUnregisterToken:", v7);
  }

  return v9;
}

- (FMDCompanionAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end

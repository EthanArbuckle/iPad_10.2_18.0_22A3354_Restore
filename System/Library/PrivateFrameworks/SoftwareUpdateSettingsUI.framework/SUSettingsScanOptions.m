@implementation SUSettingsScanOptions

- (SUSettingsScanOptions)init
{
  SUSettingsScanOptions *v3;
  SUSettingsScanOptions *v4;

  v4 = 0;
  v4 = -[SUSettingsScanOptions initWithScanOptions:](self, "initWithScanOptions:");
  v3 = v4;
  objc_storeStrong((id *)&v4, 0);
  return v3;
}

- (SUSettingsScanOptions)initWithScanOptions:(id)a3
{
  SUSettingsScanOptions *v3;
  id v4;
  id v5;
  SUSettingsScanOptions *v7;
  SUSettingsScanOptions *v8;
  objc_super v9;
  id location[2];
  SUSettingsScanOptions *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)SUSettingsScanOptions;
  v8 = -[SUSettingsScanOptions init](&v9, sel_init);
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    if (!location[0])
    {
      v4 = objc_alloc_init(MEMORY[0x24BEAEC78]);
      v5 = location[0];
      location[0] = v4;

      objc_msgSend(location[0], "setForced:", 1);
      objc_msgSend(location[0], "setIdentifier:", CFSTR("com.apple.Preferences.software_update"));
    }
    -[SUSettingsScanOptions setScanOptions:](v11, "setScanOptions:", location[0]);
  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (SUScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(id)a3
{
  objc_storeStrong((id *)&self->_scanOptions, a3);
}

- (BOOL)allowUnrestrictedCellularDownload
{
  return self->_allowUnrestrictedCellularDownload;
}

- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3
{
  self->_allowUnrestrictedCellularDownload = a3;
}

- (SDDevice)currentSeedingDevice
{
  return (SDDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentSeedingDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)clientIsBuddy
{
  return self->_clientIsBuddy;
}

- (void)setClientIsBuddy:(BOOL)a3
{
  self->_clientIsBuddy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSeedingDevice, 0);
  objc_storeStrong((id *)&self->_scanOptions, 0);
}

@end

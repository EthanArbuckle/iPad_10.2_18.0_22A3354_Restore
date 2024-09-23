@implementation AXPhoenixMitigatorConfiguration

- (AXPhoenixMitigatorConfiguration)init
{
  AXPhoenixMitigatorConfiguration *v3;
  objc_super v4;
  SEL v5;
  AXPhoenixMitigatorConfiguration *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AXPhoenixMitigatorConfiguration;
  v6 = -[AXPhoenixMitigatorConfiguration init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    -[AXPhoenixMitigatorConfiguration _initializeKeys](v6, "_initializeKeys");
    -[AXPhoenixMitigatorConfiguration _setDefaultConfiguration](v6, "_setDefaultConfiguration");
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (AXPhoenixMitigatorConfiguration)initWithDictionary:(id)a3 missingKeys:(id)a4
{
  AXPhoenixMitigatorConfiguration *v4;
  AXPhoenixMitigatorConfiguration *v6;
  objc_super v8;
  id v9;
  id location[2];
  AXPhoenixMitigatorConfiguration *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AXPhoenixMitigatorConfiguration;
  v11 = -[AXPhoenixMitigatorConfiguration init](&v8, sel_init);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    -[AXPhoenixMitigatorConfiguration _initializeKeys](v11, "_initializeKeys");
    -[AXPhoenixMitigatorConfiguration _parseFromDictionary:missingKeys:](v11, "_parseFromDictionary:missingKeys:", location[0], v9);
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (void)_initializeKeys
{
  -[AXPhoenixMitigatorConfiguration setDisableWhenDisplayOffConfigurationKey:](self, "setDisableWhenDisplayOffConfigurationKey:", CFSTR("disableWhenDisplayOff"));
  -[AXPhoenixMitigatorConfiguration setDisableWhenDeviceLockedConfigurationKey:](self, "setDisableWhenDeviceLockedConfigurationKey:", CFSTR("disableWhenDeviceLocked"));
}

- (void)_setDefaultConfiguration
{
  -[AXPhoenixMitigatorConfiguration setDisableWhenDisplayOff:](self, "setDisableWhenDisplayOff:", 1);
  -[AXPhoenixMitigatorConfiguration setDisableWhenDeviceLocked:](self, "setDisableWhenDeviceLocked:", 0);
}

- (void)_parseFromDictionary:(id)a3 missingKeys:(id)a4
{
  id v4;
  NSString *v5;
  id v6;
  AXPhoenixMitigatorConfiguration *v7;
  id v8;
  NSString *v9;
  id v10;
  NSString *v11;
  id v12;
  id v13;
  NSString *v14;
  id v15;
  AXPhoenixMitigatorConfiguration *v16;
  id v17;
  NSString *v18;
  id v20;
  NSString *v21;
  id v22;
  id v23;
  id location[2];
  AXPhoenixMitigatorConfiguration *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v20 = location[0];
  v21 = -[AXPhoenixMitigatorConfiguration disableWhenDisplayOffConfigurationKey](v25, "disableWhenDisplayOffConfigurationKey");
  v22 = (id)objc_msgSend(v20, "objectForKey:");

  if (v22)
  {
    v16 = v25;
    v15 = location[0];
    v18 = -[AXPhoenixMitigatorConfiguration disableWhenDisplayOffConfigurationKey](v25, "disableWhenDisplayOffConfigurationKey");
    v17 = (id)objc_msgSend(v15, "objectForKey:");
    -[AXPhoenixMitigatorConfiguration setDisableWhenDisplayOff:](v16, "setDisableWhenDisplayOff:", objc_msgSend(v17, "BOOLValue") & 1);

  }
  else
  {
    v13 = v23;
    v14 = -[AXPhoenixMitigatorConfiguration disableWhenDisplayOffConfigurationKey](v25, "disableWhenDisplayOffConfigurationKey");
    objc_msgSend(v13, "addObject:");

  }
  v10 = location[0];
  v11 = -[AXPhoenixMitigatorConfiguration disableWhenDeviceLockedConfigurationKey](v25, "disableWhenDeviceLockedConfigurationKey");
  v12 = (id)objc_msgSend(v10, "objectForKey:");

  if (v12)
  {
    v7 = v25;
    v6 = location[0];
    v9 = -[AXPhoenixMitigatorConfiguration disableWhenDeviceLockedConfigurationKey](v25, "disableWhenDeviceLockedConfigurationKey");
    v8 = (id)objc_msgSend(v6, "objectForKey:");
    -[AXPhoenixMitigatorConfiguration setDisableWhenDeviceLocked:](v7, "setDisableWhenDeviceLocked:", objc_msgSend(v8, "BOOLValue") & 1);

  }
  else
  {
    v4 = v23;
    v5 = -[AXPhoenixMitigatorConfiguration disableWhenDeviceLockedConfigurationKey](v25, "disableWhenDeviceLockedConfigurationKey");
    objc_msgSend(v4, "addObject:");

  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (id)toDictionary
{
  id v3;
  id v4;
  NSString *v5;
  id v6;
  NSString *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v7 = -[AXPhoenixMitigatorConfiguration disableWhenDisplayOffConfigurationKey](self, "disableWhenDisplayOffConfigurationKey");
  v9[0] = v7;
  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXPhoenixMitigatorConfiguration disableWhenDisplayOff](self, "disableWhenDisplayOff"));
  v10[0] = v6;
  v5 = -[AXPhoenixMitigatorConfiguration disableWhenDeviceLockedConfigurationKey](self, "disableWhenDeviceLockedConfigurationKey");
  v9[1] = v5;
  v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXPhoenixMitigatorConfiguration disableWhenDeviceLocked](self, "disableWhenDeviceLocked"));
  v10[1] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);

  return v4;
}

- (BOOL)disableWhenDisplayOff
{
  return self->_disableWhenDisplayOff;
}

- (void)setDisableWhenDisplayOff:(BOOL)a3
{
  self->_disableWhenDisplayOff = a3;
}

- (BOOL)disableWhenDeviceLocked
{
  return self->_disableWhenDeviceLocked;
}

- (void)setDisableWhenDeviceLocked:(BOOL)a3
{
  self->_disableWhenDeviceLocked = a3;
}

- (NSString)disableWhenDisplayOffConfigurationKey
{
  return self->_disableWhenDisplayOffConfigurationKey;
}

- (void)setDisableWhenDisplayOffConfigurationKey:(id)a3
{
  objc_storeStrong((id *)&self->_disableWhenDisplayOffConfigurationKey, a3);
}

- (NSString)disableWhenDeviceLockedConfigurationKey
{
  return self->_disableWhenDeviceLockedConfigurationKey;
}

- (void)setDisableWhenDeviceLockedConfigurationKey:(id)a3
{
  objc_storeStrong((id *)&self->_disableWhenDeviceLockedConfigurationKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableWhenDeviceLockedConfigurationKey, 0);
  objc_storeStrong((id *)&self->_disableWhenDisplayOffConfigurationKey, 0);
}

@end

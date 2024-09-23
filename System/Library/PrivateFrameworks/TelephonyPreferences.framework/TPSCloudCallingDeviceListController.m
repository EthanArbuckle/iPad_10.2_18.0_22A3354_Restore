@implementation TPSCloudCallingDeviceListController

- (TPSCloudCallingDeviceListController)init
{
  TPSCloudCallingDeviceListController *v2;
  TPSCloudCallingDeviceController *v3;
  TPSCloudCallingDeviceController *deviceController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSCloudCallingDeviceListController;
  v2 = -[TPSCloudCallingDeviceListController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TPSCloudCallingDeviceController);
    deviceController = v2->_deviceController;
    v2->_deviceController = v3;

    -[TPSCloudCallingDeviceController setDelegate:](v2->_deviceController, "setDelegate:", v2);
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSCloudCallingDeviceListController mainGroupSpecifier](self, "mainGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    -[TPSCloudCallingDeviceListController mainSwitchSpecifier](self, "mainSwitchSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    -[TPSCloudCallingDeviceListController deviceSwitchSpecifiers](self, "deviceSwitchSpecifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      -[TPSCloudCallingDeviceListController devicesGroupSpecifier](self, "devicesGroupSpecifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

      objc_msgSend(v5, "addObjectsFromArray:", v8);
    }

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (PSSpecifier)devicesGroupSpecifier
{
  PSSpecifier *devicesGroupSpecifier;
  void *v4;
  PSSpecifier *v5;
  PSSpecifier *v6;

  devicesGroupSpecifier = self->_devicesGroupSpecifier;
  if (!devicesGroupSpecifier)
  {
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CLOUD_CALLING_DEVICE_LIST_DEVICES_GROUP_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:name:", CFSTR("CLOUD_CALLING_DEVICE_LIST_DEVICES_GROUP_ID"), v4);
    v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v6 = self->_devicesGroupSpecifier;
    self->_devicesGroupSpecifier = v5;

    devicesGroupSpecifier = self->_devicesGroupSpecifier;
  }
  return devicesGroupSpecifier;
}

- (NSArray)deviceSwitchSpecifiers
{
  NSArray *deviceSwitchSpecifiers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  deviceSwitchSpecifiers = self->_deviceSwitchSpecifiers;
  if (!deviceSwitchSpecifiers)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0DBD1B8], "cloudCallingDevices");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v8, "supportsRestrictingSecondaryCalling"))
          {
            v9 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "name");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "tps_modelName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (%@)"), v10, v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel_setDeviceSwitchOn_specifier_, sel_isDeviceSwitchOn_, 0, 6, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "uniqueID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setIdentifier:", v14);

            objc_msgSend(v18, "addObject:", v13);
          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v5);
    }
    v15 = (NSArray *)objc_msgSend(v18, "copy");
    v16 = self->_deviceSwitchSpecifiers;
    self->_deviceSwitchSpecifiers = v15;

    deviceSwitchSpecifiers = self->_deviceSwitchSpecifiers;
  }
  return deviceSwitchSpecifiers;
}

- (PSSpecifier)mainGroupSpecifier
{
  PSSpecifier *mainGroupSpecifier;
  PSSpecifier *v4;
  PSSpecifier *v5;

  mainGroupSpecifier = self->_mainGroupSpecifier;
  if (!mainGroupSpecifier)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("CLOUD_CALLING_DEVICE_LIST_MAIN_GROUP_ID"));
    v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mainGroupSpecifier;
    self->_mainGroupSpecifier = v4;

    mainGroupSpecifier = self->_mainGroupSpecifier;
  }
  return mainGroupSpecifier;
}

- (PSSpecifier)mainSwitchSpecifier
{
  PSSpecifier *mainSwitchSpecifier;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *v7;

  mainSwitchSpecifier = self->_mainSwitchSpecifier;
  if (!mainSwitchSpecifier)
  {
    v4 = (void *)MEMORY[0x1E0D804E8];
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CLOUD_CALLING_DEVICE_LIST_MAIN_SWITCH_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setMainSwitchOn_specifier_, sel_isMainSwitchOn_, 0, 6, 0);
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mainSwitchSpecifier;
    self->_mainSwitchSpecifier = v6;

    -[PSSpecifier setIdentifier:](self->_mainSwitchSpecifier, "setIdentifier:", CFSTR("CLOUD_CALLING_DEVICE_LIST_MAIN_SWITCH_ID"));
    mainSwitchSpecifier = self->_mainSwitchSpecifier;
  }
  return mainSwitchSpecifier;
}

- (id)isDeviceSwitchOn:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
}

- (void)setDeviceSwitchOn:(id)a3 specifier:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = *MEMORY[0x1E0D807D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "propertyForKey:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v11, "setOn:animated:", v9, 1);
  -[TPSCloudCallingDeviceListController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setLoading:", 1);

}

- (id)isMainSwitchOn:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = *MEMORY[0x1E0D807D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "propertyForKey:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v11, "setOn:animated:", v9, 1);
  -[TPSCloudCallingDeviceListController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setLoading:", 1);

}

- (void)cloudCallingDeviceController:(id)a3 didChangeDevices:(id)a4
{
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Cloud calling devices have changed. Reloading specifiers.", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__TPSCloudCallingDeviceListController_cloudCallingDeviceController_didChangeDevices___block_invoke;
  block[3] = &unk_1EA2CD7B8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __85__TPSCloudCallingDeviceListController_cloudCallingDeviceController_didChangeDevices___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDeviceSwitchSpecifiers:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (TPSCloudCallingDeviceController)deviceController
{
  return self->_deviceController;
}

- (void)setDeviceSwitchSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1440);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSwitchSpecifiers, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_mainSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_mainGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_devicesGroupSpecifier, 0);
}

@end

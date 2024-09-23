@implementation TUIDeviceSpecifierProvider

- (TUIDeviceSpecifierProvider)initWithAccountManager:(id)a3 stateManager:(id)a4
{
  id v7;
  id v8;
  TUIDeviceSpecifierProvider *v9;
  TUIDeviceSpecifierProvider *v10;
  uint64_t v11;
  NSMutableArray *devicesWithErrors;
  id v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TUIDeviceSpecifierProvider;
  v9 = -[TUIDeviceSpecifierProvider init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_stateManager, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    devicesWithErrors = v10->_devicesWithErrors;
    v10->_devicesWithErrors = (NSMutableArray *)v11;

    v13 = -[TUIDeviceSpecifierProvider _deviceList](v10, "_deviceList");
  }

  return v10;
}

- (TUIDeviceSpecifierProvider)initWithAccountManager:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_15);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    -[TUIDeviceSpecifierProvider initWithAccountManager:].cold.1((uint64_t)self, v5);

  return 0;
}

void __53__TUIDeviceSpecifierProvider_initWithAccountManager___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

- (NSArray)specifiers
{
  NSArray *specifiers;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIDeviceSpecifierProvider _specifiersForDevicesWithError](self, "_specifiersForDevicesWithError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    v6 = (NSArray *)objc_msgSend(v4, "copy");
    v7 = self->_specifiers;
    self->_specifiers = v6;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)_specifiersForDevicesWithError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  -[TUIDeviceSpecifierProvider _deviceList](self, "_deviceList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUIDeviceSpecifierProvider _specifierForError](self, "_specifierForError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v5;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = (void **)v28;
  }
  else
  {
    objc_msgSend(v3, "devices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
    {
      -[TUIDeviceSpecifierProvider _spinnerSpecifierGroup](self, "_spinnerSpecifierGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v5;
      -[TUIDeviceSpecifierProvider _specifierForSpinner](self, "_specifierForSpinner");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
    if (-[NSMutableArray count](self->_devicesWithErrors, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIDeviceSpecifierProvider _deviceErrorSpecifierGroup](self, "_deviceErrorSpecifierGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = self->_devicesWithErrors;
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            -[TUIDeviceSpecifierProvider _specifierForDevice:](self, "_specifierForDevice:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18), (_QWORD)v21);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v19);

            ++v18;
          }
          while (v16 != v18);
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v16);
      }

      v8 = objc_msgSend(v5, "copy");
      goto LABEL_4;
    }
    -[TUIDeviceSpecifierProvider _spinnerSpecifierGroup](self, "_spinnerSpecifierGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = &v26;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, 1);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v9 = (void *)v8;
LABEL_5:

  return v9;
}

- (void)refreshDeviceList
{
  NSArray *specifiers;

  specifiers = self->_specifiers;
  self->_specifiers = 0;

  -[AADeviceList refreshDeviceList](self->_deviceList, "refreshDeviceList");
}

- (id)_deviceErrorSpecifierGroup
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v2 = -[NSMutableArray count](self->_devicesWithErrors, "count");
  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2 > 1)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TRANSPARENCY_PANE_DEVICES_ERROR_GROUP_HEADER"), &stru_251A5E438, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupSpecifierWithID:name:", CFSTR("TUI_PANE_DEVICE_ERROR_GROUP"), v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("TRANSPARENCY_PANE_DEVICES_ERROR_GROUP_FOOTER");
  }
  else
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TRANSPARENCY_PANE_DEVICE_ERROR_GROUP_HEADER"), &stru_251A5E438, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupSpecifierWithID:name:", CFSTR("TUI_PANE_DEVICE_ERROR_GROUP"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("TRANSPARENCY_PANE_DEVICE_ERROR_GROUP_FOOTER");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_251A5E438, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v12, *MEMORY[0x24BE75A68]);

  return v7;
}

- (id)_spinnerSpecifierGroup
{
  return (id)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SPINNER_GROUP"));
}

- (id)_specifierForSpinner
{
  return (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0);
}

- (id)_specifierForError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TRANSPARENCY_PANE_DEVICE_LOADING_ERROR"), &stru_251A5E438, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, 0, 0, 0, 0, -1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  return v5;
}

- (id)_specifierForDevice:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75D50]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7DE0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75D10]);

  objc_msgSend(v5, "modelDisplayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75D28]);

  v11 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
  -[TUIDeviceSpecifierProvider _iconURLForDevice:](self, "_iconURLForDevice:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v12, *MEMORY[0x24BE75B98]);

  objc_msgSend(v7, "setControllerLoadAction:", sel__deviceSpecifierWasTapped_);
  objc_msgSend(v7, "setUserInfo:", v5);

  objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x24BE75A18]);
  return v7;
}

- (id)_removeDeviceSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_ACCOUNT"), &stru_251A5E438, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteButtonSpecifierWithName:target:action:", v6, self, sel__removeTappedForDevice_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", &unk_251A6D638, *MEMORY[0x24BE75860]);
  return v7;
}

- (void)_deviceSpecifierWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v5, "deviceDetailUri");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:", v8);
      objc_msgSend(v5, "deviceDetailHttpMethod");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHTTPMethod:", v10);

      -[TUIDeviceSpecifierProvider delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "specifierProvider:loadRequest:withIdentifier:specifier:", self, v9, CFSTR("_AAUIRemotePageIdentifierTrustedDevice"), v4);

    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_50_0);
      v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2493EE000, v13, OS_LOG_TYPE_DEBUG, "Unable to load trusted-devices remote UI. We're missing the URL from the device info!", v14, 2u);
      }
    }

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_47_3);
    v12 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2493EE000, v12, OS_LOG_TYPE_DEBUG, "Unable to load trusted-devices remote UI. We're missing the device info!", buf, 2u);
    }
  }

}

void __56__TUIDeviceSpecifierProvider__deviceSpecifierWasTapped___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __56__TUIDeviceSpecifierProvider__deviceSpecifierWasTapped___block_invoke_49()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

- (id)_iconURLForDevice:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "modelSmallPhotoURL3x");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_deviceList
{
  AADeviceList *deviceList;
  NSObject *v4;
  AADeviceList *v5;
  AADeviceList *v6;

  deviceList = self->_deviceList;
  if (!deviceList)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_54);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
      -[TUIDevicesWithIssuesSpecifierProvider _deviceList].cold.1((uint64_t)self, v4);
    v5 = (AADeviceList *)objc_msgSend(objc_alloc(MEMORY[0x24BE04960]), "initWithAccountManager:", self->_accountManager);
    v6 = self->_deviceList;
    self->_deviceList = v5;

    -[AADeviceList setDelegate:](self->_deviceList, "setDelegate:", self);
    deviceList = self->_deviceList;
  }
  return deviceList;
}

void __41__TUIDeviceSpecifierProvider__deviceList__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

- (void)deviceListModified:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  id obj;
  _QWORD block[4];
  id v28;
  _QWORD *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  NSObject *v33;
  _QWORD *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  _BYTE buf[12];
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_56);
  v4 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
    -[TUIDeviceSpecifierProvider deviceListModified:].cold.1(v4, v3, (uint64_t)self);
  -[NSMutableArray removeAllObjects](self->_devicesWithErrors, "removeAllObjects");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_group_create();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy_;
  v40[4] = __Block_byref_object_dispose_;
  v41 = 0;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v37;
    v23 = *MEMORY[0x24BEBA860];
    *(_QWORD *)&v7 = 138543618;
    v22 = v7;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        objc_msgSend(v10, "pushToken", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11
          && (objc_msgSend(v10, "pushToken"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "isEqualToString:", &stru_251A5E438),
              v12,
              v11,
              !v13))
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_60_0);
          v16 = (id)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "pushToken");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v17;
            _os_log_impl(&dword_2493EE000, v16, OS_LOG_TYPE_DEBUG, "checking device %@ for errors", buf, 0xCu);

          }
          v18 = (void *)MEMORY[0x24BDBCE50];
          objc_msgSend(v10, "pushToken");
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v18, "kt_dataWithHexString:", objc_msgSend(v19, "UTF8String"));
          v14 = objc_claimAutoreleasedReturnValue();

          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, self);
          dispatch_group_enter(v5);
          v20 = (void *)MEMORY[0x24BEBA808];
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_63;
          v31[3] = &unk_251A5D830;
          objc_copyWeak(&v35, (id *)buf);
          v31[4] = v10;
          v32 = v24;
          v34 = v40;
          v33 = v5;
          objc_msgSend(v20, "loggableDataForDeviceID:application:completionBlock:", v14, v23, v31);

          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_58_1);
          v14 = (id)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            *(_QWORD *)&buf[4] = self;
            v43 = 2114;
            v44 = v15;
            _os_log_debug_impl(&dword_2493EE000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ device %{public}@ ignored", buf, 0x16u);

          }
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v6);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_75;
  block[3] = &unk_251A5D898;
  objc_copyWeak(&v30, (id *)buf);
  v28 = v24;
  v29 = v40;
  v21 = v24;
  dispatch_group_notify(v5, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(v40, 8);

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_57()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_59()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_66_1);
    v8 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
    {
      v24 = *(void **)(a1 + 32);
      v25 = v8;
      objc_msgSend(v24, "pushToken");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v38 = "-[TUIDeviceSpecifierProvider deviceListModified:]_block_invoke_2";
      v39 = 2114;
      v40 = v26;
      v41 = 2114;
      v42 = v5;
      v43 = 2114;
      v44 = v6;
      v45 = 2114;
      v46 = WeakRetained;
      _os_log_debug_impl(&dword_2493EE000, v25, OS_LOG_TYPE_DEBUG, "%s device %{public}@: loggableData = %{public}@, error = %{public}@ on %{public}@", buf, 0x34u);

      if (!v5)
        goto LABEL_31;
    }
    else if (!v5)
    {
      goto LABEL_31;
    }
    if (objc_msgSend(v5, "result"))
      goto LABEL_31;
    if ((objc_msgSend(v5, "marked") & 1) != 0)
    {
      objc_msgSend(v5, "markExpiryDate");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9
        || (v10 = (void *)v9,
            objc_msgSend(v5, "markExpiryDate"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = +[TUIUtils isDateExpired:](TUIUtils, "isDateExpired:", v11),
            v11,
            v10,
            !v12))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "count"))
          goto LABEL_31;
        objc_msgSend(v5, "markExpiryDate");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_31;
        v21 = (void *)v22;
        objc_msgSend(v5, "markExpiryDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[TUIUtils isDateExpired:](TUIUtils, "isDateExpired:", v23))
        {

        }
        else
        {
          v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          if (v27)
          {
            objc_msgSend(v5, "markExpiryDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "laterDate:", v36);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "markExpiryDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28 != v29)
              goto LABEL_31;
          }
          else
          {

          }
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_73_0);
          v30 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
          if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
          {
            v31 = v30;
            objc_msgSend(v5, "markExpiryDate");
            v32 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "pushToken");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v32;
            v39 = 2114;
            v40 = v33;
            _os_log_impl(&dword_2493EE000, v31, OS_LOG_TYPE_DEBUG, "found new max expiry date (%{public}@) on device %{public}@ ", buf, 0x16u);

          }
          objc_msgSend(v5, "markExpiryDate");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v21 = *(void **)(v35 + 40);
          *(_QWORD *)(v35 + 40) = v34;
        }
        goto LABEL_25;
      }
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_71_0);
      v13 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
      if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
        goto LABEL_23;
      v14 = v13;
      objc_msgSend(v5, "markExpiryDate");
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pushToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v15;
      v39 = 2114;
      v40 = v16;
      _os_log_impl(&dword_2493EE000, v14, OS_LOG_TYPE_DEBUG, "found deleted expired device (%{public}@) to display %{public}@", buf, 0x16u);

    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_68_1);
      v18 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
      if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v21 = *(void **)(v20 + 40);
        if (v21)
        {
          *(_QWORD *)(v20 + 40) = 0;
LABEL_25:

        }
LABEL_31:
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
        goto LABEL_32;
      }
      v19 = *(void **)(a1 + 32);
      v14 = v18;
      objc_msgSend(v19, "pushToken");
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v15;
      _os_log_impl(&dword_2493EE000, v14, OS_LOG_TYPE_DEBUG, "found failed device to display %{public}@", buf, 0xCu);
    }

    goto LABEL_23;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_64_0);
  v17 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[TUIDeviceSpecifierProvider deviceListModified:]_block_invoke";
    _os_log_impl(&dword_2493EE000, v17, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
  }
LABEL_32:

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_65()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_67()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_70()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_72()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_75(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_79_0);
    v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
      __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_75_cold_1((uint64_t)WeakRetained, a1, v3);
    objc_msgSend(WeakRetained, "stateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExpectedResolutionDays:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    objc_msgSend(WeakRetained, "setDevicesWithErrors:", *(_QWORD *)(a1 + 32));
    v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v6 = v5;

    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadSpecifiersForProvider:oldSpecifiers:animated:", WeakRetained, v6, 1);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_77_0);
    v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[TUIDeviceSpecifierProvider deviceListModified:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_2_76()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_78()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)v0;

}

- (TUIDeviceSpecifierProviderDelegate)delegate
{
  return (TUIDeviceSpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)devicesWithErrors
{
  return self->_devicesWithErrors;
}

- (void)setDevicesWithErrors:(id)a3
{
  objc_storeStrong((id *)&self->_devicesWithErrors, a3);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (AADeviceList)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
  objc_storeStrong((id *)&self->_deviceList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceList, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_devicesWithErrors, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithAccountManager:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[TUIDeviceSpecifierProvider initWithAccountManager:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_2493EE000, a2, OS_LOG_TYPE_ERROR, "%s not supported on %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)deviceListModified:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v7 = 136315650;
  v8 = "-[TUIDeviceSpecifierProvider deviceListModified:]";
  v9 = 1024;
  v10 = objc_msgSend(a2, "count");
  v11 = 2114;
  v12 = a3;
  OUTLINED_FUNCTION_1_1(&dword_2493EE000, v5, v6, "%s devices count = %d on %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_6_0();
}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_75_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a2 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 40) + 8) + 40);
  v10 = 138543874;
  v11 = a1;
  v12 = 1024;
  v13 = v7;
  v14 = 2114;
  v15 = v8;
  OUTLINED_FUNCTION_1_1(&dword_2493EE000, v6, v9, "%{public}@ devices with errors count = %d, deleted devices expire date = %{public}@", (uint8_t *)&v10);

  OUTLINED_FUNCTION_6_0();
}

@end

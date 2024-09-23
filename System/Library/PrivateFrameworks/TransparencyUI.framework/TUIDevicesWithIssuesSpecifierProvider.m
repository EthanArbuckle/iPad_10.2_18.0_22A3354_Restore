@implementation TUIDevicesWithIssuesSpecifierProvider

- (TUIDevicesWithIssuesSpecifierProvider)initWithAccountManager:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_0);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    -[TUIDevicesWithIssuesSpecifierProvider initWithAccountManager:].cold.1((uint64_t)self, v5);

  return 0;
}

void __64__TUIDevicesWithIssuesSpecifierProvider_initWithAccountManager___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (TUIDevicesWithIssuesSpecifierProvider)initWithAccountManager:(id)a3 devicesWithIssuesIdentifiers:(id)a4
{
  id v7;
  id v8;
  TUIDevicesWithIssuesSpecifierProvider *v9;
  TUIDevicesWithIssuesSpecifierProvider *v10;
  uint64_t v11;
  NSMutableArray *devicesWithIssues;
  uint64_t v13;
  NSMutableArray *unknownDevices;
  TUIIDMSDeviceSource *v15;
  TUIIDMSDeviceSource *idms;
  id v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TUIDevicesWithIssuesSpecifierProvider;
  v9 = -[TUIDevicesWithIssuesSpecifierProvider init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_devicesWithIssuesIdentifiers, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    devicesWithIssues = v10->_devicesWithIssues;
    v10->_devicesWithIssues = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    unknownDevices = v10->_unknownDevices;
    v10->_unknownDevices = (NSMutableArray *)v13;

    v15 = -[TUIIDMSDeviceSource initWithIdmsDeviceProtocol:]([TUIIDMSDeviceSource alloc], "initWithIdmsDeviceProtocol:", 0);
    idms = v10->_idms;
    v10->_idms = v15;

    v17 = -[TUIDevicesWithIssuesSpecifierProvider _deviceList](v10, "_deviceList");
  }

  return v10;
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIDevicesWithIssuesSpecifierProvider _deviceList](self, "_deviceList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIDevicesWithIssuesSpecifierProvider _specifiersForDeviceList:](self, "_specifiersForDeviceList:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    v7 = (NSArray *)objc_msgSend(v4, "copy");
    v8 = self->_specifiers;
    self->_specifiers = v7;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)_specifiersForDeviceList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_devicesWithIssuesCount = 0;
  objc_msgSend(v4, "loadError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TUIDevicesWithIssuesSpecifierProvider _specifierForError](self, "_specifierForError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v6;
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = (void **)v39;
  }
  else
  {
    objc_msgSend(v4, "devices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      -[TUIDevicesWithIssuesSpecifierProvider _spinnerSpecifierGroup](self, "_spinnerSpecifierGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v6;
      -[TUIDevicesWithIssuesSpecifierProvider _specifierForSpinner](self, "_specifierForSpinner");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    if (-[NSMutableArray count](self->_devicesWithIssues, "count")
      || -[NSMutableArray count](self->_unknownDevices, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v12 = self->_devicesWithIssues;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v12);
            -[TUIDevicesWithIssuesSpecifierProvider _specifierForDevice:](self, "_specifierForDevice:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v16));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v17);

            ++self->_devicesWithIssuesCount;
            ++v16;
          }
          while (v14 != v16);
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v14);
      }

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v18 = self->_unknownDevices;
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v18);
            -[TUIDevicesWithIssuesSpecifierProvider _specifierForUnknownDevice:](self, "_specifierForUnknownDevice:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22), (_QWORD)v27);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v23);

            ++self->_devicesWithIssuesCount;
            ++v22;
          }
          while (v20 != v22);
          v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v20);
      }

      v9 = objc_msgSend(v6, "copy");
      goto LABEL_22;
    }
    -[TUIDevicesWithIssuesSpecifierProvider _spinnerSpecifierGroup](self, "_spinnerSpecifierGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v6;
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = &v37;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, 1);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v24 = (void *)v9;
LABEL_23:

  return v24;
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
  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
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
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75D50]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7DE0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75D10]);

  objc_msgSend(v5, "osVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75D28]);

  v11 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
  -[TUIDevicesWithIssuesSpecifierProvider _iconURLForDevice:](self, "_iconURLForDevice:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", v12, *MEMORY[0x24BE75B98]);
  objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x24BE75A18]);
  return v7;
}

- (id)_specifierForUnknownDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, self, 0, 0, 0, -1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_DEVICE"), &stru_251A5E438, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x24BE75D50]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7DE0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v7, *MEMORY[0x24BE75D10]);

  objc_msgSend(v4, "setProperty:forKey:", &stru_251A5E438, *MEMORY[0x24BE75D28]);
  v8 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
  -[TUIDevicesWithIssuesSpecifierProvider _iconURLForDevice:](self, "_iconURLForDevice:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v9, *MEMORY[0x24BE75B98]);

  objc_msgSend(v4, "setProperty:forKey:", v8, *MEMORY[0x24BE75A18]);
  return v4;
}

- (id)_iconURLForDevice:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "modelSmallPhotoURL3x");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("https://appleid.cdn-apple.com/static/bin/cb2625518626/images/deviceLoading@3x.png");
  }
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateDevicesWithIssuesList:(id)a3
{
  id v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSArray *specifiers;
  NSArray *v35;
  id WeakRetained;
  __int128 v37;
  NSMutableArray *obj;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  TUIDevicesWithIssuesSpecifierProvider *v43;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  TUIDevicesWithIssuesSpecifierProvider *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableArray removeAllObjects](self->_devicesWithIssues, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_unknownDevices, "removeAllObjects");
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = self->_devicesWithIssuesIdentifiers;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v50;
    *(_QWORD *)&v5 = 138543874;
    v37 = v5;
    v40 = v4;
    v43 = self;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v50 != v39)
          objc_enumerationMutation(obj);
        v42 = v6;
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v6), "kt_hexString", v37);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v8 = v4;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v46;
          while (2)
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v46 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v12);
              objc_msgSend(v13, "pushToken");
              v14 = objc_claimAutoreleasedReturnValue();
              if (v14
                && (v15 = (void *)v14,
                    objc_msgSend(v13, "pushToken"),
                    v16 = (void *)objc_claimAutoreleasedReturnValue(),
                    v17 = objc_msgSend(v16, "isEqualToString:", &stru_251A5E438),
                    v16,
                    v15,
                    !v17))
              {
                objc_msgSend(v13, "pushToken");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isEqualToString:", v7);

                if (v22)
                {
                  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1)
                    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_35);
                  v4 = v40;
                  self = v43;
                  v26 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
                  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG))
                  {
                    v28 = v26;
                    objc_msgSend(v13, "pushToken");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "name");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v37;
                    v54 = v43;
                    v55 = 2114;
                    v56 = v29;
                    v57 = 2114;
                    v58 = v30;
                    _os_log_debug_impl(&dword_2493EE000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ device with issue found (%{public}@, %{public}@)", buf, 0x20u);

                  }
                  -[NSMutableArray addObject:](v43->_devicesWithIssues, "addObject:", v13);

                  goto LABEL_36;
                }
              }
              else
              {
                if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1)
                  dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_33);
                v18 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
                if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG))
                {
                  v19 = v18;
                  objc_msgSend(v13, "name");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v54 = v43;
                  v55 = 2114;
                  v56 = v20;
                  _os_log_debug_impl(&dword_2493EE000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ device %{public}@ ignored", buf, 0x16u);

                }
              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
            if (v10)
              continue;
            break;
          }
        }

        self = v43;
        -[TUIDevicesWithIssuesSpecifierProvider idms](v43, "idms");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "mapDeviceWithMissing:aaDevices:", v7, v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1)
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_37);
          v25 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
          v4 = v40;
          if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG))
          {
            v31 = v25;
            objc_msgSend(v24, "pushToken");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v37;
            v54 = v43;
            v55 = 2114;
            v56 = v32;
            v57 = 2114;
            v58 = v33;
            _os_log_debug_impl(&dword_2493EE000, v31, OS_LOG_TYPE_DEBUG, "%{public}@ device with issues found via fallback (%{public}@, %{public}@)", buf, 0x20u);

          }
          -[NSMutableArray addObject:](v43->_devicesWithIssues, "addObject:", v24);

        }
        else
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1)
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_39);
          v27 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
          v4 = v40;
          if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v54 = v43;
            v55 = 2114;
            v56 = v7;
            _os_log_error_impl(&dword_2493EE000, v27, OS_LOG_TYPE_ERROR, "%{public}@ device with issue not found => adding unknown device (%{public}@)", buf, 0x16u);
          }
          -[NSMutableArray addObject:](v43->_unknownDevices, "addObject:", v7);
        }
LABEL_36:

        v6 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v41);
  }

  if (-[NSMutableArray count](self->_unknownDevices, "count"))
  {
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_40;
    v44[3] = &unk_251A5ACC8;
    v44[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v44);
  }
  specifiers = self->_specifiers;
  self->_specifiers = 0;
  v35 = specifiers;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v35, 1);

}

void __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_34()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_36()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_38()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_40(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_41);
  v6 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(v5, "pushToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544642;
    v13 = v7;
    v14 = 2048;
    v15 = a3;
    v16 = 2114;
    v17 = v9;
    v18 = 2160;
    v19 = 1752392040;
    v20 = 2112;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    _os_log_error_impl(&dword_2493EE000, v8, OS_LOG_TYPE_ERROR, "%{public}@ IdMS device %ld: %{public}@ %{mask.hash}@ %{public}@", (uint8_t *)&v12, 0x3Eu);

  }
}

void __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

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
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_43);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG))
      -[TUIDevicesWithIssuesSpecifierProvider _deviceList].cold.1((uint64_t)self, v4);
    v5 = (AADeviceList *)objc_msgSend(objc_alloc(MEMORY[0x24BE04960]), "initWithAccountManager:", self->_accountManager);
    v6 = self->_deviceList;
    self->_deviceList = v5;

    -[AADeviceList setDelegate:](self->_deviceList, "setDelegate:", self);
    deviceList = self->_deviceList;
  }
  return deviceList;
}

void __52__TUIDevicesWithIssuesSpecifierProvider__deviceList__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (void)deviceListModified:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_45);
  v5 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG))
    -[TUIDevicesWithIssuesSpecifierProvider deviceListModified:].cold.1(v5, v4, (uint64_t)self);
  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__TUIDevicesWithIssuesSpecifierProvider_deviceListModified___block_invoke_46;
  block[3] = &unk_251A5AD50;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__TUIDevicesWithIssuesSpecifierProvider_deviceListModified___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __60__TUIDevicesWithIssuesSpecifierProvider_deviceListModified___block_invoke_46(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateDevicesWithIssuesList:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_47);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIDevicesWithIssuesSpecifierProvider deviceListModified:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __60__TUIDevicesWithIssuesSpecifierProvider_deviceListModified___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)devicesWithIssuesCount
{
  return self->_devicesWithIssuesCount;
}

- (void)setDevicesWithIssuesCount:(unint64_t)a3
{
  self->_devicesWithIssuesCount = a3;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (AADeviceList)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
  objc_storeStrong((id *)&self->_deviceList, a3);
}

- (NSMutableArray)devicesWithIssuesIdentifiers
{
  return self->_devicesWithIssuesIdentifiers;
}

- (void)setDevicesWithIssuesIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, a3);
}

- (NSMutableArray)devicesWithIssues
{
  return self->_devicesWithIssues;
}

- (void)setDevicesWithIssues:(id)a3
{
  objc_storeStrong((id *)&self->_devicesWithIssues, a3);
}

- (NSMutableArray)unknownDevices
{
  return self->_unknownDevices;
}

- (void)setUnknownDevices:(id)a3
{
  objc_storeStrong((id *)&self->_unknownDevices, a3);
}

- (TUIIDMSDeviceSource)idms
{
  return self->_idms;
}

- (void)setIdms:(id)a3
{
  objc_storeStrong((id *)&self->_idms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idms, 0);
  objc_storeStrong((id *)&self->_unknownDevices, 0);
  objc_storeStrong((id *)&self->_devicesWithIssues, 0);
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, 0);
  objc_storeStrong((id *)&self->_deviceList, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
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
  v3 = "-[TUIDevicesWithIssuesSpecifierProvider initWithAccountManager:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_2493EE000, a2, OS_LOG_TYPE_ERROR, "%s not supported on %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)_deviceList
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2493EE000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ getting device list...", (uint8_t *)&v2, 0xCu);
}

- (void)deviceListModified:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = 136315650;
  v7 = "-[TUIDevicesWithIssuesSpecifierProvider deviceListModified:]";
  v8 = 1024;
  v9 = objc_msgSend(a2, "count");
  v10 = 2114;
  v11 = a3;
  _os_log_debug_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEBUG, "%s devices count = %d on %{public}@", (uint8_t *)&v6, 0x1Cu);

}

@end

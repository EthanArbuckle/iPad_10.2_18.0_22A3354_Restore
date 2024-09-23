@implementation ICQRemoteBackupController

+ (id)specifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BACKUPS_TITLE"), &stru_24E400750, CFSTR("BackupInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, 0, 0, 0, objc_opt_class(), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)specifierForAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("ICQUISpecifierKeyAccount"));

  return v5;
}

- (void)setSpecifier:(id)a3
{
  id v5;
  void *v6;
  ACAccount *v7;
  ACAccount *account;
  NSObject *v9;

  v5 = a3;
  objc_storeStrong((id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), a3);
  -[ICQRemoteBackupController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICQUISpecifierKeyAccount"));
  v7 = (ACAccount *)objc_claimAutoreleasedReturnValue();
  account = self->_account;
  self->_account = v7;

  if (!self->_account)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICQRemoteBackupController setSpecifier:].cold.1(v9);

  }
}

- (void)dealloc
{
  ICQRemoteBackupController *v3;
  objc_super v4;

  -[ICQPreferencesRemoteUIDelegate delegate](self->_remoteDelegate, "delegate");
  v3 = (ICQRemoteBackupController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[ICQPreferencesRemoteUIDelegate setDelegate:](self->_remoteDelegate, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteBackupController;
  -[ICQRemoteBackupController dealloc](&v4, sel_dealloc);
}

- (void)loadPropertyValuesFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "objectForKey:", CFSTR("label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController setDeviceName:](self, "setDeviceName:", v4);

  objc_msgSend(v25, "objectForKey:", CFSTR("deviceUdid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController setDeviceIdentifier:](self, "setDeviceIdentifier:", v5);

  objc_msgSend(v25, "objectForKey:", CFSTR("backupTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");
    if (v8)
    {
      if (v8 != -1)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICQLocalBackupController cellValueStyleDateStringForDate:](ICQLocalBackupController, "cellValueStyleDateStringForDate:", v10);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("NEVER");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("INCOMPLETE");
    }
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24E400750, CFSTR("BackupInfo"));
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = (void *)v12;
    -[ICQRemoteBackupController setLastBackupDateString:](self, "setLastBackupDateString:", v12);

  }
  +[ICQLocalBackupController deviceImageURLFromAttributes:](ICQLocalBackupController, "deviceImageURLFromAttributes:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController setDeviceImageURL:](self, "setDeviceImageURL:", v14);

  objc_msgSend(v25, "objectForKey:", CFSTR("backupSize"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "longLongValue");
  CPFSSizeStrings();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController setBackupSizeString:](self, "setBackupSizeString:", v16);

  objc_msgSend(v25, "objectForKey:", CFSTR("deleteURL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQRemoteBackupController setDeletionURL:](self, "setDeletionURL:", v18);

  }
  objc_msgSend(v25, "objectForKey:", CFSTR("isActive"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = objc_msgSend(v19, "BOOLValue");
  else
    v20 = 0;
  -[ICQRemoteBackupController setIsBackupEnabled:](self, "setIsBackupEnabled:", v20);
  -[ICQRemoteBackupController deviceName](self, "deviceName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
    -[ICQRemoteBackupController loadPropertyValuesFromDictionary:].cold.1();

  -[ICQRemoteBackupController backupSizeString](self, "backupSizeString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    -[ICQRemoteBackupController loadPropertyValuesFromDictionary:].cold.2();

  -[ICQRemoteBackupController deletionURL](self, "deletionURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
    -[ICQRemoteBackupController loadPropertyValuesFromDictionary:].cold.3();

  -[ICQRemoteBackupController lastBackupDateString](self, "lastBackupDateString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
    -[ICQRemoteBackupController loadPropertyValuesFromDictionary:].cold.4();

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICQDeviceIdentificationView *v7;
  void *v8;
  void *v9;
  void *v10;
  ICQDeviceIdentificationView *v11;
  ICQDeviceIdentificationView *deviceIdentificationView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICQRemoteBackupController;
  -[ICQRemoteBackupController loadView](&v13, sel_loadView);
  -[ICQRemoteBackupController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController loadPropertyValuesFromDictionary:](self, "loadPropertyValuesFromDictionary:", v4);

  -[ICQRemoteBackupController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("remoteDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController setRemoteDelegate:](self, "setRemoteDelegate:", v6);

  v7 = [ICQDeviceIdentificationView alloc];
  -[ICQRemoteBackupController deviceName](self, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController deviceIdentifier](self, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController deviceImageURL](self, "deviceImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICQDeviceIdentificationView initWithFrame:deviceName:deviceIdentifier:imageURL:isCurrentDevice:](v7, "initWithFrame:deviceName:deviceIdentifier:imageURL:isCurrentDevice:", v8, v9, v10, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  deviceIdentificationView = self->_deviceIdentificationView;
  self->_deviceIdentificationView = v11;

  -[ICQDeviceIdentificationView setLeftExtraMargin:](self->_deviceIdentificationView, "setLeftExtraMargin:", 16.0);
  -[ICQDeviceIdentificationView sizeToFit](self->_deviceIdentificationView, "sizeToFit");
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "setTableHeaderView:", self->_deviceIdentificationView);
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("REMOTE_HEADER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_isBackupEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOTE_DEVICE_INACTIVE"), &stru_24E400750, CFSTR("BackupInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75A68]);

    }
    objc_msgSend(v5, "addObject:", v6);
    v9 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v6;
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LATEST_BACKUP"), &stru_24E400750, CFSTR("BackupInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, sel_lastBackupDateString, 0, 4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v12);
    v13 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("BACKUP_SIZE"), &stru_24E400750, CFSTR("BackupInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, sel_backupSizeString, 0, 4, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v16);
    if (self->_isBackupEnabled)
      v17 = CFSTR("DELETE_BACKUP_AND_TURN_OFF_BACKUP");
    else
      v17 = CFSTR("DELETE_BACKUP");
    v18 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v17, &stru_24E400750, CFSTR("BackupInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deleteButtonSpecifierWithName:target:action:", v20, self, sel_firstDeleteConfirmation_);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQRemoteBackupController deletionURL](self, "deletionURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setProperty:forKey:", v23, *MEMORY[0x24BE75A18]);

    }
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

    objc_msgSend(v5, "addObject:", v21);
    v25 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)firstDeleteConfirmation:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[5];

  if (self->_isBackupEnabled)
    v4 = CFSTR("TURN_OFF_AND_DELETE");
  else
    v4 = CFSTR("DELETE");
  v23 = v4;
  if (self->_isBackupEnabled)
    v5 = CFSTR("TURN_OFF_REMOTE_ACTIVE_PROMPT_TEXT");
  else
    v5 = CFSTR("TURN_OFF_REMOTE_INACTIVE_PROMPT_TEXT");
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_REMOTE_PROMPT_TITLE"), &stru_24E400750, CFSTR("BackupInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController deviceName](self, "deviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v5, &stru_24E400750, CFSTR("BackupInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController deviceName](self, "deviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v23, &stru_24E400750, CFSTR("BackupInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E400750, CFSTR("BackupInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "sheetAlertControllerWithTitle:message:", v22, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __53__ICQRemoteBackupController_firstDeleteConfirmation___block_invoke;
  v24[3] = &unk_24E3F4130;
  v24[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v16, 2, v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v18, 1, &__block_literal_global_27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v20);
  objc_msgSend(v19, "addAction:", v21);
  -[ICQRemoteBackupController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);

}

uint64_t __53__ICQRemoteBackupController_firstDeleteConfirmation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "secondDeleteConfirmation");
}

- (void)secondDeleteConfirmation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SECOND_TURN_OFF_REMOTE_PROMPT_TITLE"), &stru_24E400750, CFSTR("BackupInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SECOND_TURN_OFF_REMOTE_PROMPT_TEXT"), &stru_24E400750, CFSTR("BackupInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SECOND_TURN_OFF_REMOTE_PROMPT_ACTION"), &stru_24E400750, CFSTR("BackupInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E400750, CFSTR("BackupInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "sheetAlertControllerWithTitle:message:", v4, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__ICQRemoteBackupController_secondDeleteConfirmation__block_invoke;
  v14[3] = &unk_24E3F4130;
  v14[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v8, 2, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v10, 1, &__block_literal_global_90);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v12);
  objc_msgSend(v11, "addAction:", v13);
  -[ICQRemoteBackupController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __53__ICQRemoteBackupController_secondDeleteConfirmation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteBackupConfirmed");
}

- (void)startDeletionBezel
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  ICQSpinnerBezel *v24;
  ICQSpinnerBezel *deletionBezel;
  ICQSpinnerBezel *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  -[ICQRemoteBackupController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = (v6 + -156.0) * 0.5;
  v10 = floorf(v9);
  v11 = (v8 + -126.0) * 0.5;
  v12 = floorf(v11);
  -[ICQRemoteBackupController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRemoteBackupController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:toView:", v15, v10, v12, 156.0, 126.0);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = -[ICQSpinnerBezel initWithFrame:]([ICQSpinnerBezel alloc], "initWithFrame:", v17, v19, v21, v23);
  deletionBezel = self->_deletionBezel;
  self->_deletionBezel = v24;

  v26 = self->_deletionBezel;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DELETING"), &stru_24E400750, CFSTR("BackupInfo"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQSpinnerBezel setBezelText:](v26, "setBezelText:", v28);

  -[ICQRemoteBackupController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", self->_deletionBezel);

  -[ICQRemoteBackupController view](self, "view");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUserInteractionEnabled:", 0);

}

- (void)endDeletionBezel
{
  void *v3;
  void *v4;
  ICQSpinnerBezel *deletionBezel;

  -[ICQRemoteBackupController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  -[ICQSpinnerBezel removeFromSuperview](self->_deletionBezel, "removeFromSuperview");
  deletionBezel = self->_deletionBezel;
  self->_deletionBezel = 0;

}

- (void)_backupDeletionFailedWithCode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQRemoteBackupController deletionURL](self, "deletionURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Deletion URL: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 == 423)
    v9 = CFSTR("CANNOT_DELETE_BACKUP_LOCKED");
  else
    v9 = CFSTR("CANNOT_DELETE_BACKUP_DETAILS");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24E400750, CFSTR("BackupInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANNOT_DELETE_BACKUP"), &stru_24E400750, CFSTR("BackupInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v13, v10, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_24E400750, CFSTR("BackupInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __59__ICQRemoteBackupController__backupDeletionFailedWithCode___block_invoke;
  v23[3] = &unk_24E3F4130;
  v23[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v18);

  v19 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E400750, CFSTR("BackupInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v22);

  -[ICQRemoteBackupController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

uint64_t __59__ICQRemoteBackupController__backupDeletionFailedWithCode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteBackupConfirmed");
}

- (void)_backupDeletionSuccess
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Backup deletion completed sucessfully.", v7, 2u);
  }

  -[ICQRemoteBackupController endDeletionBezel](self, "endDeletionBezel");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("BackupInfoDidChange"), 0);

  -[ICQRemoteBackupController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)deleteBackupConfirmed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[ICQRemoteBackupController startDeletionBezel](self, "startDeletionBezel");
  v3 = (void *)MEMORY[0x24BDD16B0];
  -[ICQRemoteBackupController deletionURL](self, "deletionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICQUsageQuotaRequest addHeadersToRequest:forAccount:](ICQQuotaInfoRequest, "addHeadersToRequest:forAccount:", v5, self->_account);
  objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__ICQRemoteBackupController_deleteBackupConfirmed__block_invoke;
  v8[3] = &unk_24E3F3590;
  v8[4] = self;
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v5, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resume");
}

void __50__ICQRemoteBackupController_deleteBackupConfirmed__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ICQRemoteBackupController_deleteBackupConfirmed__block_invoke_2;
  block[3] = &unk_24E3F4098;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __50__ICQRemoteBackupController_deleteBackupConfirmed__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "endDeletionBezel");
    ICQUSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Error deleting remote backup: %@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 40);
    v8 = -1;
    goto LABEL_11;
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "statusCode");
  if (v2 != 200)
  {
    v9 = v2;
    objc_msgSend(*(id *)(a1 + 40), "endDeletionBezel");
    ICQUSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v9;
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Failed to delete backup, status code: %ld", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 40);
    v8 = v9;
LABEL_11:
    objc_msgSend(v7, "_backupDeletionFailedWithCode:", v8);
    return;
  }
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 1440);
  if (v3)
  {
    objc_msgSend(v3, "setDelegate:");
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 1440);
    +[ICQCloudStorageInfo backupInfoHeaders](ICQCloudStorageInfo, "backupInfoHeaders");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "popAndReloadFromRemoteUI:additionalHeaders:", 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_backupDeletionSuccess");
  }
}

- (void)loadStarted:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "loadStarted: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)loadFinished:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "loadFinished: %@", (uint8_t *)&v6, 0xCu);
  }

  -[ICQRemoteBackupController endDeletionBezel](self, "endDeletionBezel");
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;

  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ICQRemoteBackupController loadFailed:withError:].cold.1((uint64_t)v5, v6);

  -[ICQRemoteBackupController endDeletionBezel](self, "endDeletionBezel");
  -[ICQRemoteBackupController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (NSString)backupSizeString
{
  return self->_backupSizeString;
}

- (void)setBackupSizeString:(id)a3
{
  objc_storeStrong((id *)&self->_backupSizeString, a3);
}

- (NSString)lastBackupDateString
{
  return self->_lastBackupDateString;
}

- (void)setLastBackupDateString:(id)a3
{
  objc_storeStrong((id *)&self->_lastBackupDateString, a3);
}

- (NSURL)deletionURL
{
  return self->_deletionURL;
}

- (void)setDeletionURL:(id)a3
{
  objc_storeStrong((id *)&self->_deletionURL, a3);
}

- (NSURL)deviceImageURL
{
  return self->_deviceImageURL;
}

- (void)setDeviceImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImageURL, a3);
}

- (ICQPreferencesRemoteUIDelegate)remoteDelegate
{
  return self->_remoteDelegate;
}

- (void)setRemoteDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDelegate, a3);
}

- (BOOL)isBackupEnabled
{
  return self->_isBackupEnabled;
}

- (void)setIsBackupEnabled:(BOOL)a3
{
  self->_isBackupEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteDelegate, 0);
  objc_storeStrong((id *)&self->_deletionBezel, 0);
  objc_storeStrong((id *)&self->_deviceImageURL, 0);
  objc_storeStrong((id *)&self->_deletionURL, 0);
  objc_storeStrong((id *)&self->_lastBackupDateString, 0);
  objc_storeStrong((id *)&self->_backupSizeString, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentificationView, 0);
}

- (void)setSpecifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "Remote Backup received no account info. Requests may fail.", v1, 2u);
}

- (void)loadPropertyValuesFromDictionary:.cold.1()
{
  __assert_rtn("-[ICQRemoteBackupController loadPropertyValuesFromDictionary:]", "ICQRemoteBackupController.m", 103, "[self deviceName]");
}

- (void)loadPropertyValuesFromDictionary:.cold.2()
{
  __assert_rtn("-[ICQRemoteBackupController loadPropertyValuesFromDictionary:]", "ICQRemoteBackupController.m", 104, "[self backupSizeString]");
}

- (void)loadPropertyValuesFromDictionary:.cold.3()
{
  __assert_rtn("-[ICQRemoteBackupController loadPropertyValuesFromDictionary:]", "ICQRemoteBackupController.m", 105, "[self deletionURL]");
}

- (void)loadPropertyValuesFromDictionary:.cold.4()
{
  __assert_rtn("-[ICQRemoteBackupController loadPropertyValuesFromDictionary:]", "ICQRemoteBackupController.m", 106, "[self lastBackupDateString]");
}

- (void)loadFailed:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "loadFailed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end

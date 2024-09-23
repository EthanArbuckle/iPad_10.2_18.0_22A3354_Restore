@implementation PSGAboutController

- (PSGAboutController)init
{
  PSGAboutController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSGAboutController;
  result = -[PSGAboutController init](&v3, sel_init);
  if (result)
    result->_firstViewDidAppear = 1;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemHealthUIClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParentViewController:", 0);

  v5.receiver = self;
  v5.super_class = (Class)PSGAboutController;
  -[PSGAboutController dealloc](&v5, sel_dealloc);
}

- (void)willUnlock
{
  id v2;

  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadDeviceName");

}

- (id)contextMenuConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  id v20;

  v6 = a4;
  -[PSGAboutController specifierAtIndex:](self, "specifierAtIndex:", -[PSGAboutController indexForIndexPath:](self, "indexForIndexPath:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PSGAboutController_contextMenuConfiguration_handler___block_invoke;
  aBlock[3] = &unk_24F9C84A8;
  v20 = v7;
  v9 = v7;
  v10 = _Block_copy(aBlock);
  v11 = (void *)MEMORY[0x24BEBD4F8];
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __55__PSGAboutController_contextMenuConfiguration_handler___block_invoke_2;
  v16[3] = &unk_24F9C84D0;
  v17 = v10;
  v18 = v6;
  v12 = v6;
  v13 = v10;
  objc_msgSend(v11, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __55__PSGAboutController_contextMenuConfiguration_handler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", *MEMORY[0x24BE75DA0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setString:", v2);

}

id __55__PSGAboutController_contextMenuConfiguration_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
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
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEBD748];
  v3 = (void *)MEMORY[0x24BEBD388];
  PSG_LocalizedStringForGeneral(CFSTR("COPY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("doc.on.doc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v7 = (void *)MEMORY[0x24BEBD388];
  PSG_LocalizedStringForGeneral(CFSTR("BARCODE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("barcode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v9, 0, *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuWithTitle:image:identifier:options:children:", &stru_24F9C95C8, 0, 0, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _QWORD v17[4];
  id v18;
  PSGAboutController *v19;
  _QWORD aBlock[5];

  v6 = a4;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sf_isiPad");

  if (v8)
  {
    -[PSGAboutController specifierAtIndex:](self, "specifierAtIndex:", -[PSGAboutController indexForIndexPath:](self, "indexForIndexPath:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("EID"));

    if (v11)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __80__PSGAboutController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
      aBlock[3] = &unk_24F9C84A8;
      aBlock[4] = self;
      v12 = _Block_copy(aBlock);
      if (!v12)
      {
LABEL_9:
        v13 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(v9, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("ModemIMEI"));

      if (!v15)
        goto LABEL_9;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __80__PSGAboutController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
      v17[3] = &unk_24F9C84F8;
      v18 = v9;
      v19 = self;
      v12 = _Block_copy(v17);

      if (!v12)
        goto LABEL_9;
    }
    -[PSGAboutController contextMenuConfiguration:handler:](self, "contextMenuConfiguration:handler:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    goto LABEL_11;
  }
  v13 = 0;
LABEL_11:

  return v13;
}

void __80__PSGAboutController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileEquipmentInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mobileEquipmentInfo:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
  {
    objc_msgSend(v6, "CSN");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    v12 = v6;
    if (v11)
      goto LABEL_7;
  }
  if (v7
    && (objc_msgSend(v7, "CSN"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "length"),
        v13,
        v12 = v7,
        v14))
  {
LABEL_7:
    objc_msgSend(v12, "CSN");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &stru_24F9C95C8;
  }
  v17 = CFSTR("EidKey");
  v18[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "remoteBarCodeLaunchHelper:", v16);

}

void __80__PSGAboutController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ModemIMEI.2"));

  if (v3)
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscriptionContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mobileEquipmentInfo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "slotID") != v4)
  {
    v11 = objc_msgSend(v6, "count");

    if (v11 < 2)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mobileEquipmentInfo:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }

LABEL_8:
  v14 = CFSTR("ImeiKey");
  if (v3)
    v14 = CFSTR("Imei2Key");
  v17 = v14;
  objc_msgSend(v9, "IMEI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "remoteBarCodeLaunchHelper:", v16);
}

- (void)remoteBarCodeLaunchHelper:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("FlowTypeKey"));

    _PSGLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[PSGAboutController remoteBarCodeLaunchHelper:]";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "%s \nKey:%@", (uint8_t *)&v12, 0x16u);
    }

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0AE8]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SIMSetupUIService"), CFSTR("TSSIMSetupSupportViewController"));
  v9 = objc_alloc_init(MEMORY[0x24BEB0AD0]);
  objc_msgSend(v9, "setUserInfo:", v5);
  v10 = (void *)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v8, v9);
  v11 = objc_alloc_init(MEMORY[0x24BEB0AC8]);
  objc_msgSend(v11, "setReason:", CFSTR("SIM Device Info Flow"));
  objc_msgSend(v10, "activateWithContext:", v11);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSGAboutController;
  v6 = a4;
  -[PSGAboutController tableView:didSelectRowAtIndexPath:](&v14, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = -[PSGAboutController indexForIndexPath:](self, "indexForIndexPath:", v6, v14.receiver, v14.super_class);

  -[PSGAboutController specifierAtIndex:](self, "specifierAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("CARRIER_VERSION"));

  if (v10)
  {
    +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateCarrierSpecifier:", v8);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ProductModel"));

  if (v13)
  {
    +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateProductModelSpecifier:", v8);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSGAboutController;
  -[PSGAboutController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE63740];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__PSGAboutController_viewWillAppear___block_invoke;
  v8[3] = &unk_24F9C7CD8;
  v8[4] = self;
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGAboutController setEffectiveSettingsChangedNotificationObserver:](self, "setEffectiveSettingsChangedNotificationObserver:", v7);

}

void __37__PSGAboutController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v4)
    objc_msgSend(*(id *)(a1 + 32), "updateDeviceNameSpecifierIfNeeded");
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  const void *v5;
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSGAboutController;
  -[PSGAboutController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  if (self->_firstViewDidAppear)
  {
    v4 = _CTServerConnectionCreate();
    if (v4)
    {
      v5 = (const void *)v4;
      _CTServerConnectionGetUpdatedCarrierBundle();
      CFRelease(v5);
    }
    self->_firstViewDidAppear = 0;
  }
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, &__block_literal_global_853);

  -[PSGAboutController updateDeviceNameSpecifierIfNeeded](self, "updateDeviceNameSpecifierIfNeeded");
}

void __36__PSGAboutController_viewDidAppear___block_invoke()
{
  id v0;

  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enableMLUpdates:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSGAboutController;
  -[PSGAboutController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGAboutController effectiveSettingsChangedNotificationObserver](self, "effectiveSettingsChangedNotificationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", v5);

  -[PSGAboutController setEffectiveSettingsChangedNotificationObserver:](self, "setEffectiveSettingsChangedNotificationObserver:", 0);
}

- (void)willBecomeActive
{
  void *v3;
  objc_super v4;

  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableMLUpdates:", 1);

  v4.receiver = self;
  v4.super_class = (Class)PSGAboutController;
  -[PSGAboutController willBecomeActive](&v4, sel_willBecomeActive);
}

- (void)willResignActive
{
  void *v3;
  objc_super v4;

  if ((objc_msgSend((id)*MEMORY[0x24BEBDF78], "isSuspendedUnderLock") & 1) == 0)
  {
    +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enableMLUpdates:", 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)PSGAboutController;
  -[PSGAboutController willResignActive](&v4, sel_willResignActive);
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(&unk_24F9D4620, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(&unk_24F9D4620);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v4, "isEqualToString:", v9))
        {
          -[PSGAboutController specifierForID:](self, "specifierForID:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            v11 = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(&unk_24F9D4620, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSGAboutController;
  -[PSGAboutController viewDidLoad](&v14, sel_viewDidLoad);
  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedNDOController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParentViewController:", self);

  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedNDOController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __33__PSGAboutController_viewDidLoad__block_invoke;
  v13[3] = &unk_24F9C7C88;
  v13[4] = self;
  objc_msgSend(v6, "updateSpecifiersWithCompletionHandler:", v13);

  if (objc_opt_class())
  {
    +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemHealthUIClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setParentViewController:", self);

    +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "systemHealthUIClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __33__PSGAboutController_viewDidLoad__block_invoke_862;
    v12[3] = &unk_24F9C7C88;
    v12[4] = self;
    objc_msgSend(v11, "updateSpecifiersWithCompletionHandler:", v12);

  }
}

void __33__PSGAboutController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__PSGAboutController_viewDidLoad__block_invoke_2;
  block[3] = &unk_24F9C7C88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __33__PSGAboutController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "specifierIDPendingPush");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "specifierIDPendingPush");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "specifierForID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      _PSGLoggingFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v8 = "-[PSGAboutController viewDidLoad]_block_invoke_2";
        _os_log_impl(&dword_22E024000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: handling deferred url after ndo specifiers did load", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "handlePendingURL");
    }
  }
  else
  {

  }
}

void __33__PSGAboutController_viewDidLoad__block_invoke_862(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__PSGAboutController_viewDidLoad__block_invoke_2_863;
  block[3] = &unk_24F9C7C88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __33__PSGAboutController_viewDidLoad__block_invoke_2_863(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "specifierIDPendingPush");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "specifierIDPendingPush");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "specifierForID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      _PSGLoggingFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v8 = "-[PSGAboutController viewDidLoad]_block_invoke_2";
        _os_log_impl(&dword_22E024000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: handling deferred url after p&sh specifiers did load", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "handlePendingURL");
    }
  }
  else
  {

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGAboutController;
  -[PSGAboutController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupMLReloadTimer");

  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableMLUpdates:", 0);

}

- (void)setDeviceName:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeviceName:specifier:", v6, v5);

}

- (id)deviceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateDeviceNameSpecifierIfNeeded
{
  _BOOL4 v3;
  int isDeviceNameEditable;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[PSGAboutController specifierForID:](self, "specifierForID:", CFSTR("NAME_CELL_ID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "detailControllerClass") == 0;
  isDeviceNameEditable = _isDeviceNameEditable();
  if (((v3 ^ isDeviceNameEditable) & 1) == 0)
  {
    if (isDeviceNameEditable)
    {
      v5 = objc_opt_class();
      v6 = 2;
    }
    else
    {
      v5 = 0;
      v6 = 4;
    }
    objc_msgSend(v7, "setDetailControllerClass:", v5);
    objc_msgSend(v7, "setCellType:", v6);
  }
  -[PSGAboutController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("NAME_CELL_ID"), 1);

}

- (void)handleResourceDictionaryWhenAlreadyPresented:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PSGAboutController handleResourceDictionaryWhenAlreadyPresented:]";
    _os_log_impl(&dword_22E024000, v4, OS_LOG_TYPE_DEFAULT, "%s: reloading the page even though we are already at the destination.", (uint8_t *)&v6, 0xCu);
  }

  +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSpecifiers");

  -[PSGAboutController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)effectiveSettingsChangedNotificationObserver
{
  return self->_effectiveSettingsChangedNotificationObserver;
}

- (void)setEffectiveSettingsChangedNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_effectiveSettingsChangedNotificationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_effectiveSettingsChangedNotificationObserver, 0);
}

@end

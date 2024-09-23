@implementation PSUICellularRoamingController

- (PSUICellularRoamingController)init
{
  PSUICellularRoamingController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUICellularRoamingController;
  v2 = -[PSUICellularRoamingController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("cellular_roaming_controller"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_newCarrierNotification, CFSTR("PSNewCarrierNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_cellularPlanChangedNotification_, CFSTR("PSUICellularPlanChanged"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_reloadRoamingStatus, 0x24D507FE8, 0);

  }
  return v2;
}

- (void)dealloc
{
  __CTServerConnection *serverConnection;
  void *v4;
  objc_super v5;

  serverConnection = self->_serverConnection;
  if (serverConnection)
    CFRelease(serverConnection);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PSUICellularRoamingController;
  -[PSUICellularRoamingController dealloc](&v5, sel_dealloc);
}

- (id)dataRoamingSpecifiers
{
  void *v3;
  PSSpecifier *v4;
  PSSpecifier *dataRoamingSpecifier;

  PSDataRoamingSpecifiers(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifierForID:", CFSTR("DATA_ROAMING"));
  v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  dataRoamingSpecifier = self->_dataRoamingSpecifier;
  self->_dataRoamingSpecifier = v4;

  return v3;
}

- (id)cdmaRoamingSpecifiers
{
  void *v3;
  PSSpecifier *v4;
  PSSpecifier *cdmaRoamingSpecifier;

  PSCDMARoamingSpecifiers(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  cdmaRoamingSpecifier = self->_cdmaRoamingSpecifier;
  self->_cdmaRoamingSpecifier = v4;

  return v3;
}

- (id)_voiceRoamingFooterTextWithVoiceRoamingOn:(BOOL)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v5 = CFSTR("VOICE_ROAMING_ON_EXPLANATION");
  }
  else if (PSShouldIncludeMMSFooterNote())
  {
    v5 = CFSTR("VOICE_AND_DATA_ROAMING_OFF_EXPLANATION_MMS");
  }
  else
  {
    v5 = CFSTR("VOICE_AND_DATA_ROAMING_OFF_EXPLANATION");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  PSSpecifier *voiceRoamingSpecifier;
  PSSpecifier *dataRoamingSpecifier;
  PSSpecifier *cdmaRoamingSpecifier;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  PSSpecifier *v20;
  PSSpecifier *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    voiceRoamingSpecifier = self->_voiceRoamingSpecifier;
    self->_voiceRoamingSpecifier = 0;

    dataRoamingSpecifier = self->_dataRoamingSpecifier;
    self->_dataRoamingSpecifier = 0;

    cdmaRoamingSpecifier = self->_cdmaRoamingSpecifier;
    self->_cdmaRoamingSpecifier = 0;

    +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCellularDataEnabled");

    v11 = PSIsVoiceRoamingOptionAvailable();
    v12 = PSIsVoiceRoamingEnabled();
    if (v11)
    {
      -[PSUICellularRoamingController getLogger](self, "getLogger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[PSUICellularRoamingController specifiers]";
        _os_log_debug_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEBUG, "%s voice roaming is available", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setProperty:forKey:", CFSTR("VOICE_ROAMING_GROUP"), *MEMORY[0x24BE75AC0]);
      -[PSUICellularRoamingController _voiceRoamingFooterTextWithVoiceRoamingOn:](self, "_voiceRoamingFooterTextWithVoiceRoamingOn:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setProperty:forKey:", v15, *MEMORY[0x24BE75A68]);

      objc_msgSend(v5, "addObject:", v14);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v10 ^ 1 | v12)
        v18 = CFSTR("VOICE_ROAMING_TOGGLE");
      else
        v18 = CFSTR("VOICE_DATA_ROAMING_TOGGLE");
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_24D5028C8, CFSTR("Cellular"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, sel_setVoiceRoamingEnabled_specifier_, sel_getVoiceRoamingStatus_, 0, 6, 0);
      v20 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      v21 = self->_voiceRoamingSpecifier;
      self->_voiceRoamingSpecifier = v20;

      objc_msgSend(v5, "addObject:", self->_voiceRoamingSpecifier);
    }
    if ((_DWORD)v12)
    {
      -[PSUICellularRoamingController getLogger](self, "getLogger");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[PSUICellularRoamingController specifiers]";
        _os_log_debug_impl(&dword_2161C6000, v22, OS_LOG_TYPE_DEBUG, "%s voice roaming is enabled", buf, 0xCu);
      }

      if (v10)
      {
        -[PSUICellularRoamingController dataRoamingSpecifiers](self, "dataRoamingSpecifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v23);

      }
      if (PSIsCDMARoamingOptionAvailable())
      {
        -[PSUICellularRoamingController cdmaRoamingSpecifiers](self, "cdmaRoamingSpecifiers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v24);

      }
    }
    objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v5, CFSTR("[PSUICellularRoamingController specifiers] end"));
    v25 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)newCarrierNotification
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularRoamingController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[PSUICellularRoamingController newCarrierNotification]";
    v7 = 2112;
    v8 = CFSTR("PSUICellularPlanChanged");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PSUICellularRoamingController_newCarrierNotification__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __55__PSUICellularRoamingController_newCarrierNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)cellularPlanChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularRoamingController getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[PSUICellularRoamingController cellularPlanChangedNotification:]";
    v8 = 2112;
    v9 = CFSTR("PSUICellularPlanChanged");
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__PSUICellularRoamingController_cellularPlanChangedNotification___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __65__PSUICellularRoamingController_cellularPlanChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)reloadRoamingStatus
{
  void *v3;
  int v4;
  int *v5;
  int v6;
  int v7;

  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCellularDataEnabled");
  v5 = (int *)MEMORY[0x24BE756E0];
  if (v4)
  {
    v6 = PSIsVoiceRoamingEnabled();
    v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "containsObject:", self->_dataRoamingSpecifier);

    if (v6 != v7)
    {
      -[PSUICellularRoamingController reloadSpecifiers](self, "reloadSpecifiers");
      return;
    }
  }
  else
  {

  }
  if (self->_voiceRoamingSpecifier
    && objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "containsObject:"))
  {
    -[PSUICellularRoamingController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_voiceRoamingSpecifier, 1);
  }
  if (self->_dataRoamingSpecifier
    && objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "containsObject:"))
  {
    -[PSUICellularRoamingController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_dataRoamingSpecifier, 1);
  }
  if (self->_cdmaRoamingSpecifier)
  {
    if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "containsObject:"))
      -[PSUICellularRoamingController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_cdmaRoamingSpecifier, 1);
  }
}

- (void)setVoiceRoamingEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  PSSpecifier *voiceRoamingSpecifier;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  PSSpecifier *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  const char *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUICellularRoamingController getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    v8 = CFSTR("disabled");
    if (v7)
      v8 = CFSTR("enabled");
    v28 = 136315394;
    v29 = "-[PSUICellularRoamingController setVoiceRoamingEnabled:specifier:]";
    v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s setting voice roaming = %@", (uint8_t *)&v28, 0x16u);
  }

  v9 = objc_msgSend(v5, "BOOLValue");
  if ((_DWORD)v9 == PSIsVoiceRoamingEnabled())
  {
    -[PSUICellularRoamingController getLogger](self, "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v28 = 67109120;
      LODWORD(v29) = v9;
      _os_log_debug_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEBUG, "Voice roaming is already set to: %d", (uint8_t *)&v28, 8u);
    }
  }
  else
  {
    -[PSUICellularRoamingController beginUpdates](self, "beginUpdates");
    PSSetVoiceRoamingEnabled();
    while ((_DWORD)v9 != PSIsVoiceRoamingEnabled())
    {
      -[PSUICellularRoamingController getLogger](self, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "CoreTelephony has not saved the voice roaming state (see 12172800)", (uint8_t *)&v28, 2u);
      }

    }
    -[PSUICellularRoamingController specifierForID:](self, "specifierForID:", CFSTR("VOICE_ROAMING_GROUP"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[PSUICellularRoamingController _voiceRoamingFooterTextWithVoiceRoamingOn:](self, "_voiceRoamingFooterTextWithVoiceRoamingOn:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setProperty:forKey:](v11, "setProperty:forKey:", v12, *MEMORY[0x24BE75A68]);

    -[PSUICellularRoamingController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v11, 1);
    -[PSUICellularRoamingController getLogger](self, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if ((_DWORD)v9)
    {
      if (v14)
      {
        LOWORD(v28) = 0;
        _os_log_debug_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEBUG, "Enabling voice roaming", (uint8_t *)&v28, 2u);
      }

      voiceRoamingSpecifier = self->_voiceRoamingSpecifier;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("VOICE_ROAMING_TOGGLE"), &stru_24D5028C8, CFSTR("Cellular"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](voiceRoamingSpecifier, "setName:", v17);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v19, "isCellularDataEnabled");

      if ((_DWORD)v17)
      {
        -[PSUICellularRoamingController dataRoamingSpecifiers](self, "dataRoamingSpecifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObjectsFromArray:", v20);

      }
      if (PSIsCDMARoamingOptionAvailable())
      {
        -[PSUICellularRoamingController cdmaRoamingSpecifiers](self, "cdmaRoamingSpecifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObjectsFromArray:", v21);

      }
      if (objc_msgSend(v18, "count"))
        -[PSUICellularRoamingController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v18, self->_voiceRoamingSpecifier, 1);
    }
    else
    {
      if (v14)
      {
        LOWORD(v28) = 0;
        _os_log_debug_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEBUG, "Disabling voice roaming", (uint8_t *)&v28, 2u);
      }

      +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isCellularDataEnabled");

      if (v23)
      {
        v24 = self->_voiceRoamingSpecifier;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("VOICE_DATA_ROAMING_TOGGLE"), &stru_24D5028C8, CFSTR("Cellular"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setName:](v24, "setName:", v26);

      }
      v27 = -[PSUICellularRoamingController indexOfSpecifier:](self, "indexOfSpecifier:", self->_voiceRoamingSpecifier)
          + 1;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "subarrayWithRange:", v27, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count")- v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICellularRoamingController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v18, 1);
    }

    -[PSUICellularRoamingController endUpdates](self, "endUpdates");
    -[PSUICellularRoamingController roamingOptionsDidChange](self, "roamingOptionsDidChange");
  }

}

- (id)getVoiceRoamingStatus:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", PSIsVoiceRoamingEnabled());
}

- (id)getDataRoamingStatus:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", PSIsDataRoamingEnabled());
}

- (id)getDataRoamingStatusForService:(id)a3 specifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", PSIsDataRoamingEnabledForService(a3));
}

- (void)setDataRoamingEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUICellularRoamingController getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    v8 = CFSTR("disabled");
    if (v7)
      v8 = CFSTR("enabled");
    v9 = 136315394;
    v10 = "-[PSUICellularRoamingController setDataRoamingEnabled:specifier:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s setting data roaming = %@", (uint8_t *)&v9, 0x16u);
  }

  PSSetDataRoamingEnabled(objc_msgSend(v5, "BOOLValue"));
  -[PSUICellularRoamingController roamingOptionsDidChange](self, "roamingOptionsDidChange");

}

- (void)setCDMARoamingEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUICellularRoamingController getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    v8 = CFSTR("disabled");
    if (v7)
      v8 = CFSTR("enabled");
    v9 = 136315394;
    v10 = "-[PSUICellularRoamingController setCDMARoamingEnabled:specifier:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s setting CDMA roaming = %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "BOOLValue");
  PSSetCDMARoamingEnabled();
  -[PSUICellularRoamingController roamingOptionsDidChange](self, "roamingOptionsDidChange");

}

- (id)getCDMARoamingStatus:(id)a3
{
  void *v4;
  void *v5;
  unint64_t CDMAInternationalRoaming;
  unint64_t v7;
  int v8;
  NSObject *v9;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedPlanItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isBackedByCellularPlan");

  CDMAInternationalRoaming = _CTServerConnectionGetCDMAInternationalRoaming();
  v7 = HIDWORD(CDMAInternationalRoaming);
  if (HIDWORD(CDMAInternationalRoaming))
  {
    v8 = CDMAInternationalRoaming;
    -[PSUICellularRoamingController getLogger](self, "getLogger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v12 = v8;
      v13 = 1024;
      v14 = v7;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "Failed to get CDMAInternationalRoaming setting with error %i:%i", buf, 0xEu);
    }

    return MEMORY[0x24BDBD1C0];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)roamingOptionsDidChange
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75790]);
  WeakRetained = objc_loadWeakRetained(v2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_loadWeakRetained(v2);
    objc_msgSend(v3, "roamingOptionsDidChange");

  }
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularRoamingController"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdmaRoamingSpecifier, 0);
  objc_storeStrong((id *)&self->_dataRoamingSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceRoamingSpecifier, 0);
}

@end

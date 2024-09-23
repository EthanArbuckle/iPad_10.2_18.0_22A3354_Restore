@implementation PSUIDataModeSpecifier

- (PSUIDataModeSpecifier)initWithCTClient:(id)a3 hostController:(id)a4 parentSpecifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  PSUIDataModeSpecifier *v12;
  PSUIDataModeSpecifier *v13;
  uint64_t v14;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  uint64_t v16;
  CTServiceDescriptor *serviceDescriptor;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PSUIDataModeSpecifier;
  v12 = -[PSUIDataModeSpecifier init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PSUIDataModeSpecifier setTarget:](v12, "setTarget:", v12);
    objc_storeStrong((id *)&v13->_ctClient, a3);
    objc_storeWeak((id *)&v13->_hostController, v10);
    objc_msgSend(v11, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v14 = objc_claimAutoreleasedReturnValue();
    subscriptionContext = v13->_subscriptionContext;
    v13->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v14;

    objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v13->_subscriptionContext);
    v16 = objc_claimAutoreleasedReturnValue();
    serviceDescriptor = v13->_serviceDescriptor;
    v13->_serviceDescriptor = (CTServiceDescriptor *)v16;

    if (-[PSUIDataModeSpecifier isHighDataModeSupported](v13, "isHighDataModeSupported"))
    {
      v13->_showDataMode = 2;
      -[PSUIDataModeSpecifier prepareDataModeDrillDown](v13, "prepareDataModeDrillDown");
    }
    else if (-[PSUIDataModeSpecifier isLowDataModeSupported](v13, "isLowDataModeSupported"))
    {
      v13->_showDataMode = 1;
      -[PSUIDataModeSpecifier prepareLowDataModeSwitch](v13, "prepareLowDataModeSwitch");
    }
    else
    {
      v13->_showDataMode = 0;
    }
  }

  return v13;
}

- (void)prepareLowDataModeSwitch
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEBUG, "Low data mode switch will be shown", v6, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOW_DATA_MODE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIDataModeSpecifier setName:](self, "setName:", v5);

  -[PSUIDataModeSpecifier setCellType:](self, "setCellType:", 6);
  -[PSUIDataModeSpecifier setDetailControllerClass:](self, "setDetailControllerClass:", 0);
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75750]) = (Class)sel_isLowDataModeEnabled_;
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75760]) = (Class)sel_setLowDataMode_specifier_;
}

- (void)prepareDataModeDrillDown
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEBUG, "Data mode drill down specifier will be shown", v6, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DATA_MODE"), &stru_24D5028C8, CFSTR("Aries"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIDataModeSpecifier setName:](self, "setName:", v5);

  -[PSUIDataModeSpecifier setCellType:](self, "setCellType:", 2);
  -[PSUIDataModeSpecifier setDetailControllerClass:](self, "setDetailControllerClass:", objc_opt_class());
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75760]) = (Class)sel_setDataMode_specifier_;
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75750]) = (Class)sel_getDataMode_;
  -[PSUIDataModeSpecifier populateDrillDownSpecifiers](self, "populateDrillDownSpecifiers");
  -[PSUIDataModeSpecifier setFooterText](self, "setFooterText");
}

- (void)setFooterText
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("5G_DATA_MODE_FOOTER_WLAN");
  else
    v7 = CFSTR("5G_DATA_MODE_FOOTER_WIFI");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("Aries"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v8;
    _os_log_debug_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEBUG, "Adding Footer Text: %@", (uint8_t *)&v10, 0xCu);
  }

  -[PSUIDataModeSpecifier setProperty:forKey:](self, "setProperty:forKey:", v8, *MEMORY[0x24BE75CD0]);
}

- (void)populateDrillDownSpecifiers
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
  NSObject *v12;
  int v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DATA_MODE_HIGH"), &stru_24D5028C8, CFSTR("Aries"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DATA_MODE_STANDARD"), &stru_24D5028C8, CFSTR("Aries"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DATA_MODE_LOW"), &stru_24D5028C8, CFSTR("Aries"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24D51C6C8);
  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v3;
    _os_log_debug_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEBUG, "Adding Data Modes : %@", (uint8_t *)&v13, 0xCu);
  }

  -[PSUIDataModeSpecifier setValues:titles:shortTitles:](self, "setValues:titles:shortTitles:", v4, v3, v3);
}

- (BOOL)isHighDataModeSupported
{
  CoreTelephonyClient *ctClient;
  CTServiceDescriptor *serviceDescriptor;
  int v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  ctClient = self->_ctClient;
  serviceDescriptor = self->_serviceDescriptor;
  v11 = 0;
  v5 = -[CoreTelephonyClient isHighDataModeSupported:error:](ctClient, "isHighDataModeSupported:error:", serviceDescriptor, &v11);
  v6 = (__CFString *)v11;
  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "Failed to get high data mode support state with error: %@", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("Not supported");
    if (v5)
      v9 = CFSTR("Supported");
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Successfully retrieved high data mode support value : %@", buf, 0xCu);
  }

  return v5;
}

- (BOOL)isLowDataModeSupported
{
  void *v3;

  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isPrivateNetworkSIM:", self->_serviceDescriptor) ^ 1;

  return (char)self;
}

- (id)getDataMode:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  -[PSUIDataModeSpecifier isLowDataModeEnabled:](self, "isLowDataModeEnabled:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[PSUIDataModeSpecifier getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Data mode is: Low", buf, 2u);
    }
    v8 = &unk_24D51C4A0;
  }
  else
  {
    -[PSUIDataModeSpecifier isInterfaceCostExpensive:](self, "isInterfaceCostExpensive:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    -[PSUIDataModeSpecifier getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Data mode is: Normal", v14, 2u);
      }
      v8 = &unk_24D51C488;
    }
    else
    {
      if (v11)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Data mode is: High", v13, 2u);
      }
      v8 = &unk_24D51C470;
    }
  }

  return v8;
}

- (void)setDataMode:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  PSUIDataModeSpecifier *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUIDataModeSpecifier getDataMode:](self, "getDataMode:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToNumber:", v8);
  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[PSUIDataModeSpecifier dataModeFromNumber:](self, "dataModeFromNumber:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v19;
      _os_log_debug_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEBUG, "Data mode is already set to the requested state: %@", (uint8_t *)&v20, 0xCu);

    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[PSUIDataModeSpecifier dataModeFromNumber:](self, "dataModeFromNumber:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDataModeSpecifier dataModeFromNumber:](self, "dataModeFromNumber:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "Changing data mode %@ -> %@", (uint8_t *)&v20, 0x16u);

  }
  v14 = objc_msgSend(v6, "intValue");
  switch(v14)
  {
    case 1:
      v15 = MEMORY[0x24BDBD1C8];
      goto LABEL_12;
    case 2:
      -[PSUIDataModeSpecifier setInterfaceCostExpensive:specifier:](self, "setInterfaceCostExpensive:specifier:", MEMORY[0x24BDBD1C8], v7);
      v17 = MEMORY[0x24BDBD1C0];
      v16 = self;
      goto LABEL_14;
    case 3:
      v15 = MEMORY[0x24BDBD1C0];
LABEL_12:
      -[PSUIDataModeSpecifier setInterfaceCostExpensive:specifier:](self, "setInterfaceCostExpensive:specifier:", v15, v7);
      v16 = self;
      v17 = v15;
LABEL_14:
      -[PSUIDataModeSpecifier setLowDataMode:specifier:](v16, "setLowDataMode:specifier:", v17, v7);
      goto LABEL_18;
  }
  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v20) = 0;
    _os_log_error_impl(&dword_2161C6000, v18, OS_LOG_TYPE_ERROR, "Setting data mode to an unknown value", (uint8_t *)&v20, 2u);
  }

LABEL_18:
}

- (id)isLowDataModeEnabled:(id)a3
{
  CoreTelephonyClient *ctClient;
  CTServiceDescriptor *serviceDescriptor;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ctClient = self->_ctClient;
  serviceDescriptor = self->_serviceDescriptor;
  v13 = 0;
  v6 = -[CoreTelephonyClient lowDataMode:error:](ctClient, "lowDataMode:error:", serviceDescriptor, &v13);
  v7 = v13;
  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "Failed to get low data mode state with error: %@", buf, 0xCu);
    }

    v10 = (void *)MEMORY[0x24BDBD1C0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PSUIDataModeSpecifier lowDataModeFromBool:](self, "lowDataModeFromBool:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "Successfully retrieved low data mode state : %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)setLowDataMode:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "BOOLValue");
  -[CoreTelephonyClient setLowDataMode:enable:](self->_ctClient, "setLowDataMode:enable:", self->_serviceDescriptor, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PSUIDataModeSpecifier lowDataModeFromBool:](self, "lowDataModeFromBool:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "Failed to set low data mode to: %@ with error: %@", (uint8_t *)&v10, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[PSUIDataModeSpecifier lowDataModeFromBool:](self, "lowDataModeFromBool:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Successfully set low data mode to: %@", (uint8_t *)&v10, 0xCu);
    goto LABEL_6;
  }

}

- (id)lowDataModeGroupSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DATA_MODE_FOOTER"), &stru_24D5028C8, CFSTR("Cellular"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v4, *MEMORY[0x24BE75A68]);

  return v2;
}

- (id)isInterfaceCostExpensive:(id)a3
{
  CoreTelephonyClient *ctClient;
  CTServiceDescriptor *serviceDescriptor;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ctClient = self->_ctClient;
  serviceDescriptor = self->_serviceDescriptor;
  v13 = 0;
  v6 = -[CoreTelephonyClient interfaceCostExpensive:error:](ctClient, "interfaceCostExpensive:error:", serviceDescriptor, &v13);
  v7 = v13;
  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "Failed to get interface cost with error: %@", buf, 0xCu);
    }

    v10 = (void *)MEMORY[0x24BDBD1C8];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PSUIDataModeSpecifier interfaceCostFromBool:](self, "interfaceCostFromBool:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "Successfully retrieved interface cost: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)setInterfaceCostExpensive:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "BOOLValue");
  -[PSUIDataModeSpecifier interfaceCostFromBool:](self, "interfaceCostFromBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreTelephonyClient setInterfaceCost:expensive:](self->_ctClient, "setInterfaceCost:expensive:", self->_serviceDescriptor, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "Failed to set interface cost to: %@ with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "Successfully set interface cost to: %@", (uint8_t *)&v10, 0xCu);
  }

}

- (id)dataModeFromNumber:(id)a3
{
  unsigned int v4;
  NSObject *v6;
  uint8_t v7[16];

  v4 = objc_msgSend(a3, "intValue") - 1;
  if (v4 < 3)
    return *(&off_24D502858 + (int)v4);
  -[PSUIDataModeSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_2161C6000, v6, OS_LOG_TYPE_ERROR, "Unknown data mode value", v7, 2u);
  }

  return &stru_24D5028C8;
}

- (id)lowDataModeFromBool:(BOOL)a3
{
  if (a3)
    return CFSTR("ON");
  else
    return CFSTR("OFF");
}

- (id)interfaceCostFromBool:(BOOL)a3
{
  if (a3)
    return CFSTR("Expensive");
  else
    return CFSTR("Inexpensive");
}

- (id)getLogger
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE85668];
  -[CTServiceDescriptor instance](self->_serviceDescriptor, "instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggerWithCategory:instance:", CFSTR("LDM"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)showDataMode
{
  return self->_showDataMode;
}

- (void)setShowDataMode:(unint64_t)a3
{
  self->_showDataMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end

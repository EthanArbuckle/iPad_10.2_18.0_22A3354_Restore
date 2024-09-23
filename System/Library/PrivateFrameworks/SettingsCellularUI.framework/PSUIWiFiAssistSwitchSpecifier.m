@implementation PSUIWiFiAssistSwitchSpecifier

- (id)initDefault
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PSUIWiFiAssistSwitchSpecifier *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PSUIWiFiAssistSwitchSpecifier;
  v7 = -[PSAppDataUsagePolicySwitchSpecifier initWithBundleID:displayName:statisticsCache:](&v9, sel_initWithBundleID_displayName_statisticsCache_, CFSTR("com.apple.datausage.wifiassist"), v5, v6);

  if (v7)
  {
    -[PSAppDataUsagePolicySwitchSpecifier setShouldShowUsage:](v7, "setShouldShowUsage:", 1);
    v7->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  }
  return v7;
}

- (void)dealloc
{
  __CTServerConnection *serverConnection;
  objc_super v4;

  serverConnection = self->_serverConnection;
  if (serverConnection)
    CFRelease(serverConnection);
  v4.receiver = self;
  v4.super_class = (Class)PSUIWiFiAssistSwitchSpecifier;
  -[PSUIWiFiAssistSwitchSpecifier dealloc](&v4, sel_dealloc);
}

+ (BOOL)shouldShowWifiAssist:(id)a3
{
  id v3;
  char v4;
  uint8_t v6[16];

  v3 = a3;
  if (MGGetBoolAnswer())
  {
    v4 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2161C6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RNF not supported", v6, 2u);
      v4 = 0;
    }
  }
  else
  {
    v4 = objc_msgSend(v3, "shouldShowWifiAssistForActiveDataPlan");
  }

  return v4;
}

+ (id)wifiAssistGroupSpecifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v5, *MEMORY[0x24BE75A68]);

  return v2;
}

- (unint64_t)dataUsage
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[PSAppCellularUsageSpecifier billingPeriodSource](self, "billingPeriodSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v4 = objc_msgSend(v2, "selectedPeriod");
  else
    v4 = 0;
  objc_msgSend(v3, "wifiAssistUsageForPeriod:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "cellularHome");
  v7 = objc_msgSend(v5, "cellularRoaming") + v6;

  return v7;
}

- (id)cellularUsagePolicy
{
  unint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_serverConnection)
  {
    -[PSUIWiFiAssistSwitchSpecifier getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v7 = "Failed to get CT connection";
LABEL_10:
    v8 = v6;
    v9 = 2;
    goto LABEL_11;
  }
  v3 = _CTServerConnectionCopyReliableNetworkFallbackSettings();
  v4 = HIDWORD(v3);
  if (!HIDWORD(v3))
  {
    +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "isCellularDataEnabled");

    -[PSUIWiFiAssistSwitchSpecifier getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v7 = "Missing RNF setting!";
    goto LABEL_10;
  }
  v5 = v3;
  -[PSUIWiFiAssistSwitchSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    v13 = v5;
    v14 = 1024;
    v15 = v4;
    v7 = "Failed to fetch RNF setting with error %i:%i";
    v8 = v6;
    v9 = 14;
LABEL_11:
    _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
  }
LABEL_6:

  return MEMORY[0x24BDBD1C0];
}

- (void)setCellularUsagePolicy:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  int v18;
  _DWORD v19[7];

  *(_QWORD *)&v19[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUIWiFiAssistSwitchSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "BOOLValue");
    v7 = "NO";
    if (v6)
      v7 = "YES";
    v18 = 136315138;
    *(_QWORD *)v19 = v7;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Setting policy to %s", (uint8_t *)&v18, 0xCu);
  }

  if (self->_serverConnection)
  {
    objc_msgSend(v4, "BOOLValue");
    v8 = _CTServerConnectionSetReliableNetworkFallbackToCellular();
    v9 = HIDWORD(v8);
    if (!HIDWORD(v8))
      goto LABEL_15;
    v10 = v8;
    -[PSUIWiFiAssistSwitchSpecifier getLogger](self, "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 67109376;
      v19[0] = v10;
      LOWORD(v19[1]) = 1024;
      *(_DWORD *)((char *)&v19[1] + 2) = v9;
      v12 = "Failed to set RNF setting with error %i:%i";
      v13 = v11;
      v14 = 14;
LABEL_17:
      _os_log_error_impl(&dword_2161C6000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v18, v14);
    }
  }
  else
  {
    -[PSUIWiFiAssistSwitchSpecifier getLogger](self, "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      v12 = "Failed to get CT connection";
      v13 = v11;
      v14 = 2;
      goto LABEL_17;
    }
  }

  -[PSAppCellularUsageSpecifier delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[PSAppCellularUsageSpecifier delegate](self, "delegate");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject didFailToSetPolicyForSpecifier:](v17, "didFailToSetPolicyForSpecifier:", self);
  }
  else
  {
    -[PSUIWiFiAssistSwitchSpecifier getLogger](self, "getLogger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_2161C6000, v17, OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", (uint8_t *)&v18, 2u);
    }
  }

LABEL_15:
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("RNF"));
}

@end

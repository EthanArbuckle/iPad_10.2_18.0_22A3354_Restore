@implementation SettingsCellularUtils

+ (id)formattedPhoneNumber:(id)a3
{
  id v3;
  uint64_t v4;
  const void *v5;
  uint64_t String;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = CFPhoneNumberCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    String = CFPhoneNumberCreateString();
    if (String)
    {
      v7 = (void *)String;

      objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("SettingsCellularUtils"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = "+[SettingsCellularUtils formattedPhoneNumber:]";
        v13 = 2112;
        v14 = v3;
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s localized %@ as %@", (uint8_t *)&v11, 0x20u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("SettingsCellularUtils"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315394;
        v12 = "+[SettingsCellularUtils formattedPhoneNumber:]";
        v13 = 2112;
        v14 = v3;
        _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "%s Could not localize %@", (uint8_t *)&v11, 0x16u);
      }
      v7 = v3;
    }

    CFRelease(v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("SettingsCellularUtils"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[SettingsCellularUtils formattedPhoneNumber:]";
      v13 = 2112;
      v14 = v3;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "%s Could not create CFPhoneNumber for %@", (uint8_t *)&v11, 0x16u);
    }

    v7 = v3;
  }

  return v7;
}

+ (BOOL)supportsWiFiCalling:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB4930], "senderIdentityCapabilities");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "senderIdentityUUID", (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          v12 = objc_msgSend(v9, "supportsWiFiCalling");

          if (v12)
          {
            objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("SettingsCellularUtils"));
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v23 = "+[SettingsCellularUtils supportsWiFiCalling:]";
              v24 = 2112;
              v25 = v3;
              _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "%s Subscription Context: %@ supports WiFi Calling", buf, 0x16u);
            }

            v14 = 1;
            v13 = v4;
            goto LABEL_18;
          }
        }
        else
        {

        }
      }
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("SettingsCellularUtils"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "+[SettingsCellularUtils supportsWiFiCalling:]";
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "%s Subscription Context: %@ doesn't support WiFi Calling", buf, 0x16u);
  }
  v14 = 0;
LABEL_18:

  return v14;
}

+ (BOOL)isUIDualSIM
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDualSimCapable");

  if (!v3)
    return 0;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "danglingPlanItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") + v6;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "plansPendingTransfer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (unint64_t)(v9 + objc_msgSend(v11, "count")) > 1;

  return v12;
}

+ (BOOL)isUISingleSIM
{
  return objc_msgSend(a1, "isUIDualSIM") ^ 1;
}

+ (BOOL)shouldShowPendingTransferPlanOnPad
{
  char v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (v2 & 1) == 0)
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isCarrierItemFlowSupported"))
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "plansPendingTransfer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "count") != 0;

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

+ (BOOL)noDataConnectivityAvailable
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;

  +[PSUIDeviceWiFiState sharedInstance](PSUIDeviceWiFiState, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isConnectedOverWiFi") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    +[PSUIDeviceCellularState sharedInstance](PSUIDeviceCellularState, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isConnectedOverCellular") & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isUsingBootstrapDataService") & 1) != 0)
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v6, "isBootstrapRecommended") ^ 1;

      }
    }

  }
  return v3;
}

+ (id)singleSIMUISubscriptionContext
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "isUIDualSIM"))
  {
    objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("SettingsCellularUtils"));
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "+[SettingsCellularUtils singleSIMUISubscriptionContext]";
      _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Invoking %s is meaningful only in case of Single SIM UI", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionsInUse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscriptionContexts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)singleSIMUIServiceDescriptor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDC27B0];
  objc_msgSend(a1, "singleSIMUISubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithSubscriptionContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isCaseInsensitiveEqual:(id)a3 withString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "caseInsensitiveCompare:", v6) == 0;
  }

  return v8;
}

+ (id)removePlanConfirmationTitle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "plan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carrierName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REMOVE_CARRIER_%@_PLAN"), &stru_24D5028C8, CFSTR("Cellular"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REMOVE_PLAN"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)removePlanConfirmationMessage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "plan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carrierName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REMOVE_CARRIER_%@_PLAN_CONFIRMATION"), &stru_24D5028C8, CFSTR("Cellular"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REMOVE_PLAN_CONFIRMATION"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end

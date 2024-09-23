@implementation TRISystemDimensions(Factory)

+ (id)systemDimensions
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v18[15];
  char v19;

  v0 = (void *)objc_opt_new();
  +[TRISystemConfiguration sharedInstance](TRISystemConfiguration, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDeviceClass:", v2);

  objc_msgSend(v1, "trialVersionTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setVersionTag:", v3);

  objc_msgSend(v1, "osBuild");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setOsBuild:", v4);

  v19 = 0;
  v5 = objc_msgSend(v1, "isBetaUserWithIsStale:", &v19);
  if (v19 && +[TRIProcessInfo hostingProcessIsTriald](TRIProcessInfo, "hostingProcessIsTriald"))
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19B89C000, v6, OS_LOG_TYPE_DEFAULT, "SysConfig is stale, leaving population unset", v18, 2u);
    }

  }
  else
  {
    if (objc_msgSend(v1, "isInternalBuild"))
    {
      v7 = v0;
      v8 = 3;
    }
    else
    {
      v7 = v0;
      if (v5)
        v8 = 4;
      else
        v8 = 5;
    }
    objc_msgSend(v7, "setTargetedPopulation:", v8);
  }
  objc_msgSend(v1, "userSettingsBCP47DeviceLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setUserSettingsBcp47DeviceLocale:", v9);

  objc_msgSend(v1, "carrierBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setCarrierBundleIdentifier:", v10);

  objc_msgSend(v1, "carrierCountryIsoCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setCarrierCountryIsoCode:", v11);

  objc_msgSend(v1, "systemInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "logUserKeyboardEnabledInputMode");

  if (v13)
  {
    objc_msgSend(v1, "enabledInputModeIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v0, "setUserKeyboardEnabledInputModeIdentifiers:", v15);

  }
  if ((objc_msgSend(v1, "hasAne") & 1) != 0)
  {
    objc_msgSend(v1, "aneVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setAneVersion:", v16);

  }
  else
  {
    objc_msgSend(v0, "setAneVersion:", CFSTR("none"));
  }
  objc_msgSend(v0, "setIsAutomatedTestDevice:", objc_msgSend(v1, "isAutomatedTestDevice"));

  return v0;
}

@end

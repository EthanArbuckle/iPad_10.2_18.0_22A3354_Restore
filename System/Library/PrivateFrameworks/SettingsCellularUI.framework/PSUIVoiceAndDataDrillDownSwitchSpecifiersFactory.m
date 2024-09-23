@implementation PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory

+ (BOOL)shouldShowVoLTESwitchForSubscriptionContext:(id)a3 RATMode:(int)a4
{
  id v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canSetCapabilityVoLTE:", v5);

  if (a4 > 2)
    v8 = v7;
  else
    v8 = 0;
  v9 = objc_msgSend(v5, "slotID");

  +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "getLoggerForSlot:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "No";
    if (v8)
      v12 = "Yes";
    else
      v12 = "No";
    if (v7)
      v13 = "Yes";
    else
      v13 = "No";
    v15 = 136315650;
    v16 = v12;
    v17 = 2080;
    v18 = v13;
    if (a4 > 2)
      v11 = "Yes";
    v19 = 2080;
    v20 = v11;
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Should show VoLTE switch: %s, can set VoLTE: %s, is RAT mode LTE or above: %s", (uint8_t *)&v15, 0x20u);
  }

  return v8;
}

+ (BOOL)isVoLTESwitchTurnedOnByDefaultAndHidden:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "capabilityEnabledVoLTE:", v3);

  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canSetCapabilityVoLTE:", v3);

  v8 = objc_msgSend(v3, "slotID");
  +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "getLoggerForSlot:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "No";
    if ((v5 & (v7 ^ 1)) != 0)
      v11 = "Yes";
    else
      v11 = "No";
    if (v5)
      v12 = "Yes";
    else
      v12 = "No";
    v14 = 136315650;
    v15 = v11;
    v16 = 2080;
    v17 = v12;
    if (!v7)
      v10 = "Yes";
    v18 = 2080;
    v19 = v10;
    _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "Is VoLTE Switch turned on by default and hidden: %s, is switch on by default: %s, is switch hidden: %s", (uint8_t *)&v14, 0x20u);
  }

  return v5 & (v7 ^ 1);
}

- (id)createVoLTESwitchSpecifierWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v5;
  id v6;
  PSUIVoLTESwitchSpecifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PSUIVoLTESwitchSpecifier initWithHostController:parentSpecifier:]([PSUIVoLTESwitchSpecifier alloc], "initWithHostController:parentSpecifier:", v6, v5);

  return v7;
}

+ (BOOL)shouldShow5GSASwitchForSubscriptionContext:(id)a3 RATMode:(int)a4
{
  id v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[PSUI5GStandaloneCache sharedInstance](PSUI5GStandaloneCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "is5GSASupportedForContext:", v5);

  if (a4 > 3)
    v8 = v7;
  else
    v8 = 0;
  v9 = objc_msgSend(v5, "slotID");

  +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "getLoggerForSlot:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "No";
    if (v8)
      v12 = "Yes";
    else
      v12 = "No";
    if (v7)
      v13 = "Yes";
    else
      v13 = "No";
    v15 = 136315650;
    v16 = v12;
    v17 = 2080;
    v18 = v13;
    if (a4 > 3)
      v11 = "Yes";
    v19 = 2080;
    v20 = v11;
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Should show 5G SA Switch: %s, is 5G SA supported: %s, is RAT mode above LTE: %s", (uint8_t *)&v15, 0x20u);
  }

  return v8;
}

- (id)create5GSASwitchSpecifierWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v5;
  id v6;
  PSUI5GSASwitchSpecifier *v7;
  void *v8;
  PSUI5GSASwitchSpecifier *v9;

  v5 = a4;
  v6 = a3;
  v7 = [PSUI5GSASwitchSpecifier alloc];
  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PSUI5GSASwitchSpecifier initWithHostController:parentSpecifier:carrierBundleCache:](v7, "initWithHostController:parentSpecifier:carrierBundleCache:", v6, v5, v8);

  return v9;
}

+ (BOOL)shouldShowVoNRSwitchForSubscriptionContext:(id)a3 RATMode:(int)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[PSUI5GStandaloneCache sharedInstance](PSUI5GStandaloneCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "is5GSAEnabledForContext:", v5);

  +[PSUI5GStandaloneCache sharedInstance](PSUI5GStandaloneCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "is5GSASupportedForContext:", v5);

  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "is5GSAEnabledByDefault:", v5);

  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "canSetCapabilityVoNR:", v5);

  if (v9)
    v14 = v7;
  else
    v14 = v11;
  if (a4 <= 3)
    v14 = 0;
  if (v13)
    v15 = v14;
  else
    v15 = 0;
  v16 = objc_msgSend(v5, "slotID");

  +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "getLoggerForSlot:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v15)
      v18 = "Yes";
    else
      v18 = "No";
    if (v13)
      v19 = "Yes";
    else
      v19 = "No";
    v24 = 136316162;
    v25 = v18;
    if (a4 <= 3)
      v20 = "No";
    else
      v20 = "Yes";
    v26 = 2080;
    v27 = v19;
    if ((v9 & v7) != 0)
      v21 = "Yes";
    else
      v21 = "No";
    v28 = 2080;
    v29 = v20;
    v30 = 2080;
    v31 = v21;
    if ((v11 & ~v9) != 0)
      v22 = "Yes";
    else
      v22 = "No";
    v32 = 2080;
    v33 = v22;
    _os_log_impl(&dword_2161C6000, v17, OS_LOG_TYPE_DEFAULT, "Should show VoNR switch: %s, can set VoNR: %s, rat mode is above LTE: %s, 5G SA supported and enabled: %s, 5G SA not supported and enabled by default: %s", (uint8_t *)&v24, 0x34u);
  }

  return v15;
}

- (id)createVoNRSwitchSpecifierWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v5;
  id v6;
  PSUIVoNRSwitchSpecifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PSUIVoNRSwitchSpecifier initWithHostController:parentSpecifier:]([PSUIVoNRSwitchSpecifier alloc], "initWithHostController:parentSpecifier:", v6, v5);

  return v7;
}

+ (BOOL)shouldShowAnyVoiceAndDataSwitchSpecifierForContext:(id)a3 RATMode:(int)a4
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "getLoggerForSlot:", objc_msgSend(v5, "slotID"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Should we show any voice and data switch?", (uint8_t *)&v17, 2u);
  }

  v7 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowVoLTESwitchForSubscriptionContext:RATMode:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "shouldShowVoLTESwitchForSubscriptionContext:RATMode:", v5, v4);
  v8 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShow5GSASwitchForSubscriptionContext:RATMode:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "shouldShow5GSASwitchForSubscriptionContext:RATMode:", v5, v4);
  v9 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowVoNRSwitchForSubscriptionContext:RATMode:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "shouldShowVoNRSwitchForSubscriptionContext:RATMode:", v5, v4);
  v10 = objc_msgSend(v5, "slotID");

  +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "getLoggerForSlot:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "not";
    if (v7 || v8 || v9)
      v12 = "";
    if (v7)
      v13 = "Yes";
    else
      v13 = "No";
    v17 = 136315906;
    v18 = v12;
    if (v8)
      v14 = "Yes";
    else
      v14 = "No";
    v19 = 2080;
    v20 = v13;
    v21 = 2080;
    v22 = v14;
    if (v9)
      v15 = "Yes";
    else
      v15 = "No";
    v23 = 2080;
    v24 = v15;
    _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "We should %s show any voice and data switch: VoLTE: %s, 5GSA: %s, VoNR: %s", (uint8_t *)&v17, 0x2Au);
  }

  return v7 || v8 || v9;
}

+ (id)getLoggerForSlot:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  if (a3 == 1)
  {
    v5 = CFSTR("1");
  }
  else
  {
    if (a3 != 2)
      return 0;
    v5 = CFSTR("2");
  }
  objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:instance:", CFSTR("VnDSwitchSpecifierFactory"), v5, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

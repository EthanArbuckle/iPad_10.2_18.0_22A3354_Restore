@implementation TPAlertAction

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TPAlertAction;
  v7 = a5;
  objc_msgSendSuper2(&v10, sel_actionWithTitle_style_handler_, a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHandler:", v7, v10.receiver, v10.super_class);

  return v8;
}

+ (id)actionWithType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  switch(a3)
  {
    case 1uLL:
      TelephonyUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ALERT_ACTION_TITLE_CANCEL"), &stru_1E75FDD38, CFSTR("General"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v4;
      v9 = 1;
      v10 = 0;
      goto LABEL_8;
    case 2uLL:
      TelephonyUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ALERT_ACTION_TITLE_DISABLE_AIRPLANE_MODE"), &stru_1E75FDD38, CFSTR("General"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = &__block_literal_global;
      goto LABEL_7;
    case 3uLL:
      TelephonyUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ALERT_ACTION_TITLE_CELLULAR_SETTINGS"), &stru_1E75FDD38, CFSTR("General"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = &__block_literal_global_15;
LABEL_7:
      v8 = v4;
      v9 = 0;
LABEL_8:
      +[TPAlertAction actionWithTitle:style:handler:](TPAlertAction, "actionWithTitle:style:handler:", v8, v9, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4uLL:
    case 6uLL:
      TelephonyUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      TUStringKeyForNetwork();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1E75FDD38, CFSTR("General"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = &__block_literal_global_28;
      goto LABEL_10;
    case 5uLL:
      TelephonyUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      TUStringKeyForNetwork();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1E75FDD38, CFSTR("General"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = &__block_literal_global_35;
LABEL_10:
      +[TPAlertAction actionWithTitle:style:handler:](TPAlertAction, "actionWithTitle:style:handler:", v5, 0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

void __32__TPAlertAction_actionWithType___block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CFA9B8]);
  objc_msgSend(v0, "setAirplaneMode:", 0);

}

void __32__TPAlertAction_actionWithType___block_invoke_2()
{
  const __CFString *v0;
  void *v1;
  int v2;
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v0 = CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID");
  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isDataSwitchEnabled");
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    TUPreferredFaceTimeBundleIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "nonWifiAvailableForBundleId:", v4);

    v6 = CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID&path=WIRELESS_APP_DATA_USAGE_ID");
    if (v5)
      v6 = CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID");
    if (v2)
      v0 = v6;

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openSensitiveURL:withOptions:", v9, 0);

    v7 = v9;
  }

}

void __32__TPAlertAction_actionWithType___block_invoke_3()
{
  const __CFString *v0;
  void *v1;
  int v2;
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v0 = CFSTR("prefs:root=WIFI");
  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isWiFiEnabled");
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    TUPreferredFaceTimeBundleIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "wifiAllowedForBundleId:", v4);

    v6 = CFSTR("prefs:root=WIFI&path=WIRELESS_APP_DATA_USAGE_ID");
    if (v5)
      v6 = CFSTR("prefs:root=WIFI");
    if (v2)
      v0 = v6;

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openSensitiveURL:withOptions:", v9, 0);

    v7 = v9;
  }

}

void __32__TPAlertAction_actionWithType___block_invoke_4()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Phone&path=com.apple.settings.WiFiCallingSettingsBundle"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

+ (id)preferencesURLForClassName:(id)a3
{
  void *v3;

  v3 = (void *)CUTWeakLinkClass();
  if (v3)
  {
    objc_msgSend(v3, "preferencesURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end

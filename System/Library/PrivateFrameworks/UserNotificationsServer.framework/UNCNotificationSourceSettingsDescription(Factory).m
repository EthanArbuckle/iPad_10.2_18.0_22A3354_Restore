@implementation UNCNotificationSourceSettingsDescription(Factory)

+ (id)notificationSourceSettingsDescriptionFromDictionary:()Factory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingAlerts"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v4, "un_safeBoolValue");

    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingSounds"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v5, "un_safeBoolValue");

    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingBadges"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v6, "un_safeBoolValue");

    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingLockScreen"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v7, "un_safeBoolValue");

    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingNotificationCenter"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "un_safeBoolValue");

    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingCarPlay"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "un_safeBoolValue");

    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingAnnouncement"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "un_safeBoolValue") & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingSpoken"), objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "un_safeBoolValue");

    }
    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingAlwaysShowPreviews"), objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "un_safeBoolValue");

    objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNSettingModalAlertStyle"), objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "un_safeBoolValue");

    objc_msgSend(v3, "objectForKey:", CFSTR("UNSettingProvidesAppNotificationSettings"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "un_safeBoolValue");

    objc_msgSend(v3, "objectForKey:", CFSTR("UNSettingTimeSensitive"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "un_safeBoolValue");

    objc_msgSend(v3, "objectForKey:", CFSTR("UNSettingCriticalAlerts"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "un_safeBoolValue");

    v14 = objc_alloc(MEMORY[0x24BEBF428]);
    objc_msgSend(v14, "setSupportsAlerts:", v30);
    objc_msgSend(v14, "setSupportsSounds:", v29);
    objc_msgSend(v14, "setSupportsBadges:", v28);
    objc_msgSend(v14, "setSupportsLockScreen:", v27);
    objc_msgSend(v14, "setSupportsNotificationCenter:", v9);
    objc_msgSend(v14, "setSupportsCarPlay:", v11);
    objc_msgSend(v14, "setSupportsSpoken:", v13);
    objc_msgSend(v14, "setAlwaysShowPreviews:", v17);
    objc_msgSend(v14, "setModalAlertStyle:", v19);
    objc_msgSend(v14, "setProvidesAppNotificationSettings:", v21);
    objc_msgSend(v14, "setSupportsTimeSensitive:", v23);
    objc_msgSend(v14, "setSupportsCriticalAlerts:", v25);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end

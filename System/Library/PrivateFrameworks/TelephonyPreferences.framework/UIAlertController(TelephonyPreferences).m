@implementation UIAlertController(TelephonyPreferences)

+ (id)tps_alertControllerWithError:()TelephonyPreferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CEA2E0];
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("ALERT_ACTION_TITLE_DISMISS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)tps_tapToRadarAlertControllerWithError:()TelephonyPreferences
{
  id v3;
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
  _QWORD v15[4];
  id v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "tps_telephonyTapToRadarURLForError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CEA2E0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke;
    v15[3] = &unk_1EA2CD808;
    v16 = v4;
    objc_msgSend(v8, "actionWithTitle:style:handler:", CFSTR("Tap-to-Radar"), 0, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v7, v5, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v9);
    v11 = (void *)MEMORY[0x1E0CEA2E0];
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("ALERT_ACTION_TITLE_DISMISS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end

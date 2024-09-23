@implementation PUICalendarPrivacyController

+ (BOOL)isServiceRestricted:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "containsObject:", v3);
  else
    v6 = 0;

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUICalendarPrivacyController;
  -[PUICalendarPrivacyController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUICalendarPrivacyController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("CALENDARS"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/CALENDARS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUICalendarPrivacyController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.privacy"), v7, v11, v12);

}

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  __CFString *v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  _PUILoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v19 = a3;
    v20 = 2112;
    v21 = v8;
    v22 = 1024;
    v23 = a5;
    _os_log_impl(&dword_1DB1FB000, v9, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
  }

  if (setTCCForService_appIdentifier_value__onceToken_0 != -1)
    dispatch_once(&setTCCForService_appIdentifier_value__onceToken_0, &__block_literal_global_10);
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "cStringUsingEncoding:", 4);
  v11 = (void *)tcc_identity_create();
  tcc_service_singleton_for_CF_name();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 2)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke_2;
    v16[3] = &unk_1EA26C320;
    v16[4] = self;
    v13 = (__CFString *)v10;
    v17 = v13;
    v14 = (void *)MEMORY[0x1DF0AB308](v16);
    _PUILoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_1DB1FB000, v15, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to full, after prompt", buf, 0xCu);
    }

    tcc_server_message_prompt_authorization_value();
  }
  else
  {
    tcc_server_message_set_authorization_value();
  }

}

void __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)setTCCForService_appIdentifier_value__tccServer_0;
  setTCCForService_appIdentifier_value__tccServer_0 = v0;

}

void __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[5];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateCalendarAuthorizationStates");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = CFSTR("PUICalendarPrivacyUpgradePromptAppIdentifierKey");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PUICalendarPrivacyUpgradePromptCompletedNotification"), v4, v5);

  v6 = dispatch_time(0, 100000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke_3;
  v7[3] = &unk_1EA26B358;
  v7[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
}

uint64_t __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)specifiers
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t i;
  void *v12;
  __CFBundle *v13;
  __CFBundle *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  unsigned int v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id obj;
  PUICalendarPrivacyController *val;
  _QWORD v56[4];
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v46 = (int)*MEMORY[0x1E0D80590];
    val = self;
    -[PUICalendarPrivacyController updateCalendarAuthorizationStates](self, "updateCalendarAuthorizationStates");
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (_QWORD *)MEMORY[0x1E0DB10E8];
    v5 = (void *)TCCAccessCopyInformation();
    v6 = (void *)objc_opt_new();
    v45 = +[PUICalendarPrivacyController isServiceRestricted:](PUICalendarPrivacyController, "isServiceRestricted:", *v4);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v64;
      v51 = (id)*MEMORY[0x1E0D808C0];
      v49 = *MEMORY[0x1E0D808D0];
      v9 = *MEMORY[0x1E0D80808];
      v10 = (_QWORD *)MEMORY[0x1E0DB1098];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v64 != v8)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          v13 = (__CFBundle *)objc_msgSend(v12, "objectForKey:", *v10);
          v14 = v13;
          if (v13)
          {
            CFBundleGetIdentifier(v13);
            v15 = objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v6, "containsObject:", v15) & 1) == 0)
            {
              objc_msgSend(v6, "addObject:", v15);
              PUIDisplayNameForApp(v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUICalendarPrivacyController appSpecifierWithName:bundleID:](val, "appSpecifierWithName:bundleID:", v16, v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setProperty:forKey:", v15, v51);
              objc_msgSend(v17, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v49);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v45);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v9);

              objc_msgSend(v53, "addObject:", v17);
            }
          }
          else
          {
            _PUILoggingFacility();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v69 = v12;
              _os_log_impl(&dword_1DB1FB000, v15, OS_LOG_TYPE_DEFAULT, "TCCAccess skipping app with nil bundle: %@", buf, 0xCu);
            }
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      }
      while (v7);
    }

    PUIGetActivePairedDevice();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47 && objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0D51858], "sharedInstance");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      ScreenScale();
      if ((int)v19 == 2)
        v20 = 47;
      else
        v20 = 48;
      v48 = v20;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      -[PUICalendarPrivacyController calendarAllAppIDs](val, "calendarAllAppIDs");
      v52 = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v60;
        v23 = *MEMORY[0x1E0D80808];
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v60 != v22)
              objc_enumerationMutation(v52);
            v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
            if ((objc_msgSend(v6, "containsObject:", v25) & 1) == 0)
            {
              objc_msgSend(v6, "addObject:", v25);
              PUIDisplayNameForWatchApp(v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (v26)
              {
                v27 = v25;
              }
              else
              {
                PUIWatchBundleIDForBundleID(v25);
                v27 = (id)objc_claimAutoreleasedReturnValue();
                PUIDisplayNameForWatchApp(v27);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
              }
              if (v26)
                v28 = v26;
              else
                v28 = v25;
              -[PUICalendarPrivacyController appSpecifierWithName:bundleID:](val, "appSpecifierWithName:bundleID:", v28, v25);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v45);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, v23);

              objc_initWeak((id *)buf, val);
              v56[0] = MEMORY[0x1E0C809B0];
              v56[1] = 3221225472;
              v56[2] = __42__PUICalendarPrivacyController_specifiers__block_invoke;
              v56[3] = &unk_1EA26B5F0;
              v31 = v29;
              v57 = v31;
              objc_copyWeak(&v58, (id *)buf);
              objc_msgSend(v50, "getIconForBundleID:iconVariant:block:timeout:", v27, v48, v56, -1.0);
              objc_msgSend(v53, "addObject:", v31);
              objc_destroyWeak(&v58);

              objc_destroyWeak((id *)buf);
            }
          }
          v21 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v21);
      }

    }
    objc_msgSend(v53, "sortUsingComparator:", &__block_literal_global_92);
    v32 = (void *)objc_msgSend(v53, "copy");
    -[PUICalendarPrivacyController setCalendarAppSpecifiers:](val, "setCalendarAppSpecifiers:", v32);

    v33 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setIdentifier:", CFSTR("CALENDAR_PRIVACY_DESCRIPTION"));
    PUI_LocalizedStringForPrivacy(CFSTR("CALENDARS_PRIVACY_DESCRIPTION"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x1E0D80848];
    objc_msgSend(v34, "setProperty:forKey:", v35, *MEMORY[0x1E0D80848]);
    objc_msgSend(v33, "addObject:", v34);
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, val, 0, 0, 0, -1, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setProperty:forKey:", CFSTR("CALENDAR_PICKER_INFO_CELL"), *MEMORY[0x1E0D80868]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setProperty:forKey:", v38, *MEMORY[0x1E0D80938]);

    objc_msgSend(v37, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(v37, "setIdentifier:", CFSTR("CALENDAR_PREVIEW_GROUP"));
    objc_msgSend(v33, "addObject:", v37);
    v39 = objc_msgSend(v53, "count") == 0;
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v39)
    {
      objc_msgSend(v40, "setIdentifier:", CFSTR("NO_APP_GROUP"));
      PUI_LocalizedStringForPrivacy(CFSTR("CALENDARS_NO_APP_FOOTER"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setProperty:forKey:", v42, v36);
      objc_msgSend(v33, "addObject:", v41);

    }
    else
    {
      objc_msgSend(v40, "setIdentifier:", CFSTR("CALENDAR_FOOTER_SPACING"));
      objc_msgSend(v33, "addObject:", v41);
      objc_msgSend(v33, "addObjectsFromArray:", v53);
    }

    v43 = *(Class *)((char *)&val->super.super.super.super.super.isa + v46);
    *(Class *)((char *)&val->super.super.super.super.super.isa + v46) = (Class)v33;

    -[PUICalendarPrivacyController updateSpecifiersForImposedSettings](val, "updateSpecifiersForImposedSettings");
    v3 = *(Class *)((char *)&val->super.super.super.super.super.isa + v46);
  }
  return v3;
}

void __42__PUICalendarPrivacyController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PUICalendarPrivacyController_specifiers__block_invoke_2;
  block[3] = &unk_1EA26B5C8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

}

void __42__PUICalendarPrivacyController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80870]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

uint64_t __42__PUICalendarPrivacyController_specifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (void *)MEMORY[0x1E0D804E8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, sel__setCalendarStatus_specifier_, sel_calendarStatus_, objc_opt_class(), 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIdentifier:", v7);
  objc_msgSend(v9, "setProperty:forKey:", v7, CFSTR("appBundleID"));

  PUI_LocalizedStringForPrivacy(CFSTR("CALENDARS_AUTH_HEADER"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v10, *MEMORY[0x1E0D80920]);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForPrivacy(CFSTR("CALENDARS_NO_ACCESS_AUTHORIZATION"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v13);

  objc_msgSend(v12, "addObject:", &unk_1EA27E6D8);
  PUI_LocalizedStringForPrivacy(CFSTR("CALENDARS_WRITE_ONLY_ACCESS_AUTHORIZATION"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v14);

  objc_msgSend(v12, "addObject:", &unk_1EA27E6A8);
  PUI_LocalizedStringForPrivacy(CFSTR("CALENDARS_FULL_ACCESS_AUTHORIZATION"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v15);

  objc_msgSend(v12, "addObject:", &unk_1EA27E6C0);
  objc_msgSend(v9, "setValues:titles:", v12, v11);

  return v9;
}

- (void)_setCalendarStatus:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  PUICalendarPrivacyController *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("appBundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _PUILoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412546;
    v25 = v7;
    v26 = 1024;
    v27 = objc_msgSend(v6, "intValue");
    _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "Selected entry for app %@: %d", (uint8_t *)&v24, 0x12u);
  }

  if (objc_msgSend(v6, "intValue") == 2)
  {
    _PUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v7;
      _os_log_impl(&dword_1DB1FB000, v9, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to full", (uint8_t *)&v24, 0xCu);
    }

    v10 = *MEMORY[0x1E0DB10E8];
    v11 = self;
    v12 = v7;
    v13 = 2;
LABEL_18:
    -[PUICalendarPrivacyController setTCCForService:appIdentifier:value:](v11, "setTCCForService:appIdentifier:value:", v10, v12, v13);
    goto LABEL_19;
  }
  if (objc_msgSend(v6, "intValue") == 1)
  {
    _PUILoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v7;
      _os_log_impl(&dword_1DB1FB000, v14, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to write-only", (uint8_t *)&v24, 0xCu);
    }

    v10 = *MEMORY[0x1E0DB10E8];
    v11 = self;
    v12 = v7;
    v13 = 1;
    goto LABEL_18;
  }
  v15 = objc_msgSend(v6, "intValue");
  _PUILoggingFacility();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v7;
      _os_log_impl(&dword_1DB1FB000, v17, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to denied", (uint8_t *)&v24, 0xCu);
    }

    v10 = *MEMORY[0x1E0DB10E8];
    v11 = self;
    v12 = v7;
    v13 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[PUICalendarPrivacyController _setCalendarStatus:specifier:].cold.1((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);

LABEL_19:
  -[PUICalendarPrivacyController updateCalendarAuthorizationStates](self, "updateCalendarAuthorizationStates");
  -[PUICalendarPrivacyController reloadSpecifiers](self, "reloadSpecifiers");

}

- (id)calendarStatus:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "propertyForKey:", CFSTR("appBundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUICalendarPrivacyController calendarFullAccessAllowedAppIDs](self, "calendarFullAccessAllowedAppIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v4;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has full calendar access", (uint8_t *)&v21, 0xCu);
    }
    v8 = &unk_1EA27E6C0;
  }
  else
  {
    -[PUICalendarPrivacyController calendarWriteOnlyAppIDs](self, "calendarWriteOnlyAppIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if (v10)
    {
      _PUILoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = v4;
        _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has write-only calendar access", (uint8_t *)&v21, 0xCu);
      }
      v8 = &unk_1EA27E6A8;
    }
    else
    {
      -[PUICalendarPrivacyController calendarNoAccessAppIDs](self, "calendarNoAccessAppIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v4);

      _PUILoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      v7 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v4;
          _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has no calendar access", (uint8_t *)&v21, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[PUICalendarPrivacyController calendarStatus:].cold.1((uint64_t)v4, v7, v14, v15, v16, v17, v18, v19);
      }
      v8 = &unk_1EA27E6D8;
    }
  }

  return v8;
}

- (void)updateCalendarAuthorizationStates
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  void (*v26)(uint64_t, void *, uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DB10E8];
  v4 = (void *)tcc_server_create();
  tcc_service_singleton_for_CF_name();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  _PUILoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v25) = 138412290;
    *(_QWORD *)((char *)&v25 + 4) = v3;
    _os_log_impl(&dword_1DB1FB000, v9, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", (uint8_t *)&v25, 0xCu);
  }

  *(_QWORD *)&v25 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v25 + 1) = 3221225472;
  v26 = __PUICalendarAuthorizationStatesForService_block_invoke;
  v27 = &unk_1EA26C208;
  v28 = v6;
  v29 = v7;
  v30 = v8;
  v31 = v3;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  tcc_server_message_get_authorization_records_by_service();
  v13 = (id)objc_msgSend(v12, "copy");
  v14 = (id)objc_msgSend(v11, "copy");
  v15 = (id)objc_msgSend(v10, "copy");

  v16 = v13;
  v17 = v14;
  v18 = v15;
  -[PUICalendarPrivacyController setCalendarFullAccessAllowedAppIDs:](self, "setCalendarFullAccessAllowedAppIDs:", v16);
  -[PUICalendarPrivacyController setCalendarWriteOnlyAppIDs:](self, "setCalendarWriteOnlyAppIDs:", v17);

  -[PUICalendarPrivacyController setCalendarNoAccessAppIDs:](self, "setCalendarNoAccessAppIDs:", v18);
  -[PUICalendarPrivacyController calendarWriteOnlyAppIDs](self, "calendarWriteOnlyAppIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUICalendarPrivacyController calendarFullAccessAllowedAppIDs](self, "calendarFullAccessAllowedAppIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObjectsFromSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUICalendarPrivacyController setCalendarSomeAccessAppIDs:](self, "setCalendarSomeAccessAppIDs:", v21);

  -[PUICalendarPrivacyController calendarSomeAccessAppIDs](self, "calendarSomeAccessAppIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUICalendarPrivacyController calendarNoAccessAppIDs](self, "calendarNoAccessAppIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setByAddingObjectsFromSet:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUICalendarPrivacyController setCalendarAllAppIDs:](self, "setCalendarAllAppIDs:", v24);

}

- (void)updateSpecifiersForImposedSettings
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PUICalendarPrivacyController isServiceRestricted:](PUICalendarPrivacyController, "isServiceRestricted:", *MEMORY[0x1E0DB10E8]) ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PUICalendarPrivacyController calendarAppSpecifiers](self, "calendarAppSpecifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    v7 = *MEMORY[0x1E0D80808];
    v18 = *MEMORY[0x1E0D80940];
    v16 = *MEMORY[0x1E0D80990];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "propertyForKey:", v7);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v9, "objectForKeyedSubscript:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "BOOLValue");
          v14 = objc_msgSend(v3, "BOOLValue");

          if (v13 == v14)
            continue;
        }
        objc_msgSend(v9, "setProperty:forKey:", v3, v7);
        objc_msgSend(v9, "propertyForKey:", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCellEnabled:", objc_msgSend(v3, "BOOLValue"));

        if ((objc_msgSend(v3, "BOOLValue") & 1) == 0)
          objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v16);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

}

- (NSSet)calendarFullAccessAllowedAppIDs
{
  return self->_calendarFullAccessAllowedAppIDs;
}

- (void)setCalendarFullAccessAllowedAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_calendarFullAccessAllowedAppIDs, a3);
}

- (NSSet)calendarWriteOnlyAppIDs
{
  return self->_calendarWriteOnlyAppIDs;
}

- (void)setCalendarWriteOnlyAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_calendarWriteOnlyAppIDs, a3);
}

- (NSSet)calendarNoAccessAppIDs
{
  return self->_calendarNoAccessAppIDs;
}

- (void)setCalendarNoAccessAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_calendarNoAccessAppIDs, a3);
}

- (NSSet)calendarSomeAccessAppIDs
{
  return self->_calendarSomeAccessAppIDs;
}

- (void)setCalendarSomeAccessAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_calendarSomeAccessAppIDs, a3);
}

- (NSSet)calendarAllAppIDs
{
  return self->_calendarAllAppIDs;
}

- (void)setCalendarAllAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_calendarAllAppIDs, a3);
}

- (NSArray)calendarAppSpecifiers
{
  return self->_calendarAppSpecifiers;
}

- (void)setCalendarAppSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_calendarAppSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_calendarAllAppIDs, 0);
  objc_storeStrong((id *)&self->_calendarSomeAccessAppIDs, 0);
  objc_storeStrong((id *)&self->_calendarNoAccessAppIDs, 0);
  objc_storeStrong((id *)&self->_calendarWriteOnlyAppIDs, 0);
  objc_storeStrong((id *)&self->_calendarFullAccessAllowedAppIDs, 0);
}

- (void)_setCalendarStatus:(uint64_t)a3 specifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DB1FB000, a2, a3, "Unexpected value set for calendar tcc access: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)calendarStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DB1FB000, a2, a3, "Unexpected status for calendar access, not in any array: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end

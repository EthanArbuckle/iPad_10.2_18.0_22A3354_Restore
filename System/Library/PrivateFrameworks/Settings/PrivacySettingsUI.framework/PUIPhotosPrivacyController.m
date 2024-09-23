@implementation PUIPhotosPrivacyController

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

+ (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
  objc_msgSend(a1, "setTCCForService:appIdentifier:value:completion:", a3, a4, *(_QWORD *)&a5, 0);
}

+ (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (*v23)(id, _QWORD, id, id, _QWORD, uint64_t, id);
  _QWORD v24[4];
  id v25;
  void (**v26)(_QWORD);
  id v27;
  _BYTE buf[24];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  if (a5 != 5)
  {
    if (setTCCForService_appIdentifier_value_completion__onceToken != -1)
      dispatch_once(&setTCCForService_appIdentifier_value_completion__onceToken, &__block_literal_global_119);
    _PUILoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 1024;
      v29 = a5;
      _os_log_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
    }

    v13 = objc_retainAutorelease(v10);
    objc_msgSend(v13, "cStringUsingEncoding:", 4);
    v14 = (void *)tcc_identity_create();
    tcc_service_singleton_for_CF_name();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if ((a5 - 1) <= 2)
      v16 = qword_1DB259F20[a5 - 1];
    v17 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0DB1188]);
    if (a5 != 2 || !v17)
      goto LABEL_16;
    if (!TCCLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1EA26CB18;
      *(_QWORD *)&buf[16] = 0;
      TCCLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (TCCLibraryCore_frameworkLibrary && gettcc_server_message_prompt_authorization_valueSymbolLoc())
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke_120;
      v24[3] = &unk_1EA26CA80;
      v27 = a1;
      v25 = v13;
      v26 = v11;
      v18 = (void *)MEMORY[0x1DF0AB308](v24);
      v19 = (id)setTCCForService_appIdentifier_value_completion__tccServer;
      v20 = v14;
      v21 = v15;
      v22 = v18;
      v23 = (void (*)(id, _QWORD, id, id, _QWORD, uint64_t, id))gettcc_server_message_prompt_authorization_valueSymbolLoc();
      if (!v23)
        __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
      v23(v19, 0, v20, v21, 0, v16, v22);

    }
    else
    {
LABEL_16:
      tcc_server_message_set_authorization_value();
      if (v11)
        v11[2](v11);
    }

  }
}

void __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)setTCCForService_appIdentifier_value_completion__tccServer;
  setTCCForService_appIdentifier_value_completion__tccServer = v0;

}

void __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke_120(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = CFSTR("PUIPhotosPrivacyUpgradePromptAppIdentifierKey");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PUIPhotosPrivacyUpgradePromptCompletedNotification"), v3, v5);

  if (*(_QWORD *)(a1 + 40))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke_2;
    v6[3] = &unk_1EA26B718;
    v7 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIPhotosPrivacyController;
  -[PUIPhotosPrivacyController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUIPhotosPrivacyController provideNavigationDonations](self, "provideNavigationDonations");
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
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("PHOTOS"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/PHOTOS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPhotosPrivacyController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.privacy"), v7, v11, v12);

}

- (id)specifiers
{
  if (_os_feature_enabled_impl())
    -[PUIPhotosPrivacyController _specifiersWithCombinedPickerUsage](self, "_specifiersWithCombinedPickerUsage");
  else
    -[PUIPhotosPrivacyController _specifiersForClassicController](self, "_specifiersForClassicController");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_specifiersForClassicController
{
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t i;
  void *v10;
  __CFBundle *v11;
  __CFBundle *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  objc_class *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  _BOOL4 v73;
  uint64_t v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id *to;
  id *toa;
  id v87;
  id obj;
  void *v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  NSObject *v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v71 = (int)*MEMORY[0x1E0D80590];
    -[PUIPhotosPrivacyController _updatePhotosAuthorizationStates](self, "_updatePhotosAuthorizationStates");
    v87 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (_QWORD *)MEMORY[0x1E0DB1188];
    v69 = (void *)TCCAccessCopyInformation();
    v70 = (void *)TCCAccessCopyInformation();
    objc_msgSend(v69, "arrayByAddingObjectsFromArray:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)objc_opt_new();
    v73 = +[PUIPhotosPrivacyController isServiceRestricted:](PUIPhotosPrivacyController, "isServiceRestricted:", *v4);
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v103;
      to = (id *)*MEMORY[0x1E0D808C0];
      v82 = (id)*MEMORY[0x1E0D808D0];
      v77 = *MEMORY[0x1E0D80808];
      v8 = (_QWORD *)MEMORY[0x1E0DB1098];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v103 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
          v11 = (__CFBundle *)objc_msgSend(v10, "objectForKey:", *v8);
          v12 = v11;
          if (v11)
          {
            CFBundleGetIdentifier(v11);
            v13 = objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v89, "containsObject:", v13) & 1) == 0)
            {
              objc_msgSend(v89, "addObject:", v13);
              PUIDisplayNameForApp(v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUIPhotosPrivacyController photosAddOnlyAllAppIDs](self, "photosAddOnlyAllAppIDs");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "containsObject:", v13);

              -[PUIPhotosPrivacyController photosReadWriteAllAppIDs](self, "photosReadWriteAllAppIDs");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "containsObject:", v13);

              -[PUIPhotosPrivacyController appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:](self, "appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:", v14, v13, v18, v16, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setProperty:forKey:", v13, to);
              objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v82);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v73);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v77);

              objc_msgSend(v87, "addObject:", v19);
            }
          }
          else
          {
            _PUILoggingFacility();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v107 = v10;
              _os_log_impl(&dword_1DB1FB000, v13, OS_LOG_TYPE_DEFAULT, "TCCAccess skipping app with nil bundle: %@", buf, 0xCu);
            }
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
      }
      while (v6);
    }

    PUIGetActivePairedDevice();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72 && objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0D51858], "sharedInstance");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      ScreenScale();
      v100 = 0u;
      v101 = 0u;
      if ((int)v21 == 2)
        v22 = 47;
      else
        v22 = 48;
      v78 = v22;
      v99 = 0uLL;
      v98 = 0uLL;
      -[PUIPhotosPrivacyController photosAllAppIDs](self, "photosAllAppIDs");
      v83 = (id)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v99;
        v75 = !v73;
        v74 = *MEMORY[0x1E0D80808];
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v99 != v24)
              objc_enumerationMutation(v83);
            v26 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
            if ((objc_msgSend(v89, "containsObject:", v26) & 1) == 0)
            {
              objc_msgSend(v89, "addObject:", v26);
              PUIDisplayNameForWatchApp(v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                v28 = v26;
              }
              else
              {
                PUIWatchBundleIDForBundleID(v26);
                v28 = (id)objc_claimAutoreleasedReturnValue();
                PUIDisplayNameForWatchApp(v28);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
              }
              -[PUIPhotosPrivacyController photosAddOnlyAllAppIDs](self, "photosAddOnlyAllAppIDs");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "containsObject:", v26);

              -[PUIPhotosPrivacyController photosReadWriteAllAppIDs](self, "photosReadWriteAllAppIDs");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "containsObject:", v26);

              if (v27)
                v33 = v27;
              else
                v33 = v26;
              -[PUIPhotosPrivacyController appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:](self, "appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:", v33, v26, v32, v30, 0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v75);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, v74);

              objc_initWeak((id *)buf, self);
              v95[0] = MEMORY[0x1E0C809B0];
              v95[1] = 3221225472;
              v95[2] = __61__PUIPhotosPrivacyController__specifiersForClassicController__block_invoke;
              v95[3] = &unk_1EA26B5F0;
              v36 = v34;
              v96 = v36;
              objc_copyWeak(&v97, (id *)buf);
              objc_msgSend(v80, "getIconForBundleID:iconVariant:block:timeout:", v28, v78, v95, -1.0);
              objc_msgSend(v87, "addObject:", v36);
              objc_destroyWeak(&v97);

              objc_destroyWeak((id *)buf);
            }
          }
          v23 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
        }
        while (v23);
      }

    }
    objc_msgSend(v87, "sortUsingComparator:", &__block_literal_global_142);
    v37 = (void *)objc_msgSend(v87, "copy");
    -[PUIPhotosPrivacyController setAllAppSpecifiers:](self, "setAllAppSpecifiers:", v37);

    v81 = (void *)objc_opt_new();
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("PUIPhotosPrivacyController"));

    if (v40)
    {
      objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "photosPickerPresentedLibraryLogsByClient");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v84 = v42;
      v43 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
      if (v43)
      {
        toa = *(id **)v92;
        v44 = *MEMORY[0x1E0D744B0];
        v79 = *MEMORY[0x1E0D808C0];
        v76 = *MEMORY[0x1E0D808D0];
        do
        {
          for (k = 0; k != v43; ++k)
          {
            if (*(id **)v92 != toa)
              objc_enumerationMutation(v84);
            v46 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * k);
            objc_msgSend(v46, "objectForKeyedSubscript:", v44);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUIPhotosPrivacyController pickerUsageAppIDs](self, "pickerUsageAppIDs");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "containsObject:", v47);

            -[PUIPhotosPrivacyController photosReadWriteAllowedOrLimitedAppIDs](self, "photosReadWriteAllowedOrLimitedAppIDs");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "containsObject:", v47);

            if (((v49 ^ 1 | v51) & 1) != 0)
            {
              _PUILoggingFacility();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v107 = v46;
                _os_log_impl(&dword_1DB1FB000, v52, OS_LOG_TYPE_DEFAULT, "Skipping picker log: %@", buf, 0xCu);
              }
            }
            else
            {
              v90 = 0;
              objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithApplicationIdentifier:error:", v47, &v90);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v90;
              if (v53)
              {
                objc_msgSend(v53, "localizedName");
                v54 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v54, 0, 0, 0, 0, 3, 0);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PickerSection-%@"), v47);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "setIdentifier:", v56);

                objc_msgSend(v55, "setProperty:forKey:", v47, v79);
                objc_msgSend(v55, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v76);
                objc_msgSend(v81, "addObject:", v55);

              }
              else
              {
                _PUILoggingFacility();
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v107 = v47;
                  v108 = 2112;
                  v109 = v52;
                  _os_log_impl(&dword_1DB1FB000, v54, OS_LOG_TYPE_DEFAULT, "Skipping app (%@) without bundle record with error: %@", buf, 0x16u);
                }
              }

            }
          }
          v43 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
        }
        while (v43);
      }

    }
    objc_msgSend(v81, "sortUsingComparator:", &__block_literal_global_150);
    v57 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_HEADER"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = *MEMORY[0x1E0D80848];
    objc_msgSend(v58, "setProperty:forKey:", v59, *MEMORY[0x1E0D80848]);

    objc_msgSend(v57, "addObject:", v58);
    if (objc_msgSend(v87, "count") || objc_msgSend(v81, "count"))
    {
      if (objc_msgSend(v87, "count"))
      {
        PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_PHOTOKIT_SECTION_TITLE"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v61, 0, 0, 0, 0, 0, 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setIdentifier:", CFSTR("PHOTOKIT_APP_GROUP"));
        PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_PHOTOKIT_SECTION_FOOTER"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setProperty:forKey:", v63, v60);
        objc_msgSend(v57, "addObject:", v62);
        objc_msgSend(v57, "addObjectsFromArray:", v87);

      }
      if (!objc_msgSend(v81, "count"))
        goto LABEL_60;
      PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_PICKER_SECTION_TITLE"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v64, 0, 0, 0, 0, 0, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setIdentifier:", CFSTR("PICKER_APP_GROUP"));
      PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_PICKER_SECTION_FOOTER"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setProperty:forKey:", v66, v60);
      objc_msgSend(v57, "addObject:", v65);
      objc_msgSend(v57, "addObjectsFromArray:", v81);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setIdentifier:", CFSTR("NO_APP_GROUP"));
      PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_NO_APP_FOOTER"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setProperty:forKey:", v65, v60);
      objc_msgSend(v57, "addObject:", v64);
    }

LABEL_60:
    v67 = *(Class *)((char *)&self->super.super.super.super.super.isa + v71);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v71) = (Class)v57;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v71);
  }
  return v3;
}

void __61__PUIPhotosPrivacyController__specifiersForClassicController__block_invoke(uint64_t a1, void *a2)
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
  block[2] = __61__PUIPhotosPrivacyController__specifiersForClassicController__block_invoke_2;
  block[3] = &unk_1EA26B5C8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

}

void __61__PUIPhotosPrivacyController__specifiersForClassicController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80870]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

uint64_t __61__PUIPhotosPrivacyController__specifiersForClassicController__block_invoke_3(uint64_t a1, void *a2, void *a3)
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

uint64_t __61__PUIPhotosPrivacyController__specifiersForClassicController__block_invoke_149(uint64_t a1, void *a2, void *a3)
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

- (id)_specifiersWithCombinedPickerUsage
{
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t i;
  void *v10;
  __CFBundle *v11;
  __CFBundle *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  int v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  Class v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  _BOOL4 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  id v77;
  id v78;
  id *to;
  id *toa;
  id v81;
  id v82;
  id v83;
  id obj;
  id v85;
  void *v86;
  PUIPhotosPrivacyController *val;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  NSObject *v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v70 = (int)*MEMORY[0x1E0D80590];
    val = self;
    -[PUIPhotosPrivacyController _updatePhotosAuthorizationStates](self, "_updatePhotosAuthorizationStates");
    v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (_QWORD *)MEMORY[0x1E0DB1188];
    v68 = (void *)TCCAccessCopyInformation();
    v69 = (void *)TCCAccessCopyInformation();
    objc_msgSend(v68, "arrayByAddingObjectsFromArray:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = +[PUIPhotosPrivacyController isServiceRestricted:](PUIPhotosPrivacyController, "isServiceRestricted:", *v4);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v101;
      v81 = (id)*MEMORY[0x1E0D808C0];
      to = (id *)*MEMORY[0x1E0D808D0];
      v75 = *MEMORY[0x1E0D80808];
      v8 = (_QWORD *)MEMORY[0x1E0DB1098];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v101 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
          v11 = (__CFBundle *)objc_msgSend(v10, "objectForKey:", *v8);
          v12 = v11;
          if (v11)
          {
            CFBundleGetIdentifier(v11);
            v13 = objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v86, "containsObject:", v13) & 1) == 0)
            {
              objc_msgSend(v86, "addObject:", v13);
              PUIDisplayNameForApp(v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUIPhotosPrivacyController photosAddOnlyAllAppIDs](val, "photosAddOnlyAllAppIDs");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "containsObject:", v13);

              -[PUIPhotosPrivacyController photosReadWriteAllAppIDs](val, "photosReadWriteAllAppIDs");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "containsObject:", v13);

              -[PUIPhotosPrivacyController pickerUsageAppIDs](val, "pickerUsageAppIDs");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "containsObject:", v13);

              -[PUIPhotosPrivacyController appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:](val, "appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:", v14, v13, v18, v16, v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setProperty:forKey:", v13, v81);
              objc_msgSend(v21, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], to);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v72);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v75);

              objc_msgSend(v85, "addObject:", v21);
            }
          }
          else
          {
            _PUILoggingFacility();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v105 = v10;
              _os_log_impl(&dword_1DB1FB000, v13, OS_LOG_TYPE_DEFAULT, "TCCAccess skipping app with nil bundle: %@", buf, 0xCu);
            }
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
      }
      while (v6);
    }

    PUIGetActivePairedDevice();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71 && objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0D51858], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ScreenScale();
      v98 = 0u;
      v99 = 0u;
      if ((int)v24 == 2)
        v25 = 47;
      else
        v25 = 48;
      v76 = v25;
      v97 = 0uLL;
      v96 = 0uLL;
      -[PUIPhotosPrivacyController photosAllAppIDs](val, "photosAllAppIDs");
      v77 = (id)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
      if (v26)
      {
        v82 = *(id *)v97;
        v73 = *MEMORY[0x1E0D80808];
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(id *)v97 != v82)
              objc_enumerationMutation(v77);
            v28 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
            if ((objc_msgSend(v86, "containsObject:", v28) & 1) == 0)
            {
              objc_msgSend(v86, "addObject:", v28);
              PUIDisplayNameForWatchApp(v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = v28;
              }
              else
              {
                PUIWatchBundleIDForBundleID(v28);
                v30 = (id)objc_claimAutoreleasedReturnValue();
                PUIDisplayNameForWatchApp(v30);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
              }
              -[PUIPhotosPrivacyController photosAddOnlyAllAppIDs](val, "photosAddOnlyAllAppIDs");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "containsObject:", v28);

              -[PUIPhotosPrivacyController photosReadWriteAllAppIDs](val, "photosReadWriteAllAppIDs");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "containsObject:", v28);

              -[PUIPhotosPrivacyController pickerUsageAppIDs](val, "pickerUsageAppIDs");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "containsObject:", v28);

              if (v29)
                v37 = v29;
              else
                v37 = v28;
              -[PUIPhotosPrivacyController appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:](val, "appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:", v37, v28, v34, v32, v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v72);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, v73);

              objc_initWeak((id *)buf, val);
              v93[0] = MEMORY[0x1E0C809B0];
              v93[1] = 3221225472;
              v93[2] = __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke;
              v93[3] = &unk_1EA26B5F0;
              v40 = v38;
              v94 = v40;
              objc_copyWeak(&v95, (id *)buf);
              objc_msgSend(v23, "getIconForBundleID:iconVariant:block:timeout:", v30, v76, v93, -1.0);
              objc_msgSend(v85, "addObject:", v40);
              objc_destroyWeak(&v95);

              objc_destroyWeak((id *)buf);
            }
          }
          v26 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
        }
        while (v26);
      }

    }
    objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "photosPickerPresentedLibraryLogsByClient");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v83 = v42;
    v43 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v90;
      v45 = *MEMORY[0x1E0D744B0];
      toa = (id *)*MEMORY[0x1E0D808C0];
      v78 = (id)*MEMORY[0x1E0D808D0];
      v74 = *MEMORY[0x1E0D80808];
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v90 != v44)
            objc_enumerationMutation(v83);
          v47 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * k);
          objc_msgSend(v47, "objectForKeyedSubscript:", v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUIPhotosPrivacyController pickerUsageAppIDs](val, "pickerUsageAppIDs");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "containsObject:", v48);

          if (((v50 ^ 1 | objc_msgSend(v86, "containsObject:", v48)) & 1) != 0)
          {
            _PUILoggingFacility();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v105 = v47;
              _os_log_impl(&dword_1DB1FB000, v51, OS_LOG_TYPE_DEFAULT, "Skipping picker log: %@", buf, 0xCu);
            }
          }
          else
          {
            v88 = 0;
            objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithApplicationIdentifier:error:", v48, &v88);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v88;
            if (v52)
            {
              objc_msgSend(v52, "localizedName");
              v53 = objc_claimAutoreleasedReturnValue();
              -[PUIPhotosPrivacyController appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:](val, "appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:", v53, v48, 0, 0, 1);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "setProperty:forKey:", v48, toa);
              objc_msgSend(v54, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v78);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v72);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "setObject:forKeyedSubscript:", v55, v74);

              objc_msgSend(v85, "addObject:", v54);
            }
            else
            {
              _PUILoggingFacility();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v105 = v48;
                v106 = 2112;
                v107 = v51;
                _os_log_impl(&dword_1DB1FB000, v53, OS_LOG_TYPE_DEFAULT, "Skipping app (%@) without bundle record with error: %@", buf, 0x16u);
              }
            }

          }
        }
        v43 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
      }
      while (v43);
    }

    objc_msgSend(v85, "sortUsingComparator:", &__block_literal_global_171);
    v56 = (void *)objc_msgSend(v85, "copy");
    -[PUIPhotosPrivacyController setAllAppSpecifiers:](val, "setAllAppSpecifiers:", v56);

    v57 = (void *)objc_opt_new();
    v58 = NSClassFromString(CFSTR("PSPhotosTCCGridCell"));
    if (v58)
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = *MEMORY[0x1E0D80868];
      objc_msgSend(v59, "setProperty:forKey:", CFSTR("PHOTOS_GRID_GROUP"), *MEMORY[0x1E0D80868]);
      PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_GRID_FOOTER"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setProperty:forKey:", v61, *MEMORY[0x1E0D80848]);
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1EA26D430, val, 0, 0, 0, -1, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setProperty:forKey:", CFSTR("PHOTOS_GRID_CELL"), v60);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setProperty:forKey:", v63, *MEMORY[0x1E0D80938]);

      objc_msgSend(v62, "setProperty:forKey:", v58, *MEMORY[0x1E0D80780]);
      objc_msgSend(v57, "addObject:", v59);
      objc_msgSend(v57, "addObject:", v62);

    }
    if (objc_msgSend(v85, "count"))
    {
      if (!objc_msgSend(v85, "count"))
      {
LABEL_57:
        v66 = *(Class *)((char *)&val->super.super.super.super.super.isa + v70);
        *(Class *)((char *)&val->super.super.super.super.super.isa + v70) = (Class)v57;

        v3 = *(Class *)((char *)&val->super.super.super.super.super.isa + v70);
        return v3;
      }
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1EA26D430, 0, 0, 0, 0, 0, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setIdentifier:", CFSTR("PHOTOKIT_APP_GROUP"));
      objc_msgSend(v57, "addObject:", v64);
      objc_msgSend(v57, "addObjectsFromArray:", v85);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setIdentifier:", CFSTR("NO_APP_GROUP"));
      PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_NO_APP_FOOTER"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setProperty:forKey:", v65, *MEMORY[0x1E0D80848]);
      objc_msgSend(v57, "addObject:", v64);

    }
    goto LABEL_57;
  }
  return v3;
}

void __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke(uint64_t a1, void *a2)
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
  block[2] = __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke_2;
  block[3] = &unk_1EA26B5C8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

}

void __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80870]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

uint64_t __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke_170(uint64_t a1, void *a2, void *a3)
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

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showPhotosAccess:(BOOL)a5 showPhotosAddAccess:(BOOL)a6 showPickerUsage:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v11;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _BOOL4 v25;

  v25 = a7;
  v7 = a6;
  v8 = a5;
  v11 = (void *)MEMORY[0x1E0D804E8];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, sel__setPhotosStatus_specifier_, sel__photosStatus_, objc_opt_class(), 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIdentifier:", v12);
  objc_msgSend(v14, "setProperty:forKey:", v12, CFSTR("appBundleID"));

  if (_os_feature_enabled_impl())
    v15 = CFSTR("PHOTOS_AUTH_ONGOING_HEADER");
  else
    v15 = CFSTR("PHOTOS_AUTH_HEADER");
  PUI_LocalizedStringForPrivacy(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProperty:forKey:", v16, *MEMORY[0x1E0D80920]);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || v7)
  {
    PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_NO_ACCESS_AUTHORIZATION"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v23);

    objc_msgSend(v18, "addObject:", &unk_1EA27E870);
    objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasTCCOptions"));
    if (v7)
    {
      PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_ADD_ONLY_AUTHORIZATION"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v24);

      objc_msgSend(v18, "addObject:", &unk_1EA27E888);
      if (!v8)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  if (v8)
  {
LABEL_7:
    PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_LIMITED_AUTHORIZATION"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v19);

    objc_msgSend(v18, "addObject:", &unk_1EA27E840);
    PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_FULL_AUTHORIZATION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    objc_msgSend(v18, "addObject:", &unk_1EA27E858);
  }
LABEL_8:
  if (_os_feature_enabled_impl() && v25)
  {
    PUI_LocalizedStringForPrivacy(CFSTR("PHOTOS_PICKER_ONLY_AUTHORIZATION"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v21);

    objc_msgSend(v18, "addObject:", &unk_1EA27E8A0);
    objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasPickerInfo"));
  }
  objc_msgSend(v14, "setValues:titles:", v18, v17);

  return v14;
}

- (void)_updatePhotosAuthorizationStates
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v3 = *MEMORY[0x1E0DB1188];
  v23 = 0;
  v24 = 0;
  v22 = 0;
  PUIPhotosAuthorizationStatesForService(v3, &v24, &v23, &v22);
  v4 = v24;
  v5 = v23;
  v6 = v22;
  v7 = *MEMORY[0x1E0DB1190];
  v20 = 0;
  v21 = 0;
  PUIPhotosAuthorizationStatesForService(v7, &v21, 0, &v20);
  v8 = v21;
  v9 = v20;
  -[PUIPhotosPrivacyController setPhotosReadWriteAllowedAppIDs:](self, "setPhotosReadWriteAllowedAppIDs:", v4);
  -[PUIPhotosPrivacyController setPhotosReadWriteLimitedAppIDs:](self, "setPhotosReadWriteLimitedAppIDs:", v5);
  -[PUIPhotosPrivacyController setPhotosReadWriteDeniedAppIDs:](self, "setPhotosReadWriteDeniedAppIDs:", v6);
  -[PUIPhotosPrivacyController setPhotosAddOnlyAllowedAppIDs:](self, "setPhotosAddOnlyAllowedAppIDs:", v8);
  -[PUIPhotosPrivacyController setPhotosAddOnlyDeniedAppIDs:](self, "setPhotosAddOnlyDeniedAppIDs:", v9);
  PUIPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPhotosPrivacyController setPickerUsageAppIDs:](self, "setPickerUsageAppIDs:", v10);

  -[PUIPhotosPrivacyController photosReadWriteAllowedAppIDs](self, "photosReadWriteAllowedAppIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPhotosPrivacyController photosReadWriteLimitedAppIDs](self, "photosReadWriteLimitedAppIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setByAddingObjectsFromSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPhotosPrivacyController setPhotosReadWriteAllowedOrLimitedAppIDs:](self, "setPhotosReadWriteAllowedOrLimitedAppIDs:", v13);

  -[PUIPhotosPrivacyController photosReadWriteAllowedOrLimitedAppIDs](self, "photosReadWriteAllowedOrLimitedAppIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromSet:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPhotosPrivacyController setPhotosReadWriteAllAppIDs:](self, "setPhotosReadWriteAllAppIDs:", v15);

  objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIPhotosPrivacyController setPhotosAddOnlyAllAppIDs:](self, "setPhotosAddOnlyAllAppIDs:", v16);
  -[PUIPhotosPrivacyController photosReadWriteAllAppIDs](self, "photosReadWriteAllAppIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPhotosPrivacyController photosAddOnlyAllAppIDs](self, "photosAddOnlyAllAppIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setByAddingObjectsFromSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPhotosPrivacyController setPhotosAllAppIDs:](self, "setPhotosAllAppIDs:", v19);

}

- (void)_setPhotosStatus:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  _QWORD v19[5];

  v6 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("appBundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "intValue") == 2)
  {
    v8 = *MEMORY[0x1E0DB1188];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__PUIPhotosPrivacyController__setPhotosStatus_specifier___block_invoke;
    v19[3] = &unk_1EA26B358;
    v19[4] = self;
    +[PUIPhotosPrivacyController setTCCForService:appIdentifier:value:completion:](PUIPhotosPrivacyController, "setTCCForService:appIdentifier:value:completion:", v8, v7, 2, v19);
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "intValue") == 1)
  {
    -[PUIPhotosPrivacyController photosReadWriteAllowedOrLimitedAppIDs](self, "photosReadWriteAllowedOrLimitedAppIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v7);

    if (v10)
      +[PUIPhotosPrivacyController setTCCForService:appIdentifier:value:](PUIPhotosPrivacyController, "setTCCForService:appIdentifier:value:", *MEMORY[0x1E0DB1188], v7, 0);
    v11 = *MEMORY[0x1E0DB1190];
    v12 = v7;
    v13 = 1;
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "intValue") == 3)
  {
    v11 = *MEMORY[0x1E0DB1188];
    v12 = v7;
    v13 = 3;
LABEL_15:
    +[PUIPhotosPrivacyController setTCCForService:appIdentifier:value:](PUIPhotosPrivacyController, "setTCCForService:appIdentifier:value:", v11, v12, v13);
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "intValue") && objc_msgSend(v6, "intValue") != 5)
  {
    _PUILoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[PUIPhotosPrivacyController _setPhotosStatus:specifier:].cold.1((uint64_t)v6, v18);

  }
  else
  {
    -[PUIPhotosPrivacyController photosReadWriteAllowedOrLimitedAppIDs](self, "photosReadWriteAllowedOrLimitedAppIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v7);

    if (v15)
      +[PUIPhotosPrivacyController setTCCForService:appIdentifier:value:](PUIPhotosPrivacyController, "setTCCForService:appIdentifier:value:", *MEMORY[0x1E0DB1188], v7, 0);
    -[PUIPhotosPrivacyController photosAddOnlyAllowedAppIDs](self, "photosAddOnlyAllowedAppIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v7);

    if (v17)
    {
      v11 = *MEMORY[0x1E0DB1190];
      v12 = v7;
      v13 = 0;
      goto LABEL_15;
    }
  }
LABEL_16:
  -[PUIPhotosPrivacyController _updatePhotosAuthorizationStates](self, "_updatePhotosAuthorizationStates");
  -[PUIPhotosPrivacyController reloadSpecifiers](self, "reloadSpecifiers");

}

uint64_t __57__PUIPhotosPrivacyController__setPhotosStatus_specifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePhotosAuthorizationStates");
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)_photosStatus:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;

  objc_msgSend(a3, "propertyForKey:", CFSTR("appBundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPhotosPrivacyController photosReadWriteAllowedAppIDs](self, "photosReadWriteAllowedAppIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = &unk_1EA27E858;
  }
  else
  {
    -[PUIPhotosPrivacyController photosReadWriteLimitedAppIDs](self, "photosReadWriteLimitedAppIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if ((v9 & 1) != 0)
    {
      v7 = &unk_1EA27E840;
    }
    else
    {
      -[PUIPhotosPrivacyController photosAddOnlyAllowedAppIDs](self, "photosAddOnlyAllowedAppIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v4);

      if ((v11 & 1) != 0)
      {
        v7 = &unk_1EA27E888;
      }
      else if (_os_feature_enabled_impl()
             && (-[PUIPhotosPrivacyController pickerUsageAppIDs](self, "pickerUsageAppIDs"),
                 v12 = (void *)objc_claimAutoreleasedReturnValue(),
                 v13 = objc_msgSend(v12, "containsObject:", v4),
                 v12,
                 (v13 & 1) != 0))
      {
        v7 = &unk_1EA27E8A0;
      }
      else
      {
        v7 = &unk_1EA27E870;
      }
    }
  }

  return v7;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PUIPhotosPrivacyController isServiceRestricted:](PUIPhotosPrivacyController, "isServiceRestricted:", *MEMORY[0x1E0DB1188]) ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PUIPhotosPrivacyController allAppSpecifiers](self, "allAppSpecifiers");
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

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  objc_super v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  -[PUIPhotosPrivacyController specifierForID:](self, "specifierForID:", CFSTR("PICKER_APP_GROUP"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (-[PUIPhotosPrivacyController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v13, 0, v8)&& (v9 = objc_msgSend(v7, "section"), v9 == v13))
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PUIPhotosPrivacyController;
    v10 = -[PUIPhotosPrivacyController tableView:shouldHighlightRowAtIndexPath:](&v12, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
  }

  return v10;
}

- (NSSet)photosReadWriteAllowedAppIDs
{
  return self->_photosReadWriteAllowedAppIDs;
}

- (void)setPhotosReadWriteAllowedAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photosReadWriteAllowedAppIDs, a3);
}

- (NSSet)photosReadWriteLimitedAppIDs
{
  return self->_photosReadWriteLimitedAppIDs;
}

- (void)setPhotosReadWriteLimitedAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photosReadWriteLimitedAppIDs, a3);
}

- (NSSet)photosReadWriteDeniedAppIDs
{
  return self->_photosReadWriteDeniedAppIDs;
}

- (void)setPhotosReadWriteDeniedAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photosReadWriteDeniedAppIDs, a3);
}

- (NSSet)photosAddOnlyAllowedAppIDs
{
  return self->_photosAddOnlyAllowedAppIDs;
}

- (void)setPhotosAddOnlyAllowedAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photosAddOnlyAllowedAppIDs, a3);
}

- (NSSet)photosAddOnlyDeniedAppIDs
{
  return self->_photosAddOnlyDeniedAppIDs;
}

- (void)setPhotosAddOnlyDeniedAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photosAddOnlyDeniedAppIDs, a3);
}

- (NSSet)pickerUsageAppIDs
{
  return self->_pickerUsageAppIDs;
}

- (void)setPickerUsageAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pickerUsageAppIDs, a3);
}

- (NSSet)photosReadWriteAllowedOrLimitedAppIDs
{
  return self->_photosReadWriteAllowedOrLimitedAppIDs;
}

- (void)setPhotosReadWriteAllowedOrLimitedAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photosReadWriteAllowedOrLimitedAppIDs, a3);
}

- (NSSet)photosReadWriteAllAppIDs
{
  return self->_photosReadWriteAllAppIDs;
}

- (void)setPhotosReadWriteAllAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photosReadWriteAllAppIDs, a3);
}

- (NSSet)photosAddOnlyAllAppIDs
{
  return self->_photosAddOnlyAllAppIDs;
}

- (void)setPhotosAddOnlyAllAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photosAddOnlyAllAppIDs, a3);
}

- (NSSet)photosAllAppIDs
{
  return self->_photosAllAppIDs;
}

- (void)setPhotosAllAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photosAllAppIDs, a3);
}

- (NSArray)allAppSpecifiers
{
  return self->_allAppSpecifiers;
}

- (void)setAllAppSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allAppSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_photosAllAppIDs, 0);
  objc_storeStrong((id *)&self->_photosAddOnlyAllAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteAllAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteAllowedOrLimitedAppIDs, 0);
  objc_storeStrong((id *)&self->_pickerUsageAppIDs, 0);
  objc_storeStrong((id *)&self->_photosAddOnlyDeniedAppIDs, 0);
  objc_storeStrong((id *)&self->_photosAddOnlyAllowedAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteDeniedAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteLimitedAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteAllowedAppIDs, 0);
}

- (void)_setPhotosStatus:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB1FB000, a2, OS_LOG_TYPE_ERROR, "Unexpected value set for photos tcc access: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end

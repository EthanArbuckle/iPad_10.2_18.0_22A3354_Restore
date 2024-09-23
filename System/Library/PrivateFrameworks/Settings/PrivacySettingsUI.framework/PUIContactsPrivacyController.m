@implementation PUIContactsPrivacyController

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIContactsPrivacyController;
  -[PUIContactsPrivacyController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUIContactsPrivacyController provideNavigationDonations](self, "provideNavigationDonations");
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
  PUI_BundleForPrivacySettingsFramework();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("CONTACTS"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/CONTACTS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIContactsPrivacyController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.privacy"), v7, v11, v12);

}

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PUIContactsPrivacyController isServiceRestricted:](PUIContactsPrivacyController, "isServiceRestricted:", *MEMORY[0x1E0DB10D0]) ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PUIContactsPrivacyController contactsAppSpecifiers](self, "contactsAppSpecifiers");
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

- (void)updateContactsAuthorizationStates
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
  v3 = *MEMORY[0x1E0DB10D0];
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
  v26 = __PUIContactsAuthorizationStatesForService_block_invoke;
  v27 = &unk_1EA26C208;
  v10 = v6;
  v28 = v10;
  v11 = v7;
  v29 = v11;
  v12 = v8;
  v30 = v12;
  v31 = v3;
  tcc_server_message_get_authorization_records_by_service();
  v13 = (id)objc_msgSend(v10, "copy");
  v14 = (id)objc_msgSend(v11, "copy");
  if (v12)
    v15 = (id)objc_msgSend(v12, "copy");
  else
    v15 = 0;

  v16 = v13;
  v17 = v14;
  v18 = v15;
  -[PUIContactsPrivacyController setContactsFullAccessAllowedAppIDs:](self, "setContactsFullAccessAllowedAppIDs:", v16);
  -[PUIContactsPrivacyController setContactsLimitedAccessAppIDs:](self, "setContactsLimitedAccessAppIDs:", v17);

  -[PUIContactsPrivacyController setContactsDeniedAppIDs:](self, "setContactsDeniedAppIDs:", v18);
  -[PUIContactsPrivacyController contactsFullAccessAllowedAppIDs](self, "contactsFullAccessAllowedAppIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIContactsPrivacyController contactsLimitedAccessAppIDs](self, "contactsLimitedAccessAppIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObjectsFromSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIContactsPrivacyController contactsDeniedAppIDs](self, "contactsDeniedAppIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setByAddingObjectsFromSet:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIContactsPrivacyController setContactsAllAppIDs:](self, "setContactsAllAppIDs:", v23);

  bundleIdentifiersWithPickerAccess();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIContactsPrivacyController setPickerUsageAppIDs:](self, "setPickerUsageAppIDs:", v24);

}

- (void)_setContactsTCCStatus:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  _WORD v16[17];

  *(_QWORD *)&v16[13] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("appBundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "intValue");

  if (v8 > 4)
    v9 = CFSTR("unsupported");
  else
    v9 = off_1EA26C228[(int)v8];
  _PUILoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v7;
    v15 = 1024;
    *(_DWORD *)v16 = v8;
    v16[2] = 2112;
    *(_QWORD *)&v16[3] = v9;
    _os_log_impl(&dword_1DB1FB000, v10, OS_LOG_TYPE_DEFAULT, "Selected contacts auth for app %@: %d(%@)", (uint8_t *)&v13, 0x1Cu);
  }

  _PUILoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 > 2)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v13 = 138412802;
      v14 = v7;
      v15 = 1024;
      *(_DWORD *)v16 = v8;
      v16[2] = 2112;
      *(_QWORD *)&v16[3] = v9;
      _os_log_fault_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_FAULT, "Unexpected value set for contacts tcc access for app %@: %d(%@)", (uint8_t *)&v13, 0x1Cu);
    }

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      *(_QWORD *)v16 = v9;
      _os_log_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_DEFAULT, "Setting contacts auth for app %@ to %@", (uint8_t *)&v13, 0x16u);
    }

    -[PUIContactsPrivacyController setTCCForService:appIdentifier:value:](self, "setTCCForService:appIdentifier:value:", *MEMORY[0x1E0DB10D0], v7, v8);
  }
  -[PUIContactsPrivacyController updateContactsAuthorizationStates](self, "updateContactsAuthorizationStates");
  -[PUIContactsPrivacyController reloadSpecifiers](self, "reloadSpecifiers");

}

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
  __CFString *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  _PUILoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a5 == 4)
  {
    if (v10)
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1DB1FB000, v9, OS_LOG_TYPE_DEFAULT, "Access level is picker only; Skipping for app: %@",
        (uint8_t *)&v12,
        0xCu);
    }
  }
  else
  {
    if (v10)
    {
      v12 = 138412802;
      v13 = a3;
      v14 = 2112;
      v15 = v8;
      v16 = 1024;
      v17 = a5;
      _os_log_impl(&dword_1DB1FB000, v9, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", (uint8_t *)&v12, 0x1Cu);
    }

    if (setTCCForService_appIdentifier_value__onceToken != -1)
      dispatch_once(&setTCCForService_appIdentifier_value__onceToken, &__block_literal_global_218);
    -[__CFString cStringUsingEncoding:](objc_retainAutorelease(v8), "cStringUsingEncoding:", 4);
    v9 = tcc_identity_create();
    tcc_service_singleton_for_CF_name();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    tcc_server_message_set_authorization_value();
    -[PUIContactsPrivacyController updateContactsAuthorizationStates](self, "updateContactsAuthorizationStates");

  }
}

void __69__PUIContactsPrivacyController_setTCCForService_appIdentifier_value___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)setTCCForService_appIdentifier_value__tccServer;
  setTCCForService_appIdentifier_value__tccServer = v0;

}

- (id)contactsStatus:(id)a3
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
  void *v13;
  int v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "propertyForKey:", CFSTR("appBundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIContactsPrivacyController contactsFullAccessAllowedAppIDs](self, "contactsFullAccessAllowedAppIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has full contacts access", (uint8_t *)&v17, 0xCu);
    }
    v8 = &unk_1EA27E660;
    goto LABEL_19;
  }
  -[PUIContactsPrivacyController contactsLimitedAccessAppIDs](self, "contactsLimitedAccessAppIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v4);

  if (v10)
  {
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has limited contacts access", (uint8_t *)&v17, 0xCu);
    }
    v8 = &unk_1EA27E648;
    goto LABEL_19;
  }
  -[PUIContactsPrivacyController contactsDeniedAppIDs](self, "contactsDeniedAppIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v4);

  if (v12)
  {
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has no access to contacts", (uint8_t *)&v17, 0xCu);
    }
LABEL_18:
    v8 = &unk_1EA27E678;
    goto LABEL_19;
  }
  -[PUIContactsPrivacyController pickerUsageAppIDs](self, "pickerUsageAppIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v4);

  _PUILoggingFacility();
  v15 = objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PUIContactsPrivacyController contactsStatus:].cold.1((uint64_t)v4, v7);
    goto LABEL_18;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has private access to contacts", (uint8_t *)&v17, 0xCu);
  }
  v8 = &unk_1EA27E690;
LABEL_19:

  return v8;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showContactsAccess:(BOOL)a5 showPickerUsage:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a6;
  v7 = a5;
  v10 = (void *)MEMORY[0x1E0D804E8];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel__setContactsTCCStatus_specifier_, sel_contactsStatus_, objc_opt_class(), 2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIdentifier:", v11);
  objc_msgSend(v13, "setProperty:forKey:", v11, CFSTR("appBundleID"));

  objc_msgSend(v13, "setProperty:forKey:", v12, CFSTR("appLocalizedDisplayName"));
  PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_AUTH_HEADER"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forKey:", v14, *MEMORY[0x1E0D80920]);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_NO_ACCESS_AUTHORIZATION"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

    objc_msgSend(v16, "addObject:", &unk_1EA27E678);
    objc_msgSend(v13, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasTCCOptions"));
    PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_LIMITED_ACCESS_AUTHORIZATION"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v18);

    objc_msgSend(v16, "addObject:", &unk_1EA27E648);
    PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_FULL_ACCESS_AUTHORIZATION"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v19);

    objc_msgSend(v16, "addObject:", &unk_1EA27E660);
  }
  if (v6)
  {
    PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_PICKER_ONLY_AUTHORIZATION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v20);

    objc_msgSend(v16, "addObject:", &unk_1EA27E690);
    objc_msgSend(v13, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasPickerInfo"));
  }
  objc_msgSend(v13, "setValues:titles:", v16, v15);

  return v13;
}

- (id)createSpecifiersWithCombinedPickerUsage
{
  void *v2;
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  __CFBundle *v12;
  __CFBundle *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  int v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v60;
  _BOOL4 v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  id v66;
  id v67;
  id v68;
  id *to;
  id *toa;
  uint64_t v71;
  void *v72;
  id obj;
  id v74;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  NSObject *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v60 = (int)*MEMORY[0x1E0D80590];
    -[PUIContactsPrivacyController updateContactsAuthorizationStates](self, "updateContactsAuthorizationStates");
    v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (_QWORD *)MEMORY[0x1E0DB10D0];
    TCCAccessCopyInformation();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = +[PUIContactsPrivacyController isServiceRestricted:](PUIContactsPrivacyController, "isServiceRestricted:", *v5);
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v89;
      to = (id *)*MEMORY[0x1E0D808C0];
      v66 = (id)*MEMORY[0x1E0D808D0];
      v64 = *MEMORY[0x1E0D80808];
      v9 = (_QWORD *)MEMORY[0x1E0DB1098];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v89 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          v12 = (__CFBundle *)objc_msgSend(v11, "objectForKey:", *v9);
          v13 = v12;
          if (v12)
          {
            CFBundleGetIdentifier(v12);
            v14 = objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v4, "containsObject:", v14) & 1) == 0)
            {
              objc_msgSend(v4, "addObject:", v14);
              PUIDisplayNameForApp(v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUIContactsPrivacyController contactsAllAppIDs](self, "contactsAllAppIDs");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "containsObject:", v14);

              -[PUIContactsPrivacyController pickerUsageAppIDs](self, "pickerUsageAppIDs");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "containsObject:", v14);

              if ((v17 | v19) == 1)
              {
                -[PUIContactsPrivacyController appSpecifierWithName:bundleID:showContactsAccess:showPickerUsage:](self, "appSpecifierWithName:bundleID:showContactsAccess:showPickerUsage:", v15, v14, v17, v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setProperty:forKey:", v14, to);
                objc_msgSend(v20, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v66);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v61);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setProperty:forKey:", v21, v64);

                objc_msgSend(v74, "addObject:", v20);
              }

            }
          }
          else
          {
            _PUILoggingFacility();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v93 = v11;
              _os_log_impl(&dword_1DB1FB000, v14, OS_LOG_TYPE_DEFAULT, "Contacts: TCCAccess skipping app with nil bundle for %@", buf, 0xCu);
            }
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
      }
      while (v7);
    }

    PUIGetActivePairedDevice();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62 && objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0D51858], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ScreenScale();
      v86 = 0u;
      v87 = 0u;
      if ((int)v23 == 2)
        v24 = 47;
      else
        v24 = 48;
      v65 = v24;
      v85 = 0uLL;
      v84 = 0uLL;
      -[PUIContactsPrivacyController contactsAllAppIDs](self, "contactsAllAppIDs");
      v67 = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
      if (v25)
      {
        v71 = *(_QWORD *)v85;
        v63 = *MEMORY[0x1E0D80808];
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v85 != v71)
              objc_enumerationMutation(v67);
            v27 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
            if ((objc_msgSend(v4, "containsObject:", v27) & 1) == 0)
            {
              objc_msgSend(v4, "addObject:", v27);
              PUIDisplayNameForWatchApp(v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28)
              {
                v29 = v27;
              }
              else
              {
                PUIWatchBundleIDForBundleID(v27);
                v29 = (id)objc_claimAutoreleasedReturnValue();
                PUIDisplayNameForWatchApp(v29);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
              }
              -[PUIContactsPrivacyController contactsAllAppIDs](self, "contactsAllAppIDs");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "containsObject:", v27);

              -[PUIContactsPrivacyController pickerUsageAppIDs](self, "pickerUsageAppIDs");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "containsObject:", v27);

              if (v28)
                v34 = v28;
              else
                v34 = v27;
              -[PUIContactsPrivacyController appSpecifierWithName:bundleID:showContactsAccess:showPickerUsage:](self, "appSpecifierWithName:bundleID:showContactsAccess:showPickerUsage:", v34, v27, v31, v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v61);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, v63);

              objc_initWeak((id *)buf, self);
              v81[0] = MEMORY[0x1E0C809B0];
              v81[1] = 3221225472;
              v81[2] = __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke;
              v81[3] = &unk_1EA26B5F0;
              v37 = v35;
              v82 = v37;
              objc_copyWeak(&v83, (id *)buf);
              objc_msgSend(v22, "getIconForBundleID:iconVariant:block:timeout:", v29, v65, v81, -1.0);
              objc_msgSend(v74, "addObject:", v37);
              objc_destroyWeak(&v83);

              objc_destroyWeak((id *)buf);
            }
          }
          v25 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
        }
        while (v25);
      }

    }
    bundleIdentifiersWithPickerAccess();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v38 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v78;
      toa = (id *)*MEMORY[0x1E0D808C0];
      v68 = (id)*MEMORY[0x1E0D808D0];
      v40 = *MEMORY[0x1E0D80808];
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v78 != v39)
            objc_enumerationMutation(v72);
          v42 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
          if ((objc_msgSend(v4, "containsObject:", v42) & 1) != 0)
          {
            _PUILoggingFacility();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v93 = v42;
              _os_log_impl(&dword_1DB1FB000, v43, OS_LOG_TYPE_DEFAULT, "Contacts: Skipping picker log: %@", buf, 0xCu);
            }
          }
          else
          {
            v76 = 0;
            objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithApplicationIdentifier:error:", v42, &v76);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v76;
            if (v44)
            {
              objc_msgSend(v44, "localizedName");
              v45 = objc_claimAutoreleasedReturnValue();
              -[PUIContactsPrivacyController appSpecifierWithName:bundleID:showContactsAccess:showPickerUsage:](self, "appSpecifierWithName:bundleID:showContactsAccess:showPickerUsage:", v45, v42, 0, 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setProperty:forKey:", v42, toa);
              objc_msgSend(v46, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v68);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v61);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setObject:forKeyedSubscript:", v47, v40);

              objc_msgSend(v74, "addObject:", v46);
            }
            else
            {
              _PUILoggingFacility();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v93 = v42;
                v94 = 2112;
                v95 = v43;
                _os_log_impl(&dword_1DB1FB000, v45, OS_LOG_TYPE_DEFAULT, "Contacts: Skipping picker log for app (%@) without bundle record with error: %@", buf, 0x16u);
              }
            }

          }
        }
        v38 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
      }
      while (v38);
    }
    objc_msgSend(v74, "sortUsingComparator:", &__block_literal_global_238);
    v48 = (void *)objc_msgSend(v74, "copy");
    -[PUIContactsPrivacyController setContactsAppSpecifiers:](self, "setContactsAppSpecifiers:", v48);

    v49 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setIdentifier:", CFSTR("CONTACTS_PRIVACY_FOOTER"));
    PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_PRIVACY_FOOTER"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = *MEMORY[0x1E0D80848];
    objc_msgSend(v50, "setProperty:forKey:", v51, *MEMORY[0x1E0D80848]);
    objc_msgSend(v49, "addObject:", v50);
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setProperty:forKey:", CFSTR("CONTACTS_PICKER_INFO_CELL"), *MEMORY[0x1E0D80868]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setProperty:forKey:", v54, *MEMORY[0x1E0D80938]);

    objc_msgSend(v53, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(v53, "setIdentifier:", CFSTR("CONTACTS_AVATAR_VIEW"));
    objc_msgSend(v49, "addObject:", v53);
    if (objc_msgSend(v74, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1EA26D430, 0, 0, 0, 0, 0, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setIdentifier:", CFSTR("CONTACTS_APP_GROUP"));
      objc_msgSend(v49, "addObject:", v55);
      objc_msgSend(v49, "addObjectsFromArray:", v74);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setIdentifier:", CFSTR("NO_APP_GROUP"));
      PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_NO_APP_FOOTER"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setProperty:forKey:", v56, v52);
      objc_msgSend(v49, "addObject:", v55);

    }
    v57 = *(Class *)((char *)&self->super.super.super.super.super.isa + v60);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v60) = (Class)v49;
    v58 = v49;

    v3 = *(id *)((char *)&self->super.super.super.super.super.isa + v60);
  }
  return v3;
}

void __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke(uint64_t a1, void *a2)
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
  block[2] = __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke_2;
  block[3] = &unk_1EA26B5C8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

}

void __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80870]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

uint64_t __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke_236(uint64_t a1, void *a2, void *a3)
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

- (id)accesssForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0D80990]);
}

- (void)setAccess:(id)a3 forSpecifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0D80990];
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x1E0D80990]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = objc_msgSend(v6, "propertyForKey:", CFSTR("appBundleID"));
    objc_msgSend(v5, "BOOLValue");
    TCCAccessSetForBundleId();
    objc_msgSend(v6, "setProperty:forKey:", v5, v7);
    _PUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1DB1FB000, v11, OS_LOG_TYPE_DEFAULT, "########### Quitting application (%@) in response to privacy settings change.", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (id)createSpecifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __CFBundle *v8;
  __CFBundle *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  id obj;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  id *to;
  void *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v56 = (int)*MEMORY[0x1E0D80590];
    v4 = (void *)TCCAccessCopyInformation();
    v72 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    if (v5)
    {
      to = *(id **)v81;
      v68 = *MEMORY[0x1E0D808C0];
      v65 = *MEMORY[0x1E0D80990];
      v67 = *MEMORY[0x1E0D808D0];
      v61 = *MEMORY[0x1E0D80780];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(id **)v81 != to)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          v8 = (__CFBundle *)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DB1098]);
          v9 = v8;
          if (v8)
          {
            CFBundleGetIdentifier(v8);
            v10 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "addObject:", v10);
            v11 = (void *)MEMORY[0x1E0D804E8];
            PUIDisplayNameForApp(v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel_setAccess_forSpecifier_, sel_accesssForSpecifier_, 0, 6, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "setIdentifier:", v10);
            objc_msgSend(v13, "setProperty:forKey:", v10, v68);
            objc_msgSend(v13, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v67);
            objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DB10A8]);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setProperty:forKey:", v14, v65);

            objc_msgSend(v13, "setProperty:forKey:", v10, CFSTR("appBundleID"));
            objc_msgSend(v13, "setProperty:forKey:", v10, CFSTR("PUITCCAccessControllerBundleIDKey"));
            -[PUIContactsPrivacyController specifier](self, "specifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              -[PUIContactsPrivacyController specifier](self, "specifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setProperty:forKey:", v18, v61);

            }
            -[PUIContactsPrivacyController specifier](self, "specifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellDelegateKey"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              -[PUIContactsPrivacyController specifier](self, "specifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellDelegateKey"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setProperty:forKey:", v22, CFSTR("PUITCCAccessControllerCellDelegateKey"));

            }
            objc_msgSend(v70, "addObject:", v13);

          }
          else
          {
            _PUILoggingFacility();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v7;
              _os_log_impl(&dword_1DB1FB000, v10, OS_LOG_TYPE_DEFAULT, "TCCAccess skipping app with nil bundle: %@", buf, 0xCu);
            }
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      }
      while (v5);
    }

    PUIGetActivePairedDevice();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57 && objc_opt_class())
    {
      v23 = (void *)MEMORY[0x1E0C99E60];
      v24 = (void *)TCCAccessCopyBundleIdentifiersForService();
      objc_msgSend(v23, "setWithArray:", v24);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0C99E60];
      v26 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
      objc_msgSend(v25, "setWithArray:", v26);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v66, "setByAddingObjectsFromSet:", v55);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D51858], "sharedInstance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      ScreenScale();
      if ((int)v28 == 2)
        v29 = 47;
      else
        v29 = 48;
      v62 = v29;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v69 = v27;
      v30 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v77;
        v60 = *MEMORY[0x1E0D80870];
        v59 = *MEMORY[0x1E0D80990];
        v58 = *MEMORY[0x1E0D80780];
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v77 != v31)
              objc_enumerationMutation(v69);
            v33 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v32);
            if ((objc_msgSend(v72, "containsObject:", v33) & 1) == 0)
            {
              objc_msgSend(v72, "addObject:", v33);
              PUIDisplayNameForWatchApp(v33);
              v34 = objc_claimAutoreleasedReturnValue();
              if (v34)
              {
                v35 = v33;
                v36 = (void *)MEMORY[0x1E0D804E8];
                goto LABEL_30;
              }
              PUIWatchBundleIDForBundleID(v33);
              v35 = objc_claimAutoreleasedReturnValue();
              PUIDisplayNameForWatchApp((void *)v35);
              v34 = objc_claimAutoreleasedReturnValue();
              if (!(v34 | v35))
                goto LABEL_36;
              v36 = (void *)MEMORY[0x1E0D804E8];
              v37 = v33;
              if (v34)
LABEL_30:
                v37 = (void *)v34;
              objc_msgSend(v36, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v37, self, sel__setContactsTCCStatus_specifier_, sel_contactsStatus_, 0, 6, 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setIdentifier:", v33);
              PSBlankIconImage();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setProperty:forKey:", v39, v60);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v66, "containsObject:", v33));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setProperty:forKey:", v40, v59);

              objc_msgSend(v38, "setProperty:forKey:", v33, CFSTR("appBundleID"));
              objc_msgSend(v38, "setProperty:forKey:", v33, CFSTR("PUITCCAccessControllerBundleIDKey"));
              -[PUIContactsPrivacyController specifier](self, "specifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
              {
                -[PUIContactsPrivacyController specifier](self, "specifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellClassKey"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "setProperty:forKey:", v44, v58);

              }
              -[PUIContactsPrivacyController specifier](self, "specifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellDelegateKey"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (v46)
              {
                -[PUIContactsPrivacyController specifier](self, "specifier");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("PUITCCAccessControllerCellDelegateKey"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "setProperty:forKey:", v48, CFSTR("PUITCCAccessControllerCellDelegateKey"));

              }
              objc_initWeak((id *)buf, self);
              v73[0] = MEMORY[0x1E0C809B0];
              v73[1] = 3221225472;
              v73[2] = __48__PUIContactsPrivacyController_createSpecifiers__block_invoke;
              v73[3] = &unk_1EA26B5F0;
              v49 = v38;
              v74 = v49;
              objc_copyWeak(&v75, (id *)buf);
              objc_msgSend(v64, "getIconForBundleID:iconVariant:block:timeout:", v35, v62, v73, -1.0);
              objc_msgSend(v70, "addObject:", v49);
              objc_destroyWeak(&v75);

              objc_destroyWeak((id *)buf);
            }
LABEL_36:
            ++v32;
          }
          while (v30 != v32);
          v50 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
          v30 = v50;
        }
        while (v50);
      }

    }
    objc_msgSend(v70, "sortUsingComparator:", &__block_literal_global_255);
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_FOOTER"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setProperty:forKey:", v52, *MEMORY[0x1E0D80848]);

    objc_msgSend(v70, "addObject:", v51);
    v53 = *(Class *)((char *)&self->super.super.super.super.super.isa + v56);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v56) = (Class)v70;

    -[PUIContactsPrivacyController updateSpecifiersForImposedSettings](self, "updateSpecifiersForImposedSettings");
    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v56);
  }
  return v3;
}

void __48__PUIContactsPrivacyController_createSpecifiers__block_invoke(uint64_t a1, void *a2)
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
  block[2] = __48__PUIContactsPrivacyController_createSpecifiers__block_invoke_2;
  block[3] = &unk_1EA26B5C8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

}

void __48__PUIContactsPrivacyController_createSpecifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80870]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

uint64_t __48__PUIContactsPrivacyController_createSpecifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
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

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (id)specifiers
{
  uint64_t v3;
  objc_class *v4;
  void *v5;

  v3 = (int)*MEMORY[0x1E0D80590];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    if (_os_feature_enabled_impl())
      -[PUIContactsPrivacyController createSpecifiersWithCombinedPickerUsage](self, "createSpecifiersWithCombinedPickerUsage");
    else
      -[PUIContactsPrivacyController createSpecifiers](self, "createSpecifiers");
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v4;

  }
  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (NSSet)contactsFullAccessAllowedAppIDs
{
  return self->_contactsFullAccessAllowedAppIDs;
}

- (void)setContactsFullAccessAllowedAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_contactsFullAccessAllowedAppIDs, a3);
}

- (NSSet)contactsLimitedAccessAppIDs
{
  return self->_contactsLimitedAccessAppIDs;
}

- (void)setContactsLimitedAccessAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_contactsLimitedAccessAppIDs, a3);
}

- (NSSet)contactsDeniedAppIDs
{
  return self->_contactsDeniedAppIDs;
}

- (void)setContactsDeniedAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_contactsDeniedAppIDs, a3);
}

- (NSSet)contactsAllAppIDs
{
  return self->_contactsAllAppIDs;
}

- (void)setContactsAllAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_contactsAllAppIDs, a3);
}

- (NSSet)pickerUsageAppIDs
{
  return self->_pickerUsageAppIDs;
}

- (void)setPickerUsageAppIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pickerUsageAppIDs, a3);
}

- (NSArray)contactsAppSpecifiers
{
  return self->_contactsAppSpecifiers;
}

- (void)setContactsAppSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_contactsAppSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_pickerUsageAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsAllAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsDeniedAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsLimitedAccessAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsFullAccessAllowedAppIDs, 0);
}

- (void)contactsStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB1FB000, a2, OS_LOG_TYPE_ERROR, "Unknown or unexpected status for contacts access, not in any array; Defaulting to denied: %@",
    (uint8_t *)&v2,
    0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end

@implementation PSContactsPolicyController

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
  __CFString *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a4;
  _PSLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a5 == 4)
  {
    if (v9)
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1A3819000, v8, OS_LOG_TYPE_DEFAULT, "Access level is picker only; Skipping for app: %@",
        (uint8_t *)&v11,
        0xCu);
    }
  }
  else
  {
    if (v9)
    {
      v11 = 138412802;
      v12 = a3;
      v13 = 2112;
      v14 = v7;
      v15 = 1024;
      v16 = a5;
      _os_log_impl(&dword_1A3819000, v8, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", (uint8_t *)&v11, 0x1Cu);
    }

    if (setTCCForService_appIdentifier_value__onceToken != -1)
      dispatch_once(&setTCCForService_appIdentifier_value__onceToken, &__block_literal_global_194);
    -[__CFString cStringUsingEncoding:](objc_retainAutorelease(v7), "cStringUsingEncoding:", 4);
    v8 = tcc_identity_create();
    tcc_service_singleton_for_CF_name();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    tcc_server_message_set_authorization_value();

  }
}

void __67__PSContactsPolicyController_setTCCForService_appIdentifier_value___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)setTCCForService_appIdentifier_value__tccServer;
  setTCCForService_appIdentifier_value__tccServer = v0;

}

- (id)contactsStatus:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "propertyForKey:", CFSTR("appBundleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DB10D0];
  v15 = 0;
  v16 = 0;
  v14 = 0;
  PSContactsAuthorizationStatesForService(v4, &v16, &v15, &v14);
  v5 = v16;
  v6 = v15;
  v7 = v14;
  bundleIdentifiersWithPickerAccess();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v3))
  {
    _PSLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "App %@ has full contacts access", buf, 0xCu);
    }
    v10 = &unk_1E4A92F28;
    goto LABEL_19;
  }
  if (objc_msgSend(v6, "containsObject:", v3))
  {
    _PSLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "App %@ has limited contacts access", buf, 0xCu);
    }
    v10 = &unk_1E4A92F10;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "containsObject:", v3))
  {
    _PSLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "App %@ has no access to contacts", buf, 0xCu);
    }
LABEL_18:
    v10 = &unk_1E4A92F40;
    goto LABEL_19;
  }
  v11 = objc_msgSend(v8, "containsObject:", v3);
  _PSLoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PSContactsPolicyController contactsStatus:].cold.1((uint64_t)v3, v9);
    goto LABEL_18;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v3;
    _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "App %@ has private access to contacts", buf, 0xCu);
  }
  v10 = &unk_1E4A92F58;
LABEL_19:

  return v10;
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
    v9 = off_1E4A67B78[(int)v8];
  _PSLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v7;
    v15 = 1024;
    *(_DWORD *)v16 = v8;
    v16[2] = 2112;
    *(_QWORD *)&v16[3] = v9;
    _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "Selected contacts auth for app %@: %d(%@)", (uint8_t *)&v13, 0x1Cu);
  }

  _PSLoggingFacility();
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
      _os_log_fault_impl(&dword_1A3819000, v12, OS_LOG_TYPE_FAULT, "Unexpected value set for contacts tcc access for app %@: %d(%@)", (uint8_t *)&v13, 0x1Cu);
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
      _os_log_impl(&dword_1A3819000, v12, OS_LOG_TYPE_DEFAULT, "Setting contacts auth for app %@ to %@", (uint8_t *)&v13, 0x16u);
    }

    -[PSContactsPolicyController setTCCForService:appIdentifier:value:](self, "setTCCForService:appIdentifier:value:", *MEMORY[0x1E0DB10D0], v7, v8);
  }

}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0DB10D0];
  v20 = 0;
  v21 = 0;
  v19 = 0;
  PSContactsAuthorizationStatesForService(v8, &v21, &v20, &v19);
  v9 = v21;
  v10 = v20;
  v11 = v19;
  objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setByAddingObjectsFromSet:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  bundleIdentifiersWithPickerAccess();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v7);
  v16 = objc_msgSend(v14, "containsObject:", v7);
  if ((v15 & 1) != 0 || (v17 = 0, (_DWORD)v16))
  {
    -[PSContactsPolicyController appSpecifierWithName:bundleID:showContactsAccess:showPickerUsage:](self, "appSpecifierWithName:bundleID:showContactsAccess:showPickerUsage:", v6, v7, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showContactsAccess:(BOOL)a5 showPickerUsage:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
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

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel__setContactsTCCStatus_specifier_, sel_contactsStatus_, objc_opt_class(), 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 1, 0);
  objc_msgSend(v12, "setIdentifier:", v10);
  objc_msgSend(v12, "setProperty:forKey:", v10, CFSTR("appBundleID"));

  objc_msgSend(v13, "localizedName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v14, CFSTR("appLocalizedDisplayName"));

  PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_AUTH_HEADER"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v15, CFSTR("staticHeaderText"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_NO_ACCESS_AUTHORIZATION"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

    objc_msgSend(v17, "addObject:", &unk_1E4A92F40);
    objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasTCCOptions"));
    PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_LIMITED_ACCESS_AUTHORIZATION"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

    objc_msgSend(v17, "addObject:", &unk_1E4A92F10);
    PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_FULL_ACCESS_AUTHORIZATION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v20);

    objc_msgSend(v17, "addObject:", &unk_1E4A92F28);
  }
  if (v6)
  {
    PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_PICKER_ONLY_AUTHORIZATION"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v21);

    objc_msgSend(v17, "addObject:", &unk_1E4A92F58);
    objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasPickerInfo"));
  }
  objc_msgSend(v12, "setValues:titles:", v17, v16);

  return v12;
}

- (void)contactsStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A3819000, a2, OS_LOG_TYPE_ERROR, "Unknown or unexpected status for contacts access, not in any array; Defaulting to denied: %@",
    (uint8_t *)&v2,
    0xCu);
  OUTLINED_FUNCTION_11();
}

@end

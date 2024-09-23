@implementation PSCalendarPolicyController

+ (id)loadPrivacySettingsBundle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB34D0];
  SFRuntimeAbsoluteFilePathForPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "load");
  return v4;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = 0;
  v16 = 0;
  PSCalendarAuthorizationStates(&v18, &v17, &v16);
  v8 = v18;
  v9 = v17;
  v10 = v16;
  if ((objc_msgSend(v8, "containsObject:", v7) & 1) != 0
    || (objc_msgSend(v9, "containsObject:", v7) & 1) != 0
    || objc_msgSend(v10, "containsObject:", v7))
  {
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel_setCalendarStatus_specifier_, sel_calendarStatus_, objc_opt_class(), 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
    objc_msgSend(v11, "setProperty:forKey:", v7, CFSTR("BUNDLE_ID"));
    objc_msgSend(v11, "setProperty:forKey:", v7, CFSTR("APP_NAME"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("enabled"));
    objc_msgSend(v11, "setProperty:forKey:", v7, CFSTR("id"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobilecal"), CFSTR("appIDForLazyIcon"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (appSpecifierWithName_bundleID__onceToken != -1)
      dispatch_once(&appSpecifierWithName_bundleID__onceToken, &__block_literal_global_13);
    objc_msgSend(v13, "addObject:", appSpecifierWithName_bundleID__noAccessStr);
    objc_msgSend(v14, "addObject:", &unk_1E4A92E80);
    objc_msgSend(v13, "addObject:", appSpecifierWithName_bundleID__writeAccessStr);
    objc_msgSend(v14, "addObject:", &unk_1E4A92E50);
    objc_msgSend(v13, "addObject:", appSpecifierWithName_bundleID__fullAccessStr);
    objc_msgSend(v14, "addObject:", &unk_1E4A92E68);
    objc_msgSend(v11, "setValues:titles:", v14, v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __60__PSCalendarPolicyController_appSpecifierWithName_bundleID___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[PSCalendarPolicyController loadPrivacySettingsBundle](PSCalendarPolicyController, "loadPrivacySettingsBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CALENDARS_FULL_ACCESS_AUTHORIZATION"), &stru_1E4A69238, CFSTR("Privacy"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appSpecifierWithName_bundleID__fullAccessStr;
  appSpecifierWithName_bundleID__fullAccessStr = v0;

  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CALENDARS_WRITE_ONLY_ACCESS_AUTHORIZATION"), &stru_1E4A69238, CFSTR("Privacy"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)appSpecifierWithName_bundleID__writeAccessStr;
  appSpecifierWithName_bundleID__writeAccessStr = v2;

  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CALENDARS_NO_ACCESS_AUTHORIZATION"), &stru_1E4A69238, CFSTR("Privacy"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)appSpecifierWithName_bundleID__noAccessStr;
  appSpecifierWithName_bundleID__noAccessStr = v4;

}

- (id)calendarStatus:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  id v17;
  id v18;

  objc_msgSend(a3, "propertyForKey:", CFSTR("BUNDLE_ID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = 0;
  v16 = 0;
  PSCalendarAuthorizationStates(&v18, &v17, &v16);
  v4 = v18;
  v5 = v17;
  v6 = v16;
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) != 0)
  {
    v7 = &unk_1E4A92E68;
  }
  else if ((objc_msgSend(v5, "containsObject:", v3) & 1) != 0)
  {
    v7 = &unk_1E4A92E50;
  }
  else
  {
    if ((objc_msgSend(v6, "containsObject:", v3) & 1) == 0)
    {
      _PSLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PSCalendarPolicyController calendarStatus:].cold.1((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);

    }
    v7 = &unk_1E4A92E80;
  }

  return v7;
}

- (void)setCalendarStatus:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("BUNDLE_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "intValue") == 2)
  {
    _PSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "Requesting to set calendar auth for app %@ to full", (uint8_t *)&v15, 0xCu);
    }

    v8 = v6;
    v9 = 2;
    v10 = 1;
  }
  else
  {
    if (objc_msgSend(v5, "intValue") == 1)
    {
      _PSLoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v6;
        _os_log_impl(&dword_1A3819000, v11, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to write-only", (uint8_t *)&v15, 0xCu);
      }

      v8 = v6;
      v9 = 1;
    }
    else
    {
      v12 = objc_msgSend(v5, "intValue");
      _PSLoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          v15 = 138412290;
          v16 = v5;
          _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected value set for calendar tcc access: %@", (uint8_t *)&v15, 0xCu);
        }

        v8 = v6;
        v9 = 3;
      }
      else
      {
        if (v14)
        {
          v15 = 138412290;
          v16 = v6;
          _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to denied", (uint8_t *)&v15, 0xCu);
        }

        v8 = v6;
        v9 = 0;
      }
    }
    v10 = 0;
  }
  +[PSCalendarPolicyController setCalendarAccessForApp:toValue:shouldPrompt:](PSCalendarPolicyController, "setCalendarAccessForApp:toValue:shouldPrompt:", v8, v9, v10);

}

+ (unint64_t)authorizationRightforAccessLevel:(int)a3
{
  if ((a3 - 1) > 2)
    return 0;
  else
    return qword_1A38ECDD0[a3 - 1];
}

+ (void)setCalendarAccessForApp:(id)a3 toValue:(int)a4 shouldPrompt:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (setCalendarAccessForApp_toValue_shouldPrompt__onceToken != -1)
    dispatch_once(&setCalendarAccessForApp_toValue_shouldPrompt__onceToken, &__block_literal_global_64);
  _PSLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)*MEMORY[0x1E0DB10E8];
    *(_DWORD *)buf = 138412802;
    v21 = v10;
    v22 = 2112;
    v23 = v8;
    v24 = 1024;
    v25 = v6;
    _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
  }

  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v11, "cStringUsingEncoding:", 4);
  v12 = (void *)tcc_identity_create();
  tcc_service_singleton_for_CF_name();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSCalendarPolicyController authorizationRightforAccessLevel:](PSCalendarPolicyController, "authorizationRightforAccessLevel:", v6);
  if (v5)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__PSCalendarPolicyController_setCalendarAccessForApp_toValue_shouldPrompt___block_invoke_65;
    v17[3] = &unk_1E4A66938;
    v19 = a1;
    v14 = v11;
    v18 = v14;
    v15 = (void *)MEMORY[0x1A8594D10](v17);
    _PSLoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_1A3819000, v16, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to full, after prompt", buf, 0xCu);
    }

    tcc_server_message_prompt_authorization_value();
  }
  else
  {
    tcc_server_message_set_authorization_value();
  }

}

void __75__PSCalendarPolicyController_setCalendarAccessForApp_toValue_shouldPrompt___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)setCalendarAccessForApp_toValue_shouldPrompt__tccServer;
  setCalendarAccessForApp_toValue_shouldPrompt__tccServer = v0;

}

void __75__PSCalendarPolicyController_setCalendarAccessForApp_toValue_shouldPrompt___block_invoke_65(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("PSCalendarPrivacyUpgradePromptAppIdentifierKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PSCalendarPrivacyUpgradePromptCompletedNotification"), v4, v5);

}

- (void)calendarStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1A3819000, a2, a3, "unknown state for %@, treating as denied", a5, a6, a7, a8, 2u);
}

@end

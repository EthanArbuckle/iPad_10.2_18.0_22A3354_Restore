@implementation PSPhotosPolicyController

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)TCCAccessCopyBundleIdentifiersForService();
  v8 = (void *)TCCAccessCopyBundleIdentifiersForService();
  v9 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
  v10 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
  if ((objc_msgSend(v7, "containsObject:", v6) & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(v9, "containsObject:", v6);
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(v10, "containsObject:", v6);
  if (_os_feature_enabled_impl())
  {
    PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v6);

  }
  else
  {
    v14 = 0;
  }
  if (((v11 | v12) & 1) != 0 || (_DWORD)v14)
  {
    -[PSPhotosPolicyController appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:](self, "appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:", v5, v6, v12, v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showPhotosAccess:(BOOL)a5 showPhotosAddAccess:(BOOL)a6
{
  return -[PSPhotosPolicyController appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:](self, "appSpecifierWithName:bundleID:showPhotosAccess:showPhotosAddAccess:showPickerUsage:", a3, a4, a5, a6, 0);
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showPhotosAccess:(BOOL)a5 showPhotosAddAccess:(BOOL)a6 showPickerUsage:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  _BOOL4 v24;

  v24 = a7;
  v7 = a6;
  v8 = a5;
  v11 = a4;
  v12 = a3;
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel__setPhotosStatus_specifier_, sel__photosStatus_, objc_opt_class(), 2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setIdentifier:", v11);
  objc_msgSend(v13, "setProperty:forKey:", v11, CFSTR("appBundleID"));

  if (_os_feature_enabled_impl())
    v14 = CFSTR("PHOTOS_AUTH_ONGOING_HEADER");
  else
    v14 = CFSTR("PHOTOS_AUTH_HEADER");
  PS_LocalizedStringForSystemPolicy(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forKey:", v15, CFSTR("staticHeaderText"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || v7)
  {
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_NO_ACCESS_AUTHORIZATION"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v22);

    objc_msgSend(v17, "addObject:", &unk_1E4A93000);
    objc_msgSend(v13, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasTCCOptions"));
    if (v7)
    {
      PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_ADD_ONLY_AUTHORIZATION"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v23);

      objc_msgSend(v17, "addObject:", &unk_1E4A93018);
      if (!v8)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  if (v8)
  {
LABEL_7:
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_LIMITED_AUTHORIZATION"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

    objc_msgSend(v17, "addObject:", &unk_1E4A93030);
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_FULL_AUTHORIZATION"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

    objc_msgSend(v17, "addObject:", &unk_1E4A93048);
  }
LABEL_8:
  if (_os_feature_enabled_impl() && v24)
  {
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_ONLY_AUTHORIZATION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v20);

    objc_msgSend(v17, "addObject:", &unk_1E4A93060);
    objc_msgSend(v13, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasPickerInfo"));
  }
  objc_msgSend(v13, "setValues:titles:", v17, v16);

  return v13;
}

- (void)_setPhotosStatus:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  PSPhotosPolicyController *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("appBundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t *)MEMORY[0x1E0DB1190];
  v9 = *MEMORY[0x1E0DB1190];
  v23 = 0;
  -[PSPhotosPolicyController getAuthorizationStatesForService:allowedArray:limitedArray:deniedArray:](self, "getAuthorizationStatesForService:allowedArray:limitedArray:deniedArray:", v9, &v23, 0, 0);
  v10 = v23;
  v11 = (uint64_t *)MEMORY[0x1E0DB1188];
  v12 = *MEMORY[0x1E0DB1188];
  v21 = 0;
  v22 = 0;
  -[PSPhotosPolicyController getAuthorizationStatesForService:allowedArray:limitedArray:deniedArray:](self, "getAuthorizationStatesForService:allowedArray:limitedArray:deniedArray:", v12, &v22, &v21, 0);
  v13 = v22;
  v14 = v21;
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "intValue") == 2)
  {
    v16 = *v11;
    v17 = self;
    v18 = v7;
    v19 = 2;
LABEL_15:
    -[PSPhotosPolicyController setTCCForService:appIdentifier:value:](v17, "setTCCForService:appIdentifier:value:", v16, v18, v19);
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "intValue") == 1)
  {
    if (objc_msgSend(v15, "containsObject:", v7))
      -[PSPhotosPolicyController setTCCForService:appIdentifier:value:](self, "setTCCForService:appIdentifier:value:", *v11, v7, 0);
    v16 = *v8;
    v17 = self;
    v18 = v7;
    v19 = 1;
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "intValue") == 3)
  {
    v16 = *v11;
    v17 = self;
    v18 = v7;
    v19 = 3;
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "intValue") && objc_msgSend(v6, "intValue") != 4)
  {
    _PSLoggingFacility();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PSPhotosPolicyController _setPhotosStatus:specifier:].cold.1((uint64_t)v6, v20);

  }
  else
  {
    if (objc_msgSend(v15, "containsObject:", v7))
      -[PSPhotosPolicyController setTCCForService:appIdentifier:value:](self, "setTCCForService:appIdentifier:value:", *v11, v7, 0);
    if (objc_msgSend(v10, "containsObject:", v7))
    {
      v16 = *v8;
      v17 = self;
      v18 = v7;
      v19 = 0;
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (id)_photosStatus:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v14;
  id v15;
  id v16;

  objc_msgSend(a3, "propertyForKey:", CFSTR("appBundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DB1190];
  v16 = 0;
  -[PSPhotosPolicyController getAuthorizationStatesForService:allowedArray:limitedArray:deniedArray:](self, "getAuthorizationStatesForService:allowedArray:limitedArray:deniedArray:", v5, &v16, 0, 0);
  v6 = v16;
  v7 = *MEMORY[0x1E0DB1188];
  v14 = 0;
  v15 = 0;
  -[PSPhotosPolicyController getAuthorizationStatesForService:allowedArray:limitedArray:deniedArray:](self, "getAuthorizationStatesForService:allowedArray:limitedArray:deniedArray:", v7, &v15, &v14, 0);
  v8 = v15;
  v9 = v14;
  if ((objc_msgSend(v8, "containsObject:", v4) & 1) != 0)
  {
    v10 = &unk_1E4A93048;
  }
  else if ((objc_msgSend(v9, "containsObject:", v4) & 1) != 0)
  {
    v10 = &unk_1E4A93030;
  }
  else if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v10 = &unk_1E4A93018;
  }
  else if (_os_feature_enabled_impl()
         && (PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage(),
             v11 = (void *)objc_claimAutoreleasedReturnValue(),
             v12 = objc_msgSend(v11, "containsObject:", v4),
             v11,
             (v12 & 1) != 0))
  {
    v10 = &unk_1E4A93060;
  }
  else
  {
    v10 = &unk_1E4A93000;
  }

  return v10;
}

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
  -[PSPhotosPolicyController setTCCForService:appIdentifier:value:completion:](self, "setTCCForService:appIdentifier:value:completion:", a3, a4, *(_QWORD *)&a5, 0);
}

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5 completion:(id)a6
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
  _QWORD v24[5];
  id v25;
  void (**v26)(_QWORD);
  _BYTE buf[24];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  if (setTCCForService_appIdentifier_value_completion__onceToken != -1)
    dispatch_once(&setTCCForService_appIdentifier_value_completion__onceToken, &__block_literal_global_134);
  _PSLoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    v28 = a5;
    _os_log_impl(&dword_1A3819000, v12, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
  }

  v13 = objc_retainAutorelease(v10);
  objc_msgSend(v13, "cStringUsingEncoding:", 4);
  v14 = (void *)tcc_identity_create();
  tcc_service_singleton_for_CF_name();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  if ((a5 - 1) <= 2)
    v16 = qword_1A38ECEF0[a5 - 1];
  v17 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0DB1188]);
  if (a5 != 2 || !v17)
    goto LABEL_15;
  if (!TCCLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E4A68678;
    *(_QWORD *)&buf[16] = 0;
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (TCCLibraryCore_frameworkLibrary && gettcc_server_message_prompt_authorization_valueSymbolLoc())
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke_135;
    v24[3] = &unk_1E4A68628;
    v24[4] = self;
    v25 = v13;
    v26 = v11;
    v18 = (void *)MEMORY[0x1A8594D10](v24);
    v19 = (id)setTCCForService_appIdentifier_value_completion__tccServer;
    v20 = v14;
    v21 = v15;
    v22 = v18;
    v23 = (void (*)(id, _QWORD, id, id, _QWORD, uint64_t, id))gettcc_server_message_prompt_authorization_valueSymbolLoc();
    if (!v23)
      PSPNCreateFormattedStringWithCountry_cold_1();
    v23(v19, 0, v20, v21, 0, v16, v22);

  }
  else
  {
LABEL_15:
    tcc_server_message_set_authorization_value();
    if (v11)
      v11[2](v11);
  }

}

void __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)setTCCForService_appIdentifier_value_completion__tccServer;
  setTCCForService_appIdentifier_value_completion__tccServer = v0;

}

void __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke_135(uint64_t a1)
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
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = CFSTR("PUIPhotosPrivacyUpgradePromptAppIdentifierKey");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PUIPhotosPrivacyUpgradePromptCompletedNotification"), v4, v5);

  if (*(_QWORD *)(a1 + 48))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke_2;
    v6[3] = &unk_1E4A65708;
    v7 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAuthorizationStatesForService:(__CFString *)a3 allowedArray:(id *)a4 limitedArray:(id *)a5 deniedArray:(id *)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = (void *)tcc_server_create();
  tcc_service_singleton_for_CF_name();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _PSLoggingFacility();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = a3;
    _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", buf, 0xCu);
  }

  v16 = v12;
  v17 = v13;
  v18 = v14;
  tcc_server_message_get_authorization_records_by_service();
  if (a4)
    *a4 = objc_retainAutorelease(v16);
  if (a5)
    *a5 = objc_retainAutorelease(v17);
  if (a6)
    *a6 = objc_retainAutorelease(v18);

}

void __99__PSPhotosPolicyController_getAuthorizationStatesForService_allowedArray_limitedArray_deniedArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t authorization_right;
  void *v8;
  id *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    tcc_authorization_record_get_subject_identity();
    v6 = objc_claimAutoreleasedReturnValue();
    authorization_right = tcc_authorization_record_get_authorization_right();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", tcc_identity_get_identifier(), 4);
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          v9 = (id *)(a1 + 48);
          goto LABEL_14;
        case 3:
          v9 = (id *)(a1 + 40);
          goto LABEL_14;
        case 2:
          v9 = (id *)(a1 + 32);
LABEL_14:
          objc_msgSend(*v9, "addObject:", v8);
          break;
      }
    }

    goto LABEL_16;
  }
  _PSLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __PSContactsAuthorizationStatesForService_block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 56);
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_16:

}

- (void)_setPhotosStatus:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A3819000, a2, OS_LOG_TYPE_ERROR, "Unexpected value set for photos tcc access: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_11();
}

@end

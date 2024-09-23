@implementation TITypologyProfileOptInManager

- (BOOL)_isProfileInstalledAndUserEnabled
{
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  void *v11;
  void *v12;
  void *v13;
  TITypologyProfileState *v14;
  void *v15;
  TITypologyProfileState *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  int v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", 54);

  TITypologyDiagnosticExtensionOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!v4)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@"), "-[TITypologyProfileOptInManager _isProfileInstalledAndUserEnabled]", CFSTR("CustomerTypologyEnabledByDiagnosticExtension is false"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v31;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    if (-[TITypologyProfileOptInManager isTypologyProfileInstalled](self, "isTypologyProfileInstalled"))
    {
      TITypologyProfileStateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEFAULT, "Profile installed. Checking for elgibility and opt-in.", buf, 2u);
      }

      if (-[TITypologyProfileOptInManager devicePasscodeSet](self, "devicePasscodeSet"))
      {
        TITypologyProfileStateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "Not eligible for profile (passcode)";
LABEL_18:
          _os_log_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (-[TITypologyProfileOptInManager iCloudAccountAvailable](self, "iCloudAccountAvailable"))
      {
        TITypologyProfileStateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "Not eligible for profile (icloud)";
          goto LABEL_18;
        }
LABEL_19:

        goto LABEL_20;
      }
      -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        +[TITypologyProfileState typologyProfileStateFromPersistedState](TITypologyProfileState, "typologyProfileStateFromPersistedState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypologyProfileOptInManager setTypologyProfileState:](self, "setTypologyProfileState:", v12);

      }
      -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = [TITypologyProfileState alloc];
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[TITypologyProfileState initWithProfileInstallationDate:](v14, "initWithProfileInstallationDate:", v15);
        -[TITypologyProfileOptInManager setTypologyProfileState:](self, "setTypologyProfileState:", v16);

        -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "persistState");

      }
      -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        TITypologyProfileStateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_ERROR, "Failed to instantiate typology profile state.", buf, 2u);
        }
        goto LABEL_19;
      }
      -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userResponse");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("Enable"));

      -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v21)
      {
        objc_msgSend(v22, "userNotificationDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dateByAddingTimeInterval:", 259200.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v5 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "laterDate:", v5);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        TITypologyProfileStateLog();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        LOBYTE(v5) = v26 == v25;
        if (v26 == v25)
        {
          if (v28)
          {
            *(_WORD *)buf = 0;
            v29 = "User opted-in.";
            goto LABEL_44;
          }
        }
        else if (v28)
        {
          *(_WORD *)buf = 0;
          v29 = "User opted-in, but opt-in has expired.";
LABEL_44:
          _os_log_impl(&dword_1DA6F2000, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
        }

        return (char)v5;
      }
      objc_msgSend(v22, "userResponse");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("NotNow"));

      -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v33)
      {
        objc_msgSend(v34, "userNotificationDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "dateByAddingTimeInterval:", 600.0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "earlierDate:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        TITypologyProfileStateLog();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
        if (v39 == v37)
        {
          if (v41)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA6F2000, v40, OS_LOG_TYPE_DEFAULT, "User deferred opt-in. Time to ask again.", buf, 2u);
          }

          -[TITypologyProfileOptInManager _askUserToAllow](self, "_askUserToAllow");
        }
        else
        {
          if (v41)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA6F2000, v40, OS_LOG_TYPE_DEFAULT, "User deferred opt-in. Not time to ask again.", buf, 2u);
          }

        }
        goto LABEL_20;
      }
      objc_msgSend(v34, "userResponse");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("None"));

      if (v43)
      {
        TITypologyProfileStateLog();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA6F2000, v44, OS_LOG_TYPE_DEFAULT, "User has not been asked to opt-in. Asking now.", buf, 2u);
        }

        -[TITypologyProfileOptInManager _askUserToAllow](self, "_askUserToAllow");
        goto LABEL_20;
      }
      -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "userResponse");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("Disabled"));

      if (v47)
      {
        TITypologyProfileStateLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_WORD *)buf = 0;
        v9 = "User opted-out.";
        goto LABEL_18;
      }
    }
    else
    {
      -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
      v5 = objc_claimAutoreleasedReturnValue();

      if (!v5)
        return (char)v5;
      -[TITypologyProfileOptInManager setTypologyProfileState:](self, "setTypologyProfileState:", 0);
      +[TITypologyProfileState removePersistedState](TITypologyProfileState, "removePersistedState");
    }
LABEL_20:
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@"), "-[TITypologyProfileOptInManager _isProfileInstalledAndUserEnabled]", CFSTR("CustomerTypologyEnabledByDiagnosticExtension is true"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v30;
    _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  LOBYTE(v5) = 1;
  return (char)v5;
}

- (TITypologyProfileState)typologyProfileState
{
  return self->_typologyProfileState;
}

- (BOOL)isTypologyProfileInstalled
{
  void *v2;
  void *v3;

  if (TIGetTypologyEnabledByProfileValue_onceToken != -1)
    dispatch_once(&TIGetTypologyEnabledByProfileValue_onceToken, &__block_literal_global_7931);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForPreferenceKey:", CFSTR("TypologyEnabledByProfile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (BOOL)devicePasscodeSet
{
  unsigned int (*v2)(_QWORD);
  TITypologyProfileOptInManager *v4;
  SEL v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (unsigned int (*)(_QWORD))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v10 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v6[3] = &unk_1EA107058;
    v6[4] = &v7;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (unsigned int (*)(_QWORD))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return v2(0) != 3;
  dlerror();
  v4 = (TITypologyProfileOptInManager *)abort_report_np();
  return -[TITypologyProfileOptInManager iCloudAccountAvailable](v4, v5);
}

- (BOOL)iCloudAccountAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ubiquityIdentityToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_askUserToAllow
{
  NSObject *v3;
  TITypologyProfileState *v4;
  void *v5;
  void *v6;
  void *v7;
  TITypologyProfileState *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  TITypologyProfileStateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEFAULT, "Prompting user to opt-in.", buf, 2u);
  }

  v4 = [TITypologyProfileState alloc];
  -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileInstallationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TITypologyProfileState initWithProfileInstallationDate:userNotificationDate:userResponse:](v4, "initWithProfileInstallationDate:userNotificationDate:userResponse:", v6, v7, CFSTR("None"));
  -[TITypologyProfileOptInManager setTypologyProfileState:](self, "setTypologyProfileState:", v8);

  -[TITypologyProfileOptInManager typologyProfileState](self, "typologyProfileState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistState");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__TITypologyProfileOptInManager__askUserToAllow__block_invoke;
  v10[3] = &unk_1EA0FFEA8;
  v10[4] = self;
  -[TITypologyProfileOptInManager presentDialogForType:withCompletionHandler:](self, "presentDialogForType:withCompletionHandler:", 0, v10);
}

- (TITypologyProfileOptInManager)init
{
  TITypologyProfileOptInManager *v2;
  uint64_t v3;
  TITypologyProfileState *typologyProfileState;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TITypologyProfileOptInManager;
  v2 = -[TITypologyProfileOptInManager init](&v6, sel_init);
  if (v2)
  {
    +[TITypologyProfileState typologyProfileStateFromPersistedState](TITypologyProfileState, "typologyProfileStateFromPersistedState");
    v3 = objc_claimAutoreleasedReturnValue();
    typologyProfileState = v2->_typologyProfileState;
    v2->_typologyProfileState = (TITypologyProfileState *)v3;

  }
  return v2;
}

- (void)_launchVPNAndDeviceManagementSettings
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[objc_class defaultWorkspace](NSClassFromString(CFSTR("LSApplicationWorkspace")), "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=ManagedConfigurationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v3, 0, &v4);

}

- (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  TIDispatchAsync();

}

- (id)notificationDetailsForType:(int64_t)a3
{
  void *v3;
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

  if (a3)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "localizedStringForKey:", CFSTR("TYPOLOGY_PROFILE_OPT_IN_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "localizedStringForKey:", CFSTR("TYPOLOGY_PROFILE_OPT_IN_MESSAGE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "localizedStringForKey:", CFSTR("TYPOLOGY_PROFILE_OPT_IN_ENABLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "localizedStringForKey:", CFSTR("TYPOLOGY_PROFILE_OPT_IN_NOT_NOW"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "localizedStringForKey:", CFSTR("TYPOLOGY_PROFILE_OPT_IN_REMOVE_PROFILE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, *MEMORY[0x1E0C9B800]);
  objc_msgSend(v8, "setObject:forKey:", v3, *MEMORY[0x1E0C9B810]);
  objc_msgSend(v8, "setObject:forKey:", v6, *MEMORY[0x1E0C9B838]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("DismissOnLock"));

  if (v5)
    objc_msgSend(v8, "setObject:forKey:", v5, *MEMORY[0x1E0C9B868]);
  if (v4)
    objc_msgSend(v8, "setObject:forKey:", v4, *MEMORY[0x1E0C9B830]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("SBUserNotificationAllowMenuButtonDismissal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("SBUserNotificationForcesModalAlertAppearance"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("SBUserNotificationDisplayActionButtonOnLockScreen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v13, *MEMORY[0x1E0C9B820]);

  return v8;
}

- (void)dismissDialogWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  TIDispatchAsync();

}

- (void)setTypologyProfileState:(id)a3
{
  objc_storeStrong((id *)&self->_typologyProfileState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typologyProfileState, 0);
}

uint64_t __68__TITypologyProfileOptInManager_dismissDialogWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  if (sNotification)
  {
    CFUserNotificationCancel((CFUserNotificationRef)sNotification);
    CFRelease((CFTypeRef)sNotification);
    sNotification = 0;
    (*(void (**)(uint64_t, _QWORD))(sCompletionHandler + 16))(sCompletionHandler, 0);
    v2 = (void *)sCompletionHandler;
    sCompletionHandler = 0;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__TITypologyProfileOptInManager_presentDialogForType_withCompletionHandler___block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFAllocator *v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v8;
  __CFRunLoop *Current;
  SInt32 error;

  if (sNotification)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    error = 0;
    objc_msgSend(*(id *)(a1 + 32), "notificationDetailsForType:", *(_QWORD *)(a1 + 48));
    v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    sNotification = (uint64_t)CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, &error, v2);
    v4 = *(void (***)(_QWORD, _QWORD))(a1 + 40);
    if (error)
    {
      v4[2](v4, 0);
    }
    else
    {
      v5 = objc_msgSend(v4, "copy");
      v6 = (void *)sCompletionHandler;
      sCompletionHandler = v5;

      RunLoopSource = CFUserNotificationCreateRunLoopSource(v3, (CFUserNotificationRef)sNotification, (CFUserNotificationCallBack)_HandleUserNotificationCallBack, 0);
      if (RunLoopSource)
      {
        v8 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v8, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        CFRelease(v8);
      }
      else
      {
        (*(void (**)(uint64_t, _QWORD))(sCompletionHandler + 16))(sCompletionHandler, 0);
        if (sNotification)
        {
          CFUserNotificationCancel((CFUserNotificationRef)sNotification);
          CFRelease((CFTypeRef)sNotification);
          sNotification = 0;
        }
      }
    }

  }
}

void __48__TITypologyProfileOptInManager__askUserToAllow__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  TITypologyProfileState *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  TITypologyProfileState *v18;
  __int16 v19;
  __int16 v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v24 = v2;
  v25 = v3;
  v26 = v4;
  switch(a2)
  {
    case 0:
      TITypologyProfileStateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v20 = 0;
      v7 = "Opt-in response: cancel opt-in dialogue.";
      v8 = (uint8_t *)&v20;
      goto LABEL_16;
    case 1:
      TITypologyProfileStateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEFAULT, "Opt-in response: opt-in.", buf, 2u);
      }

      v10 = [TITypologyProfileState alloc];
      objc_msgSend(*(id *)(a1 + 32), "typologyProfileState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "profileInstallationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "typologyProfileState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userNotificationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("Enable");
      goto LABEL_13;
    case 2:
      TITypologyProfileStateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_DEFAULT, "Opt-in response: go to remove profile.", v21, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_launchVPNAndDeviceManagementSettings");
      return;
    case 3:
      TITypologyProfileStateLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1DA6F2000, v17, OS_LOG_TYPE_DEFAULT, "Opt-in response: not now.", v22, 2u);
      }

      v10 = [TITypologyProfileState alloc];
      objc_msgSend(*(id *)(a1 + 32), "typologyProfileState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "profileInstallationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "typologyProfileState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userNotificationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("NotNow");
LABEL_13:
      v18 = -[TITypologyProfileState initWithProfileInstallationDate:userNotificationDate:userResponse:](v10, "initWithProfileInstallationDate:userNotificationDate:userResponse:", v12, v14, v15);
      objc_msgSend(*(id *)(a1 + 32), "setTypologyProfileState:", v18);

      objc_msgSend(*(id *)(a1 + 32), "typologyProfileState");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject persistState](v6, "persistState");
      goto LABEL_17;
    case 4:
      TITypologyProfileStateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 0;
        v7 = "Opt-in response: unspecified.";
        v8 = (uint8_t *)&v19;
LABEL_16:
        _os_log_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
LABEL_17:

      break;
    default:
      return;
  }
}

+ (id)localizedStringForKey:(id)a3
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

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString(CFSTR("TIAssistantSettings")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v4, "localizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizationsFromArray:forPreferences:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "count"))
    goto LABEL_3;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("TypologyProfileOptIn"), CFSTR("strings"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_3:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1EA1081D0, CFSTR("TypologyProfileOptIn"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end

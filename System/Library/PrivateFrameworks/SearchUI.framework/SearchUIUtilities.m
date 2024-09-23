@implementation SearchUIUtilities

+ (BOOL)bundleIdentifierIsBlockedForScreenTimeExpiration:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SearchUIScreenTimeManager sharedInstance](SearchUIScreenTimeManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getCachedObjectIfAvailableForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");
  return (char)v4;
}

+ (id)bundleIdentifierForApp:(unint64_t)a3
{
  if (a3 > 0x1A)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), off_1EA1F6F70[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4
{
  objc_msgSend(a1, "performAnimatableChanges:animated:completion:", a3, a4, 0);
}

+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_msgSend(MEMORY[0x1E0DBDA48], "performAnimatableChanges:animated:completion:", a3, a4, a5);
}

+ (void)performAnimatableChanges:(id)a3
{
  objc_msgSend(a1, "performAnimatableChanges:animated:", a3, 1);
}

+ (double)standardTableCellContentInset
{
  double result;

  objc_msgSend(MEMORY[0x1E0DBDA48], "standardTableCellContentInset");
  return result;
}

+ (BOOL)isIpad
{
  return objc_msgSend(MEMORY[0x1E0DBDA48], "isIpad");
}

+ (BOOL)isWideScreen
{
  return objc_msgSend(MEMORY[0x1E0DBD9B0], "isWideScreen");
}

+ (id)localizedStringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1EA1FB118, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)dispatchMainIfNecessary:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DBDA48], "dispatchMainIfNecessary:", a3);
}

+ (id)focusGroupIdentifier
{
  return CFSTR("SearchUIFocusGroupIdentifier");
}

+ (double)disambiguationTableCellContentInset
{
  return 8.0;
}

+ (double)standardCompactHorizontalMargin
{
  double v2;

  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  return v2;
}

+ (double)imageAccessoryAdditionalCompactHorizontalMargin
{
  return 10.0;
}

+ (BOOL)isLargeIpad
{
  void *v2;
  BOOL v3;
  CGRect v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v3 = CGRectGetHeight(v5) > 1195.0;

  return v3;
}

+ (id)hyphenatableStringForString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (hyphenatableStringForString__onceToken != -1)
  {
    dispatch_once(&hyphenatableStringForString__onceToken, &__block_literal_global_14);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  v6 = (void *)objc_msgSend(v5, "initWithString:attributes:", v4, hyphenatableStringForString__s_attributes);
LABEL_6:

  return v6;
}

void __49__SearchUIUtilities_hyphenatableStringForString___block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "setAlignment:", 1);
  objc_msgSend(v1, "setLineBreakMode:", 4);
  LODWORD(v2) = 1.0;
  objc_msgSend(v1, "setHyphenationFactor:", v2);
  objc_msgSend(v1, "setAllowsDefaultTighteningForTruncation:", 1);
  v5 = *MEMORY[0x1E0DC1178];
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)hyphenatableStringForString__s_attributes;
  hyphenatableStringForString__s_attributes = v3;

}

+ (id)addAspectRatioConstraintForSize:(CGSize)a3 toView:(id)a4
{
  double width;
  double v5;
  void *v7;

  width = a3.width;
  v5 = 1.0;
  if (width != *MEMORY[0x1E0DC55F0] && a3.height > 0.0 && a3.height != *MEMORY[0x1E0DC55F0])
    v5 = width / a3.height;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 7, 0, a4, 8, v5, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);
  return v7;
}

+ (BOOL)deviceSupportsRotation
{
  void *v2;
  BOOL v3;
  CGRect v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v3 = CGRectGetHeight(v5) > 667.0;

  return v3;
}

+ (BOOL)isPortraitForWindow:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v3 = a3;
  if (objc_msgSend(v3, "isRotating"))
    v4 = objc_msgSend(v3, "_toWindowOrientation");
  else
    v4 = objc_msgSend(v3, "_windowInterfaceOrientation");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  if (v5)
    v8 = v3 == 0;
  else
    v8 = 1;
  if (v8)
    v9 = v7;
  else
    v9 = v5;
  return (unint64_t)(v9 - 1) < 2;
}

+ (void)dispatchAsyncIfNecessary:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DBDA48], "dispatchAsyncIfNecessary:", a3);
}

+ (void)openPunchout:(id)a3
{
  objc_msgSend(a1, "openPunchout:completion:", a3, 0);
}

+ (void)openPunchout:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "preferredOpenableURL");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasClip");

  if (v8)
    objc_msgSend(a1, "requestClipInstallWithURL:completion:", v9, v6);
  else
    objc_msgSend(a1, "openURL:withCompletion:", v9, v6);

}

+ (void)requestClipInstallWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  SearchUIGeneralLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAD39000, v8, OS_LOG_TYPE_DEFAULT, "Punchout via clip services", buf, 2u);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D107F8]), "initWithURL:", v6);
  v10 = *MEMORY[0x1E0D107A8];
  objc_msgSend(v9, "sessionProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLaunchReason:", v10);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke;
  v15[3] = &unk_1EA1F6E28;
  v17 = v7;
  v18 = a1;
  v16 = v6;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v9, "requestClipWithCompletion:", v15);

}

void __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  if (!v5 && (a2 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    goto LABEL_14;
  }
  SearchUIGeneralLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (!v5)
  {
    if (v8)
      __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke_cold_1(v7);

    goto LABEL_13;
  }
  if (v8)
    __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke_cold_2((uint64_t)v5, v7, v9, v10, v11, v12, v13, v14);

  if (objc_msgSend(v5, "code") != 8)
LABEL_13:
    objc_msgSend(*(id *)(a1 + 48), "openURL:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_14:

}

+ (void)openURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SearchUIUtilities_openURL_withCompletion___block_invoke;
  v9[3] = &unk_1EA1F6E50;
  v8 = v6;
  v10 = v8;
  v11 = a1;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v9);
  if (v7)
    v7[2](v7);

}

void __44__SearchUIUtilities_openURL_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "openApplicationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v3, v4, &v13);
  v5 = v13;

  if (v5)
  {
    SearchUIGeneralLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__SearchUIUtilities_openURL_withCompletion___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

+ (BOOL)isSpotlightProcess
{
  if (isSpotlightProcess_onceToken != -1)
    dispatch_once(&isSpotlightProcess_onceToken, &__block_literal_global_46);
  return isSpotlightProcess_isSpotlightProcess;
}

void __39__SearchUIUtilities_isSpotlightProcess__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isSpotlightProcess_isSpotlightProcess = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Spotlight"));

}

+ (id)openApplicationOptions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SearchUIUtilities_openApplicationOptions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (openApplicationOptions_onceToken != -1)
    dispatch_once(&openApplicationOptions_onceToken, block);
  return (id)openApplicationOptions_options;
}

void __43__SearchUIUtilities_openApplicationOptions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isSpotlightProcess"))
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0DAB818], *MEMORY[0x1E0D22D58]);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)openApplicationOptions_options;
  openApplicationOptions_options = v2;

}

+ (unint64_t)deviceAuthenticationStateForView:(id)a3
{
  if (!objc_msgSend(a1, "deviceIsPasscodeLockedForView:", a3))
    return 0;
  if (objc_msgSend(a1, "deviceIsInBiometryLockout"))
    return 2;
  return 1;
}

+ (BOOL)deviceIsAuthenticatedForView:(id)a3
{
  return objc_msgSend(a1, "deviceIsPasscodeLockedForView:", a3) ^ 1;
}

+ (BOOL)deviceIsPasscodeLockedForView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  const __CFString *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isContinuityDisplay");

  SearchUIGeneralLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_impl(&dword_1DAD39000, v10, OS_LOG_TYPE_DEFAULT, "SearchUI isInOneness: %@", buf, 0xCu);

  }
  v16 = CFSTR("ExtendedDeviceLockState");
  v17 = *MEMORY[0x1E0C9AE50];
  v12 = 1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MKBGetDeviceLockState();
  if (v14 != 1)
    v12 = v14 == 6 && !(_DWORD)v9 || v14 == 2;

  return v12;
}

+ (BOOL)deviceIsInBiometryLockout
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CC12A8], "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "biometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLockedOut");

  return v5;
}

+ (BOOL)canShowViewController:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "_canShowWhileLocked") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[SearchUIUtilities deviceIsAuthenticatedForView:](SearchUIUtilities, "deviceIsAuthenticatedForView:", v5);

  }
  return v4;
}

+ (void)requestDeviceUnlockWithSuccessHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SearchUIUtilities_requestDeviceUnlockWithSuccessHandler___block_invoke;
  v6[3] = &unk_1EA1F6EB8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "requestDeviceUnlock:", v6);

}

uint64_t __59__SearchUIUtilities_requestDeviceUnlockWithSuccessHandler___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)requestDeviceUnlock:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SearchUIUtilities_requestDeviceUnlock___block_invoke;
  v5[3] = &unk_1EA1F6DA8;
  v6 = v3;
  v4 = v3;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v5);

}

void __41__SearchUIUtilities_requestDeviceUnlock___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  SBSRequestPasscodeUnlockUI();

}

void __41__SearchUIUtilities_requestDeviceUnlock___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__SearchUIUtilities_requestDeviceUnlock___block_invoke_3;
    v4[3] = &unk_1EA1F6EE0;
    v5 = v2;
    v6 = a2;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v4);

  }
}

uint64_t __41__SearchUIUtilities_requestDeviceUnlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) != 0);
}

+ (void)playNegativeHaptic
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_tapticEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actuateFeedback:", 2);

}

+ (id)stringForSFRichText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    v6 = (void *)objc_opt_new();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "formattedTextPieces", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "text");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(v12, "text");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendString:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  return v6;
}

+ (id)stringForSFRichTextArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[SearchUIUtilities stringForSFRichText:](SearchUIUtilities, "stringForSFRichText:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          if (objc_msgSend(v4, "length"))
            objc_msgSend(v4, "appendString:", CFSTR("\n"));
          objc_msgSend(v4, "appendString:", v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)pointerKeyMapTable
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
}

+ (BOOL)appIsValidForBundleIdentifier:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = 1;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0);
  objc_msgSend(v5, "applicationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValid");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifierOfSystemPlaceholder:error:", v3, 0);
    objc_msgSend(v8, "applicationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v9, "isValid");

  }
  return v4;
}

+ (BOOL)resultIsSiriAction:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0CBD4D0]);

  return v4;
}

+ (BOOL)resultBlockedForScreenTime:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  objc_msgSend(v3, "applicationBundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = +[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:](SearchUIUtilities, "bundleIdentifierIsBlockedForScreenTimeExpiration:", v4);

  objc_msgSend(v3, "sectionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = +[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:](SearchUIUtilities, "bundleIdentifierIsBlockedForScreenTimeExpiration:", v6);

  objc_msgSend(v3, "sectionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v4 & 1) != 0)
    return 1;
  else
    return v5 & ~v9;
}

+ (id)imageForBlockedApp
{
  return -[SearchUISymbolImage initWithSymbolName:]([SearchUISymbolImage alloc], "initWithSymbolName:", CFSTR("hourglass.tophalf.fill"));
}

+ (BOOL)downloadDemotedAppIfNecessaryForBundleIdentifier:(id)a3 presentingViewControllerForExplanationAlert:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);
  v8 = objc_msgSend(v7, "isPlaceholder");
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D3AC78];
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3AC80]), "initWithBundleID:", v5);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke;
    v12[3] = &unk_1EA1F6F30;
    v13 = v6;
    v14 = v7;
    objc_msgSend(v9, "prioritizeCoordinatorForAppWithIdentity:completion:", v10, v12);

  }
  return v8;
}

void __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke_2;
  v5[3] = &unk_1EA1F6518;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v5);

}

void __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    SearchUIGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v10 = (void *)MEMORY[0x1E0DC3450];
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("REINSTALLING_APP_ALERT_TITLE_FORMAT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "localizedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("REINSTALLING_APP_EXPLANATION"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC3448];
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("CONFIRMATION_ACTION_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "addAction:", v19);
    objc_msgSend(v16, "setPreferredAction:", v19);
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v16, 1, 0);

  }
}

+ (id)defaultBrowserBundleIdentifier
{
  return +[SearchUIDefaultBrowserAppIconImage defaultBrowserBundleIdentifier](SearchUIDefaultBrowserAppIconImage, "defaultBrowserBundleIdentifier");
}

+ (void)fetchURLForFileResult:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileProviderIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fetchURLForCoreSpotlightIdentifier:fileProviderIdentifier:completionHandler:", v9, v8, v6);
}

+ (id)fileProviderItemIDForFileResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileProviderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)fetchURLForCoreSpotlightIdentifier:(id)a3 fileProviderIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  objc_msgSend(a1, "fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __97__SearchUIUtilities_fetchURLForCoreSpotlightIdentifier_fileProviderIdentifier_completionHandler___block_invoke;
    v11[3] = &unk_1EA1F6458;
    v12 = v8;
    objc_msgSend(v10, "fetchURLForItemID:completionHandler:", v9, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __97__SearchUIUtilities_fetchURLForCoreSpotlightIdentifier_fileProviderIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)fileProviderItemIDForCoreSpotlightIdentifier:(id)a3 fileProviderIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v13 = 0;
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CAAC70], "getDomainIdentifier:andIdentifier:fromCoreSpotlightIdentifier:", &v14, &v13, v5);
    v8 = v14;
    v9 = v13;
    SearchUIGeneralLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v16 = v5;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1DAD39000, v10, OS_LOG_TYPE_DEFAULT, "SearchUIUtilities fileProviderItemIDForCoreSpotlightIdentifier: %@ fileProviderIdentifier: fileProviderIdentifier: %@ domainIdentifier: %@ itemIdentifier: %@", buf, 0x2Au);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC70]), "initWithProviderID:domainIdentifier:itemIdentifier:", v7, v8, v9);
  }
  else
  {
    SearchUIGeneralLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SearchUIUtilities fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:].cold.1();
    v11 = 0;
  }

  return v11;
}

+ (id)environmentForDelegate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "searchUICommandEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setFeedbackDelegate:", v3);
  }

  return v4;
}

+ (BOOL)isMinimizedHardwareKeyboardMode
{
  int v2;
  void *v3;
  char v4;

  v2 = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isMinimized");

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (id)fmfHandlesFromContact:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stringHandlesFromContact:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0D20258], "handleWithId:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)stringHandlesFromContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "phoneNumbers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "unformattedInternationalStringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  return v4;
}

+ (id)skHandlesFromContact:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stringHandlesFromContact:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0DACA58]);
        v12 = (void *)objc_msgSend(v11, "initWithString:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)isAppInstalledWithBundleId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v10;

  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v10);
  v5 = v10;
  if (v5)
  {
    SearchUIGeneralLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SearchUIUtilities isAppInstalledWithBundleId:].cold.1();

  }
  objc_msgSend(v4, "applicationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInstalled");

  return v8;
}

+ (BOOL)isAppIntentsSupportEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)directionalEdgeInsets:(NSDirectionalEdgeInsets)a3 equalToDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a4
{
  return a3.leading == a4.leading && a3.top == a4.top && a3.trailing == a4.trailing && a3.bottom == a4.bottom;
}

+ (id)cardSectionsForRenderingResult:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "cardForRenderingResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)cardForRenderingResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "inlineCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "inlineCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  if ((objc_msgSend(v4, "usesCompactDisplay") & 1) != 0
    || objc_msgSend(v4, "shouldUseCompactDisplay") && objc_msgSend(v4, "type") == 1
    || !v7)
  {
    objc_msgSend(v4, "compactCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "compactCard");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  if ((objc_msgSend(v4, "usesTopHitDisplay") & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v4, "sectionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqual:", CFSTR("com.apple.spotlight.tophits")))
  {
LABEL_17:

    goto LABEL_18;
  }
  v9 = objc_msgSend(a1, "isSpotlightProcess");

  if (v9)
  {
LABEL_11:
    objc_msgSend(v4, "tophitCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "tophitCard");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v12 = (void *)v11;

      v7 = v12;
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_18:

  return v7;
}

+ (void)applyGaussianBlurToView:(id)a3 withRadius:(double)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CD2780];
  v6 = *MEMORY[0x1E0CD2C88];
  v7 = a3;
  objc_msgSend(v5, "filterWithType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("inputRadius"));

  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFilters:", v10);
}

+ (unint64_t)flippedCornerMaskFromCornerMask:(unint64_t)a3
{
  return (a3 >> 2) & 3 | (4 * (a3 & 3));
}

+ (BOOL)stringHasRegexMatch:(id)a3 regex:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  uint64_t v11;

  v5 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", a4, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v11 == 0;
  else
    v7 = 0;
  if (v7)
  {
    objc_msgSend(v6, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)purgeMemory
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VKDidReceiveMemoryWarningNotification"), 0);

  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", &__block_literal_global_160);
}

uint64_t __32__SearchUIUtilities_purgeMemory__block_invoke()
{
  return +[SearchUIPhotosUtilities shutdownPhotoLibraries](SearchUIPhotosUtilities, "shutdownPhotoLibraries");
}

void __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "No valid clips available", v1, 2u);
}

void __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "Failed to fetch clip with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __44__SearchUIUtilities_openURL_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "Didnt punchout with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "Download of app failed with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1DAD39000, v0, v1, "SearchUIUtilities: missing coreSpotlightIdentifier or fileProviderIdentifier when tyring to get FPItemID coreSpotlightIdentifier: %@, fileProviderIdentifier: %@");
  OUTLINED_FUNCTION_1();
}

+ (void)isAppInstalledWithBundleId:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1DAD39000, v0, v1, "SearchUIUtilities: initialized LSApplicationRecordWithBundleId:%@ error:%@");
  OUTLINED_FUNCTION_1();
}

@end

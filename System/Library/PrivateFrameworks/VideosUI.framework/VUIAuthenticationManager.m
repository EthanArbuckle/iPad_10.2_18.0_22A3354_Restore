@implementation VUIAuthenticationManager

void __42__VUIAuthenticationManager_sharedInstance__block_invoke()
{
  VUIAuthenticationManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUIAuthenticationManager);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (VUIAuthenticationManager)init
{
  VUIAuthenticationManager *v2;
  void *v3;
  uint64_t v4;
  ACAccount *activeUserAccount;
  void *v6;
  uint64_t v7;
  ACAccount *localUserAccount;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VUIAuthenticationManager;
  v2 = -[VUIAuthenticationManager init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_activeiTunesAccount");
    v4 = objc_claimAutoreleasedReturnValue();
    activeUserAccount = v2->__activeUserAccount;
    v2->__activeUserAccount = (ACAccount *)v4;

    if (!v2->__activeUserAccount)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ams_localiTunesAccount");
      v7 = objc_claimAutoreleasedReturnValue();
      localUserAccount = v2->__localUserAccount;
      v2->__localUserAccount = (ACAccount *)v7;

    }
    -[VUIAuthenticationManager _setUpProfileImageStoreAndFetchProfileImage](v2, "_setUpProfileImageStoreAndFetchProfileImage");
    if (objc_msgSend((id)objc_opt_class(), "allowsAccountModification"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__accountStoreDidChange_, *MEMORY[0x1E0C8F1C0], 0);

      VUIDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: added observer to ACDAccountStoreDidChangeNotification", v13, 2u);
      }

    }
    *(_WORD *)&v2->__isLibraryOnlyCountry = 0;
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: resolving is library only country", v13, 2u);
    }

    -[VUIAuthenticationManager _determineIfLibraryOnlyCountry](v2, "_determineIfLibraryOnlyCountry");
  }
  return v2;
}

- (void)_setUpProfileImageStoreAndFetchProfileImage
{
  AAUIProfilePictureStore *v3;
  AAUIProfilePictureStore *profilePictureStore;

  v3 = (AAUIProfilePictureStore *)objc_alloc_init(MEMORY[0x1E0CFAED0]);
  profilePictureStore = self->__profilePictureStore;
  self->__profilePictureStore = v3;

  -[VUIAuthenticationManager _fetchProfileImage](self, "_fetchProfileImage");
}

- (void)_determineIfLibraryOnlyCountry
{
  _QWORD v2[5];

  self->__isLibraryOnlyCountryResolved = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__VUIAuthenticationManager__determineIfLibraryOnlyCountry__block_invoke;
  v2[3] = &unk_1E9F9B4F8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC8868], "isFullTVAppEnabledwithCompletion:", v2);
}

+ (BOOL)allowsAccountModification
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CC24E8], "sharedRestrictionsMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsAccountModification");

  return v3;
}

void __58__VUIAuthenticationManager__determineIfLibraryOnlyCountry__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[8] = *(_BYTE *)(a1 + 40) ^ 1;
  WeakRetained[9] = 1;
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_BYTE *)(a1 + 40) == 0;
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: resolved is library only country to %d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VUIAuthenticationManagerIsLibraryOnlyCountryDidChangeNotification"), WeakRetained, 0);

}

void __58__VUIAuthenticationManager__determineIfLibraryOnlyCountry__block_invoke(uint64_t a1, char a2)
{
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  char v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __58__VUIAuthenticationManager__determineIfLibraryOnlyCountry__block_invoke_2;
  v6 = &unk_1E9F9A758;
  objc_copyWeak(&v7, &location);
  v8 = a2;
  v3 = v4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v5((uint64_t)v3);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_fetchProfileImage
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  AAUIProfilePictureStore *profilePictureStore;
  UIImage *profileImage;
  _QWORD v17[4];
  id v18;
  id buf[2];

  v3 = WLKIsRegulatedSKU();
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_activeiCloudAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_activeiTunesAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || v5)
  {
    objc_msgSend(v7, "username");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      objc_initWeak(buf, self);
      profilePictureStore = self->__profilePictureStore;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __46__VUIAuthenticationManager__fetchProfileImage__block_invoke;
      v17[3] = &unk_1E9F9B520;
      objc_copyWeak(&v18, buf);
      -[AAUIProfilePictureStore profilePictureForAccountOwnerWithCompletion:](profilePictureStore, "profilePictureForAccountOwnerWithCompletion:", v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(buf);
    }
    else
    {
      profileImage = self->__profileImage;
      self->__profileImage = 0;

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle"));
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v9 = self->__profileImage;
    self->__profileImage = v8;

    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: used fallback profile image for China region without iCloud signed in, posting VUIAuthenticationManagerProfileImageDidChangeNotification", (uint8_t *)buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("VUIAuthenticationManagerProfileImageDidChangeNotification"), self, 0);

  }
}

+ (id)userAccountName
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)DSID
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)storefrontId
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_storefront");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_localUserAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_storefront");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)_userAccount
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_activeUserAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(v2, "_activeUserAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (ACAccount)_activeUserAccount
{
  return self->__activeUserAccount;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_28);
  return (id)sharedInstance_sharedInstance_2;
}

- (UIImage)_profileImage
{
  return self->__profileImage;
}

- (BOOL)_isLibraryOnlyCountry
{
  return self->__isLibraryOnlyCountry;
}

+ (id)userProfileImage
{
  return (id)objc_msgSend((id)objc_opt_class(), "_profileImage");
}

+ (id)userLastName
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", *MEMORY[0x1E0C8EFB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)userHasActiveAccount
{
  void *v2;
  BOOL v3;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)userFirstName
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", *MEMORY[0x1E0C8EF78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)monogramAvatarForSize:(CGSize)a3 scale:(double)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v5 = a5;
  height = a3.height;
  width = a3.width;
  v19[1] = *MEMORY[0x1E0C80C00];
  +[VUIAuthenticationManager userFirstName](VUIAuthenticationManager, "userFirstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAuthenticationManager userLastName](VUIAuthenticationManager, "userLastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v11, "setGivenName:", v9);
  objc_msgSend(v11, "setFamilyName:", v10);
  v12 = objc_alloc(MEMORY[0x1E0C97450]);
  objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithSettings:", v13);

  objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:", v5, 0, width, height, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "avatarImageForContacts:scope:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)isLibraryOnlyCountry
{
  return objc_msgSend((id)objc_opt_class(), "_isLibraryOnlyCountry");
}

+ (id)_profileImage
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_profileImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_isLibraryOnlyCountry
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isLibraryOnlyCountry");

  return v3;
}

+ (BOOL)lightWeightUserHasActiveAccount
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)userFullName
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userFullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)identifier
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)creditsString
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_creditsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isDemoAccount
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ams_isDemoAccount");

  return v3;
}

+ (BOOL)isLibraryOnlyCountryResolved
{
  return objc_msgSend((id)objc_opt_class(), "_isLibraryOnlyCountryResolved");
}

+ (void)requestAuthenticationAlwaysPrompt:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _DWORD v16[2];
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v16[0] = 67109120;
    v16[1] = v4;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: requestAuthenticationAlwaysPrompt %d", (uint8_t *)v16, 8u);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0CFD9C8]);
  v9 = !v4;
  objc_msgSend(v8, "setAuthenticationType:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFD9D0]), "initWithAccount:options:", 0, v8);
  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDF0]), "initWithRequest:presentingViewController:", v10, v11);
  objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBag:", v15);
  objc_msgSend(a1, "_performAuthenticationTask:isSilent:completionHandler:", v14, v9, v6);

}

+ (void)signInUserWithAppleID:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  VUIDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v8;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: signInUserWithAppleID %@", (uint8_t *)&v18, 0xCu);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0CFD9C8]);
  objc_msgSend(v12, "setAuthenticationType:", 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFD9D0]), "initWithDSID:altDSID:username:options:", 0, 0, v8, v12);
  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rootViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDF0]), "initWithRequest:presentingViewController:", v13, v14);
  objc_msgSend(v17, "setRawPassword:", v10);

  objc_msgSend(a1, "_performAuthenticationTask:isSilent:completionHandler:", v17, 0, v9);
}

+ (void)signOutUserWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: sign out", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "_userAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setActive:", 0);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_saveAccount:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_signoutPromise");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v11, "cancel");
    objc_msgSend(a1, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "set_signoutPromise:", v9);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E9F9B480;
    v15 = a1;
    v14 = v4;
    objc_msgSend(v9, "addFinishBlock:", v13);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

void __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  _QWORD block[2];
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  __int128 v14;
  char v15;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v11 = __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke_2;
  v12 = &unk_1E9F9B458;
  v15 = a2;
  v13 = v5;
  v9 = *(_OWORD *)(a1 + 32);
  v6 = (id)v9;
  v14 = v9;
  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = v5;
  if (objc_msgSend(v7, "isMainThread"))
    v11((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 56))
  {
    VUIDefaultLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke_2_cold_1(a1, v2);

    objc_msgSend(*(id *)(a1 + 48), "_recordLog:isSignOut:isSilent:", *(_QWORD *)(a1 + 32), 1, 0);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

+ (BOOL)_isLibraryOnlyCountryResolved
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isLibraryOnlyCountryResolved");

  return v3;
}

+ (void)_performAuthenticationTask:(id)a3 isSilent:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v8 = a5;
  objc_msgSend(a3, "performAuthentication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_authPromise");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_msgSend(v11, "isCancelled") & 1) == 0 && (objc_msgSend(v11, "isFinished") & 1) == 0)
      objc_msgSend(v11, "cancel");
    objc_msgSend(a1, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "set_authPromise:", v9);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__VUIAuthenticationManager__performAuthenticationTask_isSilent_completionHandler___block_invoke;
    v14[3] = &unk_1E9F9B4D0;
    v16 = a1;
    v17 = a4;
    v15 = v8;
    objc_msgSend(v9, "addFinishBlock:", v14);

  }
  else
  {
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[VUIAuthenticationManager _performAuthenticationTask:isSilent:completionHandler:].cold.1(v13);

    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

void __82__VUIAuthenticationManager__performAuthenticationTask_isSilent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[2];
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  char v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v13 = __82__VUIAuthenticationManager__performAuthenticationTask_isSilent_completionHandler___block_invoke_2;
  v14 = &unk_1E9F9B4A8;
  v15 = v5;
  v16 = v6;
  v18 = *(_BYTE *)(a1 + 48);
  v11 = *(_OWORD *)(a1 + 32);
  v7 = (id)v11;
  v17 = v11;
  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = v6;
  v10 = v5;
  if (objc_msgSend(v8, "isMainThread"))
    v13((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __82__VUIAuthenticationManager__performAuthenticationTask_isSilent_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t result;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2
    && (objc_msgSend(v2, "account"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v4 = *(_QWORD *)(a1 + 40), v3, !v4))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "_recordLog:isSignOut:isSilent:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 64));
    v5 = 0;
  }
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = 67109378;
    v9[1] = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: finished auth with success %d, error: %@", (uint8_t *)v9, 0x12u);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v5, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_accountStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  VUIAuthenticationManager *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[2];
  void (*v15)(uint64_t);
  void *v16;
  VUIAuthenticationManager *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: _accountStoreDidChange - notification %@", buf, 0xCu);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_stringForKey:", *MEMORY[0x1E0C8F0F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8F170]);

  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ams_activeiTunesAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: _accountStoreDidChange - changedAccount %@", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "_userAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->__activeUserAccount, v11);
    if (-[VUIAuthenticationManager _shouldNotifyAccountChange:newAccount:](v9, "_shouldNotifyAccountChange:newAccount:", v13, v11))
    {
      -[VUIAuthenticationManager _setUpProfileImageStoreAndFetchProfileImage](v9, "_setUpProfileImageStoreAndFetchProfileImage");

      objc_sync_exit(v9);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      v15 = __51__VUIAuthenticationManager__accountStoreDidChange___block_invoke;
      v16 = &unk_1E9F98DF0;
      v17 = v9;
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        v15((uint64_t)block);
      else
        dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {

      objc_sync_exit(v9);
    }
  }

}

void __51__VUIAuthenticationManager__accountStoreDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: ACDAccountStoreDidChangeNotification received, posting VUIAuthenticationManagerAccountStoreDidChangeNotification", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("VUIAuthenticationManagerAccountStoreDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)_shouldNotifyAccountChange:(id)a3 newAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  BOOL v11;
  void *v12;
  void *v13;
  char v14;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && !v6)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v18 = 0;
      v9 = "User logged out";
      v10 = (uint8_t *)&v18;
LABEL_15:
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v5 && v6)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v17 = 0;
      v9 = "User logged in";
      v10 = (uint8_t *)&v17;
      goto LABEL_15;
    }
LABEL_16:

    v11 = 1;
    goto LABEL_17;
  }
  v11 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) == 0)
    {
      VUIDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v16 = 0;
        v9 = "Account changed";
        v10 = (uint8_t *)&v16;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    v11 = 0;
  }
LABEL_17:

  return v11;
}

void __46__VUIAuthenticationManager__fetchProfileImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__VUIAuthenticationManager__fetchProfileImage__block_invoke_2;
  v5[3] = &unk_1E9F9A938;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __46__VUIAuthenticationManager__fetchProfileImage__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  void *v5;
  __int16 v6[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      VUIDefaultLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6[0] = 0;
        _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: recieved profile image, posting VUIAuthenticationManagerProfileImageDidChangeNotification", (uint8_t *)v6, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VUIAuthenticationManagerProfileImageDidChangeNotification"), v3, 0);

    }
  }

}

+ (void)_recordLog:(id)a3 isSignOut:(BOOL)a4 isSilent:(BOOL)a5
{
  __CFString **v6;
  __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  if (a5)
    v6 = VUIMetricsLogAuthTypeValueSilentSignIn;
  else
    v6 = VUIMetricsLogAuthTypeValueSignIn;
  if (a4)
    v6 = VUIMetricsLogAuthTypeValueSignOut;
  v7 = *v6;
  v31[0] = CFSTR("auth task failure");
  v30[0] = CFSTR("message");
  v30[1] = CFSTR("errorCode");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithLong:", objc_msgSend(v9, "code"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E9FF3598;
  v31[1] = v12;
  v30[2] = CFSTR("errorDomain");
  objc_msgSend(v9, "domain");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E9FF3598;
  v30[3] = CFSTR("authType");
  v31[2] = v15;
  v31[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "ams_underlyingError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v28[0] = CFSTR("underlyingErrorCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v17, "code"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = &stru_1E9FF3598;
    v29[0] = v20;
    v28[1] = CFSTR("underlyingErrorDomain");
    objc_msgSend(v17, "domain");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = &stru_1E9FF3598;
    v29[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addEntriesFromDictionary:", v24);
    v26 = objc_msgSend(v25, "copy");

    v16 = (void *)v26;
  }
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "recordLog:", v16);

}

- (AMSPromise)_authPromise
{
  return self->__authPromise;
}

- (void)set_authPromise:(id)a3
{
  objc_storeStrong((id *)&self->__authPromise, a3);
}

- (AMSBinaryPromise)_signoutPromise
{
  return self->__signoutPromise;
}

- (void)set_signoutPromise:(id)a3
{
  objc_storeStrong((id *)&self->__signoutPromise, a3);
}

- (ACAccount)_localUserAccount
{
  return self->__localUserAccount;
}

- (AAUIProfilePictureStore)_profilePictureStore
{
  return self->__profilePictureStore;
}

- (void)set_isLibraryOnlyCountry:(BOOL)a3
{
  self->__isLibraryOnlyCountry = a3;
}

- (BOOL)_isLibraryOnlyCountryResolved
{
  return self->__isLibraryOnlyCountryResolved;
}

- (void)set_isLibraryOnlyCountryResolved:(BOOL)a3
{
  self->__isLibraryOnlyCountryResolved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__profileImage, 0);
  objc_storeStrong((id *)&self->__profilePictureStore, 0);
  objc_storeStrong((id *)&self->__localUserAccount, 0);
  objc_storeStrong((id *)&self->__activeUserAccount, 0);
  objc_storeStrong((id *)&self->__signoutPromise, 0);
  objc_storeStrong((id *)&self->__authPromise, 0);
}

void __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUIAuthenticationManager: failed to sign out %@", (uint8_t *)&v3, 0xCu);
}

+ (void)_performAuthenticationTask:(os_log_t)log isSilent:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIAuthenticationManager: failed to create auth promise", v1, 2u);
}

@end

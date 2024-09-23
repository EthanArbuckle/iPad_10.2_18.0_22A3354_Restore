@implementation PUPickerUtilities

+ (void)presentDataAccessEducationViewController
{
  id v2;
  void *v3;
  id v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.Photos.PhotosUIService"), CFSTR("PhotosUIServiceDataAccessEducationViewController"));
  v2 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v5, v2);
  v4 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
  objc_msgSend(v3, "activateWithContext:", v4);

}

+ (void)presentUserSafetyViewControllerWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.Photos.PhotosUIService"), CFSTR("PhotosUIServiceUserSafetyViewController"));
  v5 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v4, v5);
  v7 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
  v8 = (void *)MEMORY[0x1E0D016A0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __74__PUPickerUtilities_presentUserSafetyViewControllerWithCompletionHandler___block_invoke;
  v18 = &unk_1E58ABC20;
  v19 = v6;
  v20 = v3;
  v9 = v6;
  v10 = v3;
  objc_msgSend(v8, "responderWithHandler:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQueue:", MEMORY[0x1E0C80D38], v15, v16, v17, v18);
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01698]), "initWithInfo:responder:", 0, v11);
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActions:", v14);

  objc_msgSend(v9, "activateWithContext:", v7);
}

+ (void)presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  __int16 v10;
  uint8_t buf[2];

  if (presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_onceToken != -1)
    dispatch_once(&presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_onceToken, &__block_literal_global_106137);
  if (presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_hasAlreadyPresented == 1)
  {
    PLPrivacyGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v3 = "[Touch Authentication] Surpassed alert because of it was already presented.";
      v4 = buf;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
    }
  }
  else
  {
    if ((MEMORY[0x1AF429AFC]() & 1) == 0 && (PLIsDeveloperMode() & 1) == 0)
    {
      PLPrivacyGetLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v10 = 0;
      v3 = "[Touch Authentication] Surpassed alert because of it is not enabled.";
      v4 = (uint8_t *)&v10;
      goto LABEL_6;
    }
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.Photos.PhotosUIService"), CFSTR("PhotosUIServicePickerUnsupportedConfigurationAlertController"));
    v5 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v2, v5);
    v7 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
    objc_msgSend(v6, "activateWithContext:", v7);
    presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_hasAlreadyPresented = 1;
    PLPrivacyGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "[Touch Authentication] Prompted for touch authentication.", v9, 2u);
    }

  }
LABEL_12:

}

+ (id)interventionViewControllerForView:(id)a3 withAction:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "frame");
  if (v7 <= 400.0 || (objc_msgSend(v5, "frame"), v8 <= 400.0))
  {
    objc_msgSend(MEMORY[0x1E0D7B988], "interventionAlertControllerWithAction:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7B988], "interventionViewControllerWithAction:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

+ (id)pickerConfigurationForAddToAlbumWithPhotoLibrary:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0CD2168];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initWithPhotoLibrary:onlyReturnsIdentifiers:", v4, 0);

  if (v5)
  {
    objc_msgSend(v5, "set_onboardingOverlayDismissedBefore:", 1);
    objc_msgSend(v5, "set_onboardingHeaderDismissedBefore:", 1);
    objc_msgSend(v5, "set_limitedLibraryHeaderDismissedBefore:", 0);
    objc_msgSend(v5, "setSelectionLimit:", 1);
    objc_msgSend(v5, "_setSourceType:", 2);
    v6 = objc_alloc_init(MEMORY[0x1E0CD21E8]);
    objc_msgSend(v5, "_setAlbumsConfiguration:", v6);

  }
  return v5;
}

void __88__PUPickerUtilities_presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded__block_invoke()
{
  presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_hasAlreadyPresented = 1;
}

uint64_t __74__PUPickerUtilities_presentUserSafetyViewControllerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v4 == 0);

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end

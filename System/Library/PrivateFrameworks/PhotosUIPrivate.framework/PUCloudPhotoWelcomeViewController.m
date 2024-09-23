@implementation PUCloudPhotoWelcomeViewController

- (PUCloudPhotoWelcomeViewController)initWithDefaultTitle
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCloudPhotoWelcomeViewController.m"), 140, CFSTR("%s is not available as initializer"), "-[PUCloudPhotoWelcomeViewController initWithDefaultTitle]");

  abort();
}

- (PUCloudPhotoWelcomeViewController)initWithCompletionHandler:(id)a3
{
  id v4;
  PUCloudPhotoWelcomeViewController *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUCloudPhotoWelcomeViewController;
  v5 = -[PXCloudPhotoWelcomeViewController initWithDefaultTitle](&v8, sel_initWithDefaultTitle);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    -[PUCloudPhotoWelcomeViewController _setCompletionHandler:](v5, "_setCompletionHandler:", v6);

  }
  return v5;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  PUCloudPhotoWelcomeViewController *v8;
  id v9;

  v4 = a3;
  v7[1] = 3221225472;
  v7[2] = __78__PUCloudPhotoWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_1E58AB968;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)PUCloudPhotoWelcomeViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[PUCloudPhotoWelcomeViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, v4, v7);

}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
}

void __78__PUCloudPhotoWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1);

    objc_msgSend(*(id *)(a1 + 32), "_setCompletionHandler:", 0);
  }
}

+ (void)presentIfNecessaryFromViewController:(id)a3 presentationHandler:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  void *v40;
  _QWORD block[4];
  id v42;
  void (**v43)(id, uint64_t);
  id v44;
  unsigned int v45;
  _BYTE buf[32];
  __int16 v47;
  _BYTE v48[10];
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v7, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = objc_opt_class();
      v47 = 2048;
      *(_QWORD *)v48 = v10;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "PUCloudPhotoWelcomeViewController: Bailing out! Presenting view controller:<%@:%p>, already has a presented view controller:<%@:%p>", buf, 0x2Au);
    }

    v9[2](v9, 2);
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cachedPrimaryAppleAccount");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_msgSend(v40, "isEnabledForDataclass:", *MEMORY[0x1E0C8F380]);
  v49 = xmmword_1AB0EF4A0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v13 = getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr;
  *(_QWORD *)&buf[24] = getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr;
  if (!getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr)
  {
    v14 = SystemConfigurationLibrary();
    v13 = dlsym(v14, "SCNetworkReachabilityCreateWithAddress");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
    getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr = v13;
  }
  _Block_object_dispose(buf, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SCNetworkReachabilityRef PLSCNetworkReachabilityCreateWithAddress(CFAllocatorRef, const struct sockaddr *)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PUCloudPhotoWelcomeViewController.m"), 29, CFSTR("%s"), dlerror());

    goto LABEL_32;
  }
  v15 = (const void *)((uint64_t (*)(_QWORD, __int128 *))v13)(*MEMORY[0x1E0C9AE00], &v49);
  if (v15)
  {
    v45 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v16 = getSCNetworkReachabilityGetFlagsSymbolLoc_ptr;
    *(_QWORD *)&buf[24] = getSCNetworkReachabilityGetFlagsSymbolLoc_ptr;
    if (!getSCNetworkReachabilityGetFlagsSymbolLoc_ptr)
    {
      v17 = SystemConfigurationLibrary();
      v16 = dlsym(v17, "SCNetworkReachabilityGetFlags");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v16;
      getSCNetworkReachabilityGetFlagsSymbolLoc_ptr = v16;
    }
    _Block_object_dispose(buf, 8);
    if (v16)
    {
      ((void (*)(const void *, unsigned int *))v16)(v15, &v45);
      v18 = v45;
      CFRelease(v15);
      v36 = (v18 >> 1) & 1;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean PLSCNetworkReachabilityGetFlags(SCNetworkReachabilityRef, SCNetworkReachabilityFlags *)");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PUCloudPhotoWelcomeViewController.m"), 30, CFSTR("%s"), dlerror());

LABEL_32:
    __break(1u);
  }
  v36 = 0;
LABEL_14:
  v19 = PLCPLHasBeenEnabledForCurrentAccount();
  v20 = PLCPLHasBeenWelcomedForCurrentAccount();
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLRestrictionForFeature:", *MEMORY[0x1E0D46FB8]);

  v23 = PLIsRunningInStoreDemoMode();
  +[PUWelcomeSettings sharedInstance](PUWelcomeSettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "cloudPhotoWelcomeBehavior");

  v26 = 1;
  if (!v25)
    goto LABEL_25;
  if (v25 == 1)
    goto LABEL_22;
  if (v25 != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUCloudPhotoWelcomeViewController.m"), 106, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v26 = 0;
  v27 = v37;
  if (!v40)
    v27 = 1;
  v28 = v27 | v36 ^ 1 | v19 | v20;
  if (v22 == 2)
    v28 = 1;
  if (((v28 | v23) & 1) != 0)
  {
LABEL_22:
    PLUIGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)&buf[4] = v40 != 0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v37;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v19;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v36;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v20;
      v47 = 1024;
      *(_DWORD *)v48 = v22 == 2;
      *(_WORD *)&v48[4] = 1024;
      *(_DWORD *)&v48[6] = v26;
      _os_log_impl(&dword_1AAB61000, v29, OS_LOG_TYPE_DEFAULT, "PUCloudPhotoWelcomeViewController: Skipping! (iCloud:%d, iCPL Now:%d, iCPL Before:%d, Online:%d, Already Shown:%d, Restricted:%d, Debug Override:%d)", buf, 0x2Cu);
    }

    v9[2](v9, 0);
  }
  else
  {
LABEL_25:
    PLUIGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)&buf[4] = v40 != 0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v37;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v19;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v36;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v20;
      v47 = 1024;
      *(_DWORD *)v48 = v22 == 2;
      *(_WORD *)&v48[4] = 1024;
      *(_DWORD *)&v48[6] = v26;
      _os_log_impl(&dword_1AAB61000, v30, OS_LOG_TYPE_DEFAULT, "PUCloudPhotoWelcomeViewController: Presenting! (iCloud:%d, iCPL Now:%d, iCPL Before:%d, Online:%d, Already Shown:%d, Restricted:%d, Debug Override:%d)", buf, 0x2Cu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__PUCloudPhotoWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke;
    block[3] = &unk_1E58AB800;
    v43 = v9;
    v42 = v7;
    v44 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
LABEL_29:

}

+ (void)resetLastPresentationInfo
{
  CFPreferencesSetAppValue(CFSTR("iCloudPhotoLibraryHasBeenWelcomedAccountIdentifiers"), 0, CFSTR("com.apple.mobileslideshow"));
  CFPreferencesSetAppValue(CFSTR("iCloudPhotoLibraryHasBeenEnabledAccountIdentifiers"), 0, CFSTR("com.apple.mobileslideshow"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
}

void __112__PUCloudPhotoWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  PUCloudPhotoWelcomeViewController *v3;

  PLCPLRecordWelcomeForCurrentAccount();
  v3 = -[PUCloudPhotoWelcomeViewController initWithCompletionHandler:]([PUCloudPhotoWelcomeViewController alloc], "initWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B270]), "initWithWelcomeController:", v3);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, 1, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end

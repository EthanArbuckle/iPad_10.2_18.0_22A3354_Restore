@implementation PXCloudPhotoWelcomeNavigationController

- (PXCloudPhotoWelcomeNavigationController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudPhotoWelcomeNavigationController.m"), 79, CFSTR("%s is not available as initializer"), "-[PXCloudPhotoWelcomeNavigationController init]");

  abort();
}

- (PXCloudPhotoWelcomeNavigationController)initWithRootViewController:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudPhotoWelcomeNavigationController.m"), 83, CFSTR("%s is not available as initializer"), "-[PXCloudPhotoWelcomeNavigationController initWithRootViewController:]");

  abort();
}

- (PXCloudPhotoWelcomeNavigationController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudPhotoWelcomeNavigationController.m"), 87, CFSTR("%s is not available as initializer"), "-[PXCloudPhotoWelcomeNavigationController initWithCoder:]");

  abort();
}

- (PXCloudPhotoWelcomeNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudPhotoWelcomeNavigationController.m"), 91, CFSTR("%s is not available as initializer"), "-[PXCloudPhotoWelcomeNavigationController initWithNibName:bundle:]");

  abort();
}

- (PXCloudPhotoWelcomeNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudPhotoWelcomeNavigationController.m"), 95, CFSTR("%s is not available as initializer"), "-[PXCloudPhotoWelcomeNavigationController initWithNavigationBarClass:toolbarClass:]");

  abort();
}

- (PXCloudPhotoWelcomeNavigationController)initWithWelcomeController:(id)a3
{
  id v4;
  PXCloudPhotoWelcomeNavigationController *v5;
  PXCloudPhotoWelcomeNavigationController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXCloudPhotoWelcomeNavigationController;
  v5 = -[PXCloudPhotoWelcomeNavigationController initWithRootViewController:](&v8, sel_initWithRootViewController_, v4);
  v6 = v5;
  if (v5)
  {
    -[PXCloudPhotoWelcomeNavigationController setDismissDelegate:](v5, "setDismissDelegate:", v4);
    -[PXCloudPhotoWelcomeNavigationController setNavigationBarHidden:](v6, "setNavigationBarHidden:", 1);
    -[PXCloudPhotoWelcomeNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
  }

  return v6;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCloudPhotoWelcomeNavigationController;
  -[PXCloudPhotoWelcomeNavigationController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, a3, a4);
  -[PXCloudPhotoWelcomeNavigationController dismissDelegate](self, "dismissDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationControllerDidDismissViewController:", self);

}

- (PXCloudPhotoWelcomeNavigationControllerDismissDelegate)dismissDelegate
{
  return (PXCloudPhotoWelcomeNavigationControllerDismissDelegate *)objc_loadWeakRetained((id *)&self->_dismissDelegate);
}

- (void)setDismissDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dismissDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dismissDelegate);
}

+ (BOOL)shouldPresentWelcomeViewController:(BOOL *)a3
{
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedPrimaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isEnabledForDataclass:", *MEMORY[0x1E0C8F380]);
  v7 = v6;
  if (a3)
    *a3 = v6;
  v31 = xmmword_1A7C0CA10;
  v26 = 0;
  v27 = (uint64_t)&v26;
  v28 = 0x2020000000;
  v8 = getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr;
  v29 = getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr;
  if (!getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr)
  {
    v9 = SystemConfigurationLibrary();
    v8 = dlsym(v9, "SCNetworkReachabilityCreateWithAddress");
    *(_QWORD *)(v27 + 24) = v8;
    getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(&v26, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SCNetworkReachabilityRef PLSCNetworkReachabilityCreateWithAddress(CFAllocatorRef, const struct sockaddr *)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXCloudPhotoWelcomeNavigationController.m"), 28, CFSTR("%s"), dlerror());

    goto LABEL_22;
  }
  v10 = (_QWORD *)((uint64_t (*)(_QWORD, __int128 *))v8)(*MEMORY[0x1E0C9AE00], &v31);
  if (v10)
  {
    v25 = 0;
    v26 = 0;
    v27 = (uint64_t)&v26;
    v28 = 0x2020000000;
    v11 = getSCNetworkReachabilityGetFlagsSymbolLoc_ptr;
    v29 = getSCNetworkReachabilityGetFlagsSymbolLoc_ptr;
    if (!getSCNetworkReachabilityGetFlagsSymbolLoc_ptr)
    {
      v12 = SystemConfigurationLibrary();
      v11 = dlsym(v12, "SCNetworkReachabilityGetFlags");
      *(_QWORD *)(v27 + 24) = v11;
      getSCNetworkReachabilityGetFlagsSymbolLoc_ptr = v11;
    }
    _Block_object_dispose(&v26, 8);
    if (v11)
    {
      ((void (*)(_QWORD *, int *))v11)(v10, &v25);
      v13 = (v25 & 2) == 0;
      CFRelease(v10);
      if (v7 & 1 | (v5 == 0) | v13)
      {
        LOBYTE(v10) = 0;
        goto LABEL_18;
      }
      *(_QWORD *)&v31 = 0;
      *((_QWORD *)&v31 + 1) = &v31;
      v32 = 0x2050000000;
      v14 = (void *)getMCProfileConnectionClass_softClass;
      v33 = getMCProfileConnectionClass_softClass;
      if (!getMCProfileConnectionClass_softClass)
      {
        v26 = MEMORY[0x1E0C809B0];
        v27 = 3221225472;
        v28 = (uint64_t)__getMCProfileConnectionClass_block_invoke;
        v29 = &unk_1E51482E0;
        v30 = &v31;
        __getMCProfileConnectionClass_block_invoke((uint64_t)&v26);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 24);
      }
      v15 = objc_retainAutorelease(v14);
      _Block_object_dispose(&v31, 8);
      objc_msgSend(v15, "sharedConnection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v27 = (uint64_t)&v26;
      v28 = 0x2020000000;
      v10 = (_QWORD *)getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr;
      v29 = (void *)getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr;
      if (!getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr)
      {
        v17 = ManagedConfigurationLibrary();
        v10 = dlsym(v17, "MCFeatureCloudPhotoLibraryAllowed");
        *(_QWORD *)(v27 + 24) = v10;
        getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr = (uint64_t)v10;
      }
      _Block_object_dispose(&v26, 8);
      if (v10)
      {
        LOBYTE(v10) = objc_msgSend(v16, "BOOLRestrictionForFeature:", *v10) != 2;

        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMCFeatureCloudPhotoLibraryAllowed(void)");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXCloudPhotoWelcomeNavigationController.m"), 33, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean PLSCNetworkReachabilityGetFlags(SCNetworkReachabilityRef, SCNetworkReachabilityFlags *)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXCloudPhotoWelcomeNavigationController.m"), 29, CFSTR("%s"), dlerror());

    }
LABEL_22:
    __break(1u);
  }
LABEL_18:

  return (char)v10;
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCloudPhotoWelcomeNavigationController.m"), 75, CFSTR("%s is not available as initializer"), "+[PXCloudPhotoWelcomeNavigationController new]");

  abort();
}

@end

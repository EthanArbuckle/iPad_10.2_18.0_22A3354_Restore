@implementation UICloudSharingController

- (uint64_t)_commonInit
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];

  objc_msgSend(a1, "preparationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "share");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(a1, "container");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", sel__commonInit, a1, CFSTR("UICloudSharingController.m"), 120, CFSTR("Must have either share or preparation handler set"));
  }

LABEL_6:
  objc_msgSend(a1, "preparationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "share");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 1;
  }

  if (IsGelatoEnabled() && (dyld_program_sdk_at_least() ^ 1 | v8) != 1)
    return 1;
  v9 = (void *)MEMORY[0x1E0CB35D8];
  CloudSharingUIExtensionBundleID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionWithIdentifier:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11 != 0;
  if (v11)
  {
    v13 = dispatch_semaphore_create(0);
    v14 = (void *)a1[121];
    a1[121] = v13;

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __39__UICloudSharingController__commonInit__block_invoke;
    v18[3] = &unk_1E16ED3D8;
    v18[4] = a1;
    +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:completion:](_UIResilientRemoteViewContainerViewController, "instantiateWithExtension:completion:", v11, v18);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addResizingChildViewController:", v15);
    v16 = (void *)a1[127];
    a1[127] = v15;

    objc_msgSend(a1, "setModalPresentationStyle:", 7);
    objc_msgSend(a1, "setPreferredContentSize:", 375.0, 636.0);
  }

  return v12;
}

void __39__UICloudSharingController__commonInit__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_opt_class();
    NSLog(CFSTR("Remote view controller error while displaying %@: %@"), v7, v6);
  }
  else
  {
    objc_msgSend(v16, "setPublicController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v16, "serviceViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD **)(a1 + 32);
    if (v9[124])
    {
      objc_msgSend(v9, "share");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "container");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "containerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setCloudKitShare:containerID:", v10, v12);
    }
    else
    {
      objc_msgSend(v9, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemTitleForCloudSharingController:", *(_QWORD *)(a1 + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "itemThumbnailDataForCloudSharingController:", *(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "itemTypeForCloudSharingController:", *(_QWORD *)(a1 + 32));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v8, "_setCloudKitThumbnail:title:type:", v11, v12, v13);

    }
    v14 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v14 + 1040))
    {
      objc_msgSend(v8, "_setCloudKitContainerSetupInfo:");
      v14 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v14 + 1048))
    {
      objc_msgSend(v8, "_setParticipantDetails:");
      v14 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v14 + 1080))
      {
        objc_msgSend(v8, "_setSectionTitleForAuxiliarySwitches:");
        v14 = *(_QWORD *)(a1 + 32);
      }
      if (*(_QWORD *)(v14 + 1088))
      {
        objc_msgSend(v8, "_setPrimaryAuxiliarySwitchTitle:");
        v14 = *(_QWORD *)(a1 + 32);
      }
      if (*(_BYTE *)(v14 + 977))
      {
        objc_msgSend(v8, "_setPrimaryAuxiliarySwitchState:", 1);
        v14 = *(_QWORD *)(a1 + 32);
      }
      if (*(_QWORD *)(v14 + 1096))
      {
        objc_msgSend(v8, "_setSecondaryAuxiliarySwitchTitle:");
        v14 = *(_QWORD *)(a1 + 32);
      }
      if (*(_BYTE *)(v14 + 978))
      {
        objc_msgSend(v8, "_setSecondaryAuxiliarySwitchState:", 1);
        v14 = *(_QWORD *)(a1 + 32);
      }
    }
    if (*(_QWORD *)(v14 + 1104))
    {
      objc_msgSend(v8, "_setRootFolderTitle:");
      v14 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v14 + 1112))
    {
      objc_msgSend(v8, "_setFolderSubitemName:");
      v14 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v14 + 1120))
    {
      objc_msgSend(v8, "_setHeaderPrimaryImage:");
      v14 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v14 + 1128))
      objc_msgSend(v8, "_setHeaderSecondaryImage:");
    objc_msgSend((id)UIApp, "_localizedApplicationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setAppName:", v15);

    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000))
      objc_msgSend(v8, "_setAvailablePermissions:");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 968));

}

- (UICloudSharingController)initWithShare:(CKShare *)share container:(CKContainer *)container
{
  CKShare *v6;
  CKContainer *v7;
  UICloudSharingController *v8;
  UICloudSharingController *v9;
  UICloudSharingController *v10;
  objc_super v12;

  v6 = share;
  v7 = container;
  v12.receiver = self;
  v12.super_class = (Class)UICloudSharingController;
  v8 = -[UIViewController init](&v12, sel_init);
  v9 = v8;
  if (v8
    && (-[UICloudSharingController setShare:](v8, "setShare:", v6),
        -[UICloudSharingController setContainer:](v9, "setContainer:", v7),
        !-[UICloudSharingController _commonInit](v9)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (UICloudSharingController)initWithShare:(id)a3 preparationHandler:(id)a4
{
  id v7;
  id v8;
  UICloudSharingController *v9;
  void *v10;
  unint64_t v11;
  UICloudSharingController *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UICloudSharingController;
  v9 = -[UIViewController init](&v17, sel_init);
  if (!v9)
    goto LABEL_5;
  objc_msgSend(v7, "participants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_initWithShare_container_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("UICloudSharingController.m"), 255, CFSTR("Share passed in to %@ has multiple participants. Use %@ for an existing share."), v15, v16);

  }
  -[UICloudSharingController setShare:](v9, "setShare:", v7);
  -[UICloudSharingController setPreparationHandler:](v9, "setPreparationHandler:", v8);
  if (!-[UICloudSharingController _commonInit](v9))
    v12 = 0;
  else
LABEL_5:
    v12 = v9;

  return v12;
}

- (UICloudSharingController)initWithPreparationHandler:(void *)preparationHandler
{
  void *v4;
  UICloudSharingController *v5;
  UICloudSharingController *v6;
  UICloudSharingController *v7;
  objc_super v9;

  v4 = preparationHandler;
  v9.receiver = self;
  v9.super_class = (Class)UICloudSharingController;
  v5 = -[UIViewController init](&v9, sel_init);
  v6 = v5;
  if (v5
    && (-[UICloudSharingController setPreparationHandler:](v5, "setPreparationHandler:", v4),
        !-[UICloudSharingController _commonInit](v6)))
  {
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UICloudSharingController _remoteViewController](self, "_remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPublicController:", 0);

  v4.receiver = self;
  v4.super_class = (Class)UICloudSharingController;
  -[UIViewController dealloc](&v4, sel_dealloc);
}

- (void)__viewControllerWillBePresented:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _UISharingControllerActivityItemProvider *v9;
  uint64_t v10;
  _UISharingControllerActivityItemProvider *v11;
  UIActivityItemsConfiguration *v12;
  void *v13;
  UIActivityItemsConfiguration *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, int, uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD v24[5];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[UICloudSharingController preparationHandler](self, "preparationHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UICloudSharingController share](self, "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 1;
  }

  if (IsGelatoEnabled() && ((dyld_program_sdk_at_least() ^ 1 | v6) & 1) == 0)
  {
    -[UICloudSharingController _activityViewController](self, "_activityViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend((id)objc_opt_class(), "allowedSharingOptionsFromPermissions:", -[UICloudSharingController availablePermissions](self, "availablePermissions"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = [_UISharingControllerActivityItemProvider alloc];
      v10 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke;
      v24[3] = &unk_1E16ED478;
      v24[4] = self;
      v11 = -[_UISharingControllerActivityItemProvider initWithCKSharePreparationHandler:allowedSharingOptions:](v9, "initWithCKSharePreparationHandler:allowedSharingOptions:", v24, v8);
      v12 = [UIActivityItemsConfiguration alloc];
      v25[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[UIActivityItemsConfiguration initWithItemProviders:](v12, "initWithItemProviders:", v13);

      objc_initWeak(&location, self);
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_7;
      v21[3] = &unk_1E16ED4A0;
      objc_copyWeak(&v22, &location);
      -[UIActivityItemsConfiguration setPerItemMetadataProvider:](v14, "setPerItemMetadataProvider:", v21);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItemsConfiguration:", v14);
      objc_msgSend(v15, "setAllowsEmbedding:", 1);
      objc_msgSend(v15, "setCollaborationMode:", 4);
      v16 = v10;
      v17 = 3221225472;
      v18 = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_8;
      v19 = &unk_1E16ED4C8;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v15, "setCompletionWithItemsHandler:", &v16);
      -[UICloudSharingController addResizingChildViewController:](self, "addResizingChildViewController:", v15, v16, v17, v18, v19);
      -[UICloudSharingController _setActivityViewController:](self, "_setActivityViewController:", v15);
      objc_destroyWeak(&v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

    }
  }
}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void (*v6)(_QWORD *, uint64_t, _QWORD *);
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "preparationHandler");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_2;
  v8[3] = &unk_1E16ED450;
  v8[4] = v5;
  v9 = v3;
  v6 = (void (*)(_QWORD *, uint64_t, _QWORD *))v4[2];
  v7 = v3;
  v6(v4, v5, v8);

}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v10 = (void *)getCKSystemSharingUIObserverClass_softClass;
  v26 = getCKSystemSharingUIObserverClass_softClass;
  v11 = MEMORY[0x1E0C809B0];
  if (!getCKSystemSharingUIObserverClass_softClass)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __getCKSystemSharingUIObserverClass_block_invoke;
    v22[3] = &unk_1E16B14C0;
    v22[4] = &v23;
    __getCKSystemSharingUIObserverClass_block_invoke((uint64_t)v22);
    v10 = (void *)v24[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v23, 8);
  v13 = (void *)objc_msgSend([v12 alloc], "initWithContainer:", v8);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_3;
  v19[3] = &unk_1E16ED400;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v13, "setSystemSharingUIDidSaveShareBlock:", v19);
  v14 = v11;
  v15 = 3221225472;
  v16 = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_5;
  v17 = &unk_1E16ED428;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v13, "setSystemSharingUIDidStopSharingBlock:", &v14);
  objc_msgSend(*(id *)(a1 + 32), "_setSystemSharingUIObserver:", v13, v14, v15, v16, v17);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  _QWORD block[5];
  id v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      NSLog(CFSTR("systemSharingUIDidSaveShareBlock received error: %@"), v7);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_4;
      block[3] = &unk_1E16B1B50;
      block[4] = WeakRetained;
      v11 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shareDidChange:", *(_QWORD *)(a1 + 40));
}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  _QWORD block[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      NSLog(CFSTR("systemSharingUIDidStopSharingBlock received error: %@"), v4);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_6;
      block[3] = &unk_1E16B1B28;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDidStopSharingDelegate");
}

id __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("linkPresentationMetadata")))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "createActivityLinkMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id WeakRetained;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (a3)
  {
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v8, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cloudSharingControllerDidSaveShare:", v8);
LABEL_6:

    }
  }
  else if (v12)
  {
    objc_msgSend(WeakRetained, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudSharingController:failedToSaveShareWithError:", v8, v12);
    goto LABEL_6;
  }

}

- (id)createActivityLinkMetadata
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  -[UICloudSharingController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v4 = (void *)qword_1ECD7B460;
  v26 = qword_1ECD7B460;
  if (!qword_1ECD7B460)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getLPLinkMetadataClass_block_invoke_1;
    v21 = &unk_1E16B14C0;
    v22 = &v23;
    __getLPLinkMetadataClass_block_invoke_1((uint64_t)&v18);
    v4 = (void *)v24[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v23, 8);
  v6 = objc_alloc_init(v5);
  objc_msgSend(v3, "itemTitleForCloudSharingController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "itemThumbnailDataForCloudSharingController:", self);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v23 = 0;
      v24 = &v23;
      v25 = 0x2050000000;
      v10 = (void *)qword_1ECD7B468;
      v26 = qword_1ECD7B468;
      if (!qword_1ECD7B468)
      {
        v18 = MEMORY[0x1E0C809B0];
        v19 = 3221225472;
        v20 = __getLPImagePropertiesClass_block_invoke;
        v21 = &unk_1E16B14C0;
        v22 = &v23;
        __getLPImagePropertiesClass_block_invoke((uint64_t)&v18);
        v10 = (void *)v24[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v23, 8);
      v12 = objc_alloc_init(v11);
      objc_msgSend(v12, "setType:", 5);
      +[UIImage imageWithData:](UIImage, "imageWithData:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v24 = &v23;
      v25 = 0x2050000000;
      v14 = (void *)qword_1ECD7B470;
      v26 = qword_1ECD7B470;
      if (!qword_1ECD7B470)
      {
        v18 = MEMORY[0x1E0C809B0];
        v19 = 3221225472;
        v20 = __getLPImageClass_block_invoke;
        v21 = &unk_1E16B14C0;
        v22 = &v23;
        __getLPImageClass_block_invoke((uint64_t)&v18);
        v14 = (void *)v24[3];
      }
      v15 = objc_retainAutorelease(v14);
      _Block_object_dispose(&v23, 8);
      v16 = (void *)objc_msgSend([v15 alloc], "initWithPlatformImage:properties:", v13, v12);
      objc_msgSend(v6, "setIcon:", v16);

    }
  }

  return v6;
}

- (void)setContainer:(id)a3
{
  CKContainerSetupInfo *v5;
  CKContainerSetupInfo *containerSetupInfo;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_container, a3);
  objc_msgSend(v10, "setupInfo");
  v5 = (CKContainerSetupInfo *)objc_claimAutoreleasedReturnValue();
  containerSetupInfo = self->_containerSetupInfo;
  self->_containerSetupInfo = v5;

  if (self->_containerSetupInfo)
  {
    -[UICloudSharingController _childViewController](self, "_childViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceViewControllerProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setCloudKitContainerSetupInfo:", self->_containerSetupInfo);
  }

}

- (void)_callPreparationHandler:(id)a3
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[UICloudSharingController preparationHandler](self, "preparationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UICloudSharingController preparationHandler](self, "preparationHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__UICloudSharingController__callPreparationHandler___block_invoke;
    v8[3] = &unk_1E16ED540;
    v10 = a2;
    v8[4] = self;
    v9 = v5;
    ((void (**)(_QWORD, UICloudSharingController *, _QWORD *))v7)[2](v7, self, v8);

  }
}

void __52__UICloudSharingController__callPreparationHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
    v11 = v7 == 0;
  else
    v11 = 1;
  if (v11 && !v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("UICloudSharingController.m"), 469, CFSTR("%@ preparation handler was called with a nil share or container, but no error"), objc_opt_class());

  }
  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UICloudSharingController__callPreparationHandler___block_invoke_2;
  block[3] = &unk_1E16ED518;
  v13 = a1[4];
  v14 = (void *)a1[5];
  v20 = v10;
  v21 = v13;
  v23 = v8;
  v24 = v14;
  v22 = v7;
  v15 = v8;
  v16 = v7;
  v17 = v10;
  dispatch_async(v12, block);

}

void __52__UICloudSharingController__callPreparationHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  dispatch_time_t v4;
  uint64_t v5;
  id v6;
  id v7;
  int8x16_t v8;
  _QWORD block[4];
  id v10;
  int8x16_t v11;
  id v12;
  id v13;
  id v14;

  v2 = *(id *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 968);
  v4 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4097, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v5;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UICloudSharingController__callPreparationHandler___block_invoke_3;
  block[3] = &unk_1E16ED4F0;
  v10 = v2;
  v8 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v8.i64[0];
  v11 = vextq_s8(v8, v8, 8uLL);
  v14 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v7 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __52__UICloudSharingController__callPreparationHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__UICloudSharingController__callPreparationHandler___block_invoke_4;
    block[3] = &unk_1E16BAD68;
    v2 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v8 = v2;
    v9 = *(id *)(a1 + 72);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 992), "participants");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 976) = (unint64_t)objc_msgSend(v3, "count") < 2;

    objc_msgSend(*(id *)(a1 + 40), "setShare:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "setContainer:", *(_QWORD *)(a1 + 64));
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "containerID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v6);

  }
}

uint64_t __52__UICloudSharingController__callPreparationHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_dismissViewControllerWithError:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)addResizingChildViewController:(id)a3
{
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
  id v27;

  v27 = a3;
  objc_msgSend(v27, "beginAppearanceTransition:animated:", 1, 0);
  -[UIViewController addChildViewController:](self, "addChildViewController:", v27);
  objc_msgSend(v27, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 7, 0, v10, 7, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addConstraint:", v11);

  -[UIViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 8, 0, v15, 8, 1.0, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraint:", v16);

  -[UIViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 1, 0, v20, 1, 1.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraint:", v21);

  -[UIViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 3, 0, v25, 3, 1.0, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addConstraint:", v26);

  objc_msgSend(v27, "didMoveToParentViewController:", self);
  objc_msgSend(v27, "endAppearanceTransition");

}

- (void)_didDismiss
{
  int has_internal_diagnostics;
  UIViewController *strongReferenceToOurself;
  UIViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD);
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  _QWORD aBlock[5];
  uint8_t buf[4];
  UICloudSharingController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UICloudSharingController setPreparationHandler:](self, "setPreparationHandler:", 0);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  strongReferenceToOurself = self->_strongReferenceToOurself;
  if (has_internal_diagnostics)
  {
    if (strongReferenceToOurself)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Cyclic reference to %@ wasn't cleared out. This means that the view service didn't call us back.", buf, 0xCu);
      }

    }
  }
  else if (strongReferenceToOurself)
  {
    v12 = _didDismiss___s_category;
    if (!_didDismiss___s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_didDismiss___s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Cyclic reference to %@ wasn't cleared out. This means that the view service didn't call us back.", buf, 0xCu);
    }
  }
  v5 = self->_strongReferenceToOurself;
  self->_strongReferenceToOurself = 0;

  -[UICloudSharingController _childViewController](self, "_childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPublicController:", 0);

  -[UICloudSharingController _childViewController](self, "_childViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__UICloudSharingController__didDismiss__block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (self->_shareNeedsDeletion
    && (-[UICloudSharingController share](self, "share"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    -[UICloudSharingController _deleteShareAfterDismissalWithoutSave:](self, "_deleteShareAfterDismissalWithoutSave:", v9);
  }
  else
  {
    v9[2](v9);
  }

}

void __39__UICloudSharingController__didDismiss__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "internalDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "_cloudShareControllerDidDismiss:", *(_QWORD *)(a1 + 32));

}

- (void)_deleteShareAfterDismissalWithoutSave:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v5 = (void *)getCKModifyRecordsOperationClass_softClass;
  v21 = getCKModifyRecordsOperationClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getCKModifyRecordsOperationClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getCKModifyRecordsOperationClass_block_invoke;
    v17[3] = &unk_1E16B14C0;
    v17[4] = &v18;
    __getCKModifyRecordsOperationClass_block_invoke((uint64_t)v17);
    v5 = (void *)v19[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v18, 8);
  v8 = [v7 alloc];
  -[CKShare recordID](self->_share, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithRecordsToSave:recordIDsToDelete:", MEMORY[0x1E0C9AA60], v10);

  objc_msgSend(v11, "setQualityOfService:", 25);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __66__UICloudSharingController__deleteShareAfterDismissalWithoutSave___block_invoke;
  v15[3] = &unk_1E16ED568;
  v15[4] = self;
  v16 = v4;
  v12 = v4;
  objc_msgSend(v11, "setModifyRecordsCompletionBlock:", v15);
  -[UICloudSharingController container](self, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "privateCloudDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v11);

}

void __66__UICloudSharingController__deleteShareAfterDismissalWithoutSave___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__UICloudSharingController__deleteShareAfterDismissalWithoutSave___block_invoke_2;
  block[3] = &unk_1E16BB458;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v12 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__UICloudSharingController__deleteShareAfterDismissalWithoutSave___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[5];
  if (a1[4])
  {
    objc_msgSend(v2, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cloudSharingController:failedToSaveShareWithError:", a1[5], a1[4]);

  }
  else
  {
    objc_msgSend(v2, "_sendDidStopSharingDelegate");
  }
}

- (void)_dismissViewControllerWithError:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  UICloudSharingController *v12;
  id v13;

  v4 = a3;
  if (!-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __60__UICloudSharingController__dismissViewControllerWithError___block_invoke;
    v11 = &unk_1E16B1B50;
    v12 = self;
    v13 = v4;
    v5 = (void (**)(_QWORD))_Block_copy(&v8);
    -[UIViewController presentingViewController](self, "presentingViewController", v8, v9, v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIViewController presentingViewController](self, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v5);

    }
    else
    {
      v5[2](v5);
    }

  }
}

void __60__UICloudSharingController__dismissViewControllerWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_didDismiss");
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cloudSharingController:failedToSaveShareWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (id)activityItemSource
{
  _UISharingControllerActivityItemSource *v3;

  v3 = objc_alloc_init(_UISharingControllerActivityItemSource);
  -[_UISharingControllerActivityItemSource setViewController:](v3, "setViewController:", self);
  return v3;
}

- (void)_setParticipantDetails:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *participantDetails;
  void *v7;
  void *v8;
  id v9;

  if (self->_participantDetails != a3)
  {
    v4 = a3;
    v5 = (NSDictionary *)objc_msgSend(v4, "copy");
    participantDetails = self->_participantDetails;
    self->_participantDetails = v5;

    -[UICloudSharingController _childViewController](self, "_childViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceViewControllerProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setParticipantDetails:", v4);
  }
}

- (void)_setSectionTitleForAuxiliarySwitches:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *sectionTitleForAuxiliarySwitches;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  if (self->_sectionTitleForAuxiliarySwitches != v4)
  {
    v10 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    sectionTitleForAuxiliarySwitches = self->_sectionTitleForAuxiliarySwitches;
    self->_sectionTitleForAuxiliarySwitches = v5;

    -[UICloudSharingController _childViewController](self, "_childViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceViewControllerProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "_setSectionTitleForAuxiliarySwitches:", v10);

    v4 = v10;
  }

}

- (void)_setPrimaryAuxiliarySwitchTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *primaryAuxiliarySwitchTitle;
  void *v7;
  void *v8;
  id v9;

  if (self->_primaryAuxiliarySwitchTitle != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    primaryAuxiliarySwitchTitle = self->_primaryAuxiliarySwitchTitle;
    self->_primaryAuxiliarySwitchTitle = v5;

    -[UICloudSharingController _childViewController](self, "_childViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceViewControllerProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setPrimaryAuxiliarySwitchTitle:", v4);
  }
}

- (void)_setPrimaryAuxiliarySwitchState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  self->_primaryAuxiliarySwitchState = a3;
  -[UICloudSharingController _childViewController](self, "_childViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceViewControllerProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_setPrimaryAuxiliarySwitchState:", v3);
}

- (void)_setSecondaryAuxiliarySwitchTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *secondaryAuxiliarySwitchTitle;
  void *v7;
  void *v8;
  id v9;

  if (self->_secondaryAuxiliarySwitchTitle != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    secondaryAuxiliarySwitchTitle = self->_secondaryAuxiliarySwitchTitle;
    self->_secondaryAuxiliarySwitchTitle = v5;

    -[UICloudSharingController _childViewController](self, "_childViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceViewControllerProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setSecondaryAuxiliarySwitchTitle:", v4);
  }
}

- (void)_setSecondaryAuxiliarySwitchState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  self->_secondaryAuxiliarySwitchState = a3;
  -[UICloudSharingController _childViewController](self, "_childViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceViewControllerProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_setSecondaryAuxiliarySwitchState:", v3);
}

- (void)_setRootFolderTitle:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_rootFolderTitle, a3);
  v5 = a3;
  -[UICloudSharingController _childViewController](self, "_childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_setRootFolderTitle:", v5);
}

- (void)_setFolderSubitemName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_folderSubitemName, a3);
  v5 = a3;
  -[UICloudSharingController _childViewController](self, "_childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_setFolderSubitemName:", v5);
}

- (void)_setHeaderPrimaryImage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_headerPrimaryImage, a3);
  v5 = a3;
  -[UICloudSharingController _childViewController](self, "_childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_setHeaderPrimaryImage:", v5);
}

- (void)_setHeaderSecondaryImage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_headerSecondaryImage, a3);
  v5 = a3;
  -[UICloudSharingController _childViewController](self, "_childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_setHeaderSecondaryImage:", v5);
}

- (int64_t)modalPresentationStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICloudSharingController;
  return -[UIViewController modalPresentationStyle](&v3, sel_modalPresentationStyle);
}

- (BOOL)_requiresCustomPresentationController
{
  return -[UICloudSharingController modalPresentationStyle](self, "modalPresentationStyle") == 7;
}

- (id)_customPresentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UISharingViewPresentationController *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[UIPopoverPresentationController initWithPresentedViewController:presentingViewController:]([_UISharingViewPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v9);
  objc_initWeak(&location, self);
  objc_msgSend(v10, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController setSourceView:](v11, "setSourceView:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __118__UICloudSharingController__customPresentationControllerForPresentedController_presentingController_sourceController___block_invoke;
  v14[3] = &unk_1E16B3F40;
  objc_copyWeak(&v15, &location);
  -[_UISharingViewPresentationController setDismissalHandler:](v11, "setDismissalHandler:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __118__UICloudSharingController__customPresentationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didDismiss");

}

- (id)_sharingViewPresentationController
{
  void *v2;
  id v3;

  -[UIViewController presentationController](self, "presentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)_dismissForActivityRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[UIViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICloudSharingController _setOriginalPresentingViewController:](self, "_setOriginalPresentingViewController:", v5);

  -[UICloudSharingController _sharingViewPresentationController](self, "_sharingViewPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuppressDismissalHandlerUnlessDimmingViewTapped:", 1);

  -[UIViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__UICloudSharingController__dismissForActivityRepresentation___block_invoke;
  v9[3] = &unk_1E16B1D18;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v9);

}

uint64_t __62__UICloudSharingController__dismissForActivityRepresentation___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1072), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_representFullscreenAfterActivityDismissal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIViewController *strongReferenceToOurself;

  v4 = a3;
  -[UIViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 5);
  -[UICloudSharingController _sharingViewPresentationController](self, "_sharingViewPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressDismissalHandlerUnlessDimmingViewTapped:", 0);

  -[UICloudSharingController _originalPresentingViewController](self, "_originalPresentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", self, 0, v4);

  strongReferenceToOurself = self->_strongReferenceToOurself;
  self->_strongReferenceToOurself = 0;

  objc_storeWeak((id *)&self->_originalPresentingViewController, 0);
}

- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  char v5;
  id v6;
  id to;

  v3 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v4 = objc_loadWeakRetained(&to);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(&to);
    objc_msgSend(v6, "_cloudSharingControllerDidModifyPrimarySwitch:", v3);

  }
  objc_destroyWeak(&to);
}

- (void)_cloudSharingControllerDidModifySecondarySwitch:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  char v5;
  id v6;
  id to;

  v3 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v4 = objc_loadWeakRetained(&to);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(&to);
    objc_msgSend(v6, "_cloudSharingControllerDidModifySecondarySwitch:", v3);

  }
  objc_destroyWeak(&to);
}

- (void)_cloudSharingControllerDidActivateShowSharedFolder
{
  id v2;
  char v3;
  id v4;
  id to;

  objc_copyWeak(&to, (id *)&self->_delegate);
  v2 = objc_loadWeakRetained(&to);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained(&to);
    objc_msgSend(v4, "_cloudSharingControllerDidActivateShowSharedFolder");

  }
  objc_destroyWeak(&to);
}

+ (id)allowedSharingOptionsFromPermissions:(unint64_t)a3
{
  void *v3;

  if (a3)
  {
    v3 = (void *)objc_msgSend(objc_alloc((Class)getCKAllowedSharingOptionsClass()), "initWithAllowedParticipantPermissionOptions:allowedParticipantAccessOptions:", (a3 >> 2) & 3, a3 & 3);
  }
  else
  {
    objc_msgSend(getCKAllowedSharingOptionsClass(), "standardOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)excludedActivityTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__UICloudSharingController_excludedActivityTypes__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1ECD7B458 != -1)
    dispatch_once(&qword_1ECD7B458, block);
  return (id)_MergedGlobals_7_16;
}

void __49__UICloudSharingController_excludedActivityTypes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0D96D98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_7_16;
  _MergedGlobals_7_16 = v2;

  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.reminders"));

  if (v7)
  {
    objc_msgSend((id)_MergedGlobals_7_16, "arrayByAddingObject:", *MEMORY[0x1E0D96DA8]);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_MergedGlobals_7_16;
    _MergedGlobals_7_16 = v8;

  }
}

- (void)_cloudSharingControllerDidActivateShowActivityController
{
  double MidX;
  void *v4;
  id v5;
  CGRect v6;
  CGRect v7;

  -[UIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  MidX = CGRectGetMidX(v6);
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UICloudSharingController _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:](self, "_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:", MidX, CGRectGetMidY(v7), 0.0, 0.0);

}

- (void)_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  void *v12;
  void *v13;
  void *v14;
  _UISharingControllerActivityItemProvider *v15;
  void *v16;
  void *v17;
  _UISharingControllerActivityItemProvider *v18;
  UIActivityItemsConfiguration *v19;
  void *v20;
  UIActivityItemsConfiguration *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  -[UICloudSharingController share](self, "share");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICloudSharingController.m"), 826, CFSTR("%s: Expect a CKShare while presenting share sheet"), "-[UICloudSharingController _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:]");

  }
  -[UICloudSharingController container](self, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICloudSharingController.m"), 827, CFSTR("%s: Expect a CKShare while presenting share sheet"), "-[UICloudSharingController _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:]");

  }
  objc_msgSend((id)objc_opt_class(), "allowedSharingOptionsFromPermissions:", -[UICloudSharingController availablePermissions](self, "availablePermissions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [_UISharingControllerActivityItemProvider alloc];
  -[UICloudSharingController share](self, "share");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICloudSharingController container](self, "container");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[_UISharingControllerActivityItemProvider initWithCKShare:container:allowedSharingOptions:](v15, "initWithCKShare:container:allowedSharingOptions:", v16, v17, v14);

  v19 = [UIActivityItemsConfiguration alloc];
  v35[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[UIActivityItemsConfiguration initWithItemProviders:](v19, "initWithItemProviders:", v20);

  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __104__UICloudSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke;
  v32[3] = &unk_1E16ED4A0;
  objc_copyWeak(&v33, &location);
  -[UIActivityItemsConfiguration setPerItemMetadataProvider:](v21, "setPerItemMetadataProvider:", v32);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItemsConfiguration:", v21);
  objc_msgSend(v23, "setCollaborationMode:", 4);
  -[UICloudSharingController excludedActivityTypes](self, "excludedActivityTypes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setExcludedActivityTypes:", v24);

  -[UIViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "popoverPresentationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSourceView:", v25);

  objc_msgSend(v23, "popoverPresentationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSourceRect:", a3, a4, a5, a6);

  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __104__UICloudSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke_2;
  v30[3] = &unk_1E16ED4C8;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v23, "setCompletionWithItemsHandler:", v30);
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

id __104__UICloudSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("linkPresentationMetadata")))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "createActivityLinkMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __104__UICloudSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id *v5;
  id v6;
  id WeakRetained;

  if (a3)
  {
    v5 = (id *)(a1 + 32);
    v6 = a5;
    WeakRetained = objc_loadWeakRetained(v5);
    objc_msgSend(WeakRetained, "_dismissViewControllerWithError:", v6);

  }
}

- (void)_cloudSharingControllerDidChooseTransport:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v5 = objc_loadWeakRetained(&to);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "_cloudSharingControllerDidChooseTransport:", v4);

  }
  objc_destroyWeak(&to);

}

- (void)_shareDidChange:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  id to;

  v4 = a3;
  if (v4)
    -[UICloudSharingController setShare:](self, "setShare:", v4);
  self->_shareNeedsDeletion = 0;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v5 = objc_loadWeakRetained(&to);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "cloudSharingControllerDidSaveShare:", self);

  }
  objc_destroyWeak(&to);

}

- (void)_shareWasMadePrivate
{
  self->_shareNeedsDeletion = 0;
  -[UICloudSharingController _sendDidStopSharingDelegate](self, "_sendDidStopSharingDelegate");
}

- (void)_sendDidStopSharingDelegate
{
  id v3;
  char v4;
  id v5;
  id to;

  objc_copyWeak(&to, (id *)&self->_delegate);
  v3 = objc_loadWeakRetained(&to);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained(&to);
    objc_msgSend(v5, "cloudSharingControllerDidStopSharing:", self);

  }
  objc_destroyWeak(&to);
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  void *v2;
  void *v3;

  -[UICloudSharingController _childViewController](self, "_childViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIRemoteViewController *)v3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (UICloudSharingPermissionOptions)availablePermissions
{
  return self->_availablePermissions;
}

- (void)setAvailablePermissions:(UICloudSharingPermissionOptions)availablePermissions
{
  self->_availablePermissions = availablePermissions;
}

- (UIActivityViewController)_activityViewController
{
  return self->_activityViewController;
}

- (void)_setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (_UIResilientRemoteViewContainerViewController)_childViewController
{
  return self->_childViewController;
}

- (void)_setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (_UIShareInvitationRemoteViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_containerSetupInfo, a3);
}

- (NSDictionary)_participantDetails
{
  return self->_participantDetails;
}

- (id)preparationHandler
{
  return self->_preparationHandler;
}

- (void)setPreparationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (UIViewController)_originalPresentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_originalPresentingViewController);
}

- (void)_setOriginalPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_originalPresentingViewController, a3);
}

- (UIViewController)_strongReferenceToOurself
{
  return self->_strongReferenceToOurself;
}

- (void)_setStrongReferenceToOurself:(id)a3
{
  objc_storeStrong((id *)&self->_strongReferenceToOurself, a3);
}

- (NSString)_sectionTitleForAuxiliarySwitches
{
  return self->_sectionTitleForAuxiliarySwitches;
}

- (NSString)_primaryAuxiliarySwitchTitle
{
  return self->_primaryAuxiliarySwitchTitle;
}

- (BOOL)_primaryAuxiliarySwitchState
{
  return self->_primaryAuxiliarySwitchState;
}

- (NSString)_secondaryAuxiliarySwitchTitle
{
  return self->_secondaryAuxiliarySwitchTitle;
}

- (BOOL)_secondaryAuxiliarySwitchState
{
  return self->_secondaryAuxiliarySwitchState;
}

- (NSString)_rootFolderTitle
{
  return self->_rootFolderTitle;
}

- (NSString)_folderSubitemName
{
  return self->_folderSubitemName;
}

- (UIImage)_headerPrimaryImage
{
  return self->_headerPrimaryImage;
}

- (UIImage)_headerSecondaryImage
{
  return self->_headerSecondaryImage;
}

- (CKSystemSharingUIObserver)_systemSharingUIObserver
{
  return self->_systemSharingUIObserver;
}

- (void)_setSystemSharingUIObserver:(id)a3
{
  objc_storeStrong((id *)&self->_systemSharingUIObserver, a3);
}

- (_UICloudSharingControllerDelegate_Internal)internalDelegate
{
  return (_UICloudSharingControllerDelegate_Internal *)objc_loadWeakRetained((id *)&self->_internalDelegate);
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_systemSharingUIObserver, 0);
  objc_storeStrong((id *)&self->_headerSecondaryImage, 0);
  objc_storeStrong((id *)&self->_headerPrimaryImage, 0);
  objc_storeStrong((id *)&self->_folderSubitemName, 0);
  objc_storeStrong((id *)&self->_rootFolderTitle, 0);
  objc_storeStrong((id *)&self->_secondaryAuxiliarySwitchTitle, 0);
  objc_storeStrong((id *)&self->_primaryAuxiliarySwitchTitle, 0);
  objc_storeStrong((id *)&self->_sectionTitleForAuxiliarySwitches, 0);
  objc_storeStrong((id *)&self->_strongReferenceToOurself, 0);
  objc_destroyWeak((id *)&self->_originalPresentingViewController);
  objc_storeStrong(&self->_preparationHandler, 0);
  objc_storeStrong((id *)&self->_participantDetails, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewServiceValidSema, 0);
}

@end

@implementation PUOneUpAccessoryViewControllersManager

- (PUOneUpAccessoryViewControllersManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpAccessoryViewControllersManager.m"), 45, CFSTR("%s is not available as initializer"), "-[PUOneUpAccessoryViewControllersManager init]");

  abort();
}

- (PUOneUpAccessoryViewControllersManager)initWithBrowsingSession:(id)a3 spec:(id)a4
{
  id v7;
  id v8;
  PUOneUpAccessoryViewControllersManager *v9;
  PUOneUpAccessoryViewControllersManager *v10;
  void *v11;
  uint64_t v12;
  NSMapTable *accessoryViewControllers;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUOneUpAccessoryViewControllersManager;
  v9 = -[PUOneUpAccessoryViewControllersManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_browsingSession, a3);
    -[PUBrowsingSession viewModel](v10->_browsingSession, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerChangeObserver:", v10);

    objc_storeStrong((id *)&v10->__spec, a4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    accessoryViewControllers = v10->__accessoryViewControllers;
    v10->__accessoryViewControllers = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0D7B7D0], "preloadResources");
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.preventRevealInMomentActionForAssetReference = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.preventInternalFileRadarActionForAssetReference = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.requestDismissal = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.invalidateAccessoryLayout = objc_opt_respondsToSelector() & 1;
  }

}

- (int64_t)accessoryViewTypeForAsset:(id)a3
{
  id v5;
  int64_t v6;
  void *v8;

  v5 = a3;
  v6 = -[PUOneUpAccessoryViewControllersManager _accessoryViewTypeForAsset:](self, "_accessoryViewTypeForAsset:", v5);
  switch(v6)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpAccessoryViewControllersManager.m"), 82, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 2:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_6;
      goto LABEL_5;
    case 3:
      if (!+[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v5))goto LABEL_5;
      goto LABEL_6;
    case 4:
      goto LABEL_6;
    default:
LABEL_5:
      v6 = 0;
LABEL_6:

      return v6;
  }
}

- (BOOL)_isPhoneAndLandscape
{
  void *v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "orientation");

  if ((unint64_t)(v6 - 1) > 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "interfaceOrientation");

    v7 = v12 - 3;
  }
  else
  {
    v7 = v6 - 3;
  }
  return v7 < 2;
}

- (BOOL)shouldHideToolbarWhenShowingAccessoryViewControllerForAssetReference:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hideToolbarWhenShowingAccessoryView");

  objc_msgSend(v4, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUOneUpAccessoryViewControllersManager _accessoryViewTypeForAsset:](self, "_accessoryViewTypeForAsset:", v7);

  if (v8)
  {
    if (v8 == 3)
    {
      -[PUOneUpAccessoryViewControllersManager browsingSession](self, "browsingSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "assetViewModelForAssetReference:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "isInEditMode");
    }
    else if ((v6 & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      v12 = -[PUOneUpAccessoryViewControllersManager _isPhoneAndLandscape](self, "_isPhoneAndLandscape");
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)shouldHideNavigationBarWhenShowingAccessoryViewControllerForAssetReference:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int64_t v8;
  void *v9;

  v4 = a3;
  -[PUOneUpAccessoryViewControllersManager _spec](self, "_spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hideNavigationBarWhenShowingAccessoryView");

  objc_msgSend(v4, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PUOneUpAccessoryViewControllersManager _accessoryViewTypeForAsset:](self, "_accessoryViewTypeForAsset:", v7);
  if (!v8)
    return 0;
  if (v8 == 3)
  {
    objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "enableSideCommentsInLandscape"))
      v6 = -[PUOneUpAccessoryViewControllersManager _isPhoneAndLandscape](self, "_isPhoneAndLandscape");
    else
      v6 = 0;

  }
  return v6;
}

- (BOOL)shouldHideStatusBarWhenShowingAccessoryViewControllerForAssetReference:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = a3;
  -[PUOneUpAccessoryViewControllersManager _spec](self, "_spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hideStatusBarWhenShowingAccessoryView");

  objc_msgSend(v4, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PUOneUpAccessoryViewControllersManager _accessoryViewTypeForAsset:](self, "_accessoryViewTypeForAsset:", v7);
  if (v8 == 3)
    v9 = 0;
  else
    v9 = v6;
  return v8 && v9;
}

- (id)accessoryViewControllerForAssetReference:(id)a3
{
  return -[PUOneUpAccessoryViewControllersManager accessoryViewControllerForAssetReference:createIfNeeded:](self, "accessoryViewControllerForAssetReference:createIfNeeded:", a3, 1);
}

- (id)accessoryViewControllerForAssetReference:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  uint64_t v24;
  _BOOL4 v26;
  PUOneUpAccessoryViewControllersManager *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PUOneUpAccessoryViewControllersManager browsingSession](self, "browsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetsDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v9;
  objc_msgSend(v9, "assetReferenceForAssetReference:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpAccessoryViewControllersManager _accessoryViewControllers](self, "_accessoryViewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v26 = v4;
    v27 = self;
    v28 = v11;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v11, "keyEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = v14;
      v12 = 0;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v18, "asset");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "asset");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqual:", v20);

          if (v21)
          {
            objc_msgSend(v29, "assetReferenceForAssetReference:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqual:", v10);

            if (v23)
            {
              objc_msgSend(v28, "objectForKey:", v18);
              v24 = objc_claimAutoreleasedReturnValue();

              v12 = (void *)v24;
            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }
    else
    {
      v12 = 0;
    }

    if (v12)
    {
      v11 = v28;
    }
    else
    {
      v11 = v28;
      if (v26)
      {
        -[PUOneUpAccessoryViewControllersManager _createAccessoryViewControllerForAssetReference:](v27, "_createAccessoryViewControllerForAssetReference:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v12, v10);
      }
    }
  }

  return v12;
}

- (id)assetReferenceForAccessoryViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUOneUpAccessoryViewControllersManager _accessoryViewControllers](self, "_accessoryViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "keyEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "objectForKey:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_invalidateAccessoryViewControllersForAssetReferences:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[PUOneUpAccessoryViewControllersManager _accessoryViewControllers](self, "_accessoryViewControllers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObjectForKey:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (int64_t)_accessoryViewTypeForAsset:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  id v6;

  v3 = a3;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessoryViewType");

  if (v5 == 1)
  {
    if (+[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v3))
    {
      v5 = 3;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v3;
        if ((objc_msgSend(v6, "isTrashed") & 1) != 0)
        {
          v5 = 0;
        }
        else if (objc_msgSend(v6, "isRecoveredAsset"))
        {
          v5 = 0;
        }
        else
        {
          v5 = 2;
        }

      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (id)_createAccessoryViewControllerForAssetReference:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  PUPhotosDetailsViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE buf[24];
  void *v41;
  uint64_t *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUOneUpAccessoryViewControllersManager _accessoryViewTypeForAsset:](self, "_accessoryViewTypeForAsset:", v6);

  switch(v7)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpAccessoryViewControllersManager.m"), 246, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 2:
      objc_msgSend(v5, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v8, "canPerformEditOperation:", 2))
          v9 = 6;
        else
          v9 = 38;
      }
      else
      {
        PLUIGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "%@: Unknown asset class: %@", buf, 0x16u);

        }
        v9 = 38;
      }
      -[PUOneUpAccessoryViewControllersManager browsingSession](self, "browsingSession");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "photosDetailsContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D7B7A0], "photosDetailsContextForAsset:parentContext:", v8, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __90__PUOneUpAccessoryViewControllersManager__createAccessoryViewControllerForAssetReference___block_invoke;
      v34[3] = &unk_1E58A6530;
      v21 = v5;
      v35 = v21;
      objc_msgSend(v20, "performChanges:", v34);
      if (!self->_delegateRespondsTo.preventRevealInMomentActionForAssetReference
        || (-[PUOneUpAccessoryViewControllersManager delegate](self, "delegate"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "oneUpAccessoryViewControllersManager:preventRevealInMomentActionForAssetReference:", self, v21), v22, (v23 & 1) == 0))
      {
        v9 |= 0x10uLL;
      }
      if (!self->_delegateRespondsTo.preventInternalFileRadarActionForAssetReference
        || (-[PUOneUpAccessoryViewControllersManager delegate](self, "delegate"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v24, "oneUpAccessoryViewControllersManager:preventInternalFileRadarActionForAssetReference:", self, v21), v24, (v25 & 1) == 0))
      {
        v9 |= 0x40uLL;
      }
      -[PUOneUpAccessoryViewControllersManager browsingSession](self, "browsingSession");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "viewModel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "assetViewModelForAssetReference:", v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_alloc_init(MEMORY[0x1E0D7B798]);
      objc_msgSend(v29, "setOptions:", v9);
      -[PUOneUpAccessoryViewControllersManager unlockDeviceStatus](self, "unlockDeviceStatus");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setUnlockDeviceStatus:", v30);

      -[PUOneUpAccessoryViewControllersManager unlockDeviceHandlerWithActionType](self, "unlockDeviceHandlerWithActionType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setUnlockDeviceHandlerWithActionType:", v31);

      v10 = -[PUPhotosDetailsViewController initWithContext:configuration:assetViewModel:]([PUPhotosDetailsViewController alloc], "initWithContext:configuration:assetViewModel:", v20, v29, v28);
      -[PXPhotosDetailsUIViewController setDelegate:](v10, "setDelegate:", self);

      break;
    case 3:
      -[PUOneUpAccessoryViewControllersManager browsingSession](self, "browsingSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "viewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "assetViewModelForAssetReference:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[PUCommentsViewController initWithAssetViewModel:]([PUCommentsViewController alloc], "initWithAssetViewModel:", v13);
      break;
    case 4:
      v36 = 0;
      v37 = &v36;
      v38 = 0x2050000000;
      v14 = (void *)getPUTesterSampleAccessoryViewControllerClass_softClass;
      v39 = getPUTesterSampleAccessoryViewControllerClass_softClass;
      if (!getPUTesterSampleAccessoryViewControllerClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getPUTesterSampleAccessoryViewControllerClass_block_invoke;
        v41 = &unk_1E58AAEB0;
        v42 = &v36;
        __getPUTesterSampleAccessoryViewControllerClass_block_invoke((uint64_t)buf);
        v14 = (void *)v37[3];
      }
      v15 = v14;
      _Block_object_dispose(&v36, 8);
      v10 = (PUPhotosDetailsViewController *)objc_alloc_init((Class)v15);
      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (BOOL)photosDetailsUIViewControllerRequestDismissal:(id)a3
{
  PUOneUpAccessoryViewControllersManager *v3;
  void *v4;

  if (!self->_delegateRespondsTo.requestDismissal)
    return 0;
  v3 = self;
  -[PUOneUpAccessoryViewControllersManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "oneUpAccessoryViewControllersManagerRequestAccessoryDismissal:", v3);

  return (char)v3;
}

- (void)photosDetailsUIViewControllerCompositionDidChange:(id)a3
{
  id v4;

  if (self->_delegateRespondsTo.invalidateAccessoryLayout)
  {
    -[PUOneUpAccessoryViewControllersManager delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oneUpAccessoryViewControllersManagerInvalidateAccessoryLayout:", self);

  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  double v36;
  char v37;
  void *v38;
  uint64_t v39;
  PUOneUpAccessoryViewControllersManager *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  id obj;
  id obja;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v6 = a4;
  v40 = self;
  -[PUOneUpAccessoryViewControllersManager _accessoryViewControllers](self, "_accessoryViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v6;
  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v6, "assetsDataSourceDidChange"))
  {
    objc_msgSend(v44, "assetsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v7, "keyEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v58 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v8, "assetReferenceForAssetReference:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "asset");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "asset");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isEqual:", v18))
          {
            v19 = objc_msgSend(v17, "mediaSubtypes");
            if (v19 != objc_msgSend(v18, "mediaSubtypes"))
              objc_msgSend(v42, "addObject:", v16);
          }
          if (v16)
          {
            objc_msgSend(v7, "objectForKey:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v20, v16);

          }
          objc_msgSend(v7, "removeObjectForKey:", v15);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      }
      while (v12);
    }

  }
  objc_msgSend(v41, "assetViewModelChangesByAssetReference");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v7, "keyEnumerator");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v21)
  {
    v22 = v21;
    v43 = 0;
    v46 = *(_QWORD *)v54;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v54 != v46)
          objc_enumerationMutation(v45);
        v24 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v23);
        objc_msgSend(obja, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        if (v27)
        {
          v28 = v27;
          v29 = v7;
          v30 = *(_QWORD *)v50;
LABEL_22:
          v31 = 0;
          while (1)
          {
            if (*(_QWORD *)v50 != v30)
              objc_enumerationMutation(v26);
            v32 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v31);
            v33 = objc_msgSend(v32, "focusValueChanged");
            if (v33)
              break;
            if ((objc_msgSend(v32, "assetChanged") & 1) != 0)
            {
              v35 = objc_msgSend(v42, "containsObject:", v24);

              if (!v35)
              {
                v7 = v29;
                goto LABEL_41;
              }
              goto LABEL_33;
            }
            if (v28 == ++v31)
            {
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
              if (v28)
                goto LABEL_22;
              v34 = v26;
              v7 = v29;
              goto LABEL_40;
            }
          }

LABEL_33:
          objc_msgSend(v44, "assetViewModelForAssetReference:", v24);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "focusValue");
          if (fabs(v36) < 2.0)
            v37 = v33;
          else
            v37 = 0;
          v7 = v29;
          if ((v37 & 1) == 0)
          {
            v38 = v43;
            if (!v43)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v43 = v38;
            objc_msgSend(v38, "addObject:", v24);
          }
          goto LABEL_40;
        }
        v34 = v26;
LABEL_40:

LABEL_41:
        ++v23;
      }
      while (v23 != v22);
      v39 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      v22 = v39;
    }
    while (v39);
  }
  else
  {
    v43 = 0;
  }

  if (objc_msgSend(v43, "count"))
    -[PUOneUpAccessoryViewControllersManager _invalidateAccessoryViewControllersForAssetReferences:](v40, "_invalidateAccessoryViewControllersForAssetReferences:", v43);

}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (PUOneUpAccessoryViewControllersManagerDelegate)delegate
{
  return (PUOneUpAccessoryViewControllersManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (void)setUnlockDeviceStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)unlockDeviceHandlerWithActionType
{
  return self->_unlockDeviceHandlerWithActionType;
}

- (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMapTable)_accessoryViewControllers
{
  return self->__accessoryViewControllers;
}

- (PUOneUpViewControllerSpec)_spec
{
  return self->__spec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->__accessoryViewControllers, 0);
  objc_storeStrong(&self->_unlockDeviceHandlerWithActionType, 0);
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_browsingSession, 0);
}

void __90__PUOneUpAccessoryViewControllersManager__createAccessoryViewControllerForAssetReference___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setViewSourceOrigin:", 1);
  objc_msgSend(*(id *)(a1 + 32), "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v3, "setContainingAlbum:", v5);
}

@end

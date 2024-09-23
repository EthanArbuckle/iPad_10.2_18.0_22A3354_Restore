@implementation SBDeviceApplicationSceneViewPlaceholderContentViewProvider

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)sceneView:(id)a3 requestsPlaceholderContentViewWithContext:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *userInterfaceStyleForDisplayConfigurationProvider;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  _SBDeviceApplicationSceneViewPlaceholderContentView *v27;
  SBDeviceApplicationSceneViewPlaceholderContentViewProvider *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  double *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  SBDeviceApplicationSceneViewPlaceholderContentViewProvider *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v57;
  void *v58;
  SBDeviceApplicationSceneViewPlaceholderContentViewProvider *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneViewPlaceholderContentViewProvider.m"), 100, CFSTR("Unsupported scene view provided to SBDeviceApplicationSceneViewPlaceholderContentViewProvider."));

  }
  v9 = objc_opt_class();
  v66 = v8;
  SBSafeCast(v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayIdentity");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "currentConfiguration");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "referenceSize");
  v14 = v13;
  v16 = v15;
  v17 = objc_msgSend(v7, "orientation");
  objc_msgSend(v11, "application");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  userInterfaceStyleForDisplayConfigurationProvider = self->_userInterfaceStyleForDisplayConfigurationProvider;
  if (!userInterfaceStyleForDisplayConfigurationProvider)
    userInterfaceStyleForDisplayConfigurationProvider = self;
  v62 = userInterfaceStyleForDisplayConfigurationProvider;
  v67 = (void *)v12;
  v20 = objc_msgSend(v62, "userInterfaceStyleForDisplayConfiguration:", v12);
  objc_msgSend(v11, "_windowScene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "switcherController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v22;
  if (objc_msgSend(v22, "isChamoisWindowingUIEnabled"))
    v65 = objc_msgSend(v18, "isClassic");
  else
    v65 = 0;
  if (!objc_msgSend(v11, "_mainSceneSupportsInterfaceOrientation:", v17) || (v23 = v17) == 0)
    v23 = objc_msgSend(v11, "activationInterfaceOrientationForOrientation:", v17);
  if (v23 <= 1)
    v24 = 1;
  else
    v24 = v23;
  if (objc_msgSend(v18, "isClassic"))
  {
    objc_msgSend(v18, "defaultLaunchingSizeForDisplayConfiguration:", v67);
    v14 = v25;
    v16 = v26;
  }
  if (!objc_msgSend(v10, "prefersLiveXIB")
    || !objc_msgSend(v18, "isSystemApplication")
    || (-[SBDeviceApplicationSceneViewPlaceholderContentViewProvider _loadLiveXIBViewForApplication:](self, "_loadLiveXIBViewForApplication:", v18), (v27 = (_SBDeviceApplicationSceneViewPlaceholderContentView *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v28 = self;
    v29 = v20;
    objc_msgSend(v7, "sceneHandle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v28;
    v31 = -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider _contentTypeToSearchFromSceneHandle:withContext:](v28, "_contentTypeToSearchFromSceneHandle:withContext:", v30, v66);

    objc_msgSend(v10, "requestedLaunchIdentifier");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (!v32)
      v32 = (id)((v31 << 63 >> 63) & (unint64_t)CFSTR("SBSuspendSnapshot"));
    objc_msgSend(v11, "displayEdgeInfoForLayoutEnvironment:", objc_msgSend(v10, "layoutEnvironment"));
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "pointScale");
    v60 = (void *)v33;
    v64 = v10;
    v58 = v10;
    v34 = v24;
    objc_msgSend(v18, "bestSnapshotWithImageName:sceneHandle:variantID:scale:referenceSize:requireExactSize:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:", v32, v11, 0, 1, v31, -1, v24, v58, v29, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "interfaceOrientation");
    v37 = (double *)MEMORY[0x1E0C9D648];
    if (v65)
    {
      objc_msgSend(v7, "bounds");
      v39 = v38;
      v41 = v40;
      v42 = v59;
      if ((unint64_t)(v17 - 3) < 2 != (unint64_t)(v36 - 3) < 2)
      {
        BSSizeSwap();
        v39 = v43;
        v41 = v44;
      }
      if (v35)
        goto LABEL_25;
    }
    else
    {
      v39 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v41 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v42 = v59;
      if (v35)
      {
LABEL_25:
        v45 = *v37;
        v46 = v37[1];
        objc_msgSend(v7, "statusBarDescriptor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider _contentViewFromSceneHandle:displayConfiguration:orientation:snapshot:size:statusBarDescriptor:hasOrientationMismatchForClassicApp:customContainerBounds:](v42, "_contentViewFromSceneHandle:displayConfiguration:orientation:snapshot:size:statusBarDescriptor:hasOrientationMismatchForClassicApp:customContainerBounds:", v11, v67, v34, v35, v47, objc_msgSend(v64, "hasOrientationMismatchForClassicApp"), v14, v16, v45, v46, v39, v41);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "referenceSize");
        -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider _naturalSizeForOrientation:referenceSize:](v42, "_naturalSizeForOrientation:referenceSize:", v17);
        BSRectWithSize();
        v27 = -[BSUIOrientationTransformWrapperView initWithFrame:]([_SBDeviceApplicationSceneViewPlaceholderContentView alloc], "initWithFrame:", v49, v50, v51, v52);
        -[BSUIOrientationTransformWrapperView addContentView:](v27, "addContentView:", v48);
        -[BSUIOrientationTransformWrapperView setContainerOrientation:](v27, "setContainerOrientation:", v17);
        if (v65)
          -[BSUIOrientationTransformWrapperView setContentOrientation:](v27, "setContentOrientation:", v36);
        -[_SBDeviceApplicationSceneViewPlaceholderContentView setClipsToBounds:](v27, "setClipsToBounds:", 1);
        objc_msgSend(v35, "statusBarSettings");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "style");

        if (v54 == -1)
        {
          objc_msgSend(v18, "info");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v55, "defaultStatusBarStyle");

        }
        -[_SBDeviceApplicationSceneViewPlaceholderContentView setStatusBarStyle:](v27, "setStatusBarStyle:", v54);

        goto LABEL_32;
      }
    }
    v27 = 0;
LABEL_32:

    v10 = v64;
  }

  return v27;
}

- (unint64_t)_contentTypeToSearchFromSceneHandle:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  unint64_t v21;
  unsigned __int8 v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  SBSafeCast(v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "canShowUserContent");

  if (!v10)
    goto LABEL_14;
  objc_msgSend(v6, "_windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authenticationStatusProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isAuthenticated");

  if (!v13)
    goto LABEL_14;
  v14 = objc_msgSend(v9, "preferredContentType");
  if (v14 != 1)
  {
    if (!v14)
    {
      objc_msgSend(v6, "application");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "processState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isRunning");

      if (v17)
      {

        goto LABEL_12;
      }
      objc_msgSend(v6, "hasMainSceneBeenForegroundAtLeastOnce");
      v23 = 0;
      if (-[SBDeviceApplicationSceneViewPlaceholderContentViewProvider _checkApplicationRestorationState:useSnapshot:](self, "_checkApplicationRestorationState:useSnapshot:", v15, &v23))
      {
        v18 = v23;

        if (v18)
          goto LABEL_12;
      }
      else if ((_os_feature_enabled_impl() & 1) != 0)
      {
        objc_msgSend(v15, "info");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "supportsMultiwindow");

        if (v20)
          goto LABEL_12;
      }
      else
      {

      }
    }
LABEL_14:
    v21 = 6;
    goto LABEL_15;
  }
LABEL_12:
  v21 = -1;
LABEL_15:

  return v21;
}

- (BOOL)_checkApplicationRestorationState:(id)a3 useSnapshot:(BOOL *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "restorationArchiveContainerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _checkApplicationRestorationState();

  return v9;
}

- (CGSize)_naturalSizeForOrientation:(int64_t)a3 referenceSize:(CGSize)result
{
  double height;
  double v5;

  if ((unint64_t)(a3 - 1) >= 2)
    height = result.height;
  else
    height = result.width;
  if ((unint64_t)(a3 - 1) >= 2)
    result.height = result.width;
  v5 = height;
  result.width = v5;
  return result;
}

- (id)_contentViewFromSceneHandle:(id)a3 displayConfiguration:(id)a4 orientation:(int64_t)a5 snapshot:(id)a6 size:(CGSize)a7 statusBarDescriptor:(id)a8 hasOrientationMismatchForClassicApp:(BOOL)a9 customContainerBounds:(CGRect)a10
{
  uint64_t v11;

  LOBYTE(v11) = a9;
  return +[SBUIController zoomViewForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:snapshot:snapshotSize:statusBarDescriptor:decodeImage:hasOrientationMismatchForClassicApp:customContainerBounds:](SBUIController, "zoomViewForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:snapshot:snapshotSize:statusBarDescriptor:decodeImage:hasOrientationMismatchForClassicApp:customContainerBounds:", a3, a4, a5, a6, a8, 0, a7.width, a7.height, a10.origin.x, a10.origin.y, a10.size.width, a10.size.height, v11);
}

- (SBDeviceApplicationSceneViewPlaceholderContentViewProvider)initWithApplication:(id)a3
{
  return (SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)-[SBDeviceApplicationSceneViewPlaceholderContentViewProvider _initWithApplication:userInterfaceStyleForDisplayConfigurationProvider:](self, "_initWithApplication:userInterfaceStyleForDisplayConfigurationProvider:", a3, 0);
}

- (id)_initWithApplication:(id)a3 userInterfaceStyleForDisplayConfigurationProvider:(id)a4
{
  id v6;
  id v7;
  SBDeviceApplicationSceneViewPlaceholderContentViewProvider *v8;
  SBDeviceApplicationSceneViewPlaceholderContentViewProvider *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationSceneViewPlaceholderContentViewProvider;
  v8 = -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userInterfaceStyleForDisplayConfigurationProvider, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__snapshotsDidChange_, CFSTR("SBApplicationSnapshotChangedNotification"), v6);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneViewPlaceholderContentViewProvider;
  -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider dealloc](&v4, sel_dealloc);
}

- (void)_snapshotsDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  BSDispatchQueueAssertMain();
  v4 = _snapshotsDidChange__i;
  if (!_snapshotsDidChange__i)
  {
    -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeholderContentViewProviderContentDidUpdate:", self);

    v6 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SBDeviceApplicationSceneViewPlaceholderContentViewProvider__snapshotsDidChange___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);
    v4 = _snapshotsDidChange__i;
  }
  _snapshotsDidChange__i = v4 + 1;
}

uint64_t __82__SBDeviceApplicationSceneViewPlaceholderContentViewProvider__snapshotsDidChange___block_invoke(uint64_t result)
{
  unint64_t v1;

  v1 = _snapshotsDidChange__i;
  _snapshotsDidChange__i = 0;
  if (v1 >= 2)
    return objc_msgSend(*(id *)(result + 32), "_snapshotsDidChange:", 0);
  return result;
}

- (int64_t)userInterfaceStyleForDisplayConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = (void *)SBApp;
  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceStyleProviderForDisplay:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentStyle");

  return v6;
}

- (id)_loadLiveXIBViewForApplication:(id)a3
{
  id v5;
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
  id v16;
  void *v18;

  v5 = a3;
  if ((objc_msgSend(v5, "isSystemApplication") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneViewPlaceholderContentViewProvider.m"), 233, CFSTR("Cannot load a live XIB view for non-system applications."));

  }
  objc_msgSend(v5, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "launchInterfaceFileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v5, "info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA7C8], "nibWithNibName:bundle:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "instantiateWithOwner:options:", 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;

  return v16;
}

- (SBScenePlaceholderContentViewProviderDelegate)delegate
{
  return (SBScenePlaceholderContentViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInterfaceStyleForDisplayConfigurationProvider, 0);
}

@end

@implementation SBMedusaDecoratedDeviceApplicationSceneViewController

- (SBMedusaDecoratedDeviceApplicationSceneViewController)initWithDeviceApplicationSceneHandle:(id)a3 layoutRole:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  SBMedusaDecoratedDeviceApplicationSceneViewController *v9;

  v6 = a3;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBMedusaDecoratedDeviceApplicationSceneViewController initWithDeviceApplicationSceneHandle:layoutRole:workspace:setupManager:](self, "initWithDeviceApplicationSceneHandle:layoutRole:workspace:setupManager:", v6, a4, v7, v8);

  return v9;
}

- (SBMedusaDecoratedDeviceApplicationSceneViewController)initWithDeviceApplicationSceneHandle:(id)a3 layoutRole:(int64_t)a4 workspace:(id)a5 setupManager:(id)a6
{
  id v12;
  id v13;
  id v14;
  SBMedusaDecoratedDeviceApplicationSceneViewController *v15;
  SBMedusaDecoratedDeviceApplicationSceneViewController *v16;
  void *v17;
  uint64_t v18;
  SBDeviceApplicationSceneViewController *deviceApplicationSceneViewController;
  uint64_t v20;
  SBMedusaSettings *medusaSettings;
  void *v22;
  void *v24;
  objc_super v25;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if ((objc_msgSend(v12, "isDeviceApplicationSceneHandle") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController.m"), 135, CFSTR("Scene handle must be a device application scene handle, but was of type: %@"), v12);

  }
  v25.receiver = self;
  v25.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  v15 = -[SBMedusaDecoratedDeviceApplicationSceneViewController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  v16 = v15;
  if (v15)
  {
    v15->_layoutRole = a4;
    objc_storeStrong((id *)&v15->_workspace, a5);
    objc_storeStrong((id *)&v16->_setupManager, a6);
    objc_storeStrong((id *)&v16->_deviceApplicationSceneHandle, a3);
    -[SBDeviceApplicationSceneHandle addObserver:](v16->_deviceApplicationSceneHandle, "addObserver:", v16);
    -[SBDeviceApplicationSceneHandle statusBarStateProvider](v16->_deviceApplicationSceneHandle, "statusBarStateProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addStatusBarObserver:", v16);

    v16->_nubViewHidden = 1;
    v16->_nubViewHighlighted = 0;
    v16->_darkenViewAlpha = 0.0;
    v18 = objc_msgSend(v12, "newSceneViewController");
    deviceApplicationSceneViewController = v16->_deviceApplicationSceneViewController;
    v16->_deviceApplicationSceneViewController = (SBDeviceApplicationSceneViewController *)v18;

    -[SBDeviceApplicationSceneViewController setShouldDrawStatusBarInsideSceneView:](v16->_deviceApplicationSceneViewController, "setShouldDrawStatusBarInsideSceneView:", 1);
    -[SBDeviceApplicationSceneViewController setDisplayMode:animationFactory:completion:](v16->_deviceApplicationSceneViewController, "setDisplayMode:animationFactory:completion:", 4, 0, 0);
    -[SBDeviceApplicationSceneViewController setDelegate:](v16->_deviceApplicationSceneViewController, "setDelegate:", v16);
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v20 = objc_claimAutoreleasedReturnValue();
    medusaSettings = v16->_medusaSettings;
    v16->_medusaSettings = (SBMedusaSettings *)v20;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v16, sel__elasticValueViewControllerWillPresent_, CFSTR("SBElasticValueViewControllerWillPresentNotificationName"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v16, sel__elasticValueViewControllerWillDismiss_, CFSTR("SBElasticValueViewControllerWillDismissNotificationName"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v16, sel__guidedAccessActivationChanged_, CFSTR("SBGuidedAccessActivationChangedNotification"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v16, sel__hardwareKeyboardAvailabilityChanged_, CFSTR("SBHardwareKeyboardAvailabilityChangedNotification"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v16, sel__medusaCapabilityChanged_, CFSTR("SBWorkspaceMedusaCapabilityChangedNotification"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v16, sel__windowManagementStyleDidChange_, CFSTR("SBSwitcherControllerWindowManagementStyleDidChangeNotification"), 0);
    objc_msgSend((id)SBApp, "addActiveOrientationObserver:", v16);

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBDeviceApplicationSceneHandle removeObserver:](self->_deviceApplicationSceneHandle, "removeObserver:", self);
  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self->_deviceApplicationSceneHandle, "statusBarStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeStatusBarObserver:", self);

  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_applicationSceneClientSettingsDiffInspector, "removeAllObservers");
  v5.receiver = self;
  v5.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  -[SBMedusaDecoratedDeviceApplicationSceneViewController dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  -[SBDeviceApplicationSceneViewController invalidate](self->_deviceApplicationSceneViewController, "invalidate");
}

- (BOOL)isBlurred
{
  return self->_isBlurred;
}

- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  _BOOL4 v12;
  void (**v14)(_QWORD);
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  SBApplicationBlurContentView *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  SBApplicationBlurContentView *v45;
  void *v46;
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  _QWORD v51[4];
  id v52;
  _QWORD v53[5];
  _QWORD v54[4];
  id v55;
  _QWORD v56[5];
  id v57;

  v12 = a3;
  v14 = (void (**)(_QWORD))a7;
  v15 = a8;
  if (v14 && self->_isBlurred != v12)
    v14[2](v14);
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (!self->_isBlurred)
    {
      self->_isBlurred = 1;
      v17 = MEMORY[0x1E0C809B0];
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke;
      v56[3] = &unk_1E8EA02D8;
      v56[4] = self;
      v57 = v15;
      v18 = (void *)MEMORY[0x1D17E5550](v56);
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _blurContentView](self, "_blurContentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[SBMedusaDecoratedDeviceApplicationSceneViewController _blurContentView](self, "_blurContentView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bs_setHitTestingDisabled:", 0);

        ++self->_blurViewAnimationCount;
        v21 = (void *)MEMORY[0x1E0D01908];
        v52 = v18;
        v53[0] = v17;
        v53[1] = 3221225472;
        v53[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_3;
        v53[3] = &unk_1E8E9DED8;
        v53[4] = self;
        v51[0] = v17;
        v51[1] = 3221225472;
        v51[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_4;
        v51[3] = &unk_1E8E9F1C0;
        v22 = v18;
        objc_msgSend(v21, "animateWithFactory:options:actions:completion:", v16, 4, v53, v51);

      }
      else
      {
        -[SBApplicationSceneHandle application](self->_deviceApplicationSceneHandle, "application");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bundleIdentifier");
        v22 = (id)objc_claimAutoreleasedReturnValue();

        +[SBIconController sharedInstance](SBIconController, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "model");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBApplicationSceneHandle application](self->_deviceApplicationSceneHandle, "application");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isWebApplication");

        if (v31)
        {
          -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_deviceApplicationSceneHandle, "sceneIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:](SBWebApplication, "_webClipIdentifierFromWebAppIdentifier:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "leafIconForIdentifier:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v29, "applicationIconForBundleIdentifier:", v22);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v35 = [SBApplicationBlurContentView alloc];
        -[UIView bounds](self->_blurViewContainerView, "bounds");
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v43 = v42;
        -[SBDeviceApplicationSceneViewController view](self->_deviceApplicationSceneViewController, "view");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:icon:targetViewToBlur:initialIconScale:](v35, "initWithFrame:bundleIdentifier:icon:targetViewToBlur:initialIconScale:", v22, v34, v44, v37, v39, v41, v43, a6);

        -[SBApplicationBlurContentView setBlurDelay:](v45, "setBlurDelay:", a5);
        -[SBMedusaDecoratedDeviceApplicationSceneViewController _setBlurContentView:](self, "_setBlurContentView:", v45);
        ++self->_blurViewAnimationCount;
        -[SBMedusaDecoratedDeviceApplicationSceneViewController _blurContentView](self, "_blurContentView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_2;
        v54[3] = &unk_1E8E9E8D0;
        v55 = v18;
        v47 = v18;
        objc_msgSend(v46, "generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:", v16, v54);

      }
      v26 = v57;
      goto LABEL_15;
    }
  }
  else if (self->_isBlurred)
  {
    self->_isBlurred = 0;
    -[SBDeviceApplicationSceneViewController view](self->_deviceApplicationSceneViewController, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 0);

    ++self->_disableAsyncRenderingCount;
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _updateAsyncRendering](self, "_updateAsyncRendering");
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _blurContentView](self, "_blurContentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bs_setHitTestingDisabled:", 1);

    v25 = (void *)MEMORY[0x1E0D01908];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_5;
    v50[3] = &unk_1E8E9DED8;
    v50[4] = self;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_6;
    v48[3] = &unk_1E8E9F230;
    v48[4] = self;
    v49 = v15;
    objc_msgSend(v25, "animateWithFactory:options:actions:completion:", v16, 4, v50, v48);
    v26 = v49;
LABEL_15:

  }
}

uint64_t __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 1072);
  v4 = v3 < 1;
  v5 = v3 - 1;
  if (!v4)
  {
    *(_QWORD *)(v2 + 1072) = v5;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 1056) && !*(_QWORD *)(v2 + 1072))
  {
    objc_msgSend(*(id *)(v2 + 992), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "_updateAsyncRendering");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_blurContentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_blurContentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 1056))
  {
    objc_msgSend((id)v2, "_setBlurContentView:", 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  --*(_QWORD *)(v2 + 1096);
  objc_msgSend(*(id *)(a1 + 32), "_updateAsyncRendering");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)blurViewIconScale
{
  void *v2;
  double v3;
  double v4;

  -[SBMedusaDecoratedDeviceApplicationSceneViewController _blurContentView](self, "_blurContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconViewScale");
  v4 = v3;

  return v4;
}

- (void)setBlurViewIconScale:(double)a3
{
  id v4;

  -[SBMedusaDecoratedDeviceApplicationSceneViewController _blurContentView](self, "_blurContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconViewScale:", a3);

}

- (void)performSwitcherKeyboardShortcutAction:(int64_t)a3
{
  SBMedusaDecoratedDeviceApplicationSceneViewController *v3;
  SBTopAffordanceViewController *topAffordanceViewController;
  uint64_t v5;
  SBTopAffordanceViewController *v6;
  uint64_t v7;
  SBTopAffordanceViewController *v8;
  SBTopAffordanceViewController *v9;
  uint64_t v10;

  v3 = self;
  switch(a3)
  {
    case 7:
      topAffordanceViewController = self->_topAffordanceViewController;
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        v5 = 2;
      else
        v5 = 1;
      goto LABEL_8;
    case 8:
      topAffordanceViewController = self->_topAffordanceViewController;
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        v5 = 1;
      else
        v5 = 2;
LABEL_8:
      self = v3;
      v6 = topAffordanceViewController;
      v7 = 5;
      goto LABEL_19;
    case 11:
      v6 = self->_topAffordanceViewController;
      v7 = 1;
      goto LABEL_18;
    case 12:
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _handleSplitHomeScreenSwitcherKeyShortcut](self, "_handleSplitHomeScreenSwitcherKeyShortcut");
      return;
    case 13:
      v8 = self->_topAffordanceViewController;
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        v7 = 4;
      else
        v7 = 3;
      goto LABEL_17;
    case 14:
      v8 = self->_topAffordanceViewController;
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        v7 = 3;
      else
        v7 = 4;
LABEL_17:
      self = v3;
      v6 = v8;
LABEL_18:
      v5 = 0;
LABEL_19:
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _topAffordanceViewController:handleActionType:desiredFloatingConfiguration:transitionSource:](self, "_topAffordanceViewController:handleActionType:desiredFloatingConfiguration:transitionSource:", v6, v7, v5, 51);
      return;
    case 17:
      v9 = self->_topAffordanceViewController;
      v10 = 9;
      goto LABEL_24;
    case 18:
      v9 = self->_topAffordanceViewController;
      v10 = 12;
      goto LABEL_24;
    case 19:
      v9 = self->_topAffordanceViewController;
      v10 = 13;
      goto LABEL_24;
    case 20:
      v9 = self->_topAffordanceViewController;
      v10 = 14;
LABEL_24:
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _topAffordanceViewController:handleActionType:transitionSource:](self, "_topAffordanceViewController:handleActionType:transitionSource:", v9, v10, 51);
      break;
    default:
      return;
  }
}

- (void)setLayoutRole:(int64_t)a3 spaceConfiguration:(int64_t)a4 floatingConfiguration:(int64_t)a5 sizingPolicy:(int64_t)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;

  self->_layoutRole = a3;
  self->_spaceConfiguration = a4;
  self->_floatingConfiguration = a5;
  -[SBDeviceApplicationSceneHandle _windowScene](self->_deviceApplicationSceneHandle, "_windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "switcherController");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneHandle application](self->_deviceApplicationSceneHandle, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v15, "windowManagementStyle");
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_deviceApplicationSceneHandle, "sceneIfExists");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sb_displayIdentityForSceneManagers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "supportedSizingPoliciesForSwitcherWindowManagementStyle:displayIdentity:contentOrientation:containerOrientation:", v10, v13, -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self->_deviceApplicationSceneHandle, "currentInterfaceOrientation"), objc_msgSend(v15, "interfaceOrientation"));

  self->_isZoomed = SBDisplayItemSizingPolicyAllowingLargestSize(v14) == a6;
  -[SBMedusaDecoratedDeviceApplicationSceneViewController _updateTopAffordanceHighlight](self, "_updateTopAffordanceHighlight");
  -[SBMedusaDecoratedDeviceApplicationSceneViewController updateTopAffordanceContextMenu](self, "updateTopAffordanceContextMenu");

}

- (id)hitTestToTopAffordance:(CGPoint)a3 window:(id)a4
{
  double y;
  double x;
  SBTopAffordanceViewController *topAffordanceViewController;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  y = a3.y;
  x = a3.x;
  topAffordanceViewController = self->_topAffordanceViewController;
  v7 = a4;
  -[SBTopAffordanceViewController dotsView](topAffordanceViewController, "dotsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fixedCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v10, x, y);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v10, v12, v14);
  objc_msgSend(v8, "hitTest:withEvent:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)updateTopAffordanceContextMenu
{
  -[SBTopAffordanceViewController updateContextMenuWithLayoutRole:spaceConfiguration:floatingConfiguration:interfaceOrientation:isZoomed:](self->_topAffordanceViewController, "updateContextMenuWithLayoutRole:spaceConfiguration:floatingConfiguration:interfaceOrientation:isZoomed:", self->_layoutRole, self->_spaceConfiguration, self->_floatingConfiguration, -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self->_deviceApplicationSceneHandle, "currentInterfaceOrientation"), self->_isZoomed);
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  -[SBDeviceApplicationSceneViewController willRotateFromInterfaceOrientation:toInterfaceOrientation:alongsideContainerView:animated:](self->_deviceApplicationSceneViewController, "willRotateFromInterfaceOrientation:toInterfaceOrientation:alongsideContainerView:animated:", a3, a4, a5, a6);
}

- (id)prepareForContentRotation
{
  return -[SBDeviceApplicationSceneViewController prepareForContentRotation](self->_deviceApplicationSceneViewController, "prepareForContentRotation");
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  -[SBDeviceApplicationSceneViewController didRotateFromInterfaceOrientation:toInterfaceOrientation:](self->_deviceApplicationSceneViewController, "didRotateFromInterfaceOrientation:toInterfaceOrientation:", a3, a4);
}

- (SBMedusaDecoratedDeviceApplicationSceneViewController)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  void *v8;
  SBMedusaDecoratedDeviceApplicationSceneViewController *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support unarchiving from a nib."), v8);

  v11.receiver = self;
  v11.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  v9 = -[SBMedusaDecoratedDeviceApplicationSceneViewController initWithCoder:](&v11, sel_initWithCoder_, v6);

  return v9;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_deviceApplicationSceneHandle;
}

- (int64_t)displayMode
{
  return -[SBSceneViewController displayMode](self->_deviceApplicationSceneViewController, "displayMode");
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return -[SBSceneViewController placeholderContentContext](self->_deviceApplicationSceneViewController, "placeholderContentContext");
}

- (void)setPlaceholderContentContext:(id)a3
{
  -[SBSceneViewController setPlaceholderContentContext:](self->_deviceApplicationSceneViewController, "setPlaceholderContentContext:", a3);
}

- (SBApplicationSceneBackgroundView)backgroundView
{
  return -[SBDeviceApplicationSceneViewController backgroundView](self->_deviceApplicationSceneViewController, "backgroundView");
}

- (void)setBackgroundView:(id)a3
{
  -[SBDeviceApplicationSceneViewController setBackgroundView:](self->_deviceApplicationSceneViewController, "setBackgroundView:", a3);
}

- (UIView)customContentView
{
  return -[SBSceneViewController customContentView](self->_deviceApplicationSceneViewController, "customContentView");
}

- (void)setCustomContentView:(id)a3
{
  -[SBSceneViewController setCustomContentView:](self->_deviceApplicationSceneViewController, "setCustomContentView:", a3);
}

- (id)newSnapshot
{
  return -[SBSceneViewController newSnapshot](self->_deviceApplicationSceneViewController, "newSnapshot");
}

- (id)newSnapshotView
{
  return -[SBSceneViewController newSnapshotView](self->_deviceApplicationSceneViewController, "newSnapshotView");
}

- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4
{
  SBDeviceApplicationSceneViewController *deviceApplicationSceneViewController;

  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  if (deviceApplicationSceneViewController)
    -[SBSceneViewController newSnapshotViewOnQueue:withCompletion:](deviceApplicationSceneViewController, "newSnapshotViewOnQueue:withCompletion:", a3, a4);
  else
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (CGSize)contentReferenceSize
{
  double v2;
  double v3;
  CGSize result;

  -[SBSceneViewController contentReferenceSize](self->_deviceApplicationSceneViewController, "contentReferenceSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)contentOrientation
{
  return -[SBSceneViewController contentOrientation](self->_deviceApplicationSceneViewController, "contentOrientation");
}

- (int64_t)containerOrientation
{
  return -[SBSceneViewController containerOrientation](self->_deviceApplicationSceneViewController, "containerOrientation");
}

- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5
{
  void *v6;
  id v7;

  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceApplicationSceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a4, a5, a3.width, a3.height);
  -[SBMedusaDecoratedDeviceApplicationSceneViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  -[SBMedusaDecoratedDeviceApplicationSceneViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SBDeviceApplicationSceneViewController *deviceApplicationSceneViewController;
  SBDeviceApplicationSceneViewController *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  if (deviceApplicationSceneViewController)
  {
    objc_initWeak(&location, deviceApplicationSceneViewController);
    v12 = self->_deviceApplicationSceneViewController;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __100__SBMedusaDecoratedDeviceApplicationSceneViewController_setDisplayMode_animationFactory_completion___block_invoke;
    v13[3] = &unk_1E8EB7358;
    v13[4] = self;
    objc_copyWeak(&v15, &location);
    v14 = v10;
    -[SBDeviceApplicationSceneViewController setDisplayMode:animationFactory:completion:](v12, "setDisplayMode:animationFactory:completion:", a3, v8, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_setDisplayMode_animationFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "displayMode") != 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setCustomContentView:", 0);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
  -[SBSceneViewController containerContentWrapperInterfaceOrientationChangedTo:](self->_deviceApplicationSceneViewController, "containerContentWrapperInterfaceOrientationChangedTo:", a3);
}

- (SBHomeGrabberView)homeGrabberView
{
  void *v2;
  void *v3;

  -[SBSceneViewController _sceneView](self->_deviceApplicationSceneViewController, "_sceneView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeGrabberView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHomeGrabberView *)v3;
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  return -[SBDeviceApplicationSceneViewController bestHomeAffordanceOrientationForOrientation:](self->_deviceApplicationSceneViewController, "bestHomeAffordanceOrientationForOrientation:", a3);
}

- (double)statusBarAlpha
{
  double result;

  -[SBApplicationSceneViewController statusBarAlpha](self->_deviceApplicationSceneViewController, "statusBarAlpha");
  return result;
}

- (int64_t)overrideStatusBarStyle
{
  return -[SBApplicationSceneViewController overrideStatusBarStyle](self->_deviceApplicationSceneViewController, "overrideStatusBarStyle");
}

- (void)setApplicationSceneStatusBarDelegate:(id)a3
{
  -[SBApplicationSceneViewController setApplicationSceneStatusBarDelegate:](self->_deviceApplicationSceneViewController, "setApplicationSceneStatusBarDelegate:", a3);
}

- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate
{
  return -[SBApplicationSceneViewController applicationSceneStatusBarDelegate](self->_deviceApplicationSceneViewController, "applicationSceneStatusBarDelegate");
}

- (int64_t)leadingStatusBarStyle
{
  return -[SBDeviceApplicationSceneViewController leadingStatusBarStyle](self->_deviceApplicationSceneViewController, "leadingStatusBarStyle");
}

- (int64_t)trailingStatusBarStyle
{
  return -[SBDeviceApplicationSceneViewController trailingStatusBarStyle](self->_deviceApplicationSceneViewController, "trailingStatusBarStyle");
}

- (id)backgroundActivitiesToSuppress
{
  return -[SBDeviceApplicationSceneViewController backgroundActivitiesToSuppress](self->_deviceApplicationSceneViewController, "backgroundActivitiesToSuppress");
}

- (double)currentStatusBarHeight
{
  double result;

  -[SBDeviceApplicationSceneViewController currentStatusBarHeight](self->_deviceApplicationSceneViewController, "currentStatusBarHeight");
  return result;
}

- (UIView)sceneContentView
{
  return -[SBDeviceApplicationSceneViewController sceneContentView](self->_deviceApplicationSceneViewController, "sceneContentView");
}

- (void)containerDidUpdateTraitsParticipant:(id)a3
{
  -[SBDeviceApplicationSceneViewController containerDidUpdateTraitsParticipant:](self->_deviceApplicationSceneViewController, "containerDidUpdateTraitsParticipant:", a3);
}

- (BOOL)SB_conformsToMedusaDecoratedDeviceApplicationSceneViewControlling
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding
{
  return 1;
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4
{
  return -[SBMedusaDecoratedDeviceApplicationSceneViewController statusBarAssertionWithStatusBarHidden:nubViewHidden:atLevel:](self, "statusBarAssertionWithStatusBarHidden:nubViewHidden:atLevel:", a3, 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  _BOOL8 v7;
  NSHashTable *v9;
  NSHashTable *statusBarAssertions;
  void *v11;

  v7 = a3;
  if (!self->_statusBarAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    statusBarAssertions = self->_statusBarAssertions;
    self->_statusBarAssertions = v9;

  }
  -[SBDeviceApplicationSceneViewController statusBarAssertionWithStatusBarHidden:atLevel:](self->_deviceApplicationSceneViewController, "statusBarAssertionWithStatusBarHidden:atLevel:", v7, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNubViewHidden:", a4);
  objc_msgSend(v11, "addObserver:", self);
  -[NSHashTable addObject:](self->_statusBarAssertions, "addObject:", v11);
  -[SBMedusaDecoratedDeviceApplicationSceneViewController _updateCurrentTopAffordanceAlpha](self, "_updateCurrentTopAffordanceAlpha");
  return v11;
}

- (void)statusBarAssertionDidInvalidate:(id)a3
{
  -[NSHashTable removeObject:](self->_statusBarAssertions, "removeObject:", a3);
  -[SBMedusaDecoratedDeviceApplicationSceneViewController _updateCurrentTopAffordanceAlpha](self, "_updateCurrentTopAffordanceAlpha");
}

- (void)_updateCurrentTopAffordanceAlpha
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t nubViewHidden;

  if (-[NSHashTable count](self->_statusBarAssertions, "count"))
  {
    -[NSHashTable allObjects](self->_statusBarAssertions, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_265);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "nubViewHidden") == 0x7FFFFFFFFFFFFFFFLL)
      nubViewHidden = self->_nubViewHidden;
    else
      nubViewHidden = BSSettingFlagIsYes();

  }
  else
  {
    nubViewHidden = self->_nubViewHidden;
  }
  -[SBTopAffordanceViewController setHidden:forReason:animated:](self->_topAffordanceViewController, "setHidden:forReason:animated:", nubViewHidden, CFSTR("MedusaDecoratedVC"), objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled"));
}

uint64_t __89__SBMedusaDecoratedDeviceApplicationSceneViewController__updateCurrentTopAffordanceAlpha__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "level"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "level");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (BOOL)isNubViewHidden
{
  return self->_nubViewHidden;
}

- (void)setNubViewHidden:(BOOL)a3
{
  if (self->_nubViewHidden != a3)
  {
    self->_nubViewHidden = a3;
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _updateCurrentTopAffordanceAlpha](self, "_updateCurrentTopAffordanceAlpha");
  }
}

- (BOOL)isNubViewHighlighted
{
  return self->_nubViewHighlighted;
}

- (void)setNubViewHighlighted:(BOOL)a3
{
  if (self->_nubViewHighlighted != a3)
  {
    self->_nubViewHighlighted = a3;
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _updateTopAffordanceHighlight](self, "_updateTopAffordanceHighlight");
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBDeviceApplicationSceneViewController layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:](self->_deviceApplicationSceneViewController, "layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:", v11, v6);
  v7 = objc_opt_class();
  objc_msgSend(v6, "toLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (SBSpaceConfigurationIsSplitView(objc_msgSend(v9, "spaceConfiguration"))
    && SBFloatingConfigurationIsValid(objc_msgSend(v9, "floatingConfiguration"))
    && ((v10 = -[SBMedusaDecoratedDeviceApplicationSceneViewController layoutRole](self, "layoutRole"), v10 == 1)
     && self->_floatingConfiguration == 1
     || v10 == 2 && self->_floatingConfiguration == 2))
  {
    -[SBTopAffordanceViewController setHidden:forReason:animated:](self->_topAffordanceViewController, "setHidden:forReason:animated:", 1, CFSTR("MedusaDecoratedVCHidingForObscuringFloatingApp"), 1);
    -[SBTopAffordanceViewController dismissAnimated:](self->_topAffordanceViewController, "dismissAnimated:", 1);
  }
  else
  {
    -[SBTopAffordanceViewController setHidden:forReason:animated:](self->_topAffordanceViewController, "setHidden:forReason:animated:", 0, CFSTR("MedusaDecoratedVCHidingForObscuringFloatingApp"), 1);
  }

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBDeviceApplicationSceneViewController layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:](self->_deviceApplicationSceneViewController, "layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:", v7, v6);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBDeviceApplicationSceneViewController layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:](self->_deviceApplicationSceneViewController, "layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:", v7, v6);

}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  void *v5;
  void *v6;

  -[SBMedusaDecoratedDeviceApplicationSceneViewController topAffordanceView](self, "topAffordanceView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTopAffordanceViewController view](self->_topAffordanceViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    -[SBMedusaDecoratedDeviceApplicationSceneViewController updateTopAffordanceOverrideUserInterfaceStyle](self, "updateTopAffordanceOverrideUserInterfaceStyle");
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  UIApplicationSceneClientSettingsDiffInspector *v13;
  UIApplicationSceneClientSettingsDiffInspector *applicationSceneClientSettingsDiffInspector;
  UIApplicationSceneClientSettingsDiffInspector *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBMedusaDecoratedDeviceApplicationSceneViewController topAffordanceView](self, "topAffordanceView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTopAffordanceViewController view](self->_topAffordanceViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12 && !self->_applicationSceneClientSettingsDiffInspector)
  {
    v13 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    applicationSceneClientSettingsDiffInspector = self->_applicationSceneClientSettingsDiffInspector;
    self->_applicationSceneClientSettingsDiffInspector = v13;

    objc_initWeak(&location, self);
    v15 = self->_applicationSceneClientSettingsDiffInspector;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __119__SBMedusaDecoratedDeviceApplicationSceneViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v19 = &unk_1E8EA2658;
    objc_copyWeak(&v20, &location);
    -[UIApplicationSceneClientSettingsDiffInspector observeStatusBarStyleWithBlock:](v15, "observeStatusBarStyleWithBlock:", &v16);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  -[UIApplicationSceneClientSettingsDiffInspector inspectDiff:withContext:](self->_applicationSceneClientSettingsDiffInspector, "inspectDiff:withContext:", v9, 0, v16, v17, v18, v19);

}

void __119__SBMedusaDecoratedDeviceApplicationSceneViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateTopAffordanceOverrideUserInterfaceStyle");

}

- (void)updateTopAffordanceOverrideUserInterfaceStyle
{
  uint64_t v3;
  SBTopAffordanceViewController *topAffordanceViewController;
  uint64_t v5;
  id v6;

  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self->_deviceApplicationSceneHandle, "statusBarStateProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "statusBarStyleForPartWithIdentifier:", *MEMORY[0x1E0CEC1E8]);
  if (v3 == 4)
    v3 = objc_msgSend(v6, "statusBarStyle");
  topAffordanceViewController = self->_topAffordanceViewController;
  if ((v3 & 0x3F) != 0)
  {
    -[SBTopAffordanceViewController setLumaTrackingEnabled:](topAffordanceViewController, "setLumaTrackingEnabled:", 0);
    if (_SBStatusBarColorStyleFromStyle(v3) == 2)
      v5 = 1;
    else
      v5 = 2;
    -[SBTopAffordanceViewController setOverrideUserInterfaceStyle:](self->_topAffordanceViewController, "setOverrideUserInterfaceStyle:", v5);
  }
  else
  {
    -[SBTopAffordanceViewController setLumaTrackingEnabled:](topAffordanceViewController, "setLumaTrackingEnabled:", 1);
  }

}

- (void)topAffordanceViewController:(id)a3 handleActionType:(int64_t)a4
{
  id v6;

  v6 = a3;
  if (-[SBMedusaDecoratedDeviceApplicationSceneViewController _isChamoisWindowingUIEnabled](self, "_isChamoisWindowingUIEnabled"))
  {
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _topAffordanceViewController:handleActionType:transitionSource:](self, "_topAffordanceViewController:handleActionType:transitionSource:", v6, a4, 50);
  }
  else
  {
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _topAffordanceViewController:handleActionType:desiredFloatingConfiguration:transitionSource:](self, "_topAffordanceViewController:handleActionType:desiredFloatingConfiguration:transitionSource:", v6, a4, 0, 50);
  }

}

- (void)_topAffordanceViewController:(id)a3 handleActionType:(int64_t)a4 transitionSource:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  int64_t v26;
  _QWORD v27[4];
  id v28;
  SBMedusaDecoratedDeviceApplicationSceneViewController *v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[SBDeviceApplicationSceneHandle _windowScene](self->_deviceApplicationSceneHandle, "_windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke;
  v27[3] = &unk_1E8E9E820;
  v11 = v9;
  v28 = v11;
  v29 = self;
  v12 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v27);
  switch(a4)
  {
    case 9:
      if (self->_isZoomed)
        goto LABEL_13;
      SBLogTopAffordance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v31 = 9;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Dismissing top affordance after context menu item %ld pressed", buf, 0xCu);
      }

      objc_msgSend(v8, "dismissAnimated:", 1);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_fbsDisplayConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v10;
      v24[1] = 3221225472;
      v24[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_57;
      v24[3] = &unk_1E8EAE550;
      v26 = a5;
      v24[4] = self;
      v25 = v11;
      objc_msgSend(v14, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v15, v24, 0);

      break;
    case 12:
      SBLogTopAffordance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v31 = 12;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Dismissing top affordance after context menu item %ld pressed", buf, 0xCu);
      }

      objc_msgSend(v8, "dismissAnimated:", 1);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_fbsDisplayConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_61;
      v23[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
      v23[4] = a5;
      objc_msgSend(v17, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v18, v23, 0);

      break;
    case 13:
      SBLogTopAffordance();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v31 = 13;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Dismissing top affordance after context menu item %ld pressed", buf, 0xCu);
      }

      objc_msgSend(v8, "dismissAnimated:", 1);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_fbsDisplayConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_64;
      v22[3] = &unk_1E8EAAE78;
      v22[4] = self;
      v22[5] = a5;
      objc_msgSend(v20, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v21, v22, 0);

      break;
    case 14:
      if (!-[SBMedusaDecoratedDeviceApplicationSceneViewController _topAffordanceViewControllerHandleMoveToDisplayAction:transitionSource:](self, "_topAffordanceViewControllerHandleMoveToDisplayAction:transitionSource:", v8, a5))goto LABEL_13;
      break;
    case 17:
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _topAffordanceViewControllerHandleCloseAction](self, "_topAffordanceViewControllerHandleCloseAction");
      break;
    default:
LABEL_13:
      v12[2](v12);
      break;
  }

}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_fbsDisplayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2;
  v4[3] = &unk_1E8E9EE78;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v3, v4, 0);

}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  v3 = a2;
  objc_msgSend(v3, "setSource:", 57);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_3;
  v4[3] = &unk_1E8E9EE50;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_4;
  v6[3] = &unk_1E8EA2880;
  v7 = v3;
  v5 = v3;
  SBLayoutRoleEnumerateValidRoles(v6);
  objc_msgSend(v5, "entityForLayoutRole:", objc_msgSend(*(id *)(a1 + 32), "layoutRole"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlag:forActivationSetting:", 1, 11);

}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, a2);

}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_57(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a1[6];
  v4 = a2;
  objc_msgSend(v4, "setSource:", v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_58;
  v6[3] = &unk_1E8E9ECA8;
  v5 = (void *)a1[5];
  v6[4] = a1[4];
  v7 = v5;
  objc_msgSend(v4, "modifyApplicationContext:", v6);

}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_58(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BYTE v15[56];
  _BYTE v16[56];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984));
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntities:withPolicy:centerEntity:floatingEntity:", v5, 0, 0, 0);

  objc_msgSend(v3, "_setRequestedFrontmostEntity:", v4);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 984);
  v7 = objc_msgSend(v6, "currentInterfaceOrientation");
  objc_msgSend(*(id *)(a1 + 40), "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "_supportedSizingPoliciesForContentOrientation:containerOrientation:", v7, objc_msgSend(v8, "interfaceOrientation"));

  v10 = SBDisplayItemSizingPolicyAllowingLargestSize(v9);
  objc_msgSend(v3, "requestedLayoutAttributesForEntity:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributesByModifyingSizingPolicy:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "attributesByModifyingAttributedSize:", v16, SBDisplayItemAttributedSizeUnspecified((uint64_t)v16).n128_f64[0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "attributesByModifyingAttributedUserSizeBeforeOverlapping:", v15, SBDisplayItemAttributedSizeUnspecified((uint64_t)v15).n128_f64[0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setRequestedLayoutAttributes:forEntity:", v14, v4);
  objc_msgSend(v3, "setFencesAnimations:", 1);

}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setSource:", v2);
  objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_63_3);

}

uint64_t __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_62(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestedPeekConfiguration:", 2);
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[5];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setSource:", v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_65;
  v5[3] = &unk_1E8E9EE50;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "modifyApplicationContext:", v5);

}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_65(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD *v7;
  _QWORD v8[3];
  uint64_t v9;

  v3 = a2;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v9 = objc_msgSend(*(id *)(a1 + 32), "layoutRole");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_3_66;
  v5[3] = &unk_1E8EB1B58;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v6 = v4;
  v7 = v8;
  SBLayoutRoleEnumerateValidRoles(v5);

  _Block_object_dispose(v8, 8);
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_3_66(uint64_t a1, uint64_t a2)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a2 != 3 && a2 != 4)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "layoutRole") <= a2)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "layoutRole") != a2 && objc_msgSend(*(id *)(a1 + 32), "layoutRole") < a2)
      {
        v6 = *(void **)(a1 + 40);
        +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setEntity:forLayoutRole:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
      }
    }
    else
    {
      v5 = *(void **)(a1 + 40);
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEntity:forLayoutRole:", v8, a2);

    }
  }
}

- (void)_topAffordanceViewController:(id)a3 handleActionType:(int64_t)a4 desiredFloatingConfiguration:(int64_t)a5 transitionSource:(int64_t)a6
{
  id v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  _BOOL4 IsSplitView;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[8];
  _QWORD v26[4];
  id v27;
  id v28;
  int64_t v29;
  int64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = -[SBMedusaDecoratedDeviceApplicationSceneViewController spaceConfiguration](self, "spaceConfiguration");
  v11 = -[SBMedusaDecoratedDeviceApplicationSceneViewController layoutRole](self, "layoutRole");
  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_fbsDisplayConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke;
  v26[3] = &unk_1E8EA1360;
  v29 = a6;
  v14 = v9;
  v27 = v14;
  v15 = v13;
  v28 = v15;
  v30 = v11;
  v16 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v26);
  if (a4 == 1 && v10 == 1 && v11 == 1
    || a4 == 5 && a6 != 51 && v11 == 3
    || (IsSplitView = SBSpaceConfigurationIsSplitView(v10), a4 == 4) && IsSplitView && v11 == 2
    || (v18 = SBSpaceConfigurationIsSplitView(v10), a4 == 3) && v18 && v11 == 1)
  {
LABEL_13:
    v16[2](v16);
    goto LABEL_14;
  }
  if (a4 == 17)
  {
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _topAffordanceViewControllerHandleCloseAction](self, "_topAffordanceViewControllerHandleCloseAction");
    goto LABEL_14;
  }
  if (a4 == 14)
  {
    if (-[SBMedusaDecoratedDeviceApplicationSceneViewController _topAffordanceViewControllerHandleMoveToDisplayAction:transitionSource:](self, "_topAffordanceViewControllerHandleMoveToDisplayAction:transitionSource:", v14, a6))
    {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  SBLogTopAffordance();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v23;
    v33 = 2112;
    v34 = v20;
    v35 = 2112;
    v36 = v21;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Top affordance dismiss after button %@ pressed, space configuration: %@, layout role: %@", buf, 0x20u);

  }
  objc_msgSend(v14, "dismissAnimated:", 1);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_68;
  v25[3] = &unk_1E8EB73E8;
  v25[4] = self;
  v25[5] = a6;
  v25[6] = a4;
  v25[7] = a5;
  objc_msgSend(v22, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v15, v25, 0);

  if (a6 != 51)
    objc_msgSend(v14, "_emitAnalyticsEventForMenuInteraction:", a4);
LABEL_14:

}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  if (*(_QWORD *)(a1 + 48) != 51)
    objc_msgSend(*(id *)(a1 + 32), "_emitAnalyticsEventForMenuInteraction:", 19);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_2;
  v4[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  v4[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v3, v4, 0);

}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  v3 = a2;
  objc_msgSend(v3, "setSource:", 57);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_3;
  v4[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_4;
  v6[3] = &unk_1E8EA2880;
  v7 = v3;
  v5 = v3;
  SBLayoutRoleEnumerateValidRoles(v6);
  objc_msgSend(v5, "entityForLayoutRole:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlag:forActivationSetting:", 1, 11);

}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, a2);

}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  __int128 v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setSource:", v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_2_69;
  v5[3] = &unk_1E8EB73C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v4, "modifyApplicationContext:", v5);

}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_2_69(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_modifyApplicationContext:handleActionType:spaceConfiguration:layoutRole:desiredFloatingConfiguration:", v5, v4, objc_msgSend(v3, "spaceConfiguration"), objc_msgSend(*(id *)(a1 + 32), "layoutRole"), *(_QWORD *)(a1 + 48));

}

- (BOOL)_topAffordanceViewControllerHandleMoveToDisplayAction:(id)a3 transitionSource:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectedWindowScenes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke;
  v18[3] = &unk_1E8EA6F48;
  v18[4] = self;
  objc_msgSend(v8, "bs_firstObjectPassingTest:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    SBLogTopAffordance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = 14;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Dismissing top affordance after context menu item %ld pressed", buf, 0xCu);
    }

    objc_msgSend(v6, "dismissAnimated:", 1);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_fbsDisplayConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_71;
    v15[3] = &unk_1E8EAE550;
    v17 = a4;
    v15[4] = self;
    v16 = v10;
    objc_msgSend(v12, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v13, v15, 0);

  }
  return v10 != 0;
}

uint64_t __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

void __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_71(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a1[6];
  v4 = a2;
  objc_msgSend(v4, "setSource:", v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_2;
  v6[3] = &unk_1E8E9ECA8;
  v5 = (void *)a1[5];
  v6[4] = a1[4];
  v7 = v5;
  objc_msgSend(v4, "modifyApplicationContext:", v6);

}

void __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBDeviceApplicationSceneEntity *v9;
  SBDeviceApplicationSceneEntity *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SBDeviceApplicationSceneEntity *v14;

  v3 = a2;
  v4 = [SBDeviceApplicationSceneEntity alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fbsDisplayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v4, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v5, v6, v7, v8);

  objc_msgSend(v3, "setRequestedUnlockedEnvironmentMode:", 3);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_3;
  v12[3] = &unk_1E8EABFB0;
  v13 = v3;
  v14 = v9;
  v10 = v9;
  v11 = v3;
  SBLayoutRoleEnumerateValidRoles(v12);

}

void __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEntity:forLayoutRole:", v4, a2);

  }
}

- (void)_topAffordanceViewControllerHandleCloseAction
{
  void *v3;
  id v4;

  SBApplicationSceneEntityDestructionMakeIntent(1, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_deviceApplicationSceneHandle);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v3, v4, &__block_literal_global_75);

}

void __102__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleCloseAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a3;
  if (v3)
  {
    SBLogAppSwitcher();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __102__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleCloseAction__block_invoke_cold_1((uint64_t)v3, v4, v5);

  }
}

- (void)_modifyApplicationContext:(id)a3 handleActionType:(int64_t)a4 spaceConfiguration:(int64_t)a5 layoutRole:(int64_t)a6 desiredFloatingConfiguration:(int64_t)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  __objc2_class *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v11 = a3;
  objc_msgSend(v11, "previousLayoutState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  SBSafeCast(v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    SBLogAppSwitcher();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _modifyApplicationContext:handleActionType:spaceConfiguration:layoutRole:desiredFloatingConfiguration:].cold.1(v12, v20);
    goto LABEL_35;
  }
  if (a4 != 5)
  {
    if (a4 != 2)
    {
      if (a4 == 1)
      {
        +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", a6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (a6 == 3)
        {
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v19 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v19;
        }
        objc_msgSend(v11, "setRequestedSpaceConfiguration:", 1);
        objc_msgSend(v11, "setEntity:forLayoutRole:", v16, 1);
        objc_msgSend(v11, "setEntity:forLayoutRole:", v17, 2);
        objc_msgSend(v11, "setEntity:forLayoutRole:", v18, 3);

        goto LABEL_36;
      }
      if ((unint64_t)(a4 - 3) > 1)
        goto LABEL_36;
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6 == 1)
      {
        if (a5 == 1)
        {
          if (a4 == 3)
            v27 = 2;
          else
            v27 = 3;
          objc_msgSend(v11, "setRequestedPeekConfiguration:", v27);
          +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 1);
          v28 = objc_claimAutoreleasedReturnValue();

          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = 3;
          v25 = (void *)v28;
          goto LABEL_86;
        }
        v30 = objc_msgSend(v15, "spaceConfiguration");
        if (a4 == 4)
        {
          a6 = 2;
          v49 = v59;
LABEL_88:
          +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", a6);
          v57 = objc_claimAutoreleasedReturnValue();

          +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = 2;
          if (v30 != 4)
            v58 = v30;
          if (v30 == 2)
            v30 = 4;
          else
            v30 = v58;
          v25 = (void *)v57;
          goto LABEL_94;
        }
        objc_msgSend(v11, "setRequestedPeekConfiguration:", 2);
      }
      else
      {
        if (a5 != 1 && a6 != 2)
        {
          +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", a6);
          v46 = objc_claimAutoreleasedReturnValue();
          if (a4 == 3)
            v47 = v25;
          else
            v47 = v60;
          if (a4 == 3)
          {
            v25 = (void *)v46;
            v29 = v60;
          }
          else
          {
            v29 = (void *)v46;
          }

          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = v59;
          if (a6 == 3)
            v50 = v59;
          else
            v50 = v26;
          if (a6 == 3)
            v49 = (void *)v48;
          else
            v26 = (void *)v48;

          v30 = objc_msgSend(v15, "spaceConfiguration");
          goto LABEL_94;
        }
        if (a5 == 1)
        {
          +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", a6);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4 == 3)
          {

            +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 1);
            v25 = v29;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }

          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (a6 != 3)
          {

            v30 = 3;
            v26 = v49;
LABEL_86:
            v49 = v59;
            goto LABEL_94;
          }

          v30 = 3;
LABEL_94:
          objc_msgSend(v11, "setRequestedSpaceConfiguration:", v30);
          objc_msgSend(v11, "setEntity:forLayoutRole:", v25, 1);
          objc_msgSend(v11, "setEntity:forLayoutRole:", v29, 2);
          objc_msgSend(v11, "setEntity:forLayoutRole:", v49, 3);
          objc_msgSend(v11, "setEntity:forLayoutRole:", v26, 4);

          goto LABEL_36;
        }
        v30 = objc_msgSend(v15, "spaceConfiguration");
        if (a4 == 3 || a6 != 2)
        {
          v49 = v59;
          if (a6 == 2)
            goto LABEL_88;
          goto LABEL_78;
        }
        objc_msgSend(v11, "setRequestedPeekConfiguration:", 3);
        +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 2);
        v54 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v54;
      }
      v49 = v59;
LABEL_78:
      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_94;
    }
    switch(a6)
    {
      case 1:
        if (a5 == 1)
          v22 = 2;
        else
          v22 = 3;
        objc_msgSend(v11, "setRequestedSpaceConfiguration:", 3);
        objc_msgSend(v11, "setRequestedPeekConfiguration:", v22);
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setEntity:forLayoutRole:", v23, 1);

        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setEntity:forLayoutRole:", v24, 2);

        break;
      case 2:
        objc_msgSend(v11, "setRequestedSpaceConfiguration:", 3);
        objc_msgSend(v11, "setRequestedPeekConfiguration:", 3);
        +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setEntity:forLayoutRole:", v35, 1);

        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setEntity:forLayoutRole:", v36, 2);

        break;
      case 3:
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "floatingConfiguration") == 2)
        {
          +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 3;
        }
        else
        {
          +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 3);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 1;
        }

        +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", v45);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setRequestedSpaceConfiguration:", 3);
        objc_msgSend(v11, "setEntity:forLayoutRole:", v44, 1);
        objc_msgSend(v11, "setEntity:forLayoutRole:", v53, 2);
        objc_msgSend(v11, "setEntity:forLayoutRole:", v43, 3);

        goto LABEL_36;
      case 4:
        objc_msgSend(v11, "setRequestedSpaceConfiguration:", 3);
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setEntity:forLayoutRole:", v51, 1);

        +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 4);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setEntity:forLayoutRole:", v52, 2);

        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v20 = objc_claimAutoreleasedReturnValue();
        v37 = v11;
        v38 = v20;
        goto LABEL_34;
      default:
        goto LABEL_36;
    }
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v20 = objc_claimAutoreleasedReturnValue();
    v37 = v11;
    v38 = v20;
LABEL_34:
    objc_msgSend(v37, "setEntity:forLayoutRole:", v38, 3);
LABEL_35:

    goto LABEL_36;
  }
  if (a6 == 1)
  {
    if (objc_msgSend(v14, "spaceConfiguration") == 1)
    {
      if (a7 != 1)
      {
        if (a7 != 2)
        {
          if (objc_msgSend(v15, "floatingConfiguration") == 1)
          {
            objc_msgSend(v11, "setRequestedFloatingConfiguration:", 1);
            goto LABEL_16;
          }
          objc_msgSend(v11, "setRequestedFloatingConfiguration:", 2);
        }
        v21 = 3;
        goto LABEL_81;
      }
LABEL_16:
      v21 = 2;
LABEL_81:
      objc_msgSend(v11, "setRequestedPeekConfiguration:", v21);
      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEntity:forLayoutRole:", v55, 1);

      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v11;
      v34 = v32;
      goto LABEL_82;
    }
    objc_msgSend(v11, "setRequestedFloatingConfiguration:", 1);
    +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEntity:forLayoutRole:", v39, 1);

    v40 = SBEmptyWorkspaceEntity;
    goto LABEL_43;
  }
  if (a6 != 2)
  {
    if (a6 != 4)
      goto LABEL_83;
    if ((objc_msgSend(v14, "floatingConfiguration") & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v41 = 1;
    else
      v41 = 2;
    objc_msgSend(v11, "setRequestedFloatingConfiguration:", v41);
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEntity:forLayoutRole:", v42, 1);

    v40 = SBPreviousWorkspaceEntity;
LABEL_43:
    -[__objc2_class entity](v40, "entity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v11;
    v34 = v32;
    goto LABEL_82;
  }
  objc_msgSend(v11, "setRequestedFloatingConfiguration:", 2);
  +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEntity:forLayoutRole:", v31, 1);

  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v11;
  v34 = v32;
LABEL_82:
  objc_msgSend(v33, "setEntity:forLayoutRole:", v34, 2);

  +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", a6);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEntity:forLayoutRole:", v56, 3);

LABEL_83:
  if (a7)
    objc_msgSend(v11, "setRequestedFloatingConfiguration:", a7);
LABEL_36:

}

- (void)topAffordanceViewControllerWillPresentMenu:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (!-[SBMedusaDecoratedDeviceApplicationSceneViewController _isChamoisWindowingUIEnabled](self, "_isChamoisWindowingUIEnabled", a3))
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_fbsDisplayConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_2;
    v7[3] = &unk_1E8EA6C08;
    v7[4] = self;
    objc_msgSend(v4, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v6, &__block_literal_global_76_0, v7);

  }
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_2(uint64_t a1, void *a2)
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
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
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
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  id v32;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "layoutRole") == 3)
  {
    objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_77_1, v30);
    objc_msgSend(v8, "elementWithRole:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "workspaceEntity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationSceneEntity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sceneHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sceneIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v6);

    goto LABEL_13;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "layoutRole") == 2)
  {
    objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_78, v30);
    v15 = v8;
    v16 = 2;
LABEL_8:
    objc_msgSend(v15, "elementWithRole:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "workspaceEntity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "applicationSceneEntity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sceneHandle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sceneIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v22, "isEqual:", v6);

    goto LABEL_13;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "layoutRole") == 1)
  {
    objc_msgSend(v8, "elementWithRole:", 2, v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_79);
      v15 = v8;
      v16 = 1;
      goto LABEL_8;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "layoutRole", v30) == 1
    && (objc_msgSend(v8, "elementWithRole:", 2),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v23,
        !v23))
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_6;
    v31[3] = &unk_1E8E9EE50;
    v32 = v30;
    objc_msgSend(v3, "modifyApplicationContext:", v31);
    objc_msgSend(v8, "elementWithRole:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "workspaceEntity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "applicationSceneEntity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sceneHandle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sceneIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v28, "isEqual:", v6);

  }
  else
  {
    v14 = 0;
  }
LABEL_13:

  return v14;
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestedWindowPickerRole:", 3);
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestedWindowPickerRole:", 2);
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestedWindowPickerRole:", 1);
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestedAppExposeBundleID:", *(_QWORD *)(a1 + 32));
}

- (void)activeInterfaceOrientationWillChangeToOrientation:(int64_t)a3
{
  -[SBTopAffordanceViewController dismissAnimated:](self->_topAffordanceViewController, "dismissAnimated:", 0);
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  -[SBTopAffordanceViewController updateContextMenuWithLayoutRole:spaceConfiguration:floatingConfiguration:interfaceOrientation:isZoomed:](self->_topAffordanceViewController, "updateContextMenuWithLayoutRole:spaceConfiguration:floatingConfiguration:interfaceOrientation:isZoomed:", self->_layoutRole, self->_spaceConfiguration, self->_floatingConfiguration, a3, self->_isZoomed, a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;

  v6 = a4;
  if (self->_topAffordanceTapGestureRecognizer == a3
    && (-[SBMedusaDecoratedDeviceApplicationSceneViewController topAffordanceView](self, "topAffordanceView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SBTopAffordanceViewController view](self->_topAffordanceViewController, "view"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v7 == v8))
  {
    -[SBTopAffordanceViewController view](self->_topAffordanceViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v11);
    objc_msgSend(v11, "hitTest:withEvent:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12 != 0;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5
{
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CEC1E8], a4))
    -[SBMedusaDecoratedDeviceApplicationSceneViewController updateTopAffordanceOverrideUserInterfaceStyle](self, "updateTopAffordanceOverrideUserInterfaceStyle");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  -[SBMedusaDecoratedDeviceApplicationSceneViewController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  -[SBMedusaDecoratedDeviceApplicationSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBDeviceApplicationSceneViewController view](self->_deviceApplicationSceneViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBMedusaDecoratedDeviceApplicationSceneViewController _sceneViewHasMatchMoveAnimation](self, "_sceneViewHasMatchMoveAnimation"))
  {
    -[SBMedusaDecoratedDeviceApplicationSceneViewController contentReferenceSize](self, "contentReferenceSize");
    -[SBMedusaDecoratedDeviceApplicationSceneViewController contentOrientation](self, "contentOrientation");
    SBRectWithSize();
    v17 = v12;
  }
  else
  {
    v17 = v12;
    v13 = v5;
    v14 = v7;
    v15 = v9;
    v16 = v11;
  }
  objc_msgSend(v17, "setBounds:", v13, v14, v15, v16);
  UIRectGetCenter();
  objc_msgSend(v12, "setCenter:");
  -[SBMedusaDecoratedDeviceApplicationSceneViewController _blurContentView](self, "_blurContentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v5, v7, v9, v11);

}

- (void)loadView
{
  SBHitTestExtendedView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  SBHitTestExtendedView *v8;
  UIView *containerView;
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
  UIView *v24;
  UIView *blurViewContainerView;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIView *v38;
  UIView *darkenView;
  UIView *v40;
  UIView *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  SBHitTestExtendedView *v56;

  v3 = [SBHitTestExtendedView alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v56 = -[SBHitTestExtendedView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[SBMedusaDecoratedDeviceApplicationSceneViewController setView:](self, "setView:", v56);
  v8 = -[SBHitTestExtendedView initWithFrame:]([SBHitTestExtendedView alloc], "initWithFrame:", v4, v5, v6, v7);
  containerView = self->_containerView;
  self->_containerView = &v8->super;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBHitTestExtendedView addSubview:](v56, "addSubview:", self->_containerView);
  -[UIView leftAnchor](self->_containerView, "leftAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHitTestExtendedView leftAnchor](v56, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[UIView rightAnchor](self->_containerView, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHitTestExtendedView rightAnchor](v56, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[UIView topAnchor](self->_containerView, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHitTestExtendedView topAnchor](v56, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[UIView bottomAnchor](self->_containerView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHitTestExtendedView bottomAnchor](v56, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[SBMedusaDecoratedDeviceApplicationSceneViewController dropInteraction](self, "dropInteraction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    -[UIView addInteraction:](self->_containerView, "addInteraction:", v22);
  -[SBDeviceApplicationSceneViewController view](self->_deviceApplicationSceneViewController, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAutoresizingMask:", 0);

  -[SBMedusaDecoratedDeviceApplicationSceneViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_deviceApplicationSceneViewController, self->_containerView);
  v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  blurViewContainerView = self->_blurViewContainerView;
  self->_blurViewContainerView = v24;

  -[UIView setUserInteractionEnabled:](self->_blurViewContainerView, "setUserInteractionEnabled:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurViewContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_blurViewContainerView);
  -[UIView leftAnchor](self->_blurViewContainerView, "leftAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leftAnchor](self->_containerView, "leftAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[UIView rightAnchor](self->_blurViewContainerView, "rightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView rightAnchor](self->_containerView, "rightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[UIView topAnchor](self->_blurViewContainerView, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_containerView, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[UIView bottomAnchor](self->_blurViewContainerView, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_containerView, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[SBMedusaDecoratedDeviceApplicationSceneViewController _createOrDestroyTopAffordanceViewControllerAnimated:](self, "_createOrDestroyTopAffordanceViewControllerAnimated:", 0);
  v38 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  darkenView = self->_darkenView;
  self->_darkenView = v38;

  v40 = self->_darkenView;
  -[SBMedusaDecoratedDeviceApplicationSceneViewController darkenViewAlpha](self, "darkenViewAlpha");
  -[UIView setAlpha:](v40, "setAlpha:");
  v41 = self->_darkenView;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0274509806, 0.0431372561, 0.0666666701, 0.5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v41, "setBackgroundColor:", v42);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_darkenView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView layer](self->_darkenView, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAllowsHitTesting:", 0);

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_darkenView);
  -[UIView leftAnchor](self->_darkenView, "leftAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leftAnchor](self->_containerView, "leftAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  -[UIView rightAnchor](self->_darkenView, "rightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView rightAnchor](self->_containerView, "rightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[UIView topAnchor](self->_darkenView, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_containerView, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  -[UIView bottomAnchor](self->_darkenView, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_containerView, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  -[SBMedusaDecoratedDeviceApplicationSceneViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3)
    -[SBMedusaDecoratedDeviceApplicationSceneViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_deviceApplicationSceneViewController);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  v7 = a4;
  -[SBMedusaDecoratedDeviceApplicationSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBDeviceApplicationSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](self->_deviceApplicationSceneViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height, v8.receiver, v8.super_class);
  -[SBTopAffordanceViewController viewWillTransitionToSize:withTransitionCoordinator:](self->_topAffordanceViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (id)topAffordanceView
{
  return (id)-[SBTopAffordanceViewController view](self->_topAffordanceViewController, "view");
}

- (void)setDarkenViewAlpha:(double)a3
{
  if (self->_darkenViewAlpha != a3)
  {
    self->_darkenViewAlpha = a3;
    if (-[SBMedusaDecoratedDeviceApplicationSceneViewController isViewLoaded](self, "isViewLoaded"))
      -[UIView setAlpha:](self->_darkenView, "setAlpha:", a3);
  }
}

- (void)setDropInteraction:(id)a3
{
  UIDropInteraction *v5;
  UIDropInteraction **p_dropInteraction;
  UIDropInteraction *dropInteraction;
  UIDropInteraction *v8;

  v5 = (UIDropInteraction *)a3;
  p_dropInteraction = &self->_dropInteraction;
  dropInteraction = self->_dropInteraction;
  v8 = v5;
  if (dropInteraction != v5)
  {
    if (dropInteraction
      && -[SBMedusaDecoratedDeviceApplicationSceneViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIView removeInteraction:](self->_containerView, "removeInteraction:", *p_dropInteraction);
    }
    objc_storeStrong((id *)&self->_dropInteraction, a3);
    if (*p_dropInteraction
      && -[SBMedusaDecoratedDeviceApplicationSceneViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIView addInteraction:](self->_containerView, "addInteraction:", *p_dropInteraction);
    }
  }

}

- (int64_t)homeGrabberDisplayMode
{
  return -[SBDeviceApplicationSceneViewController homeGrabberDisplayMode](self->_deviceApplicationSceneViewController, "homeGrabberDisplayMode");
}

- (void)setHomeGrabberDisplayMode:(int64_t)a3
{
  -[SBDeviceApplicationSceneViewController setHomeGrabberDisplayMode:](self->_deviceApplicationSceneViewController, "setHomeGrabberDisplayMode:", a3);
}

- (void)setHomeGrabberPillSettings:(id)a3
{
  -[SBDeviceApplicationSceneViewController setHomeGrabberPillSettings:](self->_deviceApplicationSceneViewController, "setHomeGrabberPillSettings:", a3);
}

- (NSString)sceneMinificationFilter
{
  return self->_sceneMinificationFilter;
}

- (void)setSceneMinificationFilter:(id)a3
{
  NSString *v4;
  NSString *sceneMinificationFilter;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    sceneMinificationFilter = self->_sceneMinificationFilter;
    self->_sceneMinificationFilter = v4;

    -[SBMedusaDecoratedDeviceApplicationSceneViewController _updateAsyncRendering](self, "_updateAsyncRendering");
  }

}

- (BOOL)sceneRendersAsynchronously
{
  return self->_sceneRendersAsynchronously;
}

- (void)setSceneRendersAsynchronously:(BOOL)a3
{
  if (self->_sceneRendersAsynchronously != a3)
  {
    self->_sceneRendersAsynchronously = a3;
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _updateAsyncRendering](self, "_updateAsyncRendering");
  }
}

- (BOOL)sceneResizesHostedContext
{
  return -[SBDeviceApplicationSceneViewController sceneResizesHostedContext](self->_deviceApplicationSceneViewController, "sceneResizesHostedContext");
}

- (void)setSceneResizesHostedContext:(BOOL)a3
{
  -[SBDeviceApplicationSceneViewController setSceneResizesHostedContext:](self->_deviceApplicationSceneViewController, "setSceneResizesHostedContext:", a3);
}

- (MTLumaDodgePillSettings)homeGrabberPillSettings
{
  return -[SBDeviceApplicationSceneViewController homeGrabberPillSettings](self->_deviceApplicationSceneViewController, "homeGrabberPillSettings");
}

- (void)_handleTopAffordanceTapGestureRecognizerAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "state") == 3)
  {
    -[SBMedusaDecoratedDeviceApplicationSceneViewController topAffordanceView](self, "topAffordanceView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceViewController view](self->_topAffordanceViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
    {
      -[SBMedusaDecoratedDeviceApplicationSceneViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationInView:", v6);
      v8 = v7;
      v10 = v9;
      -[SBTopAffordanceViewController dotsView](self->_topAffordanceViewController, "dotsView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "convertPoint:toView:", v11, v8, v10);
      if ((objc_msgSend(v11, "pointInside:withEvent:", 0) & 1) == 0)
        -[SBMedusaDecoratedDeviceApplicationSceneViewController _sendStatusBarScrollToTopActionForGestureRecognizer:](self, "_sendStatusBarScrollToTopActionForGestureRecognizer:", v12);

    }
    else
    {
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _sendStatusBarScrollToTopActionForGestureRecognizer:](self, "_sendStatusBarScrollToTopActionForGestureRecognizer:", v12);
    }
  }

}

- (void)_sendStatusBarScrollToTopActionForGestureRecognizer:(id)a3
{
  SBDeviceApplicationSceneViewController *deviceApplicationSceneViewController;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  v5 = a3;
  -[SBDeviceApplicationSceneViewController view](deviceApplicationSceneViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;

  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA10]), "initWithType:xPosition:", 0, v8);
  -[SBMedusaDecoratedDeviceApplicationSceneViewController sceneHandle](self, "sceneHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sceneIfExists");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendActions:", v11);

}

- (void)_handleSplitHomeScreenSwitcherKeyShortcut
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SBMedusaDecoratedDeviceApplicationSceneViewController *v13;
  uint64_t v14;

  v3 = -[SBMedusaDecoratedDeviceApplicationSceneViewController layoutRole](self, "layoutRole");
  +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 1)
  {
    +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 2);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = 3;
    v4 = (void *)v5;
  }
  else
  {
    v6 = 2;
  }
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fbsDisplayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__SBMedusaDecoratedDeviceApplicationSceneViewController__handleSplitHomeScreenSwitcherKeyShortcut__block_invoke;
  v11[3] = &unk_1E8EAE550;
  v12 = v4;
  v13 = self;
  v14 = v6;
  v10 = v4;
  objc_msgSend(v7, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v9, v11, 0);

}

void __98__SBMedusaDecoratedDeviceApplicationSceneViewController__handleSplitHomeScreenSwitcherKeyShortcut__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 51);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__SBMedusaDecoratedDeviceApplicationSceneViewController__handleSplitHomeScreenSwitcherKeyShortcut__block_invoke_2;
  v7[3] = &unk_1E8EAE498;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v3, "modifyApplicationContext:", v7);

}

void __98__SBMedusaDecoratedDeviceApplicationSceneViewController__handleSplitHomeScreenSwitcherKeyShortcut__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v7, "setEntity:forLayoutRole:", v3, 1);
  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEntity:forLayoutRole:", v4, 2);

  +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEntity:forLayoutRole:", v5, 3);

  +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEntity:forLayoutRole:", v6, 4);

  objc_msgSend(v7, "setRequestedSpaceConfiguration:", objc_msgSend(*(id *)(a1 + 40), "spaceConfiguration"));
  objc_msgSend(v7, "setRequestedPeekConfiguration:", *(_QWORD *)(a1 + 48));

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  void *v5;

  if (self->_topAffordanceTapGestureRecognizer == a3
    && (-[SBMedusaDecoratedDeviceApplicationSceneViewController topAffordanceView](self, "topAffordanceView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SBTopAffordanceViewController view](self->_topAffordanceViewController, "view"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v4 == v5))
  {
    return !-[SBTopAffordanceViewController isExpanded](self->_topAffordanceViewController, "isExpanded");
  }
  else
  {
    return 1;
  }
}

- (void)_elasticValueViewControllerWillPresent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (*(_OWORD *)&self->_layoutRole == __PAIR128__(1, 1))
  {
    v5 = v4;
    -[SBTopAffordanceViewController setHidden:forReason:animated:](self->_topAffordanceViewController, "setHidden:forReason:animated:", 1, CFSTR("Elastic HUD"), 1);
    v4 = v5;
  }

}

- (void)_elasticValueViewControllerWillDismiss:(id)a3
{
  -[SBTopAffordanceViewController setHidden:forReason:animated:](self->_topAffordanceViewController, "setHidden:forReason:animated:", 0, CFSTR("Elastic HUD"), 1);
}

- (void)_guidedAccessActivationChanged:(id)a3
{
  -[SBMedusaDecoratedDeviceApplicationSceneViewController _createOrDestroyTopAffordanceViewControllerAnimated:](self, "_createOrDestroyTopAffordanceViewControllerAnimated:", 1);
}

- (void)_medusaCapabilityChanged:(id)a3
{
  -[SBMedusaDecoratedDeviceApplicationSceneViewController _createOrDestroyTopAffordanceViewControllerAnimated:](self, "_createOrDestroyTopAffordanceViewControllerAnimated:", 1);
}

- (void)_windowManagementStyleDidChange:(id)a3
{
  -[SBMedusaDecoratedDeviceApplicationSceneViewController _createOrDestroyTopAffordanceViewControllerAnimated:](self, "_createOrDestroyTopAffordanceViewControllerAnimated:", 1);
  -[SBMedusaDecoratedDeviceApplicationSceneViewController updateTopAffordanceOverrideUserInterfaceStyle](self, "updateTopAffordanceOverrideUserInterfaceStyle");
  -[SBMedusaDecoratedDeviceApplicationSceneViewController updateTopAffordanceContextMenu](self, "updateTopAffordanceContextMenu");
}

- (void)applicationSceneViewController:(id)a3 statusBarTapped:(id)a4 tapActionType:(int64_t)a5
{
  SBMedusaDecoratedDeviceApplicationSceneViewControllerDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "medusaDecoratedDeviceApplicationSceneViewController:statusBarTapped:tapActionType:", self, v8, a5);

}

- (void)applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "medusaDecoratedDeviceApplicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:", self);

}

- (BOOL)applicationSceneViewControllerIsInNonrotatingWindow:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "medusaDecoratedDeviceApplicationSceneViewControllerIsInNonrotatingWindow:", self);
  else
    v5 = 0;

  return v5;
}

- (UIView)_blurViewContainerView
{
  return self->_blurViewContainerView;
}

- (id)_blurContentView
{
  return self->_blurView;
}

- (void)_setBlurContentView:(id)a3
{
  SBApplicationBlurContentView *v5;
  SBApplicationBlurContentView **p_blurView;
  SBApplicationBlurContentView *blurView;
  void *v8;
  SBApplicationBlurContentView *v9;

  v5 = (SBApplicationBlurContentView *)a3;
  p_blurView = &self->_blurView;
  blurView = self->_blurView;
  if (blurView != v5)
  {
    v9 = v5;
    -[SBApplicationBlurContentView removeFromSuperview](blurView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_blurView, a3);
    if (*p_blurView)
    {
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _beginRequiringSceneViewMatchMoveAnimationForReason:](self, "_beginRequiringSceneViewMatchMoveAnimationForReason:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewControllerBlurredReason"));
      -[SBApplicationBlurContentView setClipsToBounds:](*p_blurView, "setClipsToBounds:", 1);
      -[SBApplicationBlurContentView layer](*p_blurView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAllowsGroupOpacity:", 1);

      -[UIView addSubview:](self->_blurViewContainerView, "addSubview:", *p_blurView);
    }
    else
    {
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _endRequiringSceneViewMatchMoveAnimationForReason:](self, "_endRequiringSceneViewMatchMoveAnimationForReason:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewControllerBlurredReason"));
    }
    self->_isBlurred = *p_blurView != 0;
    v5 = v9;
  }

}

- (BOOL)_sceneViewHasMatchMoveAnimation
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[SBDeviceApplicationSceneViewController view](self->_deviceApplicationSceneViewController, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("SceneViewMatchMoveAnimation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_addSceneViewMatchMoveAnimation
{
  void *v3;
  char v4;
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
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  -[SBApplicationSceneHandle application](self->_deviceApplicationSceneHandle, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "classicAppPhoneAppRunningOnPad");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_containerView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSourceLayer:", v6);

    objc_msgSend(v5, "setDuration:", INFINITY);
    objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v5, "setRemovedOnCompletion:", 0);
    objc_msgSend(v5, "setAppliesX:", 0);
    objc_msgSend(v5, "setAppliesY:", 0);
    objc_msgSend(v5, "setAppliesScale:", 1);
    objc_msgSend(v5, "setUsesNormalizedCoordinates:", 1);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 1.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v8;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 1.0, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v9;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSourcePoints:", v11);

    -[SBDeviceApplicationSceneViewController view](self->_deviceApplicationSceneViewController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAnimation:forKey:", v5, CFSTR("SceneViewMatchMoveAnimation"));

    -[SBMedusaDecoratedDeviceApplicationSceneViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

    -[SBMedusaDecoratedDeviceApplicationSceneViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutIfNeeded");

  }
}

- (void)_removeSceneViewMatchMoveAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBDeviceApplicationSceneViewController view](self->_deviceApplicationSceneViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("SceneViewMatchMoveAnimation"));

  -[SBMedusaDecoratedDeviceApplicationSceneViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[SBMedusaDecoratedDeviceApplicationSceneViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)_beginRequiringSceneViewMatchMoveAnimationForReason:(id)a3
{
  NSMutableSet *matchMoveAnimationRequiringReasons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController.m"), 1585, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  matchMoveAnimationRequiringReasons = self->_matchMoveAnimationRequiringReasons;
  if (!matchMoveAnimationRequiringReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matchMoveAnimationRequiringReasons;
    self->_matchMoveAnimationRequiringReasons = v6;

    matchMoveAnimationRequiringReasons = self->_matchMoveAnimationRequiringReasons;
  }
  v8 = -[NSMutableSet count](matchMoveAnimationRequiringReasons, "count");
  -[NSMutableSet addObject:](self->_matchMoveAnimationRequiringReasons, "addObject:", v10);
  if (!v8
    || !-[SBMedusaDecoratedDeviceApplicationSceneViewController _sceneViewHasMatchMoveAnimation](self, "_sceneViewHasMatchMoveAnimation"))
  {
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _addSceneViewMatchMoveAnimation](self, "_addSceneViewMatchMoveAnimation");
  }

}

- (void)_endRequiringSceneViewMatchMoveAnimationForReason:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController.m"), 1600, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v5 = -[NSMutableSet count](self->_matchMoveAnimationRequiringReasons, "count");
  -[NSMutableSet removeObject:](self->_matchMoveAnimationRequiringReasons, "removeObject:", v9);
  v6 = -[NSMutableSet count](self->_matchMoveAnimationRequiringReasons, "count");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
    -[SBMedusaDecoratedDeviceApplicationSceneViewController _removeSceneViewMatchMoveAnimation](self, "_removeSceneViewMatchMoveAnimation");

}

- (void)_setTopAffordanceAutoHides:(BOOL)a3
{
  -[SBTopAffordanceViewController setAutoHides:](self->_topAffordanceViewController, "setAutoHides:", a3);
}

- (BOOL)_wantsTopAffordance
{
  _BOOL4 v3;
  int v4;
  char IsActive;
  void *v6;
  void *v7;

  v3 = -[SBMainWorkspace isMedusaCapable](self->_workspace, "isMedusaCapable");
  if (-[SBSetupManager isInSetupMode](self->_setupManager, "isInSetupMode"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    IsActive = SBGuidedAccessIsActive();
    LOBYTE(v4) = 0;
    if (v3 && (IsActive & 1) == 0)
    {
      -[SBMedusaDecoratedDeviceApplicationSceneViewController sceneHandle](self, "sceneHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "application");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "alwaysMaximizedInChamois") & 1) != 0)
        LOBYTE(v4) = 0;
      else
        v4 = objc_msgSend(v7, "restrictedToTheEmbeddedDisplayInChamois") ^ 1;

    }
  }
  return v4;
}

- (void)_createOrDestroyTopAffordanceViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  SBTopAffordanceViewController *topAffordanceViewController;
  SBTopAffordanceViewController *v7;
  void *v8;
  SBTopAffordanceViewController *v9;
  SBTopAffordanceViewController *v10;
  SBTopAffordanceViewController *v11;
  uint64_t v12;
  void *v13;
  SBTopAffordanceViewController *v14;
  id *v15;
  id v16;
  SBTopAffordanceViewController *v17;
  UITapGestureRecognizer *v18;
  UITapGestureRecognizer *v19;
  UITapGestureRecognizer *topAffordanceTapGestureRecognizer;
  void *v21;
  SBTopAffordanceViewController *v22;
  UIView *containerView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  void *v39;
  BOOL v40;
  _QWORD v41[4];
  void *v42;
  BOOL v43;
  _QWORD v44[6];

  v3 = a3;
  v44[4] = *MEMORY[0x1E0C80C00];
  v5 = -[SBMedusaDecoratedDeviceApplicationSceneViewController _wantsTopAffordance](self, "_wantsTopAffordance");
  topAffordanceViewController = self->_topAffordanceViewController;
  if (v5 && !topAffordanceViewController)
  {
    v7 = [SBTopAffordanceViewController alloc];
    -[SBMedusaDecoratedDeviceApplicationSceneViewController sceneHandle](self, "sceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBTopAffordanceViewController initWithDeviceApplicationSceneHandle:](v7, "initWithDeviceApplicationSceneHandle:", v8);
    v10 = self->_topAffordanceViewController;
    self->_topAffordanceViewController = v9;

    -[SBTopAffordanceViewController setDelegate:](self->_topAffordanceViewController, "setDelegate:", self);
    -[SBTopAffordanceViewController setHidden:forReason:animated:](self->_topAffordanceViewController, "setHidden:forReason:animated:", self->_nubViewHidden, CFSTR("MedusaDecoratedVC"), v3);
    v11 = self->_topAffordanceViewController;
    if (-[SBMedusaDecoratedDeviceApplicationSceneViewController isNubViewHighlighted](self, "isNubViewHighlighted"))
      v12 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
    else
      v12 = 0;
    -[SBTopAffordanceViewController setHighlighted:](v11, "setHighlighted:", v12);
    v19 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTopAffordanceTapGestureRecognizerAction_);
    topAffordanceTapGestureRecognizer = self->_topAffordanceTapGestureRecognizer;
    self->_topAffordanceTapGestureRecognizer = v19;

    -[UITapGestureRecognizer setDelegate:](self->_topAffordanceTapGestureRecognizer, "setDelegate:", self);
    -[SBTopAffordanceViewController view](self->_topAffordanceViewController, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", 0.0);
    objc_msgSend(v21, "addGestureRecognizer:", self->_topAffordanceTapGestureRecognizer);
    v22 = self->_topAffordanceViewController;
    containerView = self->_containerView;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke;
    v41[3] = &unk_1E8EB74B0;
    v43 = v3;
    v42 = v21;
    v16 = v21;
    -[SBMedusaDecoratedDeviceApplicationSceneViewController bs_addChildViewController:withSuperview:animated:transitionBlock:](self, "bs_addChildViewController:withSuperview:animated:transitionBlock:", v22, containerView, v3, v41);
    v32 = self->_containerView;
    objc_msgSend(v16, "leftAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_containerView, "leftAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v35;
    objc_msgSend(v16, "rightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_containerView, "rightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v24;
    objc_msgSend(v16, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_containerView, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v27;
    objc_msgSend(v16, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_containerView, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v32, "addConstraints:", v31);

    v15 = &v42;
    -[SBMedusaDecoratedDeviceApplicationSceneViewController updateTopAffordanceOverrideUserInterfaceStyle](self, "updateTopAffordanceOverrideUserInterfaceStyle");
    -[SBMedusaDecoratedDeviceApplicationSceneViewController updateTopAffordanceContextMenu](self, "updateTopAffordanceContextMenu");
    goto LABEL_11;
  }
  if (!topAffordanceViewController)
    LOBYTE(v5) = 1;
  if (!v5)
  {
    -[SBTopAffordanceViewController view](topAffordanceViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_topAffordanceViewController;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_4;
    v38[3] = &unk_1E8EB74B0;
    v40 = v3;
    v15 = &v39;
    v39 = v13;
    v16 = v13;
    -[SBMedusaDecoratedDeviceApplicationSceneViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", v14, v3, v38);
    v17 = self->_topAffordanceViewController;
    self->_topAffordanceViewController = 0;

    v18 = self->_topAffordanceTapGestureRecognizer;
    self->_topAffordanceTapGestureRecognizer = 0;

LABEL_11:
  }
}

void __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v5 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 40))
    v6 = 0.2;
  else
    v6 = 0.0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_2;
  v10[3] = &unk_1E8E9DED8;
  v11 = *(id *)(a1 + 32);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_3;
  v8[3] = &unk_1E8E9F1C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v10, v8, v6);

}

uint64_t __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v5 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 40))
    v6 = 0.2;
  else
    v6 = 0.0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_5;
  v10[3] = &unk_1E8E9DED8;
  v11 = *(id *)(a1 + 32);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_6;
  v8[3] = &unk_1E8E9F1C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v10, v8, v6);

}

uint64_t __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateTopAffordanceHighlight
{
  _BOOL4 nubViewHighlighted;
  _BOOL4 v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;

  if (-[SBMedusaDecoratedDeviceApplicationSceneViewController isViewLoaded](self, "isViewLoaded"))
  {
    nubViewHighlighted = self->_nubViewHighlighted;
    v4 = SBSpaceConfigurationIsSplitView(self->_spaceConfiguration)
      || (unint64_t)(self->_floatingConfiguration - 1) < 2;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectedWindowScenes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
    -[SBMedusaDecoratedDeviceApplicationSceneViewController topAffordanceView](self, "topAffordanceView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceViewController view](self->_topAffordanceViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      v11 = v4 & v8;
      if (v7 > 1)
        v11 = 1;
      if (nubViewHighlighted)
        v12 = v11;
      else
        v12 = 0;
      -[SBTopAffordanceViewController setHighlighted:](self->_topAffordanceViewController, "setHighlighted:", v12);
    }
  }
}

- (void)_updateAsyncRendering
{
  _BOOL4 sceneRendersAsynchronously;
  SBDeviceApplicationSceneViewController *deviceApplicationSceneViewController;
  void *v5;
  _BOOL8 v6;
  NSString *sceneMinificationFilter;
  SBDeviceApplicationSceneViewController *v8;

  sceneRendersAsynchronously = self->_sceneRendersAsynchronously;
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  if (sceneRendersAsynchronously)
  {
    -[SBDeviceApplicationSceneViewController view](deviceApplicationSceneViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_msgSend(v5, "isHidden") & 1) == 0 && self->_disableAsyncRenderingCount == 0;

    -[SBDeviceApplicationSceneViewController setSceneRendersAsynchronously:](self->_deviceApplicationSceneViewController, "setSceneRendersAsynchronously:", v6);
    v8 = self->_deviceApplicationSceneViewController;
    if (v6)
      sceneMinificationFilter = self->_sceneMinificationFilter;
    else
      sceneMinificationFilter = 0;
  }
  else
  {
    -[SBDeviceApplicationSceneViewController setSceneRendersAsynchronously:](deviceApplicationSceneViewController, "setSceneRendersAsynchronously:", 0);
    sceneMinificationFilter = 0;
    v8 = self->_deviceApplicationSceneViewController;
  }
  -[SBDeviceApplicationSceneViewController setSceneMinificationFilter:](v8, "setSceneMinificationFilter:", sceneMinificationFilter);
}

- (BOOL)_isChamoisWindowingUIEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SBDeviceApplicationSceneHandle _windowScene](self->_deviceApplicationSceneHandle, "_windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isChamoisWindowingUIEnabled");

  return v4;
}

- (double)darkenViewAlpha
{
  return self->_darkenViewAlpha;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (int64_t)spaceConfiguration
{
  return self->_spaceConfiguration;
}

- (int64_t)floatingConfiguration
{
  return self->_floatingConfiguration;
}

- (SBMedusaDecoratedDeviceApplicationSceneViewControllerDelegate)delegate
{
  return (SBMedusaDecoratedDeviceApplicationSceneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_matchMoveAnimationRequiringReasons, 0);
  objc_storeStrong((id *)&self->_statusBarAssertions, 0);
  objc_storeStrong((id *)&self->_sceneMinificationFilter, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_darkenView, 0);
  objc_storeStrong((id *)&self->_topAffordanceTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_topAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_blurViewContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_applicationSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_deviceApplicationSceneViewController, 0);
  objc_storeStrong((id *)&self->_deviceApplicationSceneHandle, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

void __102__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleCloseAction__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, a3, "Error while attempting to disconnect scene: %@", (uint8_t *)&v3);
}

- (void)_modifyApplicationContext:(void *)a1 handleActionType:(NSObject *)a2 spaceConfiguration:layoutRole:desiredFloatingConfiguration:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "succinctDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "previousLayoutState was not an SBMainDisplayLayoutState: %{public}@", (uint8_t *)&v5);

}

@end

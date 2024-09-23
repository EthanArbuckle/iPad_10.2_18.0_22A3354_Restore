@implementation SBInCallBannerPresentableViewController

- (SBInCallBannerPresentableViewController)initWithSceneHandle:(id)a3
{
  id v5;
  SBInCallBannerPresentableViewController *v6;
  SBInCallBannerPresentableViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInCallBannerPresentableViewController;
  v6 = -[SBInCallBannerPresentableViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneHandle, a3);
    -[SBDeviceApplicationSceneHandle addObserver:](v7->_sceneHandle, "addObserver:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SBInCallBannerPresentableViewController isViewLoaded](self, "isViewLoaded"))
    -[SBInCallBannerPresentableViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_sceneViewController);
  v3.receiver = self;
  v3.super_class = (Class)SBInCallBannerPresentableViewController;
  -[SBInCallBannerPresentableViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLayoutSubviews
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
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBInCallBannerPresentableViewController;
  -[SBInCallBannerPresentableViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[SBInCallBannerPresentableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = -[SBInCallBannerPresentableViewController interfaceOrientation](self, "interfaceOrientation");
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_sceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v13, v13, v9, v11);
  -[SBDeviceApplicationSceneViewController backgroundView](self->_sceneViewController, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidLoad
{
  void *v3;
  SBDeviceApplicationSceneViewController *v4;
  SBDeviceApplicationSceneViewController *sceneViewController;
  SBSceneViewStatusBarAssertion *v6;
  SBSceneViewStatusBarAssertion *statusBarHiddenAssertion;
  void *v8;
  void *v9;
  SBInCallBannerSceneBackgroundView *v10;
  SBInCallBannerSceneBackgroundView *v11;
  uint64_t v12;
  SBDeviceApplicationSceneViewController *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBInCallBannerPresentableViewController;
  -[SBInCallBannerPresentableViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[SBInCallBannerPresentableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDeviceApplicationSceneHandle newSceneViewController](self->_sceneHandle, "newSceneViewController");
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v4;

  -[SBDeviceApplicationSceneViewController setRendersWhileLocked:](self->_sceneViewController, "setRendersWhileLocked:", 1);
  -[SBDeviceApplicationSceneViewController setHomeGrabberDisplayMode:](self->_sceneViewController, "setHomeGrabberDisplayMode:", 1);
  -[SBDeviceApplicationSceneViewController statusBarAssertionWithStatusBarHidden:atLevel:](self->_sceneViewController, "statusBarAssertionWithStatusBarHidden:atLevel:", 1, 0);
  v6 = (SBSceneViewStatusBarAssertion *)objc_claimAutoreleasedReturnValue();
  statusBarHiddenAssertion = self->_statusBarHiddenAssertion;
  self->_statusBarHiddenAssertion = v6;

  -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  objc_msgSend(v8, "_setContinuousCornerRadius:");
  objc_msgSend(v8, "setClipsToBounds:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapAction_);
  objc_msgSend(v8, "addGestureRecognizer:", v9);
  v10 = [SBInCallBannerSceneBackgroundView alloc];
  objc_msgSend(v8, "bounds");
  v11 = -[SBInCallBannerSceneBackgroundView initWithFrame:](v10, "initWithFrame:");
  -[SBDeviceApplicationSceneViewController setBackgroundView:](self->_sceneViewController, "setBackgroundView:", v11);
  -[SBInCallBannerPresentableViewController addChildViewController:](self, "addChildViewController:", self->_sceneViewController);
  v12 = -[SBInCallBannerPresentableViewController interfaceOrientation](self, "interfaceOrientation");
  v13 = self->_sceneViewController;
  -[SBInCallBannerPresentableViewController preferredBannerContentSize](self, "preferredBannerContentSize");
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](v13, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v12, v12);
  -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v14);

  -[SBDeviceApplicationSceneViewController didMoveToParentViewController:](self->_sceneViewController, "didMoveToParentViewController:", self);
  -[SBDeviceApplicationSceneViewController setDisplayMode:animationFactory:completion:](self->_sceneViewController, "setDisplayMode:animationFactory:completion:", 4, 0, 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBInCallBannerPresentableViewController;
  v7 = a4;
  -[SBInCallBannerPresentableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__SBInCallBannerPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E8E9EA28;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __94__SBInCallBannerPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inCallBannerPresentableViewController:viewWillTransitionSizeWithAnimationSettings:", v2, v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)draggingDidBeginWithGestureProxy:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_lastGestureProxy, a3);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__SBInCallBannerPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke;
  v6[3] = &unk_1E8EA7060;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "setActionHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __76__SBInCallBannerPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handlePanGestureProxyAction:", v3);

}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class();
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isCallConnected");
  return (char)v4;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)result containerSize:(CGSize)a4
{
  double height;

  height = self->_preferredBannerContentSize.height;
  result.height = height;
  return result;
}

- (NSString)requesterIdentifier
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "requesterIdentifier");
}

- (NSString)requestIdentifier
{
  return (NSString *)CFSTR("InCall");
}

- (BOOL)shouldDismissForReason:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[SBInCallBannerPresentableViewController isCallConnected](self, "isCallConnected"))
  {
    LOBYTE(v5) = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("dismissOverlays")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("mainScreenAnimationController")) & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("assistantWillAppear")) ^ 1;
  }

  return v5;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallBannerPresentableViewControllerDidAppear:", self);

}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id WeakRetained;

  self->_presented = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallBannerPresentableViewControllerWillAppear:", self);

}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  SBInCallBannerPresentableViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "inCallBannerPresentableViewController:willDisappearWithReason:", self, v6);

}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  SBInCallBannerPresentableViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  self->_presented = 0;
  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "inCallBannerPresentableViewController:didDisappearWithReason:", self, v6);

}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallBannerPresentableViewControllerUserInteractionWillBegin:", self);

}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallBannerPresentableViewControllerUserInteractionDidEnd:", self);

}

- (void)invalidate
{
  SBSceneViewStatusBarAssertion *statusBarHiddenAssertion;

  -[SBDeviceApplicationSceneViewController invalidate](self->_sceneViewController, "invalidate");
  -[SBSceneViewStatusBarAssertion invalidate](self->_statusBarHiddenAssertion, "invalidate");
  statusBarHiddenAssertion = self->_statusBarHiddenAssertion;
  self->_statusBarHiddenAssertion = 0;

}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return (-[SBDeviceApplicationSceneHandle preferredHardwareButtonEventTypes](self->_sceneHandle, "preferredHardwareButtonEventTypes") & 2) != 0&& -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_sceneHandle, "handleHardwareButtonEventType:", 1);
}

- (BOOL)handleVolumeDownButtonPress
{
  return (-[SBDeviceApplicationSceneHandle preferredHardwareButtonEventTypes](self->_sceneHandle, "preferredHardwareButtonEventTypes") & 4) != 0&& -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_sceneHandle, "handleHardwareButtonEventType:", 2);
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[SBDeviceApplicationSceneHandle preferredHardwareButtonEventTypes](self->_sceneHandle, "preferredHardwareButtonEventTypes");
  if (!v3)
  {
    if ((v5 & 8) != 0)
    {
      v6 = 3;
      return -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_sceneHandle, "handleHardwareButtonEventType:", v6);
    }
    return 0;
  }
  if ((v5 & 0x10) == 0)
    return 0;
  v6 = 4;
  return -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_sceneHandle, "handleHardwareButtonEventType:", v6);
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[SBInCallBannerPresentableViewController _inCallSceneClientSettingsDiffInspector](self, "_inCallSceneClientSettingsDiffInspector");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inspectDiff:withContext:", v6, 0);

}

- (id)_inCallSceneClientSettingsDiffInspector
{
  SBSUIInCallSceneClientSettingsDiffInspector *inCallSceneClientSettingsDiffInspector;
  SBSUIInCallSceneClientSettingsDiffInspector *v4;
  SBSUIInCallSceneClientSettingsDiffInspector *v5;
  SBSUIInCallSceneClientSettingsDiffInspector *v6;
  _QWORD v8[4];
  id v9;
  id location;

  inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  if (!inCallSceneClientSettingsDiffInspector)
  {
    v4 = (SBSUIInCallSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0DAC4D0]);
    v5 = self->_inCallSceneClientSettingsDiffInspector;
    self->_inCallSceneClientSettingsDiffInspector = v4;

    objc_initWeak(&location, self);
    v6 = self->_inCallSceneClientSettingsDiffInspector;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__SBInCallBannerPresentableViewController__inCallSceneClientSettingsDiffInspector__block_invoke;
    v8[3] = &unk_1E8EA2658;
    objc_copyWeak(&v9, &location);
    -[SBSUIInCallSceneClientSettingsDiffInspector observeCallConnectedWithBlock:](v6, "observeCallConnectedWithBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  }
  return inCallSceneClientSettingsDiffInspector;
}

void __82__SBInCallBannerPresentableViewController__inCallSceneClientSettingsDiffInspector__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_callConnectedStatusChanged");

}

- (void)_callConnectedStatusChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallBannerPresentableViewControllerCallConnectedStatusChanged:", self);

}

+ (double)cornerRadius
{
  return 13.0;
}

+ (NSString)requesterIdentifier
{
  return (NSString *)CFSTR("com.apple.SpringBoard.InCall");
}

- (BOOL)isCallConnected
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = objc_opt_class();
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCallConnected");

  return v7;
}

- (CGPoint)translationInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[BNPanGestureProxy translationInCoordinateSpace:](self->_lastGestureProxy, "translationInCoordinateSpace:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)visualTranslationInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[BNPanGestureProxy visualTranslationInCoordinateSpace:](self->_lastGestureProxy, "visualTranslationInCoordinateSpace:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)velocityInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[BNPanGestureProxy velocityInCoordinateSpace:](self->_lastGestureProxy, "velocityInCoordinateSpace:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_handleTapAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallBannerPresentableViewControllerDidReceiveTap:", self);

}

- (void)_handlePanGestureProxyAction:(id)a3
{
  int v4;
  id WeakRetained;

  v4 = objc_msgSend(a3, "didCrossDefaultThreshold");
  if (!self->_didCrossDefaultDraggingThreshold && v4 != 0)
  {
    self->_didCrossDefaultDraggingThreshold = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "inCallBannerPresentableViewControllerDidCrossDefaultDraggingThreshold:", self);

  }
}

- (SBInCallBannerPresentableViewControllerDelegate)delegate
{
  return (SBInCallBannerPresentableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)preferredBannerContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredBannerContentSize.width;
  height = self->_preferredBannerContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredBannerContentSize:(CGSize)a3
{
  self->_preferredBannerContentSize = a3;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inCallSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_statusBarHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_lastGestureProxy, 0);
}

@end

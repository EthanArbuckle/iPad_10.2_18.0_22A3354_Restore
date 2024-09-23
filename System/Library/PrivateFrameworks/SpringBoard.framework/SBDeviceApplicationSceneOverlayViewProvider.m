@implementation SBDeviceApplicationSceneOverlayViewProvider

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBDeviceApplicationSceneOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SBDeviceApplicationSceneOverlayViewProvider *v9;
  SBDeviceApplicationSceneOverlayViewProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationSceneOverlayViewProvider;
  v9 = -[SBDeviceApplicationSceneOverlayViewProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneHandle, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    -[SBDeviceApplicationSceneOverlayViewProvider _activateIfPossible](v10, "_activateIfPossible");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SBDeviceApplicationSceneOverlayViewProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneOverlayViewProvider;
  -[SBDeviceApplicationSceneOverlayViewProvider dealloc](&v3, sel_dealloc);
}

- (SBDeviceApplicationSceneOverlayViewController)overlayViewController
{
  void *orientationWrapperViewController;

  orientationWrapperViewController = self->_orientationWrapperViewController;
  if (!orientationWrapperViewController)
    orientationWrapperViewController = self->_basicWrapperViewController;
  return (SBDeviceApplicationSceneOverlayViewController *)orientationWrapperViewController;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[SBDeviceApplicationSceneOverlayViewProvider _realOverlayViewController](self, "_realOverlayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredStatusBarStyle");

  return v3;
}

- (BOOL)affectsStatusBarPresentation
{
  return 1;
}

- (BOOL)handledStatusBarTap:(id)a3 type:(int64_t)a4
{
  return 0;
}

- (BOOL)wantsResignActiveAssertion
{
  return 1;
}

- (int64_t)priority
{
  return 0;
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  SBIsolatedSceneOrientationFollowingWrapperViewController *orientationWrapperViewController;
  void *v7;
  void *v8;
  int64_t v9;

  if (-[SBDeviceApplicationSceneOverlayViewProvider shouldFollowSceneOrientation](self, "shouldFollowSceneOrientation")
    || ((1 << a3) & ~-[SBDeviceApplicationSceneOverlayViewProvider supportedInterfaceOrientations](self, "supportedInterfaceOrientations")) == 0)
  {
    return a3;
  }
  orientationWrapperViewController = self->_orientationWrapperViewController;
  if (orientationWrapperViewController)
    return -[SBIsolatedSceneOrientationFollowingWrapperViewController currentInterfaceOrientation](orientationWrapperViewController, "currentInterfaceOrientation");
  -[SBDeviceApplicationSceneOverlayBasicWrapperViewController view](self->_basicWrapperViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_windowInterfaceOrientation");

  return v9;
}

- (void)containerDidUpdateTraitsParticipant:(id)a3
{
  -[SBIsolatedSceneOrientationFollowingWrapperViewController containerDidUpdateTraitsParticipant:](self->_orientationWrapperViewController, "containerDidUpdateTraitsParticipant:", a3);
}

- (void)showContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)hideContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)shouldFollowSceneOrientation
{
  return 1;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  void *v2;
  int64_t v3;

  -[SBDeviceApplicationSceneOverlayViewProvider _realOverlayViewController](self, "_realOverlayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredInterfaceOrientationForPresentation");

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[SBDeviceApplicationSceneOverlayViewProvider _realOverlayViewController](self, "_realOverlayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return v3;
}

- (id)initialTraitsParticipantForOverlayContainer
{
  void *v3;
  void *v4;

  -[SBDeviceApplicationSceneOverlayViewProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialTraitsParticipantForOverlayViewProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_activateIfPossible
{
  _BOOL8 v3;
  SBIsolatedSceneOrientationFollowingWrapperViewController *v4;
  void *v5;
  void *basicWrapperViewController;
  void *v7;
  SBIsolatedSceneOrientationFollowingWrapperViewController *v8;
  SBIsolatedSceneOrientationFollowingWrapperViewController *orientationWrapperViewController;
  SBDeviceApplicationSceneOverlayBasicWrapperViewController *v10;
  SBDeviceApplicationSceneOverlayBasicWrapperViewController *v11;
  id v12;

  -[SBDeviceApplicationSceneOverlayViewProvider delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBDeviceApplicationSceneOverlayViewProvider contentWantsSimplifiedOrientationBehavior](self, "contentWantsSimplifiedOrientationBehavior")|| (objc_msgSend(v12, "overlayViewProviderIsHostedInNonrotatingWindow:", self) & 1) == 0&& -[SBDeviceApplicationSceneOverlayViewProvider shouldFollowSceneOrientation](self, "shouldFollowSceneOrientation"))
  {
    if (-[SBDeviceApplicationSceneOverlayViewProvider _mightNeedCounterRotationForBasicContentWrapper](self, "_mightNeedCounterRotationForBasicContentWrapper"))
    {
      v3 = -[SBDeviceApplicationSceneOverlayViewProvider _contentSupportedInterfaceOrientationsRequireContainerCounterRotation](self, "_contentSupportedInterfaceOrientationsRequireContainerCounterRotation");
      self->_needsCounterRotationReevaluationForFirstSupportedOrientationsUpdate = 1;
    }
    else
    {
      v3 = 0;
    }
    v10 = [SBDeviceApplicationSceneOverlayBasicWrapperViewController alloc];
    -[SBDeviceApplicationSceneOverlayViewProvider _realOverlayViewController](self, "_realOverlayViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBDeviceApplicationSceneOverlayBasicWrapperViewController initWithContentViewController:rendersWhileLocked:needsCounterRotation:](v10, "initWithContentViewController:rendersWhileLocked:needsCounterRotation:", v5, objc_msgSend(v12, "overlayViewProviderRendersWhileLocked:", self), v3);
    basicWrapperViewController = self->_basicWrapperViewController;
    self->_basicWrapperViewController = v11;
  }
  else
  {
    v4 = [SBIsolatedSceneOrientationFollowingWrapperViewController alloc];
    -[SBDeviceApplicationSceneOverlayViewProvider _realOverlayViewController](self, "_realOverlayViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
    basicWrapperViewController = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowSceneForOverlayViewProvider:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBIsolatedSceneOrientationFollowingWrapperViewController initWithContentViewController:sceneHandle:windowScene:orientationDelegate:rendersWhileLocked:](v4, "initWithContentViewController:sceneHandle:windowScene:orientationDelegate:rendersWhileLocked:", v5, basicWrapperViewController, v7, self, objc_msgSend(v12, "overlayViewProviderRendersWhileLocked:", self));
    orientationWrapperViewController = self->_orientationWrapperViewController;
    self->_orientationWrapperViewController = v8;

  }
  objc_msgSend(v12, "activateOverlayForViewProvider:", self);

}

- (void)_deactivateIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  SBIsolatedSceneOrientationFollowingWrapperViewController *orientationWrapperViewController;
  SBDeviceApplicationSceneOverlayBasicWrapperViewController *basicWrapperViewController;
  id v8;

  -[SBDeviceApplicationSceneOverlayViewProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (v3)
  {
    objc_msgSend(v3, "deactivateOverlayForViewProvider:", self);
  }
  else
  {
    -[SBDeviceApplicationSceneOverlayViewProvider overlayViewController](self, "overlayViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginAppearanceTransition:animated:", 0, 0);
    objc_msgSend(v4, "willMoveToParentViewController:", 0);
    objc_msgSend(v4, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(v4, "removeFromParentViewController");
    objc_msgSend(v4, "endAppearanceTransition");

  }
  orientationWrapperViewController = self->_orientationWrapperViewController;
  self->_orientationWrapperViewController = 0;

  basicWrapperViewController = self->_basicWrapperViewController;
  self->_basicWrapperViewController = 0;

}

- (id)_realOverlayViewController
{
  return 0;
}

- (BOOL)_mightNeedCounterRotationForBasicContentWrapper
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "classicAppPhoneAppRunningOnPad") & 1) != 0
    || !-[SBDeviceApplicationSceneOverlayViewProvider contentWantsSimplifiedOrientationBehavior](self, "contentWantsSimplifiedOrientationBehavior"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = !-[SBDeviceApplicationSceneOverlayViewProvider shouldFollowSceneOrientation](self, "shouldFollowSceneOrientation");
  }

  return v5;
}

- (BOOL)_contentSupportedInterfaceOrientationsRequireContainerCounterRotation
{
  return (-[SBDeviceApplicationSceneOverlayViewProvider supportedInterfaceOrientations](self, "supportedInterfaceOrientations") & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)_noteSupportedInterfaceOrientationsChanged
{
  id v3;

  if (self->_needsCounterRotationReevaluationForFirstSupportedOrientationsUpdate && self->_basicWrapperViewController)
  {
    if (-[SBDeviceApplicationSceneOverlayViewProvider _mightNeedCounterRotationForBasicContentWrapper](self, "_mightNeedCounterRotationForBasicContentWrapper"))
    {
      self->_needsCounterRotationReevaluationForFirstSupportedOrientationsUpdate = 0;
      -[SBDeviceApplicationSceneOverlayBasicWrapperViewController overlayView](self->_basicWrapperViewController, "overlayView");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setNeedsCounterRotation:", -[SBDeviceApplicationSceneOverlayViewProvider _contentSupportedInterfaceOrientationsRequireContainerCounterRotation](self, "_contentSupportedInterfaceOrientationsRequireContainerCounterRotation"));

    }
  }
}

- (SBDeviceApplicationSceneOverlayViewProviderDelegate)delegate
{
  return (SBDeviceApplicationSceneOverlayViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSceneHandle:(id)a3
{
  objc_storeStrong((id *)&self->_sceneHandle, a3);
}

- (BOOL)prefersStatusBarHidden
{
  return self->_prefersStatusBarHidden;
}

- (BOOL)contentWantsSimplifiedOrientationBehavior
{
  return self->_contentWantsSimplifiedOrientationBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_basicWrapperViewController, 0);
  objc_storeStrong((id *)&self->_orientationWrapperViewController, 0);
}

@end

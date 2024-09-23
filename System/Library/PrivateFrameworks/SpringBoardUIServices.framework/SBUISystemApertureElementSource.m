@implementation SBUISystemApertureElementSource

+ (id)unassociatedContext
{
  return +[SBUISystemApertureElementUnassociatedContext unassociatedContext](SBUISystemApertureElementUnassociatedContext, "unassociatedContext");
}

+ (void)_addSource:(id)a3
{
  id v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (v3)
  {
    v9 = v3;
    v4 = objc_msgSend((id)SBUISystemApertureElementSourceOpenSources, "containsObject:", v3);
    v3 = v9;
    if ((v4 & 1) == 0)
    {
      v5 = (void *)SBUISystemApertureElementSourceOpenSources;
      if (!SBUISystemApertureElementSourceOpenSources)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)SBUISystemApertureElementSourceOpenSources;
        SBUISystemApertureElementSourceOpenSources = v6;

        v5 = (void *)SBUISystemApertureElementSourceOpenSources;
      }
      objc_msgSend(v5, "addObject:", v9);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("SBUISystemApertureElementSourceDidConnectNotification"), v9);

      v3 = v9;
    }
  }

}

+ (void)_removeSource:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (v4)
    objc_msgSend((id)SBUISystemApertureElementSourceOpenSources, "removeObject:", v4);
  if (!objc_msgSend((id)SBUISystemApertureElementSourceOpenSources, "count"))
  {
    v3 = (void *)SBUISystemApertureElementSourceOpenSources;
    SBUISystemApertureElementSourceOpenSources = 0;

  }
}

+ (id)openSources
{
  return (id)objc_msgSend((id)SBUISystemApertureElementSourceOpenSources, "setRepresentation");
}

- (void)setLastKnownOtherSettings:(id)a3
{
  BSSettings *v4;
  BSSettings *lastKnownOtherSettings;
  id v6;

  v6 = a3;
  if ((-[BSSettings isEqual:](self->_lastKnownOtherSettings, "isEqual:") & 1) == 0)
  {
    v4 = (BSSettings *)objc_msgSend(v6, "copy");
    lastKnownOtherSettings = self->_lastKnownOtherSettings;
    self->_lastKnownOtherSettings = v4;

  }
}

- (SBUISystemApertureElementSource)init
{
  SBUISystemApertureElementSource *v2;
  _SBUISystemApertureElementSourceAnimationContext *v3;
  _SBUISystemApertureElementSourceAnimationContext *animationContext;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUISystemApertureElementSource;
  v2 = -[SBUISystemApertureElementSource init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_SBUISystemApertureElementSourceAnimationContext);
    animationContext = v2->_animationContext;
    v2->_animationContext = v3;

    +[SBUISystemApertureElementSource performSelector:withObject:afterDelay:](SBUISystemApertureElementSource, "performSelector:withObject:afterDelay:", sel__addSource_, v2, 0.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__windowDidAttachToContext_, *MEMORY[0x1E0CEC348], 0);

  }
  return v2;
}

- (SBUISystemApertureElementSource)initWithScene:(id)a3
{
  id v5;
  SBUISystemApertureElementSource *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v12;

  v5 = a3;
  v6 = -[SBUISystemApertureElementSource init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "role");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SBUISystemApertureSceneSessionRole"));

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SBUISystemApertureElementSource.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[[scene session] role] isEqualToString:kSBUISystemApertureSceneSessionRole]"));

    }
    -[SBUISystemApertureElementSource _setScene:](v6, "_setScene:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v6;
}

- (BOOL)isFallbackContext
{
  return 0;
}

- (NSString)associatedScenePersistenceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[SBUISystemApertureElementSource _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SBUISA_associatedScenePersistenceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (FBSSceneIdentityToken)identityToken
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementSource _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSSceneIdentityToken *)v3;
}

- (id)systemApertureElementViewController
{
  SBUISystemApertureElement **p_elementViewController;
  void *WeakRetained;
  void *v5;

  p_elementViewController = &self->__elementViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->__elementViewController);
  if (!WeakRetained)
  {
    -[SBUISystemApertureElementSource systemApertureElementViewControllerProvider](self, "systemApertureElementViewControllerProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemApertureElementViewController");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)p_elementViewController, WeakRetained);
  }
  return WeakRetained;
}

- (void)setSystemApertureElementProvider:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBUISystemApertureElementSource setSystemApertureElementViewControllerProvider:](self, "setSystemApertureElementViewControllerProvider:", v4);

}

- (void)setSystemApertureElementViewControllerProvider:(id)a3
{
  SBUISystemApertureElementProviding **p_systemApertureElementViewControllerProvider;
  id v5;
  id WeakRetained;

  p_systemApertureElementViewControllerProvider = &self->_systemApertureElementViewControllerProvider;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_systemApertureElementViewControllerProvider);

  objc_storeWeak((id *)p_systemApertureElementViewControllerProvider, v5);
  if (WeakRetained != v5)
    -[SBUISystemApertureElementSource setElementNeedsUpdate](self, "setElementNeedsUpdate");
}

- (id)containerViewController
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIView)containerView
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementSource containerViewController](self, "containerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)layoutGuideRootView
{
  void *v2;
  void *v3;
  void *v4;

  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (void)requestTransitionToMaximumSupportedLayoutMode
{
  id v2;

  if (self->_alertingAssertion)
    -[_SBUISystemApertureAlertingAssertion resetAutomaticInvalidationTimer](self->_alertingAssertion, "resetAutomaticInvalidationTimer");
  else
    v2 = -[SBUISystemApertureElementSource requestAlertingAssertion](self, "requestAlertingAssertion");
}

- (void)requestTransitionToPreferredLayoutMode
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredLayoutMode");

  if (v4 == -1)
    v5 = 3;
  else
    v5 = 1;
  -[SBUISystemApertureElementSource _sendActionForCommand:](self, "_sendActionForCommand:", v5);
}

- (void)requestNegativeResponseAnimation
{
  -[SBUISystemApertureElementSource _sendActionForCommand:](self, "_sendActionForCommand:", 2);
}

- (id)requestAlertingAssertionWithOptions:(unint64_t)a3
{
  char v4;
  _SBUISystemApertureAlertingAssertion *v5;
  _SBUISystemApertureAlertingAssertion *alertingAssertion;
  _SBUISystemApertureAlertingAssertion *v7;
  NSMutableArray *alertingAssertionsAwaitingActions;
  NSMutableArray *v9;
  NSMutableArray *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  if (!self->_alertingAssertion)
  {
    v4 = a3;
    if (-[SBUISystemApertureElementSource elementCanRequestAlertingAssertion](self, "elementCanRequestAlertingAssertion"))
    {
      v5 = -[_SBUISystemApertureAlertingAssertion initWithElementSource:]([_SBUISystemApertureAlertingAssertion alloc], "initWithElementSource:", self);
      alertingAssertion = self->_alertingAssertion;
      self->_alertingAssertion = v5;

      objc_initWeak(&location, self);
      v7 = self->_alertingAssertion;
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __71__SBUISystemApertureElementSource_requestAlertingAssertionWithOptions___block_invoke;
      v15 = &unk_1E4C403B0;
      objc_copyWeak(&v16, &location);
      -[_SBUISystemApertureAlertingAssertion addInvalidationBlock:](v7, "addInvalidationBlock:", &v12);
      alertingAssertionsAwaitingActions = self->_alertingAssertionsAwaitingActions;
      if (alertingAssertionsAwaitingActions)
      {
        -[NSMutableArray addObject:](alertingAssertionsAwaitingActions, "addObject:", self->_alertingAssertion, v12, v13, v14, v15);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_alertingAssertion, v12, v13, v14, v15);
        v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v10 = self->_alertingAssertionsAwaitingActions;
        self->_alertingAssertionsAwaitingActions = v9;

      }
      -[SBUISystemApertureElementSource _sendActionForCommand:](self, "_sendActionForCommand:", v4 & 1 | 6);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  return self->_alertingAssertion;
}

void __71__SBUISystemApertureElementSource_requestAlertingAssertionWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_alertingAssertion");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
    objc_msgSend(WeakRetained, "_setAlertingAssertion:", 0);

}

- (id)requestAlertingAssertion
{
  return -[SBUISystemApertureElementSource requestAlertingAssertionWithOptions:](self, "requestAlertingAssertionWithOptions:", 0);
}

- (void)elementWillPresentMenu
{
  if (!-[SBUISystemApertureElementSource elementHasMenuPresentation](self, "elementHasMenuPresentation"))
  {
    -[SBUISystemApertureElementSource setElementHasMenuPresentation:](self, "setElementHasMenuPresentation:", 1);
    -[SBUISystemApertureElementSource setElementNeedsUpdate](self, "setElementNeedsUpdate");
  }
}

- (void)elementDidDismissMenu
{
  if (-[SBUISystemApertureElementSource elementHasMenuPresentation](self, "elementHasMenuPresentation"))
  {
    -[SBUISystemApertureElementSource setElementHasMenuPresentation:](self, "setElementHasMenuPresentation:", 0);
    -[SBUISystemApertureElementSource setElementNeedsUpdate](self, "setElementNeedsUpdate");
  }
}

- (void)setPresentationPossible:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_presentationPossible != a3)
  {
    self->_presentationPossible = a3;
    if (a3)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __59__SBUISystemApertureElementSource_setPresentationPossible___block_invoke;
      v5[3] = &unk_1E4C403D8;
      v5[4] = self;
      -[SBUISystemApertureElementSource _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_systemApertureElementContextPresentationDidBecomePossible_, v5);
      -[SBUISystemApertureElementSource setElementNeedsUpdate](self, "setElementNeedsUpdate");
    }
    else
    {
      -[SBUISystemApertureElementSource systemApertureOwnedWindow](self, "systemApertureOwnedWindow");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 1);

      -[SBUISystemApertureElementSource setSystemApertureOwnedWindow:](self, "setSystemApertureOwnedWindow:", 0);
    }
  }
}

uint64_t __59__SBUISystemApertureElementSource_setPresentationPossible___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "systemApertureElementContextPresentationDidBecomePossible:", *(_QWORD *)(a1 + 32));
}

- (SBUISystemApertureElementConfiguration)mutableConfiguration
{
  SBUISystemApertureElementConfiguration *mutableConfiguration;
  SBUISystemApertureElementConfiguration *v4;
  SBUISystemApertureElementConfiguration *v5;

  mutableConfiguration = self->_mutableConfiguration;
  if (!mutableConfiguration)
  {
    v4 = objc_alloc_init(SBUISystemApertureElementConfiguration);
    v5 = self->_mutableConfiguration;
    self->_mutableConfiguration = v4;

    mutableConfiguration = self->_mutableConfiguration;
  }
  return mutableConfiguration;
}

- (id)_FBSScene
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementSource _scene](self, "_scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sceneSettings
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementSource _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)layoutMode
{
  void *v2;
  int64_t v3;

  -[SBUISystemApertureElementSource _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SBUISA_layoutMode");

  return v3;
}

- (void)validateConfiguration
{
  id v2;

  -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validateConfiguration");

}

- (void)setElementNeedsUpdate
{
  if (-[SBUISystemApertureElementSource isPresentationPossible](self, "isPresentationPossible"))
    -[SBUISystemApertureElementSource _performElementUpdate](self, "_performElementUpdate");
}

- (BOOL)_isPresentationPossibleAndSceneForeground
{
  void *v3;
  unint64_t v4;
  BOOL result;

  -[SBUISystemApertureElementSource _scene](self, "_scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activationState");

  result = -[SBUISystemApertureElementSource isPresentationPossible](self, "isPresentationPossible");
  if (v4 >= 2)
    return 0;
  return result;
}

- (void)setElementNeedsLayoutUpdateWithOptions:(unint64_t)a3 coordinatedAnimations:(id)a4
{
  char v4;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  int64_t v11;
  BOOL v12;
  void *v13;
  SBUISystemApertureSceneAction *v14;
  void *v15;
  void (**v16)(void);

  v4 = a3;
  v16 = (void (**)(void))a4;
  if (-[SBUISystemApertureElementSource _isPresentationPossibleAndSceneForeground](self, "_isPresentationPossibleAndSceneForeground")&& -[SBUISystemApertureElementSource _elementSupportsDynamicResizing](self, "_elementSupportsDynamicResizing"))
  {
    v6 = -[_SBUISystemApertureElementSourceAnimationContext hasPendingCoordinatedAnimations](self->_animationContext, "hasPendingCoordinatedAnimations");
    -[SBUISystemApertureElementSource transitionContext](self, "transitionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SBUISystemApertureElementSource transitionContext](self, "transitionContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "fromLayoutMode");
      v10 = v9 == -[SBUISystemApertureElementSource layoutMode](self, "layoutMode");

    }
    else
    {
      v10 = 1;
    }

    v11 = -[SBUISystemApertureElementSource layoutMode](self, "layoutMode");
    -[_SBUISystemApertureElementSourceAnimationContext addPendingAnimation:](self->_animationContext, "addPendingAnimation:", v16);
    if ((v4 & 1) != 0)
    {
      v12 = v11 == 4 && v10;
      -[_SBUISystemApertureElementSourceAnimationContext disableSkippingSceneResizeActions](self->_animationContext, "disableSkippingSceneResizeActions");
      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0C99E60];
        v14 = -[SBUISystemApertureSceneAction initWithCommand:]([SBUISystemApertureSceneAction alloc], "initWithCommand:", 4);
        objc_msgSend(v13, "setWithObject:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBUISystemApertureElementSource _performElementUpdateWithActions:](self, "_performElementUpdateWithActions:", v15);
LABEL_18:

        goto LABEL_7;
      }
    }
    if (!v6
      && !-[_SBUISystemApertureElementSourceAnimationContext hasTransientLocalResizeAction](self->_animationContext, "hasTransientLocalResizeAction"))
    {
      -[SBUISystemApertureElementSource localSceneResizeParameters](self, "localSceneResizeParameters");
      v14 = (SBUISystemApertureSceneAction *)objc_claimAutoreleasedReturnValue();
      +[SBUISystemApertureSceneResizeAction transientLocalResizeSceneActionWithAnimationParameters:](SBUISystemApertureSceneResizeAction, "transientLocalResizeSceneActionWithAnimationParameters:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUISystemApertureElementSource _handleSceneResizeAction:](self, "_handleSceneResizeAction:", v15);
      goto LABEL_18;
    }
  }
  else
  {
    -[_SBUISystemApertureElementSourceAnimationContext disableSkippingSceneResizeActions](self->_animationContext, "disableSkippingSceneResizeActions");
    v16[2]();
  }
  -[SBUISystemApertureElementSource setElementNeedsUpdate](self, "setElementNeedsUpdate");
LABEL_7:

}

- (void)setElementNeedsUpdateWithCoordinatedAnimations:(id)a3
{
  -[SBUISystemApertureElementSource setElementNeedsLayoutUpdateWithOptions:coordinatedAnimations:](self, "setElementNeedsLayoutUpdateWithOptions:coordinatedAnimations:", 0, a3);
}

- (void)_ensureElementViewControllerIsInAWindow
{
  void *v4;
  void *v5;
  SBUISystemApertureSecureWindow *v6;
  SBUISystemApertureElementSourceContainerViewController *v7;
  void *v8;
  SBUIDependencyGestureRecognizer *v9;
  SBUIDependencyGestureRecognizer *dependencyGestureRecognizer;
  SBUIDependencyGestureRecognizer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
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
  id v29;

  if (!-[SBUISystemApertureElementSource isPresentationPossible](self, "isPresentationPossible"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureElementSource.m"), 439, CFSTR("Should not call _ensureElementViewControllerIsInAWindow unless presentations are possible."));

  }
  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[SBUISystemApertureSecureWindow initWithWindowScene:]([SBUISystemApertureSecureWindow alloc], "initWithWindowScene:", v4);
    -[SBUISystemApertureElementSource setSystemApertureOwnedWindow:](self, "setSystemApertureOwnedWindow:", v6);
    v7 = objc_alloc_init(SBUISystemApertureElementSourceContainerViewController);
    -[SBUISystemApertureSecureWindow setRootViewController:](v6, "setRootViewController:", v7);
    -[SBUISystemApertureElementSourceContainerViewController setElementViewController:](v7, "setElementViewController:", v29);
    -[SBUISystemApertureSecureWindow setHidden:](v6, "setHidden:", 0);

  }
  objc_msgSend(v29, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_dependencyGestureRecognizer)
  {
    v9 = -[SBUIDependencyGestureRecognizer initWithTarget:action:]([SBUIDependencyGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleGestureDependencyChange_);
    dependencyGestureRecognizer = self->_dependencyGestureRecognizer;
    self->_dependencyGestureRecognizer = v9;

    v11 = self->_dependencyGestureRecognizer;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", NSClassFromString(CFSTR("MRUSlider")), 0);
    -[SBUIDependencyGestureRecognizer setObservedControlClasses:](v11, "setObservedControlClasses:", v12);

    -[SBUIDependencyGestureRecognizer setDelegate:](self->_dependencyGestureRecognizer, "setDelegate:", self);
    objc_msgSend(v8, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addGestureRecognizer:", self->_dependencyGestureRecognizer);

  }
  -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v8);

  if ((v16 & 1) == 0)
  {
    -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContainerViewController:", v8);

  }
  -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setElementViewController:", v19);

  objc_msgSend(v29, "viewIfLoaded");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v29;
  if (v21)
  {
    objc_msgSend(v29, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "windowScene");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isEqual:", v4) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureElementSource.m"), 464, CFSTR("Expected scene %@ for element view controller %@ but got %@"), v4, v29, v25);

    }
    v22 = v29;
  }
  objc_msgSend(v22, "viewIfLoaded");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setOverrideUserInterfaceStyle:", 2);

  objc_msgSend(v29, "setOverrideUserInterfaceStyle:", 2);
  -[SBUISystemApertureElementSource _updateTraitCollectionForElementIfNeeded](self, "_updateTraitCollectionForElementIfNeeded");

}

- (BOOL)_performElementUpdate
{
  return -[SBUISystemApertureElementSource _performElementUpdateWithActionsIfPossible:](self, "_performElementUpdateWithActionsIfPossible:", 0);
}

- (BOOL)_performElementUpdateWithActionsIfPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (!-[SBUISystemApertureElementSource isPresentationPossible](self, "isPresentationPossible"))
    goto LABEL_7;
  -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || -[SBUISystemApertureElementSource layoutMode](self, "layoutMode") == -1)
  {

    goto LABEL_7;
  }
  -[SBUISystemApertureElementSource _scene](self, "_scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v7 = -[SBUISystemApertureElementSource _performElementUpdateWithActions:](self, "_performElementUpdateWithActions:", v4);
LABEL_8:

  return v7;
}

- (BOOL)_performElementUpdateWithActions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  id *v39;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;

  v5 = a3;
  if (-[SBUISystemApertureElementSource layoutMode](self, "layoutMode") == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureElementSource.m"), 484, CFSTR("Performing an update when element is removed is not supported."));

  }
  -[SBUISystemApertureElementSource _scene](self, "_scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureElementSource.m"), 485, CFSTR("Performing an update when element doesn't have a scene is not supported."));

  }
  -[SBUISystemApertureElementSource _ensureElementViewControllerIsInAWindow](self, "_ensureElementViewControllerIsInAWindow");
  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "elementIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setElementIdentifier:", v9);

  }
  objc_msgSend(v8, "setContentRole:", objc_msgSend(v7, "contentRole"));
  objc_msgSend(v8, "setPreferredLayoutMode:", objc_msgSend(v7, "preferredLayoutMode"));
  objc_msgSend(v8, "setMaximumLayoutMode:", objc_msgSend(v7, "maximumLayoutMode"));
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v7, "minimumLayoutMode") > 1
     || (v10 = objc_msgSend(v7, "minimumLayoutMode"), v10 == objc_msgSend(v7, "maximumLayoutMode")))
    && objc_msgSend(v8, "contentRole") == 2)
  {
    v11 = objc_msgSend(v7, "minimumLayoutMode");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "leadingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 != 0;

    }
    else
    {
      v13 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "trailingView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;

    }
    else
    {
      v15 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "minimalView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 != 0;

    }
    else
    {
      v17 = 0;
    }
    if (v13 && v15 && objc_msgSend(v7, "maximumLayoutMode") >= 3)
    {
      if (objc_msgSend(v8, "contentRole") == 2 && v17)
        v11 = 2;
      else
        v11 = 3;
    }
    else if (v17 && objc_msgSend(v7, "maximumLayoutMode") == 2)
    {
      v11 = 2;
    }
    else
    {
      v11 = 4 * (objc_msgSend(v7, "maximumLayoutMode") == 4);
    }
  }
  objc_msgSend(v8, "setMinimumLayoutMode:", v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v7, "preventsInteractiveDismissal");
  else
    v18 = objc_msgSend(v8, "contentRole") == 2;
  objc_msgSend(v8, "setPreventsInteractiveDismissal:", v18);
  if (objc_msgSend(v8, "contentRole") == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    v19 = objc_msgSend(v7, "preventsAutomaticDismissal");
  else
    v19 = 0;
  objc_msgSend(v8, "setPreventsAutomaticDismissal:", v19);
  -[SBUISystemApertureElementSource _updateElementCanRequestAlertingAssertion](self, "_updateElementCanRequestAlertingAssertion");
  if (objc_msgSend(v8, "minimumLayoutMode") != 4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "leadingView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLeadingView:", v20);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "trailingView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTrailingView:", v21);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "minimalView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMinimalView:", v22);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "detachedMinimalView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDetachedMinimalView:", v23);

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "associatedScenePersistenceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssociatedScenePersistenceIdentifier:", v24);

  }
  else
  {
    objc_msgSend(v8, "setAssociatedScenePersistenceIdentifier:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setPresentationBehaviors:", objc_msgSend(v7, "presentationBehaviors"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "associatedAppBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssociatedAppBundleIdentifier:", v25);
  }
  else
  {
    if ((objc_msgSend(v8, "presentationBehaviors") & 0x1000) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "setAssociatedAppBundleIdentifier:", 0);
      goto LABEL_58;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssociatedAppBundleIdentifier:", v26);

  }
LABEL_58:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "launchURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(v8, "setLaunchURL:", v27);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "launchAction");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(v8, "setLaunchAction:", v28);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "backgroundActivitiesToSuppress");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_69;
    soft_STUIBackgroundActivityIdentifiersForStyleOverrides(objc_msgSend(v7, "statusBarStyleOverridesToSuppress"));
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v29;
  objc_msgSend(v8, "setBackgroundActivitiesToSuppress:", v29);

LABEL_69:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "setPreferredCustomLayout:", objc_msgSend(v7, "preferredCustomLayout"));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "preferredCustomAspectRatio");
    objc_msgSend(v8, "setPreferredCustomAspectRatio:");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "keyColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setKeyColor:", v31);

  }
  objc_msgSend(v8, "setHasMenuPresentation:", -[SBUISystemApertureElementSource elementHasMenuPresentation](self, "elementHasMenuPresentation"));
  objc_msgSend(v8, "setAppliedLayoutMode:", -[SBUISystemApertureElementSource layoutModeAsFarAsClientsAreConcerned](self, "layoutModeAsFarAsClientsAreConcerned"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v32 = objc_msgSend(v7, "attachedMinimalViewRequiresZeroPadding");
  else
    v32 = 0;
  objc_msgSend(v8, "setAttachedMinimalViewRequiresZeroPadding:", v32);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v33 = objc_msgSend(v7, "prefersFixedPortraitOrientation");
  else
    v33 = 0;
  objc_msgSend(v8, "setPrefersFixedPortraitOrientation:", v33);
  objc_msgSend(v8, "refreshViewSizingPreferences");
  -[SBUISystemApertureElementSource validateConfiguration](self, "validateConfiguration");
  objc_msgSend(v8, "otherSceneClientSettingsRepresentation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource lastKnownOtherSettings](self, "lastKnownOtherSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqual:", v34);

  if (!v36 || objc_msgSend(v5, "count"))
  {
    -[SBUISystemApertureElementSource setLastKnownOtherSettings:](self, "setLastKnownOtherSettings:", v34);
    v37 = objc_msgSend(v5, "count");
    -[SBUISystemApertureElementSource _FBSScene](self, "_FBSScene");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __68__SBUISystemApertureElementSource__performElementUpdateWithActions___block_invoke;
      v45[3] = &unk_1E4C40400;
      v39 = &v46;
      v46 = v34;
      v47 = v5;
      objc_msgSend(v38, "updateClientSettingsWithTransitionBlock:", v45);

      v38 = v47;
    }
    else
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __68__SBUISystemApertureElementSource__performElementUpdateWithActions___block_invoke_2;
      v43[3] = &unk_1E4C40428;
      v39 = &v44;
      v44 = v34;
      objc_msgSend(v38, "updateClientSettingsWithBlock:", v43);
    }

  }
  return v36 ^ 1;
}

id __68__SBUISystemApertureElementSource__performElementUpdateWithActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a2, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "applySettings:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActions:", *(_QWORD *)(a1 + 40));
  return v8;
}

void __68__SBUISystemApertureElementSource__performElementUpdateWithActions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "applySettings:", *(_QWORD *)(a1 + 32));
}

- (void)_handleGestureDependencyChange:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[SBUISystemApertureElementSource _sendActionForCommand:](self, "_sendActionForCommand:", 5);
}

- (CGRect)anchorFrameForLeadingView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBUISystemApertureElementSource _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_resolvedLeadingViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)anchorFrameForTrailingView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBUISystemApertureElementSource _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_resolvedTrailingViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)anchorFrameForMinimalView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBUISystemApertureElementSource _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_resolvedMinimalViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)anchorFrameForDetachedMinimalView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBUISystemApertureElementSource _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_resolvedDetachedMinimalViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_setScene:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = objc_opt_class();
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[SBUISystemApertureElementSource setWindowScene:](self, "setWindowScene:", v7);
  +[SBUISystemApertureElementSource _addSource:](SBUISystemApertureElementSource, "_addSource:", self);

}

- (void)_sceneWillInvalidate:(id)a3
{
  BSDispatchMain();
}

void __56__SBUISystemApertureElementSource__sceneWillInvalidate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "performPendingCoordinatedAnimations");
  objc_msgSend(*(id *)(a1 + 32), "systemApertureElementViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeLayoutMode");

  if (v3 != -1)
  {
    objc_msgSend(*(id *)(a1 + 32), "systemApertureElementViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActiveLayoutMode:", -1);

  }
  +[SBUISystemApertureElementSource _removeSource:](SBUISystemApertureElementSource, "_removeSource:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (id)_settingsDiffActionsForScene:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
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
  BOOL v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  int64_t v44;
  void *v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  BOOL v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  objc_msgSend(a4, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "SBUI_systemApertureDescriptionOfDiffFromSettings:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    SBLogSystemApertureHosting();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[SBUISystemApertureElementSource succinctDescription](self, "succinctDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v16;
      v61 = 2114;
      v62 = v14;
      _os_log_impl(&dword_1A471F000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ received scene settings update with changes: %{public}@", buf, 0x16u);

    }
  }
  v17 = -[SBUISystemApertureElementSource layoutMode](self, "layoutMode");
  v18 = objc_msgSend(v11, "SBUISA_layoutMode");
  if (v18 != -[SBUISystemApertureElementSource layoutMode](self, "layoutMode"))
    -[_SBUISystemApertureElementSourceAnimationContext disableSkippingSceneResizeActions](self->_animationContext, "disableSkippingSceneResizeActions");
  -[SBUISystemApertureElementSource setPresentationPossible:](self, "setPresentationPossible:", (unint64_t)(v17 - 1) < 0xFFFFFFFFFFFFFFFELL);
  objc_msgSend(v12, "actions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bs_firstObjectPassingTest:", &__block_literal_global_122);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "actions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bs_filter:", &__block_literal_global_123);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "actions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bs_firstObjectPassingTest:", &__block_literal_global_124);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v22;
  if (!v20 && !objc_msgSend(v22, "count") && !v24)
  {
    -[SBUISystemApertureElementSource windowScene](self, "windowScene");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v12, "actions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  if (v20)
    objc_msgSend(v26, "removeObject:", v20);
  if (objc_msgSend(v22, "count"))
    objc_msgSend(v26, "minusSet:", v22);
  if (v24)
    objc_msgSend(v26, "removeObject:", v24);
  objc_msgSend(v12, "setActions:", v26);
  v49 = v20;
  v50 = v14;
  v48 = v24;
  v45 = v26;
  if (!v20)
    goto LABEL_17;
  if (objc_msgSend(v20, "isTransientLocal", v26))
  {
    objc_msgSend(v20, "animationParameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureElementSource setLocalSceneResizeParameters:](self, "setLocalSceneResizeParameters:", v27);

LABEL_17:
    v47 = 0;
    goto LABEL_22;
  }
  v47 = -[SBUISystemApertureElementSource _handleSceneResizeAction:](self, "_handleSceneResizeAction:", v20);
LABEL_22:
  -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement", v45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v31 = v22;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v55 != v34)
          objc_enumerationMutation(v31);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "command"))
        {
          case 11:
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v30, "handleCustomViewLongPressEvent");
            break;
          case 12:
            -[SBUISystemApertureElementSource setElementCanRequestAlertingAssertion:](self, "setElementCanRequestAlertingAssertion:", 1);
            -[SBUISystemApertureElementSource _updateElementCanRequestAlertingAssertion](self, "_updateElementCanRequestAlertingAssertion");
            break;
          case 13:
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v30, "handleCompactOrMinimalViewTapEvent");
            break;
          case 14:
            -[SBUISystemApertureElementSource _handleClientErrorNonUniqueElementAction](self, "_handleClientErrorNonUniqueElementAction");
            break;
          default:
            continue;
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v33);
  }

  v24 = v48;
  if (v48)
    -[SBUISystemApertureElementSource _handleAlertingAction:](self, "_handleAlertingAction:", v48);

  -[SBUISystemApertureElementSource windowScene](self, "windowScene");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v49;
  v14 = v50;
  if (v49)
  {
    v29 = v47;
    if (!objc_msgSend(v49, "isTransientLocal"))
      goto LABEL_45;
  }
  else
  {
    v29 = v47;
  }
LABEL_42:
  if (-[SBUISystemApertureElementSource layoutMode](self, "layoutMode") == 1)
  {
    v36 = v24;
    -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "activeLayoutMode");

    if (!v38)
    {
      -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "loadViewIfNeeded");

      -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v36;
      goto LABEL_53;
    }
    v24 = v36;
  }
LABEL_45:
  if (-[SBUISystemApertureElementSource layoutMode](self, "layoutMode") == 1)
  {
    -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "activeLayoutMode") == 1)
    {
LABEL_54:

      goto LABEL_55;
    }
    if (objc_msgSend(v28, "activationState") == 2)
    {

    }
    else
    {
      v41 = v24;
      v42 = objc_msgSend(v28, "activationState");

      v43 = v42 == -1;
      v24 = v41;
      if (!v43)
        goto LABEL_55;
    }
    -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_53:
    objc_msgSend(v39, "setActiveLayoutMode:", 1);
    goto LABEL_54;
  }
LABEL_55:
  v44 = -[SBUISystemApertureElementSource layoutMode](self, "layoutMode");
  if ((v44 == 2) == (objc_msgSend(v11, "SBUISA_layoutMode") != 2) && !v29)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_4;
    v52[3] = &unk_1E4C3E430;
    v52[4] = self;
    v53 = v44 == 2;
    objc_msgSend(MEMORY[0x1E0CEABB0], "SBUISA_performWithoutAnimationOrRetargeting:", v52);
  }

}

uint64_t __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detachedMinimalView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHidden:", *(_BYTE *)(a1 + 40) == 0);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v4, "setHidden:", 0);

}

- (void)addTransitionContext:(id)a3
{
  id v4;
  NSMutableArray *transitionContexts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  transitionContexts = self->_transitionContexts;
  v8 = v4;
  if (!transitionContexts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_transitionContexts;
    self->_transitionContexts = v6;

    v4 = v8;
    transitionContexts = self->_transitionContexts;
  }
  -[NSMutableArray addObject:](transitionContexts, "addObject:", v4);
  -[SBUISystemApertureElementSource setLayoutModeAsFarAsClientsAreConcerned:](self, "setLayoutModeAsFarAsClientsAreConcerned:", objc_msgSend(v8, "fromLayoutMode"));

}

- (void)removeTransitionContext:(id)a3
{
  NSMutableArray *transitionContexts;

  -[NSMutableArray removeObject:](self->_transitionContexts, "removeObject:", a3);
  -[SBUISystemApertureElementSource setLayoutModeAsFarAsClientsAreConcerned:](self, "setLayoutModeAsFarAsClientsAreConcerned:", -[SBUISystemApertureElementSource layoutMode](self, "layoutMode"));
  if (!-[NSMutableArray count](self->_transitionContexts, "count"))
  {
    transitionContexts = self->_transitionContexts;
    self->_transitionContexts = 0;

  }
}

- (SBUISystemApertureElementTransitionContext)transitionContext
{
  return (SBUISystemApertureElementTransitionContext *)-[NSMutableArray lastObject](self->_transitionContexts, "lastObject");
}

- (BOOL)_elementRequiresConstraintBasedLayout
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (!objc_msgSend(v4, "translatesAutoresizingMaskIntoConstraints")
     || objc_msgSend((id)objc_opt_class(), "requiresConstraintBasedLayout"))
    && -[SBUISystemApertureElementSource _elementSupportsDynamicResizing](self, "_elementSupportsDynamicResizing");

  return v5;
}

- (BOOL)_elementSupportsDynamicResizing
{
  void *v2;
  char v3;

  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_elementIsInAWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SBUISystemApertureElementSource containerViewController](self, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureElementSource _elementViewController](self, "_elementViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "_isInAWindow"))
    v7 = objc_msgSend(v6, "isDescendantOfView:", v4);
  else
    v7 = 0;

  return v7;
}

- (void)_activateConstraintsForActiveLayoutModeIfNeeded:(int64_t)a3
{
  id v5;

  if (-[SBUISystemApertureElementSource isPresentationPossible](self, "isPresentationPossible")
    && -[SBUISystemApertureElementSource _elementIsInAWindow](self, "_elementIsInAWindow")
    && -[SBUISystemApertureElementSource _elementRequiresConstraintBasedLayout](self, "_elementRequiresConstraintBasedLayout")&& -[SBUISystemApertureElementSource _elementSupportsDynamicResizing](self, "_elementSupportsDynamicResizing"))
  {
    -[SBUISystemApertureElementSource _activateConstraintsForLayoutMode:](self, "_activateConstraintsForLayoutMode:", a3);
  }
  else
  {
    -[SBUISystemApertureElementSource _activeConstraintsForLayoutMode](self, "_activeConstraintsForLayoutMode");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureElementSource set_activeConstraintsForLayoutMode:](self, "set_activeConstraintsForLayoutMode:", 0);
    if (objc_msgSend(v5, "count"))
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v5);

  }
}

- (void)_activateConstraintsForLayoutMode:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *maximumLeadingViewWidthConstraint;
  NSLayoutConstraint *maximumTrailingViewWidthConstraint;
  void *v14;
  id v15;

  -[SBUISystemApertureElementSource _constraintsForLayoutMode:](self, "_constraintsForLayoutMode:", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource _activeConstraintsForLayoutMode](self, "_activeConstraintsForLayoutMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v15, "isEqualToArray:", v4);

  if ((v5 & 1) == 0)
  {
    -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureElementSource _ensureElementViewControllerIsInAWindow](self, "_ensureElementViewControllerIsInAWindow");
    objc_msgSend(v6, "minimalView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "detachedMinimalView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v6, "leadingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_msgSend(v7, "isDescendantOfView:", v11) & 1) == 0)
      objc_msgSend(v11, "addSubview:", v7);
    if (v8 && (objc_msgSend(v8, "isDescendantOfView:", v11) & 1) == 0)
      objc_msgSend(v11, "addSubview:", v8);
    if (v9 && (objc_msgSend(v9, "isDescendantOfView:", v11) & 1) == 0)
      objc_msgSend(v11, "addSubview:", v9);
    if (v10 && (objc_msgSend(v10, "isDescendantOfView:", v11) & 1) == 0)
      objc_msgSend(v11, "addSubview:", v10);
    maximumLeadingViewWidthConstraint = self->__maximumLeadingViewWidthConstraint;
    objc_msgSend(v9, "SBUISA_maximumAccessoryViewWidth");
    -[NSLayoutConstraint setConstant:](maximumLeadingViewWidthConstraint, "setConstant:");
    maximumTrailingViewWidthConstraint = self->__maximumTrailingViewWidthConstraint;
    objc_msgSend(v10, "SBUISA_maximumAccessoryViewWidth");
    -[NSLayoutConstraint setConstant:](maximumTrailingViewWidthConstraint, "setConstant:");
    -[SBUISystemApertureElementSource _activeConstraintsForLayoutMode](self, "_activeConstraintsForLayoutMode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureElementSource set_activeConstraintsForLayoutMode:](self, "set_activeConstraintsForLayoutMode:", 0);
    if (objc_msgSend(v14, "count"))
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v14);
    if (objc_msgSend(v15, "count"))
    {
      -[SBUISystemApertureElementSource set_activeConstraintsForLayoutMode:](self, "set_activeConstraintsForLayoutMode:", v15);
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
    }

  }
}

- (id)_constraintsForLayoutMode:(int64_t)a3
{
  SBUISystemApertureElementSource *v4;
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
  NSMutableDictionary *constraintsByLayoutMode;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableDictionary *v42;
  uint64_t v43;
  NSMutableDictionary *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v52;
  uint64_t v53;
  NSLayoutConstraint *maximumLeadingViewWidthConstraint;
  void *v55;
  uint64_t v56;
  NSLayoutConstraint *maximumTrailingViewWidthConstraint;
  NSLayoutConstraint *v58;
  void *v59;
  NSLayoutConstraint *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  SBUISystemApertureElementSource *v137;
  void *v138;
  void *v139;
  int64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  _QWORD v148[11];
  _QWORD v149[4];
  _QWORD v150[4];
  _QWORD v151[2];
  _QWORD v152[14];

  v4 = self;
  v152[12] = *MEMORY[0x1E0C80C00];
  -[SBUISystemApertureElementSource _elementViewController](self, "_elementViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureElementSource containerViewController](v4, "containerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureElementSource mutableConfiguration](v4, "mutableConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureElementSource mutableConfiguration](v4, "mutableConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minimalView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureElementSource mutableConfiguration](v4, "mutableConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "detachedMinimalView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureElementSource mutableConfiguration](v4, "mutableConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "SBUISA_systemApertureMinimumContentSizeLayoutGuide");
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "SBUISA_systemApertureMaximumContentSizeLayoutGuide");
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  constraintsByLayoutMode = v4->_constraintsByLayoutMode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](constraintsByLayoutMode, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    goto LABEL_8;
  v136 = v16;
  v137 = v4;
  v138 = v14;
  v139 = v10;
  v142 = v12;
  v143 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "centerXAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:", v127);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v123;
  objc_msgSend(v6, "topAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v8;
  objc_msgSend(v8, "topAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v119);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v152[1] = v117;
  objc_msgSend(v6, "widthAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "widthAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:", v113);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1.0;
  objc_msgSend(v111, "SBUISA_withPriority:", v22);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v152[2] = v109;
  objc_msgSend(v6, "heightAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "heightAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "constraintEqualToAnchor:", v105);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 1.0;
  objc_msgSend(v103, "SBUISA_withPriority:", v23);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v152[3] = v101;
  objc_msgSend(v6, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintLessThanOrEqualToAnchor:", v97);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v152[4] = v95;
  objc_msgSend(v6, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintLessThanOrEqualToAnchor:", v91);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v152[5] = v90;
  objc_msgSend(v6, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "bottomAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintGreaterThanOrEqualToAnchor:", v88);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v152[6] = v87;
  objc_msgSend(v6, "trailingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "trailingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintGreaterThanOrEqualToAnchor:", v85);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v152[7] = v84;
  objc_msgSend(v6, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintGreaterThanOrEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v152[8] = v81;
  objc_msgSend(v6, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v152[9] = v26;
  objc_msgSend(v6, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28);
  v140 = a3;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v152[10] = v29;
  objc_msgSend(v6, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v31);
  v141 = v6;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v152[11] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "arrayWithArray:", v33);
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v140;
  if ((unint64_t)(v140 + 1) >= 3)
  {
    if (v140 == 2)
    {
      v6 = v141;
      v12 = v142;
      if (v142)
      {
        objc_msgSend(v142, "centerXAnchor");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "centerXAnchor");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "constraintEqualToAnchor:", v129);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v150[0] = v125;
        objc_msgSend(v142, "centerYAnchor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "centerYAnchor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "constraintEqualToAnchor:", v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v150[1] = v67;
        objc_msgSend(v142, "leadingAnchor");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "leadingAnchor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "constraintGreaterThanOrEqualToAnchor:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v150[2] = v70;
        objc_msgSend(v142, "topAnchor");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "topAnchor");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v150[3] = v73;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 4);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "addObjectsFromArray:", v74);

        v34 = v140;
        v6 = v141;

        v12 = v142;
      }
      v14 = v138;
      v10 = v139;
      if (!v138 || v138 == v12)
        goto LABEL_5;
      objc_msgSend(v138, "centerXAnchor");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "centerXAnchor");
      v126 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "constraintEqualToAnchor:", v126);
      v130 = objc_claimAutoreleasedReturnValue();
      v149[0] = v130;
      objc_msgSend(v138, "centerYAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "centerYAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v149[1] = v40;
      objc_msgSend(v138, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "leadingAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v149[2] = v76;
      objc_msgSend(v138, "topAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v149[3] = v79;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 4);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "addObjectsFromArray:", v80);

      v34 = v140;
      v6 = v141;

      v37 = (void *)v130;
      v36 = (void *)v126;

      v35 = v134;
    }
    else
    {
      v6 = v141;
      v12 = v142;
      v14 = v138;
      v10 = v139;
      if (v140 != 3 || !v139)
        goto LABEL_5;
      objc_msgSend(v139, "widthAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "SBUISA_maximumAccessoryViewWidth");
      objc_msgSend(v52, "constraintLessThanOrEqualToConstant:");
      v53 = objc_claimAutoreleasedReturnValue();
      maximumLeadingViewWidthConstraint = v137->__maximumLeadingViewWidthConstraint;
      v137->__maximumLeadingViewWidthConstraint = (NSLayoutConstraint *)v53;

      objc_msgSend(v136, "widthAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "SBUISA_maximumAccessoryViewWidth");
      objc_msgSend(v55, "constraintLessThanOrEqualToConstant:");
      v56 = objc_claimAutoreleasedReturnValue();
      maximumTrailingViewWidthConstraint = v137->__maximumTrailingViewWidthConstraint;
      v137->__maximumTrailingViewWidthConstraint = (NSLayoutConstraint *)v56;

      objc_msgSend(v139, "leadingAnchor");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "leadingAnchor");
      v124 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "constraintGreaterThanOrEqualToAnchor:", v124);
      v128 = objc_claimAutoreleasedReturnValue();
      v148[0] = v128;
      objc_msgSend(v139, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "topAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v148[1] = v40;
      objc_msgSend(v139, "centerYAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "centerYAnchor");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v122);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v148[2] = v120;
      objc_msgSend(v139, "trailingAnchor");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "leadingAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "constraintLessThanOrEqualToAnchor:", v116);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v137->__maximumLeadingViewWidthConstraint;
      v148[3] = v114;
      v148[4] = v58;
      objc_msgSend(v136, "leadingAnchor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "trailingAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "constraintGreaterThanOrEqualToAnchor:", v110);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v148[5] = v108;
      objc_msgSend(v136, "topAnchor");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "topAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "constraintGreaterThanOrEqualToAnchor:", v104);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v148[6] = v102;
      objc_msgSend(v136, "centerYAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "centerYAnchor");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "constraintEqualToAnchor:", v98);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v148[7] = v96;
      objc_msgSend(v136, "trailingAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "trailingAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "constraintLessThanOrEqualToAnchor:", v92);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v137->__maximumTrailingViewWidthConstraint;
      v148[8] = v59;
      v148[9] = v60;
      objc_msgSend(v141, "heightAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "heightAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v148[10] = v63;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 11);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "addObjectsFromArray:", v64);

      v36 = (void *)v124;
      v6 = v141;

      v37 = (void *)v128;
      v35 = v132;

      v34 = v140;
    }
  }
  else
  {
    v6 = v141;
    objc_msgSend(v141, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v151[0] = v37;
    objc_msgSend(v141, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "heightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v151[1] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "addObjectsFromArray:", v41);
  }

  v14 = v138;
  v10 = v139;
  v12 = v142;
LABEL_5:
  v21 = (void *)objc_msgSend(v144, "copy");
  v4 = v137;
  v42 = v137->_constraintsByLayoutMode;
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v137->_constraintsByLayoutMode;
    v137->_constraintsByLayoutMode = (NSMutableDictionary *)v43;

    v42 = v137->_constraintsByLayoutMode;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v34);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v21, v45);

  v8 = v135;
  v16 = v136;
LABEL_8:
  -[SBUISystemApertureElementSource windowScene](v4, "windowScene");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    v48 = objc_msgSend(v46, "activationState");
    v46 = v21;
    v49 = v147;
    if (v48)
    {
      if (objc_msgSend(v47, "activationState") == 1)
        v46 = v21;
      else
        v46 = 0;
    }
  }
  else
  {
    v49 = v147;
  }
  v50 = v46;

  return v50;
}

- (BOOL)_wantsCenteredCustomLayout
{
  void *v3;
  char v4;
  void *v5;
  BOOL v6;

  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preferredCustomLayout") == 4;

  return v6;
}

- (BOOL)_handleSceneResizeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _BOOL4 v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _BOOL4 v51;
  double v52;
  NSObject *v53;
  void *v54;
  _BOOL4 v55;
  int v57;
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  _BOOL4 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SBUISystemApertureElementSourceAnimationContext addSceneResizeAction:](self->_animationContext, "addSceneResizeAction:", v4);
  if (-[SBUISystemApertureElementSource isPresentationPossible](self, "isPresentationPossible"))
    -[SBUISystemApertureElementSource _ensureElementViewControllerIsInAWindow](self, "_ensureElementViewControllerIsInAWindow");
  -[SBUISystemApertureElementSource _sceneSettings](self, "_sceneSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "frame");
  UISizeRoundToScale();
  v9 = v8;
  v11 = v10;
  objc_msgSend(v5, "SBUISA_containerViewFrame");
  UISizeRoundToScale();
  v14 = v11 == v13 && v9 == v12;
  objc_msgSend(v4, "animationParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource localSceneResizeParameters](self, "localSceneResizeParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[SBUISystemApertureAnimationParameters areParams:equivalentTo:](SBUISystemApertureAnimationParameters, "areParams:equivalentTo:", v15, v16);

  if ((objc_msgSend(v4, "isTransientLocal") & 1) != 0
    || !-[_SBUISystemApertureElementSourceAnimationContext canSkipRemoteSceneResizeActions](self->_animationContext, "canSkipRemoteSceneResizeActions"))
  {
    v31 = 1;
  }
  else
  {
    v18 = v14 && v17;
    -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "minimalView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "detachedMinimalView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == 1)
    {
      v24 = -[SBUISystemApertureElementSource layoutMode](self, "layoutMode");
      if (v24 == 3)
      {
        objc_msgSend(v22, "frame");
        v40 = v39;
        v42 = v41;
        objc_msgSend(v5, "SBUISA_resolvedLeadingViewFrame");
        v45 = v42 == v44 && v40 == v43;
        objc_msgSend(v23, "frame");
        v47 = v46;
        v49 = v48;
        objc_msgSend(v5, "SBUISA_resolvedTrailingViewFrame");
        v51 = v47 == v50;
        if (v49 != v52)
          v51 = 0;
        v31 = !v45 || !v51;
      }
      else if (v24 == 2)
      {
        objc_msgSend(v20, "frame");
        v26 = v25;
        v28 = v27;
        objc_msgSend(v5, "SBUISA_resolvedMinimalViewFrame");
        v31 = v28 != v30 || v26 != v29;
        if (v21)
        {
          objc_msgSend(v21, "frame");
          v33 = v32;
          v35 = v34;
          objc_msgSend(v5, "SBUISA_resolvedDetachedMinimalViewFrame");
          v37 = v33 != v36;
          if (v35 != v38)
            v37 = 1;
          v31 |= v37;
        }
      }
      else
      {
        v31 = 0;
      }
    }
    else
    {
      v31 = 1;
    }

  }
  if ((objc_msgSend(v4, "isTransientLocal") & 1) == 0)
  {
    SBLogSystemApertureHosting();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      -[SBUISystemApertureElementSource succinctDescription](self, "succinctDescription");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[_SBUISystemApertureElementSourceAnimationContext canSkipRemoteSceneResizeActions](self->_animationContext, "canSkipRemoteSceneResizeActions");
      v57 = 138412802;
      v58 = v54;
      v59 = 1024;
      v60 = v31;
      v61 = 1024;
      v62 = v55;
      _os_log_impl(&dword_1A471F000, v53, OS_LOG_TYPE_DEFAULT, "Handling remote resize action for %@ will animate %{BOOL}u animationContext allows skipping: %{BOOL}u", (uint8_t *)&v57, 0x18u);

    }
  }
  if (v31)
    -[SBUISystemApertureElementSource _animateWithSceneResizeAction:](self, "_animateWithSceneResizeAction:", v4);
  else
    -[_SBUISystemApertureElementSourceAnimationContext removeSceneResizeAction:](self->_animationContext, "removeSceneResizeAction:", v4);

  return v31;
}

- (void)_animateWithSceneResizeAction:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  SBUISystemApertureElementSourceAnimator *v13;
  void *v14;
  void *v15;
  SBUISystemApertureElementSourceAnimator *v16;
  void *v17;
  void *v18;
  SBUISystemApertureElementTransitionContext *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  SBUISystemApertureElementTransitionContext *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  BOOL v45;
  id v46;
  BOOL v47;
  _QWORD v48[5];
  id v49;
  id v50;
  BOOL v51;
  _QWORD v52[5];
  SBUISystemApertureElementTransitionContext *v53;
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  _QWORD v66[4];
  id v67;
  SBUISystemApertureElementSource *v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint8_t buf[4];
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBUISystemApertureElementSource _sceneSettings](self, "_sceneSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBUISystemApertureElementSource _elementSupportsDynamicResizing](self, "_elementSupportsDynamicResizing");
  v45 = -[SBUISystemApertureElementSource _elementRequiresConstraintBasedLayout](self, "_elementRequiresConstraintBasedLayout");
  -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v6;
  objc_msgSend(v7, "setShouldDeferViewSizingPreferenceUpdates:", v6);

  -[SBUISystemApertureElementSource layoutGuideRootView](self, "layoutGuideRootView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isTransientLocal"))
  {
    SBLogSystemApertureHosting();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[SBUISystemApertureElementSource succinctDescription](self, "succinctDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v79 = v12;
      _os_log_impl(&dword_1A471F000, v11, OS_LOG_TYPE_DEFAULT, "Performing transient local action for %@", buf, 0xCu);

    }
  }
  v13 = [SBUISystemApertureElementSourceAnimator alloc];
  objc_msgSend(v4, "animationParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v41 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBUISystemApertureElementSourceAnimator initWithSettings:window:](v13, "initWithSettings:window:", v14, v15);

  v44 = objc_alloc_init(MEMORY[0x1E0CEAF60]);
  objc_msgSend(v44, "_setAnimator:", v16);
  objc_msgSend(v4, "animationParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_setIsAnimated:", objc_msgSend(v17, "isAnimated"));

  objc_msgSend(v44, "_transitionCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(SBUISystemApertureElementTransitionContext);
  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementTransitionContext setTransitionCoordinator:](v19, "setTransitionCoordinator:", v18);
  -[SBUISystemApertureElementTransitionContext setFromLayoutMode:](v19, "setFromLayoutMode:", -[SBUISystemApertureElementSource layoutModeAsFarAsClientsAreConcerned](self, "layoutModeAsFarAsClientsAreConcerned"));
  -[SBUISystemApertureElementTransitionContext setUserInitiated:](v19, "setUserInitiated:", objc_msgSend(v4, "isUserInitiated"));
  -[SBUISystemApertureElementSource addTransitionContext:](self, "addTransitionContext:", v19);
  objc_msgSend(v5, "SBUISA_containerViewFrame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = objc_msgSend(v5, "SBUISA_layoutMode");
  v40 = v4;
  v30 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke;
  v66[3] = &unk_1E4C404D0;
  v72 = v29;
  v31 = v20;
  v67 = v31;
  v68 = self;
  v69 = v5;
  v32 = v8;
  v77 = v47;
  v70 = v32;
  v71 = v18;
  v73 = v22;
  v74 = v24;
  v75 = v26;
  v76 = v28;
  v43 = v18;
  v42 = v5;
  -[SBUISystemApertureElementSourceAnimator addPreflightAction:](v16, "addPreflightAction:", v66);
  v56[0] = v30;
  v56[1] = 3221225472;
  v56[2] = __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_2;
  v56[3] = &unk_1E4C404F8;
  v65 = v45;
  v56[4] = self;
  v60 = v22;
  v61 = v24;
  v62 = v26;
  v63 = v28;
  v33 = v31;
  v57 = v33;
  v58 = v41;
  v64 = v29;
  v34 = v32;
  v59 = v34;
  v46 = v41;
  -[SBUISystemApertureElementSourceAnimator addPreAlongsideAnimation:](v16, "addPreAlongsideAnimation:", v56);
  v52[0] = v30;
  v52[1] = 3221225472;
  v52[2] = __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_3;
  v52[3] = &unk_1E4C40520;
  v52[4] = self;
  v53 = v19;
  v54 = v33;
  v35 = v40;
  v55 = v35;
  v36 = v33;
  v37 = v19;
  -[SBUISystemApertureElementSourceAnimator addPostflightAction:](v16, "addPostflightAction:", v52);
  -[SBUISystemApertureElementSource _ensureAccessoryViewLayoutForTransitionWithAnimator:](self, "_ensureAccessoryViewLayoutForTransitionWithAnimator:", v16);
  v48[0] = v30;
  v48[1] = 3221225472;
  v48[2] = __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_4;
  v48[3] = &unk_1E4C40548;
  v51 = v47;
  v48[4] = self;
  v49 = v34;
  v50 = v35;
  v38 = v35;
  v39 = v34;
  -[SBUISystemApertureElementSourceAnimator addPostAlongsideAnimation:](v16, "addPostAlongsideAnimation:", v48);
  -[SBUISystemApertureElementSourceAnimator animateTransition:](v16, "animateTransition:", v44);

}

void __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  if (*(uint64_t *)(a1 + 72) >= 2 && objc_msgSend(*(id *)(a1 + 32), "bs_isDisappearingOrDisappeared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "beginAppearanceTransition:animated:", 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
  }
  objc_msgSend(*(id *)(a1 + 40), "systemApertureElementViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveLayoutMode:", *(_QWORD *)(a1 + 72));

  objc_msgSend(*(id *)(a1 + 40), "systemApertureElementViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_msgSend(*(id *)(a1 + 48), "SBUISA_minimalViewLayoutAxis");
    objc_msgSend(*(id *)(a1 + 40), "systemApertureElementViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "minimalViewLayoutAxis");

    if (v5 != v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "systemApertureElementViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMinimalViewLayoutAxis:", objc_msgSend(*(id *)(a1 + 48), "SBUISA_minimalViewLayoutAxis"));

    }
  }
  if (+[SBUISystemApertureLayoutGuide prepareLayoutGuidesForViewControllerIfNeeded:onlyIfEmpty:](SBUISystemApertureLayoutGuide, "prepareLayoutGuidesForViewControllerIfNeeded:onlyIfEmpty:", *(_QWORD *)(a1 + 32), 1))
  {
    objc_msgSend(*(id *)(a1 + 56), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 56), "layoutIfNeeded");
  }
  v9 = *(unsigned __int8 *)(a1 + 112);
  objc_msgSend(*(id *)(a1 + 40), "systemApertureElementViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    objc_msgSend(v10, "viewWillLayoutSubviewsWithTransitionCoordinator:", *(_QWORD *)(a1 + 64));
  else
    objc_msgSend(v10, "viewWillTransitionToSize:withTransitionCoordinator:", *(_QWORD *)(a1 + 64), *(double *)(a1 + 96), *(double *)(a1 + 104));

}

uint64_t __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL4 v4;
  BOOL v5;
  uint64_t result;
  double v7;
  CGFloat v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double MinX;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  if (!*(_BYTE *)(a1 + 104))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_elementSupportsDynamicResizing")
      && objc_msgSend(*(id *)(a1 + 32), "layoutMode") == 4
      && (objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          v3 = objc_msgSend(v2, "preferredCustomLayout"),
          v2,
          !v3))
    {
      v8 = *(double *)(a1 + 64);
      v7 = *(double *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredContentSizeClampedToMaximumExpandedSize");
      v11 = v10;
      v13 = v12;

      objc_msgSend(*(id *)(a1 + 40), "parentViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "SBUISA_systemApertureObstructedAreaLayoutGuide");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layoutFrame");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

      v28.origin.x = v8;
      v28.origin.y = v7;
      v28.size.width = v11;
      v25 = v11;
      v28.size.height = v13;
      CGRectGetWidth(v28);
      v29.origin.x = v18;
      v29.origin.y = v20;
      v29.size.width = v22;
      v29.size.height = v24;
      CGRectGetWidth(v29);
      v30.origin.x = v18;
      v30.origin.y = v20;
      v30.size.width = v22;
      v30.size.height = v24;
      MinX = CGRectGetMinX(v30);
      UIRoundToScale();
      objc_msgSend(*(id *)(a1 + 48), "setFrame:", MinX - v27, v7, v25, v13);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_activateConstraintsForActiveLayoutModeIfNeeded:", *(_QWORD *)(a1 + 96));
  v4 = +[SBUISystemApertureLayoutGuide prepareLayoutGuidesForViewControllerIfNeeded:onlyIfEmpty:](SBUISystemApertureLayoutGuide, "prepareLayoutGuidesForViewControllerIfNeeded:onlyIfEmpty:", *(_QWORD *)(a1 + 40), 0);
  if (*(_BYTE *)(a1 + 104))
    v5 = !v4;
  else
    v5 = 1;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 56), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 56), "layoutIfNeeded");
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_elementSupportsDynamicResizing");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateTraitCollectionForElementIfNeeded");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "performPendingCoordinatedAnimations");
  }
  return result;
}

uint64_t __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_3(uint64_t a1, int a2)
{
  void *v4;
  uint64_t result;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "removeTransitionContext:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v4, "_performElementUpdate");
    result = objc_msgSend(*(id *)(a1 + 32), "layoutMode");
    if (result <= 1)
    {
      result = objc_msgSend(*(id *)(a1 + 48), "bs_isAppearingOrAppeared");
      if ((_DWORD)result)
      {
        objc_msgSend(*(id *)(a1 + 48), "beginAppearanceTransition:animated:", 0, 0);
        return objc_msgSend(*(id *)(a1 + 48), "endAppearanceTransition");
      }
    }
  }
  else
  {
    objc_msgSend(v4, "mutableConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldDeferViewSizingPreferenceUpdates:", 0);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeSceneResizeAction:", *(_QWORD *)(a1 + 56));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "disableSkippingSceneResizeActions");
  }
  return result;
}

uint64_t __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
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
  int v17;
  uint64_t result;
  NSObject *v19;
  void *v20;
  void *v21;
  _DWORD v22[2];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldDeferViewSizingPreferenceUpdates:", 0);

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minimalView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "detachedMinimalView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "elementViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "elementViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateConstraintsIfNeeded");

    objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeSceneResizeAction:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "performPendingCoordinatedAnimations");
    v17 = objc_msgSend(*(id *)(a1 + 32), "_performElementUpdate");
    result = objc_msgSend(*(id *)(a1 + 48), "isTransientLocal");
    if ((_DWORD)result)
    {
      SBLogSystemApertureHosting();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = 67109378;
        v22[1] = v17;
        v23 = 2112;
        v24 = v20;
        _os_log_impl(&dword_1A471F000, v19, OS_LOG_TYPE_DEFAULT, "didUpdate %{BOOL}u for transient local action for %@", (uint8_t *)v22, 0x12u);

      }
      v21 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
      if (v17)
        return objc_msgSend(v21, "noteIsExpectingRemoteSceneResizeAction");
      else
        return objc_msgSend(v21, "disableSkippingSceneResizeActions");
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
    return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  }
  return result;
}

- (void)_ensureAccessoryViewLayoutForTransitionWithAnimator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  SBUISystemApertureElementSource *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;

  v4 = a3;
  -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "minimalView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detachedMinimalView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "effectiveUserInterfaceLayoutDirection"))
    objc_msgSend(v5, "leadingView");
  else
    objc_msgSend(v5, "trailingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBUISystemApertureElementSource _elementSupportsDynamicResizing](self, "_elementSupportsDynamicResizing");
  v11 = MEMORY[0x1E0C809B0];
  if (v10
    && !-[SBUISystemApertureElementSource _elementRequiresConstraintBasedLayout](self, "_elementRequiresConstraintBasedLayout"))
  {
    v58[0] = v11;
    v58[1] = 3221225472;
    v58[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke;
    v58[3] = &unk_1E4C40570;
    v58[4] = self;
    v59 = v7;
    v60 = v9;
    v52[0] = v11;
    v52[1] = 3221225472;
    v52[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_2;
    v52[3] = &unk_1E4C40598;
    v57 = (id)MEMORY[0x1A85A1798](v58);
    v12 = v11;
    v13 = v31;
    v53 = v13;
    v14 = v8;
    v54 = v14;
    v27 = v9;
    v15 = v29;
    v55 = v15;
    v28 = v7;
    v16 = v30;
    v56 = v16;
    v26 = v57;
    v17 = (void *)MEMORY[0x1A85A1798](v52);
    v46[0] = v12;
    v46[1] = 3221225472;
    v46[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_3;
    v46[3] = &unk_1E4C405E8;
    v46[4] = self;
    v18 = v13;
    v11 = v12;
    v47 = v18;
    v48 = v14;
    v19 = v15;
    v9 = v27;
    v49 = v19;
    v20 = v16;
    v7 = v28;
    v50 = v20;
    v21 = v17;
    v51 = v21;
    objc_msgSend(v4, "addPreAlongsideAnimation:", v46);
    v44[0] = v12;
    v44[1] = 3221225472;
    v44[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_5;
    v44[3] = &unk_1E4C3EC18;
    v44[4] = self;
    v45 = v21;
    v22 = v21;
    objc_msgSend(v4, "addPostAlongsideAnimation:", v44);

  }
  if (!-[SBUISystemApertureElementSource _elementSupportsDynamicResizing](self, "_elementSupportsDynamicResizing"))
  {
    v39[0] = v11;
    v39[1] = 3221225472;
    v39[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_6;
    v39[3] = &unk_1E4C40610;
    v39[4] = self;
    v40 = v31;
    v41 = v8;
    v42 = v29;
    v43 = v30;
    v37[0] = v11;
    v37[1] = 3221225472;
    v37[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_7;
    v37[3] = &unk_1E4C3EC18;
    v23 = (id)MEMORY[0x1A85A1798](v39);
    v37[4] = self;
    v38 = v23;
    objc_msgSend(v4, "addPreAlongsideAnimation:", v37);
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_8;
    v35[3] = &unk_1E4C3EC18;
    v35[4] = self;
    v36 = v23;
    v24 = v23;
    objc_msgSend(v4, "addPostAlongsideAnimation:", v35);

  }
  v32[0] = v11;
  v32[1] = 3221225472;
  v32[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_9;
  v32[3] = &unk_1E4C3E6A0;
  v33 = v8;
  v34 = self;
  v25 = v8;
  objc_msgSend(v4, "addPreAlongsideAnimation:", v32);

}

void __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double MaxX;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  CGRect v36;
  CGRect v37;

  v35 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mutableConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumAccessoryViewSizeForLayoutMode:", a3);
  v7 = v6;
  v9 = v8;

  v10 = *(void **)(a1 + 40);
  objc_msgSend(v35, "bounds");
  objc_msgSend(v10, "convertRect:fromView:", v35);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v35, "sizeThatFits:forLayoutMode:", a3, v7, v9);
  else
    objc_msgSend(v35, "sizeThatFits:", v7, v9);
  v21 = v19;
  v22 = v20;
  v23 = v35;
  if (*(id *)(a1 + 48) == v35)
  {
    v36.origin.x = v12;
    v36.origin.y = v14;
    v36.size.width = v16;
    v36.size.height = v18;
    MaxX = CGRectGetMaxX(v36);
    v37.origin.x = v12;
    v37.origin.y = v14;
    v37.size.width = v21;
    v37.size.height = v22;
    v25 = CGRectGetMaxX(v37);
    v23 = v35;
    v12 = v12 + MaxX - v25;
  }
  objc_msgSend(v23, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "convertRect:fromView:", *(_QWORD *)(a1 + 40), v12, v14, v21, v22);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result;
  if (a2 == 3 || a2 == 2)
  {
    (*(void (**)(void))(*(_QWORD *)(result + 64) + 16))();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 64) + 16))();
  }
  return result;
}

void __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_4;
  v4[3] = &unk_1E4C405C0;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CEABB0];
  v4[1] = 3221225472;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v3, "performWithoutAnimation:", v4);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 32), "layoutMode"));

}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "layoutMode");
  v3 = *(void **)(a1 + 32);
  if (v2 == 2)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "anchorFrameForMinimalView");
    objc_msgSend(v3, "_ensureAccessoryView:hasLayoutFrame:", v4);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "anchorFrameForDetachedMinimalView");
LABEL_5:
    objc_msgSend(v5, "_ensureAccessoryView:hasLayoutFrame:", v6);
    return objc_msgSend(*(id *)(a1 + 48), "setHidden:", objc_msgSend(*(id *)(a1 + 32), "layoutMode") != 2);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "layoutMode") == 3)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v7, "anchorFrameForLeadingView");
    objc_msgSend(v7, "_ensureAccessoryView:hasLayoutFrame:", v8);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v5, "anchorFrameForTrailingView");
    goto LABEL_5;
  }
  return objc_msgSend(*(id *)(a1 + 48), "setHidden:", objc_msgSend(*(id *)(a1 + 32), "layoutMode") != 2);
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "layoutMode"));
}

_QWORD *__87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_6(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = result;
  if (a2 == 3)
  {
    v7 = (void *)result[4];
    v8 = result[7];
    objc_msgSend(v7, "anchorFrameForLeadingView");
    objc_msgSend(v7, "_ensureAccessoryView:hasLayoutFrame:", v8);
    v5 = (void *)v2[4];
    v6 = v2[8];
    objc_msgSend(v5, "anchorFrameForTrailingView");
  }
  else
  {
    if (a2 != 2)
      return result;
    v3 = (void *)result[4];
    v4 = result[5];
    objc_msgSend(v3, "anchorFrameForMinimalView");
    objc_msgSend(v3, "_ensureAccessoryView:hasLayoutFrame:", v4);
    v5 = (void *)v2[4];
    v6 = v2[6];
    objc_msgSend(v5, "anchorFrameForDetachedMinimalView");
  }
  return (_QWORD *)objc_msgSend(v5, "_ensureAccessoryView:hasLayoutFrame:", v6);
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "layoutMode"));
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "layoutMode"));
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", objc_msgSend(*(id *)(a1 + 40), "layoutMode") != 2);
}

- (void)_handleAlertingAction:(id)a3
{
  id v5;
  unint64_t v6;
  NSMutableArray *alertingAssertionsAwaitingActions;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[16];

  v5 = a3;
  v6 = -[NSMutableArray count](self->_alertingAssertionsAwaitingActions, "count");
  alertingAssertionsAwaitingActions = self->_alertingAssertionsAwaitingActions;
  if (v6 < 2)
  {
    -[NSMutableArray removeAllObjects](alertingAssertionsAwaitingActions, "removeAllObjects");
    if (-[SBUISystemApertureAssertion isValid](self->_alertingAssertion, "isValid"))
    {
      -[_SBUISystemApertureAlertingAssertion alertingAction](self->_alertingAssertion, "alertingAction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureElementSource.m"), 1279, CFSTR("Alerting assertion already has an alerting action: %@"), self->_alertingAssertion);

      }
      -[_SBUISystemApertureAlertingAssertion setAlertingAction:](self->_alertingAssertion, "setAlertingAction:", v5);
    }
    else
    {
      objc_msgSend(v5, "invalidateWithReason:", CFSTR("no alerting assertion"));
    }
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](alertingAssertionsAwaitingActions, "removeObjectAtIndex:", 0);
    SBLogSystemApertureHosting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A471F000, v8, OS_LOG_TYPE_DEFAULT, "_handleAlertingAction: Ignoring this action because we have an invalid assertion awaiting action.", buf, 2u);
    }

  }
}

- (void)_ensureAccessoryView:(id)a3 hasLayoutFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  _OWORD v24[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isDescendantOfView:", v11) & 1) == 0)
    objc_msgSend(v11, "addSubview:", v9);
  objc_msgSend(v9, "setAlpha:", 1.0);
  objc_msgSend(v9, "setHidden:", 0);
  if (objc_msgSend(v9, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[SBUISystemApertureElementSource windowScene](self, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRect:toCoordinateSpace:", v14, x, y, width, height);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    objc_msgSend(v9, "setAutoresizingMask:", 0);
    v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v24[0] = *MEMORY[0x1E0C9BAA8];
    v24[1] = v23;
    v24[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v9, "setTransform:", v24);
    objc_msgSend(v9, "setFrame:", v16, v18, v20, v22);
    objc_msgSend(v9, "setNeedsLayout");
  }

}

- (void)_updateTraitCollectionForElementIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource containerViewController](self, "containerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideTraitCollectionForChildViewController:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  -[SBUISystemApertureElementSource containerViewController](self, "containerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sbui_preferredContentSizeCategoryAllowingTraitsForCustomLayoutMode:", -[SBUISystemApertureElementSource layoutMode](self, "layoutMode") == 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualStrings())
  {
    v14 = objc_msgSend(v4, "userInterfaceStyle");

    if (v14 == 2)
      goto LABEL_11;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v9)
  {
    v17 = (void *)MEMORY[0x1E0CEAB40];
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v12, v9, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "traitCollectionWithTraitsFromCollections:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    -[SBUISystemApertureElementSource containerViewController](self, "containerViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setOverrideTraitCollection:forChildViewController:", v20, v3);

    v9 = (id)v20;
  }

LABEL_11:
}

- (void)_updateElementCanRequestAlertingAssertion
{
  id v3;

  -[SBUISystemApertureElementSource systemApertureElementViewController](self, "systemApertureElementViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBUISystemApertureElementSource elementCanRequestAlertingAssertion](self, "elementCanRequestAlertingAssertion")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "setCanRequestAlertingAssertion:", -[SBUISystemApertureElementSource elementCanRequestAlertingAssertion](self, "elementCanRequestAlertingAssertion"));
  }

}

- (void)_windowDidAttachToContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
    -[SBUISystemApertureElementSource setElementNeedsUpdate](self, "setElementNeedsUpdate");
}

- (void)registerWithScene:(id)a3
{
  id v4;

  v4 = a3;
  -[SBUISystemApertureElementSource unregisterFromScene](self, "unregisterFromScene");
  objc_msgSend(v4, "_registerSceneComponent:forKey:", self, CFSTR("SBUISystemApertureElementSourceKey"));

}

- (void)unregisterFromScene
{
  id v2;

  -[SBUISystemApertureElementSource _scene](self, "_scene");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_unregisterSceneComponentForKey:", CFSTR("SBUISystemApertureElementSourceKey"));

}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSHashTable *v6;
  NSHashTable *observers;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[SBUISystemApertureElementSource _observers](self, "_observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      observers = self->__observers;
      self->__observers = v6;

    }
    -[SBUISystemApertureElementSource _observers](self, "_observers");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
}

- (void)removeObserver:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSHashTable *observers;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[SBUISystemApertureElementSource _observers](self, "_observers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v8);

  }
  -[SBUISystemApertureElementSource _observers](self, "_observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    observers = self->__observers;
    self->__observers = 0;

  }
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  if (-[NSHashTable count](self->__observers, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[SBUISystemApertureElementSource _observers](self, "_observers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)isBeingRemoved
{
  void *v2;
  char v3;

  -[SBUISystemApertureElementSource _sceneSettings](self, "_sceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SBUISA_isBeingRemoved");

  return v3;
}

- (BOOL)_mustHaveUniqueElementIdentity
{
  void *v3;
  BOOL v4;

  if (-[SBUISystemApertureElementSource isBeingRemoved](self, "isBeingRemoved")
    || -[SBUISystemApertureElementSource layoutMode](self, "layoutMode") == -1)
  {
    return 0;
  }
  -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_elementIdentifierIfExists
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[SBUISystemApertureElementSource mutableConfiguration](self, "mutableConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[SBUISystemApertureElementSource systemApertureElement](self, "systemApertureElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "elementIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (void)_handleClientErrorNonUniqueElementAction
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_elementIdentifierIfExists");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("Default/Inferred");
  if (v3)
    v5 = (const __CFString *)v3;
  v6 = 138543362;
  v7 = v5;
  _os_log_error_impl(&dword_1A471F000, a2, OS_LOG_TYPE_ERROR, "*** Client SPI Misuse: Invalid attempt to post two elements in jindo with the same elementIdentifier, << %{public}@ >>. If the elements are functionally equivalent, never post a duplicate element. If they are functionally distinct, talk with SpringBoard about providing a unique elementIdentifier for your functional use case. ***", (uint8_t *)&v6, 0xCu);

}

- (void)_sendActionForCommand:(int64_t)a3
{
  void *v4;
  void *v5;
  SBUISystemApertureSceneAction *v6;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v6 = -[SBUISystemApertureSceneAction initWithCommand:]([SBUISystemApertureSceneAction alloc], "initWithCommand:", a3);
  objc_msgSend(v4, "setWithObject:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureElementSource _sendActions:](self, "_sendActions:", v5);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (NSString)description
{
  return (NSString *)-[SBUISystemApertureElementSource descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementSource succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBUISystemApertureElementSource descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBUISystemApertureElementSource *v11;

  v4 = a3;
  -[SBUISystemApertureElementSource succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBUISystemApertureElementSource_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E4C3E6A0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __73__SBUISystemApertureElementSource_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v5, CFSTR("sceneIdentifier"));

  v6 = *(void **)(a1 + 32);
  SBUISystemApertureLayoutModeDescription(objc_msgSend(*(id *)(a1 + 40), "layoutMode"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("layoutMode"));

}

- (SBUISystemApertureElementProviding)systemApertureElementViewControllerProvider
{
  return (SBUISystemApertureElementProviding *)objc_loadWeakRetained((id *)&self->_systemApertureElementViewControllerProvider);
}

- (BOOL)isPresentationPossible
{
  return self->_presentationPossible;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (UIWindow)systemApertureOwnedWindow
{
  return self->_systemApertureOwnedWindow;
}

- (void)setSystemApertureOwnedWindow:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureOwnedWindow, a3);
}

- (SBUISystemApertureElement)_elementViewController
{
  return (SBUISystemApertureElement *)objc_loadWeakRetained((id *)&self->__elementViewController);
}

- (void)set_elementViewController:(id)a3
{
  objc_storeWeak((id *)&self->__elementViewController, a3);
}

- (BSSettings)lastKnownOtherSettings
{
  return self->_lastKnownOtherSettings;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)set_observers:(id)a3
{
  objc_storeStrong((id *)&self->__observers, a3);
}

- (NSMutableArray)transitionContexts
{
  return self->_transitionContexts;
}

- (int64_t)layoutModeAsFarAsClientsAreConcerned
{
  return self->_layoutModeAsFarAsClientsAreConcerned;
}

- (void)setLayoutModeAsFarAsClientsAreConcerned:(int64_t)a3
{
  self->_layoutModeAsFarAsClientsAreConcerned = a3;
}

- (BOOL)elementHasMenuPresentation
{
  return self->_elementHasMenuPresentation;
}

- (void)setElementHasMenuPresentation:(BOOL)a3
{
  self->_elementHasMenuPresentation = a3;
}

- (NSArray)_activeConstraintsForLayoutMode
{
  return self->__activeConstraintsForLayoutMode;
}

- (void)set_activeConstraintsForLayoutMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSLayoutConstraint)_maximumLeadingViewWidthConstraint
{
  return self->__maximumLeadingViewWidthConstraint;
}

- (void)set_maximumLeadingViewWidthConstraint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSLayoutConstraint)_maximumTrailingViewWidthConstraint
{
  return self->__maximumTrailingViewWidthConstraint;
}

- (void)set_maximumTrailingViewWidthConstraint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (SBUIDependencyGestureRecognizer)dependencyGestureRecognizer
{
  return self->_dependencyGestureRecognizer;
}

- (void)setDependencyGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dependencyGestureRecognizer, a3);
}

- (_SBUISystemApertureAlertingAssertion)_alertingAssertion
{
  return self->_alertingAssertion;
}

- (void)_setAlertingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_alertingAssertion, a3);
}

- (NSMutableArray)alertingAssertionsAwaitingActions
{
  return self->_alertingAssertionsAwaitingActions;
}

- (BOOL)elementCanRequestAlertingAssertion
{
  return self->_elementCanRequestAlertingAssertion;
}

- (void)setElementCanRequestAlertingAssertion:(BOOL)a3
{
  self->_elementCanRequestAlertingAssertion = a3;
}

- (SBUISystemApertureAnimationParameters)localSceneResizeParameters
{
  return self->_localSceneResizeParameters;
}

- (void)setLocalSceneResizeParameters:(id)a3
{
  objc_storeStrong((id *)&self->_localSceneResizeParameters, a3);
}

- (_SBUISystemApertureElementSourceAnimationContext)animationContext
{
  return self->_animationContext;
}

- (NSSet)openSources
{
  return self->_openSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openSources, 0);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_localSceneResizeParameters, 0);
  objc_storeStrong((id *)&self->_alertingAssertionsAwaitingActions, 0);
  objc_storeStrong((id *)&self->_alertingAssertion, 0);
  objc_storeStrong((id *)&self->_dependencyGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__maximumTrailingViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->__maximumLeadingViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->__activeConstraintsForLayoutMode, 0);
  objc_storeStrong((id *)&self->_transitionContexts, 0);
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->_lastKnownOtherSettings, 0);
  objc_destroyWeak((id *)&self->__elementViewController);
  objc_storeStrong((id *)&self->_systemApertureOwnedWindow, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_mutableConfiguration, 0);
  objc_destroyWeak((id *)&self->_systemApertureElementViewControllerProvider);
  objc_storeStrong((id *)&self->_constraintsByLayoutMode, 0);
}

@end

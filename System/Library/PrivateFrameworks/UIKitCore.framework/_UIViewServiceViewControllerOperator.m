@implementation _UIViewServiceViewControllerOperator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (id)_queue
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  return v2;
}

+ (_UIViewServiceViewControllerOperator)operatorWithRemoteViewControllerProxy:(id)a3 hostPID:(int)a4 hostBundleID:(id)a5 hostAuditToken:(id *)a6 sessionIdentifier:(id)a7
{
  uint64_t v10;
  id v11;
  NSString *v12;
  NSUUID *v13;
  _UIViewServiceViewControllerOperator *v14;
  id remoteViewControllerProxyToOperator;
  NSString *hostBundleID;
  NSString *v17;
  __int128 v18;
  NSUUID *sessionIdentifier;
  NSUUID *v20;
  uint64_t v21;
  uint64_t v22;
  _UIAsyncInvocation *prepareForDisconnectionInvocation;
  uint64_t v24;
  _UIAsyncInvocation *invalidationInvocation;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  FBSScene *pseudoScene;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];

  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = (NSString *)a5;
  v13 = (NSUUID *)a7;
  v14 = objc_alloc_init(_UIViewServiceViewControllerOperator);
  remoteViewControllerProxyToOperator = v14->_remoteViewControllerProxyToOperator;
  v14->_remoteViewControllerProxyToOperator = v11;
  v37 = v11;

  v14->_hostPID = v10;
  v14->_mediaPID = v10;
  hostBundleID = v14->_hostBundleID;
  v14->_hostBundleID = v12;
  v17 = v12;

  v18 = *(_OWORD *)&a6->var0[4];
  *(_OWORD *)v14->_hostAuditToken.val = *(_OWORD *)a6->var0;
  *(_OWORD *)&v14->_hostAuditToken.val[4] = v18;
  sessionIdentifier = v14->_sessionIdentifier;
  v14->_sessionIdentifier = v13;
  v20 = v13;

  beginInheritingCoreMediaApplicationState(v14->_mediaPID);
  v21 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __132___UIViewServiceViewControllerOperator_operatorWithRemoteViewControllerProxy_hostPID_hostBundleID_hostAuditToken_sessionIdentifier___block_invoke;
  v39[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v39[4] = v14;
  +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v39);
  v22 = objc_claimAutoreleasedReturnValue();
  prepareForDisconnectionInvocation = v14->_prepareForDisconnectionInvocation;
  v14->_prepareForDisconnectionInvocation = (_UIAsyncInvocation *)v22;

  v38[0] = v21;
  v38[1] = 3221225472;
  v38[2] = __132___UIViewServiceViewControllerOperator_operatorWithRemoteViewControllerProxy_hostPID_hostBundleID_hostAuditToken_sessionIdentifier___block_invoke_2;
  v38[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v38[4] = v14;
  +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v38);
  v24 = objc_claimAutoreleasedReturnValue();
  invalidationInvocation = v14->_invalidationInvocation;
  v14->_invalidationInvocation = (_UIAsyncInvocation *)v24;

  -[UIViewController setWantsFullScreenLayout:](v14, "setWantsFullScreenLayout:", 1);
  -[UIViewController _setAllowsAutorotation:](v14, "_setAllowsAutorotation:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", v14, sel__popoverWillPresent_, 0x1E170FCA0, 0);
  objc_msgSend(v26, "addObserver:selector:name:object:", v14, sel__popoverDidDismiss_, 0x1E170FCC0, 0);
  v27 = (void *)MEMORY[0x1E0D231B0];
  -[NSUUID UUIDString](v20, "UUIDString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneSpecification specification](UIApplicationSceneSpecification, "specification");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pseudoSceneWithIdentifier:specification:", v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  pseudoScene = v14->_pseudoScene;
  v14->_pseudoScene = (FBSScene *)v30;

  objc_msgSend((id)objc_opt_class(), "XPCInterface");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "exportedInterface");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "protocol");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewServiceUIBehaviorProxy proxyWrappingExportedObject:forCommunicationWithPID:exportedProtocol:](_UIViewServiceUIBehaviorProxy, "proxyWrappingExportedObject:forCommunicationWithPID:exportedProtocol:", v14, v10, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIViewServiceViewControllerOperator *)v35;
}

- (void)_objc_initiateDealloc
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  _UIViewServiceViewControllerOperator *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = _objc_initiateDealloc___s_category_0;
  if (!_objc_initiateDealloc___s_category_0)
  {
    v3 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&_objc_initiateDealloc___s_category_0);
  }
  v4 = *(id *)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = self;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v6);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = CFSTR("(nil)");
    }
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Initiating deallocation for operator: %{public}@", buf, 0xCu);

  }
  if (self)
    *((_WORD *)&self->super._viewControllerFlags + 4) |= 0x80u;
  -[_UIViewServiceViewControllerOperator invalidate](self, "invalidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61___UIViewServiceViewControllerOperator__objc_initiateDealloc__block_invoke;
  v11[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v11[4] = self;
  objc_msgSend(v10, "whenCompleteDo:", v11);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  BSInvalidatable *screenCaptureAssertion;
  objc_super v6;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  -[_UIHostedTextServiceSession setDelegate:](self->_textServiceSession, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("UIWindowFirstResponderDidChangeNotification");
  v7[1] = CFSTR("_UIWindowDidBecomeApplicationKeyNotification");
  v7[2] = CFSTR("_UIWindowDidResignApplicationKeyNotification");
  v7[3] = CFSTR("_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification");
  v7[4] = CFSTR("_UIHostedWindowDidRegisterScrollToTopViewNotification");
  v7[5] = CFSTR("_UIHostedWindowDidUnregisterScrollToTopViewNotification");
  v7[6] = 0x1E170FCA0;
  v7[7] = 0x1E170FCC0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[BSInvalidatable invalidate](self->_screenCaptureAssertion, "invalidate");
  screenCaptureAssertion = self->_screenCaptureAssertion;
  self->_screenCaptureAssertion = 0;

  v6.receiver = self;
  v6.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController dealloc](&v6, sel_dealloc);
}

- (void)establishViewControllerDeputyWithProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  objc_class *v8;
  void *v9;
  void (**v10)(id, _QWORD);
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!self->_localViewController)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@: %@ received view controller connection before view controller was created."), v9, self);

    v7[2](v7, 0);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97___UIViewServiceViewControllerOperator_establishViewControllerDeputyWithProxy_completionHandler___block_invoke;
  block[3] = &unk_1E16BAD68;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_prepareForDisconnectionUnconditionallyThen:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _UIViewServiceViewControllerOperator *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)UIApp, "_beginBackgroundTaskWithExpirationHandler:", 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke;
  v9[3] = &unk_1E16E8F00;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v13 = v6;
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

- (void)_invalidateUnconditionallyThen:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[_UIAsyncInvocation invoke](self->_prepareForDisconnectionInvocation, "invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___UIViewServiceViewControllerOperator__invalidateUnconditionallyThen___block_invoke;
  v7[3] = &unk_1E16B1BF8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "whenCompleteDo:", v7);

}

- (void)loadView
{
  UIView *v3;
  UIView *v4;
  double v5;
  double v6;
  id v7;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [UIView alloc];
  objc_msgSend(v7, "bounds");
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
  -[UIViewController setView:](self, "setView:", v4);

  objc_msgSend(v7, "_referenceBounds");
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__setServiceMaxFrameSize:", v5, v6);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (BOOL)_isHostedRootViewController
{
  return 1;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return self->_disableAutomaticKeyboardBehavior;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return -[UIViewController shouldAutorotateToInterfaceOrientation:](self->_localViewController, "shouldAutorotateToInterfaceOrientation:", a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return -[UIViewController supportedInterfaceOrientations](self->_localViewController, "supportedInterfaceOrientations");
}

- (void)addDeputyRotationDelegate:(id)a3
{
  id v4;
  NSMutableArray *deputyRotationDelegates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  deputyRotationDelegates = self->_deputyRotationDelegates;
  v8 = v4;
  if (!deputyRotationDelegates)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v7 = self->_deputyRotationDelegates;
    self->_deputyRotationDelegates = v6;

    v4 = v8;
    deputyRotationDelegates = self->_deputyRotationDelegates;
  }
  -[NSMutableArray addObject:](deputyRotationDelegates, "addObject:", v4);
  objc_msgSend(v8, "setHostedWindow:disableAutomaticBehaviors:", self->_hostedWindow, -[UIResponder _disableAutomaticKeyboardBehavior](self->_localViewController, "_disableAutomaticKeyboardBehavior"));

}

- (id)_window
{
  return self->_hostedWindow;
}

- (void)_updateSupportedInterfaceOrientationsIfNecessary
{
  void *v3;
  uint64_t v4;
  id remoteViewControllerProxyToOperator;
  void *v6;

  -[UIViewController _viewControllerForSupportedInterfaceOrientations](self->_localViewController, "_viewControllerForSupportedInterfaceOrientations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportedInterfaceOrientations");

  if (v4 != self->_supportedOrientations)
  {
    remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    _supportedInterfaceOrientationsForMask(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(remoteViewControllerProxyToOperator, "__setSupportedInterfaceOrientations:", v6);

    self->_supportedOrientations = v4;
  }
}

- (UIViewController)localViewController
{
  return self->_localViewController;
}

- (void)__setHostCanDynamicallySpecifySupportedInterfaceOrientations:(BOOL)a3
{
  self->_hostCanDynamicallySpecifySupportedInterfaceOrientations = a3;
}

- (void)__setHostViewUnderlapsStatusBar:(BOOL)a3
{
  _BOOL8 v3;
  _UIViewServiceViewControllerOperator *v5;
  uint64_t v6;
  void *v7;
  _UIViewServiceViewControllerOperator *v8;
  void *v9;
  _UIHostedWindow *v10;

  v3 = a3;
  v10 = self->_hostedWindow;
  -[_UIHostedWindow __setHostViewUnderlapsStatusBar:](v10, "__setHostViewUnderlapsStatusBar:", v3);
  -[UIViewController _updateLayoutForStatusBarAndInterfaceOrientation](self, "_updateLayoutForStatusBarAndInterfaceOrientation");
  v5 = self;
  -[UIViewController presentedViewController](v5, "presentedViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      objc_msgSend(v7, "_updateLayoutForStatusBarAndInterfaceOrientation");
      v8 = v7;

      -[UIViewController presentedViewController](v8, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v8;
    }
    while (v7);
  }
  else
  {
    v8 = v5;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostDidUpdateUnderlapsStatusBar"), v10, 0);

}

- (void)window:(id)a3 statusBarWillChangeFromHeight:(double)a4 toHeight:(double)a5
{
  _UIHostedWindow *hostedWindow;
  id v9;
  objc_super v10;
  objc_super v11;

  hostedWindow = self->_hostedWindow;
  v9 = a3;
  if (-[_UIHostedWindow __hostViewUnderlapsStatusBar](hostedWindow, "__hostViewUnderlapsStatusBar"))
    -[UIViewController window:statusBarWillChangeFromHeight:toHeight:](&v11, sel_window_statusBarWillChangeFromHeight_toHeight_, v9, a4, a5, v10.receiver, v10.super_class, self, _UIViewServiceViewControllerOperator);
  else
    -[UIViewController window:statusBarWillChangeFromHeight:toHeight:](&v10, sel_window_statusBarWillChangeFromHeight_toHeight_, v9, a4, 0.0, self, _UIViewServiceViewControllerOperator, v11.receiver, v11.super_class);

}

- (BOOL)__knownPresentationWithoutPresentationControllerInstance
{
  return self->_presentationControllerClassName != 0;
}

- (void)__scrollToTopFromTouchAtViewLocation:(CGPoint)a3 resultHandler:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91___UIViewServiceViewControllerOperator___scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke;
  v11[3] = &unk_1E16B1BA0;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "_scrollToTopViewsUnderScreenPointIfNecessary:resultHandler:", v11, x, y);

}

- (void)_windowDidRegisterOrUnregisterScrollToTopView
{
  id remoteViewControllerProxyToOperator;
  id v3;

  remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
  -[UIWindow _registeredScrollToTopViews](self->_hostedWindow, "_registeredScrollToTopViews");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceDidChangeHasScrollToTopView:", objc_msgSend(v3, "count") != 0);

}

- (id)_appearanceSource
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_hostPID);
}

- (void)__hostDidUpdateAppearanceWithSerializedRepresentations:(id)a3 originalSource:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (!v7
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110___UIViewServiceViewControllerOperator___hostDidUpdateAppearanceWithSerializedRepresentations_originalSource___block_invoke;
    block[3] = &unk_1E16B47A8;
    block[4] = self;
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)__setHostTintColor:(id)a3 tintAdjustmentMode:(int64_t)a4
{
  _UIHostedWindow *v6;
  id v7;

  v7 = a3;
  v6 = self->_hostedWindow;
  if (dyld_program_sdk_at_least())
    -[_UIHostedWindow _setHostTintColor:](v6, "_setHostTintColor:", v7);
  -[_UIHostedWindow _setHostTintAdjustmentMode:](v6, "_setHostTintAdjustmentMode:", a4);

}

- (void)__setHostTraitCollection:(id)a3 deferIfAnimated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id location;

  v4 = a4;
  _unobscuredTraitCollectionFromTraitCollection(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81___UIViewServiceViewControllerOperator___setHostTraitCollection_deferIfAnimated___block_invoke;
  aBlock[3] = &unk_1E16B1500;
  objc_copyWeak(&v13, &location);
  v7 = v6;
  v12 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = v8;
  if (v4)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    -[_UIViewServiceViewControllerOperator _setTraitsDidChangeHandler:](self, "_setTraitsDidChangeHandler:", v10);

  }
  else
  {
    v8[2](v8);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)__hostWillTransitionToTraitCollection:(id)a3 withContextDescription:(id)a4 deferIfAnimated:(BOOL)a5 inRemoteViewHierarchy:(BOOL)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  double v13;
  char v14;
  id v15;
  id v16;
  uint64_t (**v17)(_QWORD);
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  _UIViewServiceViewControllerOperator *v25;
  id v26;
  id v27;
  uint64_t v28;

  v7 = a5;
  v10 = a4;
  _unobscuredTraitCollectionFromTraitCollection(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UIHostedWindowModifiedHostTraitCollection((uint64_t)self->_hostedWindow, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitionDuration");
  v21 = MEMORY[0x1E0C809B0];
  v14 = v13 > 0.0 || v7;
  v22 = 3221225472;
  v23 = __139___UIViewServiceViewControllerOperator___hostWillTransitionToTraitCollection_withContextDescription_deferIfAnimated_inRemoteViewHierarchy___block_invoke;
  v24 = &unk_1E16E8F30;
  LOBYTE(v28) = v14;
  BYTE1(v28) = v13 > 0.0;
  v25 = self;
  v26 = v10;
  BYTE2(v28) = a6;
  v27 = v12;
  v15 = v12;
  v16 = v10;
  v17 = (uint64_t (**)(_QWORD))_Block_copy(&v21);
  v18 = v17;
  if (v7)
  {
    v19 = (void *)objc_msgSend(v17, "copy", v21, v22, v23, v24, v25, v26, v27, v28);
    -[_UIViewServiceViewControllerOperator _setTraitsWillChangeHandler:](self, "_setTraitsWillChangeHandler:", v19);

  }
  else
  {
    v20 = (id)v17[2](v17);
  }

}

- (BOOL)becomeFirstResponder
{
  return -[UIResponder becomeFirstResponder](self->_localViewController, "becomeFirstResponder");
}

- (void)_firstResponderDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  _UIHostedWindow *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("UIWindowFirstResponderUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", 0x1E1765240);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "handlingRemoteEvent");

  if (v6 && (v9 & 1) == 0 && (v11 & 1) == 0 && !self->_hasRequestedKeyboardEventEnvironmentDeferring)
  {
    objc_msgSend(v4, "object");
    v12 = (_UIHostedWindow *)objc_claimAutoreleasedReturnValue();
    if (v12 == self->_hostedWindow)
    {
      self->_hasRequestedKeyboardEventEnvironmentDeferring = 1;
      objc_initWeak(&location, self);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __65___UIViewServiceViewControllerOperator__firstResponderDidChange___block_invoke;
      v17 = &unk_1E16B3F40;
      objc_copyWeak(&v18, &location);
      v13 = _Block_copy(&v14);
      objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidPromoteFirstResponderWithCompletionHandler:", v13, v14, v15, v16, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_windowDidBecomeApplicationKey:(id)a3
{
  _UIHostedWindow *v4;
  _UIHostedWindow *hostedWindow;
  BOOL v6;
  uint64_t v7;
  id *v8;
  _UIHostedWindow *v9;

  objc_msgSend(a3, "object");
  v9 = (_UIHostedWindow *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v9;
  else
    v4 = 0;
  hostedWindow = self->_hostedWindow;
  if (hostedWindow)
    v6 = hostedWindow == v4;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidChangeKeyWindow:", v7);
  if ((_DWORD)v7 == 1)
  {
    +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v8, 3uLL, &self->_hostedWindow->super.super.super.super.isa, self, (uint64_t)self->_sessionActivityRecord);

  }
}

- (void)_wantsKeyboardEventsWithoutFirstResponder:(id)a3
{
  id v4;
  void *v5;
  _UIHostedWindow *v6;
  id remoteViewControllerProxyToOperator;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_UIRemoteKeyboardsHostedWindowUserInfoKey"));
  v6 = (_UIHostedWindow *)objc_claimAutoreleasedReturnValue();

  if (v6 && v6 == self->_hostedWindow && !self->_hasRequestedKeyboardEventEnvironmentDeferring)
  {
    self->_hasRequestedKeyboardEventEnvironmentDeferring = 1;
    objc_initWeak(&location, self);
    remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82___UIViewServiceViewControllerOperator__wantsKeyboardEventsWithoutFirstResponder___block_invoke;
    v8[3] = &unk_1E16B3F40;
    objc_copyWeak(&v9, &location);
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceWantsKeyboardEventsWithoutFirstResponderAndCompletionHandler:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIViewServiceViewControllerOperator *v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = __prepareForDisconnectionWithCompletionHandler____s_category;
  if (!__prepareForDisconnectionWithCompletionHandler____s_category)
  {
    v5 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&__prepareForDisconnectionWithCompletionHandler____s_category);
  }
  v6 = *(id *)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = self;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v8);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = CFSTR("(nil)");
    }
    *(_DWORD *)buf = 138543362;
    v17 = v11;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Received request to prepare operator for disconnection: %{public}@", buf, 0xCu);

  }
  -[_UIAsyncInvocation invoke](self->_prepareForDisconnectionInvocation, "invoke");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87___UIViewServiceViewControllerOperator___prepareForDisconnectionWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E16B1BF8;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v12, "whenCompleteDo:", v14);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_viewServiceIsDisplayingPopoverController:(id)a3
{
  objc_storeWeak((id *)&self->_displayedPopoverController, a3);
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__setViewServiceIsDisplayingPopover:", a3 != 0);
}

- (void)_popoverWillPresent:(id)a3
{
  void *v4;
  _UIHostedWindow *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", 0x1E170FCE0);
  v5 = (_UIHostedWindow *)objc_claimAutoreleasedReturnValue();

  if (self->_hostedWindow == v5)
  {
    objc_msgSend(v11, "object");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6
      || (v7 = (void *)v6,
          objc_msgSend(v11, "object"),
          v8 = (id)objc_claimAutoreleasedReturnValue(),
          WeakRetained = objc_loadWeakRetained((id *)&self->_dummyPopoverController),
          WeakRetained,
          v8,
          v7,
          v8 != WeakRetained))
    {
      objc_msgSend(v11, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIViewServiceViewControllerOperator _viewServiceIsDisplayingPopoverController:](self, "_viewServiceIsDisplayingPopoverController:", v10);

    }
  }

}

- (void)_popoverDidDismiss:(id)a3
{
  id v4;
  id WeakRetained;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_displayedPopoverController);

  if (v4 == WeakRetained)
    -[_UIViewServiceViewControllerOperator _viewServiceIsDisplayingPopoverController:](self, "_viewServiceIsDisplayingPopoverController:", 0);
}

- (void)__dimmingViewWasTapped
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_displayedPopoverController);
  objc_msgSend(WeakRetained, "_dimmingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_simulateTap");

}

- (void)_willBecomeContentViewControllerOfPopover:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  v4 = a3;
  -[UIViewController _willBecomeContentViewControllerOfPopover:](&v5, sel__willBecomeContentViewControllerOfPopover_, v4);
  -[UIViewController _willBecomeContentViewControllerOfPopover:](self->_localViewController, "_willBecomeContentViewControllerOfPopover:", v4, v5.receiver, v5.super_class);

}

- (void)_didBecomeContentViewControllerOfPopover:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  v4 = a3;
  -[UIViewController _didBecomeContentViewControllerOfPopover:](&v5, sel__didBecomeContentViewControllerOfPopover_, v4);
  -[UIViewController _didBecomeContentViewControllerOfPopover:](self->_localViewController, "_didBecomeContentViewControllerOfPopover:", v4, v5.receiver, v5.super_class);

}

- (void)_willResignContentViewControllerOfPopover:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  v4 = a3;
  -[UIViewController _willResignContentViewControllerOfPopover:](&v5, sel__willResignContentViewControllerOfPopover_, v4);
  -[UIViewController _willResignContentViewControllerOfPopover:](self->_localViewController, "_willResignContentViewControllerOfPopover:", v4, v5.receiver, v5.super_class);

}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  v4 = a3;
  -[UIViewController _didResignContentViewControllerOfPopover:](&v5, sel__didResignContentViewControllerOfPopover_, v4);
  -[UIViewController _didResignContentViewControllerOfPopover:](self->_localViewController, "_didResignContentViewControllerOfPopover:", v4, v5.receiver, v5.super_class);

}

- (CGSize)contentSizeForViewInPopover
{
  double v2;
  double v3;
  CGSize result;

  -[UIViewController contentSizeForViewInPopover](self->_localViewController, "contentSizeForViewInPopover");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id remoteViewControllerProxyToOperator;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "preferredContentSize");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:](self, "_existingPresentationControllerImmediate:effective:includesRoot:", 1, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeDidChangeForChildContentContainer:", self);

  v5 = (void *)MEMORY[0x186DC9484]();
  -[_UIViewServiceViewControllerOperator _window](self, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_windowHostingScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_synchronizedDrawingFence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
  objc_msgSend(v10, "preferredContentSize");
  objc_msgSend(remoteViewControllerProxyToOperator, "__viewServicePreferredContentSizeDidChange:fence:", v8);
  objc_msgSend(v8, "invalidate");

  objc_autoreleasePoolPop(v5);
}

- (void)systemLayoutFittingSizeDidChangeForChildViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
  void (**v6)(_QWORD);
  NSMutableArray *deferredToViewDidAppear;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  UIViewController *v15;
  _UIViewServiceViewControllerOperator *v16;
  id v17;
  id location;

  v4 = (UIViewController *)a3;
  v5 = v4;
  if (self->_localViewController == v4
    && -[UIViewController _shouldForwardSystemLayoutFittingSizeChanges](v4, "_shouldForwardSystemLayoutFittingSizeChanges"))
  {
    objc_initWeak(&location, self->_remoteViewControllerProxyToOperator);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __95___UIViewServiceViewControllerOperator_systemLayoutFittingSizeDidChangeForChildViewController___block_invoke;
    v14 = &unk_1E16BE700;
    v15 = v5;
    v16 = self;
    objc_copyWeak(&v17, &location);
    v6 = (void (**)(_QWORD))_Block_copy(&v11);
    if (-[UIViewController _appearState](self->_localViewController, "_appearState", v11, v12, v13, v14)
       - 1 > 1)
    {
      deferredToViewDidAppear = self->_deferredToViewDidAppear;
      if (!deferredToViewDidAppear)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v9 = self->_deferredToViewDidAppear;
        self->_deferredToViewDidAppear = v8;

        deferredToViewDidAppear = self->_deferredToViewDidAppear;
      }
      v10 = (void *)objc_msgSend(v6, "copy");
      -[NSMutableArray addObject:](deferredToViewDidAppear, "addObject:", v10);

    }
    else
    {
      v6[2](v6);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (BOOL)isModalInPresentation
{
  return -[UIViewController isModalInPresentation](self->_localViewController, "isModalInPresentation");
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  _QWORD block[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82___UIViewServiceViewControllerOperator_presentationControllerDidAttemptToDismiss___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    if (qword_1ECD79FD8 != -1)
      dispatch_once(&qword_1ECD79FD8, block);
    -[UIViewController presentationControllerDidAttemptToDismiss:](self->_localViewController, "presentationControllerDidAttemptToDismiss:", _MergedGlobals_65);
  }
}

- (void)_sheetPresentationControllerClientConfigurationDidChange:(id)a3
{
  id v5;
  _UISheetPresentationControllerClientConfiguration *v6;
  _UISheetPresentationControllerClientConfiguration *v7;
  BOOL v8;
  _UISheetPresentationControllerClientConfiguration *v9;
  void *v10;
  id remoteViewControllerProxyToOperator;
  _UISheetPresentationControllerClientConfiguration *v12;

  v5 = a3;
  v6 = self->_sheetClientConfiguration;
  v7 = (_UISheetPresentationControllerClientConfiguration *)v5;
  v12 = v7;
  if (v6 == v7)
  {

    v10 = v12;
  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UISheetPresentationControllerClientConfiguration isEqual:](v6, "isEqual:", v7);

      v9 = v12;
      if (v8)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_sheetClientConfiguration, a3);
    remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    +[UIView _currentAnimationAttributes](UIView, "_currentAnimationAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceSheetPresentationClientConfigurationDidChange:attributes:", v12, v10);
  }

  v9 = v12;
LABEL_10:

}

- (void)_sheetGrabberDidTriggerPrimaryAction
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceSheetGrabberDidTriggerPrimaryAction");
}

- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", a4, a3, a5.x, a5.y);
}

- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", a5, a6, a3.x, a3.y, a4.x, a4.y);
}

- (void)_sheetInteractionDraggingDidEnd
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceSheetInteractionDraggingDidEnd");
}

- (void)_addSceneForwardingLayersForOwners:(id)a3
{
  id remoteViewControllerProxyToOperator;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    v5 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceAddSceneForwardingLayersForOwners:", v5);

  }
}

- (void)_removeSceneForwardingLayersForOwners:(id)a3
{
  id remoteViewControllerProxyToOperator;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    v5 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceRemoveSceneForwardingLayersForOwners:", v5);

  }
}

- (void)dummyPopoverController:(id)a3 didChangeContentSize:(CGSize)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id remoteViewControllerProxyToOperator;
  _QWORD v16[5];

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dummyPopoverController);

  if (WeakRetained == v9)
  {
    v11 = (void *)MEMORY[0x186DC9484]();
    -[_UIViewServiceViewControllerOperator _window](self, "_window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_windowHostingScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_synchronizedDrawingFence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93___UIViewServiceViewControllerOperator_dummyPopoverController_didChangeContentSize_animated___block_invoke;
    v16[3] = &unk_1E16CBA40;
    v16[4] = self;
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServicePopoverDidChangeContentSize:animated:fence:withReplyHandler:", v5, v14, v16, width, height);
    objc_msgSend(v14, "invalidate");

    objc_autoreleasePoolPop(v11);
  }

}

- (void)dummyPopoverController:(id)a3 popoverViewDidSetUseToolbarShine:(BOOL)a4
{
  _BOOL8 v4;
  _UIViewServiceDummyPopoverController **p_dummyPopoverController;
  id v7;
  id WeakRetained;

  v4 = a4;
  p_dummyPopoverController = &self->_dummyPopoverController;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dummyPopoverController);

  if (WeakRetained == v7)
    objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServicePopoverDidSetUseToolbarShine:", v4);
}

- (id)invalidate
{
  return -[_UIAsyncInvocation invoke](self->_invalidationInvocation, "invoke");
}

+ (id)XPCInterface
{
  if (qword_1ECD79FE0 != -1)
    dispatch_once(&qword_1ECD79FE0, &__block_literal_global_616);
  return (id)qword_1ECD79FE8;
}

- (void)__hostReadyToReceiveMessagesFromServiceViewController
{
  -[_UIQueueingProxy resume](self->_remoteViewControllerProxyToViewController, "resume");
}

- (void)__hostViewWillAppear:(BOOL)a3 inInterfaceOrientation:(int64_t)a4 traitCollection:(id)a5 statusBarHeight:(double)a6 underlapsStatusBar:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL4 v8;
  _BOOL8 v12;
  void (**v14)(_QWORD, double, double);
  void *v15;
  unint64_t v16;
  NSObject *v17;
  os_signpost_id_t v18;
  os_signpost_id_t v19;
  _UIHostedWindow *v20;
  void *v21;
  void *v22;
  id remoteViewControllerProxyToOperator;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v33;
  os_signpost_id_t v34;
  os_signpost_id_t v35;
  void *v36;
  _BOOL4 v37;
  _QWORD v38[5];
  void (**v39)(_QWORD, double, double);
  _QWORD v40[7];
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  int64_t v44;
  _QWORD v45[4];
  id v46[2];

  v8 = a7;
  v12 = a3;
  v14 = (void (**)(_QWORD, double, double))a8;
  _unobscuredTraitCollectionFromTraitCollection(a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIViewController _appearState](self->_localViewController, "_appearState"))
  {
    -[UIViewController beginAppearanceTransition:animated:](self->_localViewController, "beginAppearanceTransition:animated:", 1, v12);
    v14[2](v14, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
  else
  {
    v37 = v8;
    v16 = qword_1ECD79FF0;
    if (!qword_1ECD79FF0)
    {
      v16 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&qword_1ECD79FF0);
    }
    v17 = *(id *)(v16 + 8);
    v18 = os_signpost_id_make_with_pointer(*(os_log_t *)(v16 + 8), self);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VCOperatorViewWillAppear", ", buf, 2u);
      }
    }

    v20 = self->_hostedWindow;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);
    objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__windowDidBecomeApplicationKey_, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);
    objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__eventDispatcherDidCancelTouch_, CFSTR("_UIEventDispatcherDidCancelTouchForInsecureServicePresentation"), v20);
    if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
      objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__wantsKeyboardEventsWithoutFirstResponder_, CFSTR("_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification"), 0);
    -[UIWindow firstResponder](v20, "firstResponder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      self->_hasRequestedKeyboardEventEnvironmentDeferring = 1;
      objc_initWeak((id *)buf, self);
      remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke;
      v45[3] = &unk_1E16B3F40;
      objc_copyWeak(v46, (id *)buf);
      objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceDidPromoteFirstResponderWithCompletionHandler:", v45);
      objc_destroyWeak(v46);
      objc_destroyWeak((id *)buf);
    }
    -[_UIViewServiceViewControllerOperator __setHostTraitCollection:deferIfAnimated:](self, "__setHostTraitCollection:deferIfAnimated:", v15, 0);
    if (a4)
    {
      *(_QWORD *)buf = 0;
      v42 = buf;
      v43 = 0x2020000000;
      v44 = a4;
      v24 = objc_alloc(MEMORY[0x1E0D01708]);
      -[_UIViewServiceViewControllerOperator _window](self, "_window");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithTargetOrientation:currentOrientation:", a4, objc_msgSend(v25, "interfaceOrientation"));

      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke_2;
      v40[3] = &unk_1E16DB6C8;
      v40[4] = self;
      v40[5] = buf;
      v40[6] = a4;
      _UIApplicationPerformWithViewServiceFallbackOrientationResolver(v26, v40);
      -[_UIViewServiceViewControllerOperator __hostDidChangeStatusBarOrientationToInterfaceOrientation:](self, "__hostDidChangeStatusBarOrientationToInterfaceOrientation:", *((_QWORD *)v42 + 3));
      -[_UIViewServiceViewControllerOperator __hostDidChangeStatusBarHeight:](self, "__hostDidChangeStatusBarHeight:", a6);
      -[_UIViewServiceViewControllerOperator __setHostViewUnderlapsStatusBar:](self, "__setHostViewUnderlapsStatusBar:", v37);

      _Block_object_dispose(buf, 8);
    }
    -[UIViewController beginAppearanceTransition:animated:](self->_localViewController, "beginAppearanceTransition:animated:", 1, v12);
    -[UIViewController view](self->_localViewController, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v27);

    -[UIViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    objc_msgSend(v27, "setFrame:");

    objc_msgSend(v27, "setNeedsLayout");
    objc_msgSend(v27, "_setNeedsUpdateConstraints");
    -[_UIViewServiceViewControllerOperator setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    -[_UIViewServiceViewControllerOperator setNeedsWhitePointAdaptivityStyleUpdate](self, "setNeedsWhitePointAdaptivityStyleUpdate");
    -[_UIViewServiceViewControllerOperator setNeedsUpdateOfScreenEdgesDeferringSystemGestures](self, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
    -[_UIViewServiceViewControllerOperator setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
    -[_UIViewServiceViewControllerOperator _setNeedsUserInterfaceAppearanceUpdate](self, "_setNeedsUserInterfaceAppearanceUpdate");
    -[_UIViewServiceViewControllerOperator setNeedsUpdateOfPrefersPointerLocked](self, "setNeedsUpdateOfPrefersPointerLocked");
    -[_UIViewServiceViewControllerOperator _setNeedsUpdateOfMultitaskingDragExclusionRects](self, "_setNeedsUpdateOfMultitaskingDragExclusionRects");
    -[UIWindow _registeredScrollToTopViews](v20, "_registeredScrollToTopViews");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31)
      -[_UIViewServiceViewControllerOperator _windowDidRegisterOrUnregisterScrollToTopView](self, "_windowDidRegisterOrUnregisterScrollToTopView");
    objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__windowDidRegisterOrUnregisterScrollToTopView, CFSTR("_UIHostedWindowDidRegisterScrollToTopViewNotification"), v20);
    objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__windowDidRegisterOrUnregisterScrollToTopView, CFSTR("_UIHostedWindowDidUnregisterScrollToTopViewNotification"), v20);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke_3;
    v38[3] = &unk_1E16B2F48;
    v38[4] = self;
    v39 = v14;
    +[UIWindow _synchronizeDrawingWithPreCommitHandler:](UIWindow, "_synchronizeDrawingWithPreCommitHandler:", v38);
    v32 = qword_1ECD79FF8;
    if (!qword_1ECD79FF8)
    {
      v32 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v32, (unint64_t *)&qword_1ECD79FF8);
    }
    v33 = *(id *)(v32 + 8);
    v34 = os_signpost_id_make_with_pointer(*(os_log_t *)(v32 + 8), self);
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v35 = v34;
      if (os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v33, OS_SIGNPOST_INTERVAL_END, v35, "VCOperatorViewWillAppear", ", buf, 2u);
      }
    }

  }
  -[UIViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setUserInteractionEnabled:", 1);

}

- (void)__hostViewWillMoveToWindowInInterfaceOrientation:(int64_t)a3 withStatusBarHeight:(double)a4 underlapsStatusBar:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[_UIViewServiceViewControllerOperator __hostDidChangeStatusBarOrientationToInterfaceOrientation:](self, "__hostDidChangeStatusBarOrientationToInterfaceOrientation:", a3);
  -[_UIViewServiceViewControllerOperator __hostDidChangeStatusBarHeight:](self, "__hostDidChangeStatusBarHeight:", a4);
  -[_UIViewServiceViewControllerOperator __setHostViewUnderlapsStatusBar:](self, "__setHostViewUnderlapsStatusBar:", v5);
}

- (void)__hostViewDidAppear:(BOOL)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[UIViewController _appearState](self->_localViewController, "_appearState", a3) == 1)
    -[UIViewController endAppearanceTransition](self->_localViewController, "endAppearanceTransition");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_deferredToViewDidAppear;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_deferredToViewDidAppear, "removeAllObjects", (_QWORD)v11);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostViewDidAppearNotification"), self->_localViewController, 0);

  +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker");
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v10, 2uLL, &self->_hostedWindow->super.super.super.super.isa, self, (uint64_t)self->_sessionActivityRecord);

}

- (void)__hostViewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;

  v3 = a3;
  -[NSMutableArray removeAllObjects](self->_deferredToViewDidAppear, "removeAllObjects");
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  -[UIWindow windowScene](self->_hostedWindow, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardSceneDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "responder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v10, "_clearPersistingInputAccessoryView");
    objc_msgSend(v10, "_reloadInputViewsForResponder:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostViewWillDisappearNotification"), self->_localViewController, 0);

  -[UIViewController beginAppearanceTransition:animated:](self->_localViewController, "beginAppearanceTransition:animated:", 0, v3);
  +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker");
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v9, 2uLL, &self->_hostedWindow->super.super.super.super.isa, self, (uint64_t)self->_sessionActivityRecord);

}

- (void)__hostViewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _UIHostedWindow *v7;

  if (-[UIViewController _appearState](self->_localViewController, "_appearState", a3) == 3)
  {
    v7 = self->_hostedWindow;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_UIHostedWindowDidRegisterScrollToTopViewNotification"), v7);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_UIHostedWindowDidUnregisterScrollToTopViewNotification"), v7);
    if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
      objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_UIEventDispatcherDidCancelTouchForInsecureServicePresentation"), v7);
    if (-[UIViewController _shouldRemoveViewFromHierarchyOnDisappear](self->_localViewController, "_shouldRemoveViewFromHierarchyOnDisappear"))
    {
      -[UIViewController view](self->_localViewController, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

    }
    -[UIViewController endAppearanceTransition](self->_localViewController, "endAppearanceTransition");
    -[UIWindow _rootPresentationController](v7, "_rootPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_resetRemoteDismissing");

  }
}

- (void)__hostDidAttachDisplay:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v6, objc_msgSend((id)UIApp, "_hasCalledRunWithMainScene"));
  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0 && (_UIApplicationIsExtension() & 1) == 0)
  {
    objc_msgSend(v6, "identity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[UIWindowScene _placeholderWindowSceneForScreen:create:](UIWindowScene, "_placeholderWindowSceneForScreen:create:", v4, 1);

  }
}

- (void)__hostDidUpdateDisplay:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_updateDisplayConfiguration:", v3);
}

- (void)__hostDidDetachDisplay:(id)a3
{
  id v3;

  objc_msgSend(a3, "identity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[UIScreen _FBSDisplayIdentityDisconnected:](UIScreen, "_FBSDisplayIdentityDisconnected:", v3);

}

- (void)_eventDispatcherDidCancelTouch:(id)a3
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidDropTouchEventForInsecurePresentation", a3);
}

- (void)__hostDidUpdateSceneContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  _UIRemoteViewControllerSceneContext *v12;
  _UIRemoteViewControllerSceneContext *sceneContext;
  _BOOL8 v14;
  void *v15;
  _UIViewServiceViewControllerOperator *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  BSInvalidatable *v21;
  BSInvalidatable *screenCaptureAssertion;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  double systemReferenceAngleFromHost;
  double v29;
  _BOOL4 v30;
  unint64_t v31;
  void *v32;
  double v33;
  unint64_t systemReferenceAngleModeFromHost;
  void *v35;
  void *v36;
  void *v37;
  NSString *hostBundleID;
  void *v39;
  void *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIViewServiceViewControllerOperator _window](self, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v9 = (void *)*((_QWORD *)v4 + 4);
  else
    v9 = 0;
  v10 = v9;
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = (_UIRemoteViewControllerSceneContext *)objc_msgSend(v4, "copy");
    sceneContext = self->_sceneContext;
    self->_sceneContext = v12;

    if (v4)
    {
      objc_msgSend(v7, "_setReferenceDisplayModeStatus:", *((_QWORD *)v4 + 5));
      v14 = *((_BYTE *)v4 + 9) != 0;
    }
    else
    {
      objc_msgSend(v7, "_setReferenceDisplayModeStatus:", 0);
      v14 = 0;
    }
    objc_msgSend(v6, "_setEnhancedWindowingEnabled:", v14);
    if (((objc_msgSend(v4, "isCapturingContentForAdditionalRenderingDestination") ^ (self->_screenCaptureAssertion == 0)) & 1) == 0)
    {
      if (objc_msgSend(v4, "isCapturingContentForAdditionalRenderingDestination"))
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        hostBundleID = self->_hostBundleID;
        v16 = self;
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v39 = v8;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v39;
        objc_msgSend(v15, "stringWithFormat:", CFSTR("view service via %@; %@"), hostBundleID, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIScreen _capturingAssertionForReason:]((id *)v7, v20);
        v21 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        screenCaptureAssertion = self->_screenCaptureAssertion;
        self->_screenCaptureAssertion = v21;

      }
      else
      {
        -[BSInvalidatable invalidate](self->_screenCaptureAssertion, "invalidate");
        v20 = self->_screenCaptureAssertion;
        self->_screenCaptureAssertion = 0;
      }

    }
    systemReferenceAngleFromHost = self->_systemReferenceAngleFromHost;
    if (v4)
    {
      v29 = *((double *)v4 + 6);
      v30 = systemReferenceAngleFromHost != v29 || self->_systemReferenceAngleModeFromHost != *((_QWORD *)v4 + 7);
      self->_systemReferenceAngleFromHost = v29;
      v31 = *((_QWORD *)v4 + 7);
    }
    else
    {
      v30 = systemReferenceAngleFromHost != 0.0 || self->_systemReferenceAngleModeFromHost != 0;
      v31 = 0;
      self->_systemReferenceAngleFromHost = 0.0;
    }
    self->_systemReferenceAngleModeFromHost = v31;
    if (v5 && v30)
    {
      +[_UISystemReferenceAngleMultiplexer sharedMultiplexer](_UISystemReferenceAngleMultiplexer, "sharedMultiplexer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = self->_systemReferenceAngleFromHost;
      systemReferenceAngleModeFromHost = self->_systemReferenceAngleModeFromHost;
      v40 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "systemReferenceAngleDidChange:mode:forWindows:", systemReferenceAngleModeFromHost, v35, v33);

    }
    objc_msgSend(v6, "keyboardSceneDelegate");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v4)
      v36 = (void *)*((_QWORD *)v4 + 8);
    else
      v36 = 0;
    v27 = v36;
    -[NSObject setHardwareKeyboardExclusivityIdentifier:](v25, "setHardwareKeyboardExclusivityIdentifier:", v27);
    goto LABEL_29;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    if (v4)
      v37 = (void *)*((_QWORD *)v4 + 4);
    else
      v37 = 0;
    v27 = v37;
    *(_DWORD *)buf = 138412546;
    v42 = v27;
    v43 = 2112;
    v44 = v8;
    _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "Received scene context for wrong screen, host sent context for %@ but service is on %@", buf, 0x16u);
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  v23 = __hostDidUpdateSceneContext____s_category;
  if (!__hostDidUpdateSceneContext____s_category)
  {
    v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v23, (unint64_t *)&__hostDidUpdateSceneContext____s_category);
  }
  v24 = *(NSObject **)(v23 + 8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = v24;
    if (v4)
      v26 = (void *)*((_QWORD *)v4 + 4);
    else
      v26 = 0;
    v27 = v26;
    *(_DWORD *)buf = 138412546;
    v42 = v27;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Received scene context for wrong screen, host sent context for %@ but service is on %@", buf, 0x16u);
    goto LABEL_29;
  }
LABEL_31:

}

- (void)__hostDidMoveToParentSceneWithSettings:(id)a3
{
  void *v4;
  FBSScene *pseudoScene;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = (id)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  objc_msgSend(MEMORY[0x1E0D23270], "diffFromSettings:toSettings:", 0, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pseudoScene = self->_pseudoScene;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79___UIViewServiceViewControllerOperator___hostDidMoveToParentSceneWithSettings___block_invoke;
  v8[3] = &unk_1E16E8F68;
  v9 = v4;
  v6 = v4;
  -[FBSScene updateSettings:](pseudoScene, "updateSettings:", v8);

}

- (void)__hostSceneDidUpdateWithDiff:(id)a3
{
  void *v4;
  FBSScene *pseudoScene;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  pseudoScene = self->_pseudoScene;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69___UIViewServiceViewControllerOperator___hostSceneDidUpdateWithDiff___block_invoke;
  v7[3] = &unk_1E16E8F68;
  v8 = v4;
  v6 = v4;
  -[FBSScene updateSettings:](pseudoScene, "updateSettings:", v7);

}

- (void)__hostViewDidMoveToScreenWithFBSDisplayIdentity:(id)a3 newHostingHandleReplyHandler:(id)a4
{
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _BOOL4 v13;
  BSInvalidatable *physicalButtonInteractionArbiterObserverToken;
  BSInvalidatable *v15;
  id *v16;
  _UIHostedWindow *v17;
  void *v18;
  void *v19;
  _UIViewServiceSessionActivityRecord *v20;
  _UIViewServiceSessionActivityRecord *sessionActivityRecord;
  id *v22;
  BSInvalidatable *v23;
  BSInvalidatable *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  BSInvalidatable *screenCaptureAssertion;
  BSInvalidatable *v32;
  void *v33;
  void *v34;
  _UIHostedWindow *v35;

  v35 = self->_hostedWindow;
  v7 = (void (**)(id, void *))a4;
  v8 = a3;
  -[UIWindow _windowHostingScene](v35, "_windowHostingScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v10 == v11;
  else
    v12 = 1;
  if (v12)
  {
    v13 = 0;
  }
  else
  {
    v34 = v10;
    -[_UIViewServiceSessionActivityRecord invalidate]((uint64_t)self->_sessionActivityRecord);
    physicalButtonInteractionArbiterObserverToken = self->_physicalButtonInteractionArbiterObserverToken;
    if (physicalButtonInteractionArbiterObserverToken)
    {
      -[BSInvalidatable invalidate](self->_physicalButtonInteractionArbiterObserverToken, "invalidate");
      v15 = self->_physicalButtonInteractionArbiterObserverToken;
      self->_physicalButtonInteractionArbiterObserverToken = 0;

    }
    stopStealingStatusBar(self->_hostedWindow);
    self->_hostStatusBarOrientation = 0;
    self->_hostStatusBarHeight = 0.0;
    -[UIWindow windowScene](v35, "windowScene");
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _keyWindow](v16);
    v17 = (_UIHostedWindow *)objc_claimAutoreleasedReturnValue();

    +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v11, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow setWindowScene:](v35, "setWindowScene:", v18);
    objc_msgSend(v18, "screen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIViewServiceSessionActivityRecord activityRecordForProvider:userInterfaceIdiom:]((uint64_t)_UIViewServiceSessionActivityRecord, self, objc_msgSend(v19, "_userInterfaceIdiom"));
    v20 = (_UIViewServiceSessionActivityRecord *)objc_claimAutoreleasedReturnValue();
    sessionActivityRecord = self->_sessionActivityRecord;
    self->_sessionActivityRecord = v20;

    if (physicalButtonInteractionArbiterObserverToken)
    {
      objc_msgSend(v18, "_physicalButtonInteractionArbiter");
      v22 = (id *)objc_claimAutoreleasedReturnValue();
      -[_UIPhysicalButtonInteractionArbiter _registerViewServiceObserver:](v22, self);
      v23 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v24 = self->_physicalButtonInteractionArbiterObserverToken;
      self->_physicalButtonInteractionArbiterObserverToken = v23;

    }
    if (v35 == v17)
    {
      -[UIWindowScene _keyWindow]((id *)v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v25 == 0;

    }
    else
    {
      v13 = 0;
    }
    v10 = v34;

  }
  -[UIWindow windowScene](v35, "windowScene", v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "useHostedInstance");

    if ((v28 & 1) == 0)
    {
      +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setUseHostedInstance:", 1);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "postNotificationName:object:", CFSTR("UITextEffectsWindowIsHostedNotification"), 0);

    }
  }
  if (v13)
    -[UIWindow _makeKeyWindowIgnoringOldKeyWindow:transferringScenes:](v35, 0, 1);
  screenCaptureAssertion = self->_screenCaptureAssertion;
  if (screenCaptureAssertion)
  {
    -[BSInvalidatable invalidate](screenCaptureAssertion, "invalidate");
    v32 = self->_screenCaptureAssertion;
    self->_screenCaptureAssertion = 0;

  }
  -[_UIHostedWindow hostingHandle](v35, "hostingHandle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v33);

}

- (void)__setServiceInPopover:(BOOL)a3
{
  _BOOL4 v3;
  _UIViewServiceDummyPopoverController **p_dummyPopoverController;
  _UIHostedWindow *v6;
  int v7;
  _UIViewServiceDummyPopoverController *v8;
  id WeakRetained;

  v3 = a3;
  p_dummyPopoverController = &self->_dummyPopoverController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dummyPopoverController);
  v6 = self->_hostedWindow;
  self->_serviceInPopover = v3;
  v7 = !v3;
  if (v3 && !WeakRetained)
  {
    v8 = -[UIPopoverController initWithContentViewController:]([_UIViewServiceDummyPopoverController alloc], "initWithContentViewController:", self);
    objc_storeWeak((id *)p_dummyPopoverController, v8);
    -[UIPopoverController setPopoverLayoutMargins:](v8, "setPopoverLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    -[UIPopoverController setPopoverBackgroundViewClass:](v8, "setPopoverBackgroundViewClass:", objc_opt_class());
    -[_UIViewServiceDummyPopoverController setDummyPopoverControllerDelegate:](v8, "setDummyPopoverControllerDelegate:", self);
    -[UIPopoverController setPopoverLayoutMargins:](v8, "setPopoverLayoutMargins:", 0.0, 0.0, -1000.0, 0.0);
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v8, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v6, 4, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
LABEL_8:

    goto LABEL_9;
  }
  if (!WeakRetained)
    v7 = 0;
  if (v7 == 1)
  {
    objc_msgSend(WeakRetained, "dismissPopoverAnimated:", 0);
    objc_storeWeak((id *)p_dummyPopoverController, 0);
    -[UIViewController view](self, "view");
    v8 = (_UIViewServiceDummyPopoverController *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v6, "addSubview:", v8);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)__setSheetConfiguration:(id)a3
{
  id v5;
  void *v6;
  _UIHostedWindow *v7;

  v7 = self->_hostedWindow;
  v5 = a3;
  -[UIWindow _rootPresentationController](v7, "_rootPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setConfiguration:", v5);

  if (-[UIViewController _shouldForceLayoutForHostedAnimation](self->_localViewController, "_shouldForceLayoutForHostedAnimation")&& +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    -[UIView layoutIfNeeded](v7, "layoutIfNeeded");
  }

}

- (void)__sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3
{
  id v4;

  -[UIWindow _rootPresentationController](self->_hostedWindow, "_rootPresentationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_hostSheetInteractionDraggingDidBeginWithRubberBandCoefficient:", a3);

}

- (void)__sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  double v8;
  double v9;
  id v10;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  -[UIWindow _rootPresentationController](self->_hostedWindow, "_rootPresentationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_hostSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:", v5, v9, v8, x, y);

}

- (void)__sheetInteractionDraggingDidEnd
{
  id v2;

  -[UIWindow _rootPresentationController](self->_hostedWindow, "_rootPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hostSheetInteractionDraggingDidEnd");

}

- (void)__installDismissInteractionForZoomTransition
{
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setStyles:", 6);
  -[UIViewController view](self->_localViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addInteraction:", v4);

}

- (double)hysteresisForInteraction:(id)a3
{
  return 10.0;
}

- (BOOL)dismissInteraction:(id)a3 shouldBeginWithAxis:(unint64_t)a4 location:(CGPoint)a5 velocity:(CGPoint)a6 proposal:(BOOL)a7
{
  return a7;
}

- (void)dismissInteraction:(id)a3 didBeginAtLocation:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDismissInteractionDidBeginAtLocation:withVelocity:", a3, a4.x, a4.y, a5.x, a5.y);
}

- (id)trackingViewForInteraction:(id)a3
{
  return -[UIViewController view](self->_localViewController, "view", a3);
}

- (void)dismissInteraction:(id)a3 didIssueUpdate:(id)a4
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDismissInteractionDidIssueUpdate:", a4);
}

- (void)dismissInteraction:(id)a3 didDismissWithVelocity:(CGPoint)a4
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDismissInteractionDidDismissWithVelocity:", a3, a4.x, a4.y);
}

- (void)dismissInteraction:(id)a3 didCancelWithVelocity:(CGPoint)a4 originalPosition:(CGPoint)a5
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDismissInteractionDidCancelWithVelocity:originalPosition:", a3, a4.x, a4.y, a5.x, a5.y);
}

- (void)__hostDidEnterBackground
{
  void *v3;

  if (self->_remoteViewControllerProxyToOperator)
  {
    stopStealingStatusBar(self->_hostedWindow);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostDidEnterBackgroundNotification"), self->_localViewController, 0);

    -[UIViewController _hostApplicationDidEnterBackground](self->_localViewController, "_hostApplicationDidEnterBackground");
  }
}

- (void)__hostWillEnterForeground
{
  void *v3;

  if (self->_remoteViewControllerProxyToOperator)
  {
    stealStatusBar(self->_hostStatusBarOrientation, 0, self->_hostedWindow, 1);
    beginInheritingCoreMediaApplicationState(self->_mediaPID);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostWillEnterForegroundNotification"), self->_localViewController, 0);

    -[UIViewController _hostApplicationWillEnterForeground](self->_localViewController, "_hostApplicationWillEnterForeground");
  }
}

- (void)__hostSceneWillEnterForeground
{
  id v3;

  if (self->_remoteViewControllerProxyToOperator)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostSceneWillEnterForegroundNotification"), self->_localViewController, 0);

  }
}

- (void)__hostDidEvaluatePencilBarrelEventFocusForSceneTransition
{
  _UIHostedWindow *hostedWindow;
  id v4;

  if (self->_remoteViewControllerProxyToOperator)
  {
    hostedWindow = self->_hostedWindow;
    if (hostedWindow)
    {
      _UIPencilEventRequestBarrelFocusIfAbleForWindow(hostedWindow, 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostDidEvaluatePencilBarrelEventFocusForSceneTransition"), self->_localViewController, 0);

    }
  }
}

- (void)__hostDidPresentShieldViewForAppProtection
{
  self->_appProtectionShieldPresentedInHost = 1;
  -[UIView setUserInteractionEnabled:](self->_hostedWindow, "setUserInteractionEnabled:", 0);
}

- (void)__hostDidDismissShieldViewForAppProtection
{
  self->_appProtectionShieldPresentedInHost = 0;
  -[UIView setUserInteractionEnabled:](self->_hostedWindow, "setUserInteractionEnabled:", 1);
  -[UIWindow _restoreFirstResponder](self->_hostedWindow, "_restoreFirstResponder");
}

- (void)__hostSceneDidEnterBackground
{
  id v3;

  if (self->_remoteViewControllerProxyToOperator)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostSceneDidEnterBackgroundNotification"), self->_localViewController, 0);

  }
}

- (void)__hostWillResignActive
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostWillResignActiveNotification"), self->_localViewController, 0);

}

- (void)__hostDidBecomeActive
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_UIViewServiceHostDidBecomeActiveNotification"), self->_localViewController, 0);

}

- (void)__hostDidChangeStatusBarOrientationToInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 3 && self->_remoteViewControllerProxyToOperator)
  {
    +[UIKeyboardSceneDelegate setInterfaceOrientation:](UIKeyboardSceneDelegate, "setInterfaceOrientation:");
    if (self->_hostStatusBarOrientation != a3)
    {
      self->_hostStatusBarOrientation = a3;
      stealStatusBar(a3, 0, self->_hostedWindow, self->_hostedWindow != 0);
      -[UIViewController setInterfaceOrientation:](self, "setInterfaceOrientation:", a3);
      -[UIWindow _setWindowInterfaceOrientation:](self->_hostedWindow, "_setWindowInterfaceOrientation:", self->_hostStatusBarOrientation);
    }
  }
}

- (void)__hostDidChangeStatusBarHeight:(double)a3
{
  UIStatusBarStyleAnimationParameters *v4;

  if (a3 >= 0.0 && self->_hostStatusBarHeight != a3)
  {
    self->_hostStatusBarHeight = a3;
    v4 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
    +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
    -[UIStatusBarAnimationParameters setDuration:](v4, "setDuration:");
    stealStatusBar(self->_hostStatusBarOrientation, v4, self->_hostedWindow, self->_hostedWindow != 0);

  }
}

- (id)_viewControllersForRotationCallbacks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[UIWindow _rotationViewControllers](self->_hostedWindow, "_rotationViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController _viewControllersForRotationCallbacks](&v12, sel__viewControllersForRotationCallbacks);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_shouldForwardLegacyRotationOnly
{
  void *v2;
  int v3;

  v2 = (void *)objc_opt_class();
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "doesOverrideViewControllerMethod:", sel_viewWillTransitionToSize_withTransitionCoordinator_);
    if (v3)
    {
      if ((objc_msgSend(v2, "doesOverrideViewControllerMethod:", sel_willRotateToInterfaceOrientation_duration_) & 1) != 0
        || (objc_msgSend(v2, "doesOverrideViewControllerMethod:", sel_willAnimateRotationToInterfaceOrientation_duration_) & 1) != 0)
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = objc_msgSend(v2, "doesOverrideViewControllerMethod:", sel_didRotateFromInterfaceOrientation_);
      }
    }
  }
  return v3;
}

- (void)__hostViewWillTransitionToSize:(CGSize)a3 withContextDescription:(id)a4 boundingPath:(id)a5 statusBarHeight:(double)a6 underlapsStatusBar:(BOOL)a7 fence:(id)a8 timing:(_UIUpdateTiming *)a9 whenDone:(id)a10
{
  _BOOL4 v13;
  CGFloat height;
  double width;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  _UIViewServiceViewControllerOperator *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _UIHostedWindow *v37;
  _UIHostedWindow *v38;
  void *v39;
  uint64_t v40;
  id v41;
  _UIHostedWindow *v42;
  id v43;
  _UIHostedWindow *v44;
  _UIHostedWindow *v45;
  id v46;
  void *v47;
  _UIHostedWindow *v48;
  _UIHostedWindow *v49;
  uint64_t v50;
  uint64_t (**v51)(_QWORD);
  void *v52;
  id v53;
  void *v54;
  _UIViewControllerOneToOneTransitionContext *v55;
  void *v56;
  _BOOL4 v57;
  BOOL v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void (**v69)(void);
  _BOOL4 v70;
  BOOL v71;
  double v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  BOOL v77;
  id v78;
  _QWORD v79[4];
  _UIHostedWindow *v80;
  _QWORD v81[5];
  _UIHostedWindow *v82;
  id v83;
  uint64_t v84;
  _QWORD v85[5];
  id v86;
  double v87;
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  double v92;
  BOOL v93;
  _QWORD v94[4];
  _UIHostedWindow *v95;
  _UIViewServiceViewControllerOperator *v96;
  id v97;
  id v98;
  __n128 *v99;
  uint64_t v100;
  double v101;
  double v102;
  BOOL v103;
  BOOL v104;
  __n128 v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  _QWORD v110[5];
  id v111;
  _QWORD v112[5];
  _UIHostedWindow *v113;
  id v114;
  _QWORD v115[5];
  _QWORD v116[4];
  id v117;
  _UIHostedWindow *v118;
  _UIViewServiceViewControllerOperator *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD v123[4];
  id v124;
  _UIViewServiceViewControllerOperator *v125;
  _UIHostedWindow *v126;
  double v127;
  uint64_t v128;
  double v129;
  _QWORD aBlock[5];
  id v131;
  _UIHostedWindow *v132;
  uint64_t v133;
  double v134;
  CGRect v135;
  CGRect v136;

  v13 = a7;
  height = a3.height;
  width = a3.width;
  v19 = a4;
  v20 = a5;
  v21 = a8;
  v22 = a10;
  if (v21)
  {
    +[UIScene _synchronizeDrawingWithFence:](UIScene, "_synchronizeDrawingWithFence:", v21);
    if (_UIUpdateCycleEnabled())
      *(_QWORD *)&v23 = _UIUpdateSchedulerRequestUpdate((uint64_t)&_UIUpdateCycleMainScheduler, (uint64_t)a9, &v105).n128_u64[0];
  }
  v24 = objc_msgSend(v19, "toOrientation", v23);
  v25 = objc_msgSend(v19, "fromOrientation");
  objc_msgSend(v19, "transitionDuration");
  v27 = v26;
  v28 = self;
  v29 = *MEMORY[0x1E0C9D538];
  v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIViewController view](v28, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v34 = v33;
  v36 = v35;

  v135.origin.x = v29;
  v135.origin.y = v30;
  v135.size.width = width;
  v135.size.height = height;
  v136.origin.x = v29;
  v136.origin.y = v30;
  v136.size.width = v34;
  v136.size.height = v36;
  v77 = CGRectEqualToRect(v135, v136);
  if (v24 == v25)
  {
    v48 = v28->_hostedWindow;
    if (v48)
    {
      v49 = v48;
      v70 = v13;
      v71 = v24 != v25;
      v72 = height;
      v76 = v22;
      v50 = MEMORY[0x1E0C809B0];
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_6;
      v115[3] = &unk_1E16E9068;
      v115[4] = v28;
      v51 = (uint64_t (**)(_QWORD))_Block_copy(v115);
      v112[0] = v50;
      v22 = v76;
      v112[1] = 3221225472;
      v112[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_8;
      v112[3] = &unk_1E16B46D0;
      v112[4] = v28;
      v114 = v76;
      v45 = v49;
      v113 = v45;
      v52 = _Block_copy(v112);

      if (v77)
      {
        v53 = (id)v51[2](v51);
        v75 = v52;
        (*((void (**)(void *))v52 + 2))(v52);
        v54 = &__block_literal_global_551;
LABEL_18:

        goto LABEL_19;
      }
      v67 = v21;
      v74 = v20;
      v68 = &__block_literal_global_551;
      v69 = (void (**)(void))v51;
      v47 = v52;
LABEL_12:
      v55 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
      objc_storeStrong((id *)&v28->_viewControllerTransitioningContext, v55);
      -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v55, "_setFromViewController:", v28);
      -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v55, "_setToViewController:", 0);
      -[_UIViewControllerTransitionContext _setContainerView:](v55, "_setContainerView:", v45);
      -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v55, "_setFromStartFrame:", v29, v30, v34, v36);
      -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v55, "_setToEndFrame:", v29, v30, width, v72);
      -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v55, "_setToStartFrame:", v29, v30, v34, v36);
      -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v55, "_setFromEndFrame:", v29, v30, width, v72);
      -[_UIViewControllerTransitionContext _setRotating:](v55, "_setRotating:", v24 != v25);
      +[_UIWindowAnimationController animationControllerWithWindow:](_UIHostedWindowAnimationController, "animationControllerWithWindow:", v45);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIViewControllerTransitionContext _setIsAnimated:](v55, "_setIsAnimated:", v27 > 0.0);
      -[_UIViewControllerTransitionContext _setAnimator:](v55, "_setAnimator:", v56);
      -[_UIViewControllerTransitionContext _setCompletionCurve:](v55, "_setCompletionCurve:", objc_msgSend(v19, "completionCurve"));
      v110[0] = MEMORY[0x1E0C809B0];
      v110[1] = 3221225472;
      v110[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_9;
      v110[3] = &unk_1E16E90B0;
      v110[4] = v28;
      v75 = v47;
      v111 = v75;
      -[_UIViewControllerTransitionContext _setDidCompleteHandler:](v55, "_setDidCompleteHandler:", v110);
      -[_UIViewControllerTransitionContext _setDuration:](v55, "_setDuration:", v27);
      v57 = -[_UIViewServiceViewControllerOperator _shouldForwardLegacyRotationOnly](v28, "_shouldForwardLegacyRotationOnly");
      v105.n128_u64[0] = 0;
      v105.n128_u64[1] = (unint64_t)&v105;
      v106 = 0x3032000000;
      v107 = __Block_byref_object_copy__224;
      v108 = __Block_byref_object_dispose__224;
      v109 = 0;
      v73 = v56;
      objc_msgSend(v56, "setDuration:", v27);
      v58 = !v77;
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_553;
      v94[3] = &unk_1E16E90D8;
      v103 = v71;
      v45 = v45;
      v100 = v24;
      v104 = !v77;
      v95 = v45;
      v96 = v28;
      v101 = width;
      v102 = v72;
      v59 = v74;
      v97 = v59;
      v78 = v68;
      v98 = v78;
      v99 = &v105;
      objc_msgSend(v73, "setTransitionActions:", v94);
      -[_UIViewServiceViewControllerOperator __setHostViewUnderlapsStatusBar:](v28, "__setHostViewUnderlapsStatusBar:", v70);
      if (v57)
      {
        -[_UIViewServiceViewControllerOperator __hostWillRotateToInterfaceOrientation:duration:skipSelf:](v28, "__hostWillRotateToInterfaceOrientation:duration:skipSelf:", v24, 0, v27);
        -[_UIViewControllerTransitionContext _transitionCoordinator](v55, "_transitionCoordinator");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = MEMORY[0x1E0C809B0];
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_2_554;
        v85[3] = &unk_1E16E9100;
        v93 = v58;
        v85[4] = v28;
        v87 = v29;
        v88 = v30;
        v89 = width;
        v90 = v72;
        v86 = v59;
        v91 = v24;
        v92 = v27;
        v81[0] = v61;
        v81[1] = 3221225472;
        v81[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_3_556;
        v81[3] = &unk_1E16E9128;
        v81[4] = v28;
        v84 = v25;
        v83 = v76;
        v82 = v45;
        objc_msgSend(v60, "animateAlongsideTransition:completion:", v85, v81);

      }
      else
      {
        v69[2]();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = *(void **)(v105.n128_u64[1] + 40);
        *(_QWORD *)(v105.n128_u64[1] + 40) = v62;

        if (v24 == v25)
        {
          -[_UIViewControllerTransitionContext _transitionCoordinator](v55, "_transitionCoordinator");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v79[0] = MEMORY[0x1E0C809B0];
          v79[1] = 3221225472;
          v79[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_4_557;
          v79[3] = &unk_1E16B2150;
          v80 = v45;
          objc_msgSend(v64, "animateAlongsideTransition:completion:", v79, 0);

        }
        -[_UIViewControllerTransitionContext _transitionCoordinator](v55, "_transitionCoordinator");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController _window:viewWillTransitionToSize:withTransitionCoordinator:](v28, "_window:viewWillTransitionToSize:withTransitionCoordinator:", v45, v65, width, v72);

      }
      -[_UIViewControllerTransitionContext _animator](v55, "_animator");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "animateTransition:", v55);

      _Block_object_dispose(&v105, 8);
      v20 = v74;
      v21 = v67;
      v22 = v76;
      v54 = v78;
      v51 = (uint64_t (**)(_QWORD))v69;
      goto LABEL_18;
    }
  }
  else if ((unint64_t)(v24 - 1) <= 3)
  {
    v37 = v28->_hostedWindow;
    if (v37)
    {
      v38 = v37;
      v70 = v13;
      v71 = v24 != v25;
      v72 = height;
      v67 = v21;
      v74 = v20;
      v39 = (void *)-[NSMutableArray copy](v28->_deputyRotationDelegates, "copy");
      v40 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke;
      aBlock[3] = &unk_1E16E8FC8;
      aBlock[4] = v28;
      v133 = v24;
      v41 = v39;
      v131 = v41;
      v134 = v27;
      v42 = v38;
      v132 = v42;
      v69 = (void (**)(void))_Block_copy(aBlock);
      v123[0] = v40;
      v123[1] = 3221225472;
      v123[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_2;
      v123[3] = &unk_1E16E9018;
      v43 = v41;
      v127 = v27;
      v128 = v24;
      v124 = v43;
      v125 = v28;
      v129 = a6;
      v44 = v42;
      v126 = v44;
      v68 = _Block_copy(v123);
      v116[0] = v40;
      v116[1] = 3221225472;
      v116[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_5;
      v116[3] = &unk_1E16E9040;
      v117 = v43;
      v121 = v25;
      v45 = v44;
      v122 = v24;
      v118 = v45;
      v119 = v28;
      v76 = v22;
      v120 = v22;
      v46 = v43;
      v47 = _Block_copy(v116);
      -[UIWindow _setToWindowOrientation:](v45, "_setToWindowOrientation:", v24);
      -[UIWindow _setFromWindowOrientation:](v45, "_setFromWindowOrientation:", v25);

      goto LABEL_12;
    }
  }
LABEL_19:

}

- (void)__hostWillRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4 skipSelf:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _UIViewServiceViewControllerOperator *localViewController;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  _UIHostedWindow *hostedWindow;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  -[_UIViewServiceViewControllerOperator _viewControllersForRotationCallbacks](self, "_viewControllersForRotationCallbacks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        localViewController = *(_UIViewServiceViewControllerOperator **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (localViewController == self)
        {
          if (!v5)
            -[UIViewController willRotateToInterfaceOrientation:duration:](self, "willRotateToInterfaceOrientation:duration:", a3, a4);
          localViewController = (_UIViewServiceViewControllerOperator *)self->_localViewController;
        }
        -[UIViewController _willRotateToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:](localViewController, "_willRotateToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", a3, -[UIViewController _forwardRotationMethods](localViewController, "_forwardRotationMethods"), v5, a4);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }
  -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)self, a3);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = self->_deputyRotationDelegates;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "willRotateToInterfaceOrientation:duration:", a3, a4);
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  hostedWindow = self->_hostedWindow;
  v22 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, CFSTR("UIWindowNewOrientationUserInfoKey"), 0, (_QWORD)v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotificationName:object:userInfo:", CFSTR("UIWindowWillRotateNotification"), hostedWindow, v24);

}

- (void)__hostWillAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4 skipSelf:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _UIViewServiceViewControllerOperator *localViewController;
  void *v15;
  void *v16;
  _BOOL8 v17;
  _QWORD v18[7];
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  -[_UIViewServiceViewControllerOperator _viewControllersForRotationCallbacks](self, "_viewControllersForRotationCallbacks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        localViewController = *(_UIViewServiceViewControllerOperator **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[UIViewController view](localViewController, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "layoutBelowIfNeeded");

        if (localViewController == self)
        {
          if (!v5)
            -[UIViewController willAnimateRotationToInterfaceOrientation:duration:](self, "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);
          localViewController = (_UIViewServiceViewControllerOperator *)self->_localViewController;
        }
        -[UIViewController _willAnimateRotationToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:](localViewController, "_willAnimateRotationToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", a3, -[UIViewController _forwardRotationMethods](localViewController, "_forwardRotationMethods"), v5, a4);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  v17 = -[NSMutableArray count](self->_deputyRotationDelegates, "count") != 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __106___UIViewServiceViewControllerOperator___hostWillAnimateRotationToInterfaceOrientation_duration_skipSelf___block_invoke;
  v19[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
  *(double *)&v19[4] = a4;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __106___UIViewServiceViewControllerOperator___hostWillAnimateRotationToInterfaceOrientation_duration_skipSelf___block_invoke_2;
  v18[3] = &unk_1E16B4E70;
  v18[4] = self;
  v18[5] = a3;
  *(double *)&v18[6] = a4;
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v17, v19, v18, 0);

}

- (void)__hostDidRotateFromInterfaceOrientation:(int64_t)a3 skipSelf:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _UIViewServiceViewControllerOperator *localViewController;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  _UIHostedWindow *hostedWindow;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  -[_UIViewServiceViewControllerOperator _viewControllersForRotationCallbacks](self, "_viewControllersForRotationCallbacks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        localViewController = *(_UIViewServiceViewControllerOperator **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (localViewController == self)
        {
          if (!v4)
            -[UIViewController didRotateFromInterfaceOrientation:](self, "didRotateFromInterfaceOrientation:", a3);
          localViewController = (_UIViewServiceViewControllerOperator *)self->_localViewController;
        }
        -[UIViewController _didRotateFromInterfaceOrientation:forwardToChildControllers:skipSelf:](localViewController, "_didRotateFromInterfaceOrientation:forwardToChildControllers:skipSelf:", a3, -[UIViewController _forwardRotationMethods](localViewController, "_forwardRotationMethods"), v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = self->_deputyRotationDelegates;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "finishRotationFromInterfaceOrientation:", a3);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  hostedWindow = self->_hostedWindow;
  v20 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v21, CFSTR("UIWindowOldOrientationUserInfoKey"), 0, (_QWORD)v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("UIWindowDidRotateNotification"), hostedWindow, v22);

}

- (id)_supportedInterfaceOrientationsForViewController:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "supportedInterfaceOrientations");
  self->_supportedOrientations = v4;
  return _supportedInterfaceOrientationsForMask(v4);
}

- (void)__createViewControllerWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  _UIViewServiceViewControllerOperator *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  os_signpost_id_t v33;
  os_signpost_id_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  NSArray *pluginDisplayConfigurations;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  unint64_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  _BOOL4 v68;
  _UIViewServiceViewControllerOperator *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  UIViewController *localViewController;
  id v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  unint64_t v82;
  NSObject *v83;
  const char *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  BOOL v88;
  void *v89;
  UIViewController *v90;
  unint64_t v91;
  NSObject *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  unint64_t v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  Class v111;
  objc_class *v112;
  UIViewController *v113;
  UIViewController *v114;
  Class v115;
  objc_class *v116;
  UIViewController *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  unint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  unint64_t v129;
  NSObject *v130;
  const char *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  unint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  unint64_t v142;
  UIViewController *v143;
  void *v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  int v153;
  __objc2_class **v154;
  _OWORD *v155;
  __int128 v156;
  void *v157;
  uint64_t v158;
  _UIViewServiceSessionActivityRecord *sessionActivityRecord;
  uint64_t v160;
  BSInvalidatable *physicalButtonInteractionArbiterObserverToken;
  id *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  mach_port_name_t v169;
  mach_port_name_t v170;
  mach_port_name_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  _OWORD *v176;
  id v177;
  unint64_t v178;
  NSObject *v179;
  os_signpost_id_t v180;
  os_signpost_id_t v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  id *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;
  void *v193;
  void (**v194)(_QWORD, _QWORD, _QWORD);
  NSString *aClassName;
  void *v196;
  void *v197;
  _UIViewServiceViewControllerOperator *v198;
  void *v199;
  void *v200;
  void *v201;
  int v202;
  void *v203;
  id v204;
  int v205;
  UIViewController *v206;
  void *v207;
  _QWORD v208[4];
  id v209;
  _UIViewServiceViewControllerOperator *v210;
  id v211;
  void (**v212)(_QWORD, _QWORD, _QWORD);
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  UIViewController *v217;
  const __CFString *v218;
  void *v219;
  const __CFString *v220;
  void *v221;
  const __CFString *v222;
  void *v223;
  const __CFString *v224;
  void *v225;
  const __CFString *v226;
  void *v227;
  const __CFString *v228;
  const __CFString *v229;
  const __CFString *v230;
  void *v231;
  uint8_t v232[128];
  uint8_t buf[4];
  uint64_t v234;
  __int16 v235;
  uint64_t v236;
  __int16 v237;
  void *v238;
  uint64_t v239;

  v239 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "viewControllerClassName");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = objc_msgSend(WeakRetained, "requiresExtensionContextForViewControllerOperator:", self);
  v202 = objc_msgSend(WeakRetained, "isExtensionServiceViewControllerOperator:", self);
  v11 = qword_1ECD7A000;
  if (!qword_1ECD7A000)
  {
    v11 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&qword_1ECD7A000);
  }
  v207 = WeakRetained;
  v12 = *(id *)(v11 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = self;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = v10;
      v17 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v14);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v9 = v17;
      v10 = v16;
    }
    else
    {
      v19 = CFSTR("(nil)");
    }
    *(_DWORD *)buf = 138543874;
    v234 = (uint64_t)v19;
    v235 = 2114;
    v236 = v9;
    v237 = 2114;
    v238 = v10;
    _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Received request to create view controller: self: %{public}@; class: %{public}@; contextToken: %{public}@",
      buf,
      0x20u);

  }
  objc_msgSend(v6, "displayConfigurations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializedAppearanceRepresentations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _unobscuredTraitCollectionFromTraitCollection(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v6, "initialInterfaceOrientation");
  objc_msgSend(v6, "hostAccessibilityServerPort");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v6, "availableTextServices");
  if (!self->_localViewController)
  {
    v184 = v24;
    v182 = v26;
    v200 = v20;
    v201 = v10;
    v31 = qword_1ECD7A010;
    if (!qword_1ECD7A010)
    {
      v31 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v31, (unint64_t *)&qword_1ECD7A010);
    }
    v193 = v25;
    v194 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
    v191 = v21;
    v192 = v6;
    v196 = (void *)v9;
    v32 = *(id *)(v31 + 8);
    v33 = os_signpost_id_make_with_pointer(*(os_log_t *)(v31 + 8), self);
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v34 = v33;
      if (os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v34, "VCOperatorCreateViewController", ", buf, 2u);
      }
    }

    v186 = v23;
    v204 = v23;
    v183 = (void *)_UISetCurrentFallbackEnvironment(v204);
    v198 = self;
    self->_editAlertToken = 0;
    objc_msgSend((id)UIApp, "_forceEndIgnoringInteractionEvents");
    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    v35 = v200;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v213, v232, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v214;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v214 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * i);
          if ((_UIApplicationIsExtension() & 1) != 0)
            v41 = 0;
          else
            v41 = objc_msgSend((id)UIApp, "_hasCalledRunWithMainScene") ^ 1;
          +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v40, v41);
          if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0
            && (_UIApplicationIsExtension() & 1) == 0)
          {
            objc_msgSend(v40, "identity");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = +[UIWindowScene _placeholderWindowSceneForScreen:create:](UIWindowScene, "_placeholderWindowSceneForScreen:create:", v43, 1);

          }
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v213, v232, 16);
      }
      while (v37);
    }

    v45 = objc_msgSend(v35, "copy");
    pluginDisplayConfigurations = v198->_pluginDisplayConfigurations;
    v198->_pluginDisplayConfigurations = (NSArray *)v45;

    objc_msgSend((id)UIApp, "delegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_opt_respondsToSelector();

    v49 = v196;
    if ((v48 & 1) != 0)
    {
      objc_msgSend((id)UIApp, "delegate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "_application:didReceiveViewServiceRequestForViewControllerClassName:", UIApp, v196);

    }
    v10 = v201;
    v51 = v205;
    if (!v201)
      v51 = 0;
    if (v51 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3B70], "_sharedExtensionContextVendor");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "_extensionContextForUUID:", v201);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v204;
      if (v52)
      {
        v54 = (void *)v52;
        v6 = v192;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find extensionContext for contextToken: %@. This is indicative of a host issue, where it may have crashed or invalidated the connection before the view service request completed."), v201);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0CB35C8];
        v57 = *MEMORY[0x1E0CB28A8];
        v230 = CFSTR("Unable to find NSExtensionContext");
        v231 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v231, &v230, 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "errorWithDomain:code:userInfo:", v57, 967225, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = qword_1ECD7A018;
        v6 = v192;
        if (!qword_1ECD7A018)
        {
          v60 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v60, (unint64_t *)&qword_1ECD7A018);
        }
        v61 = *(NSObject **)(v60 + 8);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v234 = (uint64_t)v59;
          _os_log_impl(&dword_185066000, v61, OS_LOG_TYPE_ERROR, "Rejecting view controller creation request due to missing context for token: %{public}@", buf, 0xCu);
        }
        (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v59);

        v54 = 0;
        v49 = v196;
        v53 = v204;
      }
    }
    else
    {
      v190 = 0;
      v54 = 0;
      v6 = v192;
      v53 = v204;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_UIViewServiceViewControllerOperator delegate](v198, "delegate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "viewControllerClassNameForViewControllerOperator:", v198);
      v63 = objc_claimAutoreleasedReturnValue();

      -[_UIViewServiceViewControllerOperator delegate](v198, "delegate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "containingViewControllerClassNameForViewControllerOperator:", v198);
      v65 = objc_claimAutoreleasedReturnValue();

      -[_UIViewServiceViewControllerOperator delegate](v198, "delegate");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "mainStoryboardNameForViewControllerOperator:", v198);
      v67 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v67 = 0;
      v65 = 0;
      v63 = 0;
    }
    aClassName = (NSString *)v65;
    v188 = (void *)v63;
    v189 = v54;
    v187 = (void *)v67;
    if (v54 || ((v202 ^ 1 | v205) & 1) == 0)
    {
      v68 = v67 == 0;
      if (v68 == (v63 == 0))
      {
        v76 = v49;
        if (v67 | v63)
          v77 = CFSTR("Either NSExtensionMainStoryboard or NSExtensionPrincipalClass must be specified in the extension's Info.plist file but not both.");
        else
          v77 = CFSTR("Either NSExtensionMainStoryboard or NSExtensionPrincipalClass must be specified in the extension's Info.plist");
        v78 = (void *)MEMORY[0x1E0CB35C8];
        v79 = *MEMORY[0x1E0CB28A8];
        v228 = CFSTR("Invalid Configuration");
        v229 = v77;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v229, &v228, 1);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "errorWithDomain:code:userInfo:", v79, 967223, v80);
        v81 = objc_claimAutoreleasedReturnValue();

        v82 = qword_1ECD7A020;
        if (!qword_1ECD7A020)
        {
          v82 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v82, (unint64_t *)&qword_1ECD7A020);
        }
        v27 = v76;
        v83 = *(NSObject **)(v82 + 8);
        v20 = v200;
        v21 = v191;
        v25 = v193;
        if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          goto LABEL_107;
        *(_DWORD *)buf = 138543362;
        v234 = v81;
        v84 = "Rejecting view controller creation request due to invalid extension storyboard or principal class: %{public}@";
        goto LABEL_106;
      }
      if (v67)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", v67, v70);
        v71 = v63;
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = v204;
        objc_msgSend(v72, "instantiateInitialViewController");
        v73 = objc_claimAutoreleasedReturnValue();
        v69 = v198;
        localViewController = v198->_localViewController;
        v198->_localViewController = (UIViewController *)v73;

        v75 = 0;
        v49 = v72;
        v63 = v71;
      }
      else
      {
        v75 = (id)v63;
        v69 = v198;
      }

      v49 = v75;
    }
    else
    {
      v68 = 1;
      v69 = v198;
    }
    -[_UIViewServiceViewControllerOperator __hostDidChangeStatusBarOrientationToInterfaceOrientation:](v69, "__hostDidChangeStatusBarOrientationToInterfaceOrientation:", v184);
    objc_msgSend((id)UIApp, "_findUISceneForLegacyInterfaceOrientation");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v85 && v184 == 1)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "_interfaceOrientation");

      v88 = v87 == 1;
      v53 = v204;
      if (v88)
        goto LABEL_70;
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "_setInterfaceOrientation:", 1);
    }

LABEL_70:
    v10 = v201;
    if (!v68)
      goto LABEL_87;
    if (!v63)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "objectForInfoDictionaryKey:", CFSTR("UIViewServicePermittedViewControllerClasses"));
      v90 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v206 = v90;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((-[UIViewController containsObject:](v90, "containsObject:", v49) & 1) == 0)
        {
          v91 = qword_1ECD7A028;
          if (!qword_1ECD7A028)
          {
            v91 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v91, (unint64_t *)&qword_1ECD7A028);
          }
          v92 = *(NSObject **)(v91 + 8);
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            v93 = (void *)MEMORY[0x1E0CB34D0];
            v94 = v92;
            objc_msgSend(v93, "mainBundle");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "bundleIdentifier");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v234 = (uint64_t)v49;
            v235 = 2112;
            v236 = (uint64_t)v96;
            _os_log_impl(&dword_185066000, v94, OS_LOG_TYPE_ERROR, "Refusing request for view controller of class \"%@\" not included in \"UIViewServicePermittedViewControllerClasses\" array in View Service bundle \"%@\"'s Info.plist", buf, 0x16u);

          }
          v97 = (void *)MEMORY[0x1E0CB35C8];
          v98 = *MEMORY[0x1E0CB28A8];
          v226 = CFSTR("Class Not Permitted");
          v99 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "bundleIdentifier");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v49;
          objc_msgSend(v99, "stringWithFormat:", CFSTR("Refusing request for view controller of class \"%@\" not included in \"UIViewServicePermittedViewControllerClasses\" array in View Service bundle \"%@\"'s Info.plist"), v49, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v227 = v102;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v227, &v226, 1);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "errorWithDomain:code:userInfo:", v98, 967224, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v194)[2](v194, 0, v104);

          v7 = v194;
          v20 = v200;
          v10 = v201;
          v21 = v191;
          v23 = v186;
          v25 = v193;
          goto LABEL_143;
        }
      }
      else
      {
        v105 = qword_1ECD7A030;
        if (!qword_1ECD7A030)
        {
          v105 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v105, (unint64_t *)&qword_1ECD7A030);
        }
        v106 = *(NSObject **)(v105 + 8);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          v107 = (void *)MEMORY[0x1E0CB34D0];
          v108 = v106;
          objc_msgSend(v107, "mainBundle");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "bundleIdentifier");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v234 = (uint64_t)v110;
          v235 = 2112;
          v236 = (uint64_t)v49;
          _os_log_impl(&dword_185066000, v108, OS_LOG_TYPE_ERROR, "No \"UIViewServicePermittedViewControllerClasses\" array in View Service bundle \"%@\"'s Info.plist. Cannot check validity of request for class \"%@\". This will become failure in a future build.", buf, 0x16u);

          v53 = v204;
        }
      }

    }
    v111 = NSClassFromString((NSString *)v49);
    if (v111)
    {
      v112 = v111;
      if ((-[objc_class isSubclassOfClass:](v111, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        v113 = (UIViewController *)objc_alloc_init(v112);
        v114 = v69->_localViewController;
        v69->_localViewController = v113;

LABEL_87:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v207, "viewControllerOperator:didCreateServiceViewController:contextToken:", v69, v69->_localViewController, v201);
        v206 = v69->_localViewController;
        if (!aClassName)
          goto LABEL_116;
        v115 = NSClassFromString(aClassName);
        if (v115)
        {
          v116 = v115;
          if ((-[objc_class isSubclassOfClass:](v115, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
          {
            v117 = (UIViewController *)objc_alloc_init(v116);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v217 = v69->_localViewController;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v217, 1);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIViewController setViewControllers:](v117, "setViewControllers:", v118);

            }
            else
            {
              -[UIViewController willMoveToParentViewController:](v69->_localViewController, "willMoveToParentViewController:", v117);
              -[UIViewController addChildViewController:](v117, "addChildViewController:", v69->_localViewController);
            }
            v143 = v69->_localViewController;
            v69->_localViewController = v117;

            v53 = v204;
LABEL_116:
            -[UIViewController addChildViewController:](v69, "addChildViewController:", v69->_localViewController);
            if (v54)
            {
              objc_msgSend(v190, "_setPrincipalObject:forUUID:", v206, v201);
              -[UIViewController beginRequestWithExtensionContext:](v69->_localViewController, "beginRequestWithExtensionContext:", v54);
            }
            v197 = v49;
            -[UIViewController preferredContentSize](v69->_localViewController, "preferredContentSize");
            -[UIViewController setPreferredContentSize:](v69, "setPreferredContentSize:");
            +[UIScreen mainScreen](UIScreen, "mainScreen");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "bounds");
            v146 = v145;
            v148 = v147;
            v150 = v149;
            v152 = v151;
            v153 = objc_msgSend((id)objc_opt_class(), "_isSecureForRemoteViewService");
            v154 = off_1E167CD88;
            if (!v153)
              v154 = off_1E167C688;
            v155 = (_OWORD *)objc_msgSend(objc_alloc(*v154), "initWithFrame:", v146, v148, v150, v152);
            objc_storeStrong((id *)&v69->_hostedWindow, v155);
            -[_UIHostedWindow _setHostBundleIdentifier:]((uint64_t)v155, v69->_hostBundleID);
            if (v155)
            {
              v156 = *(_OWORD *)&v69->_hostAuditToken.val[4];
              v155[60] = *(_OWORD *)v69->_hostAuditToken.val;
              v155[61] = v156;
              objc_msgSend(v155, "_updateStrictTouchVerificationIfNecessary");
            }
            objc_msgSend(v155, "_setHostTraitCollection:", v53);
            +[UIWindowScene _unassociatedWindowSceneForScreen:create:](UIWindowScene, "_unassociatedWindowSceneForScreen:create:", v144, 1);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v155, "setWindowScene:", v157);
            objc_msgSend(v155, "setRootViewController:", v69);
            objc_msgSend(v155, "setBackgroundColor:", 0);
            objc_msgSend(v155, "setHidden:", 0);
            objc_msgSend(v155, "makeKeyWindow");
            -[_UIViewServiceViewControllerOperator _installActivityObserverGestureIfNeeded](v69, "_installActivityObserverGestureIfNeeded");
            v203 = v144;
            +[_UIViewServiceSessionActivityRecord activityRecordForProvider:userInterfaceIdiom:]((uint64_t)_UIViewServiceSessionActivityRecord, v69, objc_msgSend(v144, "_userInterfaceIdiom"));
            v158 = objc_claimAutoreleasedReturnValue();
            sessionActivityRecord = v69->_sessionActivityRecord;
            v69->_sessionActivityRecord = (_UIViewServiceSessionActivityRecord *)v158;

            v199 = v157;
            objc_msgSend(v157, "_physicalButtonInteractionArbiter");
            v185 = (id *)objc_claimAutoreleasedReturnValue();
            -[_UIPhysicalButtonInteractionArbiter _registerViewServiceObserver:](v185, v69);
            v160 = objc_claimAutoreleasedReturnValue();
            physicalButtonInteractionArbiterObserverToken = v69->_physicalButtonInteractionArbiterObserverToken;
            v69->_physicalButtonInteractionArbiterObserverToken = (BSInvalidatable *)v160;

            +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker");
            v162 = (id *)objc_claimAutoreleasedReturnValue();
            -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v162, 1uLL, v155, v69, (uint64_t)v69->_sessionActivityRecord);

            objc_msgSend(v155, "_rootPresentationController");
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "setDelegate:", v69);

            -[_UIViewServiceViewControllerOperator _appearanceSource](v69, "_appearanceSource");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            +[_UIAppearance _addWindow:forSource:](_UIAppearance, "_addWindow:forSource:", v155, v164);
            v165 = v164;
            UIViewServiceUpdateAppearanceWithSerializedRepresentations(v191, 0, v164);
            v166 = 0;
            v6 = v192;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v167 = objc_msgSend((id)UIApp, "_accessibilityMachPort");
              if ((_DWORD)v167)
              {
                v168 = v167;
                mach_port_insert_right(*MEMORY[0x1E0C83DA0], v168, v168, 0x14u);
                v166 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D017A0]), "initWithPort:", v168);
              }
              else
              {
                v166 = 0;
              }
            }
            if (v193)
            {
              v169 = objc_msgSend(v193, "extractPortAndIKnowWhatImDoingISwear");
              if (v169 - 1 <= 0xFFFFFFFD)
              {
                v170 = v169;
                if (mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v169, 0, 1))
                  v171 = 0;
                else
                  v171 = v170;
                v69->_hostAccessibilityServerPort = v171;
              }
            }
            v69->_availableTextServices = v182;
            -[UIViewController view](v69->_localViewController, "view");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            if (dyld_program_sdk_at_least())
            {
              objc_msgSend(v172, "setAutoresizingMask:", 18);
              -[UIViewController view](v69, "view");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v173, "bounds");
              objc_msgSend(v172, "setFrame:");

            }
            -[UIViewController view](v69, "view");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "addSubview:", v172);

            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v207, "viewControllerOperator:didCreateServiceViewControllerOfClass:", v69, objc_opt_class());
            v175 = (void *)UIApp;
            v208[0] = MEMORY[0x1E0C809B0];
            v208[1] = 3221225472;
            v208[2] = __90___UIViewServiceViewControllerOperator___createViewControllerWithOptions_completionBlock___block_invoke;
            v208[3] = &unk_1E16B4420;
            v176 = v155;
            v209 = v176;
            v210 = v69;
            v177 = v166;
            v211 = v177;
            v212 = v194;
            objc_msgSend(v175, "_performBlockAfterCATransactionCommits:", v208);
            _UIRestorePreviousFallbackEnvironment(v183);
            v178 = qword_1ECD7A058;
            if (!qword_1ECD7A058)
            {
              v178 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v178, (unint64_t *)&qword_1ECD7A058);
            }
            v179 = *(id *)(v178 + 8);
            v180 = os_signpost_id_make_with_pointer(*(os_log_t *)(v178 + 8), v69);
            v25 = v193;
            if (v180 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v181 = v180;
              if (os_signpost_enabled(v179))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_185066000, v179, OS_SIGNPOST_INTERVAL_END, v181, "VCOperatorCreateViewController", ", buf, 2u);
              }
            }
            v27 = v197;

            v7 = v194;
            v20 = v200;
            v10 = v201;
            v21 = v191;
            v23 = v186;
            v128 = v203;
            goto LABEL_142;
          }
          v27 = v49;
          v138 = (void *)MEMORY[0x1E0CB35C8];
          v139 = *MEMORY[0x1E0CB28A8];
          v218 = CFSTR("Class Not UIViewController subclass");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ specified as the containing controller class, but that class is not a subclass of UIViewController"), aClassName);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          v219 = v140;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "errorWithDomain:code:userInfo:", v139, 967221, v141);
          v128 = (void *)objc_claimAutoreleasedReturnValue();

          v142 = qword_1ECD7A050;
          if (!qword_1ECD7A050)
          {
            v142 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v142, (unint64_t *)&qword_1ECD7A050);
          }
          v130 = *(NSObject **)(v142 + 8);
          v20 = v200;
          v21 = v191;
          v25 = v193;
          if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          {
LABEL_113:
            v7 = v194;
            ((void (**)(_QWORD, _QWORD, void *))v194)[2](v194, 0, v128);
LABEL_142:

LABEL_143:
            v28 = v204;
            v137 = v206;
            goto LABEL_144;
          }
          *(_DWORD *)buf = 138543362;
          v234 = (uint64_t)v128;
          v131 = "Rejecting view controller creation request as specified class is not a view controller subclass: %{public}@";
        }
        else
        {
          v27 = v49;
          v124 = (void *)MEMORY[0x1E0CB35C8];
          v125 = *MEMORY[0x1E0CB28A8];
          v220 = CFSTR("Class Not Found");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ specified as the containing controller class, but that class was not found"), aClassName);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v221 = v126;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "errorWithDomain:code:userInfo:", v125, 967220, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();

          v129 = qword_1ECD7A048;
          if (!qword_1ECD7A048)
          {
            v129 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v129, (unint64_t *)&qword_1ECD7A048);
          }
          v130 = *(NSObject **)(v129 + 8);
          v20 = v200;
          v21 = v191;
          v25 = v193;
          if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
            goto LABEL_113;
          *(_DWORD *)buf = 138543362;
          v234 = (uint64_t)v128;
          v131 = "Rejecting view controller creation request as view controller class is not present: %{public}@";
        }
        _os_log_impl(&dword_185066000, v130, OS_LOG_TYPE_ERROR, v131, buf, 0xCu);
        goto LABEL_113;
      }
      v132 = (void *)MEMORY[0x1E0CB35C8];
      v133 = *MEMORY[0x1E0CB28A8];
      v222 = CFSTR("Class Not UIViewController subclass");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Service Side Class %@ not UIViewControllerSubclass"), v49);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v223 = v134;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v223, &v222, 1);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "errorWithDomain:code:userInfo:", v133, 967221, v135);
      v27 = v49;
      v81 = objc_claimAutoreleasedReturnValue();

      v136 = qword_1ECD7A040;
      if (!qword_1ECD7A040)
      {
        v136 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v136, (unint64_t *)&qword_1ECD7A040);
      }
      v83 = *(NSObject **)(v136 + 8);
      v20 = v200;
      v21 = v191;
      v25 = v193;
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
LABEL_107:
        v7 = v194;
        v137 = (void *)v81;
        v194[2](v194, 0, v81);
        v28 = v204;
LABEL_144:

        goto LABEL_145;
      }
      *(_DWORD *)buf = 138543362;
      v234 = v81;
      v84 = "Rejecting view controller creation request as specified class is not a view controller subclass: %{public}@";
    }
    else
    {
      v119 = (void *)MEMORY[0x1E0CB35C8];
      v120 = *MEMORY[0x1E0CB28A8];
      v224 = CFSTR("Class Not Found");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("View Controller Class %@ not found service side"), v49);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = v121;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v225, &v224, 1);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "errorWithDomain:code:userInfo:", v120, 967220, v122);
      v27 = v49;
      v81 = objc_claimAutoreleasedReturnValue();

      v123 = qword_1ECD7A038;
      if (!qword_1ECD7A038)
      {
        v123 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v123, (unint64_t *)&qword_1ECD7A038);
      }
      v83 = *(NSObject **)(v123 + 8);
      v20 = v200;
      v21 = v191;
      v25 = v193;
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        goto LABEL_107;
      *(_DWORD *)buf = 138543362;
      v234 = v81;
      v84 = "Rejecting view controller creation request as view controller class is not present: %{public}@";
    }
LABEL_106:
    _os_log_impl(&dword_185066000, v83, OS_LOG_TYPE_ERROR, v84, buf, 0xCu);
    goto LABEL_107;
  }
  v27 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 967219, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = qword_1ECD7A008;
  if (!qword_1ECD7A008)
  {
    v29 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v29, (unint64_t *)&qword_1ECD7A008);
  }
  v30 = *(NSObject **)(v29 + 8);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v234 = (uint64_t)v28;
    _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "Rejecting view controller creation request as connection has an existing instantiated view controller: %{public}@", buf, 0xCu);
  }
  (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v28);
LABEL_145:

}

- (void)__exchangeAccessibilityPortInformation:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  mach_port_name_t v14;
  mach_port_name_t v15;
  unsigned int v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0C9AFE0];
    v18[0] = CFSTR("Remote service does not respond to _accessibilityMachPort");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("Accessibility"), 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v13);

LABEL_6:
    v10 = 0;
    if (!v6)
      goto LABEL_12;
    goto LABEL_7;
  }
  v8 = objc_msgSend((id)UIApp, "_accessibilityMachPort");
  if (!(_DWORD)v8)
    goto LABEL_6;
  v9 = v8;
  mach_port_insert_right(*MEMORY[0x1E0C83DA0], v9, v9, 0x14u);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D017A0]), "initWithPort:", v9);
  if (!v6)
    goto LABEL_12;
LABEL_7:
  v14 = objc_msgSend(v6, "extractPortAndIKnowWhatImDoingISwear");
  if (v14 - 1 <= 0xFFFFFFFD)
  {
    v15 = v14;
    if (mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v14, 0, 1))
      v16 = 0;
    else
      v16 = v15;
    self->_hostAccessibilityServerPort = v16;
  }
LABEL_12:
  ((void (**)(id, void *, void *))v7)[2](v7, v10, 0);

}

- (void)__setMediaOverridePID:(int)a3
{
  self->_mediaPID = a3;
  beginInheritingCoreMediaApplicationState(*(uint64_t *)&a3);
}

- (void)__setContentSize:(CGSize)a3 boundingPath:(id)a4 withFence:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  id v12;

  height = a3.height;
  width = a3.width;
  v12 = a4;
  if (a5)
  {
    v9 = a5;
    -[_UIViewServiceViewControllerOperator _window](self, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_windowHostingScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_synchronizeDrawingWithFence:", v9);

  }
  -[_UIViewServiceViewControllerOperator __setContentSize:boundingPath:](self, "__setContentSize:boundingPath:", v12, width, height);

}

- (void)__setContentSize:(CGSize)a3 boundingPath:(id)a4
{
  double height;
  double width;
  id v7;
  unint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  _UIHostedWindow *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _UIViewControllerOneToOneTransitionContext *v27;
  void *v28;
  void *v29;
  id WeakRetained;
  unint64_t v31;
  NSObject *v32;
  os_signpost_id_t v33;
  os_signpost_id_t v34;
  uint8_t v35[16];
  uint8_t buf[16];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = qword_1ECD7A060;
  if (!qword_1ECD7A060)
  {
    v8 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&qword_1ECD7A060);
  }
  v9 = *(id *)(v8 + 8);
  v10 = os_signpost_id_make_with_pointer(*(os_log_t *)(v8 + 8), self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VCOperatorSetContentSize", ", buf, 2u);
    }
  }

  v12 = self->_hostedWindow;
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIView frame](v12, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UIWindow setFrame:](v12, "setFrame:", v13, v14, width, height);
  -[_UIViewServiceViewControllerOperator __setBoundingPath:](self, "__setBoundingPath:", v7);

  -[UIView layoutBelowIfNeeded](v12, "layoutBelowIfNeeded");
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIViewController _existingView](self, "_existingView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v13, v14, width, height);

    -[UIViewController _existingView](self->_localViewController, "_existingView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v13, v14, width, height);

    -[UIViewController _existingView](self, "_existingView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layoutBelowIfNeeded");

    -[UIViewController _existingView](self->_localViewController, "_existingView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutBelowIfNeeded");

  }
  -[UIViewController window:willAnimateFromContentFrame:toContentFrame:](self, "window:willAnimateFromContentFrame:toContentFrame:", v12, v16, v18, v20, v22, v13, v14, width, height);
  if (!self->_viewControllerTransitioningContext)
  {
    v27 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
    -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v27, "_setFromViewController:", self);
    -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v27, "_setToViewController:", 0);
    -[_UIViewControllerTransitionContext _setContainerView:](v27, "_setContainerView:", v12);
    -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v27, "_setFromStartFrame:", v16, v18, v20, v22);
    -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v27, "_setToEndFrame:", v13, v14, width, height);
    -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v27, "_setToStartFrame:", v16, v18, v20, v22);
    -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v27, "_setFromEndFrame:", v13, v14, width, height);
    -[_UIViewControllerTransitionContext _setRotating:](v27, "_setRotating:", 0);
    +[_UIWindowAnimationController animationControllerWithWindow:](_UIHostedWindowAnimationController, "animationControllerWithWindow:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewControllerTransitionContext _setIsAnimated:](v27, "_setIsAnimated:", 0);
    -[_UIViewControllerTransitionContext _setAnimator:](v27, "_setAnimator:", v28);
    -[_UIViewControllerTransitionContext _transitionCoordinator](v27, "_transitionCoordinator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _window:viewWillTransitionToSize:withTransitionCoordinator:](self, "_window:viewWillTransitionToSize:withTransitionCoordinator:", v12, v29, width, height);
    objc_msgSend(v28, "animateTransition:", v27);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dummyPopoverController);
  objc_msgSend(WeakRetained, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v12, 4, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  v31 = qword_1ECD7A068;
  if (!qword_1ECD7A068)
  {
    v31 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v31, (unint64_t *)&qword_1ECD7A068);
  }
  v32 = *(id *)(v31 + 8);
  v33 = os_signpost_id_make_with_pointer(*(os_log_t *)(v31 + 8), self);
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v34 = v33;
    if (os_signpost_enabled(v32))
    {
      *(_WORD *)v35 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v32, OS_SIGNPOST_INTERVAL_END, v34, "VCOperatorSetContentSize", ", v35, 2u);
    }
  }

}

- (void)__setBoundingPath:(id)a3
{
  id v4;
  _UIHostedWindow *v5;
  _UIRectangularBoundingPath *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v4 = a3;
  v5 = self->_hostedWindow;
  if (v5)
  {
    objc_msgSend(v4, "setCoordinateSpace:", v5);
    if ((objc_msgSend(v4, "validateForCoordinateSpace") & 1) == 0)
    {
      v6 = [_UIRectangularBoundingPath alloc];
      -[UIView bounds](v5, "bounds");
      v7 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v6, "initWithCoordinateSpace:boundingRect:", v5);

      v4 = (id)v7;
    }
    -[UIView _setBoundingPath:](v5, "_setBoundingPath:", v4);
    v23 = 0;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    v15 = 0u;
    v14 = 0u;
    v13 = 0u;
    v12 = 0u;
    v11 = 0u;
    v10 = 0u;
    v9 = 0u;
    v8 = 32;
    -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)v5, &v8);
  }

}

- (void)__hostDidPromoteFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  _UIHostedWindow *v9;

  if (!-[UIResponder _disableAutomaticKeyboardBehavior](self->_localViewController, "_disableAutomaticKeyboardBehavior"))
  {
    v9 = self->_hostedWindow;
    -[UIWindow windowScene](v9, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIWindow _setIsResigningFirstResponderFromHost:](v9, "_setIsResigningFirstResponderFromHost:", 1);
    -[UIWindow firstResponder](v9, "firstResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

    objc_msgSend(v4, "responder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIResponder _containsResponder:](v9, "_containsResponder:", v6);

    if (v7)
      objc_msgSend(v4, "_reloadInputViewsForResponder:", 0);
    -[UIWindow _setIsResigningFirstResponderFromHost:](v9, "_setIsResigningFirstResponderFromHost:", 0);
    +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissCurrentMenu");

  }
}

- (void)__hostDisablesAutomaticKeyboardBehavior:(BOOL)a3
{
  self->_disableAutomaticKeyboardBehavior = a3;
}

- (void)__hostDidSetContentOverlayInsets:(UIEdgeInsets)a3 andLeftMargin:(double)a4 rightMargin:(double)a5
{
  double right;
  double bottom;
  double left;
  double top;
  BOOL v12;
  _UIHostedWindow *v13;
  _UIHostedWindow *v14;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v12 = a3.left == self->_localViewControllerRequestedInsets.left
     && a3.top == self->_localViewControllerRequestedInsets.top
     && a3.right == self->_localViewControllerRequestedInsets.right
     && a3.bottom == self->_localViewControllerRequestedInsets.bottom;
  if (!v12
    || self->_localViewControllerRequestedLeftMargin != a4
    || self->_localViewControllerRequestedRightMargin != a5)
  {
    self->_localViewControllerRequestedInsets = a3;
    self->_localViewControllerRequestedLeftMargin = a4;
    self->_localViewControllerRequestedRightMargin = a5;
    if (-[_UIViewServiceViewControllerOperator _providesCustomBasePresentationInsets](self, "_providesCustomBasePresentationInsets"))
    {
      -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](self->_localViewController);
      -[UIViewController presentedViewController](self, "presentedViewController");
      v13 = (_UIHostedWindow *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
LABEL_21:

        return;
      }
      v14 = v13;
      -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](v13);
    }
    else
    {
      v14 = self->_hostedWindow;
      -[UIView setSafeAreaInsets:](v14, "setSafeAreaInsets:", top, left, bottom, right);
      -[UIViewController _sceneSettingsSafeAreaInsetsDidChangeForWindow:](self, "_sceneSettingsSafeAreaInsetsDidChangeForWindow:", v14);
      if (-[UIViewController _shouldForceLayoutForHostedAnimation](self->_localViewController, "_shouldForceLayoutForHostedAnimation"))
      {
        if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
        {
          -[UIView layoutIfNeeded](v14, "layoutIfNeeded");
        }
      }
    }
    v13 = v14;
    goto LABEL_21;
  }
}

- (BOOL)_providesCustomBasePresentationInsets
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (UIEdgeInsets)_customBasePresentationInsetsForView:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MinY;
  double MaxX;
  double v28;
  double hostStatusBarHeight;
  double v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double MaxY;
  double v38;
  double MinX;
  double top;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double right;
  double bottom;
  double left;
  double v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  UIEdgeInsets result;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "convertRect:toView:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UIViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[UIViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v15, "convertRect:toView:", 0);
    v18 = v17;
    v47 = v19;
    v42 = v21;
    v43 = v20;

  }
  else
  {
    -[_UIViewServiceViewControllerOperator _window](self, "_window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v18 = v22;
    v47 = v23;
    v42 = v25;
    v43 = v24;
  }

  top = self->_localViewControllerRequestedInsets.top;
  bottom = self->_localViewControllerRequestedInsets.bottom;
  left = self->_localViewControllerRequestedInsets.left;
  right = self->_localViewControllerRequestedInsets.right;
  v48.origin.x = v6;
  v48.origin.y = v8;
  v48.size.width = v10;
  v48.size.height = v12;
  MinY = CGRectGetMinY(v48);
  v49.origin.x = v18;
  v49.origin.y = v47;
  v49.size.width = v43;
  v49.size.height = v42;
  v41 = fmax(top - fmax(MinY - CGRectGetMinY(v49), 0.0), 0.0);
  v50.origin.x = v6;
  v50.origin.y = v8;
  v50.size.width = v10;
  v50.size.height = v12;
  MinX = CGRectGetMinX(v50);
  v51.origin.x = v18;
  v51.origin.y = v47;
  v51.size.width = v43;
  v51.size.height = v42;
  v38 = CGRectGetMinX(v51);
  v52.origin.x = v18;
  v52.origin.y = v47;
  v52.size.width = v43;
  v52.size.height = v42;
  MaxY = CGRectGetMaxY(v52);
  v53.origin.x = v6;
  v53.origin.y = v8;
  v53.size.width = v10;
  v53.size.height = v12;
  v36 = CGRectGetMaxY(v53);
  v54.origin.x = v18;
  v54.origin.y = v47;
  v54.size.width = v43;
  v54.size.height = v42;
  MaxX = CGRectGetMaxX(v54);
  v55.origin.x = v6;
  v55.origin.y = v8;
  v55.size.width = v10;
  v55.size.height = v12;
  v28 = CGRectGetMaxX(v55);
  hostStatusBarHeight = self->_hostStatusBarHeight;
  _UIAppStatusBarDefaultHeight();
  if (hostStatusBarHeight == 0.0)
  {
    v31 = vabdd_f64(v8, v47) == 0.0 - v30;
    v32 = v41;
    if (v31)
      v32 = self->_localViewControllerRequestedInsets.top;
  }
  else
  {
    v32 = v41;
  }
  v33 = fmax(right - fmax(MaxX - v28, 0.0), 0.0);
  v34 = fmax(bottom - fmax(MaxY - v36, 0.0), 0.0);
  v35 = fmax(left - fmax(MinX - v38, 0.0), 0.0);
  result.right = v33;
  result.bottom = v34;
  result.left = v35;
  result.top = v32;
  return result;
}

- (double)_canvasSystemMinimumMargin
{
  return 0.0;
}

- (UIEdgeInsets)_viewSafeAreaInsetsFromScene
{
  BOOL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  UIEdgeInsets result;

  v3 = -[_UIViewServiceViewControllerOperator _providesCustomBasePresentationInsets](self, "_providesCustomBasePresentationInsets");
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (!v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIViewController _viewSafeAreaInsetsFromScene](&v8, sel__viewSafeAreaInsetsFromScene, 0.0, 0.0, 0.0, 0.0);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  UIViewController *v6;
  CGFloat top;
  CGFloat left;
  CGFloat bottom;
  CGFloat right;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  UIEdgeInsets result;

  v6 = (UIViewController *)a3;
  if (self->_localViewController == v6
    && -[_UIViewServiceViewControllerOperator _providesCustomBasePresentationInsets](self, "_providesCustomBasePresentationInsets"))
  {
    *a4 = 1;
    top = self->_localViewControllerRequestedInsets.top;
    left = self->_localViewControllerRequestedInsets.left;
    bottom = self->_localViewControllerRequestedInsets.bottom;
    right = self->_localViewControllerRequestedInsets.right;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIViewController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v19, sel__edgeInsetsForChildViewController_insetsAreAbsolute_, v6, a4);
    top = v11;
    left = v12;
    bottom = v13;
    right = v14;
  }

  v15 = top;
  v16 = left;
  v17 = bottom;
  v18 = right;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  objc_super v5;

  if (self->_localViewController == a3)
  {
    *a4 = self->_localViewControllerRequestedLeftMargin;
    *a5 = self->_localViewControllerRequestedRightMargin;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIViewController _marginInfoForChild:leftMargin:rightMargin:](&v5, sel__marginInfoForChild_leftMargin_rightMargin_);
  }
}

- (void)__hostDidSetPresentationControllerClassName:(id)a3
{
  objc_storeStrong((id *)&self->_presentationControllerClassName, a3);
}

- (id)_presentationControllerClassName
{
  return self->_presentationControllerClassName;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_localViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_localViewController;
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id remoteViewControllerProxyToOperator;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController setNeedsStatusBarAppearanceUpdate](&v12, sel_setNeedsStatusBarAppearanceUpdate);
  -[UIViewController _effectiveStatusBarStyleViewController](self, "_effectiveStatusBarStyleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _effectiveStatusBarHiddenViewController](self, "_effectiveStatusBarHiddenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel__preferredStatusBarVisibility))
  {
    v5 = objc_msgSend(v4, "_preferredStatusBarVisibility");
LABEL_8:
    v6 = v5;
    goto LABEL_9;
  }
  if (!objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_prefersStatusBarHidden))
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIViewServiceViewControllerOperator;
    v5 = -[UIViewController _preferredStatusBarVisibility](&v11, sel__preferredStatusBarVisibility);
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "prefersStatusBarHidden"))
    v6 = 1;
  else
    v6 = 2;
LABEL_9:
  remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
  v8 = objc_msgSend(v3, "preferredStatusBarStyle");
  v9 = objc_msgSend(v3, "preferredStatusBarUpdateAnimation");
  +[UIView _currentAnimationSettings](UIView, "_currentAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePreferredStatusBarStyle:preferredStatusBarVisibility:updateAnimation:currentAnimationSettings:", v8, v6, v9, v10);

}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_localViewController;
}

- (void)setNeedsWhitePointAdaptivityStyleUpdate
{
  void *v3;
  id remoteViewControllerProxyToOperator;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController setNeedsWhitePointAdaptivityStyleUpdate](&v7, sel_setNeedsWhitePointAdaptivityStyleUpdate);
  -[UIViewController _effectiveWhitePointAdaptivityStyleViewController](self, "_effectiveWhitePointAdaptivityStyleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
  v5 = objc_msgSend(v3, "preferredWhitePointAdaptivityStyle");
  +[UIView _currentAnimationSettings](UIView, "_currentAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePreferredWhitePointAdaptationStyle:animationSettings:", v5, v6);

}

- (BOOL)sendClientToHostAction:(id)a3
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdateClientToHostAction:", a3);
  return 1;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_localViewController;
}

- (void)setNeedsUpdateOfScreenEdgesDeferringSystemGestures
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](&v4, sel_setNeedsUpdateOfScreenEdgesDeferringSystemGestures);
  -[UIViewController _effectiveScreenEdgesDeferringSystemGesturesViewController](self, "_effectiveScreenEdgesDeferringSystemGesturesViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePreferredScreenEdgesDeferringSystemGestures:", objc_msgSend(v3, "preferredScreenEdgesDeferringSystemGestures"));

}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_localViewController;
}

- (void)setNeedsUpdateOfHomeIndicatorAutoHidden
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController setNeedsUpdateOfHomeIndicatorAutoHidden](&v4, sel_setNeedsUpdateOfHomeIndicatorAutoHidden);
  -[UIViewController _effectiveHomeIndicatorAutoHiddenViewController](self, "_effectiveHomeIndicatorAutoHiddenViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePrefersHomeIndicatorAutoHidden:", objc_msgSend(v3, "prefersHomeIndicatorAutoHidden"));

}

- (id)childViewControllerForPointerLock
{
  return self->_localViewController;
}

- (void)setNeedsUpdateOfPrefersPointerLocked
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController setNeedsUpdateOfPrefersPointerLocked](&v4, sel_setNeedsUpdateOfPrefersPointerLocked);
  -[UIViewController _effectivePointerLockViewController](self, "_effectivePointerLockViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePrefersPointerLocked:", objc_msgSend(v3, "prefersPointerLocked"));

}

- (id)_childViewControllerForMultitaskingDragExclusionRects
{
  return self->_localViewController;
}

- (void)_setNeedsUpdateOfMultitaskingDragExclusionRects
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  -[UIViewController _setNeedsUpdateOfMultitaskingDragExclusionRects](&v5, sel__setNeedsUpdateOfMultitaskingDragExclusionRects);
  -[UIViewController _effectiveViewControllerForMultitaskingDragExclusionRects](self, "_effectiveViewControllerForMultitaskingDragExclusionRects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_multitaskingDragExclusionRects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdateMultitaskingDragExclusionRects:", v4);

}

- (id)_inputViewsKey
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
}

- (int64_t)_availableTextServices
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return self->_availableTextServices;
  v6.receiver = self;
  v6.super_class = (Class)_UIViewServiceViewControllerOperator;
  return -[UIResponder _availableTextServices](&v6, sel__availableTextServices);
}

- (id)_showServiceForType:(int64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _UIHostedTextServiceSession *v10;
  _UIHostedTextServiceSession *v11;
  _UIHostedTextServiceSession *textServiceSession;
  void *v13;
  id remoteViewControllerProxyToOperator;
  _UIHostedTextServiceSession *v15;
  _QWORD v17[5];
  objc_super v18;

  v6 = a4;
  objc_msgSend(v6, "textInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[_UITextServiceSession shouldPresentServiceInSameWindowAsView:](_UITextServiceSession, "shouldPresentServiceInSameWindowAsView:", v8);

  if (v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIResponder _showServiceForType:withContext:](&v18, sel__showServiceForType_withContext_, a3, v6);
    v10 = (_UIHostedTextServiceSession *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIHostedTextServiceSession setDelegate:](self->_textServiceSession, "setDelegate:", 0);
    +[_UIHostedTextServiceSession showServiceForType:withContext:](_UIHostedTextServiceSession, "showServiceForType:withContext:", a3, v6);
    v11 = (_UIHostedTextServiceSession *)objc_claimAutoreleasedReturnValue();
    textServiceSession = self->_textServiceSession;
    self->_textServiceSession = v11;

    -[_UIHostedTextServiceSession setDelegate:](self->_textServiceSession, "setDelegate:", self);
    -[UIViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRectToView:", v13);

    remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72___UIViewServiceViewControllerOperator__showServiceForType_withContext___block_invoke;
    v17[3] = &unk_1E16E9150;
    v17[4] = self;
    objc_msgSend(remoteViewControllerProxyToOperator, "__showServiceForType:withContext:replyHandler:", a3, v6, v17);
    v10 = self->_textServiceSession;
  }
  v15 = v10;

  return v15;
}

- (id)_showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a6;
  v14 = a3;
  -[_UIViewServiceViewControllerOperator _showServiceForText:selectedTextRange:type:fromRect:inView:](self, "_showServiceForText:selectedTextRange:type:fromRect:inView:", v14, 0, objc_msgSend(v14, "length"), a4, v13, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  id v16;
  id v17;
  _UIHostedTextServiceSession *v18;
  _UIHostedTextServiceSession *v19;
  _UIHostedTextServiceSession *textServiceSession;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id remoteViewControllerProxyToOperator;
  void *v31;
  void *v32;
  _UIHostedTextServiceSession *v33;
  _QWORD v35[5];
  objc_super v36;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  length = a4.length;
  location = a4.location;
  v16 = a3;
  v17 = a7;
  if (+[_UITextServiceSession shouldPresentServiceInSameWindowAsView:](_UITextServiceSession, "shouldPresentServiceInSameWindowAsView:", v17))
  {
    v36.receiver = self;
    v36.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIResponder _showServiceForText:selectedTextRange:type:fromRect:inView:](&v36, sel__showServiceForText_selectedTextRange_type_fromRect_inView_, v16, location, length, a5, v17, x, y, width, height);
    v18 = (_UIHostedTextServiceSession *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIHostedTextServiceSession setDelegate:](self->_textServiceSession, "setDelegate:", 0);
    +[_UIHostedTextServiceSession showServiceForText:selectedTextRange:type:fromRect:inView:](_UIHostedTextServiceSession, "showServiceForText:selectedTextRange:type:fromRect:inView:", v16, location, length, a5, v17, x, y, width, height);
    v19 = (_UIHostedTextServiceSession *)objc_claimAutoreleasedReturnValue();
    textServiceSession = self->_textServiceSession;
    self->_textServiceSession = v19;

    -[_UIHostedTextServiceSession setDelegate:](self->_textServiceSession, "setDelegate:", self);
    -[UIViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertRect:fromView:", v17, x, y, width, height);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v23, v25, v27, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __99___UIViewServiceViewControllerOperator__showServiceForText_selectedTextRange_type_fromRect_inView___block_invoke;
    v35[3] = &unk_1E16E9150;
    v35[4] = self;
    objc_msgSend(remoteViewControllerProxyToOperator, "__showServiceForText:selectedTextRangeValue:type:fromRectValue:replyHandler:", v16, v31, a5, v32, v35);

    v18 = self->_textServiceSession;
  }
  v33 = v18;

  return v33;
}

- (void)dismissHostedTextServiceSession:(id)a3 animated:(BOOL)a4
{
  if (self->_textServiceSession == a3)
    objc_msgSend(self->_remoteViewControllerProxyToOperator, "__dismissTextServiceSessionAnimated:", a4);
}

- (void)__textServiceDidDismiss
{
  _UIHostedTextServiceSession *textServiceSession;
  void *v4;
  void *v5;
  id v6;

  -[_UIHostedTextServiceSession remoteSessionDidDismiss](self->_textServiceSession, "remoteSessionDidDismiss");
  -[_UIHostedTextServiceSession setDelegate:](self->_textServiceSession, "setDelegate:", 0);
  textServiceSession = self->_textServiceSession;
  self->_textServiceSession = 0;

  -[UIWindow windowScene](self->_hostedWindow, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSceneDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIViewServiceViewControllerOperator _inputViewsKey](self, "_inputViewsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_restoreInputViewsWithId:animated:", v5, 1);

}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  if (objc_msgSend((id)UIApp, "applicationSupportsShakeToEdit", a3, a4))
  {
    if (!_AXSShakeToUndoDisabled())
      -[_UIViewServiceViewControllerOperator __showEditAlertView](self, "__showEditAlertView");
  }
}

- (void)__showEditAlertView
{
  void *v3;
  NSUndoManager *v4;
  NSUndoManager *editAlertUndoManager;
  int64_t v6;

  -[UIWindow firstResponder](self->_hostedWindow, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (NSUndoManager *)objc_claimAutoreleasedReturnValue();
  editAlertUndoManager = self->_editAlertUndoManager;
  self->_editAlertUndoManager = v4;

  if (!self->_editAlertToken
    && (-[NSUndoManager canUndo](self->_editAlertUndoManager, "canUndo")
     || -[NSUndoManager canRedo](self->_editAlertUndoManager, "canRedo")))
  {
    v6 = arc4random();
    self->_editAlertToken = v6;
    objc_msgSend(self->_remoteViewControllerProxyToOperator, "__showEditAlertViewWithToken:canUndo:canRedo:", v6, -[NSUndoManager canUndo](self->_editAlertUndoManager, "canUndo"), -[NSUndoManager canRedo](self->_editAlertUndoManager, "canRedo"));
  }
}

- (void)__undoActionWithToken:(int64_t)a3
{
  NSUndoManager *editAlertUndoManager;

  if (a3)
  {
    if (self->_editAlertToken == a3)
    {
      self->_editAlertToken = 0;
      -[NSUndoManager undo](self->_editAlertUndoManager, "undo");
      editAlertUndoManager = self->_editAlertUndoManager;
      self->_editAlertUndoManager = 0;

    }
  }
}

- (void)__redoActionWithToken:(int64_t)a3
{
  NSUndoManager *editAlertUndoManager;

  if (a3)
  {
    if (self->_editAlertToken == a3)
    {
      self->_editAlertToken = 0;
      -[NSUndoManager redo](self->_editAlertUndoManager, "redo");
      editAlertUndoManager = self->_editAlertUndoManager;
      self->_editAlertUndoManager = 0;

    }
  }
}

- (void)__cancelAlertActionWithToken:(int64_t)a3
{
  NSUndoManager *editAlertUndoManager;

  if (a3)
  {
    if (self->_editAlertToken == a3)
    {
      self->_editAlertToken = 0;
      editAlertUndoManager = self->_editAlertUndoManager;
      self->_editAlertUndoManager = 0;

    }
  }
}

- (id)preferredFocusEnvironments
{
  void *v2;
  objc_super v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_localViewController)
  {
    v5[0] = self->_localViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIViewController preferredFocusEnvironments](&v4, sel_preferredFocusEnvironments);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_forwardFocusMovementAction:(id)a3
{
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__handleFocusMovementAction:", a3);
}

- (id)_dataFromPressesEvent:(id)a3
{
  objc_msgSend(a3, "_hidEvent");
  return (id)IOHIDEventCreateData();
}

- (BOOL)_forwardPresses:(id)a3 withEvent:(id)a4 canceled:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id remoteViewControllerProxyToOperator;
  void *v11;
  BOOL v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (_UIPressesContainsPressType(v8, 7)
    || _UIPressesContainsPressType(v8, 5)
    && (!objc_msgSend(v9, "_hidEvent") || (objc_msgSend(v9, "_hidEvent"), IOHIDEventGetType() != 35)))
  {
    remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    -[_UIViewServiceViewControllerOperator _dataFromPressesEvent:](self, "_dataFromPressesEvent:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(remoteViewControllerProxyToOperator, "__trampolineButtonPressData:canceled:", v11, v5);

    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[_UIViewServiceViewControllerOperator _forwardPresses:withEvent:canceled:](self, "_forwardPresses:withEvent:canceled:", v6, v7, 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIResponder pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[_UIViewServiceViewControllerOperator _forwardPresses:withEvent:canceled:](self, "_forwardPresses:withEvent:canceled:", v6, v7, 1))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIResponder pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[_UIViewServiceViewControllerOperator _forwardPresses:withEvent:canceled:](self, "_forwardPresses:withEvent:canceled:", v6, v7, 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIResponder pressesChanged:withEvent:](&v8, sel_pressesChanged_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[_UIViewServiceViewControllerOperator _forwardPresses:withEvent:canceled:](self, "_forwardPresses:withEvent:canceled:", v6, v7, 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIResponder pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (void)__timelinesForDateInterval:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  BLSFrameSpecifierModel *v9;
  BLSFrameSpecifierModel *blsFrameSpecifierModel;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  _QWORD v23[4];
  id v24;
  _UIViewServiceViewControllerOperator *v25;
  id v26;
  SEL v27;

  v7 = a3;
  v8 = a4;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewServiceViewControllerOperator.m"), 3654, CFSTR("Call must be made on main thread"));

  }
  if (!self->_blsFrameSpecifierModel)
  {
    v9 = (BLSFrameSpecifierModel *)objc_alloc_init(MEMORY[0x1E0D00FA8]);
    blsFrameSpecifierModel = self->_blsFrameSpecifierModel;
    self->_blsFrameSpecifierModel = v9;

  }
  v11 = (void *)objc_opt_new();
  -[UIViewController _effectiveControllersForAlwaysOnTimelines](self->_localViewController, "_effectiveControllersForAlwaysOnTimelines");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke;
  v23[3] = &unk_1E16CB940;
  v27 = a2;
  v24 = v7;
  v25 = self;
  v26 = v11;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke_3;
  v18[3] = &unk_1E16E9178;
  v21 = v8;
  v22 = a2;
  v18[4] = self;
  v19 = v26;
  v20 = v24;
  v14 = v8;
  v15 = v24;
  v16 = v26;
  +[_UIBacklightEnvironment _performOnChildViewControllersForAlwaysOnTimelines:performBlock:withCompletion:](_UIAlwaysOnEnvironment, "_performOnChildViewControllersForAlwaysOnTimelines:performBlock:withCompletion:", v12, v23, v18);

}

- (void)__updateWithFrameSpecifierDate:(id)a3 completion:(id)a4
{
  BLSFrameSpecifierModel *blsFrameSpecifierModel;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  blsFrameSpecifierModel = self->_blsFrameSpecifierModel;
  v7 = a4;
  -[BLSFrameSpecifierModel specifierAtPresentationDate:](blsFrameSpecifierModel, "specifierAtPresentationDate:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _effectiveControllersForAlwaysOnTimelines](self->_localViewController, "_effectiveControllersForAlwaysOnTimelines");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82___UIViewServiceViewControllerOperator___updateWithFrameSpecifierDate_completion___block_invoke;
  v11[3] = &unk_1E16E91A0;
  v12 = v8;
  v10 = v8;
  +[_UIBacklightEnvironment _performOnChildViewControllersForAlwaysOnTimelines:performBlock:withCompletion:](_UIAlwaysOnEnvironment, "_performOnChildViewControllersForAlwaysOnTimelines:performBlock:withCompletion:", v9, v11, v7);

}

- (_UIChildRemoteContentRegistry)_childRemoteContentRegistry
{
  _UIChildRemoteContentRegistry *childRemoteContentRegistry;
  _UIChildRemoteContentRegistry *v4;
  _UIChildRemoteContentRegistry *v5;

  childRemoteContentRegistry = self->_childRemoteContentRegistry;
  if (!childRemoteContentRegistry)
  {
    v4 = -[_UIChildRemoteContentRegistry initWithParentScene:]([_UIChildRemoteContentRegistry alloc], "initWithParentScene:", self->_pseudoScene);
    v5 = self->_childRemoteContentRegistry;
    self->_childRemoteContentRegistry = v4;

    childRemoteContentRegistry = self->_childRemoteContentRegistry;
  }
  return childRemoteContentRegistry;
}

- (id)_windowHostingScene
{
  return -[UIWindow _windowHostingScene](self->_hostedWindow, "_windowHostingScene");
}

- (unint64_t)_providerType
{
  return 0;
}

- (NSUUID)_sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (UIWindow)_primaryHostedWindow
{
  return (UIWindow *)self->_hostedWindow;
}

- (int)_effectiveViewControllerAppearState
{
  return -[UIViewController _appearState](self->_localViewController, "_appearState");
}

- (void)_installActivityObserverGestureIfNeeded
{
  _UIHostedWindow *hostedWindow;
  void *v5;
  _UITouchesBeganObserverGestureRecognizer *v6;
  _UITouchesBeganObserverGestureRecognizer *hostedWindowActivityObserverGesture;
  void *v8;
  char v9;
  void *v10;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewServiceViewControllerOperator.m"), 3733, CFSTR("Call must be made on main thread"));

  }
  hostedWindow = self->_hostedWindow;
  if (hostedWindow)
  {
    if (!self->_hostedWindowActivityObserverGesture)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), CFSTR("ViewService-HostedWindow-Observer"), hostedWindow);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (_UITouchesBeganObserverGestureRecognizer *)-[_UITouchesBeganObserverGestureRecognizer initWithTarget:action:name:]([_UITouchesBeganObserverGestureRecognizer alloc], (uint64_t)self, (uint64_t)sel__handleActivityObserverGesture_, (uint64_t)v5);
      hostedWindowActivityObserverGesture = self->_hostedWindowActivityObserverGesture;
      self->_hostedWindowActivityObserverGesture = v6;

      hostedWindow = self->_hostedWindow;
    }
    -[UIView gestureRecognizers](hostedWindow, "gestureRecognizers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", self->_hostedWindowActivityObserverGesture);

    if ((v9 & 1) == 0)
      -[UIView addGestureRecognizer:](self->_hostedWindow, "addGestureRecognizer:", self->_hostedWindowActivityObserverGesture);
  }
}

- (void)_handleActivityObserverGesture:(id)a3
{
  id *v4;

  +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker", a3);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v4, 4uLL, &self->_hostedWindow->super.super.super.super.isa, self, (uint64_t)self->_sessionActivityRecord);

}

- (void)_physicalButtonInteractionArbiter:(id)a3 didUpdateResolvedConfigurations:(id)a4 inActiveViewServiceSession:(id)a5
{
  id v8;
  id v9;
  _UIViewServiceSessionActivityRecord *v10;
  _UIViewServiceSessionActivityRecord *v11;
  _UIViewServiceSessionActivityRecord *sessionActivityRecord;
  int64_t v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  _UIHostedWindow *v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  _UIViewServiceSessionActivityRecord *v27;
  _BOOL4 v28;
  void *v29;
  _UIViewServiceViewControllerOperator *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _UIViewServiceSessionActivityRecord *v37;
  _UIViewServiceSessionActivityRecord *v38;
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (_UIViewServiceSessionActivityRecord *)a5;
  v11 = v10;
  sessionActivityRecord = self->_sessionActivityRecord;
  if (sessionActivityRecord)
  {
    v13 = v10 ? v10->_userInterfaceIdiom : 0;
    if (sessionActivityRecord->_userInterfaceIdiom == v13)
    {
      v41 = (void *)objc_opt_new();
      if (sessionActivityRecord == v11 && self->_hostedWindow != 0)
      {
        v37 = sessionActivityRecord;
        v38 = v11;
        v39 = v9;
        v40 = v8;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v15 = v9;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v43 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v15, "objectForKey:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "view");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "_window");
              v23 = (_UIHostedWindow *)objc_claimAutoreleasedReturnValue();

              if (v23 == self->_hostedWindow)
                objc_msgSend(v41, "_setConfiguration:forButton:", v20, objc_msgSend(v20, "_button"));

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          }
          while (v17);
        }

        v9 = v39;
        v8 = v40;
        sessionActivityRecord = v37;
        v11 = v38;
      }
      v24 = (void *)objc_msgSend(v41, "copy");
      v25 = _physicalButtonInteractionArbiter_didUpdateResolvedConfigurations_inActiveViewServiceSession____s_category;
      if (!_physicalButtonInteractionArbiter_didUpdateResolvedConfigurations_inActiveViewServiceSession____s_category)
      {
        v25 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v25, (unint64_t *)&_physicalButtonInteractionArbiter_didUpdateResolvedConfigurations_inActiveViewServiceSession____s_category);
      }
      if ((*(_BYTE *)v25 & 1) != 0)
      {
        v26 = *(NSObject **)(v25 + 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = v11;
          v28 = sessionActivityRecord == v11;
          v29 = (void *)MEMORY[0x1E0CB3940];
          v30 = self;
          v31 = v26;
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("<%@: %p>"), v33, v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = v34;
          objc_msgSend(v24, "succinctDescription");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v47 = v34;
          v48 = 1024;
          v49 = v28;
          v11 = v27;
          v50 = 2112;
          v51 = v36;
          _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "Notifying view service host of resolved configurations update: self: %@; isMostActiveService: %d; configurations: %@",
            buf,
            0x1Cu);

        }
      }
      objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdateResolvedPhysicalButtonConfigurations:", v24);

    }
  }

}

- (void)__hostDidReceivePhysicalButtonBSAction:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _UIViewServiceViewControllerOperator *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = __hostDidReceivePhysicalButtonBSAction____s_category;
  if (!__hostDidReceivePhysicalButtonBSAction____s_category)
  {
    v5 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&__hostDidReceivePhysicalButtonBSAction____s_category);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v9 = *(id *)(v5 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = self;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v11);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412546;
      v16 = v14;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Received proxy physicalButtonBSAction from host: self: %@; physicalButtonBSAction: %@",
        buf,
        0x16u);

    }
  }
  -[UIWindow _eventRoutingScene](self->_hostedWindow, "_eventRoutingScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_physicalButtonInteractionArbiter");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    -[_UIPhysicalButtonInteractionArbiter _handleBSAction:](v7, v4);

}

- (void)__intelligenceCollectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4
{
  +[_UIApplicationIntelligenceSupport collectRemoteContent:inVisibleRect:withRemoteContextWrapper:](_UIApplicationIntelligenceSupport, "collectRemoteContent:inVisibleRect:withRemoteContextWrapper:", self->_hostedWindow, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSString)debugDescription
{
  void *v3;
  void *v5;
  objc_super v6;
  objc_super v7;

  if (os_variant_has_internal_diagnostics())
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[_UIViewServiceViewControllerOperator debugDescription](&v7, sel_debugDescription);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" hostBundleID=%@"), self->_hostBundleID);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[_UIViewServiceViewControllerOperator debugDescription](&v6, sel_debugDescription);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (double)_systemReferenceAngleFromHost
{
  return self->_systemReferenceAngleFromHost;
}

- (unint64_t)_systemReferenceAngleModeFromHost
{
  return self->_systemReferenceAngleModeFromHost;
}

- (_UIRemoteViewControllerSceneContext)_sceneContext
{
  return self->_sceneContext;
}

- (_UIViewServiceViewControllerOperatorDelegate)delegate
{
  return (_UIViewServiceViewControllerOperatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_traitsWillChangeHandler
{
  return self->__traitsWillChangeHandler;
}

- (void)_setTraitsWillChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (id)_traitsDidChangeHandler
{
  return self->__traitsDidChangeHandler;
}

- (void)_setTraitsDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__traitsDidChangeHandler, 0);
  objc_storeStrong(&self->__traitsWillChangeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_childRemoteContentRegistry, 0);
  objc_storeStrong((id *)&self->_sceneContext, 0);
  objc_storeStrong((id *)&self->_screenCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_pseudoScene, 0);
  objc_storeStrong((id *)&self->_physicalButtonInteractionArbiterObserverToken, 0);
  objc_storeStrong((id *)&self->_hostedWindowActivityObserverGesture, 0);
  objc_storeStrong((id *)&self->_sessionActivityRecord, 0);
  objc_storeStrong((id *)&self->_blsFrameSpecifierModel, 0);
  objc_storeStrong((id *)&self->_previousPresentationDate, 0);
  objc_storeStrong((id *)&self->_sheetClientConfiguration, 0);
  objc_storeStrong((id *)&self->_editAlertUndoManager, 0);
  objc_storeStrong((id *)&self->_viewControllerTransitioningContext, 0);
  objc_destroyWeak((id *)&self->_dummyPopoverController);
  objc_destroyWeak((id *)&self->_displayedPopoverController);
  objc_storeStrong((id *)&self->_invalidationInvocation, 0);
  objc_storeStrong((id *)&self->_prepareForDisconnectionInvocation, 0);
  objc_storeStrong((id *)&self->_textServiceSession, 0);
  objc_storeStrong((id *)&self->_deputyRotationDelegates, 0);
  objc_storeStrong((id *)&self->_hostedWindow, 0);
  objc_storeStrong((id *)&self->_presentationControllerClassName, 0);
  objc_storeStrong((id *)&self->_localViewController, 0);
  objc_storeStrong((id *)&self->_pluginDisplayConfigurations, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerProxyToViewController, 0);
  objc_storeStrong(&self->_remoteViewControllerProxyToOperator, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_hostBundleID, 0);
  objc_storeStrong((id *)&self->_deferredToViewDidAppear, 0);
}

@end

@implementation _UIRemoteViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_endDynamicButtonEventDeferringIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    if (a1[158])
    {
      objc_msgSend(a1, "_window");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "windowScene");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_eventDeferringManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: end dynamic button deferring"), objc_opt_class(), a1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager endRemoteEventDeferringForToken:withReason:]((uint64_t)v3, a1[158], v4);
      v5 = (void *)a1[158];
      a1[158] = 0;

    }
  }
}

- (void)_updateParentHostingRegistryIfNecessaryForWindow:(uint64_t)a1
{
  void *v3;
  id WeakRetained;
  id v5;
  id obj;

  if (a1)
  {
    objc_msgSend(a2, "_remoteContentParent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_childRemoteContentRegistry");
    obj = (id)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1416));
    if (obj != WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 1416));
      objc_msgSend(v5, "removeChildViewService:", a1);

      objc_msgSend(obj, "addChildViewService:", a1);
      objc_storeWeak((id *)(a1 + 1416), obj);
    }

  }
}

- (BOOL)__isKindOfUIRemoteViewController
{
  return 1;
}

+ (id)requestViewController:(id)a3 fromServiceWithBundleIdentifier:(id)a4 connectionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_requestViewController:traitCollection:fromServiceWithBundleIdentifier:service:connectionHandler:", v10, v12, v9, 0, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)requestViewController:(id)a3 traitCollection:(id)a4 fromServiceWithBundleIdentifier:(id)a5 connectionHandler:(id)a6
{
  return (id)objc_msgSend(a1, "_requestViewController:traitCollection:fromServiceWithBundleIdentifier:service:connectionHandler:", a3, a4, a5, 0, a6);
}

+ (id)requestViewControllerWithService:(id)a3 connectionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_requestViewController:traitCollection:fromServiceWithBundleIdentifier:service:connectionHandler:", 0, v9, 0, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)requestViewControllerWithService:(id)a3 traitCollection:(id)a4 connectionHandler:(id)a5
{
  return (id)objc_msgSend(a1, "_requestViewController:traitCollection:fromServiceWithBundleIdentifier:service:connectionHandler:", 0, a4, 0, a3, a5);
}

+ (id)_requestViewController:(id)a3 traitCollection:(id)a4 fromServiceWithBundleIdentifier:(id)a5 service:(id)a6 connectionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[3];
  char v40;

  v30 = a3;
  v31 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_msgSend(objc_alloc((Class)a1), "_initWithViewServiceBundleIdentifier:", v12);
  v16 = (void *)v15;
  if (v13)
    objc_storeStrong((id *)(v15 + 984), a6);
  objc_msgSend(a1, "serviceViewControllerInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "exportedInterface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewServiceViewControllerDeputyXPCInterface interfaceWithExportedInterface:remoteViewControllerInterface:](_UIViewServiceViewControllerDeputyXPCInterface, "interfaceWithExportedInterface:remoteViewControllerInterface:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "shouldPropagateAppearanceCustomizations")
    && (objc_msgSend(v13, "overridesHostAppearance") & 1) == 0)
  {
    UIViewServiceCurrentAppearanceSerializedRepresentations((uint64_t)v12, 0);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v22 = MEMORY[0x1E0C809B0];
  v40 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke;
  aBlock[3] = &unk_1E16E89C8;
  v38 = v39;
  v23 = v14;
  v37 = v23;
  v24 = v16;
  v36 = v24;
  v25 = _Block_copy(aBlock);
  v26 = v25;
  if (v13)
    +[_UIRemoteViewControllerConnectionRequest requestViewControllerWithService:serializedAppearanceCustomizations:traitCollection:exportedHostingObject:remoteViewControllerClass:serviceViewControllerDeputyInterface:connectionHandler:](_UIRemoteViewControllerConnectionRequest, "requestViewControllerWithService:serializedAppearanceCustomizations:traitCollection:exportedHostingObject:remoteViewControllerClass:serviceViewControllerDeputyInterface:connectionHandler:", v13, v21, v31, v24, objc_opt_class(), v19, v25);
  else
    +[_UIRemoteViewControllerConnectionRequest requestViewController:fromServiceWithBundleIdentifier:serializedAppearanceCustomizations:traitCollection:exportedHostingObject:serviceViewControllerDeputyInterface:connectionHandler:](_UIRemoteViewControllerConnectionRequest, "requestViewController:fromServiceWithBundleIdentifier:serializedAppearanceCustomizations:traitCollection:exportedHostingObject:serviceViewControllerDeputyInterface:connectionHandler:", v30, v12, v21, v31, v24, v19, v25);
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_340;
  v32[3] = &unk_1E16D4678;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v33 = v27;
  v34 = v39;
  +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v39, 8);
  return v28;
}

- (id)_initWithViewServiceBundleIdentifier:(id)a3
{
  id v4;
  _UIRemoteViewController *v5;
  uint64_t v6;
  NSString *serviceBundleIdentifier;
  _UIRemoteViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIRemoteViewController;
  v5 = -[UIViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceBundleIdentifier = v5->_serviceBundleIdentifier;
    v5->_serviceBundleIdentifier = (NSString *)v6;

    v5->__viewClipsToBounds = 1;
    if ((dyld_program_sdk_at_least() & 1) == 0)
      -[UIViewController setPreferredContentSize:](v5, "setPreferredContentSize:", 320.0, 480.0);
    -[UIViewController setContentSizeForViewInPopover:](v5, "setContentSizeForViewInPopover:", 320.0, 480.0);
    v8 = v5;
  }

  return v5;
}

- (void)_awakeWithConnectionInfo:(id)a3
{
  id v4;
  _UISheetPresentationControllerConfiguration *proxySheetConfigurationBeforeDeferring;
  _UIViewServiceInterface *v6;
  _UIViewServiceInterface *serviceInterface;
  _UIViewServiceInterface *v8;
  NSValue *v9;
  NSValue *callerID;
  void *v11;
  id serviceViewControllerControlMessageProxy;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id serviceViewControllerProxy;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id viewControllerOperatorProxy;
  _UIAsyncInvocation *v23;
  _UIAsyncInvocation *viewControllerOperatorHalfDisconnectionInvocation;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id textEffectsOperatorProxy;
  _UIAsyncInvocation *v31;
  _UIAsyncInvocation *textEffectsOperatorHalfDisconnectionInvocation;
  NSArray *v33;
  NSArray *serviceViewControllerSupportedInterfaceOrientations;
  void *v35;
  void *v36;
  mach_port_name_t v37;
  unsigned int v38;
  void *v39;
  const NSNotificationName *v40;
  _UISizeTrackingView *v41;
  _UISizeTrackingView *sizeTrackingView;
  void *v43;
  _UIRemoteView *v44;
  _UIRemoteView *serviceViewControllerRemoteView;
  void *v46;
  FBSDisplayIdentity *v47;
  FBSDisplayIdentity *lastNotifiedServiceScreenDisplayIdentity;
  void *v49;
  void *v50;
  void *v51;
  _UITextEffectsRemoteView *v52;
  _UITextEffectsRemoteView *textEffectsAboveStatusBarRemoteView;
  void *v54;
  void *v55;
  _UITextEffectsRemoteView *v56;
  _UITextEffectsRemoteView *fullScreenTextEffectsRemoteView;
  void *v58;
  void *v59;
  _UITextEffectsRemoteView *v60;
  _UITextEffectsRemoteView *remoteKeyboardRemoteView;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  _UISceneKeyboardProxyLayerForwardingPresentationViewService *v75;
  _UISceneKeyboardProxyLayerForwardingPresentationViewService *keyboardProxyPresentationEnvironment;
  void *v77;
  _UIAsyncInvocation *v78;
  _UIAsyncInvocation *terminationInvocation;
  _QWORD v80[5];
  _QWORD aBlock[4];
  id v82;
  id v83;
  _UIRemoteViewController *v84;
  _QWORD v85[4];
  id v86;
  id location[2];

  v4 = a3;
  objc_initWeak(location, self);
  self->_isUpdatingSize = 0;
  self->_isUpdatingSizeInHost = 0;
  proxySheetConfigurationBeforeDeferring = self->__proxySheetConfigurationBeforeDeferring;
  self->__proxySheetConfigurationBeforeDeferring = 0;

  objc_msgSend(v4, "interface");
  v6 = (_UIViewServiceInterface *)objc_claimAutoreleasedReturnValue();
  serviceInterface = self->_serviceInterface;
  self->_serviceInterface = v6;

  v8 = self->_serviceInterface;
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke;
  v85[3] = &unk_1E16C4700;
  objc_copyWeak(&v86, location);
  -[_UIViewServiceInterface setTerminationHandler:](v8, "setTerminationHandler:", v85);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
  v9 = (NSValue *)objc_claimAutoreleasedReturnValue();
  callerID = self->_callerID;
  self->_callerID = v9;

  objc_msgSend(v4, "serviceViewControllerControlMessageProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  serviceViewControllerControlMessageProxy = self->_serviceViewControllerControlMessageProxy;
  self->_serviceViewControllerControlMessageProxy = v11;

  objc_msgSend(v4, "serviceViewControllerProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "serviceViewControllerProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIViewServiceReplyControlProxy proxyWithTarget:](_UIViewServiceReplyControlProxy, "proxyWithTarget:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIViewServiceImplicitAnimationEncodingProxy proxyEncodingAnimationsForTarget:controlMessageTarget:](_UIViewServiceImplicitAnimationEncodingProxy, "proxyEncodingAnimationsForTarget:controlMessageTarget:", v15, self->_serviceViewControllerControlMessageProxy);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    serviceViewControllerProxy = self->_serviceViewControllerProxy;
    self->_serviceViewControllerProxy = v16;

  }
  objc_msgSend(v4, "viewControllerOperatorProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewServiceReplyControlProxy proxyWithTarget:](_UIViewServiceReplyControlProxy, "proxyWithTarget:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "viewControllerOperatorProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewServiceImplicitAnimationEncodingProxy proxyEncodingAnimationsForTarget:controlMessageTarget:](_UIViewServiceImplicitAnimationEncodingProxy, "proxyEncodingAnimationsForTarget:controlMessageTarget:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  self->_viewControllerOperatorProxy = v21;

  objc_msgSend(self->_viewControllerOperatorProxy, "__hostReadyToReceiveMessagesFromServiceViewController");
  _UIRemoteViewControllerHalfDisconnectionInvocationForProxy(self->_viewControllerOperatorProxy);
  v23 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  viewControllerOperatorHalfDisconnectionInvocation = self->_viewControllerOperatorHalfDisconnectionInvocation;
  self->_viewControllerOperatorHalfDisconnectionInvocation = v23;

  objc_msgSend(v4, "textEffectsOperatorProxy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v4, "textEffectsOperatorProxy");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIViewServiceReplyControlProxy proxyWithTarget:](_UIViewServiceReplyControlProxy, "proxyWithTarget:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "textEffectsOperatorProxy");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIViewServiceImplicitAnimationEncodingProxy proxyEncodingAnimationsForTarget:controlMessageTarget:](_UIViewServiceImplicitAnimationEncodingProxy, "proxyEncodingAnimationsForTarget:controlMessageTarget:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    textEffectsOperatorProxy = self->_textEffectsOperatorProxy;
    self->_textEffectsOperatorProxy = v29;

  }
  else
  {
    v27 = self->_textEffectsOperatorProxy;
    self->_textEffectsOperatorProxy = 0;
  }

  _UIRemoteViewControllerHalfDisconnectionInvocationForProxy(self->_textEffectsOperatorProxy);
  v31 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  textEffectsOperatorHalfDisconnectionInvocation = self->_textEffectsOperatorHalfDisconnectionInvocation;
  self->_textEffectsOperatorHalfDisconnectionInvocation = v31;

  objc_msgSend(v4, "serviceViewControllerSupportedInterfaceOrientations");
  v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
  serviceViewControllerSupportedInterfaceOrientations = self->_serviceViewControllerSupportedInterfaceOrientations;
  self->_serviceViewControllerSupportedInterfaceOrientations = v33;

  objc_msgSend(v4, "serviceAccessibilityServerPortWrapper");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v4, "serviceAccessibilityServerPortWrapper");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "extractPortAndIKnowWhatImDoingISwear");

    if (v37 - 1 <= 0xFFFFFFFD)
    {
      if (mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v37, 0, 1))
        v38 = 0;
      else
        v38 = v37;
      self->_serviceAccessibilityServerPort = v38;
    }
  }
  self->_preferredStatusBarStyle = objc_msgSend(v4, "preferredStatusBarStyle");
  self->_preferredStatusBarVisibility = objc_msgSend(v4, "preferredStatusBarVisibility");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);
  if (objc_msgSend((id)UIApp, "_isSpringBoard") && !_UIDeviceNativeUserInterfaceIdiom())
    v40 = (const NSNotificationName *)UITextEffectsWindowViewControllerWillRotateNotification;
  else
    v40 = &UIApplicationDidChangeStatusBarOrientationNotification;
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__statusBarOrientationDidChange_, *v40, 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__statusBarHeightDidChange_, CFSTR("UIApplicationStatusBarHeightChangedNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__sceneWillEnterForeground_, CFSTR("UISceneWillEnterForegroundNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__hostWillEnterForeground_, 0x1E1784A60, 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__hostSceneWillEnterForeground_, 0x1E1784AA0, 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__pencilBarrelEventFocusEvaluatedForSceneTransition_, CFSTR("_UIPencilEventDidEvaluateBarrelFocusForSceneTransition"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__hostDidEvaluatePencilBarrelEventFocusForSceneTransition_, CFSTR("_UIViewServiceHostDidEvaluatePencilBarrelEventFocusForSceneTransition"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__sceneDidEnterBackground_, CFSTR("UISceneDidEnterBackgroundNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__hostDidEnterBackground_, 0x1E1784A40, 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__hostSceneDidEnterBackground_, 0x1E1784A80, 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__applicationDidFinishSuspendSnapshot_, CFSTR("_UIApplicationDidFinishSuspensionSnapshotNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__appearanceInvocationsDidChange_, 0x1E172F5C0, 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__screenDidUpdate_, CFSTR("_UIScreenDisplayConfigurationUpdatedNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__referenceDisplayModeStatusDidChange_, CFSTR("UIScreenReferenceDisplayModeStatusDidChangeNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__enhancedWindowingModeDidChange_, CFSTR("_UIWindowSceneEnhancedWindowingModeChanged"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__systemReferenceAngleDidChange_, *MEMORY[0x1E0DC5D30], 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__screenDidConnect_, CFSTR("_UIScreenDidConnectNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__screenDidDisconnect_, CFSTR("_UIScreenDidDisconnectNotification"), 0);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__screenDidUpdateCapture_, CFSTR("UIScreenCapturedDidChangeNotification"), 0);
  +[_UISizeTrackingView viewWithRemoteViewController:viewControllerOperatorProxy:textEffectsOperatorProxy:](_UISizeTrackingView, "viewWithRemoteViewController:viewControllerOperatorProxy:textEffectsOperatorProxy:", self, self->_viewControllerOperatorProxy, self->_textEffectsOperatorProxy);
  v41 = (_UISizeTrackingView *)objc_claimAutoreleasedReturnValue();
  sizeTrackingView = self->_sizeTrackingView;
  self->_sizeTrackingView = v41;

  -[UIViewController loadViewIfRequired](self, "loadViewIfRequired");
  objc_msgSend(v4, "hostedWindowHostingHandle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIRemoteView viewWithHostedWindowHostingHandle:](_UIRemoteView, "viewWithHostedWindowHostingHandle:", v43);
  v44 = (_UIRemoteView *)objc_claimAutoreleasedReturnValue();
  serviceViewControllerRemoteView = self->_serviceViewControllerRemoteView;
  self->_serviceViewControllerRemoteView = v44;

  -[_UIRemoteView setRemoteViewController:](self->_serviceViewControllerRemoteView, "setRemoteViewController:", self);
  -[UIView addSubview:](self->_sizeTrackingView, "addSubview:", self->_serviceViewControllerRemoteView);
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "displayIdentity");
  v47 = (FBSDisplayIdentity *)objc_claimAutoreleasedReturnValue();
  lastNotifiedServiceScreenDisplayIdentity = self->_lastNotifiedServiceScreenDisplayIdentity;
  self->_lastNotifiedServiceScreenDisplayIdentity = v47;

  if (UISelfTaskHasEntitlement(CFSTR("com.apple.QuartzCore.secure-mode")))
  {
    -[_UILayerHostView layerHost](self->_serviceViewControllerRemoteView, "layerHost");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setStopsSecureSuperlayersValidation:", 1);

  }
  objc_msgSend(v4, "textEffectsWindowAboveStatusBarHostingHandle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v4, "textEffectsWindowAboveStatusBarHostingHandle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIRemoteView viewWithHostedWindowHostingHandle:](_UITextEffectsRemoteView, "viewWithHostedWindowHostingHandle:", v51);
    v52 = (_UITextEffectsRemoteView *)objc_claimAutoreleasedReturnValue();
    textEffectsAboveStatusBarRemoteView = self->_textEffectsAboveStatusBarRemoteView;
    self->_textEffectsAboveStatusBarRemoteView = v52;

    -[_UIRemoteView setRemoteViewController:](self->_textEffectsAboveStatusBarRemoteView, "setRemoteViewController:", self);
  }
  objc_msgSend(v4, "textEffectsWindowHostingHandle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(v4, "textEffectsWindowHostingHandle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIRemoteView viewWithHostedWindowHostingHandle:](_UITextEffectsRemoteView, "viewWithHostedWindowHostingHandle:", v55);
    v56 = (_UITextEffectsRemoteView *)objc_claimAutoreleasedReturnValue();
    fullScreenTextEffectsRemoteView = self->_fullScreenTextEffectsRemoteView;
    self->_fullScreenTextEffectsRemoteView = v56;

    -[_UIRemoteView setRemoteViewController:](self->_fullScreenTextEffectsRemoteView, "setRemoteViewController:", self);
  }
  objc_msgSend(v4, "remoteKeyboardsWindowHostingHandle");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v4, "remoteKeyboardsWindowHostingHandle");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIRemoteView viewWithHostedWindowHostingHandle:](_UITextEffectsRemoteView, "viewWithHostedWindowHostingHandle:", v59);
    v60 = (_UITextEffectsRemoteView *)objc_claimAutoreleasedReturnValue();
    remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
    self->_remoteKeyboardRemoteView = v60;

    -[_UIRemoteView setRemoteViewController:](self->_remoteKeyboardRemoteView, "setRemoteViewController:", self);
  }
  self->__shouldUpdateRemoteTextEffectsWindow = objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow");
  if (objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
  {
    if (_UIDeviceNativeUserInterfaceIdiom() == 1)
    {
      -[UIViewController _window](self, "_window");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "windowScene");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v63, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v64, "_isHostedInAnotherProcess"))
      {
        v65 = objc_msgSend((id)UIApp, "_frontMostAppOrientation") - 5;

        if (v65 >= 0xFFFFFFFFFFFFFFFELL)
          goto LABEL_34;
      }
      else
      {

      }
    }
    -[UIViewController _window](self, "_window");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "windowScene");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v67, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "rootViewController");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "view");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke_2;
    aBlock[3] = &unk_1E16B47A8;
    v71 = v70;
    v82 = v71;
    v72 = v68;
    v83 = v72;
    v84 = self;
    v73 = _Block_copy(aBlock);
    v74 = v73;
    if (v69)
      objc_msgSend(v69, "performWithSafeTransitionFrames:", v73);
    else
      (*((void (**)(void *))v73 + 2))(v73);

  }
LABEL_34:
  v75 = (_UISceneKeyboardProxyLayerForwardingPresentationViewService *)-[_UISceneKeyboardProxyLayerForwardingPresentationViewService initWithRemoteViewController:]((id *)[_UISceneKeyboardProxyLayerForwardingPresentationViewService alloc], self);
  keyboardProxyPresentationEnvironment = self->_keyboardProxyPresentationEnvironment;
  self->_keyboardProxyPresentationEnvironment = v75;

  +[_UISceneKeyboardProxyLayerForwardingManager sharedInstance](_UISceneKeyboardProxyLayerForwardingManager, "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "trackPresentationEnvironment:", self->_keyboardProxyPresentationEnvironment);

  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke_3;
  v80[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v80[4] = self;
  +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v80);
  v78 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  terminationInvocation = self->_terminationInvocation;
  self->_terminationInvocation = v78;

  objc_destroyWeak(&v86);
  objc_destroyWeak(location);

}

- (void)loadView
{
  _UISizeTrackingView *sizeTrackingView;
  objc_super v3;

  sizeTrackingView = self->_sizeTrackingView;
  v3.receiver = self;
  v3.super_class = (Class)_UIRemoteViewController;
  -[UIViewController setView:](&v3, sel_setView_, sizeTrackingView);
}

- (id)_fenceForSynchronizedDrawing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[_UIRemoteViewController __shouldRemoteViewControllerFenceOperations](self, "__shouldRemoteViewControllerFenceOperations"))
  {
    v3 = (void *)MEMORY[0x186DC9484]();
    if (-[UIViewController _appearState](self, "_appearState")
      && -[_UISizeTrackingView _fencingEffectsAreVisible](self->_sizeTrackingView, "_fencingEffectsAreVisible"))
    {
      -[UIView _window](self->_sizeTrackingView, "_window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_windowHostingScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_synchronizedDrawingFence");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_synchronizeAnimationsInActionsIfNecessary:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[_UIRemoteViewController __shouldRemoteViewControllerFenceOperations](self, "__shouldRemoteViewControllerFenceOperations"))
  {
    -[_UIRemoteViewController synchronizeAnimationsInActions:](self, "synchronizeAnimationsInActions:", v4);
  }
  else
  {
    v4[2]();
  }

}

- (void)synchronizeAnimationsInActions:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id viewControllerOperatorProxy;
  __n128 v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)MEMORY[0x186DC9484]();
  -[_UIRemoteViewController _fenceForSynchronizedDrawing](self, "_fenceForSynchronizedDrawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (_UIUpdateCycleEnabled())
    {
      v10 = 0uLL;
      v11 = 0;
      _UIUpdateSchedulerRequestUpdate((uint64_t)&_UIUpdateCycleMainScheduler, 0, &v10);
      viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
      v8 = v10;
      v9 = v11;
      objc_msgSend(viewControllerOperatorProxy, "__participateInSystemAnimationFence:timing:", v6, &v8);
    }
    else
    {
      objc_msgSend(self->_viewControllerOperatorProxy, "__participateInSystemAnimationFence:", v6);
    }
    v4[2](v4);
    objc_msgSend(self->_viewControllerOperatorProxy, "__finishParticipatingInSystemAnimationFence:", v6);
  }
  else
  {
    v4[2](v4);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)synchronizeAnimationsInActionsWithSynchronousReply:(id)a3
{
  id v4;

  v4 = _Block_copy(a3);
  -[_UIRemoteViewController synchronizeAnimationsInActions:](self, "synchronizeAnimationsInActions:", v4);

}

- (void)performReplyActionsInsideSynchronousReply:(id)a3
{
  void (**v3)(void);

  v3 = (void (**)(void))_Block_copy(a3);
  v3[2]();

}

- (NSString)serviceBundleIdentifier
{
  NSString *serviceBundleIdentifier;

  serviceBundleIdentifier = self->_serviceBundleIdentifier;
  if (serviceBundleIdentifier)
    return serviceBundleIdentifier;
  -[_UIRemoteViewService identifier](self->_remoteViewService, "identifier");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (int)serviceProcessIdentifier
{
  return -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID");
}

- ($115C4C562B26FF47E01F9F4EA65B5887)serviceAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_serviceInterface;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 serviceAuditToken](result, "serviceAuditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (void)setInheritsSecurity:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[_UIRemoteView _setInheritsSecurity:](self->_serviceViewControllerRemoteView, "_setInheritsSecurity:");
  -[_UIRemoteView _setInheritsSecurity:](self->_fullScreenTextEffectsRemoteView, "_setInheritsSecurity:", v3);
  -[_UIRemoteView _setInheritsSecurity:](self->_textEffectsAboveStatusBarRemoteView, "_setInheritsSecurity:", v3);
  -[_UIRemoteView _setInheritsSecurity:](self->_remoteKeyboardRemoteView, "_setInheritsSecurity:", v3);
}

- (BOOL)inheritsSecurity
{
  return -[_UIRemoteView _inheritsSecurity](self->_serviceViewControllerRemoteView, "_inheritsSecurity");
}

- (void)_setSecurityModeForViewsLayer
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _setSecurityModeForViewsLayer](&v5, sel__setSecurityModeForViewsLayer);
  if (-[_UIRemoteViewController inheritsSecurity](self, "inheritsSecurity"))
  {
    -[UIViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSecurityMode:", *MEMORY[0x1E0CD3000]);

  }
}

- (void)setAllowedNotifications:(id)a3
{
  NSArray *v4;
  NSArray *allowedNotifications;
  NSArray *v6;

  -[_UIRemoteViewController _addAutoAllowedNotifications:](self, "_addAutoAllowedNotifications:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allowedNotifications = self->_allowedNotifications;
  self->_allowedNotifications = v4;
  v6 = v4;

  objc_msgSend(self->_textEffectsOperatorProxy, "__setHostAllowedNotifications:", self->_allowedNotifications);
}

- (id)allowedNotifications
{
  return self->_allowedNotifications;
}

- (id)forbiddenNotifications
{
  return 0;
}

- (id)_addAutoAllowedNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  id v21;
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

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[UIViewController _requiredNotificationsForRemoteServices](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v5;
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
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  -[_UIRemoteViewController forbiddenNotifications](self, "forbiddenNotifications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    if (!v6)
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          if (objc_msgSend(v6, "containsObject:", v19, (_QWORD)v23))
            objc_msgSend(v6, "removeObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }

  }
  if (v6)
    v20 = v6;
  else
    v20 = v4;
  v21 = v20;

  return v21;
}

- (void)__setMediaOverridePID:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (objc_msgSend((id)UIApp, "isFrontBoard"))
    objc_msgSend(self->_viewControllerOperatorProxy, "__setMediaOverridePID:", v3);
}

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 1;
}

- (BOOL)_shouldRemoteViewControllerFenceOriginChanges
{
  return 1;
}

- (BOOL)__shouldRemoteViewControllerFenceGeometryChange:(id *)a3 forAncestor:(id)a4
{
  return -[_UIRemoteViewController _shouldRemoteViewControllerFenceOriginChanges](self, "_shouldRemoteViewControllerFenceOriginChanges", a3, a4)|| a3->var0 != 4;
}

+ (BOOL)__shouldHostRemoteTextEffectsWindow
{
  return 1;
}

- (BOOL)_shouldUpdateRemoteTextEffectsWindow
{
  return self->__shouldUpdateRemoteTextEffectsWindow;
}

- (void)_setShouldUpdateRemoteTextEffectsWindow:(BOOL)a3
{
  self->__shouldUpdateRemoteTextEffectsWindow = a3;
  -[_UISizeTrackingView _updateTextEffectsGeometriesImmediately](self->_sizeTrackingView, "_updateTextEffectsGeometriesImmediately");
}

- (int64_t)_preferredInterfaceOrientation
{
  void *v3;
  int64_t v4;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIRemoteViewController _preferredInterfaceOrientationForWindow:](self, "_preferredInterfaceOrientationForWindow:", v3);

  return v4;
}

- (int64_t)_preferredInterfaceOrientationForWindow:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  int64_t v11;

  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "interfaceOrientation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "_windowOwnsInterfaceOrientation");

  if (v7
    && !-[NSArray containsObject:](self->_serviceViewControllerSupportedInterfaceOrientations, "containsObject:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)UIApp, "_expectedViewOrientation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSArray containsObject:](self->_serviceViewControllerSupportedInterfaceOrientations, "containsObject:", v8))
      goto LABEL_8;
    if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)UIApp, "activeInterfaceOrientation"));
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    if (-[NSArray containsObject:](self->_serviceViewControllerSupportedInterfaceOrientations, "containsObject:", v8))
    {
LABEL_8:
      v6 = v8;
    }
    else
    {
      -[NSArray firstObject](self->_serviceViewControllerSupportedInterfaceOrientations, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v11 = objc_msgSend(v6, "integerValue");

  return v11;
}

- (void)_statusBarOrientationDidChange:(id)a3
{
  void *v4;

  if (!-[_UIRemoteViewController _isUpdatingSize](self, "_isUpdatingSize", a3))
  {
    -[UIViewController _window](self, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidChangeStatusBarOrientationToInterfaceOrientation:", -[_UIRemoteViewController _preferredInterfaceOrientation](self, "_preferredInterfaceOrientation"));
  }
}

- (void)_statusBarHeightDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v9[5];

  v4 = a3;
  if (!-[_UIRemoteViewController _isUpdatingSize](self, "_isUpdatingSize"))
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIApplicationStatusBarHeightChangedDurationKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___UIRemoteViewController__statusBarHeightDidChange___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, v8);
  }

}

- (void)_applicationWillEnterForeground:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59___UIRemoteViewController__applicationWillEnterForeground___block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[_UIRemoteViewController _synchronizeAnimationsInActionsIfNecessary:](self, "_synchronizeAnimationsInActionsIfNecessary:", v3);
}

- (void)_sceneWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UISceneWillEnterForegroundNotification")) & 1) == 0)
  {

LABEL_5:
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___UIRemoteViewController__sceneWillEnterForeground___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    -[_UIRemoteViewController _synchronizeAnimationsInActionsIfNecessary:](self, "_synchronizeAnimationsInActionsIfNecessary:", v9);
    -[_UIRemoteViewController requestAppProtectionAuthIfNecessary](self, "requestAppProtectionAuthIfNecessary");
    goto LABEL_6;
  }
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _window](self, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
    goto LABEL_5;
LABEL_6:

}

- (void)_hostWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isDescendantOfView:", v6);

  if (v7)
    -[_UIRemoteViewController _applicationWillEnterForeground:](self, "_applicationWillEnterForeground:", v8);

}

- (void)_hostSceneWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
    -[_UIRemoteViewController _sceneWillEnterForeground:](self, "_sceneWillEnterForeground:", v9);

}

- (void)_pencilBarrelEventFocusEvaluatedForSceneTransition:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _existingView](self, "_existingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_eventRoutingScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 && v7 == v6)
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidEvaluatePencilBarrelEventFocusForSceneTransition");

}

- (void)_hostDidEvaluatePencilBarrelEventFocusForSceneTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v9)
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidEvaluatePencilBarrelEventFocusForSceneTransition");
}

- (void)_applicationDidEnterBackground:(id)a3
{
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidEnterBackground", a3);
  -[_UIRemoteViewController _cancelProxiedEditAlertViewAnimated:](self, "_cancelProxiedEditAlertViewAnimated:", 0);
}

- (void)_sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("UISceneDidEnterBackgroundNotification")) & 1) == 0)
  {

LABEL_5:
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostSceneDidEnterBackground");
    -[_UIRemoteViewController presentAppProtectionShieldUnconditionallyIfProtectionIsEnabled](self, "presentAppProtectionShieldUnconditionallyIfProtectionIsEnabled");
    goto LABEL_6;
  }
  objc_msgSend(v8, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _window](self, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
    goto LABEL_5;
LABEL_6:

}

- (void)_hostDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isDescendantOfView:", v6);

  if (v7)
    -[_UIRemoteViewController _applicationDidEnterBackground:](self, "_applicationDidEnterBackground:", v8);

}

- (void)_hostSceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
    -[_UIRemoteViewController _sceneDidEnterBackground:](self, "_sceneDidEnterBackground:", v9);

}

- (void)_applicationDidFinishSuspendSnapshot:(id)a3
{
  objc_msgSend(self->_textEffectsOperatorProxy, "__hostDidEnterBackground", a3);
}

- (BOOL)_windowSceneIsKeyboardWindowScene:(uint64_t)a1
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled")
      && objc_msgSend(v4, "_hasSettingsScene"))
    {
      objc_msgSend(v4, "screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIWindowScene _keyboardWindowSceneForScreen:create:](UIWindowScene, "_keyboardWindowSceneForScreen:create:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7 == v4;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)textEffectsWindowForServiceScreen
{
  void *v2;
  void *v3;
  void *v4;

  -[UIViewController _window](self, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_restoreTextEffectsRemoteView
{
  UIView *fullScreenTextEffectsSnapshotView;
  UIView *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UITextEffectsRemoteView *remoteKeyboardRemoteView;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  _UIRemoteViewController *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  fullScreenTextEffectsSnapshotView = self->_fullScreenTextEffectsSnapshotView;
  if (fullScreenTextEffectsSnapshotView)
  {
    -[UIView removeFromSuperview](fullScreenTextEffectsSnapshotView, "removeFromSuperview");
    v4 = self->_fullScreenTextEffectsSnapshotView;
    self->_fullScreenTextEffectsSnapshotView = 0;

  }
  if (objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
  {
    -[UIViewController _window](self, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_fullScreenTextEffectsRemoteView)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (!v7)
    {
      -[_UIRemoteViewController textEffectsWindowForServiceScreen](self, "textEffectsWindowForServiceScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_fullScreenTextEffectsRemoteView);

    }
    if (self->_textEffectsAboveStatusBarRemoteView)
    {
      -[UIViewController _window](self, "_window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "windowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_textEffectsAboveStatusBarRemoteView);

    }
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      if (!self->_callerID)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            v20 = 138412290;
            v21 = self;
            _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", (uint8_t *)&v20, 0xCu);
          }

        }
        else
        {
          v17 = _restoreTextEffectsRemoteView___s_category;
          if (!_restoreTextEffectsRemoteView___s_category)
          {
            v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v17, (unint64_t *)&_restoreTextEffectsRemoteView___s_category);
          }
          v18 = *(NSObject **)(v17 + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v20 = 138412290;
            v21 = self;
            _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", (uint8_t *)&v20, 0xCu);
          }
        }
      }
      +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
    }
    else
    {
      if (!self->_remoteKeyboardRemoteView)
      {
LABEL_17:

        return;
      }
      +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
      v14 = -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID");
      -[_UIRemoteViewController textEffectsWindowForServiceScreen](self, "textEffectsWindowForServiceScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "windowScene");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addHostedWindowView:fromPID:forScene:callerID:", remoteKeyboardRemoteView, v14, v16, self->_callerID);

    }
    goto LABEL_17;
  }
}

- (void)_snapshotAndRemoveTextEffectsRemoteView
{
  UIView *fullScreenTextEffectsSnapshotView;
  UIView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  UIView *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (qword_1ECD78A50 != -1)
    dispatch_once(&qword_1ECD78A50, &__block_literal_global_611);
  if (!_MergedGlobals_66)
  {
    fullScreenTextEffectsSnapshotView = self->_fullScreenTextEffectsSnapshotView;
    if (fullScreenTextEffectsSnapshotView)
    {
      -[UIView removeFromSuperview](fullScreenTextEffectsSnapshotView, "removeFromSuperview");
      v4 = self->_fullScreenTextEffectsSnapshotView;
      self->_fullScreenTextEffectsSnapshotView = 0;

    }
    if (objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow")
      && -[_UIRemoteViewController _shouldUpdateRemoteTextEffectsWindow](self, "_shouldUpdateRemoteTextEffectsWindow"))
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _window](self, "_window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "windowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v7, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v5)
        objc_msgSend(v9, "addObject:", v5);
      if (v8)
        objc_msgSend(v10, "addObject:", v8);
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v8, "bounds");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v26 = *MEMORY[0x1E0CD3148];
        v27[0] = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _UISnapshotWindowsAtViewRect(v10, v8, v19, v12, v14, v16, v18);
        v20 = (UIView *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "bounds");
        -[UIView setFrame:](v20, "setFrame:");
        -[UIView setUserInteractionEnabled:](v20, "setUserInteractionEnabled:", 0);
        -[UIViewController _window](self, "_window");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "windowScene");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v22, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addSubview:", v20);

        v24 = self->_fullScreenTextEffectsSnapshotView;
        self->_fullScreenTextEffectsSnapshotView = v20;

      }
      -[_UIRemoteViewController _removeTextEffectsRemoteViews](self, "_removeTextEffectsRemoteViews");
      -[UIViewController _window](self, "_window");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIRemoteViewController _noteWindowState:](self, "_noteWindowState:", v25 != 0);

    }
  }
}

- (void)_removeTextEffectsRemoteViews
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  _UIRemoteViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[UIView removeFromSuperview](self->_fullScreenTextEffectsRemoteView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_textEffectsAboveStatusBarRemoteView, "removeFromSuperview");
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          v7 = 138412290;
          v8 = self;
          _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", (uint8_t *)&v7, 0xCu);
        }

      }
      else
      {
        v4 = _removeTextEffectsRemoteViews___s_category;
        if (!_removeTextEffectsRemoteViews___s_category)
        {
          v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, (unint64_t *)&_removeTextEffectsRemoteViews___s_category);
        }
        v5 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v7 = 138412290;
          v8 = self;
          _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", (uint8_t *)&v7, 0xCu);
        }
      }
    }
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);

  }
  else
  {
    -[UIView removeFromSuperview](self->_remoteKeyboardRemoteView, "removeFromSuperview");
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  self->_snapshotTextEffectsAfterRotation = 0;
  -[_UIRemoteViewController _restoreTextEffectsRemoteView](self, "_restoreTextEffectsRemoteView", a3);
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidBecomeActive");
  -[_UIRemoteViewController _updateServiceSceneContext](self, "_updateServiceSceneContext");
}

- (void)_applicationWillDeactivate:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (qword_1ECD78A60 != -1)
    dispatch_once(&qword_1ECD78A60, &__block_literal_global_415);
  v4 = qword_1ECD78A58;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_applicationDeactivationReason);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend((id)v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
    -[_UIRemoteViewController _snapshotAndRemoveTextEffectsRemoteView](self, "_snapshotAndRemoveTextEffectsRemoteView");
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostWillResignActive");

}

- (void)_viewServiceHostWillDeactivate:(id)a3
{
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostWillResignActive", a3);
}

- (void)_viewServiceHostDidBecomeActive:(id)a3
{
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidBecomeActive", a3);
}

- (void)_applicationWillAddDeactivationReason:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_applicationDeactivationReason = objc_msgSend(v4, "intValue");

}

- (void)_systemApplicationWillLock:(id)a3
{
  self->_systemAppIsLocked = 1;
  -[_UIRemoteViewController _updateLockStatusHostingVisibility](self, "_updateLockStatusHostingVisibility", a3);
}

- (void)_systemApplicationDidUnlock:(id)a3
{
  self->_systemAppIsLocked = 0;
  -[_UIRemoteViewController _updateLockStatusHostingVisibility](self, "_updateLockStatusHostingVisibility", a3);
}

- (BOOL)observesLockNotifications
{
  return self->_observesLockNotifications;
}

- (void)setObservesLockNotifications:(BOOL)a3
{
  self->_observesLockNotifications = a3;
  -[_UIRemoteViewController _updateLockStatusHostingVisibility](self, "_updateLockStatusHostingVisibility");
}

- (void)_updateLockStatusHostingVisibility
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _UITextEffectsRemoteView *fullScreenTextEffectsRemoteView;
  void *v10;
  void *v11;
  _UITextEffectsRemoteView *textEffectsAboveStatusBarRemoteView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  _UITextEffectsRemoteView *remoteKeyboardRemoteView;
  void *v21;
  _UITextEffectsRemoteView *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  uint8_t buf[4];
  _UIRemoteViewController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (self->_observesLockNotifications && self->_systemAppIsLocked)
    goto LABEL_17;
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_17;
  }
  v5 = (void *)v4;
  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  if (v8)
  {
LABEL_17:
    -[UIView removeFromSuperview](self->_fullScreenTextEffectsRemoteView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_textEffectsAboveStatusBarRemoteView, "removeFromSuperview");
    if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      -[UIView removeFromSuperview](self->_remoteKeyboardRemoteView, "removeFromSuperview");
      return;
    }
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = self;
          _os_log_fault_impl(&dword_185066000, v30, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }

      }
      else
      {
        v26 = qword_1ECD78A68;
        if (!qword_1ECD78A68)
        {
          v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v26, (unint64_t *)&qword_1ECD78A68);
        }
        v27 = *(NSObject **)(v26 + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = self;
          _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
    }
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
LABEL_20:

    return;
  }
  if (!objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
    return;
  fullScreenTextEffectsRemoteView = self->_fullScreenTextEffectsRemoteView;
  if (fullScreenTextEffectsRemoteView)
  {
    -[UIView superview](fullScreenTextEffectsRemoteView, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[_UIRemoteViewController textEffectsWindowForServiceScreen](self, "textEffectsWindowForServiceScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_fullScreenTextEffectsRemoteView);

    }
  }
  textEffectsAboveStatusBarRemoteView = self->_textEffectsAboveStatusBarRemoteView;
  if (textEffectsAboveStatusBarRemoteView)
  {
    -[UIView superview](textEffectsAboveStatusBarRemoteView, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[UIViewController _window](self, "_window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "windowScene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", self->_textEffectsAboveStatusBarRemoteView);

    }
  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasWindowHostingCallerID:", self->_callerID);

    if ((v18 & 1) != 0)
      return;
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = self;
          _os_log_fault_impl(&dword_185066000, v31, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }

      }
      else
      {
        v28 = qword_1ECD78A70;
        if (!qword_1ECD78A70)
        {
          v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v28, (unint64_t *)&qword_1ECD78A70);
        }
        v29 = *(NSObject **)(v28 + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = self;
          _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
    }
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
    goto LABEL_20;
  }
  remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
  if (remoteKeyboardRemoteView)
  {
    -[UIView superview](remoteKeyboardRemoteView, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v22 = self->_remoteKeyboardRemoteView;
      v23 = -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID");
      -[_UIRemoteViewController textEffectsWindowForServiceScreen](self, "textEffectsWindowForServiceScreen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "windowScene");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addHostedWindowView:fromPID:forScene:callerID:", v22, v23, v25, self->_callerID);

    }
  }
}

- (void)_uirvc_windowResignedKey:(id)a3
{
  self->_wasKeyboardEnvironmentEventDeferringBeforeResignKey = self->_wantsKeyboardEnvironmentEventDeferring;
  -[_UIRemoteViewController _setWantsKeyboardEnvironmentEventDeferring:](self, "_setWantsKeyboardEnvironmentEventDeferring:", 0);
}

- (void)_uirvc_windowBecameKey:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  if (self->_wasKeyboardEnvironmentEventDeferringBeforeResignKey
    || (-[UIViewController _screen](self, "_screen"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = -[_UIRemoteViewController _wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:](self, "_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:", v4), v4, v5))
  {
    -[_UIRemoteViewController _setWantsKeyboardEnvironmentEventDeferring:](self, "_setWantsKeyboardEnvironmentEventDeferring:", 1);
  }
  self->_wasKeyboardEnvironmentEventDeferringBeforeResignKey = 0;

}

- (void)_uirvc_keyboardWindowSceneSettingsSceneWillChange:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(a3, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v11;
    v7 = -[_UIRemoteViewController _windowSceneIsKeyboardWindowScene:]((uint64_t)self, v6);
    -[UIViewController _existingView](self, "_existingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 && v6 == v10)
    {
      if (self->_keyboardEnvironmentDeferringToken)
        -[_UIRemoteViewController _setWantsKeyboardEnvironmentEventDeferring:](self, "_setWantsKeyboardEnvironmentEventDeferring:", 0);
      if (self->_dynamicButtonDeferringToken)
        -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t *)self);
    }

    v5 = v11;
  }

}

- (void)_uirvc_applicationKeyWindowWillChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    -[UIViewController _existingView](self, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "_isRemoteKeyboardWindow") && v5 != v4)
    {
      if (self->_keyboardEnvironmentDeferringToken)
        -[_UIRemoteViewController _setWantsKeyboardEnvironmentEventDeferring:](self, "_setWantsKeyboardEnvironmentEventDeferring:", 0);
      if (self->_dynamicButtonDeferringToken)
        -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t *)self);
    }

  }
}

- (void)_uirvc_windowWillMoveToScene:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a3, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v9;
    -[UIViewController _existingView](self, "_existingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_window");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {
      if (self->_keyboardEnvironmentDeferringToken)
      {
        self->_wasKeyboardEnvironmentEventDeferringBeforeSceneMove = 1;
        -[_UIRemoteViewController _setWantsKeyboardEnvironmentEventDeferring:](self, "_setWantsKeyboardEnvironmentEventDeferring:", 0);
      }
      if (self->_dynamicButtonDeferringToken)
        -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t *)self);
    }

    v5 = v9;
  }

}

- (void)_uirvc_windowDidMoveToScene:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _UIPhysicalButtonConfigurationSet *serviceResolvedPhysicalButtonConfigurations;
  void *v10;

  objc_msgSend(a3, "object");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v10;
    -[UIViewController _existingView](self, "_existingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_window");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {
      if (self->_wasKeyboardEnvironmentEventDeferringBeforeSceneMove)
      {
        -[_UIRemoteViewController _setWantsKeyboardEnvironmentEventDeferring:](self, "_setWantsKeyboardEnvironmentEventDeferring:", 1);
        self->_wasKeyboardEnvironmentEventDeferringBeforeSceneMove = 0;
      }
      serviceResolvedPhysicalButtonConfigurations = self->_serviceResolvedPhysicalButtonConfigurations;
      if (serviceResolvedPhysicalButtonConfigurations
        && -[_UIPhysicalButtonConfigurationSet _count](serviceResolvedPhysicalButtonConfigurations, "_count"))
      {
        -[_UIRemoteViewController _updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:newResolvedConfigurations:](self, self->_serviceResolvedPhysicalButtonConfigurations, self->_serviceResolvedPhysicalButtonConfigurations);
      }
      -[_UIRemoteViewController _updateParentHostingRegistryIfNecessaryForWindow:]((uint64_t)self, v6);
    }

    v5 = v10;
  }

}

- (void)_updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:(void *)a3 newResolvedConfigurations:
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v20;
  _BOOL4 v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_41;
  v7 = v5;
  v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_41;
  }
  v9 = v8;
  if (v7 && v8)
  {
    v10 = objc_msgSend(v7, "isEqual:", v8);

    if ((v10 & 1) != 0)
      goto LABEL_41;
  }
  else
  {

  }
  v33 = v5;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v11);
        objc_msgSend(MEMORY[0x1E0D00CA8], "ui_environmentForUIPhysicalButton:", objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "_button"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          if (!v14)
            v14 = (void *)objc_opt_new();
          objc_msgSend(v14, "addObject:", v17);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  if (!a1[158])
  {
    v18 = 0;
LABEL_27:
    v19 = objc_msgSend(v14, "count") != 0;
    if (!v11)
      goto LABEL_30;
    goto LABEL_28;
  }
  v18 = objc_msgSend(v14, "count") != 0;
  if (!a1[158])
    goto LABEL_27;
  v19 = 0;
  if (!v11)
    goto LABEL_30;
LABEL_28:
  v20 = (void *)v11[1];
  if (v20)
  {
    v21 = objc_msgSend(v20, "count") == 0;
    goto LABEL_31;
  }
LABEL_30:
  v21 = 1;
LABEL_31:
  v22 = objc_msgSend(a1, "_appearState");
  v23 = 0;
  if (v22 && v22 != 3)
    v23 = v18 || v19;
  v5 = v33;
  if ((v21 | v23) == 1)
  {
    -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded](a1);
    objc_msgSend(a1, "_existingView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "_count") && v25 && objc_msgSend(a1, "serviceProcessIdentifier"))
    {
      objc_msgSend(v25, "windowScene");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_eventDeferringManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: begin remote deferring for dynamic buttons"), objc_opt_class(), a1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(a1, "_hostedWindowServiceDeferringTarget");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager beginRemoteEventDeferringInEnvironments:forOwningInterfaceElement:toTarget:withReason:]((uint64_t)v27, v29, a1, v30, v28);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)a1[158];
      a1[158] = v31;

      objc_msgSend(a1, "_beginObservingNotificationsForEventDeferringIfNeeded");
    }

  }
LABEL_41:

}

- (void)_updateTouchGrabbingView
{
  void *v3;
  _UIRemoteViewController *v4;
  _UIRemoteViewController *v5;
  id *p_isa;
  _BOOL4 v7;
  _UIRemoteViewController *v8;
  _UIRemoteViewController *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _UIRemoteViewControllerTouchGrabbingView *v18;
  id v19;
  void *v20;
  id v21;
  id v22;

  -[UIViewController navigationController](self, "navigationController");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (_UIRemoteViewController *)objc_claimAutoreleasedReturnValue();

  v5 = self;
  p_isa = (id *)&v5->super.super.super.isa;
  v7 = v5 == 0;
  v8 = v5;
  if (v5 && v4 != v5)
  {
    v8 = v5;
    do
    {
      v9 = v8;
      -[UIViewController parentViewController](v8, "parentViewController");
      v8 = (_UIRemoteViewController *)objc_claimAutoreleasedReturnValue();

      v7 = v8 == 0;
    }
    while (v8 && v8 != v4);
  }
  v10 = p_isa[150];
  if (v22 && v7)
  {
    if (!v10)
    {
      objc_msgSend(p_isa, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;

      objc_msgSend(v22, "_builtinInteractionController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "screenEdgePanGestureRecognizer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_edgeRegionSize");
      v17 = v16;

      if (v17 > 0.0)
      {
        v18 = -[UIView initWithFrame:]([_UIRemoteViewControllerTouchGrabbingView alloc], "initWithFrame:", 0.0, 0.0, v17, v13);
        v19 = p_isa[150];
        p_isa[150] = v18;

        objc_msgSend(p_isa[150], "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setHitTestsAsOpaque:", 1);

        objc_msgSend(p_isa[150], "setUserInteractionEnabled:", 0);
        objc_msgSend(p_isa[150], "setAutoresizingMask:", 20);
        objc_msgSend(p_isa, "view");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSubview:", p_isa[150]);
LABEL_13:

      }
    }
  }
  else if (v10)
  {
    objc_msgSend(v10, "removeFromSuperview");
    v21 = p_isa[150];
    p_isa[150] = 0;
    goto LABEL_13;
  }

}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3 andLeftMargin:(double)a4 rightMargin:(double)a5
{
  double right;
  CGFloat bottom;
  double left;
  double top;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v26;
  _QWORD v27[11];
  objc_super v28;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v28.receiver = self;
  v28.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _setContentOverlayInsets:andLeftMargin:rightMargin:](&v28, sel__setContentOverlayInsets_andLeftMargin_rightMargin_);
  if (!_UIDeviceNativeUserInterfaceIdiom())
  {
    if ((os_variant_has_internal_diagnostics() & 1) != 0)
    {
      if (!dyld_program_sdk_at_least())
        goto LABEL_24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isCarrierInstall") & 1) != 0)
      {
        v13 = dyld_program_sdk_at_least();

        if ((v13 & 1) == 0)
          goto LABEL_24;
      }
      else
      {

      }
    }
  }
  -[UIViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "userInterfaceIdiom"))
  {

    goto LABEL_24;
  }
  -[_UIRemoteViewController serviceBundleIdentifier](self, "serviceBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple."));

  if ((v16 & 1) != 0)
    goto LABEL_24;
  -[UIViewController _window](self, "_window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaInsets");
  v26 = v18;
  v20 = v19;
  v22 = v21;

  -[UIViewController _window](self, "_window");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v23, "interfaceOrientation") - 3) > 1)
  {

  }
  else
  {
    if (vabdd_f64(left, v20) < 0.1 && left > 50.0)
    {

LABEL_23:
      left = 44.0;
      right = 44.0;
      goto LABEL_24;
    }

    if (vabdd_f64(right, v22) < 0.1 && right > 50.0)
      goto LABEL_23;
  }
  v24 = vabdd_f64(top, v26);
  if (top > 50.0 && v24 < 0.1)
    top = 44.0;
LABEL_24:
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __78___UIRemoteViewController__setContentOverlayInsets_andLeftMargin_rightMargin___block_invoke;
  v27[3] = &unk_1E16BF720;
  v27[4] = self;
  *(double *)&v27[5] = top;
  *(double *)&v27[6] = left;
  *(CGFloat *)&v27[7] = bottom;
  *(double *)&v27[8] = right;
  *(double *)&v27[9] = a4;
  *(double *)&v27[10] = a5;
  -[_UIRemoteViewController _synchronizeAnimationsInActionsIfNecessary:](self, "_synchronizeAnimationsInActionsIfNecessary:", v27, *(_QWORD *)&v26);
}

- (id)_terminateWithError:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  os_unfair_lock_lock(&self->_terminationErrorLock);
  if (!self->_terminationError)
    objc_storeStrong((id *)&self->_terminationError, a3);
  os_unfair_lock_unlock(&self->_terminationErrorLock);
  -[_UIAsyncInvocation invoke](self->_terminationInvocation, "invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)disconnect
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  _UIRemoteViewController *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = disconnect___s_category;
  if (!disconnect___s_category)
  {
    v3 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&disconnect___s_category);
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
    v14 = v9;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Disconnect requested for remote view controller: %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceErrorDomain"), 1, &unk_1E1A9B6D0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteViewController _terminateWithError:](self, "_terminateWithError:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_terminateUnconditionallyThen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _UIRemoteViewController *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIApplicationDidChangeStatusBarOrientationNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIApplicationStatusBarHeightChangedNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UISceneWillEnterForegroundNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, 0x1E1784A60, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, 0x1E1784AA0, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UIPencilEventDidEvaluateBarrelFocusForSceneTransition"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UIViewServiceHostDidEvaluatePencilBarrelEventFocusForSceneTransition"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UISceneDidEnterBackgroundNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, 0x1E1784A40, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, 0x1E1784A80, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, 0x1E172F5C0, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, _UIWindowDidAttachContextNotification, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, _UIWindowDidDetachContextNotification, 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UISystemApplicationWillLockNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UISystemApplicationDidUnlockNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UIScreenDisplayConfigurationUpdatedNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIScreenReferenceDisplayModeStatusDidChangeNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UIWindowSceneEnhancedWindowingModeChanged"), 0);
  -[_UIAsyncInvocation invoke](self->_viewControllerOperatorHalfDisconnectionInvocation, "invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  -[_UIAsyncInvocation invoke](self->_textEffectsOperatorHalfDisconnectionInvocation, "invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke;
  v10[3] = &unk_1E16E8A10;
  v11 = v4;
  v12 = self;
  v9 = v4;
  +[_UIAsyncInvocationObserver whenInvocationsCompleteForObservers:do:](_UIAsyncInvocationObserver, "whenInvocationsCompleteForObservers:do:", v8, v10);

}

- (void)_objc_initiateDealloc
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  _UIRemoteViewController *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = _objc_initiateDealloc___s_category;
  if (!_objc_initiateDealloc___s_category)
  {
    v3 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&_objc_initiateDealloc___s_category);
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
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Initiating deallocation for remote view controller: %{public}@", buf, 0xCu);

  }
  if (self)
    *((_WORD *)&self->super._viewControllerFlags + 4) |= 0x80u;
  -[_UIRemoteViewController disconnect](self, "disconnect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48___UIRemoteViewController__objc_initiateDealloc__block_invoke;
  v11[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v11[4] = self;
  objc_msgSend(v10, "whenCompleteDo:", v11);

}

- (void)dealloc
{
  _UIRemoteViewService *remoteViewService;
  void *v4;
  _UISceneKeyboardProxyLayerForwardingPresentationViewService *keyboardProxyPresentationEnvironment;
  _UISceneKeyboardProxyLayerForwardingPresentationViewService *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  _UIRemoteViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  remoteViewService = self->_remoteViewService;
  self->_remoteViewService = 0;

  -[UIView removeFromSuperview](self->_fullScreenTextEffectsRemoteView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_fullScreenTextEffectsSnapshotView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_textEffectsAboveStatusBarRemoteView, "removeFromSuperview");
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v12 = self;
          _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }

      }
      else
      {
        v7 = dealloc___s_category_12;
        if (!dealloc___s_category_12)
        {
          v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v7, (unint64_t *)&dealloc___s_category_12);
        }
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v12 = self;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
    }
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);

  }
  else
  {
    -[UIView removeFromSuperview](self->_remoteKeyboardRemoteView, "removeFromSuperview");
  }
  -[UIView removeFromSuperview](self->_viewServiceTouchInterdictionView, "removeFromSuperview");
  keyboardProxyPresentationEnvironment = self->_keyboardProxyPresentationEnvironment;
  if (keyboardProxyPresentationEnvironment)
  {
    -[_UISceneKeyboardProxyLayerForwardingPresentationViewService invalidate]((uint64_t)keyboardProxyPresentationEnvironment);
    v6 = self->_keyboardProxyPresentationEnvironment;
    self->_keyboardProxyPresentationEnvironment = 0;

  }
  -[APExtensionSubjectMonitorRegistry invalidate](self->_appProtectionSubjectMonitorRegistry, "invalidate");
  v10.receiver = self;
  v10.super_class = (Class)_UIRemoteViewController;
  -[UIViewController dealloc](&v10, sel_dealloc);
}

- (void)__viewServiceDidChangeHasScrollToTopView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _UISizeTrackingView *sizeTrackingView;
  id v7;

  if (self->_serviceHasScrollToTopView != a3)
  {
    v3 = a3;
    self->_serviceHasScrollToTopView = a3;
    -[UIView window](self->_serviceViewControllerRemoteView, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sizeTrackingView = self->_sizeTrackingView;
    v7 = v5;
    if (v3)
      objc_msgSend(v5, "_registerScrollToTopView:", sizeTrackingView);
    else
      objc_msgSend(v5, "_unregisterScrollToTopView:", sizeTrackingView);

  }
}

- (void)_scrollToTopFromTouchAtViewLocation:(CGPoint)a3 resultHandler:(id)a4
{
  double y;
  double x;
  id v7;
  id viewControllerOperatorProxy;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke;
  v15[3] = &unk_1E16CCBA0;
  v10 = v7;
  v16 = v10;
  objc_msgSend(viewControllerOperatorProxy, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_3;
  v13[3] = &unk_1E16DD130;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "__scrollToTopFromTouchAtViewLocation:resultHandler:", v13, x, y);

}

- (BOOL)_serviceHasScrollToTopView
{
  return self->_serviceHasScrollToTopView;
}

- (BOOL)_isHostingRemoteContent
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_firstResponderDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _UIRemoteViewController *v8;
  void *v9;
  char v10;
  BOOL v11;
  char v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", 0x1E1765240);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v21, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("UIWindowFirstResponderUserInfoKey"));
  v8 = (_UIRemoteViewController *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "handlingRemoteEvent");

  if ((v6 & 1) != 0)
  {
    if ((v10 & 1) != 0)
      goto LABEL_20;
LABEL_11:
    objc_msgSend(v21, "object");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (_UIWindowKeyWindowAPIIsSceneLevel())
      v14 = objc_msgSend(v13, "isKeyWindow");
    else
      v14 = objc_msgSend(v13, "_isApplicationKeyWindow");
    v15 = v14;
    -[UIViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      objc_msgSend(v13, "_windowHostingScene");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v15 & ~objc_msgSend(v19, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal") | v6;

      if (v20 != 1)
        goto LABEL_19;
    }
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidPromoteFirstResponder");
    -[_UIRemoteViewController _setWantsKeyboardEnvironmentEventDeferring:](self, "_setWantsKeyboardEnvironmentEventDeferring:", 0);
LABEL_19:

    goto LABEL_20;
  }
  if (v8)
    v11 = v8 == self;
  else
    v11 = 1;
  if (v11)
    v12 = 1;
  else
    v12 = v10;
  if ((v12 & 1) == 0)
    goto LABEL_11;
LABEL_20:

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UITextEffectsRemoteView *remoteKeyboardRemoteView;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int *v16;
  uint64_t v17;
  id textEffectsOperatorProxy;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  BOOL v24;
  objc_super v25;
  uint8_t buf[4];
  _UIRemoteViewController *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationWillDeactivate_, CFSTR("UIApplicationWillResignActiveNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__viewServiceHostDidBecomeActive_, 0x1E1784AC0, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__viewServiceHostWillDeactivate_, 0x1E1784AE0, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationWillAddDeactivationReason_, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__systemApplicationWillLock_, CFSTR("_UISystemApplicationWillLockNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__systemApplicationDidUnlock_, CFSTR("_UISystemApplicationDidUnlockNotification"), 0);
  -[_UIRemoteViewController _beginObservingSceneMoveNotificationsIfNeeded](self, "_beginObservingSceneMoveNotificationsIfNeeded");
  if (!objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
    goto LABEL_12;
  if (self->_fullScreenTextEffectsRemoteView)
  {
    -[_UIRemoteViewController textEffectsWindowForServiceScreen](self, "textEffectsWindowForServiceScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_fullScreenTextEffectsRemoteView);

  }
  if (self->_textEffectsAboveStatusBarRemoteView)
  {
    -[UIViewController _window](self, "_window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_textEffectsAboveStatusBarRemoteView);

  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = self;
          _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }

      }
      else
      {
        v20 = viewWillAppear____s_category_0;
        if (!viewWillAppear____s_category_0)
        {
          v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v20, (unint64_t *)&viewWillAppear____s_category_0);
        }
        v21 = *(NSObject **)(v20 + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = self;
          _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
    }
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
  }
  else
  {
    if (!self->_remoteKeyboardRemoteView)
      goto LABEL_12;
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
    v12 = -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID");
    -[_UIRemoteViewController textEffectsWindowForServiceScreen](self, "textEffectsWindowForServiceScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addHostedWindowView:fromPID:forScene:callerID:", remoteKeyboardRemoteView, v12, v14, self->_callerID);

  }
LABEL_12:
  v25.receiver = self;
  v25.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewWillAppear:](&v25, sel_viewWillAppear_, v3);
  -[_UIRemoteViewController setupAppProtectionIfNecessary](self, "setupAppProtectionIfNecessary");
  -[UIViewController presentingViewController](self, "presentingViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentAction");
  v16 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = v16[4];
  else
    v17 = 0;

  textEffectsOperatorProxy = self->_textEffectsOperatorProxy;
  v19 = +[UIViewController _keyboardDirectionForTransition:](UIViewController, "_keyboardDirectionForTransition:", v17);
  +[UIViewController durationForTransition:](UIViewController, "durationForTransition:", v17);
  objc_msgSend(textEffectsOperatorProxy, "__setNextAutomaticOrderOutDirection:duration:", v19);
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDisablesAutomaticKeyboardBehavior:", -[UIResponder _disableAutomaticKeyboardBehavior](self, "_disableAutomaticKeyboardBehavior"));
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __42___UIRemoteViewController_viewWillAppear___block_invoke;
  v23[3] = &unk_1E16B1B78;
  v23[4] = self;
  v24 = v3;
  -[_UIRemoteViewController _synchronizeAnimationsInActionsIfNecessary:](self, "_synchronizeAnimationsInActionsIfNecessary:", v23);

}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  if ((*(_BYTE *)&self->_remoteViewControllerFlags & 0x20) != 0)
  {
    -[_UIRemoteViewController presentAppProtectionShieldIfServiceCurrentlyRequiresAuth](self, "presentAppProtectionShieldIfServiceCurrentlyRequiresAuth");
    *(_BYTE *)&self->_remoteViewControllerFlags &= ~0x20u;
  }
  -[_UIRemoteViewController requestAppProtectionAuthIfNecessary](self, "requestAppProtectionAuthIfNecessary");
}

- (void)_updateServiceSceneContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  -[UIViewController _existingView](self, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController _existingView](self, "_existingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIRemoteViewControllerSceneContext contextForWindow:inScene:]((uint64_t)_UIRemoteViewControllerSceneContext, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v8, "isEqual:", self->_serviceSceneContext) & 1) == 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___UIRemoteViewController__updateServiceSceneContext__block_invoke;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v10 = v8;
    -[_UIRemoteViewController _synchronizeAnimationsInActionsIfNecessary:](self, "_synchronizeAnimationsInActionsIfNecessary:", v9);
    objc_storeStrong((id *)&self->_serviceSceneContext, v8);

  }
}

- (void)_movedToParentSceneWithSettings:(id)a3
{
  id v4;
  int v5;
  Class *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "isUISubclass");
  v6 = (Class *)off_1E167A340;
  if (!v5)
    v6 = (Class *)0x1E0D23208;
  v8 = (id)objc_msgSend(objc_alloc(*v6), "initWithSettings:", v4);

  v7 = (void *)BSCreateSerializedBSXPCEncodableObject();
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidMoveToParentSceneWithSettings:", v7);

}

- (void)_parentSceneDidUpdateWithDiff:(id)a3
{
  id v4;

  v4 = (id)BSCreateSerializedBSXPCEncodableObject();
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostSceneDidUpdateWithDiff:", v4);

}

- (void)_screenDidConnect:(id)a3
{
  id viewControllerOperatorProxy;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)UIApp, "_isSpringBoard") || (objc_msgSend(v6, "_isCarScreen") & 1) == 0)
  {
    viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
    objc_msgSend(v6, "displayConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(viewControllerOperatorProxy, "__hostDidAttachDisplay:", v5);

  }
}

- (void)_screenDidUpdate:(id)a3
{
  id viewControllerOperatorProxy;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  objc_msgSend(v6, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(viewControllerOperatorProxy, "__hostDidUpdateDisplay:", v5);

}

- (void)_screenDidDisconnect:(id)a3
{
  void *v4;
  void *v5;
  FBSDisplayIdentity *lastNotifiedServiceScreenDisplayIdentity;
  void *v7;
  FBSDisplayIdentity *v8;
  FBSDisplayIdentity *v9;
  void *v10;
  BOOL v11;
  int v12;
  id viewControllerOperatorProxy;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = v4;
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v15, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    lastNotifiedServiceScreenDisplayIdentity = self->_lastNotifiedServiceScreenDisplayIdentity;
    objc_msgSend(v5, "displayIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = lastNotifiedServiceScreenDisplayIdentity;
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {

LABEL_14:
LABEL_15:
        viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
        objc_msgSend(v5, "displayConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(viewControllerOperatorProxy, "__hostDidDetachDisplay:", v14);

        goto LABEL_16;
      }
      v12 = -[FBSDisplayIdentity isEqual:](v8, "isEqual:", v9);

      if (!v12)
        goto LABEL_15;
    }
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteViewController _notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:](self, "_notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:", v10);
    goto LABEL_14;
  }
LABEL_17:

}

- (void)_screenDidUpdateCapture:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  id v14;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v12 = v11;
  if (v14 == v12)
  {

  }
  else
  {
    if (!v14 || !v12)
    {

      goto LABEL_14;
    }
    v13 = objc_msgSend(v14, "isEqual:", v12);

    if ((v13 & 1) == 0)
      goto LABEL_14;
  }
  -[_UIRemoteViewController _updateServiceSceneContext](self, "_updateServiceSceneContext");
LABEL_14:

}

- (void)_referenceDisplayModeStatusDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "object");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _existingView](self, "_existingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
    -[_UIRemoteViewController _updateServiceSceneContext](self, "_updateServiceSceneContext");

}

- (void)_enhancedWindowingModeDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _window](self, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    -[_UIRemoteViewController _updateServiceSceneContext](self, "_updateServiceSceneContext");
    v6 = v7;
  }

}

- (void)_systemReferenceAngleDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  _UIRemoteViewController *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIViewController _existingView](self, "_existingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5D28]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58___UIRemoteViewController__systemReferenceAngleDidChange___block_invoke;
    v16[3] = &unk_1E16E8A38;
    v17 = v6;
    if (objc_msgSend(v8, "bs_containsObjectPassingTest:", v16))
    {
      v9 = _systemReferenceAngleDidChange____s_category;
      if (!_systemReferenceAngleDidChange____s_category)
      {
        v9 = __UILogCategoryGetNode("SystemReferenceAngle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&_systemReferenceAngleDidChange____s_category);
      }
      if ((*(_BYTE *)v9 & 1) != 0)
      {
        v10 = *(id *)(v9 + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          if (self)
          {
            v11 = (void *)MEMORY[0x1E0CB3940];
            v12 = self;
            v13 = (objc_class *)objc_opt_class();
            NSStringFromClass(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v12);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v15 = CFSTR("(nil)");
          }
          *(_DWORD *)buf = 138543362;
          v19 = v15;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "%{public}@: The system reference angle changed affecting a remote view controller. Pushing new angle to service.", buf, 0xCu);

        }
      }
      -[_UIRemoteViewController _updateServiceSceneContext](self, "_updateServiceSceneContext");
    }

  }
}

- (void)_notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL4 wantsKeyboardEnvironmentEventDeferring;
  int v8;
  uint64_t v9;
  int v10;
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  _UIRemoteViewController *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBSDisplayIdentity isEqual:](self->_lastNotifiedServiceScreenDisplayIdentity, "isEqual:", v5) ^ 1;
  if (v4 && v6)
  {
    objc_storeStrong((id *)&self->_lastNotifiedServiceScreenDisplayIdentity, v5);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke;
    v16 = &unk_1E16B1B50;
    v17 = self;
    v18 = v4;
    -[_UIRemoteViewController synchronizeAnimationsInActionsWithSynchronousReply:](self, "synchronizeAnimationsInActionsWithSynchronousReply:", &v13);

  }
  wantsKeyboardEnvironmentEventDeferring = self->_wantsKeyboardEnvironmentEventDeferring;
  v8 = objc_msgSend(v4, "supportsFocus", v13, v14, v15, v16, v17);
  v9 = objc_msgSend(v4, "_userInterfaceIdiom");
  if (v8 && v9 == 3)
  {
    v10 = wantsKeyboardEnvironmentEventDeferring ? v6 : 1;
    if (v4)
    {
      if (v10)
      {
        v11 = -[_UIRemoteViewController _wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:](self, "_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:", v4);
        if (self->_wantsKeyboardEnvironmentEventDeferring != v11)
          -[_UIRemoteViewController _setWantsKeyboardEnvironmentEventDeferring:](self, "_setWantsKeyboardEnvironmentEventDeferring:", v11);
      }
    }
  }
  -[_UIRemoteViewController _updateServiceSceneContext](self, "_updateServiceSceneContext");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("_UIScreenUniqueIdDidChangeNotification"), 0);
  if (v4)
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__screenIDChanged_, CFSTR("_UIScreenUniqueIdDidChangeNotification"), v4);

}

- (void)__willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  -[_UIRemoteViewController _notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:](self, "_notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:", v6);
  v7.receiver = self;
  v7.super_class = (Class)_UIRemoteViewController;
  -[UIViewController __willChangeToIdiom:onScreen:](&v7, sel___willChangeToIdiom_onScreen_, a3, v6);

}

- (void)_beginObservingSceneMoveNotificationsIfNeeded
{
  id v3;

  if ((*(_BYTE *)&self->_remoteViewControllerFlags & 4) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__uirvc_windowWillMoveToScene_, 0x1E1764CA0, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__uirvc_windowDidMoveToScene_, 0x1E1764CC0, 0);
    *(_BYTE *)&self->_remoteViewControllerFlags |= 4u;

  }
}

- (int64_t)interfaceElementCategory
{
  return 3;
}

- (id)_hostedWindowServiceDeferringTarget
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;

  -[_UIRemoteViewController serviceBundleIdentifier](self, "serviceBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteView hostedWindowHostingHandle](self->_serviceViewControllerRemoteView, "hostedWindowHostingHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contextID");

  v6 = objc_alloc_init(MEMORY[0x1E0D00D90]);
  v7 = objc_alloc_init(MEMORY[0x1E0D00D90]);

  objc_msgSend(v7, "setPid:", -[_UIRemoteViewController serviceProcessIdentifier](self, "serviceProcessIdentifier"));
  objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForIdentifierOfCAContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToken:", v8);

  return v7;
}

- (void)_beginObservingNotificationsForEventDeferringIfNeeded
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  char remoteViewControllerFlags;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  void *v16;
  _BOOL4 v17;
  char v18;
  void *v19;
  int v20;
  id v21;

  -[UIViewController _existingView](self, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_eventDeferringManager");
  v5 = (id *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  remoteViewControllerFlags = (char)self->_remoteViewControllerFlags;
  -[_UIEventDeferringManager internalBehavior](v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldDisableRemoteViewControllerEventDeferringForKeyboardSettingsSceneChanges");

  if ((remoteViewControllerFlags & 1) == 0 && v9)
  {
    v10 = v21;
    v11 = v10;
    if (v10
      && (objc_msgSend(v10, "windowScene"), (v12 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v13 = (void *)v12,
          v14 = +[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"),
          v13,
          v14))
    {
      v15 = objc_msgSend(v11, "_isRemoteKeyboardWindow");
      objc_msgSend(v11, "windowScene");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_UIRemoteViewController _windowSceneIsKeyboardWindowScene:]((uint64_t)self, v16);

      if (v15 && v17)
      {
        objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__uirvc_keyboardWindowSceneSettingsSceneWillChange_, CFSTR("_UISceneWillChangeSettingsSceneNotification"), 0);
        *(_BYTE *)&self->_remoteViewControllerFlags |= 1u;
      }
    }
    else
    {

    }
  }
  v18 = (char)self->_remoteViewControllerFlags;
  -[_UIEventDeferringManager internalBehavior](v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldDisableRemoteViewControllerEventDeferringForKeyboardKeyWindowChanges");

  if ((v18 & 2) == 0 && v20 && objc_msgSend(v21, "_isRemoteKeyboardWindow"))
  {
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__uirvc_applicationKeyWindowWillChange_, CFSTR("_UIWindowWillBecomeApplicationKeyNotification"), 0);
    *(_BYTE *)&self->_remoteViewControllerFlags |= 2u;
  }
  -[_UIRemoteViewController _beginObservingSceneMoveNotificationsIfNeeded](self, "_beginObservingSceneMoveNotificationsIfNeeded");

}

- (void)_setWantsKeyboardEnvironmentEventDeferring:(BOOL)a3
{
  _BOOL4 v3;
  _UIEventDeferringOwnershipToken *keyboardEnvironmentDeferringToken;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  _UIEventDeferringOwnershipToken *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UIEventDeferringOwnershipToken *v24;
  _UIEventDeferringOwnershipToken *v25;
  id v26;

  v3 = a3;
  if (self->_wantsKeyboardEnvironmentEventDeferring)
  {
    keyboardEnvironmentDeferringToken = self->_keyboardEnvironmentDeferringToken;
    v6 = keyboardEnvironmentDeferringToken == 0;
    v7 = keyboardEnvironmentDeferringToken != 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = self->_wantsKeyboardEnvironmentEventDeferring && !a3;
  v9 = -[UIViewController _appearState](self, "_appearState");
  v10 = 0;
  if (v9 && v9 != 3)
    v10 = !self->_wantsKeyboardEnvironmentEventDeferring && v3;
  if (v6 || v10 || v8)
  {
    -[UIViewController _window](self, "_window");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_eventDeferringManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: end keyboard environment deferring"), objc_opt_class(), self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager endRemoteEventDeferringForToken:withReason:]((uint64_t)v12, (uint64_t)self->_keyboardEnvironmentDeferringToken, v13);
      v14 = self->_keyboardEnvironmentDeferringToken;
      self->_keyboardEnvironmentDeferringToken = 0;

    }
    self->_wantsKeyboardEnvironmentEventDeferring = v3;
    -[UIViewController _existingView](self, "_existingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_wantsKeyboardEnvironmentEventDeferring && v16 != 0)
    {
      if (-[_UIRemoteViewController serviceProcessIdentifier](self, "serviceProcessIdentifier"))
      {
        objc_msgSend(v16, "windowScene");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_eventDeferringManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: begin remote deferring in %@"), objc_opt_class(), self, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIRemoteViewController _hostedWindowServiceDeferringTarget](self, "_hostedWindowServiceDeferringTarget");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIEventDeferringManager beginRemoteEventDeferringInEnvironments:forOwningInterfaceElement:toTarget:withReason:]((uint64_t)v19, v21, self, v23, v22);
        v24 = (_UIEventDeferringOwnershipToken *)objc_claimAutoreleasedReturnValue();
        v25 = self->_keyboardEnvironmentDeferringToken;
        self->_keyboardEnvironmentDeferringToken = v24;

        -[_UIRemoteViewController _beginObservingNotificationsForEventDeferringIfNeeded](self, "_beginObservingNotificationsForEventDeferringIfNeeded");
      }
    }

  }
}

- (BOOL)_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  BOOL result;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "supportsFocus");
  v6 = objc_msgSend(v4, "_userInterfaceIdiom");

  result = 0;
  if (v5 && v6 == 3)
  {
    -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldPresentInFullscreen");
    v10 = v9;
    if (v8 && (v9 & 1) != 0)
      goto LABEL_12;
    -[UIViewController presentingViewController](self, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "modalPresentationStyle")
      || objc_msgSend(v12, "modalPresentationStyle") == 5
      || objc_msgSend(v12, "modalPresentationStyle") == 2
      || objc_msgSend(v12, "modalPresentationStyle") == 16
      || objc_msgSend(v12, "modalPresentationStyle") == 7)
    {
      v10 = 1;
LABEL_11:

LABEL_12:
      return v10 != 0;
    }
    if (objc_msgSend(v12, "modalPresentationStyle") == 3)
    {
      objc_msgSend(v11, "_nonModalAncestorViewControllerStopAtIsPresentationContext:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = objc_msgSend(v12, "modalPresentationStyle");
      objc_msgSend(v11, "_nonModalAncestorViewControllerStopAtIsPresentationContext:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != 6)
      {
LABEL_22:

        goto LABEL_11;
      }
    }
    objc_msgSend(v13, "_existingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v13, "_existingView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v13, "_existingView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = +[UIViewController _isViewSizeFullScreen:inWindow:ignoreInWindowCheck:](UIViewController, "_isViewSizeFullScreen:inWindow:ignoreInWindowCheck:", v18, v17, 0);

        if (v19)
          v10 = 1;
      }

    }
    goto LABEL_22;
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewDidAppear:](&v11, sel_viewDidAppear_);
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostViewDidAppear:", v3);
  -[_UIRemoteViewController _updateTouchGrabbingView](self, "_updateTouchGrabbingView");
  -[UIViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "_shouldInterdictServiceViewTouches"))
  {
    -[_UIRemoteViewController __setInterdictServiceViewTouches:](self, "__setInterdictServiceViewTouches:", 1);
  }
  -[UIViewController _window](self, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _window](self, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__updateUnderflowProperties, 0x1E1784B40, v10);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45___UIRemoteViewController_viewWillDisappear___block_invoke;
  v5[3] = &unk_1E16B1B78;
  v5[4] = self;
  v6 = a3;
  -[_UIRemoteViewController _synchronizeAnimationsInActionsIfNecessary:](self, "_synchronizeAnimationsInActionsIfNecessary:", v5);
  -[_UIRemoteViewController _updateTouchGrabbingView](self, "_updateTouchGrabbingView");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  _UIRemoteViewController *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewDidDisappear:](&v10, sel_viewDidDisappear_);
  -[_UIRemoteViewController _restoreTextEffectsRemoteView](self, "_restoreTextEffectsRemoteView");
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostViewDidDisappear:", v3);
  -[UIView removeFromSuperview](self->_fullScreenTextEffectsRemoteView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_textEffectsAboveStatusBarRemoteView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_fullScreenTextEffectsSnapshotView, "removeFromSuperview");
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v12 = self;
          _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }

      }
      else
      {
        v7 = viewDidDisappear____s_category;
        if (!viewDidDisappear____s_category)
        {
          v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v7, (unint64_t *)&viewDidDisappear____s_category);
        }
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v12 = self;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
    }
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);

  }
  else
  {
    -[UIView removeFromSuperview](self->_remoteKeyboardRemoteView, "removeFromSuperview");
  }
  -[_UIRemoteViewController __setInterdictServiceViewTouches:](self, "__setInterdictServiceViewTouches:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UIApplicationWillResignActiveNotification"), 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, 0x1E1784B40, 0);
  *(_BYTE *)&self->_remoteViewControllerFlags |= 0x20u;

}

- (void)_configureSizeViewConstraintsForWindow:(id)a3 interfaceOrientation:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  NSArray *sizeTrackingConstraints;
  void *v12;
  void *v13;
  NSArray *v14;
  void *v15;
  unint64_t v16;
  CGSize *p_serviceMainScreenSize;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double width;
  double height;
  void *v27;
  double v28;
  double v29;
  void *v30;
  _UISizeTrackingView *sizeTrackingView;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _UISizeTrackingView *v39;
  void *v40;
  void *v41;
  void *v42;
  _UISizeTrackingView *v43;
  void *v44;
  void *v45;
  NSArray *v46;
  NSArray *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  const __CFString *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (_UIDeviceNativeUserInterfaceIdiom())
    goto LABEL_27;
  if ((os_variant_has_internal_diagnostics() & 1) != 0)
  {
    if (!dyld_program_sdk_at_least())
      goto LABEL_27;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isCarrierInstall") & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    v8 = dyld_program_sdk_at_least();

    if ((v8 & 1) == 0)
      goto LABEL_27;
  }
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "_isEmbeddedScreen") & 1) == 0)
    goto LABEL_26;
  -[_UIRemoteViewController serviceBundleIdentifier](self, "serviceBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple."));

  if ((v10 & 1) == 0)
  {
    sizeTrackingConstraints = self->_sizeTrackingConstraints;
    if (sizeTrackingConstraints)
    {
      -[UIView superview](self->_sizeTrackingView, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[UIView superview](self->_sizeTrackingView, "superview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeConstraints:", self->_sizeTrackingConstraints);

      }
      v14 = self->_sizeTrackingConstraints;
      self->_sizeTrackingConstraints = 0;

    }
    -[UIViewController traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    p_serviceMainScreenSize = &self->_serviceMainScreenSize;
    if (*MEMORY[0x1E0C9D820] == self->_serviceMainScreenSize.width
      && *(double *)(MEMORY[0x1E0C9D820] + 8) == self->_serviceMainScreenSize.height
      && !v16)
    {
      *p_serviceMainScreenSize = (CGSize)xmmword_186684D40;
    }
    if (v6)
    {
      objc_msgSend(v6, "screen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_referenceBounds");
      v20 = v19;
      v22 = v21;
      width = p_serviceMainScreenSize->width;
      height = self->_serviceMainScreenSize.height;

      if (height == v22 && width == v20 || v16 > 1)
      {
        if (sizeTrackingConstraints)
        {
          -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_sizeTrackingView, "setTranslatesAutoresizingMaskIntoConstraints:", self->_sizeTrackingViewShouldTranslateAutoResizeMaskIntoConstraints);
          -[UIView setAutoresizingMask:](self->_sizeTrackingView, "setAutoresizingMask:", self->_sizeTrackingViewAutoResizeMask);
          -[UIView setNeedsLayout](self->_sizeTrackingView, "setNeedsLayout");
          -[UIView superview](self->_sizeTrackingView, "superview");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "layoutBelowIfNeeded");

        }
      }
      else
      {
        v28 = *(&p_serviceMainScreenSize->width + ((unint64_t)(a4 - 1) > 1));
        v29 = *(&p_serviceMainScreenSize->width + ((unint64_t)(a4 - 1) < 2));
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        sizeTrackingView = self->_sizeTrackingView;
        v54 = CFSTR("_sizeTrackingView");
        v55[0] = sizeTrackingView;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
        v32 = objc_claimAutoreleasedReturnValue();
        v52[0] = CFSTR("serviceSceneMaxSizeH");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = CFSTR("serviceSceneMaxSizeV");
        v53[0] = v33;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(0@990)-[_sizeTrackingView(<=serviceSceneMaxSizeH@1000)]-(0@990)-|"), 0, v35, v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObjectsFromArray:", v36);

        v51 = (void *)v32;
        objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(0@990)-[_sizeTrackingView(<=serviceSceneMaxSizeV@1000)]-(0@990)-|"), 0, v35, v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObjectsFromArray:", v37);

        v38 = (void *)MEMORY[0x1E0D156E0];
        v39 = self->_sizeTrackingView;
        -[UIView superview](v39, "superview");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 9, 0, v40, 9, 1.0, 0.0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v41);

        v42 = (void *)MEMORY[0x1E0D156E0];
        v43 = self->_sizeTrackingView;
        -[UIView superview](v43, "superview");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 10, 0, v44, 10, 1.0, 0.0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v45);

        v46 = (NSArray *)objc_msgSend(v30, "copy");
        v47 = self->_sizeTrackingConstraints;
        self->_sizeTrackingConstraints = v46;

        if (!sizeTrackingConstraints)
        {
          self->_sizeTrackingViewAutoResizeMask = -[UIView autoresizingMask](self->_sizeTrackingView, "autoresizingMask");
          self->_sizeTrackingViewShouldTranslateAutoResizeMaskIntoConstraints = -[UIView translatesAutoresizingMaskIntoConstraints](self->_sizeTrackingView, "translatesAutoresizingMaskIntoConstraints");
        }
        -[UIView setAutoresizingMask:](self->_sizeTrackingView, "setAutoresizingMask:", 0);
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_sizeTrackingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIView superview](self->_sizeTrackingView, "superview");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addConstraints:", self->_sizeTrackingConstraints);

        -[UIView superview](self->_sizeTrackingView, "superview");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setNeedsLayout");

        -[UIView superview](self->_sizeTrackingView, "superview");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "layoutBelowIfNeeded");

      }
    }
  }
LABEL_27:

}

- (void)__setServiceMaxFrameSize:(CGSize)a3
{
  void *v4;
  id v5;

  self->_serviceMainScreenSize = a3;
  -[UIView window](self->_sizeTrackingView, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView window](self->_sizeTrackingView, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteViewController _configureSizeViewConstraintsForWindow:interfaceOrientation:](self, "_configureSizeViewConstraintsForWindow:interfaceOrientation:", v5, objc_msgSend(v4, "interfaceOrientation"));

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id *v13;
  id v14;
  int v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  id viewControllerOperatorProxy;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  objc_super v25;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_eventDeferringManager");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIEventDeferringManager internalBehavior](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "shouldEvaluateEventDeferringForAnyRemoteViewControllerWindowMovement"))
  {
    objc_msgSend(v6, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteViewController _notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:](self, "_notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:", v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "shouldConsiderKeyWindowChangesForRemoteViewControllerAutomaticEventDeferring"))
    {
      v12 = _UIWindowKeyWindowAPIIsSceneLevel();
      v13 = (id *)&UIWindowDidBecomeKeyNotification;
      if (!v12)
        v13 = (id *)&_UIWindowDidBecomeApplicationKeyNotification;
      v14 = *v13;
      v15 = _UIWindowKeyWindowAPIIsSceneLevel();
      v16 = (id *)&UIWindowDidResignKeyNotification;
      if (!v15)
        v16 = (id *)&_UIWindowDidResignApplicationKeyNotification;
      v17 = *v16;
      objc_msgSend(v11, "removeObserver:name:object:", self, v14, 0);
      objc_msgSend(v11, "removeObserver:name:object:", self, v17, 0);
      if (v6)
      {
        objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__uirvc_windowBecameKey_, v14, v6);
        objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__uirvc_windowResignedKey_, v17, v6);
      }

    }
  }
  v25.receiver = self;
  v25.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v25, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  -[UIView window](self->_sizeTrackingView, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView window](self->_sizeTrackingView, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteViewController _configureSizeViewConstraintsForWindow:interfaceOrientation:](self, "_configureSizeViewConstraintsForWindow:interfaceOrientation:", v18, objc_msgSend(v19, "interfaceOrientation"));

  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  -[UIViewController presentingViewController](self, "presentingViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_presentationControllerClassName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(viewControllerOperatorProxy, "__hostDidSetPresentationControllerClassName:", v22);

  v23 = self->_viewControllerOperatorProxy;
  objc_msgSend(v6, "windowScene");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "__setHostCanDynamicallySpecifySupportedInterfaceOrientations:", objc_msgSend(v24, "_canDynamicallySpecifySupportedInterfaceOrientations"));

  -[_UIRemoteViewController _updateAncestorZoomTransitionControllerWithWindow:](self, "_updateAncestorZoomTransitionControllerWithWindow:", v6);
}

- (void)_updateAncestorZoomTransitionControllerWithWindow:(id)a3
{
  _UIRemoteViewController *v4;
  _UIRemoteViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    v4 = self;
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      do
      {
        objc_msgSend(v6, "preferredTransition");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          break;
        objc_msgSend(v6, "parentViewController");
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v8;
      }
      while (v8);
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v6, "_zoomTransitionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v9, "setDismissInteraction:", v10);

    if (v9)
      objc_msgSend(v5->_viewControllerOperatorProxy, "__installDismissInteractionForZoomTransition");

  }
  else
  {
    v9 = 0;
  }
  -[_UIRemoteViewController set_ancestorZoomTransitionController:](self, "set_ancestorZoomTransitionController:", v9);

}

- (void)didMoveToParentViewController:(id)a3
{
  void *v5;
  _UIPhysicalButtonConfigurationSet *serviceResolvedPhysicalButtonConfigurations;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIRemoteViewController;
  -[UIViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  -[_UIRemoteViewController allowedNotifications](self, "allowedNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteViewController setAllowedNotifications:](self, "setAllowedNotifications:", v5);

  if (self->_wantsKeyboardEnvironmentEventDeferring && a3 && !self->_keyboardEnvironmentDeferringToken)
    -[_UIRemoteViewController _setWantsKeyboardEnvironmentEventDeferring:](self, "_setWantsKeyboardEnvironmentEventDeferring:", 1);
  serviceResolvedPhysicalButtonConfigurations = self->_serviceResolvedPhysicalButtonConfigurations;
  if (serviceResolvedPhysicalButtonConfigurations && a3 && !self->_dynamicButtonDeferringToken)
    -[_UIRemoteViewController _updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:newResolvedConfigurations:](self, serviceResolvedPhysicalButtonConfigurations, self->_serviceResolvedPhysicalButtonConfigurations);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  NSArray *serviceViewControllerSupportedInterfaceOrientations;
  void *v4;

  serviceViewControllerSupportedInterfaceOrientations = self->_serviceViewControllerSupportedInterfaceOrientations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(serviceViewControllerSupportedInterfaceOrientations) = -[NSArray containsObject:](serviceViewControllerSupportedInterfaceOrientations, "containsObject:", v4);

  return (char)serviceViewControllerSupportedInterfaceOrientations;
}

- (unint64_t)supportedInterfaceOrientations
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_serviceViewControllerSupportedInterfaceOrientations;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "integerValue");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);

  }
  else
  {

    v10.receiver = self;
    v10.super_class = (Class)_UIRemoteViewController;
    return -[UIViewController supportedInterfaceOrientations](&v10, sel_supportedInterfaceOrientations);
  }
  return v6;
}

- (BOOL)_ignoreAppSupportedOrientations
{
  return 1;
}

+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize
{
  return objc_msgSend(a1, "doesOverrideViewControllerMethod:inBaseClass:", sel_viewWillTransitionToSize_withTransitionCoordinator_, objc_opt_class()) ^ 1;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 0;
}

- (BOOL)_needsUnderflowPropertyUpdate
{
  _BOOL4 isUnderlappingStatusBar;

  isUnderlappingStatusBar = self->_isUnderlappingStatusBar;
  return isUnderlappingStatusBar != -[UIViewController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar");
}

- (void)_updateUnderflowProperties
{
  _BOOL8 v3;

  v3 = -[UIViewController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar");
  self->_isUnderlappingStatusBar = v3;
  objc_msgSend(self->_viewControllerOperatorProxy, "__setHostViewUnderlapsStatusBar:", v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _BOOL4 IsIdentity;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[7];
  objc_super v16;
  CGAffineTransform v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[_UIRemoteViewController _setIsUpdatingSize:](self, "_setIsUpdatingSize:", 1);
  -[_UIRemoteViewController _setIsUpdatingSizeInHost:](self, "_setIsUpdatingSizeInHost:", 1);
  v16.receiver = self;
  v16.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&v17, 0, sizeof(v17));
  IsIdentity = CGAffineTransformIsIdentity(&v17);
  -[UIViewController _window](self, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (IsIdentity)
  {
    v11 = objc_msgSend(v9, "interfaceOrientation");
    v12 = v11;
  }
  else
  {
    v12 = objc_msgSend(v9, "_toWindowOrientation");

    -[UIViewController _window](self, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_fromWindowOrientation");
  }

  -[UIView window](self->_sizeTrackingView, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteViewController _configureSizeViewConstraintsForWindow:interfaceOrientation:](self, "_configureSizeViewConstraintsForWindow:interfaceOrientation:", v13, v12);

  -[_UIRemoteViewController _beginDeferringProxySheetConfigurationUpdates](self, "_beginDeferringProxySheetConfigurationUpdates");
  v14[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_1E16C1A08;
  v15[5] = v12;
  v15[6] = v11;
  v15[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v14[3] = &unk_1E16B2150;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, v14);

}

- (void)_willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _UISizeTrackingView *sizeTrackingView;
  _QWORD v12[7];
  BOOL v13;
  objc_super v14;

  v6 = a6;
  v7 = a5;
  if (self->_fullScreenTextEffectsSnapshotView)
  {
    self->_snapshotTextEffectsAfterRotation = 1;
    -[_UIRemoteViewController _restoreTextEffectsRemoteView](self, "_restoreTextEffectsRemoteView");
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _willAnimateRotationToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:](&v14, sel__willAnimateRotationToInterfaceOrientation_duration_forwardToChildControllers_skipSelf_, a3, v7, v6, a4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __114___UIRemoteViewController__willAnimateRotationToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke;
  v12[3] = &unk_1E16BFC40;
  v12[4] = self;
  v12[5] = a3;
  *(double *)&v12[6] = a4;
  v13 = v6;
  -[_UIRemoteViewController synchronizeAnimationsInActions:](self, "synchronizeAnimationsInActions:", v12);
  sizeTrackingView = self->_sizeTrackingView;
  -[UIView frame](sizeTrackingView, "frame");
  -[_UISizeTrackingView _updateTextEffectsGeometries:](sizeTrackingView, "_updateTextEffectsGeometries:");
}

- (void)_willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6
{
  _QWORD v10[7];
  BOOL v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _willRotateToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:](&v12, sel__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf_, a3, a5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105___UIRemoteViewController__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke;
  v10[3] = &unk_1E16BFC40;
  v10[4] = self;
  v10[5] = a3;
  *(double *)&v10[6] = a4;
  v11 = a6;
  -[_UIRemoteViewController synchronizeAnimationsInActions:](self, "synchronizeAnimationsInActions:", v10);
}

- (void)_didRotateFromInterfaceOrientation:(int64_t)a3 forwardToChildControllers:(BOOL)a4 skipSelf:(BOOL)a5
{
  _QWORD v8[6];
  BOOL v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _didRotateFromInterfaceOrientation:forwardToChildControllers:skipSelf:](&v10, sel__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf_, a3, a4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97___UIRemoteViewController__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf___block_invoke;
  v8[3] = &unk_1E16BFE60;
  v8[4] = self;
  v8[5] = a3;
  v9 = a5;
  -[_UIRemoteViewController synchronizeAnimationsInActions:](self, "synchronizeAnimationsInActions:", v8);
  if (self->_snapshotTextEffectsAfterRotation)
  {
    -[_UIRemoteViewController _snapshotAndRemoveTextEffectsRemoteView](self, "_snapshotAndRemoveTextEffectsRemoteView");
    self->_snapshotTextEffectsAfterRotation = 0;
  }
}

- (void)_willBecomeContentViewControllerOfPopover:(id)a3
{
  id viewControllerOperatorProxy;
  id v5;
  objc_super v6;

  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  v5 = a3;
  objc_msgSend(viewControllerOperatorProxy, "__setServiceInPopover:", 1);
  v6.receiver = self;
  v6.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _willBecomeContentViewControllerOfPopover:](&v6, sel__willBecomeContentViewControllerOfPopover_, v5);

}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id viewControllerOperatorProxy;
  id v5;
  objc_super v6;

  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  v5 = a3;
  objc_msgSend(viewControllerOperatorProxy, "__setServiceInPopover:", 0);
  v6.receiver = self;
  v6.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _didResignContentViewControllerOfPopover:](&v6, sel__didResignContentViewControllerOfPopover_, v5);

}

- (BOOL)_requiresKeyboardWindowWhenFirstResponder
{
  return 1;
}

- (void)__didReceiveGestureDirection:(int64_t)a3 authenticationMessage:(id)a4
{
  objc_msgSend(self->_textEffectsOperatorProxy, "__hostDidReceiveGestureDirection:authenticationMessage:", a3, a4);
}

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

- (int)_preferredStatusBarVisibility
{
  return self->_preferredStatusBarVisibility;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return self->_preferredAdaptivityStyle;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return self->_preferredStatusBarUpdateAnimation;
}

- (void)__viewServiceDidUpdatePreferredStatusBarStyle:(int64_t)a3 preferredStatusBarVisibility:(int)a4 updateAnimation:(int64_t)a5 currentAnimationSettings:(id)a6
{
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];

  v10 = a6;
  v11 = v10;
  self->_preferredStatusBarStyle = a3;
  self->_preferredStatusBarVisibility = a4;
  self->_preferredStatusBarUpdateAnimation = a5;
  if (v10)
  {
    objc_msgSend(v10, "duration");
    v13 = v12;
    objc_msgSend(v11, "delay");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __143___UIRemoteViewController___viewServiceDidUpdatePreferredStatusBarStyle_preferredStatusBarVisibility_updateAnimation_currentAnimationSettings___block_invoke;
    v15[3] = &unk_1E16B1B28;
    v15[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v15, &__block_literal_global_550, v13, v14);
  }
  else
  {
    -[UIViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }

}

- (void)__viewServiceDidUpdatePreferredWhitePointAdaptationStyle:(int64_t)a3 animationSettings:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _UISceneSettingsMediaTimingAnimationFactory *v14;
  _QWORD aBlock[5];

  v6 = a4;
  self->_preferredAdaptivityStyle = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102___UIRemoteViewController___viewServiceDidUpdatePreferredWhitePointAdaptationStyle_animationSettings___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "duration");
    v10 = v9;
    objc_msgSend(v6, "delay");
    v12 = v11;
    objc_msgSend(v6, "timingFunction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_alloc_init(_UISceneSettingsMediaTimingAnimationFactory);
      -[_UISceneSettingsMediaTimingAnimationFactory set_timingFunctionForAnimation:](v14, "set_timingFunctionForAnimation:", v13);
      +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v14, v8, 0, v10, v12);

    }
    else if (v10 <= 0.0)
    {
      v8[2](v8);
    }
    else
    {
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v8, 0, v10, v12);
    }

  }
  else
  {
    v7[2](v7);
  }

}

- (void)__viewServiceDidUpdateClientToHostAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68___UIRemoteViewController___viewServiceDidUpdateClientToHostAction___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsync:", v7);

}

- (void)__viewServiceDidDropTouchEventForInsecurePresentation
{
  _UISimpleTimedInhibitor *droppedTouchLoggingInhibitor;
  _UISimpleTimedInhibitor *v4;
  _UISimpleTimedInhibitor *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  droppedTouchLoggingInhibitor = self->_droppedTouchLoggingInhibitor;
  if (!droppedTouchLoggingInhibitor)
  {
    v4 = -[_UISimpleTimedInhibitor initWithClockType:maxAttempts:inPeriod:]([_UISimpleTimedInhibitor alloc], "initWithClockType:maxAttempts:inPeriod:", 0, 2, 30.0);
    v5 = self->_droppedTouchLoggingInhibitor;
    self->_droppedTouchLoggingInhibitor = v4;

    droppedTouchLoggingInhibitor = self->_droppedTouchLoggingInhibitor;
  }
  if (!-[_UISimpleTimedInhibitor attempt](droppedTouchLoggingInhibitor, "attempt"))
  {
    -[_UIRemoteViewController serviceBundleIdentifier](self, "serviceBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = __viewServiceDidDropTouchEventForInsecurePresentation___s_category;
      if (!__viewServiceDidDropTouchEventForInsecurePresentation___s_category)
      {
        v7 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&__viewServiceDidDropTouchEventForInsecurePresentation___s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        -[_UIRemoteViewController serviceBundleIdentifier](self, "serviceBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "User interaction with %{public}@ was ignored because it is currently presented in an unsupported configuration. Ensure this view's appearance has not been modified.", (uint8_t *)&v11, 0xCu);

      }
    }
  }
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  return self->_preferredScreenEdgesDeferringSystemGestures;
}

- (void)__viewServiceDidUpdatePreferredScreenEdgesDeferringSystemGestures:(unint64_t)a3
{
  self->_preferredScreenEdgesDeferringSystemGestures = a3;
  -[UIViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](self, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return self->_prefersHomeIndicatorAutoHidden;
}

- (void)__viewServiceDidUpdatePrefersHomeIndicatorAutoHidden:(BOOL)a3
{
  self->_prefersHomeIndicatorAutoHidden = a3;
  -[UIViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (void)__viewServiceDidUpdatePreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
  -[UIViewController _setNeedsUserInterfaceAppearanceUpdate](self, "_setNeedsUserInterfaceAppearanceUpdate");
}

- (BOOL)prefersPointerLocked
{
  return self->_prefersPointerLocked;
}

- (void)__viewServiceDidUpdatePrefersPointerLocked:(BOOL)a3
{
  self->_prefersPointerLocked = a3;
  -[UIViewController setNeedsUpdateOfPrefersPointerLocked](self, "setNeedsUpdateOfPrefersPointerLocked");
}

- (id)_multitaskingDragExclusionRects
{
  if (self->_multitaskingDragExclusionRects)
    return self->_multitaskingDragExclusionRects;
  else
    return MEMORY[0x1E0C9AA60];
}

- (void)__viewServiceDidUpdateMultitaskingDragExclusionRects:(id)a3
{
  id v4;
  _UISizeTrackingView *sizeTrackingView;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double x;
  double y;
  double width;
  double height;
  void *v28;
  NSArray *v29;
  NSArray *multitaskingDragExclusionRects;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sizeTrackingView = self->_sizeTrackingView;
  if (sizeTrackingView)
  {
    -[UIView frame](sizeTrackingView, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = v4;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "CGRectValue", (_QWORD)v31);
          v39.origin.x = v20;
          v39.origin.y = v21;
          v39.size.width = v22;
          v39.size.height = v23;
          v37.origin.x = v7;
          v37.origin.y = v9;
          v37.size.width = v11;
          v37.size.height = v13;
          v38 = CGRectIntersection(v37, v39);
          x = v38.origin.x;
          y = v38.origin.y;
          width = v38.size.width;
          height = v38.size.height;
          if (!CGRectIsEmpty(v38))
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v28);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v17);
    }

    v29 = (NSArray *)objc_msgSend(v14, "copy");
    multitaskingDragExclusionRects = self->_multitaskingDragExclusionRects;
    self->_multitaskingDragExclusionRects = v29;

    -[UIViewController _setNeedsUpdateOfMultitaskingDragExclusionRects](self, "_setNeedsUpdateOfMultitaskingDragExclusionRects");
  }

}

- (id)_traitCollectionForServiceFromTraitCollection:(id)a3
{
  return _obscuredTraitCollectionFromTraitCollection(a3);
}

- (void)_traitCollectionDidChange:(id)a3
{
  id viewControllerOperatorProxy;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  v5 = a3;
  -[UIViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteViewController _traitCollectionForServiceFromTraitCollection:](self, "_traitCollectionForServiceFromTraitCollection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(viewControllerOperatorProxy, "__setHostTraitCollection:deferIfAnimated:", v7, _shouldDeferSendingTraitCollectionChangeToService(self));

  v9.receiver = self;
  v9.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _traitCollectionDidChange:](&v9, sel__traitCollectionDidChange_, v5);
  -[UIViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if ((_DWORD)v6)
    -[_UIRemoteViewController _updateTintColor](self, "_updateTintColor");
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  char v19;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UIRemoteViewController;
  v7 = a4;
  -[UIViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v20, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  v8 = objc_msgSend(v6, "userInterfaceStyle");
  -[UIViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceStyle");

  if (v8 == v10)
  {
    v11 = 0;
  }
  else
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", objc_msgSend(v6, "userInterfaceStyle"), 0x1E1A994B0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v13, "isEqual:", v6);
  }
  -[_UIRemoteViewController _traitCollectionForServiceFromTraitCollection:](self, "_traitCollectionForServiceFromTraitCollection:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_1E16BCC58;
  v17[4] = self;
  v18 = v14;
  v19 = v11;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_3;
  v16[3] = &unk_1E16B2150;
  v15 = v14;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v17, v16);

}

- (void)__viewServiceAddSceneForwardingLayersForOwners:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSMutableSet *mutableKeyboardSceneLayers;
  NSMutableSet *v16;
  NSMutableSet *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[UIViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "window");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "windowLevel");
        v13 = v12 + 1.0;

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23118]), "initWithLevel:keyboardOwner:", v9, v13);
        mutableKeyboardSceneLayers = self->_mutableKeyboardSceneLayers;
        if (!mutableKeyboardSceneLayers)
        {
          v16 = (NSMutableSet *)objc_opt_new();
          v17 = self->_mutableKeyboardSceneLayers;
          self->_mutableKeyboardSceneLayers = v16;

          mutableKeyboardSceneLayers = self->_mutableKeyboardSceneLayers;
        }
        -[NSMutableSet addObject:](mutableKeyboardSceneLayers, "addObject:", v14);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  -[_UISceneKeyboardProxyLayerForwardingPresentationViewService keyboardLayersDidChange]((uint64_t)self->_keyboardProxyPresentationEnvironment);

}

- (void)__viewServiceRemoveSceneForwardingLayersForOwners:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  NSMutableSet *mutableKeyboardSceneLayers;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v20 = v4;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v5 = (void *)-[NSMutableSet copy](self->_mutableKeyboardSceneLayers, "copy");
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v22 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              if ((objc_msgSend(v10, "isKeyboardProxyLayer") & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRemoteViewController.m"), 4894, CFSTR("only keyboard proxy layers support forwarding via UIRVC"));

              }
              v11 = v10;
              objc_msgSend(v11, "keyboardOwner");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = BSEqualObjects();

              if (v13)
                -[NSMutableSet removeObject:](self->_mutableKeyboardSceneLayers, "removeObject:", v11);

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v7);
        }

        v4 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }
  if (!-[NSMutableSet count](self->_mutableKeyboardSceneLayers, "count"))
  {
    mutableKeyboardSceneLayers = self->_mutableKeyboardSceneLayers;
    self->_mutableKeyboardSceneLayers = 0;

  }
  -[_UISceneKeyboardProxyLayerForwardingPresentationViewService keyboardLayersDidChange]((uint64_t)self->_keyboardProxyPresentationEnvironment);

}

- (NSSet)_keyboardSceneLayers
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableKeyboardSceneLayers, "copy");
}

- (void)__setSupportedInterfaceOrientations:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (unint64_t)((int)objc_msgSend(v10, "intValue") - 1) >= 2
          && (unint64_t)((int)objc_msgSend(v10, "intValue") - 3) >= 2)
        {
          NSStringFromSelector(a2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%@ received invalid interface orientation %@ in %@"), self, v10, v12);

          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63___UIRemoteViewController___setSupportedInterfaceOrientations___block_invoke;
  v13[3] = &unk_1E16B1B50;
  v13[4] = self;
  v14 = v5;
  objc_msgSend(v11, "performAsync:", v13);

LABEL_13:
}

- (void)__setViewServiceIsDisplayingPopover:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63___UIRemoteViewController___setViewServiceIsDisplayingPopover___block_invoke;
  v6[3] = &unk_1E16B1B78;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performAsync:", v6);

}

- (void)dimmingViewWasTapped:(id)a3
{
  objc_msgSend(self->_viewControllerOperatorProxy, "__dimmingViewWasTapped", a3);
}

- (void)__viewServiceWantsKeyboardEventsWithoutFirstResponderAndCompletionHandler:(id)a3
{
  -[_UIRemoteViewController _serviceWantsKeyboardEventsWithPromotedFirstResponder:completionHandler:](self, "_serviceWantsKeyboardEventsWithPromotedFirstResponder:completionHandler:", 0, a3);
}

- (void)__viewServiceDidPromoteFirstResponderWithCompletionHandler:(id)a3
{
  -[_UIRemoteViewController _serviceWantsKeyboardEventsWithPromotedFirstResponder:completionHandler:](self, "_serviceWantsKeyboardEventsWithPromotedFirstResponder:completionHandler:", 1, a3);
}

- (void)_serviceWantsKeyboardEventsWithPromotedFirstResponder:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99___UIRemoteViewController__serviceWantsKeyboardEventsWithPromotedFirstResponder_completionHandler___block_invoke;
  v9[3] = &unk_1E16BAFE8;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "performAsync:", v9);

}

- (void)__viewServiceDidChangeKeyWindow:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  _UITextEffectsRemoteView *remoteKeyboardRemoteView;
  void *v8;
  void *v9;

  v3 = a3;
  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
    if (v3)
    {
      if (remoteKeyboardRemoteView)
      {
        -[UIView superview](remoteKeyboardRemoteView, "superview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_8;
      }
      return;
    }
    if (!remoteKeyboardRemoteView)
      return;
    -[UIView superview](remoteKeyboardRemoteView, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      return;
LABEL_13:
    -[_UIRemoteViewController _removeTextEffectsRemoteViews](self, "_removeTextEffectsRemoteViews");
    return;
  }
  +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasWindowHostingCallerID:", self->_callerID);

  if (v3)
  {
    if ((v6 & 1) != 0)
      return;
LABEL_8:
    -[_UIRemoteViewController _restoreTextEffectsRemoteView](self, "_restoreTextEffectsRemoteView");
    return;
  }
  if (v6)
    goto LABEL_13;
}

- (void)__viewServicePopoverDidChangeContentSize:(CGSize)a3 animated:(BOOL)a4 fence:(id)a5 withReplyHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  CGFloat v18;
  CGFloat v19;

  height = a3.height;
  width = a3.width;
  v10 = a6;
  v11 = (void *)objc_msgSend(a5, "copy");
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100___UIRemoteViewController___viewServicePopoverDidChangeContentSize_animated_fence_withReplyHandler___block_invoke;
  v15[3] = &unk_1E16D6CD8;
  v15[4] = self;
  v16 = v11;
  v18 = width;
  v19 = height;
  v17 = v10;
  v13 = v10;
  v14 = v11;
  objc_msgSend(v12, "performAsync:", v15);

}

- (void)__viewServicePreferredContentSizeDidChange:(CGSize)a3 fence:(id)a4
{
  CGFloat height;
  CGFloat width;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  CGFloat v12;
  CGFloat v13;

  height = a3.height;
  width = a3.width;
  v7 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76___UIRemoteViewController___viewServicePreferredContentSizeDidChange_fence___block_invoke;
  v10[3] = &unk_1E16B80A8;
  v10[4] = self;
  v11 = v7;
  v12 = width;
  v13 = height;
  v9 = v7;
  objc_msgSend(v8, "performAsync:", v10);

}

- (void)__viewServiceInstrinsicContentSizeDidChange:(CGSize)a3 fence:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  int has_internal_diagnostics;
  _UISizeTrackingView *sizeTrackingView;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  CGFloat v17;
  CGFloat v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _UIRemoteViewController *v22;
  uint64_t v23;

  height = a3.height;
  width = a3.width;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  sizeTrackingView = self->_sizeTrackingView;
  if (has_internal_diagnostics)
  {
    if (!sizeTrackingView)
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[_UIRemoteViewController __viewServiceInstrinsicContentSizeDidChange:fence:]";
        v21 = 2112;
        v22 = self;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "%s unexpectedly received before _sizeTrackingView was created. %@", buf, 0x16u);
      }

    }
  }
  else if (!sizeTrackingView)
  {
    v13 = __viewServiceInstrinsicContentSizeDidChange_fence____s_category;
    if (!__viewServiceInstrinsicContentSizeDidChange_fence____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&__viewServiceInstrinsicContentSizeDidChange_fence____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[_UIRemoteViewController __viewServiceInstrinsicContentSizeDidChange:fence:]";
      v21 = 2112;
      v22 = self;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%s unexpectedly received before _sizeTrackingView was created. %@", buf, 0x16u);
    }
  }
  v10 = (void *)objc_msgSend(v7, "copy");

  if (self->_sizeTrackingView)
  {
    objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77___UIRemoteViewController___viewServiceInstrinsicContentSizeDidChange_fence___block_invoke;
    v15[3] = &unk_1E16B80A8;
    v15[4] = self;
    v16 = v10;
    v17 = width;
    v18 = height;
    objc_msgSend(v11, "performAsync:", v15);

  }
}

- (id)_sheetPresentationController
{
  void *v2;
  id v3;

  -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)_setSheetConfiguration:(id)a3
{
  id v5;
  _UISheetPresentationControllerConfiguration *v6;
  _UISheetPresentationControllerConfiguration *v7;
  BOOL v8;
  _UISheetPresentationControllerConfiguration *v9;
  _UISheetPresentationControllerConfiguration *v10;

  v5 = a3;
  v6 = self->__sheetConfiguration;
  v7 = (_UISheetPresentationControllerConfiguration *)v5;
  v10 = v7;
  if (v6 == v7)
  {

    v9 = v10;
  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UISheetPresentationControllerConfiguration isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    v9 = self->__sheetConfiguration;
    objc_storeStrong((id *)&self->__sheetConfiguration, a3);
    if (!self->__proxySheetConfigurationBeforeDeferring)
      -[_UIRemoteViewController _updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration:](self, "_updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration:", v9);
  }

LABEL_11:
}

- (void)_updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration:(id)a3
{
  id v4;
  _UISheetPresentationControllerConfiguration *v5;
  _UISheetPresentationControllerConfiguration *v6;
  _UISheetPresentationControllerConfiguration *v7;
  BOOL v8;
  _QWORD v9[5];
  _UISheetPresentationControllerConfiguration *v10;

  v4 = a3;
  v5 = self->__sheetConfiguration;
  v6 = (_UISheetPresentationControllerConfiguration *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v8 = -[_UISheetPresentationControllerConfiguration isEqual:](v5, "isEqual:", v6);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    if (-[_UISheetPresentationControllerConfiguration _shouldFenceChangeToConfiguration:](v7, "_shouldFenceChangeToConfiguration:", v5))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __91___UIRemoteViewController__updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration___block_invoke;
      v9[3] = &unk_1E16B1B50;
      v9[4] = self;
      v10 = v5;
      -[_UIRemoteViewController _synchronizeAnimationsInActionsIfNecessary:](self, "_synchronizeAnimationsInActionsIfNecessary:", v9);

    }
    else
    {
      objc_msgSend(self->_viewControllerOperatorProxy, "__setSheetConfiguration:", v5);
    }
  }
LABEL_11:

}

- (void)_beginDeferringProxySheetConfigurationUpdates
{
  if (!self->__proxySheetConfigurationBeforeDeferring)
    objc_storeStrong((id *)&self->__proxySheetConfigurationBeforeDeferring, self->__sheetConfiguration);
}

- (void)_endDeferringProxySheetConfigurationUpdates
{
  _UISheetPresentationControllerConfiguration *proxySheetConfigurationBeforeDeferring;
  _UISheetPresentationControllerConfiguration *v4;

  proxySheetConfigurationBeforeDeferring = self->__proxySheetConfigurationBeforeDeferring;
  if (proxySheetConfigurationBeforeDeferring)
  {
    self->__proxySheetConfigurationBeforeDeferring = 0;
    v4 = proxySheetConfigurationBeforeDeferring;

    -[_UIRemoteViewController _updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration:](self, "_updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration:", v4);
  }
}

- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3
{
  objc_msgSend(self->_viewControllerOperatorProxy, "__sheetInteractionDraggingDidBeginWithRubberBandCoefficient:", a3);
}

- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5
{
  objc_msgSend(self->_viewControllerOperatorProxy, "__sheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:", a5, a3.x, a3.y, a4.x, a4.y);
}

- (void)_sheetInteractionDraggingDidEnd
{
  objc_msgSend(self->_viewControllerOperatorProxy, "__sheetInteractionDraggingDidEnd");
}

- (void)__viewServiceSheetPresentationClientConfigurationDidChange:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = a3;
  -[_UIRemoteViewController _sheetPresentationController](self, "_sheetPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setRemoteClientConfiguration:", v7);

  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __97___UIRemoteViewController___viewServiceSheetPresentationClientConfigurationDidChange_attributes___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v10 = v8;
    +[UIView _animateWithAttributes:animations:completion:](UIView, "_animateWithAttributes:animations:completion:", v6, v9, 0);

  }
}

- (void)__viewServiceSheetGrabberDidTriggerPrimaryAction
{
  id v2;

  -[_UIRemoteViewController _sheetPresentationController](self, "_sheetPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_remoteSheetGrabberDidTriggerPrimaryAction");

}

- (void)__viewServiceSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  double y;
  double x;
  _BOOL8 v7;
  id v9;

  y = a5.y;
  x = a5.x;
  v7 = a4;
  -[_UIRemoteViewController _sheetPresentationController](self, "_sheetPresentationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v7, a3, x, y);

}

- (void)__viewServiceSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double y;
  double x;
  double v10;
  double v11;
  id v12;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[_UIRemoteViewController _sheetPresentationController](self, "_sheetPresentationController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_remoteSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", v7, v6, v11, v10, x, y);

}

- (void)__viewServiceSheetInteractionDraggingDidEnd
{
  id v2;

  -[_UIRemoteViewController _sheetPresentationController](self, "_sheetPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_remoteSheetInteractionDraggingDidEnd");

}

- (void)__viewServiceDismissInteractionDidBeginAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[_UIRemoteViewController _ancestorZoomTransitionController](self, "_ancestorZoomTransitionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "dismissInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginAtLocation:withVelocity:", v7, v6, x, y);

    v8 = v10;
  }

}

- (void)__viewServiceDismissInteractionDidIssueUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIRemoteViewController _ancestorZoomTransitionController](self, "_ancestorZoomTransitionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dismissInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "issueUpdate:", v7);

  }
}

- (void)__viewServiceDismissInteractionDidDismissWithVelocity:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[_UIRemoteViewController _ancestorZoomTransitionController](self, "_ancestorZoomTransitionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "dismissInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissWithVelocity:", x, y);

    v5 = v7;
  }

}

- (void)__viewServiceDismissInteractionDidCancelWithVelocity:(CGPoint)a3 originalPosition:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[_UIRemoteViewController _ancestorZoomTransitionController](self, "_ancestorZoomTransitionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "dismissInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelWithVelocity:originalPosition:", v7, v6, x, y);

    v8 = v10;
  }

}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0CB3488];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "currentHandler");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRemoteViewController.m"), 5490, CFSTR("Unexpected request to handle a non-proxy action: self: %@; interaction: %@; action: %@"),
    self,
    v10,
    v9);

}

- (void)_physicalButtonProxyInteraction:(id)a3 didReceiveBSAction:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  _UIRemoteViewController *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _physicalButtonProxyInteraction_didReceiveBSAction____s_category;
  if (!_physicalButtonProxyInteraction_didReceiveBSAction____s_category)
  {
    v8 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_physicalButtonProxyInteraction_didReceiveBSAction____s_category);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v9 = *(id *)(v8 + 8);
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
      v15 = v14;
      objc_msgSend(v6, "succinctDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Received proxy physicalButtonBSAction from interaction: self: %@; proxyInteraction: %@; physicalButtonBSAction: %@",
        buf,
        0x20u);

    }
  }
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidReceivePhysicalButtonBSAction:", v7);

}

- (void)__viewServiceDidUpdateResolvedPhysicalButtonConfigurations:(id)a3
{
  id v5;
  _UIPhysicalButtonConfigurationSet **p_serviceResolvedPhysicalButtonConfigurations;
  _UIPhysicalButtonConfigurationSet *v7;
  _UIPhysicalButtonConfigurationSet *v8;
  _UIPhysicalButtonConfigurationSet *v9;
  int v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  _UIRemoteViewController *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _UIPhysicalButtonConfigurationSet *v21;
  _UIPhysicalButtonConfigurationSet *v22;
  _UIPhysicalButtonProxyInteraction *v23;
  _UIPhysicalButtonConfigurationSet *v24;
  _UIPhysicalButtonConfigurationSet *v25;
  _UIPhysicalButtonConfigurationSet *v26;
  _UIPhysicalButtonConfigurationSet *v27;
  _UIPhysicalButtonConfigurationSet *v28;
  BOOL v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  int v34;
  int v35;
  unsigned int v36;
  unint64_t v37;
  NSObject *v38;
  void *v39;
  _UIRemoteViewController *v40;
  objc_class *v41;
  _UIPhysicalButtonConfigurationSet **v42;
  void *v43;
  void *v44;
  void *v45;
  _UIPhysicalButtonProxyInteraction *v46;
  _UIPhysicalButtonProxyInteraction *proxyPhysicalButtonInteraction;
  void *v48;
  NSMutableDictionary *configurationsByButton;
  _UIPhysicalButtonConfigurationSet **v50;
  uint64_t v51;
  int v52;
  NSObject *log;
  unsigned int v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  _BYTE v60[10];
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_serviceResolvedPhysicalButtonConfigurations = &self->_serviceResolvedPhysicalButtonConfigurations;
  v7 = self->_serviceResolvedPhysicalButtonConfigurations;
  v8 = (_UIPhysicalButtonConfigurationSet *)v5;
  v9 = v8;
  if (v7 == v8)
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    if (v8 && v7)
      v10 = -[_UIPhysicalButtonConfigurationSet isEqual:](v7, "isEqual:", v8);
  }

  v11 = qword_1ECD78A78;
  if (!qword_1ECD78A78)
  {
    v11 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&qword_1ECD78A78);
  }
  v12 = *(NSObject **)(v11 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = self;
    v15 = v12;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v17, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v18;
    -[_UIPhysicalButtonConfigurationSet succinctDescription](v9, "succinctDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v56 = v18;
    v57 = 1026;
    v58 = v10 ^ 1;
    v59 = 2114;
    *(_QWORD *)v60 = v20;
    _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "Received resolved configurations update from service: self: %{public}@; didChange: %{public}d; configurations: %{public}@",
      buf,
      0x1Cu);

    p_serviceResolvedPhysicalButtonConfigurations = &self->_serviceResolvedPhysicalButtonConfigurations;
  }
  if ((v10 & 1) == 0)
  {
    v21 = *p_serviceResolvedPhysicalButtonConfigurations;
    objc_storeStrong((id *)p_serviceResolvedPhysicalButtonConfigurations, a3);
    v22 = *p_serviceResolvedPhysicalButtonConfigurations;
    v23 = self->_proxyPhysicalButtonInteraction;
    v24 = v21;
    v25 = v22;
    v26 = v24;
    v27 = v25;
    v28 = v27;
    if (v26 == v27)
    {

    }
    else
    {
      if (!v26 || !v27)
      {

LABEL_19:
        v31 = -[_UIPhysicalButtonConfigurationSet _count](v28, "_count");
        v32 = v31;
        if (v23)
        {
          v33 = !-[_UIPhysicalButtonInteraction _isEnabled](v23, "_isEnabled")
             && -[_UIPhysicalButtonConfigurationSet _count](v28, "_count") != 0;
          if (-[_UIPhysicalButtonInteraction _isEnabled](v23, "_isEnabled"))
          {
            if (!v28)
            {
              v50 = p_serviceResolvedPhysicalButtonConfigurations;

              goto LABEL_44;
            }
            configurationsByButton = v28->_configurationsByButton;
            if (configurationsByButton)
            {
              v50 = p_serviceResolvedPhysicalButtonConfigurations;
              v51 = -[NSMutableDictionary count](configurationsByButton, "count");

              if (!v51)
              {
                v52 = 0x1000000;
                v34 = 16842752;
LABEL_53:
                p_serviceResolvedPhysicalButtonConfigurations = v50;
                if (v33)
                  goto LABEL_54;
LABEL_49:
                if (v32)
                {
                  v34 = v52;
LABEL_55:
                  v30 = 0;
                  v35 = 256;
                  goto LABEL_25;
                }
                v30 = 0;
                v35 = 0;
                v34 = v52;
LABEL_25:
                v36 = v35 | v30 | v34;
                v37 = qword_1ECD78A80;
                if (!qword_1ECD78A80)
                {
                  v37 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v37, (unint64_t *)&qword_1ECD78A80);
                }
                v38 = *(NSObject **)(v37 + 8);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  v39 = (void *)MEMORY[0x1E0CB3940];
                  v54 = v34;
                  v40 = self;
                  log = v38;
                  v41 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v41);
                  v42 = p_serviceResolvedPhysicalButtonConfigurations;
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "stringWithFormat:", CFSTR("<%@: %p>"), v43, v40);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  v34 = v54;
                  p_serviceResolvedPhysicalButtonConfigurations = v42;
                  *(_DWORD *)buf = 138544386;
                  v56 = v44;
                  v57 = 1026;
                  v58 = v36 & 1;
                  v59 = 1026;
                  *(_DWORD *)v60 = HIBYTE(v36);
                  *(_WORD *)&v60[4] = 1026;
                  *(_DWORD *)&v60[6] = HIWORD(v54) & 1;
                  v61 = 1026;
                  v62 = (v36 >> 8) & 1;
                  _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_DEFAULT, "Actions for resolved configurations update from service: %{public}@; shouldCreate: %{public}d; shoul"
                    "dDisable: %{public}d; shouldEnable: %{public}d; shouldUpdate: %{public}d",
                    buf,
                    0x24u);

                }
                if (HIBYTE(v36))
                  -[_UIPhysicalButtonInteraction _setEnabled:](self->_proxyPhysicalButtonInteraction, "_setEnabled:", 0);
                -[_UIPhysicalButtonConfigurationSet _nsSetRepresentation](*p_serviceResolvedPhysicalButtonConfigurations);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v36 & 1) != 0)
                {
                  v46 = (_UIPhysicalButtonProxyInteraction *)-[_UIPhysicalButtonProxyInteraction initWithConfigurations:proxyDelegate:]([_UIPhysicalButtonProxyInteraction alloc], (uint64_t)v45, self);
                  proxyPhysicalButtonInteraction = self->_proxyPhysicalButtonInteraction;
                  self->_proxyPhysicalButtonInteraction = v46;

                  -[UIViewController _existingView](self, "_existingView");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "addInteraction:", self->_proxyPhysicalButtonInteraction);

                }
                else if ((v36 & 0x100) != 0)
                {
                  -[_UIPhysicalButtonInteraction _setConfigurations:](self->_proxyPhysicalButtonInteraction, "_setConfigurations:", v45);
                }
                if ((v34 & 0x10000) != 0)
                  -[_UIPhysicalButtonInteraction _setEnabled:](self->_proxyPhysicalButtonInteraction, "_setEnabled:", 1);
                -[_UIRemoteViewController _updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:newResolvedConfigurations:](self, v26, *p_serviceResolvedPhysicalButtonConfigurations);

                goto LABEL_38;
              }
LABEL_44:
              v52 = 0;
              v34 = 0x10000;
              goto LABEL_53;
            }

            v52 = 0x1000000;
            v34 = 16842752;
            if (!v33)
              goto LABEL_49;
          }
          else
          {

            if (!v33)
            {
              v52 = 0;
              goto LABEL_49;
            }
            v34 = 0x10000;
          }
LABEL_54:
          if (v32)
            goto LABEL_55;
          v30 = 0;
          goto LABEL_24;
        }
        v30 = v31 != 0;
LABEL_23:

        v34 = 0;
LABEL_24:
        v35 = 0;
        goto LABEL_25;
      }
      v29 = -[_UIPhysicalButtonConfigurationSet isEqual:](v26, "isEqual:", v27);

      if (!v29)
        goto LABEL_19;
    }
    v30 = 0;
    goto LABEL_23;
  }
LABEL_38:

}

- (BOOL)shouldPropagateAppearanceCustomizations
{
  int v3;

  v3 = objc_msgSend((id)objc_opt_class(), "shouldPropagateAppearanceCustomizations");
  if (v3)
    LOBYTE(v3) = -[_UIRemoteViewService overridesHostAppearance](self->_remoteViewService, "overridesHostAppearance") ^ 1;
  return v3;
}

- (void)_appearanceInvocationsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_RemoteViewControllerPropagatesUIAppearance, (uint64_t)CFSTR("RemoteViewControllerPropagatesUIAppearance"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EDDA8394)
  {
    if (-[_UIRemoteViewController shouldPropagateAppearanceCustomizations](self, "shouldPropagateAppearanceCustomizations"))
    {
      -[_UIRemoteViewController _appearanceSource](self, "_appearanceSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __59___UIRemoteViewController__appearanceInvocationsDidChange___block_invoke;
      v7[3] = &unk_1E16E8AF8;
      v7[4] = self;
      UIViewServiceProcessAppearanceUpdate(v4, v6, v7);

    }
  }
}

- (void)_updateTintColor
{
  id v3;

  if (-[_UIRemoteViewController shouldPropagateAppearanceCustomizations](self, "shouldPropagateAppearanceCustomizations"))
  {
    -[UIView _normalInheritedTintColor](self->_serviceViewControllerRemoteView, "_normalInheritedTintColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(self->_viewControllerOperatorProxy, "__setHostTintColor:tintAdjustmentMode:", v3, -[UIView tintAdjustmentMode](self->_serviceViewControllerRemoteView, "tintAdjustmentMode"));

  }
}

- (void)_initializeAccessibilityPortInformation
{
  ipc_space_t v3;
  mach_port_name_t v4;
  id v5;
  void *v6;
  id viewControllerOperatorProxy;
  _QWORD v8[4];
  id v9;
  id location;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *MEMORY[0x1E0C83DA0];
    v4 = objc_msgSend((id)UIApp, "_accessibilityMachPort");
    mach_port_insert_right(v3, v4, objc_msgSend((id)UIApp, "_accessibilityMachPort"), 0x14u);
    v5 = objc_alloc(MEMORY[0x1E0D017A0]);
    v6 = (void *)objc_msgSend(v5, "initWithPort:", objc_msgSend((id)UIApp, "_accessibilityMachPort"));
  }
  else
  {
    v6 = 0;
  }
  objc_initWeak(&location, self);
  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66___UIRemoteViewController__initializeAccessibilityPortInformation__block_invoke;
  v8[3] = &unk_1E16E8B20;
  objc_copyWeak(&v9, &location);
  objc_msgSend(viewControllerOperatorProxy, "__exchangeAccessibilityPortInformation:replyHandler:", v6, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)__showServiceForType:(int64_t)a3 withContext:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _UIRemoteViewController *v15;
  id v16;
  int64_t v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73___UIRemoteViewController___showServiceForType_withContext_replyHandler___block_invoke;
  v13[3] = &unk_1E16D85F8;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a3;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performAsync:", v13);

}

- (void)__showServiceForText:(id)a3 selectedTextRangeValue:(id)a4 type:(int64_t)a5 fromRectValue:(id)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _UIRemoteViewController *v25;
  id v26;
  int64_t v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __103___UIRemoteViewController___showServiceForText_selectedTextRangeValue_type_fromRectValue_replyHandler___block_invoke;
  v21[3] = &unk_1E16D62C0;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  v25 = self;
  v26 = v15;
  v27 = a5;
  v17 = v15;
  v18 = v12;
  v19 = v13;
  v20 = v14;
  objc_msgSend(v16, "performAsync:", v21);

}

- (void)__showServiceForText:(id)a3 type:(int64_t)a4 fromRectValue:(id)a5 replyHandler:(id)a6
{
  -[_UIRemoteViewController __showServiceForText:selectedTextRangeValue:type:fromRectValue:replyHandler:](self, "__showServiceForText:selectedTextRangeValue:type:fromRectValue:replyHandler:", a3, 0, a4, a5, a6);
}

- (void)__dismissTextServiceSessionAnimated:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63___UIRemoteViewController___dismissTextServiceSessionAnimated___block_invoke;
  v6[3] = &unk_1E16B1B78;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performAsync:", v6);

}

- (void)_cancelProxiedEditAlertViewAnimated:(BOOL)a3
{
  -[UIAlertController _endNoPresentingViewControllerPresentation](self->_proxiedEditAlertController, "_endNoPresentingViewControllerPresentation", a3);
}

- (void)_endNoPresentingViewControllerAlertController:(id)a3
{
  UIAlertController *v4;
  UIAlertController *proxiedEditAlertController;
  UIAlertController *v6;

  v4 = (UIAlertController *)a3;
  -[UIAlertController _endNoPresentingViewControllerPresentation](v4, "_endNoPresentingViewControllerPresentation");
  proxiedEditAlertController = self->_proxiedEditAlertController;

  if (proxiedEditAlertController == v4)
  {
    self->_proxiedEditAlertToken = 0;
    v6 = self->_proxiedEditAlertController;
    self->_proxiedEditAlertController = 0;

  }
}

- (void)__showEditAlertViewWithToken:(int64_t)a3 canUndo:(BOOL)a4 canRedo:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  UINotificationFeedbackGenerator *motionNotificationGenerator;
  UINotificationFeedbackGenerator *v12;
  void *v13;
  void *v14;
  UINotificationFeedbackGenerator *v15;
  UINotificationFeedbackGenerator *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIAlertController *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  UIAlertController *v27;
  void *v28;
  UIAlertController *v29;
  void *v30;
  void *v31;
  void *v32;
  UIAlertController *v33;
  void *v34;
  UIAlertController *v35;
  void *v36;
  UIAlertController *proxiedEditAlertController;
  UIAlertController *v38;
  UIAlertController *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  UIAlertController *v45;
  _QWORD v46[5];
  UIAlertController *v47;
  _QWORD v48[5];
  UIAlertController *v49;

  v5 = a5;
  v6 = a4;
  -[UIViewController _window](self, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && !objc_msgSend(v9, "_isHostedInAnotherProcess"))
  {
    motionNotificationGenerator = self->_motionNotificationGenerator;
    if (!motionNotificationGenerator)
    {
      v12 = [UINotificationFeedbackGenerator alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E1A9AC98);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UINotificationFeedbackGeneratorConfiguration privateConfigurationForTypes:](_UINotificationFeedbackGeneratorConfiguration, "privateConfigurationForTypes:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[UIFeedbackGenerator initWithConfiguration:](v12, "initWithConfiguration:", v14);
      v16 = self->_motionNotificationGenerator;
      self->_motionNotificationGenerator = v15;

      motionNotificationGenerator = self->_motionNotificationGenerator;
    }
    -[UIFeedbackGenerator activateWithCompletionBlock:](motionNotificationGenerator, "activateWithCompletionBlock:", 0);
    +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UIKitBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL_TITLE_IN_UNDO_ALERT"), CFSTR("Cancel"), CFSTR("Localizable"));
    v19 = objc_claimAutoreleasedReturnValue();

    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke;
    v48[3] = &unk_1E16DD450;
    v48[4] = self;
    v20 = v17;
    v49 = v20;
    v43 = (void *)v19;
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 1, v48);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v6 && v5;
    if (!v6 || !v5)
      -[UIAlertController addAction:](v20, "addAction:", v21);
    if (v6 || v5)
    {
      if (v6)
      {
        _UIKitBundle();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("UNDO_BUTTON_TITLE_IN_UNDO_ALERT"), CFSTR("Undo"), CFSTR("Localizable"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_3;
        v46[3] = &unk_1E16DD450;
        v46[4] = self;
        v42 = v21;
        v26 = a3;
        v27 = v20;
        v47 = v27;
        +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 0, v46);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        a3 = v26;
        v21 = v42;
        -[UIAlertController addAction:](v29, "addAction:", v28);

      }
      if (v5)
      {
        _UIKitBundle();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("REDO_BUTTON_TITLE_IN_UNDO_ALERT"), CFSTR("Redo"), CFSTR("Localizable"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_5;
        v44[3] = &unk_1E16DD450;
        v44[4] = self;
        v32 = v21;
        v33 = v20;
        v45 = v33;
        +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v31, 0, v44);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v33;
        v21 = v32;
        -[UIAlertController addAction:](v35, "addAction:", v34);

      }
      _UIKitBundle();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("UNDO_TITLE_LABEL_IN_UNDO_ALERT"), CFSTR("Undo"), CFSTR("Localizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Nothing to Undo"), CFSTR("Nothing to Undo"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIAlertController setTitle:](v20, "setTitle:", v23);

    if (v22)
      -[UIAlertController addAction:](v20, "addAction:", v21);
    -[UINotificationFeedbackGenerator _privateNotificationOccurred:](self->_motionNotificationGenerator, "_privateNotificationOccurred:", 1006);
    -[UIFeedbackGenerator deactivate](self->_motionNotificationGenerator, "deactivate");
    self->_proxiedEditAlertToken = a3;
    proxiedEditAlertController = self->_proxiedEditAlertController;
    self->_proxiedEditAlertController = v20;
    v38 = v20;

    v39 = self->_proxiedEditAlertController;
    -[UIViewController _window](self, "_window");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "windowScene");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController _beginNoPresentingViewControllerPresentation:](v39, "_beginNoPresentingViewControllerPresentation:", v41);

  }
  else
  {
    objc_msgSend(self->_viewControllerOperatorProxy, "__cancelAlertActionWithToken:", self->_proxiedEditAlertToken);
  }

}

- (BOOL)__interdictServiceViewTouches
{
  return self->_viewServiceTouchInterdictionView != 0;
}

- (void)__setInterdictServiceViewTouches:(BOOL)a3
{
  _BOOL4 v3;
  UIView *v5;
  UIView *viewServiceTouchInterdictionView;
  void *v7;
  UIView *v8;

  v3 = a3;
  -[UIView removeFromSuperview](self->_viewServiceTouchInterdictionView, "removeFromSuperview");
  if (v3)
  {
    v5 = objc_alloc_init(UIView);
    viewServiceTouchInterdictionView = self->_viewServiceTouchInterdictionView;
    self->_viewServiceTouchInterdictionView = v5;

    -[UIView layer](self->_viewServiceTouchInterdictionView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHitTestsAsOpaque:", 1);

    -[_UIRemoteViewController updateTouchInterdictionViewLayout](self, "updateTouchInterdictionViewLayout");
  }
  else
  {
    v8 = self->_viewServiceTouchInterdictionView;
    self->_viewServiceTouchInterdictionView = 0;

  }
}

- (void)updateTouchInterdictionViewLayout
{
  void *v3;
  void *v4;
  int v5;
  UIView *viewServiceTouchInterdictionView;
  id v7;

  -[UIView superview](self->_sizeTrackingView, "superview");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7
    && (-[UIViewController _window](self, "_window"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "screen"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_isMainLikeScreen"),
        v4,
        v3,
        v5))
  {
    objc_msgSend(v7, "insertSubview:aboveSubview:", self->_viewServiceTouchInterdictionView, self->_sizeTrackingView);
    viewServiceTouchInterdictionView = self->_viewServiceTouchInterdictionView;
    -[UIView frame](self->_sizeTrackingView, "frame");
    -[UIView setFrame:](viewServiceTouchInterdictionView, "setFrame:");
  }
  else
  {
    -[UIView removeFromSuperview](self->_viewServiceTouchInterdictionView, "removeFromSuperview");
  }

}

- (void)_noteWindowState:(BOOL)a3
{
  _BOOL8 v4;

  v4 = !a3;
  -[UIView setHidden:](self->_fullScreenTextEffectsSnapshotView, "setHidden:", v4);
  -[UIView setHidden:](self->_fullScreenTextEffectsRemoteView, "setHidden:", v4);
  -[UIView setHidden:](self->_textEffectsAboveStatusBarRemoteView, "setHidden:", v4);
  -[UIView setHidden:](self->_remoteKeyboardRemoteView, "setHidden:", v4);
}

- (void)setServiceViewShouldShareTouchesWithHost:(BOOL)a3
{
  if (self->_serviceViewShouldShareTouchesWithHost != a3)
  {
    self->_serviceViewShouldShareTouchesWithHost = a3;
    if (a3)
      -[_UIRemoteViewController _prepareTouchDeliveryPolicy](self, "_prepareTouchDeliveryPolicy");
    else
      -[_UIRemoteViewController _setTouchDeliveryPolicyAssertion:](self, "_setTouchDeliveryPolicyAssertion:", 0);
  }
}

- (void)_prepareTouchDeliveryPolicy
{
  _UIRemoteView *serviceViewControllerRemoteView;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  SEL v17;

  if (-[_UIRemoteViewController serviceViewShouldShareTouchesWithHost](self, "serviceViewShouldShareTouchesWithHost"))
  {
    serviceViewControllerRemoteView = self->_serviceViewControllerRemoteView;
    if (serviceViewControllerRemoteView)
    {
      -[UIView _window](serviceViewControllerRemoteView, "_window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[_UIRemoteView hostedWindowHostingHandle](self->_serviceViewControllerRemoteView, "hostedWindowHostingHandle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "contextID");

        -[UIView _window](self->_serviceViewControllerRemoteView, "_window");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "_contextId");

        v10 = objc_alloc_init(MEMORY[0x1E0D00E10]);
        objc_msgSend(MEMORY[0x1E0D00E08], "policyRequiringSharingOfTouchesDeliveredToChildContextId:withHostContextId:", v7, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endpoint");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAssertionEndpoint:", v12);

        v15 = MEMORY[0x1E0C809B0];
        v17 = a2;
        v13 = v11;
        v16 = v13;
        BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[_UIRemoteViewController _setTouchDeliveryPolicyAssertion:](self, "_setTouchDeliveryPolicyAssertion:", v10, v15, 3221225472, __54___UIRemoteViewController__prepareTouchDeliveryPolicy__block_invoke, &unk_1E16E8B48, v13, v17);
          objc_msgSend(v14, "ipc_addPolicy:", v13);
        }

      }
    }
  }
}

- (id)_cancelTouchesForCurrentEventInHostedContent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  double v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v25 = MEMORY[0x1E0C809B0];
  BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView _window](self->_serviceViewControllerRemoteView, "_window", v25, 3221225472, __71___UIRemoteViewController__cancelTouchesForCurrentEventInHostedContent__block_invoke, &__block_descriptor_40_e17_v16__0__NSError_8l, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteView hostedWindowHostingHandle](self->_serviceViewControllerRemoteView, "hostedWindowHostingHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "contextID");
    if (!v5)
    {
      v15 = 0;
      goto LABEL_23;
    }
    v7 = v6;
    v8 = (id)objc_msgSend((id)UIApp, "_touchesEventForWindow:", v4);
    if (!v8
      || ((v9 = v8,
           -[UIView _window](self->_serviceViewControllerRemoteView, "_window"),
           v10 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(v9, "_initialTouchTimestampForWindow:", v10),
           v12 = v11,
           v10,
           v12 > 0.0)
        ? (v13 = (_DWORD)v7 == 0)
        : (v13 = 1),
          v13))
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D00E08], "policyCancelingTouchesDeliveredToContextId:withInitialTouchTimestamp:", v7, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = (id)objc_msgSend((id)UIApp, "_scrollEventForWindow:", v4);
    if (!v17 || ((objc_msgSend(v17, "_beganScrollTimestamp"), v18 > 0.0) ? (v19 = (_DWORD)v7 == 0) : (v19 = 1), v19))
    {
      v15 = 0;
      if (!v16)
        goto LABEL_23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D00E08], "policyCancelingTouchesDeliveredToContextId:withInitialTouchTimestamp:", v7);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
LABEL_23:
        v15 = v15;
        v16 = 0;
        v22 = v15;
        if (!v15)
        {
LABEL_24:
          v14 = 0;
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:
        v14 = objc_alloc_init(MEMORY[0x1E0D00E10]);
        objc_msgSend(v14, "endpoint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setAssertionEndpoint:", v23);

        objc_msgSend(v3, "ipc_addPolicy:", v22);
        goto LABEL_27;
      }
    }
    if (v15)
    {
      v20 = (void *)MEMORY[0x1E0D00E08];
      v27[0] = v16;
      v27[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "policyByCombiningPolicies:", v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_24;
    }
    else
    {
      v22 = v16;
      v16 = v22;
    }
    goto LABEL_26;
  }
  v14 = 0;
LABEL_28:

  return v14;
}

- (void)_setViewClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->__viewClipsToBounds != a3)
  {
    v3 = a3;
    self->__viewClipsToBounds = a3;
    -[UIViewController view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClipsToBounds:", v3);

  }
}

- (void)__trampolineButtonPressData:(id)a3 canceled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  const void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (qword_1ECD78A90 != -1)
    dispatch_once(&qword_1ECD78A90, &__block_literal_global_607);
  v7 = MEMORY[0x186DC7A2C](*MEMORY[0x1E0C9AE00], v6);
  if (v7)
  {
    v8 = (const void *)v7;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (id)qword_1ECD78A88;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        if (_UIApplicationPressEventConformsToType((uint64_t)v8, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "integerValue", (_QWORD)v18)))
        {
          break;
        }
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            goto LABEL_6;
          goto LABEL_15;
        }
      }

      v14 = (void *)UIApp;
      if (v4)
      {
        -[UIViewController _window](self, "_window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v14, "_pressesEventForWindow:", v15);

        v17 = (void *)UIApp;
        objc_msgSend(v16, "allPresses");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_cancelTouchesOrPresses:withEvent:", v9, v16);
        goto LABEL_15;
      }
      objc_msgSend((id)UIApp, "_enqueueHIDEvent:", v8);
    }
    else
    {
LABEL_15:

    }
    CFRelease(v8);
  }

}

- (void)__handleFocusMovementAction:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[UIViewController _window](self, "_window");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_forwardFocusMovementAction:", v4);

  }
}

- (id)_timelineID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIRemoteViewController:%p"), self);
}

- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4
{
  id v6;
  id viewControllerOperatorProxy;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64___UIRemoteViewController__timelinesForDateInterval_completion___block_invoke;
  v9[3] = &unk_1E16BB6E0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(viewControllerOperatorProxy, "__timelinesForDateInterval:completion:", a3, v9);

}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id viewControllerOperatorProxy;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[_UIRemoteViewController _timelineID](self, "_timelineID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entrySpecifierForTimelineIdentifier:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  objc_msgSend(v12, "timelineEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(viewControllerOperatorProxy, "__updateWithFrameSpecifierDate:completion:", v11, v6);

}

- (BOOL)_allowsShielding
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = objc_alloc(MEMORY[0x1E0CA5848]);
  -[_UIRemoteViewService plugin](self->_remoteViewService, "plugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:error:", v5, 0);

  if (v6)
  {
    objc_msgSend(v6, "containingBundleRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UIMainBundleIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(v6, "optsOutOfAppProtectionShield");

  }
  else
  {
    v10 = objc_msgSend(0, "optsOutOfAppProtectionShield");
  }

  return v10 ^ 1;
}

- (void)setupAppProtectionIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  APExtension *v8;
  APExtension *appProtectionExtension;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  APExtension *v16;
  APExtension *v17;
  void *v18;
  objc_class *v19;
  APExtensionSubjectMonitorRegistry *v20;
  APExtensionSubjectMonitorRegistry *appProtectionSubjectMonitorRegistry;
  id v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE buf[24];
  void *v33;
  uint64_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_remoteViewControllerFlags & 8) == 0)
  {
    *(_BYTE *)&self->_remoteViewControllerFlags |= 8u;
    if (-[_UIRemoteViewController _allowsShielding](self, "_allowsShielding"))
    {
      -[_UIRemoteViewController _extensionBundleIdentifierForAppProtection](self, "_extensionBundleIdentifierForAppProtection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v4 = objc_alloc(MEMORY[0x1E0CA5848]);
        -[_UIRemoteViewController _extensionBundleIdentifierForAppProtection](self, "_extensionBundleIdentifierForAppProtection");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:error:", v5, &v27);
        v7 = v27;

        if (!v7)
        {
          v8 = (APExtension *)objc_msgSend(objc_alloc((Class)getAPExtensionClass()), "initWithApplicationExtensionRecord:", v6);
          appProtectionExtension = self->_appProtectionExtension;
          self->_appProtectionExtension = v8;

        }
        if (self->_appProtectionExtension)
          goto LABEL_12;
        -[_UIRemoteViewService plugin](self->_remoteViewService, "plugin");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[_UIRemoteViewController _extensionBundleIdentifierForAppProtection](self, "_extensionBundleIdentifierForAppProtection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (!v13)
          {
            if (objc_msgSend(getAPExtensionClass(), "instancesRespondToSelector:", sel_initWithExtensionUUID_bundleIdentifier_))
            {
              v14 = objc_alloc((Class)getAPExtensionClass());
              -[_UIRemoteViewController _extensionBundleIdentifierForAppProtection](self, "_extensionBundleIdentifierForAppProtection");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (APExtension *)objc_msgSend(v14, "initWithExtensionUUID:bundleIdentifier:", v11, v15);
              v17 = self->_appProtectionExtension;
              self->_appProtectionExtension = v16;

            }
          }
        }

        if (self->_appProtectionExtension)
        {
LABEL_12:
          v28 = 0;
          v29 = &v28;
          v30 = 0x2050000000;
          v18 = (void *)qword_1ECD78AD8;
          v31 = qword_1ECD78AD8;
          if (!qword_1ECD78AD8)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getAPExtensionSubjectMonitorRegistryClass_block_invoke;
            v33 = &unk_1E16B14C0;
            v34 = &v28;
            __getAPExtensionSubjectMonitorRegistryClass_block_invoke((uint64_t)buf);
            v18 = (void *)v29[3];
          }
          v19 = objc_retainAutorelease(v18);
          _Block_object_dispose(&v28, 8);
          v20 = (APExtensionSubjectMonitorRegistry *)objc_msgSend([v19 alloc], "initWithExtensionSubject:", self->_appProtectionExtension);
          appProtectionSubjectMonitorRegistry = self->_appProtectionSubjectMonitorRegistry;
          self->_appProtectionSubjectMonitorRegistry = v20;

          v22 = (id)-[APExtensionSubjectMonitorRegistry addMonitor:](self->_appProtectionSubjectMonitorRegistry, "addMonitor:", self);
          -[APExtensionSubjectMonitorRegistry resume](self->_appProtectionSubjectMonitorRegistry, "resume");
        }
        else
        {
          v23 = qword_1ECD78A98;
          if (!qword_1ECD78A98)
          {
            v23 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v23, (unint64_t *)&qword_1ECD78A98);
          }
          if ((*(_BYTE *)v23 & 1) != 0)
          {
            v24 = *(NSObject **)(v23 + 8);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v25 = v24;
              -[_UIRemoteViewController _extensionBundleIdentifierForAppProtection](self, "_extensionBundleIdentifierForAppProtection");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v26;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v7;
              _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Couldn't find app protection extension for: %@ error: %@", buf, 0x16u);

            }
          }
        }
        -[_UIRemoteViewController presentAppProtectionShieldIfServiceCurrentlyRequiresAuth](self, "presentAppProtectionShieldIfServiceCurrentlyRequiresAuth");

      }
    }
  }
}

- (void)createAppProtectionShieldView
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_class *v22;
  UIView *v23;
  UIView *appProtectionShieldView;
  UIView *v25;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
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
  if (self->_appProtectionShieldView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRemoteViewController.m"), 6099, CFSTR("App protection view already exists"));

  }
  v3 = objc_alloc(MEMORY[0x1E0CA5848]);
  -[_UIRemoteViewController _extensionBundleIdentifierForAppProtection](self, "_extensionBundleIdentifierForAppProtection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:error:", v4, &v35);
  v34 = v35;

  if (v34)
  {
    v6 = qword_1ECD78AA0;
    if (!qword_1ECD78AA0)
    {
      v6 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD78AA0);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v28 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = v28;
        -[_UIRemoteViewController _extensionBundleIdentifierForAppProtection](self, "_extensionBundleIdentifierForAppProtection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "Couldn't fetch bundle record for %@. Error: %@", buf, 0x16u);

      }
    }
  }
  objc_msgSend(v5, "appProtectionEffectiveContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v7, 1, 0);
  if (v8)
  {
    if (v7)
    {
LABEL_9:
      v9 = v7;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(v5, "containingBundleRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_9;
  }
  -[_UIRemoteViewController _extensionBundleIdentifierForAppProtection](self, "_extensionBundleIdentifierForAppProtection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v10 = v9;
  objc_msgSend(v8, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v32 = v11;
  }
  else
  {
    -[_UIRemoteViewService plugin](self->_remoteViewService, "plugin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedName");
    v32 = (id)objc_claimAutoreleasedReturnValue();

  }
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v10);
  v14 = objc_alloc(MEMORY[0x1E0D3A830]);
  -[UIViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  v17 = (void *)objc_msgSend(v14, "initWithSize:scale:", 64.0, 64.0, v16);

  objc_msgSend(v17, "setDrawBorder:", 1);
  objc_msgSend(v33, "prepareImageForDescriptor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "CGImage");
  objc_msgSend(v18, "scale");
  +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v21 = (void *)qword_1ECD78AE0;
  v39 = qword_1ECD78AE0;
  if (!qword_1ECD78AE0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAPBaseExtensionShieldViewClass_block_invoke;
    v41 = &unk_1E16B14C0;
    v42 = &v36;
    __getAPBaseExtensionShieldViewClass_block_invoke((uint64_t)buf);
    v21 = (void *)v37[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v36, 8);
  v23 = (UIView *)objc_msgSend([v22 alloc], "initWithLocalizedApplicationName:iconImage:", v32, v20);
  -[UIView setDelegate:](v23, "setDelegate:", self);
  v31 = v5;
  appProtectionShieldView = self->_appProtectionShieldView;
  self->_appProtectionShieldView = v23;
  v25 = v23;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_appProtectionShieldView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)presentAppProtectionShieldUnconditionallyIfProtectionIsEnabled
{
  if (-[APExtension isEffectivelyLocked](self->_appProtectionExtension, "isEffectivelyLocked"))
    -[_UIRemoteViewController presentAppProtectionShieldView](self, "presentAppProtectionShieldView");
}

- (void)presentAppProtectionShieldIfServiceCurrentlyRequiresAuth
{
  if (-[APExtension requiresShielding](self->_appProtectionExtension, "requiresShielding"))
    -[_UIRemoteViewController presentAppProtectionShieldView](self, "presentAppProtectionShieldView");
}

- (void)requestAppProtectionAuthIfNecessary
{
  if ((*(_BYTE *)&self->_remoteViewControllerFlags & 0x10) != 0)
  {
    if (-[APExtension requiresShielding](self->_appProtectionExtension, "requiresShielding"))
      -[_UIRemoteViewController shieldViewUnlockButtonPressed:](self, "shieldViewUnlockButtonPressed:", self->_appProtectionShieldView);
    else
      -[_UIRemoteViewController removeAppProtectionShieldView](self, "removeAppProtectionShieldView");
  }
}

- (void)presentAppProtectionShieldView
{
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if ((*(_BYTE *)&self->_remoteViewControllerFlags & 0x10) == 0)
  {
    if (!self->_appProtectionShieldView)
      -[_UIRemoteViewController createAppProtectionShieldView](self, "createAppProtectionShieldView");
    -[UIViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", self->_appProtectionShieldView);

    v15 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leftAnchor](self->_appProtectionShieldView, "leftAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    -[UIView topAnchor](self->_appProtectionShieldView, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v14;
    -[UIView rightAnchor](self->_appProtectionShieldView, "rightAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v7;
    -[UIView bottomAnchor](self->_appProtectionShieldView, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v12);

    -[_UIRemoteViewController _sheetPresentationController](self, "_sheetPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_tryToConnectToRemoteSheet:", 0);

    *(_BYTE *)&self->_remoteViewControllerFlags |= 0x10u;
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidPresentShieldViewForAppProtection");
  }
}

- (void)removeAppProtectionShieldView
{
  _QWORD v3[5];

  BSDispatchQueueAssertMain();
  if ((*(_BYTE *)&self->_remoteViewControllerFlags & 0x10) != 0)
  {
    *(_BYTE *)&self->_remoteViewControllerFlags &= ~0x10u;
    -[UIView removeFromSuperview](self->_appProtectionShieldView, "removeFromSuperview");
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56___UIRemoteViewController_removeAppProtectionShieldView__block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    -[_UIRemoteViewController synchronizeAnimationsInActions:](self, "synchronizeAnimationsInActions:", v3);
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidDismissShieldViewForAppProtection");
  }
}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  APExtension *appProtectionExtension;
  _QWORD v12[4];
  id v13;
  id location;
  uint8_t buf[8];
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = qword_1ECD78AA8;
  if (!qword_1ECD78AA8)
  {
    v5 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&qword_1ECD78AA8);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Shield view unlock button pressed", buf, 2u);
  }
  objc_initWeak(&location, self);
  if (self->_appProtectionExtension)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v7 = (void *)qword_1ECD78AF0;
    v23 = qword_1ECD78AF0;
    v8 = MEMORY[0x1E0C809B0];
    if (!qword_1ECD78AF0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getAPGuardClass_block_invoke;
      v18 = &unk_1E16B14C0;
      v19 = &v20;
      __getAPGuardClass_block_invoke((uint64_t)buf);
      v7 = (void *)v21[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v20, 8);
    objc_msgSend(v9, "sharedGuard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    appProtectionExtension = self->_appProtectionExtension;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __57___UIRemoteViewController_shieldViewUnlockButtonPressed___block_invoke;
    v12[3] = &unk_1E16E8BB0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v10, "authenticateForExtension:completion:", appProtectionExtension, v12);

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___UIRemoteViewController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E16B1500;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_allowsConnection
{
  -[_UIRemoteViewController setupAppProtectionIfNecessary](self, "setupAppProtectionIfNecessary");
  return (*(_BYTE *)&self->_remoteViewControllerFlags & 0x10) == 0;
}

- (BOOL)_isAppProtectionLocked
{
  return (*(_BYTE *)&self->_remoteViewControllerFlags >> 4) & 1;
}

- (void)_intelligenceCollectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4
{
  objc_msgSend(self->_viewControllerOperatorProxy, "__intelligenceCollectRemoteContentInVisibleRect:withRemoteContextWrapper:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKSTouchDeliveryPolicyAssertion)_touchDeliveryPolicyAssertion
{
  return self->_touchDeliveryPolicyAssertion;
}

- (void)_setTouchDeliveryPolicyAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertion, a3);
}

- (BOOL)_isUpdatingSize
{
  return self->_isUpdatingSize;
}

- (void)_setIsUpdatingSize:(BOOL)a3
{
  self->_isUpdatingSize = a3;
}

- (BOOL)_isUpdatingSizeInHost
{
  return self->_isUpdatingSizeInHost;
}

- (void)_setIsUpdatingSizeInHost:(BOOL)a3
{
  self->_isUpdatingSizeInHost = a3;
}

- (_UIRemoteViewService)_remoteViewService
{
  return self->_remoteViewService;
}

- (_UIZoomTransitionController)_ancestorZoomTransitionController
{
  return (_UIZoomTransitionController *)objc_loadWeakRetained((id *)&self->_ancestorZoomTransitionController);
}

- (void)set_ancestorZoomTransitionController:(id)a3
{
  objc_storeWeak((id *)&self->_ancestorZoomTransitionController, a3);
}

- (_UISheetPresentationControllerConfiguration)_sheetConfiguration
{
  return self->__sheetConfiguration;
}

- (BOOL)serviceViewShouldShareTouchesWithHost
{
  return self->_serviceViewShouldShareTouchesWithHost;
}

- (BOOL)_viewClipsToBounds
{
  return self->__viewClipsToBounds;
}

- (_UISheetPresentationControllerConfiguration)_proxySheetConfigurationBeforeDeferring
{
  return self->__proxySheetConfigurationBeforeDeferring;
}

- (void)set_proxySheetConfigurationBeforeDeferring:(id)a3
{
  objc_storeStrong((id *)&self->__proxySheetConfigurationBeforeDeferring, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__proxySheetConfigurationBeforeDeferring, 0);
  objc_storeStrong((id *)&self->__sheetConfiguration, 0);
  objc_destroyWeak((id *)&self->_ancestorZoomTransitionController);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertion, 0);
  objc_storeStrong((id *)&self->_droppedTouchLoggingInhibitor, 0);
  objc_destroyWeak((id *)&self->_associatedRemoteContentRegistry);
  objc_storeStrong((id *)&self->_mutableKeyboardSceneLayers, 0);
  objc_storeStrong((id *)&self->_keyboardProxyPresentationEnvironment, 0);
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_multitaskingDragExclusionRects, 0);
  objc_storeStrong((id *)&self->_motionNotificationGenerator, 0);
  objc_storeStrong((id *)&self->_proxiedEditAlertController, 0);
  objc_storeStrong((id *)&self->_viewServiceTouchInterdictionView, 0);
  objc_storeStrong((id *)&self->_sizeTrackingConstraints, 0);
  objc_storeStrong((id *)&self->_allowedNotifications, 0);
  objc_storeStrong((id *)&self->_dynamicButtonDeferringToken, 0);
  objc_storeStrong((id *)&self->_proxyPhysicalButtonInteraction, 0);
  objc_storeStrong((id *)&self->_serviceResolvedPhysicalButtonConfigurations, 0);
  objc_storeStrong((id *)&self->_keyboardEnvironmentDeferringToken, 0);
  objc_storeStrong((id *)&self->_touchGrabbingView, 0);
  objc_storeStrong((id *)&self->_hostedDimmingView, 0);
  objc_storeStrong((id *)&self->_textServiceSession, 0);
  objc_storeStrong((id *)&self->_terminationError, 0);
  objc_storeStrong((id *)&self->_terminationInvocation, 0);
  objc_storeStrong((id *)&self->_serviceSceneContext, 0);
  objc_storeStrong((id *)&self->_lastNotifiedServiceScreenDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_fullScreenTextEffectsSnapshotView, 0);
  objc_storeStrong((id *)&self->_remoteKeyboardRemoteView, 0);
  objc_storeStrong((id *)&self->_textEffectsAboveStatusBarRemoteView, 0);
  objc_storeStrong((id *)&self->_fullScreenTextEffectsRemoteView, 0);
  objc_storeStrong((id *)&self->_serviceViewControllerRemoteView, 0);
  objc_storeStrong((id *)&self->_sizeTrackingView, 0);
  objc_storeStrong((id *)&self->_textEffectsOperatorHalfDisconnectionInvocation, 0);
  objc_storeStrong(&self->_textEffectsOperatorProxy, 0);
  objc_storeStrong((id *)&self->_viewControllerOperatorHalfDisconnectionInvocation, 0);
  objc_storeStrong(&self->_viewControllerOperatorProxy, 0);
  objc_storeStrong((id *)&self->_appProtectionSubjectMonitorRegistry, 0);
  objc_storeStrong((id *)&self->_appProtectionShieldView, 0);
  objc_storeStrong((id *)&self->_appProtectionExtension, 0);
  objc_storeStrong((id *)&self->_serviceViewControllerSupportedInterfaceOrientations, 0);
  objc_storeStrong(&self->_serviceViewControllerControlMessageProxy, 0);
  objc_storeStrong(&self->_serviceViewControllerProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewService, 0);
  objc_storeStrong((id *)&self->_serviceInterface, 0);
  objc_storeStrong((id *)&self->_serviceBundleIdentifier, 0);
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 1;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = objc_msgSend(v4, "code") == 1;
    v4 = v7;
    if (!v5)
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@: %@"), v6, v7);

      v4 = v7;
    }
  }

}

- (id)serviceViewControllerProxy
{
  return self->_serviceViewControllerProxy;
}

- (id)serviceViewControllerProxyWithErrorHandler:(id)a3
{
  return (id)objc_msgSend(self->_serviceViewControllerProxy, "remoteObjectProxyWithErrorHandler:", a3);
}

+ (id)serviceViewControllerInterface
{
  return 0;
}

+ (id)exportedInterface
{
  return 0;
}

- (NSString)debugDescription
{
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  objc_super v9;
  objc_super v10;

  if (os_variant_has_internal_diagnostics())
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIRemoteViewController;
    -[_UIRemoteViewController debugDescription](&v10, sel_debugDescription);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteViewController serviceBundleIdentifier](self, "serviceBundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (self->_serviceBundleIdentifier)
      v8 = CFSTR("extension");
    else
      v8 = CFSTR("view service");
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" serviceBundleIdentifier=%@ [%@]"), v6, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIRemoteViewController;
    -[_UIRemoteViewController debugDescription](&v9, sel_debugDescription);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

@end

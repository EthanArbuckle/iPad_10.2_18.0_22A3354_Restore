@implementation _UIViewServiceTextEffectsOperator

- (id)_queue
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  return v2;
}

+ (id)operatorWithRemoteViewControllerProxy:(id)a3 hostPID:(int)a4 sessionIdentifier:(id)a5
{
  uint64_t v6;
  id v7;
  NSUUID *v8;
  _UIViewServiceTextEffectsOperator *v9;
  id remoteViewControllerProxy;
  id v11;
  NSUUID *sessionIdentifier;
  NSUUID *v13;
  uint64_t v14;
  uint64_t v15;
  _UIAsyncInvocation *prepareForDisconnectionInvocation;
  uint64_t v17;
  _UIAsyncInvocation *invalidationInvocation;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = (NSUUID *)a5;
  v9 = objc_alloc_init(_UIViewServiceTextEffectsOperator);
  remoteViewControllerProxy = v9->_remoteViewControllerProxy;
  v9->_remoteViewControllerProxy = v7;
  v11 = v7;

  sessionIdentifier = v9->_sessionIdentifier;
  v9->_sessionIdentifier = v8;
  v13 = v8;

  v9->_wasInvalidated = 0;
  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __101___UIViewServiceTextEffectsOperator_operatorWithRemoteViewControllerProxy_hostPID_sessionIdentifier___block_invoke;
  v25[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v25[4] = v9;
  +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v25);
  v15 = objc_claimAutoreleasedReturnValue();
  prepareForDisconnectionInvocation = v9->_prepareForDisconnectionInvocation;
  v9->_prepareForDisconnectionInvocation = (_UIAsyncInvocation *)v15;

  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __101___UIViewServiceTextEffectsOperator_operatorWithRemoteViewControllerProxy_hostPID_sessionIdentifier___block_invoke_2;
  v24[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v24[4] = v9;
  +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v24);
  v17 = objc_claimAutoreleasedReturnValue();
  invalidationInvocation = v9->_invalidationInvocation;
  v9->_invalidationInvocation = (_UIAsyncInvocation *)v17;

  objc_msgSend((id)objc_opt_class(), "XPCInterface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "exportedInterface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "protocol");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewServiceUIBehaviorProxy proxyWrappingExportedObject:forCommunicationWithPID:exportedProtocol:](_UIViewServiceUIBehaviorProxy, "proxyWrappingExportedObject:forCommunicationWithPID:exportedProtocol:", v9, v6, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (BOOL)_shouldAddServiceOperator
{
  return 1;
}

- (void)_prepareForDisconnectionUnconditionallyThen:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81___UIViewServiceTextEffectsOperator__prepareForDisconnectionUnconditionallyThen___block_invoke;
  v6[3] = &unk_1E16B1D18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_invalidateUnconditionallyThen:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _UIViewServiceTextEffectsOperator *v9;

  v4 = a3;
  -[_UIViewServiceTextEffectsOperator _queue](self, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke;
  v7[3] = &unk_1E16E8A10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  void *v3;
  _QWORD v4[5];

  -[_UIViewServiceTextEffectsOperator invalidate](self, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58___UIViewServiceTextEffectsOperator__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v4[4] = self;
  objc_msgSend(v3, "whenCompleteDo:", v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 0x1E1784A60;
  v6[1] = CFSTR("_UIWindowDidBecomeApplicationKeyNotification");
  v6[2] = CFSTR("UITextInputResponderIsReloadedNotification");
  v6[3] = CFSTR("_UIScreenInterfaceOrientationDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, self->_allowedNotifications);
  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceTextEffectsOperator;
  -[_UIViewServiceTextEffectsOperator dealloc](&v5, sel_dealloc);
}

- (void)makeHostWindowKey
{
  id WeakRetained;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  double x;
  double y;
  void *v10;

  if (!self->_isRestoringInputViews)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    objc_msgSend(WeakRetained, "makeKeyWindow");

    v4 = objc_loadWeakRetained((id *)&self->_hostedWindow);
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_userInterfaceIdiom");

    if (v6 == 3)
    {
      v7 = objc_loadWeakRetained((id *)&self->_hostedWindow);
      objc_msgSend(v7, "_makeExternalKeyWindow");

    }
    -[_UIViewServiceTextEffectsOperator forceSyncToStatusBarOrientation](self, "forceSyncToStatusBarOrientation");
  }
  x = self->_windowOrigin.x;
  y = self->_windowOrigin.y;
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHostedViewOrigin:", x, y);

  -[_UIViewServiceTextEffectsOperator _reloadSafeInsets](self, "_reloadSafeInsets");
}

- (void)hostedWindow:(id)a3 didSetFirstResponder:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (!*(_WORD *)&self->_didResignForDisappear)
  {
    objc_storeStrong((id *)&_activeTextEffectsOperator, self);
    -[_UIViewServiceTextEffectsOperator makeHostWindowKey](self, "makeHostWindowKey");
  }

}

- (void)__createHostedTextEffectsWithReplyHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD, void *);
  unint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  os_signpost_id_t v21;
  os_signpost_id_t v22;
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = (void (**)(id, void *, _QWORD, void *))a3;
  v5 = _MergedGlobals_1295;
  if (!_MergedGlobals_1295)
  {
    v5 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_MergedGlobals_1295);
  }
  v6 = *(id *)(v5 + 8);
  v7 = os_signpost_id_make_with_pointer(*(os_log_t *)(v5 + 8), self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CreateHostedTextEffects", ", buf, 2u);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  v10 = (void *)_UISetCurrentFallbackEnvironment(WeakRetained);

  +[UIWindowScene _keyWindowScene]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUseHostedInstance:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("UITextEffectsWindowIsHostedNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__windowDidBecomeApplicationKey_, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__inputResponderReloaded_, CFSTR("UITextInputResponderIsReloadedNotification"), 0);
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_hostingHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "prepareForHostedWindowWithScene:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_hostingHandle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v15, 0, v18);

  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__viewServiceHostWillEnterForeground_, 0x1E1784A60, 0);
  _UIRestorePreviousFallbackEnvironment(v10);
  v19 = qword_1ECD82190;
  if (!qword_1ECD82190)
  {
    v19 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v19, (unint64_t *)&qword_1ECD82190);
  }
  v20 = *(id *)(v19 + 8);
  v21 = os_signpost_id_make_with_pointer(*(os_log_t *)(v19 + 8), self);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v20, OS_SIGNPOST_INTERVAL_END, v22, "CreateHostedTextEffects", ", v23, 2u);
    }
  }

}

- (void)__hostViewDidMoveToScreenWithNewHostingHandleReplyHandler:(id)a3
{
  _UIHostedWindow **p_hostedWindow;
  void (**v5)(id, void *, void *);
  id WeakRetained;
  void *v7;
  uint64_t v8;
  _UIViewServiceSessionActivityRecord *v9;
  _UIViewServiceSessionActivityRecord *sessionActivityRecord;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  p_hostedWindow = &self->_hostedWindow;
  v5 = (void (**)(id, void *, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_hostedWindow);
  objc_msgSend(WeakRetained, "windowScene");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_userInterfaceIdiom");

  +[_UIViewServiceSessionActivityRecord activityRecordForProvider:userInterfaceIdiom:]((uint64_t)_UIViewServiceSessionActivityRecord, self, v8);
  v9 = (_UIViewServiceSessionActivityRecord *)objc_claimAutoreleasedReturnValue();
  sessionActivityRecord = self->_sessionActivityRecord;
  self->_sessionActivityRecord = v9;

  -[_UIViewServiceTextEffectsOperator _uninstallActivityObserverGestureIfNeeded](self, "_uninstallActivityObserverGestureIfNeeded");
  -[_UIViewServiceTextEffectsOperator _installActivityObserverGestureIfNeeded](self, "_installActivityObserverGestureIfNeeded");
  -[_UIViewServiceTextEffectsOperator _uninstallActivityObserverGesturesFromKeyboardWindowIfNeeded](self, "_uninstallActivityObserverGesturesFromKeyboardWindowIfNeeded");
  -[_UIViewServiceTextEffectsOperator _installActivityObserverGesturesInKeyboardWindowIfNeeded](self, "_installActivityObserverGesturesInKeyboardWindowIfNeeded");
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_hostingHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prepareForHostedWindowWithScene:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_hostingHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v12, v15);
  v16 = objc_loadWeakRetained((id *)p_hostedWindow);
  objc_msgSend(v16, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "_interfaceOrientation");

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__screenInterfaceOrientationDidChange_, CFSTR("_UIScreenInterfaceOrientationDidChangeNotification"), 0);

  }
}

- (void)_screenInterfaceOrientationDidChange:(id)a3
{
  _UIHostedWindow **p_hostedWindow;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  p_hostedWindow = &self->_hostedWindow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  objc_msgSend(WeakRetained, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_interfaceOrientation");

  if (v7)
  {
    +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)p_hostedWindow);
    objc_msgSend(v8, "screen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setWindowInterfaceOrientation:", objc_msgSend(v9, "_interfaceOrientation"));

    objc_msgSend(v11, "_sceneBoundsDidChange");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("_UIScreenInterfaceOrientationDidChangeNotification"), 0);

  }
}

- (void)__setWindowOffset:(CGPoint)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  _QWORD v14[5];

  self->_windowOrigin = a3;
  if (!self->_localVCDisablesAutomaticBehaviors && _activeTextEffectsOperator == (_QWORD)self)
  {
    +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostedViewOrigin");
    v7 = floor(v6);
    v9 = floor(v8);
    v10 = floor(self->_windowOrigin.x);
    v11 = floor(self->_windowOrigin.y);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55___UIViewServiceTextEffectsOperator___setWindowOffset___block_invoke;
    v14[3] = &unk_1E16B29D0;
    v14[4] = self;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v14);
    if (v7 != v10 || v9 != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("UITextEffectsWindowOffsetDidChangeNotification"), 0);

    }
  }
}

- (void)_reloadSafeInsets
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54___UIViewServiceTextEffectsOperator__reloadSafeInsets__block_invoke;
  v2[3] = &unk_1E16B29D0;
  v2[4] = self;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v2);
}

- (void)__setSafeAreaInsets:(UIEdgeInsets)a3
{
  BOOL v3;
  id v4;

  self->_safeAreaInsets = a3;
  if (_activeTextEffectsOperator)
    v3 = _activeTextEffectsOperator == (_QWORD)self;
  else
    v3 = 1;
  if (v3)
  {
    -[_UIViewServiceTextEffectsOperator _reloadSafeInsets](self, "_reloadSafeInsets");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("UITextEffectsWindowSafeAreaInsetsDidChangeNotification"), 0);

  }
}

- (void)_resetHostedViewSize
{
  id v3;

  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", 0, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHostedViewSize:", self->_hostedViewSize.width, self->_hostedViewSize.height);
  objc_msgSend(v3, "_sceneBoundsDidChange");

}

- (void)__setHostedViewSize:(CGSize)a3
{
  id v3;

  self->_hostedViewSize = a3;
  -[_UIViewServiceTextEffectsOperator _resetHostedViewSize](self, "_resetHostedViewSize");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UITextEffectsWindowHostedViewSizeDidChangeNotification"), 0);

}

- (void)__setHostedViewReference:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", 0, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHostedViewReference:", x, y, width, height);

}

- (void)__setNextAutomaticOrderOutDirection:(int)a3 duration:(double)a4
{
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;

  if (!self->_localVCDisablesAutomaticBehaviors)
  {
    v5 = *(_QWORD *)&a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    objc_msgSend(WeakRetained, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyboardSceneDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setNextAutomaticOrderInDirection:duration:", v5, a4);
  }
}

- (void)__setHostAllowedNotifications:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_allowedNotifications;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "removeObserver:name:object:", self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), 0);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  objc_storeStrong((id *)&self->_allowedNotifications, a3);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_allowedNotifications;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__sendNotification_, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), 0, (_QWORD)v17);
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)__hostDidEnterBackground
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!self->_wasInvalidated && !self->_localVCDisablesAutomaticBehaviors && _activeTextEffectsOperator == (_QWORD)self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    objc_msgSend(WeakRetained, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardSceneDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_preserveInputViewsWithId:animated:", v6, 0);

    v7 = (void *)_activeTextEffectsOperator;
    _activeTextEffectsOperator = 0;

    self->_canRestoreInputViews = 0;
  }
}

- (void)_restoreInputViews
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  if (self->_canRestoreInputViews)
  {
    self->_isRestoringInputViews = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    objc_msgSend(WeakRetained, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardSceneDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_restoreInputViewsWithId:animated:", v5, 0);

    self->_isRestoringInputViews = 0;
  }
  else
  {
    self->_canRestoreInputViews = 1;
  }
}

- (void)__hostWillEnterForeground
{
  BOOL v3;
  double x;
  double y;
  void *v6;

  if (!self->_wasInvalidated && !self->_localVCDisablesAutomaticBehaviors)
  {
    if (_activeTextEffectsOperator)
      v3 = _activeTextEffectsOperator == (_QWORD)self;
    else
      v3 = 1;
    if (!v3)
      self->_canRestoreInputViews = 0;
    x = self->_windowOrigin.x;
    y = self->_windowOrigin.y;
    +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHostedViewOrigin:", x, y);

    -[_UIViewServiceTextEffectsOperator _reloadSafeInsets](self, "_reloadSafeInsets");
    -[_UIViewServiceTextEffectsOperator _resetHostedViewSize](self, "_resetHostedViewSize");
    -[_UIViewServiceTextEffectsOperator _restoreInputViews](self, "_restoreInputViews");
    objc_storeStrong((id *)&_activeTextEffectsOperator, self);
  }
}

- (void)_viewServiceHostWillEnterForeground:(id)a3
{
  if (!self->_localVCDisablesAutomaticBehaviors)
    -[_UIViewServiceTextEffectsOperator _restoreInputViews](self, "_restoreInputViews", a3);
}

- (void)__hostViewWillAppear:(BOOL)a3
{
  id WeakRetained;
  void *v5;

  if (!self->_wasInvalidated && !self->_localVCDisablesAutomaticBehaviors)
  {
    if (self->_didResignForDisappear)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
      objc_msgSend(WeakRetained, "firstResponder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadInputViews");

      self->_didResignForDisappear = 0;
    }
    objc_storeStrong((id *)&_activeTextEffectsOperator, self);
  }
}

- (void)__hostViewWillDisappear:(BOOL)a3
{
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->_wasInvalidated && !self->_localVCDisablesAutomaticBehaviors && _activeTextEffectsOperator == (_QWORD)self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    UIKeyboardSafariDepresentForViewService();

    v6 = objc_loadWeakRetained((id *)&self->_hostedWindow);
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyboardSceneDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "responder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resignFirstResponder");

    objc_msgSend(v10, "_reloadInputViewsForResponder:", 0);
    self->_didResignForDisappear = 1;
    v9 = (void *)_activeTextEffectsOperator;
    _activeTextEffectsOperator = 0;

  }
}

- (void)__setRemoteTextEffectsWindowMatchesLayerWithContextId:(unsigned int)a3 renderId:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[5];

  v5 = *(_QWORD *)&a3;
  v28[4] = *MEMORY[0x1E0C80C00];
  -[_UIViewServiceTextEffectsOperator _removeTextEffectsWindowMatchAnimations](self, "_removeTextEffectsWindowMatchAnimations");
  if ((_DWORD)v5)
  {
    if (a4)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setSourceContextId:", v5);
      objc_msgSend(v7, "setSourceLayerRenderId:", a4);
      objc_msgSend(v7, "setDuration:", INFINITY);
      objc_msgSend(v7, "setUsesNormalizedCoordinates:", 1);
      v27[0] = 0;
      v27[1] = 0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v27, "{CGPoint=dd}");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v8;
      v26 = xmmword_1866721B0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v26, "{CGPoint=dd}");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v9;
      __asm { FMOV            V0.2D, #1.0 }
      v25 = _Q0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v25, "{CGPoint=dd}");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v15;
      v24 = xmmword_18666F250;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v24, "{CGPoint=dd}");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSourcePoints:", v17);

      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "setSourceContextId:", v5);
      objc_msgSend(v18, "setSourceLayerRenderId:", a4);
      objc_msgSend(v18, "setKeyPath:", CFSTR("cornerRadius"));
      objc_msgSend(v18, "setDuration:", INFINITY);
      WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
      objc_msgSend(WeakRetained, "windowScene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addAnimation:forKey:", v7, CFSTR("matchMove"));

      objc_msgSend(v21, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addAnimation:forKey:", v18, CFSTR("matchCornerRadius"));

      objc_msgSend(v21, "setClipsToBounds:", 1);
    }
  }
}

- (void)_removeTextEffectsWindowMatchAnimations
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  objc_msgSend(WeakRetained, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("matchMove"));
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("matchCornerRadius"));
  objc_msgSend(v5, "setClipsToBounds:", 0);

}

- (void)__hostDidReceiveGestureDirection:(int64_t)a3 authenticationMessage:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  _UIProductivityGestureAction *v9;

  v6 = a4;
  v9 = -[_UIProductivityGestureAction initWithGestureDirection:authenticationMessage:]([_UIProductivityGestureAction alloc], "initWithGestureDirection:authenticationMessage:", a3, v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  objc_msgSend(WeakRetained, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIProductivityGestureAction _handleActionForWindowScene:](v9, "_handleActionForWindowScene:", v8);

}

- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3
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
  v7[2] = __84___UIViewServiceTextEffectsOperator___prepareForDisconnectionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E16B1BF8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "whenCompleteDo:", v7);

}

- (id)invalidate
{
  return -[_UIAsyncInvocation invoke](self->_invalidationInvocation, "invoke");
}

+ (id)XPCInterface
{
  if (qword_1ECD82198 != -1)
    dispatch_once(&qword_1ECD82198, &__block_literal_global_614);
  return (id)qword_1ECD821A0;
}

- (void)forceSyncToStatusBarOrientation
{
  _UIHostedWindow **p_hostedWindow;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[6];

  p_hostedWindow = &self->_hostedWindow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  objc_msgSend(WeakRetained, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardSceneDelegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)p_hostedWindow);
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation");

  objc_msgSend(v12, "containerWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_lastKnownInterfaceOrientation");

  if (v8 != v11)
  {
    -[_UIViewServiceTextEffectsOperator willRotateToInterfaceOrientation:duration:](self, "willRotateToInterfaceOrientation:duration:", v8, 0.0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68___UIViewServiceTextEffectsOperator_forceSyncToStatusBarOrientation__block_invoke;
    v13[3] = &unk_1E16E8E58;
    v13[4] = self;
    v13[5] = v8;
    -[_UIViewServiceTextEffectsOperator performOnRelevantWindows:](self, "performOnRelevantWindows:", v13);
    -[_UIViewServiceTextEffectsOperator rotateToInterfaceOrientation:duration:](self, "rotateToInterfaceOrientation:duration:", v8, 0.0);
    -[_UIViewServiceTextEffectsOperator finishRotationFromInterfaceOrientation:](self, "finishRotationFromInterfaceOrientation:", v11);
  }

}

- (void)setHostedWindow:(id)a3 disableAutomaticBehaviors:(BOOL)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  id v12;
  id location;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);

  if (WeakRetained != v6)
  {
    v8 = objc_loadWeakRetained((id *)&self->_hostedWindow);
    objc_msgSend(v8, "set_hostedWindowDelegate:", 0);

    v9 = objc_storeWeak((id *)&self->_hostedWindow, v6);
    objc_msgSend(v6, "set_hostedWindowDelegate:", self);

  }
  self->_localVCDisablesAutomaticBehaviors = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79___UIViewServiceTextEffectsOperator_setHostedWindow_disableAutomaticBehaviors___block_invoke;
  aBlock[3] = &unk_1E16B1500;
  objc_copyWeak(&v12, &location);
  aBlock[4] = self;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
    v10[2](v10);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)performOnRelevantWindows:(id)a3
{
  id WeakRetained;
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
  void (**v16)(id, void *);

  v16 = (void (**)(id, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  objc_msgSend(WeakRetained, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardSceneDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "containerWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, v7);

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboardWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, v9);

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteInputViewHost");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputViewWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v12);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteInputViewHost");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assistantViewWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v15);

  }
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79___UIViewServiceTextEffectsOperator_willRotateToInterfaceOrientation_duration___block_invoke;
  v4[3] = &__block_descriptor_48_e18_v16__0__UIWindow_8l;
  v4[4] = a3;
  *(double *)&v4[5] = a4;
  -[_UIViewServiceTextEffectsOperator performOnRelevantWindows:](self, "performOnRelevantWindows:", v4);
}

- (void)rotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75___UIViewServiceTextEffectsOperator_rotateToInterfaceOrientation_duration___block_invoke;
  v4[3] = &__block_descriptor_48_e18_v16__0__UIWindow_8l;
  v4[4] = a3;
  *(double *)&v4[5] = a4;
  -[_UIViewServiceTextEffectsOperator performOnRelevantWindows:](self, "performOnRelevantWindows:", v4);
}

- (void)finishRotationFromInterfaceOrientation:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76___UIViewServiceTextEffectsOperator_finishRotationFromInterfaceOrientation___block_invoke;
  v3[3] = &__block_descriptor_40_e18_v16__0__UIWindow_8l;
  v3[4] = a3;
  -[_UIViewServiceTextEffectsOperator performOnRelevantWindows:](self, "performOnRelevantWindows:", v3);
}

- (unint64_t)_providerType
{
  return 1;
}

- (NSUUID)_sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)_windowDidBecomeApplicationKey:(id)a3
{
  void *v4;
  id v5;
  id WeakRetained;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v7;
  else
    v4 = 0;
  v5 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);

  if (WeakRetained == v5)
    -[_UIViewServiceTextEffectsOperator _installActivityObserverGesturesInKeyboardWindowIfNeeded](self, "_installActivityObserverGesturesInKeyboardWindowIfNeeded");
  else
    -[_UIViewServiceTextEffectsOperator _uninstallActivityObserverGesturesFromKeyboardWindowIfNeeded](self, "_uninstallActivityObserverGesturesFromKeyboardWindowIfNeeded");

}

- (void)_installActivityObserverGestureIfNeeded
{
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _UITouchesBeganObserverGestureRecognizer *v9;
  _UITouchesBeganObserverGestureRecognizer *hostedTEWActivityObserverGesture;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewServiceTextEffectsOperator.m"), 659, CFSTR("Call must be made on main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  objc_msgSend(WeakRetained, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v14;
  if (v14)
  {
    v7 = objc_msgSend(v14, "_isHostedInAnotherProcess");
    v6 = v14;
    if (v7)
    {
      if (!self->_hostedTEWActivityObserverGesture)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), CFSTR("ViewService-HostedTEW-Observer"), v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (_UITouchesBeganObserverGestureRecognizer *)-[_UITouchesBeganObserverGestureRecognizer initWithTarget:action:name:]([_UITouchesBeganObserverGestureRecognizer alloc], (uint64_t)self, (uint64_t)sel__handleTEWActivityObserverGesture_, (uint64_t)v8);
        hostedTEWActivityObserverGesture = self->_hostedTEWActivityObserverGesture;
        self->_hostedTEWActivityObserverGesture = v9;

        v6 = v14;
      }
      objc_msgSend(v6, "gestureRecognizers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", self->_hostedTEWActivityObserverGesture);

      v6 = v14;
      if ((v12 & 1) == 0)
      {
        objc_msgSend(v14, "addGestureRecognizer:", self->_hostedTEWActivityObserverGesture);
        v6 = v14;
      }
    }
  }

}

- (void)_uninstallActivityObserverGestureIfNeeded
{
  _UITouchesBeganObserverGestureRecognizer *hostedTEWActivityObserverGesture;
  void *v5;
  id v6;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewServiceTextEffectsOperator.m"), 676, CFSTR("Call must be made on main thread"));

  }
  hostedTEWActivityObserverGesture = self->_hostedTEWActivityObserverGesture;
  if (hostedTEWActivityObserverGesture)
  {
    -[UIGestureRecognizer view](hostedTEWActivityObserverGesture, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", self->_hostedTEWActivityObserverGesture);

  }
}

- (void)_installActivityObserverGesturesInKeyboardWindowIfNeeded
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _UITouchesBeganObserverGestureRecognizer *v10;
  _UITouchesBeganObserverGestureRecognizer *hostedRemoteKeyboardWindowActivityObserverGesture;
  void *v12;
  char v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  _UIViewServiceTextEffectsOperator *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewServiceTextEffectsOperator.m"), 685, CFSTR("Call must be made on main thread"));

  }
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
    {
      v8 = objc_loadWeakRetained((id *)&self->_hostedWindow);
      if (v8)
      {

        if (WeakRetained == v4)
        {
          if (v7)
          {
            if (!self->_hostedRemoteKeyboardWindowActivityObserverGesture)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), CFSTR("ViewService-HostedRKW-Observer"), v7);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = (_UITouchesBeganObserverGestureRecognizer *)-[_UITouchesBeganObserverGestureRecognizer initWithTarget:action:name:]([_UITouchesBeganObserverGestureRecognizer alloc], (uint64_t)self, (uint64_t)sel__handleRemoteKeyboardActivityObserverGesture_, (uint64_t)v9);
              hostedRemoteKeyboardWindowActivityObserverGesture = self->_hostedRemoteKeyboardWindowActivityObserverGesture;
              self->_hostedRemoteKeyboardWindowActivityObserverGesture = v10;

            }
            objc_msgSend(v7, "gestureRecognizers");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "containsObject:", self->_hostedRemoteKeyboardWindowActivityObserverGesture);

            if ((v13 & 1) == 0)
            {
              objc_msgSend(v7, "addGestureRecognizer:", self->_hostedRemoteKeyboardWindowActivityObserverGesture);
              v14 = _installActivityObserverGesturesInKeyboardWindowIfNeeded___s_category;
              if (!_installActivityObserverGesturesInKeyboardWindowIfNeeded___s_category)
              {
                v14 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v14, (unint64_t *)&_installActivityObserverGesturesInKeyboardWindowIfNeeded___s_category);
              }
              v15 = *(NSObject **)(v14 + 8);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                v16 = (void *)MEMORY[0x1E0CB3940];
                v17 = self;
                v18 = v15;
                v19 = (objc_class *)objc_opt_class();
                NSStringFromClass(v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v22 = (void *)MEMORY[0x1E0CB3940];
                v23 = v7;
                v24 = v21;
                v25 = (objc_class *)objc_opt_class();
                NSStringFromClass(v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p>"), v26, v23);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                *(_DWORD *)buf = 138412546;
                v30 = v21;
                v31 = 2112;
                v32 = v27;
                _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "Installed activity observer gesture for operator: %@; on remote keyboards window: %@; ",
                  buf,
                  0x16u);

              }
            }
          }
        }
      }
    }
  }

}

- (void)_uninstallActivityObserverGesturesFromKeyboardWindowIfNeeded
{
  _UITouchesBeganObserverGestureRecognizer *hostedRemoteKeyboardWindowActivityObserverGesture;
  void *v5;
  void *v6;
  _UITouchesBeganObserverGestureRecognizer *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  _UIViewServiceTextEffectsOperator *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  __CFString *v20;
  _UIViewServiceSessionActivityRecord *sessionActivityRecord;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewServiceTextEffectsOperator.m"), 710, CFSTR("Call must be made on main thread"));

  }
  hostedRemoteKeyboardWindowActivityObserverGesture = self->_hostedRemoteKeyboardWindowActivityObserverGesture;
  if (hostedRemoteKeyboardWindowActivityObserverGesture)
  {
    -[UIGestureRecognizer view](hostedRemoteKeyboardWindowActivityObserverGesture, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "removeGestureRecognizer:", self->_hostedRemoteKeyboardWindowActivityObserverGesture);
    v7 = self->_hostedRemoteKeyboardWindowActivityObserverGesture;
    self->_hostedRemoteKeyboardWindowActivityObserverGesture = 0;

    v8 = _uninstallActivityObserverGesturesFromKeyboardWindowIfNeeded___s_category;
    if (!_uninstallActivityObserverGesturesFromKeyboardWindowIfNeeded___s_category)
    {
      v8 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_uninstallActivityObserverGesturesFromKeyboardWindowIfNeeded___s_category);
    }
    v9 = *(id *)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = self;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v14;
      v16 = v6;
      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v19, v16);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138412546;
      v24 = v15;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Uninstalled activity observer gesture for operator: %@; on remote keyboards window: %@; ",
        buf,
        0x16u);

    }
    sessionActivityRecord = self->_sessionActivityRecord;
    if (sessionActivityRecord && !sessionActivityRecord->_hasInvalidated)
    {
      if (v6)
        -[_UIViewServiceSessionActivityRecord removeActivityWindow:]((uint64_t)sessionActivityRecord, v6);
    }

  }
}

- (void)_handleTEWActivityObserverGesture:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  id *v8;
  _QWORD *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  objc_msgSend(WeakRetained, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v5);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9)
  {
    v7 = objc_msgSend(v9, "_isHostedInAnotherProcess");
    v6 = v9;
    if (v7)
    {
      if (self->_sessionActivityRecord)
      {
        +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker");
        v8 = (id *)objc_claimAutoreleasedReturnValue();
        -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v8, 4uLL, v9, self, (uint64_t)self->_sessionActivityRecord);

        v6 = v9;
      }
    }
  }

}

- (void)_handleRemoteKeyboardActivityObserverGesture:(id)a3
{
  void *v4;
  void *v5;
  id *v6;
  _QWORD *v7;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardWindow");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7 && self->_sessionActivityRecord)
  {
    +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v6, 4uLL, v7, self, (uint64_t)self->_sessionActivityRecord);

    v5 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedRemoteKeyboardWindowActivityObserverGesture, 0);
  objc_storeStrong((id *)&self->_hostedTEWActivityObserverGesture, 0);
  objc_storeStrong((id *)&self->_sessionActivityRecord, 0);
  objc_storeStrong((id *)&self->_allowedNotifications, 0);
  objc_destroyWeak((id *)&self->_hostedWindow);
  objc_storeStrong((id *)&self->_invalidationInvocation, 0);
  objc_storeStrong((id *)&self->_prepareForDisconnectionInvocation, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong(&self->_remoteViewControllerProxy, 0);
}

@end

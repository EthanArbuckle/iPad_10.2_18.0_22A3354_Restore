@implementation PGPictureInPictureProxy

+ (BOOL)isPictureInPictureSupported
{
  if (isPictureInPictureSupported_onceToken_0 != -1)
    dispatch_once(&isPictureInPictureSupported_onceToken_0, &__block_literal_global_13);
  return isPictureInPictureSupported_isPictureInPictureSupported_0;
}

uint64_t __54__PGPictureInPictureProxy_isPictureInPictureSupported__block_invoke()
{
  uint64_t result;

  result = PGIsPictureInPictureSupported();
  isPictureInPictureSupported_isPictureInPictureSupported_0 = result;
  return result;
}

+ (BOOL)isPictureInPictureActive
{
  return __activePictureInPictureProxyObjectCount > 0;
}

+ (void)_updatePictureInPictureActive:(BOOL)a3
{
  uint64_t v4;
  id v5;

  v4 = __activePictureInPictureProxyObjectCount;
  if (a3)
  {
    ++__activePictureInPictureProxyObjectCount;
    if (v4)
      return;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("PGPictureInPictureProxyPictureInPictureActiveChangedNotification"), a1);

    return;
  }
  if (!--__activePictureInPictureProxyObjectCount)
    goto LABEL_5;
}

+ (id)pictureInPictureProxyWithControlsStyle:(int64_t)a3 viewController:(id)a4
{
  id v5;
  PGPictureInPictureProxy *v6;

  v5 = a4;
  v6 = -[PGPictureInPictureProxy initWithControlsStyle:viewController:]([PGPictureInPictureProxy alloc], "initWithControlsStyle:viewController:", a3, v5);

  return v6;
}

- (PGPictureInPictureProxy)initWithControlsStyle:(int64_t)a3 viewController:(id)a4
{
  id v7;
  NSObject *v8;
  PGPictureInPictureProxy *v9;
  PGPictureInPictureProxy *v10;
  PGRunLoopObserver *v11;
  PGRunLoopObserver *runLoopObserver;
  id v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  PGPictureInPictureProxy *v26;
  void *v28;
  void *v29;
  objc_super v30;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _PGLogMethodProem(self, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 180, CFSTR("%@ needs valid viewController!"), v29);

  }
  if (objc_msgSend((id)objc_opt_class(), "isPictureInPictureSupported"))
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureRemoteObject dealloc].cold.1();

    v30.receiver = self;
    v30.super_class = (Class)PGPictureInPictureProxy;
    v9 = -[PGPictureInPictureProxy init](&v30, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_lock._os_unfair_lock_opaque = 0;
      v11 = objc_alloc_init(PGRunLoopObserver);
      runLoopObserver = v10->_runLoopObserver;
      v10->_runLoopObserver = v11;

      v10->_readyForDisplay = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pegasus.PGPictureInPictureProxy %p"), v10);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (const char *)objc_msgSend(v13, "UTF8String");
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = dispatch_queue_create(v14, v15);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v16;

      -[PGPictureInPictureProxy _establishConnection](v10, "_establishConnection");
      -[PGPictureInPictureProxy _resetInternalState](v10, "_resetInternalState");
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGPictureInPictureProxy _initializeWithControlsStyle:viewController:reason:](v10, "_initializeWithControlsStyle:viewController:reason:", a3, v7, v18);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel__handleSceneConnectionChangedNotification_, *MEMORY[0x1E0CEBB48], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", v10, sel__handleSceneConnectionChangedNotification_, *MEMORY[0x1E0CEBB60], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:selector:name:object:", v10, sel__updateInteractiveFrameWorkaroundFor_100127310_, *MEMORY[0x1E0CEBE18], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *MEMORY[0x1E0CEBB70];
      objc_msgSend(v22, "addObserver:selector:name:object:", v10, sel__updateInteractiveFrameWorkaroundFor_100127310_, *MEMORY[0x1E0CEBB70], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", v10, sel__updateInteractiveFrameWorkaroundFor_100127310_, v23, 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", v10, sel__updateInteractiveFrameWorkaroundFor_100127310_, CFSTR("UIWindowSceneDidEndLiveResizeNotification"), 0);

    }
    self = v10;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (PGPictureInPictureProxy)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  _PGLogMethodProem(self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is not a valid initializer. You must call -[%@ initWithControlsStyle:viewController:]."), v5, v7);

  return -[PGPictureInPictureProxy initWithControlsStyle:viewController:](self, "initWithControlsStyle:viewController:", 0, 0);
}

- (void)dealloc
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  _PGLogMethodProem(v0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v2, v3, "%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __34__PGPictureInPictureProxy_dealloc__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (void)_updateInteractiveFrameWorkaroundFor_100127310:(id)a3
{
  BSDispatchMain();
}

uint64_t __74__PGPictureInPictureProxy__updateInteractiveFrameWorkaroundFor_100127310___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController");
}

- (id)_remoteObject
{
  void *v3;
  void *v4;
  void *v5;

  -[PGPictureInPictureProxy _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _PGLogMethodProem(self, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PG_remoteObjectWithDebugMethodAndPointerProem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_remoteObjectWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PGLogMethodProem(self, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PG_remoteObjectWithDebugMethodAndPointerProem:errorHandler:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_connection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)__setConnection:(id)a3
{
  NSXPCConnection *v4;
  NSXPCConnection *lock_connection;
  NSXPCConnection *v6;
  NSXPCConnection *lock_connectionIfInterrupted;

  v4 = (NSXPCConnection *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_connection = self->_lock_connection;
  self->_lock_connection = v4;
  v6 = v4;

  lock_connectionIfInterrupted = self->_lock_connectionIfInterrupted;
  self->_lock_connectionIfInterrupted = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_markConnectionAsInterrupted
{
  NSXPCConnection *lock_connection;

  BSDispatchMain();
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_connectionIfInterrupted, self->_lock_connection);
  lock_connection = self->_lock_connection;
  self->_lock_connection = 0;

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __55__PGPictureInPictureProxy__markConnectionAsInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setRequestedWindowScene:", 0);
}

- (void)_restoreInterruptedConnectionIfNeeded
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *lock_connectionIfInterrupted;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_connection)
  {
    objc_storeStrong((id *)&self->_lock_connection, self->_lock_connectionIfInterrupted);
    lock_connectionIfInterrupted = self->_lock_connectionIfInterrupted;
    self->_lock_connectionIfInterrupted = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_initializeWithControlsStyle:(int64_t)a3 viewController:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGSize v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSString *v21;
  NSString *requestedSceneIdentifier;
  void *v23;
  void *v24;
  NSObject *queue;
  id v26;
  UIViewController *v27;
  UIViewController *rootViewController;
  PGHostedWindow *v29;
  void *v30;
  PGHostedWindow *v31;
  PGHostedWindow *hostedWindow;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  PGPictureInPictureProxy *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  PGLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v40 = v12;
    v41 = 2114;
    v42 = v10;
    _os_log_impl(&dword_1B0CD6000, v11, OS_LOG_TYPE_DEFAULT, "%@ %{public}@", buf, 0x16u);

  }
  BSDispatchQueueAssertMain();
  self->_automaticallyInterruptsForLegacyFaceTimeBehaviors = -[PGPictureInPictureProxy _isInCallService](self, "_isInCallService");
  self->_controlsStyle = a3;
  objc_storeStrong((id *)&self->_viewController, a4);
  objc_msgSend(v9, "preferredContentSize");
  v13 = MEMORY[0x1E0C9D628];
  self->_preferredContentSize.width = v14;
  self->_preferredContentSize.height = v15;
  v16 = *(CGSize *)(v13 + 16);
  self->_frameForInteractiveTransitions.origin = *(CGPoint *)v13;
  self->_frameForInteractiveTransitions.size = v16;
  *(_WORD *)&self->_isPictureInPicturePossible = 0;
  self->_isPictureInPictureSuspended = 0;
  self->_shouldPullCancellationPolicyOnStart = 0;
  *(_WORD *)&self->_pictureInPictureWasStartedWhenEnteringBackground = 256;
  objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    v19 = objc_msgSend(v17, "_isWindowServerHostingManaged") ^ 1;
  else
    v19 = 0;
  self->_isInViewService = v19;
  if (!self->_requestedSceneIdentifier
    && ((dyld_program_sdk_at_least() & 1) != 0 || _os_feature_enabled_impl())
    && !self->_isInViewService
    && (_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestedSceneIdentifier = self->_requestedSceneIdentifier;
    self->_requestedSceneIdentifier = v21;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__pipSceneComponentDidConnect_, CFSTR("PGPIPSceneComponentDidConnectNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", self, sel__pipSceneComponentDidDisconnect_, CFSTR("PGPIPSceneComponentDidDisconnectNotification"), 0);

  }
  queue = self->_queue;
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke;
  v36 = &unk_1E622F898;
  v37 = self;
  v26 = v10;
  v38 = v26;
  dispatch_async(queue, &v33);
  if (!self->_isObservingViewController && (objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_isObservingViewController = 1;
    -[PGPictureInPictureViewController addObserver:forKeyPath:options:context:](self->_viewController, "addObserver:forKeyPath:options:context:", self, CFSTR("shouldShowAlternateActionButtonImage"), 4, PGPictureInPictureProxyViewControllerShouldShowAlternateActionButtonImageObservationContext, v33, v34, v35, v36, v37);
  }
  v27 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0CEABB8]);
  rootViewController = self->_rootViewController;
  self->_rootViewController = v27;

  if (!self->_requestedSceneIdentifier)
  {
    v29 = [PGHostedWindow alloc];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v31 = -[PGHostedWindow initWithFrame:](v29, "initWithFrame:");
    hostedWindow = self->_hostedWindow;
    self->_hostedWindow = v31;

    -[PGHostedWindow setBackgroundColor:](self->_hostedWindow, "setBackgroundColor:", 0);
    -[PGHostedWindow setHidden:](self->_hostedWindow, "setHidden:", 0);
    -[PGHostedWindow setRootViewController:](self->_hostedWindow, "setRootViewController:", self->_rootViewController);
  }

}

void __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_restoreInterruptedConnectionIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 296);
  v6 = *(_QWORD *)(v4 + 272);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_2;
  v7[3] = &unk_1E6230B20;
  v7[4] = v4;
  v8 = v3;
  objc_msgSend(v2, "initializePictureInPictureWithControlsStyle:preferredContentSize:sceneIdentifier:affectsAppLifeCycle:completionHandler:", v5, v6, 0, v7, *(double *)(v4 + 8), *(double *)(v4 + 16));

}

void __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_3;
    v5[3] = &unk_1E6230AF8;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "checkActivePictureInPictureCancellationPolicyWithCompletion:", v5);

    v4 = *(id *)(a1 + 40);
    BSDispatchMain();

  }
}

uint64_t __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_3(uint64_t result, int a2, uint64_t a3, char a4, char a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(result + 32) + 106) = a4;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 107) = a5;
  }
  return result;
}

uint64_t __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackStateContentTypeIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackStateIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateIsInterruptedIfNeededForReason:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setClientSessionIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(*(id *)(a1 + 32), "setOverrideInterruptionExemptionIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  return objc_msgSend(*(id *)(a1 + 32), "_updateScreenSharingInfoIfNeeded");
}

- (void)_resetInternalState
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  PGHostedWindow *hostedWindow;
  NSString *sceneSessionPersistentIdentifierAccordingToRemoteObject;
  PGPlaybackState *playbackStateAccordingToRemoteObject;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  BSDispatchQueueAssertMain();
  self->_needsReinitialization = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CEB270];
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v6, v7);

  -[PGPictureInPictureProxy _stopObservingWindowSceneActivationState](self, "_stopObservingWindowSceneActivationState");
  if (self->_isObservingViewController)
  {
    self->_isObservingViewController = 0;
    -[PGPictureInPictureViewController removeObserver:forKeyPath:context:](self->_viewController, "removeObserver:forKeyPath:context:", self, CFSTR("shouldShowAlternateActionButtonImage"), PGPictureInPictureProxyViewControllerShouldShowAlternateActionButtonImageObservationContext);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIViewController childViewControllers](self->_rootViewController, "childViewControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "willMoveToParentViewController:", 0);
        objc_msgSend(v13, "viewIfLoaded");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeFromSuperview");

        objc_msgSend(v13, "removeFromParentViewController");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[PGHostedWindow setHidden:](self->_hostedWindow, "setHidden:", 1);
  hostedWindow = self->_hostedWindow;
  self->_hostedWindow = 0;

  self->_pictureInPictureWasStartedWhenEnteringBackground = 0;
  if (self->_isHostedWindowSizeChangeDuringPinchGesture)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PGPictureInPictureViewController viewDidResize](self->_viewController, "viewDidResize");
    self->_isHostedWindowSizeChangeDuringPinchGesture = 0;
  }
  sceneSessionPersistentIdentifierAccordingToRemoteObject = self->_sceneSessionPersistentIdentifierAccordingToRemoteObject;
  self->_sceneSessionPersistentIdentifierAccordingToRemoteObject = 0;

  playbackStateAccordingToRemoteObject = self->_playbackStateAccordingToRemoteObject;
  self->_playbackStateAccordingToRemoteObject = 0;

  -[PGPictureInPictureProxy _stopObservingWindowSceneActivationState](self, "_stopObservingWindowSceneActivationState");
  -[PGPictureInPictureProxy _setResourcesUsageReductionReasons:](self, "_setResourcesUsageReductionReasons:", 0);
  -[PGPictureInPictureProxy _setPictureInPicturePossible:](self, "_setPictureInPicturePossible:", 0);
  -[PGPictureInPictureProxy _setStashedOrUnderLock:reason:](self, "_setStashedOrUnderLock:reason:", 0, CFSTR("resetting internal state"));
  -[PGPictureInPictureProxy _setInterruptedForDefaultReason:initiatedByRemoteObject:](self, "_setInterruptedForDefaultReason:initiatedByRemoteObject:", 0, 0);
  -[PGPictureInPictureProxy _setActivationState:reason:](self, "_setActivationState:reason:", 0, CFSTR("_resetInternalState"));
}

- (PGPictureInPictureProxyDelegate)delegate
{
  return (PGPictureInPictureProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v6)
      *(_WORD *)&self->_delegateRespondsTo &= 0x8000u;
    v7 = objc_storeWeak((id *)&self->_delegate, obj);

    if (obj)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFE | objc_opt_respondsToSelector() & 1;

      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = 2;
      else
        v10 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFD | v10;

      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = 4;
      else
        v12 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFB | v12;

      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = 8;
      else
        v14 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFF7 | v14;

      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = 16;
      else
        v16 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFEF | v16;

      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = 32;
      else
        v18 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFDF | v18;

      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = 64;
      else
        v20 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFBF | v20;

      v21 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = 128;
      else
        v22 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFF7F | v22;

      v23 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = 256;
      else
        v24 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFEFF | v24;

      v25 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = 512;
      else
        v26 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFDFF | v26;

      v27 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = 1024;
      else
        v28 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFBFF | v28;

      v29 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = 2048;
      else
        v30 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xF7FF | v30;

      v31 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v32 = 4096;
      else
        v32 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xEFFF | v32;

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v33 = 0x2000;
      else
        v33 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xDFFF | v33;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v34 = 0x4000;
      else
        v34 = 0;
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xBFFF | v34;
    }
    -[PGPictureInPictureProxy _updatePlaybackStateContentTypeIfNeeded](self, "_updatePlaybackStateContentTypeIfNeeded");
    v5 = obj;
  }

}

- (BOOL)isPictureInPicturePossible
{
  NSObject *v3;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_isPictureInPicturePossible;
}

- (BOOL)isPictureInPictureActive
{
  NSObject *v3;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_isPictureInPictureActive;
}

- (BOOL)isPictureInPictureSuspended
{
  NSObject *v3;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_isPictureInPictureSuspended;
}

- (BOOL)isPictureInPictureInterrupted
{
  NSObject *v3;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_isInterruptedForAnyReason;
}

- (BOOL)pictureInPictureShouldStartWhenEnteringBackground
{
  NSObject *v3;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_pictureInPictureShouldStartWhenEnteringBackground;
}

- (void)setPictureInPictureShouldStartWhenEnteringBackground:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  PGPictureInPictureProxy *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (self->_pictureInPictureShouldStartWhenEnteringBackground != v3)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = "-[PGPictureInPictureProxy setPictureInPictureShouldStartWhenEnteringBackground:]";
      v9 = 2048;
      v10 = self;
      v11 = 1024;
      v12 = v3;
      _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v7, 0x1Cu);
    }

    self->_pictureInPictureShouldStartWhenEnteringBackground = v3;
    -[PGPictureInPictureProxy _updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded](self, "_updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded");
  }
}

- (BOOL)pictureInPictureWasStartedWhenEnteringBackground
{
  NSObject *v3;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_pictureInPictureWasStartedWhenEnteringBackground;
}

- (double)playbackProgress
{
  NSObject *v3;
  NSObject *v4;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_playbackProgress;
}

- (double)playbackRate
{
  NSObject *v3;
  NSObject *v4;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_playbackRate;
}

- (id)loadedTimeRanges
{
  NSObject *v3;
  NSObject *v4;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_loadedTimeRanges;
}

- (void)setLoadedTimeRanges:(id)a3
{
  NSArray *v4;
  NSObject *v5;
  NSObject *v6;
  NSArray *loadedTimeRanges;

  v4 = (NSArray *)a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  loadedTimeRanges = self->_loadedTimeRanges;
  self->_loadedTimeRanges = v4;

}

- (void)preferredContentSizeDidChangeForViewController
{
  NSObject *v3;
  NSObject *v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *queue;
  _QWORD block[7];
  _QWORD v15[2];
  CGSize preferredContentSize;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  PGPictureInPictureProxy *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGPictureInPictureViewController preferredContentSize](self->_viewController, "preferredContentSize");
  v7 = v6;
  v8 = v5;
  if (self->_preferredContentSize.width != v6 || self->_preferredContentSize.height != v5)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      preferredContentSize = self->_preferredContentSize;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &preferredContentSize, "{CGSize=dd}");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(CGFloat *)v15 = v7;
      *(CGFloat *)&v15[1] = v8;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v15, "{CGSize=dd}");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v18 = "-[PGPictureInPictureProxy preferredContentSizeDidChangeForViewController]";
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_1B0CD6000, v10, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", buf, 0x2Au);

    }
    self->_preferredContentSize.width = v7;
    self->_preferredContentSize.height = v8;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke;
    block[3] = &unk_1E6230008;
    block[4] = self;
    *(CGFloat *)&block[5] = v7;
    *(CGFloat *)&block[6] = v8;
    dispatch_async(queue, block);
  }
}

void __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke_2;
  v3[3] = &unk_1E6230B48;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "updatePreferredContentSize:withCompletionHandler:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

uint64_t __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke_2()
{
  return BSDispatchMain();
}

uint64_t __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startBackgroundPIPWhilePrewarmingIfNeeded");
}

- (void)viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController
{
  -[PGPictureInPictureProxy _viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:](self, "_viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:", CFSTR("Client Update"));
}

- (void)_viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:(id)a3
{
  PGPictureInPictureProxy *v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  NSObject *v14;
  CGSize size;
  void *v16;
  void *v17;
  NSObject *queue;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD block[9];
  _QWORD v35[4];
  _OWORD v36[2];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  PGPictureInPictureProxy *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;
  CGRect v46;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = (PGPictureInPictureProxy *)a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v6;
    v39 = 2114;
    v40 = v4;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%@ %{public}@", buf, 0x16u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v8 = *MEMORY[0x1E0C9D628];
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PGPictureInPictureProxy _expectedScene](self, "_expectedScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PGPictureInPictureProxy _expectedScene](self, "_expectedScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_pictureInPictureShouldStartWhenEnteringBackground && v13)
    {
      if (objc_msgSend(v13, "activationState"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[PGPictureInPictureProxy _addWindowSceneActivationStateObserverIfNeeded:](self, "_addWindowSceneActivationStateObserverIfNeeded:", v13);
      }
      else if (self->_sceneSessionPersistentIdentifier)
      {
        -[PGPictureInPictureProxy _viewFrameForTransitionAnimationAssumeApplicationActive:](self, "_viewFrameForTransitionAnimationAssumeApplicationActive:", 1);
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        objc_msgSend(v13, "coordinateSpace");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "screen");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "fixedCoordinateSpace");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "convertRect:fromCoordinateSpace:", v29, v20, v22, v24, v26);
        v8 = v30;
        v9 = v31;
        v10 = v32;
        v11 = v33;

      }
    }
  }
  else
  {

    v13 = 0;
  }
  v46.origin.x = v8;
  v46.origin.y = v9;
  v46.size.width = v10;
  v46.size.height = v11;
  if (!CGRectEqualToRect(self->_frameForInteractiveTransitions, v46))
  {
    PGLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      size = self->_frameForInteractiveTransitions.size;
      v36[0] = self->_frameForInteractiveTransitions.origin;
      v36[1] = size;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v36, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(CGFloat *)v35 = v8;
      *(CGFloat *)&v35[1] = v9;
      *(CGFloat *)&v35[2] = v10;
      *(CGFloat *)&v35[3] = v11;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v35, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v38 = "-[PGPictureInPictureProxy _viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewC"
            "ontrollerWithReason:]";
      v39 = 2048;
      v40 = self;
      v41 = 2114;
      v42 = v16;
      v43 = 2114;
      v44 = v17;
      _os_log_impl(&dword_1B0CD6000, v14, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", buf, 0x2Au);

    }
    self->_frameForInteractiveTransitions.origin.x = v8;
    self->_frameForInteractiveTransitions.origin.y = v9;
    self->_frameForInteractiveTransitions.size.width = v10;
    self->_frameForInteractiveTransitions.size.height = v11;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __129__PGPictureInPictureProxy__viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason___block_invoke;
    block[3] = &unk_1E6230B90;
    block[4] = self;
    *(CGFloat *)&block[5] = v8;
    *(CGFloat *)&block[6] = v9;
    *(CGFloat *)&block[7] = v10;
    *(CGFloat *)&block[8] = v11;
    dispatch_async(queue, block);
  }

}

void __129__PGPictureInPictureProxy__viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding:withCompletionHandler:", &__block_literal_global_87, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController
{
  -[PGPictureInPictureProxy _windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:](self, "_windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:", CFSTR("Client request"));
}

- (void)_windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:(id)a3
{
  PGPictureInPictureProxy *v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSString *sceneSessionPersistentIdentifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *sceneSessionPersistentIdentifierAccordingToRemoteObject;
  NSObject *queue;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  PGPictureInPictureProxy *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (PGPictureInPictureProxy *)a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%@ %{public}@", buf, 0x16u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGPictureInPictureProxy _bestKnownConnectedSceneSessionPersistentIdentifier](self, "_bestKnownConnectedSceneSessionPersistentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](self->_sceneSessionPersistentIdentifier, "isEqualToString:", v8)
    || (objc_msgSend(v8, "isEqualToString:", self->_sceneSessionPersistentIdentifierAccordingToRemoteObject) & 1) == 0)
  {
    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sceneSessionPersistentIdentifier = self->_sceneSessionPersistentIdentifier;
      *(_DWORD *)buf = 136315906;
      v19 = "-[PGPictureInPictureProxy _windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForVie"
            "wControllerWithReason:]";
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = sceneSessionPersistentIdentifier;
      v24 = 2114;
      v25 = v8;
      _os_log_impl(&dword_1B0CD6000, v9, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", buf, 0x2Au);
    }

    v11 = (NSString *)objc_msgSend(v8, "copy");
    v12 = self->_sceneSessionPersistentIdentifier;
    self->_sceneSessionPersistentIdentifier = v11;

    v13 = (NSString *)objc_msgSend(v8, "copy");
    sceneSessionPersistentIdentifierAccordingToRemoteObject = self->_sceneSessionPersistentIdentifierAccordingToRemoteObject;
    self->_sceneSessionPersistentIdentifierAccordingToRemoteObject = v13;

    -[PGPictureInPictureProxy _viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:](self, "_viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:", CFSTR("window scene change"));
    queue = self->_queue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __131__PGPictureInPictureProxy__windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason___block_invoke;
    v16[3] = &unk_1E622F898;
    v16[4] = self;
    v17 = v8;
    dispatch_async(queue, v16);

  }
}

void __131__PGPictureInPictureProxy__windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding:withCompletionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_92);

}

- (void)startPictureInPicture
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  PGPictureInPictureProxy *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[PGPictureInPictureProxy startPictureInPicture]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v5, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[PGPictureInPictureProxy _isInactive](self, "_isInactive"))
    -[PGPictureInPictureProxy _startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:](self, "_startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:", 1, 0, CFSTR("Client request"), 0);
}

- (void)stopPictureInPictureAndRestoreUserInterface:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  int64_t v7;
  NSObject *queue;
  _QWORD v9[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  PGPictureInPictureProxy *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PGPictureInPictureProxy stopPictureInPictureAndRestoreUserInterface:]";
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v7 = -[PGPictureInPictureProxy _activationState](self, "_activationState");
  switch(v7)
  {
    case 3:
      if (v3 && -[PGPictureInPictureProxy _isInCallService](self, "_isInCallService"))
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __71__PGPictureInPictureProxy_stopPictureInPictureAndRestoreUserInterface___block_invoke;
        block[3] = &unk_1E622F8C0;
        block[4] = self;
        dispatch_async(queue, block);
      }
      else
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __71__PGPictureInPictureProxy_stopPictureInPictureAndRestoreUserInterface___block_invoke_2;
        v9[3] = &unk_1E6230B48;
        v9[4] = self;
        -[PGPictureInPictureProxy _stopPictureInPictureAnimated:restoreUserInterface:withCompletionHandler:](self, "_stopPictureInPictureAnimated:restoreUserInterface:withCompletionHandler:", 1, v3, v9);
      }
      break;
    case 2:
      self->_shouldStopUponActivation = v3;
      self->_shouldCancelUponActivation = !v3;
      break;
    case 1:
      -[PGPictureInPictureProxy _cancelPrewarming](self, "_cancelPrewarming");
      break;
  }
}

void __71__PGPictureInPictureProxy_stopPictureInPictureAndRestoreUserInterface___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopPictureInPictureAndRestoreUserInterface");

}

uint64_t __71__PGPictureInPictureProxy_stopPictureInPictureAndRestoreUserInterface___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_invalidateConnectionForFailure");
  return result;
}

- (void)setPlaybackProgress:(double)a3 playbackRate:(double)a4
{
  NSObject *v7;

  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (self->_playbackProgress != a3 || self->_playbackRate != a4)
  {
    self->_playbackProgress = a3;
    self->_playbackRate = a4;
  }
}

- (void)rotateContentContainer:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  int64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  PGPictureInPictureProxy *v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[PGPictureInPictureProxy rotateContentContainer:withCompletionHandler:]";
    v15 = 2048;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %ld", buf, 0x20u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (self->_isPictureInPictureActive)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke;
    block[3] = &unk_1E622FFC0;
    block[4] = self;
    v11 = v6;
    v12 = a3;
    dispatch_async(queue, block);

  }
}

void __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E6230BD8;
  v3 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_remoteObjectWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E6230C00;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "rotateContentContainer:withCompletionHandler:", v5, v6);

}

void __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_5;
  v8[3] = &unk_1E6230148;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v6, "performAsync:", v8);

}

uint64_t __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)isCameraActive
{
  void *v2;
  char v3;

  -[PGPictureInPictureProxy playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCameraActive");

  return v3;
}

- (void)setCameraActive:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__PGPictureInPictureProxy_setCameraActive___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
  v4 = a3;
  -[PGPictureInPictureProxy _updateFaceTimePlaybackStateUsingBlock:](self, "_updateFaceTimePlaybackStateUsingBlock:", v3);
}

uint64_t __43__PGPictureInPictureProxy_setCameraActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCameraActive:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)canSwitchCamera
{
  void *v2;
  char v3;

  -[PGPictureInPictureProxy playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canSwitchCamera");

  return v3;
}

- (void)setCanSwitchCamera:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PGPictureInPictureProxy_setCanSwitchCamera___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
  v4 = a3;
  -[PGPictureInPictureProxy _updateFaceTimePlaybackStateUsingBlock:](self, "_updateFaceTimePlaybackStateUsingBlock:", v3);
}

uint64_t __46__PGPictureInPictureProxy_setCanSwitchCamera___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCanSwitchCamera:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)isMicrophoneMuted
{
  void *v2;
  char v3;

  -[PGPictureInPictureProxy playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMicrophoneMuted");

  return v3;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PGPictureInPictureProxy_setMicrophoneMuted___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
  v4 = a3;
  -[PGPictureInPictureProxy _updateFaceTimePlaybackStateUsingBlock:](self, "_updateFaceTimePlaybackStateUsingBlock:", v3);
}

uint64_t __46__PGPictureInPictureProxy_setMicrophoneMuted___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMicrophoneMuted:", *(unsigned __int8 *)(a1 + 32));
}

- (id)clientSessionIdentifier
{
  NSString *clientSessionIdentifier;
  NSString *v3;
  void *v4;

  clientSessionIdentifier = self->_clientSessionIdentifier;
  if (clientSessionIdentifier)
  {
    v3 = clientSessionIdentifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setClientSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSString *v7;
  NSString *clientSessionIdentifier;
  void *v9;
  NSString *clientSessionIdentifierAccordingToRemoteObject;
  NSString *v11;
  NSString *v12;
  NSObject *queue;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[PGPictureInPictureProxy clientSessionIdentifier](self, "clientSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    v6 = objc_msgSend(v4, "isEqualToString:", self->_clientSessionIdentifierAccordingToRemoteObject);

    if ((v6 & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  -[PGPictureInPictureProxy _cancelPrewarming](self, "_cancelPrewarming");
  v7 = (NSString *)objc_msgSend(v4, "copy");
  clientSessionIdentifier = self->_clientSessionIdentifier;
  self->_clientSessionIdentifier = v7;

  -[PGPictureInPictureProxy clientSessionIdentifier](self, "clientSessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_needsReinitialization)
  {
    clientSessionIdentifierAccordingToRemoteObject = self->_clientSessionIdentifierAccordingToRemoteObject;
    self->_clientSessionIdentifierAccordingToRemoteObject = 0;

    -[PGPictureInPictureProxy _resetInternalState](self, "_resetInternalState");
    -[PGPictureInPictureProxy _initializeWithControlsStyle:viewController:reason:](self, "_initializeWithControlsStyle:viewController:reason:", self->_controlsStyle, self->_viewController, CFSTR("Connection was nil and setClientSessionIdentifier called"));
  }
  else
  {
    -[PGPictureInPictureProxy clientSessionIdentifier](self, "clientSessionIdentifier");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = self->_clientSessionIdentifierAccordingToRemoteObject;
    self->_clientSessionIdentifierAccordingToRemoteObject = v11;

    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__PGPictureInPictureProxy_setClientSessionIdentifier___block_invoke;
    v14[3] = &unk_1E622F898;
    v14[4] = self;
    v15 = v9;
    dispatch_async(queue, v14);

  }
LABEL_9:

}

void __54__PGPictureInPictureProxy_setClientSessionIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivitySessionIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)setOverrideInterruptionExemptionIdentifier:(id)a3
{
  NSString *v4;
  NSString *overrideInterruptionExemptionIdentifier;
  NSObject *queue;
  _QWORD block[5];

  v4 = (NSString *)objc_msgSend(a3, "copy");
  overrideInterruptionExemptionIdentifier = self->_overrideInterruptionExemptionIdentifier;
  self->_overrideInterruptionExemptionIdentifier = v4;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PGPictureInPictureProxy_setOverrideInterruptionExemptionIdentifier___block_invoke;
  block[3] = &unk_1E622F8C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __70__PGPictureInPictureProxy_setOverrideInterruptionExemptionIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExemptAttributionOverride:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

}

- (BOOL)disablesLayerCloning
{
  void *v2;
  char v3;

  -[PGPictureInPictureProxy playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disablesLayerCloning");

  return v3;
}

- (void)setDisablesLayerCloning:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  PGPictureInPictureProxyMaySupportsScreenSharing = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PGPictureInPictureProxy_setDisablesLayerCloning___block_invoke;
  v4[3] = &__block_descriptor_33_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
  v5 = a3;
  -[PGPictureInPictureProxy _updateFaceTimePlaybackStateUsingBlock:](self, "_updateFaceTimePlaybackStateUsingBlock:", v4);
  -[PGPictureInPictureProxy _updatePlaybackStateContentTypeIfNeeded](self, "_updatePlaybackStateContentTypeIfNeeded");
}

uint64_t __51__PGPictureInPictureProxy_setDisablesLayerCloning___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisablesLayerCloning:", *(unsigned __int8 *)(a1 + 32));
}

- (id)menuItems
{
  if (self->_menuItems)
    return self->_menuItems;
  else
    return MEMORY[0x1E0C9AA60];
}

- (void)setMenuItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSArray *v8;
  NSArray *menuItems;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = v4;
  v7 = v6;

  if (!-[NSArray isEqualToArray:](self->_menuItems, "isEqualToArray:", v7))
  {
    v8 = (NSArray *)objc_msgSend(v7, "copy");
    menuItems = self->_menuItems;
    self->_menuItems = v8;

  }
}

- (void)_updateFaceTimePlaybackStateUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PGPictureInPictureProxy__updateFaceTimePlaybackStateUsingBlock___block_invoke;
  v6[3] = &unk_1E6230C48;
  v7 = v4;
  v5 = v4;
  -[PGPictureInPictureProxy updatePlaybackStateUsingBlock:](self, "updatePlaybackStateUsingBlock:", v6);

}

uint64_t __66__PGPictureInPictureProxy__updateFaceTimePlaybackStateUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setControlsStyle:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;

  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGPictureInPictureProxy setControlsStyle:animated:withCompletionHandler:](self, "setControlsStyle:animated:withCompletionHandler:", a3, 0, 0);
}

- (void)setControlsStyle:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  PGPictureInPictureProxy *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (self->_controlsStyle != a3)
  {
    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_controlsStyle);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315906;
      v13 = "-[PGPictureInPictureProxy setControlsStyle:animated:withCompletionHandler:]";
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1B0CD6000, v9, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", (uint8_t *)&v12, 0x2Au);

    }
    self->_controlsStyle = a3;
    -[PGPictureInPictureProxy _updatePlaybackStateContentTypeIfNeeded](self, "_updatePlaybackStateContentTypeIfNeeded");
  }
}

- (PGPlaybackState)playbackState
{
  PGPlaybackState *playbackState;
  PGPlaybackState *v4;
  PGPlaybackState *v5;

  playbackState = self->_playbackState;
  if (!playbackState)
  {
    v4 = -[PGPlaybackState initWithDictionary:]([PGPlaybackState alloc], "initWithDictionary:", 0);
    v5 = self->_playbackState;
    self->_playbackState = v4;

    playbackState = self->_playbackState;
  }
  return playbackState;
}

- (void)updatePlaybackStateUsingBlock:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  -[PGPictureInPictureProxy playbackState](self, "playbackState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

  -[PGPictureInPictureProxy _setMaybeNeedsUpdatePlaybackState](self, "_setMaybeNeedsUpdatePlaybackState");
}

- (void)pagingAccessorySetCurrentPage:(unint64_t)a3 numberOfPages:(unint64_t)a4
{
  id v6;

  -[PGPictureInPictureProxy _remoteObject](self, "_remoteObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pagingAccessorySetCurrentPage:numberOfPages:", a3, a4);

}

- (BOOL)automaticallyInterruptsForLegacyFaceTimeBehaviors
{
  return self->_automaticallyInterruptsForLegacyFaceTimeBehaviors;
}

- (void)setAutomaticallyInterruptsForLegacyFaceTimeBehaviors:(BOOL)a3
{
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 806, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("automaticallyInterruptsForLegacyFaceTimeBehaviors == NO"));

  }
  self->_automaticallyInterruptsForLegacyFaceTimeBehaviors = a3;
  -[PGPictureInPictureProxy _updateIsInterruptedIfNeededForReason:](self, "_updateIsInterruptedIfNeededForReason:", CFSTR("automaticallyInterruptsForLegacyFaceTimeBehaviors changed"));
}

- (void)_updatePlaybackStateContentTypeIfNeeded
{
  PGPictureInPictureProxyDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  char v13;
  _BOOL4 v14;
  uint64_t v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  char v28;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_msgSend(v6, "pictureInPictureProxyContentType:", self);

    -[PGPictureInPictureProxy playbackState](self, "playbackState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentType:", v7);

    if (v7 == 4)
    {
LABEL_3:
      v9 = objc_loadWeakRetained((id *)p_delegate);
      v10 = objc_opt_respondsToSelector();

      -[PGPictureInPictureProxy playbackState](self, "playbackState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSupportsFaceTimeActions:", v10 & 1);
LABEL_21:

    }
  }
  else
  {
    if (!-[PGPictureInPictureProxy _isInCallService](self, "_isInCallService")
      || PGPictureInPictureProxyMaySupportsScreenSharing != 1)
    {
      switch(-[PGPictureInPictureProxy controlsStyle](self, "controlsStyle"))
      {
        case 1:
          -[PGPictureInPictureProxy playbackState](self, "playbackState");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "contentType") == 1)
          {
            -[PGPictureInPictureProxy playbackState](self, "playbackState");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "contentType");

            if (v24 == 2)
              goto LABEL_22;
          }
          else
          {

          }
          -[PGPictureInPictureProxy playbackState](self, "playbackState");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v20;
          v21 = 1;
LABEL_20:
          objc_msgSend(v20, "setContentType:", v21);
          break;
        case 2:
          -[PGPictureInPictureProxy playbackState](self, "playbackState");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setContentType:", 4);

          goto LABEL_3;
        case 3:
          -[PGPictureInPictureProxy playbackState](self, "playbackState");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v20;
          v21 = 3;
          goto LABEL_20;
        case 4:
        case 5:
          v16 = objc_loadWeakRetained((id *)p_delegate);
          v17 = objc_opt_respondsToSelector();

          if ((v17 & 1) != 0)
          {
            -[PGPictureInPictureProxy playbackState](self, "playbackState");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setContentType:", 4);

          }
          -[PGPictureInPictureProxy playbackState](self, "playbackState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setSupportsFaceTimeActions:", v17 & 1);

          goto LABEL_22;
        default:
          goto LABEL_22;
      }
      goto LABEL_21;
    }
    v12 = objc_loadWeakRetained((id *)p_delegate);
    v13 = objc_opt_respondsToSelector();

    v14 = -[PGPictureInPictureProxy disablesLayerCloning](self, "disablesLayerCloning");
    v15 = 4;
    if (!v14)
      v15 = 5;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __66__PGPictureInPictureProxy__updatePlaybackStateContentTypeIfNeeded__block_invoke;
    v27[3] = &__block_descriptor_41_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
    v27[4] = v15;
    v28 = v13 & 1;
    -[PGPictureInPictureProxy _updateFaceTimePlaybackStateUsingBlock:](self, "_updateFaceTimePlaybackStateUsingBlock:", v27);
  }
LABEL_22:
  if (self->_controlsStyle == 3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PGPictureInPictureProxy playbackState](self, "playbackState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCameraHasMicrophone:", -[PGPictureInPictureViewController shouldShowAlternateActionButtonImage](self->_viewController, "shouldShowAlternateActionButtonImage"));

  }
  -[PGPictureInPictureProxy _setMaybeNeedsUpdatePlaybackState](self, "_setMaybeNeedsUpdatePlaybackState");
}

void __66__PGPictureInPictureProxy__updatePlaybackStateContentTypeIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setContentType:", v3);
  objc_msgSend(v4, "setSupportsFaceTimeActions:", *(unsigned __int8 *)(a1 + 40));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  objc_super v8;

  if ((void *)PGPictureInPictureProxyViewControllerShouldShowAlternateActionButtonImageObservationContext == a6)
  {
    -[PGPictureInPictureProxy playbackState](self, "playbackState", a3, a4, a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCameraHasMicrophone:", -[PGPictureInPictureViewController shouldShowAlternateActionButtonImage](self->_viewController, "shouldShowAlternateActionButtonImage"));

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PGPictureInPictureProxy;
    -[PGPictureInPictureProxy observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)_isInactive
{
  return -[PGPictureInPictureProxy _activationState](self, "_activationState") == 0;
}

- (int64_t)_activationState
{
  NSObject *v3;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_activationState;
}

- (void)_setActivationState:(int64_t)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 shouldStopUponActivation;
  BOOL shouldCancelUponActivation;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  PGPictureInPictureProxy *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[PGPictureInPictureProxy _activationState](self, "_activationState") != a3)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_activationState);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v15 = "-[PGPictureInPictureProxy _setActivationState:reason:]";
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ -> %{public}@ reason: %{public}@", buf, 0x34u);

    }
    self->_activationState = a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_setActivationState: %@"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureProxy _updateIsInterruptedIfNeededForReason:](self, "_updateIsInterruptedIfNeededForReason:", v11);

    shouldStopUponActivation = self->_shouldStopUponActivation;
    shouldCancelUponActivation = self->_shouldCancelUponActivation;
    *(_WORD *)&self->_shouldStopUponActivation = 0;
    if (a3 == 3 && (shouldCancelUponActivation || shouldStopUponActivation))
      -[PGPictureInPictureProxy _stopPictureInPictureAnimated:restoreUserInterface:withCompletionHandler:](self, "_stopPictureInPictureAnimated:restoreUserInterface:withCompletionHandler:", 1, shouldStopUponActivation, 0);
  }

}

- (void)_startPictureInPictureAnimated:(BOOL)a3 enteringBackground:(BOOL)a4 reason:(id)a5 withCompletionHandler:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  _QWORD v21[5];
  id v22;
  BOOL v23;
  _QWORD v24[5];
  id v25;
  SEL v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  PGPictureInPictureProxy *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v8 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  PGLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[PGPictureInPictureProxy _startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:]";
    v29 = 2048;
    v30 = self;
    v31 = 2114;
    v32 = v11;
    _os_log_impl(&dword_1B0CD6000, v13, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", buf, 0x20u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (!-[PGPictureInPictureProxy _activationState](self, "_activationState")
    || -[PGPictureInPictureProxy _activationState](self, "_activationState") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_startPictureInPictureAnimated: %@"), v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureProxy _setActivationState:reason:](self, "_setActivationState:reason:", 2, v15);
    self->_pictureInPictureWasStartedWhenEnteringBackground = a4;
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __106__PGPictureInPictureProxy__startPictureInPictureAnimated_enteringBackground_reason_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E6230C90;
    v24[4] = self;
    v26 = a2;
    v25 = v12;
    v17 = (void *)MEMORY[0x1B5E0FE80](v24);
    v18 = v17;
    if (self->_shouldPullCancellationPolicyOnStart)
    {
      v21[0] = v16;
      v21[1] = 3221225472;
      v21[2] = __106__PGPictureInPictureProxy__startPictureInPictureAnimated_enteringBackground_reason_withCompletionHandler___block_invoke_128;
      v21[3] = &unk_1E6230198;
      v21[4] = self;
      v23 = v8;
      v22 = v17;
      -[PGPictureInPictureProxy __updateCancellationPolicyWithSuccessHandler:failureHandler:](self, "__updateCancellationPolicyWithSuccessHandler:failureHandler:", v21, v22);

    }
    else
    {
      -[PGPictureInPictureProxy __coordinateStartAnimated:withCompletionHandler:](self, "__coordinateStartAnimated:withCompletionHandler:", v8, v17);
    }

    goto LABEL_17;
  }
  PGLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 0);
    v20 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v20;
    _os_log_impl(&dword_1B0CD6000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ failed because not inactive.", buf, 0xCu);

  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v15);
LABEL_17:

  }
}

void __106__PGPictureInPictureProxy__startPictureInPictureAnimated_enteringBackground_reason_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _WORD *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_activationState") != 2)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v14 = 136315394;
      v15 = "-[PGPictureInPictureProxy _startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:]_block_invoke";
      v16 = 2048;
      v17 = v11;
      _os_log_impl(&dword_1B0CD6000, v10, OS_LOG_TYPE_DEFAULT, "%s %p Not updating activation state because we are no longer activating and it's not our responsibility to maintain activation state.", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_12;
  }
  v4 = *(id **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4[38], "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 216);

    if (v5 == v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PGPictureInPictureProxy.m"), 926, CFSTR("We failed to start, but activation state remained activating and nobody cleaned up after the failure"));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 216);

    if (v7 == v8 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "willAnimatePictureInPictureStop");
    objc_msgSend(*(id *)(a1 + 32), "_removeViewControllerFromHostedWindowIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "_setActivationState:reason:", 0, CFSTR("_startPictureInPictureAnimated failed"));
    v9 = *(_WORD **)(a1 + 32);
    if ((v9[144] & 0x20) != 0)
    {
      objc_msgSend(v9, "delegate");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject pictureInPictureProxy:failedToStartPictureInPictureWithAnimationType:error:](v10, "pictureInPictureProxy:failedToStartPictureInPictureWithAnimationType:error:", *(_QWORD *)(a1 + 32), 0, v3);
LABEL_12:

    }
  }
  else
  {
    objc_msgSend(v4, "_setActivationState:reason:", 3, CFSTR("_startPictureInPictureAnimated succeeded"));
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, BOOL, id))(v12 + 16))(v12, v3 == 0, v3);

}

uint64_t __106__PGPictureInPictureProxy__startPictureInPictureAnimated_enteringBackground_reason_withCompletionHandler___block_invoke_128(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__coordinateStartAnimated:withCompletionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)__coordinateStartAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v4 = a3;
  v7 = a4;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureProxy __coordinateStartAnimated:withCompletionHandler:].cold.2();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 964, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  v10 = *MEMORY[0x1E0C9D628];
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v4
    && -[PGPictureInPictureProxy _isViewControllerWindowSceneConsideredActive](self, "_isViewControllerWindowSceneConsideredActive"))
  {
    -[PGPictureInPictureProxy _viewFrameForTransitionAnimationAssumeApplicationActive:](self, "_viewFrameForTransitionAnimationAssumeApplicationActive:", 1);
    v10 = v14;
    v11 = v15;
    v12 = v16;
    v13 = v17;
    if (self->_shouldCancelActivePictureInPictureOnStart)
    {
      if (CGRectIsNull(*(CGRect *)&v14))
        v18 = 2;
      else
        v18 = 1;
    }
    else
    {
      v18 = 3;
    }
  }
  else
  {
    v18 = 0;
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__PGPictureInPictureProxy___coordinateStartAnimated_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E622FFC0;
  v22 = v7;
  v23 = v18;
  v21[4] = self;
  v19 = v7;
  -[PGPictureInPictureProxy __setupStartWithAnimationType:initialLayerFrame:successHandler:failureHandler:](self, "__setupStartWithAnimationType:initialLayerFrame:successHandler:failureHandler:", v18, v21, v19, v10, v11, v12, v13);

}

void __75__PGPictureInPictureProxy___coordinateStartAnimated_withCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PGPictureInPictureProxy___coordinateStartAnimated_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E622FFC0;
  v2 = (void *)a1[5];
  v3 = a1[6];
  v5 = (id)a1[4];
  v7 = v3;
  v6 = v2;
  objc_msgSend(v5, "__actuallyStartWithAnimationType:successHandler:failureHandler:", v3, v4, a1[5]);

}

uint64_t __75__PGPictureInPictureProxy___coordinateStartAnimated_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__didStartWithAnimationType:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)__setupStartWithAnimationType:(int64_t)a3 initialLayerFrame:(CGRect)a4 successHandler:(id)a5 failureHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  int64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSString *sceneSessionPersistentIdentifier;
  void *v23;
  NSObject *queue;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  int64_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  int64_t v35;
  BOOL v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  PGPictureInPictureProxy *v40;
  __int16 v41;
  NSString *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v45 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  PGLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (v14 && v15)
  {
    if (a3)
    {
LABEL_10:
      v18 = -[PGPictureInPictureProxy _interfaceOrientationForTransitionAnimationAssumeApplicationActive:](self, "_interfaceOrientationForTransitionAnimationAssumeApplicationActive:", 1);
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 988, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("successHandler != nil && failureHandler != nil"));

    if (a3)
      goto LABEL_10;
  }
  v18 = 0;
LABEL_13:
  -[PGPictureInPictureProxy _bestKnownConnectedSceneSessionPersistentIdentifier](self, "_bestKnownConnectedSceneSessionPersistentIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](self->_sceneSessionPersistentIdentifier, "isEqualToString:", v20))
  {
    PGLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      sceneSessionPersistentIdentifier = self->_sceneSessionPersistentIdentifier;
      *(_DWORD *)buf = 136315906;
      v38 = "-[PGPictureInPictureProxy __setupStartWithAnimationType:initialLayerFrame:successHandler:failureHandler:]";
      v39 = 2048;
      v40 = self;
      v41 = 2114;
      v42 = sceneSessionPersistentIdentifier;
      v43 = 2114;
      v44 = v20;
      _os_log_impl(&dword_1B0CD6000, v21, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", buf, 0x2Au);
    }

    objc_storeStrong((id *)&self->_sceneSessionPersistentIdentifier, v20);
  }
  if ((*(_WORD *)&self->_delegateRespondsTo & 8) != 0)
  {
    -[PGPictureInPictureProxy delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pictureInPictureProxy:willStartPictureInPictureWithAnimationType:", self, a3);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke;
  block[3] = &unk_1E6230D08;
  block[4] = self;
  v28 = v15;
  v36 = a3 != 0;
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  v29 = v14;
  v30 = v18;
  v35 = a3;
  v25 = v14;
  v26 = v15;
  dispatch_async(queue, block);

}

void __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v2 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_2;
  v16[3] = &unk_1E6230BD8;
  v3 = *(void **)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_remoteObjectWithErrorHandler:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 104);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "hostedWindowHostingHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 56);
  v12[0] = v2;
  v12[1] = 3221225472;
  v12[2] = __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_4;
  v12[3] = &unk_1E6230CE0;
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v11 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v10;
  v15 = *(_QWORD *)(a1 + 96);
  v14 = v11;
  objc_msgSend(v4, "setupStartAnimated:hostedWindowHostingHandle:sceneSessionPersistentIdentifier:preferredContentSize:initialInterfaceOrientation:initialLayerFrame:completionHandler:", v5, v6, v8, v9, v12, *(double *)(v7 + 8), *(double *)(v7 + 16), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

}

void __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  BSDispatchMain();

}

uint64_t __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v5 = v4;
  BSDispatchMain();

}

uint64_t __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v3;
  void *v4;
  _WORD *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "Failed to setup start with error: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  v5 = *(_WORD **)(a1 + 40);
  if ((v5[144] & 0x20) != 0)
  {
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pictureInPictureProxy:failedToStartPictureInPictureWithAnimationType:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)__actuallyStartWithAnimationType:(int64_t)a3 successHandler:(id)a4 failureHandler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *queue;
  id v14;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  int64_t v20;
  BOOL v21;

  v9 = a4;
  v10 = a5;
  PGLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (!v9 || !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1027, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("successHandler != nil && failureHandler != nil"));

  }
  -[PGPictureInPictureProxy _addViewControllerToHostedWindowIfNeeded](self, "_addViewControllerToHostedWindowIfNeeded");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke;
  block[3] = &unk_1E6230D80;
  block[4] = self;
  v18 = v10;
  v21 = a3 != 0;
  v19 = v9;
  v20 = a3;
  v14 = v9;
  v15 = v10;
  dispatch_async(queue, block);

}

void __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_2;
  v12[3] = &unk_1E6230BD8;
  v3 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_remoteObjectWithErrorHandler:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 64);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_4;
  v8[3] = &unk_1E6230D58;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v11 = v7;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v4, "startPictureInPictureAnimated:completionHandler:", v5, v8);

}

void __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  BSDispatchMain();

}

uint64_t __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v5 = v4;
  BSDispatchMain();

}

uint64_t __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_5(uint64_t a1)
{
  _WORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "didAnimatePictureInPictureStart");
  if (*(_BYTE *)(a1 + 72))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = *(_WORD **)(a1 + 32);
  if ((v3[144] & 0x20) != 0)
  {
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1000, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pictureInPictureProxy:failedToStartPictureInPictureWithAnimationType:error:", v5, v6, v7);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)__didStartWithAnimationType:(int64_t)a3 completionHandler:(id)a4
{
  void (**v7)(id, _QWORD);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v7 = (void (**)(id, _QWORD))a4;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1059, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x10) != 0)
  {
    -[PGPictureInPictureProxy delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pictureInPictureProxy:didStartPictureInPictureWithAnimationType:", self, a3);

  }
  -[PGPictureInPictureProxy _setPictureInPictureActive:](self, "_setPictureInPictureActive:", 1);
  objc_msgSend((id)objc_opt_class(), "_updatePictureInPictureActive:", 1);
  v7[2](v7, 0);

}

- (void)__updateCancellationPolicyWithSuccessHandler:(id)a3 failureHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  if (!v7 || !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1077, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("successHandler != nil && failureHandler != nil"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke;
  block[3] = &unk_1E6230DF8;
  block[4] = self;
  v16 = v8;
  v17 = v7;
  v12 = v7;
  v13 = v8;
  dispatch_async(queue, block);

}

void __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_2;
  v8[3] = &unk_1E6230BD8;
  v3 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_remoteObjectWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_3;
  v5[3] = &unk_1E6230DD0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "checkActivePictureInPictureCancellationPolicyWithCompletion:", v5);

}

uint64_t __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v5 = v4;
  BSDispatchMain();

}

uint64_t __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 64))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 107) = *(_BYTE *)(a1 + 65);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 106) = *(_BYTE *)(a1 + 66);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;

  v7 = a3;
  v8 = a4;
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[PGPictureInPictureProxy _activationState](self, "_activationState") == 3)
  {
    -[PGPictureInPictureProxy _setActivationState:reason:](self, "_setActivationState:reason:", 4, CFSTR("starting two stage stop"));
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke;
    v22[3] = &unk_1E622FEA8;
    v22[4] = self;
    v23 = v8;
    v12 = (void *)MEMORY[0x1B5E0FE80](v22);
    if ((*(_WORD *)&self->_delegateRespondsTo & 0x2000) != 0)
    {
      -[PGPictureInPictureProxy delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pictureInPictureProxyWillSetupPictureInPictureStop:", self);

    }
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_140;
    v18[3] = &unk_1E6230E70;
    v18[4] = self;
    v21 = 0;
    v19 = v7;
    v20 = v12;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_4;
    v15[3] = &unk_1E6230C90;
    v16 = v20;
    v17 = a2;
    v15[4] = self;
    v14 = v20;
    -[PGPictureInPictureProxy __setupStopAnimated:needsApplicationActivation:waitForApplicationActivation:successHandler:failureHandler:](self, "__setupStopAnimated:needsApplicationActivation:waitForApplicationActivation:successHandler:failureHandler:", 1, 0, 1, v18, v15);

  }
}

void __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    if (v3)
    {
      PGLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "localizedDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v6;
        _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] Failed to finalize with error %{public}@.", (uint8_t *)&v7, 0xCu);

      }
      v4 = *(_QWORD *)(a1 + 40);
    }
    (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, v3 == 0, v3);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105) = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "_activationState") == 4)
    objc_msgSend(*(id *)(a1 + 32), "_setActivationState:reason:", 0, CFSTR("two stage stop finalize block"));

}

void __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_140(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6230E48;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v8 = v5;
  objc_msgSend(v3, "__restoreUserInterfaceAnimated:reason:completionHandler:", 1, v2, v6);

}

void __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_3;
  v9[3] = &unk_1E6230E20;
  v6 = a1[5];
  v8 = (void *)a1[6];
  v7 = a1[7];
  v9[4] = a1[4];
  v11 = v7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a2;
  v10 = v8;
  (*(void (**)(uint64_t, _QWORD *))(v6 + 16))(v6, v9);

}

uint64_t __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completionHandler:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[16];

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PGPictureInPictureProxy.m"), 1131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appActivationError"));

  }
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] Failed to __setupStopAnimated:::::", buf, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)_stopPictureInPictureAnimated:(BOOL)a3 restoreUserInterface:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _BOOL8 v20;
  BOOL v21;
  BOOL v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[PGPictureInPictureProxy _activationState](self, "_activationState") == 3)
  {
    -[PGPictureInPictureProxy _setActivationState:reason:](self, "_setActivationState:reason:", 4, CFSTR("_stopPictureInPictureAnimated"));
    if (v5)
    {
      v11 = 0;
    }
    else
    {
      -[PGHostedWindow snapshotViewAfterScreenUpdates:](self->_hostedWindow, "snapshotViewAfterScreenUpdates:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGHostedWindow bounds](self->_hostedWindow, "bounds");
      objc_msgSend(v11, "setFrame:");
      -[PGHostedWindow addSubview:](self->_hostedWindow, "addSubview:", v11);
    }
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke;
    v23[3] = &unk_1E6230E98;
    v24 = v11;
    v25 = v8;
    v23[4] = self;
    v13 = v11;
    v14 = (void *)MEMORY[0x1B5E0FE80](v23);
    v15 = v5 & ~-[PGPictureInPictureProxy _isViewControllerWindowSceneConsideredActive](self, "_isViewControllerWindowSceneConsideredActive");
    if ((*(_WORD *)&self->_delegateRespondsTo & 0x2000) != 0)
    {
      -[PGPictureInPictureProxy delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pictureInPictureProxyWillSetupPictureInPictureStop:", self);

    }
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke_2;
    v18[3] = &unk_1E6230EE8;
    v21 = v5;
    v22 = v6;
    v19 = v14;
    v20 = !v5;
    v18[4] = self;
    v17 = v14;
    -[PGPictureInPictureProxy __setupStopAnimated:needsApplicationActivation:successHandler:failureHandler:](self, "__setupStopAnimated:needsApplicationActivation:successHandler:failureHandler:", v6, v15, v18, v17);

  }
}

void __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  if (v4)
    (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, v3 == 0, v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105) = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "_activationState") == 4)
    objc_msgSend(*(id *)(a1 + 32), "_setActivationState:reason:", 0, CFSTR("_stopPictureInPictureAnimated finalize block"));
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");

}

void __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  int v2;
  uint64_t v3;
  _BOOL8 v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  char v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 57);
  v3 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = v2 != 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke_3;
    v5[3] = &unk_1E6230EC0;
    v8 = v2;
    v5[4] = v1;
    v7 = v3;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v1, "__restoreUserInterfaceAnimated:reason:completionHandler:", v4, v3, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__actuallyStopAnimated:reason:completionHandler:", v2 != 0, v3, *(_QWORD *)(a1 + 40));
  }
}

uint64_t __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completionHandler:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 40));
}

- (void)__setupStopAnimated:(BOOL)a3 needsApplicationActivation:(BOOL)a4 successHandler:(id)a5 failureHandler:(id)a6
{
  -[PGPictureInPictureProxy __setupStopAnimated:needsApplicationActivation:waitForApplicationActivation:successHandler:failureHandler:](self, "__setupStopAnimated:needsApplicationActivation:waitForApplicationActivation:successHandler:failureHandler:", a3, a4, a4, a5, a6);
}

- (void)__setupStopAnimated:(BOOL)a3 needsApplicationActivation:(BOOL)a4 waitForApplicationActivation:(BOOL)a5 successHandler:(id)a6 failureHandler:(id)a7
{
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *queue;
  id v18;
  id v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;

  v13 = a6;
  v14 = a7;
  PGLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  if (!v13 || !v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("successHandler != nil && failureHandler != nil"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke;
  block[3] = &unk_1E6230F60;
  block[4] = self;
  v22 = v14;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v23 = v13;
  v18 = v13;
  v19 = v14;
  dispatch_async(queue, block);

}

void __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;
  _QWORD v11[4];
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_2;
  v11[3] = &unk_1E6230BD8;
  v3 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_remoteObjectWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6 = *(unsigned __int8 *)(a1 + 57);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_4;
  v7[3] = &unk_1E6230F38;
  v10 = *(_BYTE *)(a1 + 58);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setupStopAnimated:needsApplicationActivation:completionHandler:", v5, v6, v7);

}

void __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  BSDispatchMain();

}

uint64_t __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v5 = v4;
  BSDispatchMain();

}

uint64_t __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_5(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 64))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 65))
    return objc_msgSend(*(id *)(a1 + 32), "__waitForApplicationActivationWithSuccessHandler:failureHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)__waitForApplicationActivationWithSuccessHandler:(id)a3 failureHandler:(id)a4
{
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void **v12;
  void *v13;
  float v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  id v18;
  _QWORD v19[5];

  v7 = (void (**)(_QWORD))a3;
  v8 = a4;
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  if (!v7 || !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("successHandler != nil && failureHandler != nil"));

  }
  if (-[PGPictureInPictureProxy _isViewControllerWindowSceneConsideredActive](self, "_isViewControllerWindowSceneConsideredActive"))
  {
    v7[2](v7);
  }
  else
  {
    -[PGPictureInPictureProxy _sourceScene](self, "_sourceScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void **)MEMORY[0x1E0CEBB40];
    if (!v11)
      v12 = (void **)MEMORY[0x1E0CEB270];
    v13 = *v12;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__PGPictureInPictureProxy___waitForApplicationActivationWithSuccessHandler_failureHandler___block_invoke;
    v19[3] = &unk_1E6230F88;
    v19[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91__PGPictureInPictureProxy___waitForApplicationActivationWithSuccessHandler_failureHandler___block_invoke_2;
    v16[3] = &unk_1E6230FB0;
    v17 = v7;
    v18 = v8;
    UIAnimationDragCoefficient();
    PGWaitForNotificationWithTimeout(MEMORY[0x1E0C80D38], v13, v11, v19, v16, v14 * 3.0);

  }
}

uint64_t __91__PGPictureInPictureProxy___waitForApplicationActivationWithSuccessHandler_failureHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isViewControllerWindowSceneConsideredActive");
}

void __91__PGPictureInPictureProxy___waitForApplicationActivationWithSuccessHandler_failureHandler___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "Timed out attempting to activate app on PIP stop", v6, 2u);
    }

    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1005, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)__restoreUserInterfaceAnimated:(BOOL)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  float v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  BOOL v15;
  _QWORD v16[5];

  v8 = a5;
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke;
    v16[3] = &unk_1E6230FD8;
    v16[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke_3;
    v12[3] = &unk_1E6231000;
    v15 = a3;
    v12[4] = self;
    v14 = a4;
    v13 = v8;
    UIAnimationDragCoefficient();
    PG_dispatch_async_with_timeout(MEMORY[0x1E0C80D38], v16, v12, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD, double, double, double, double))v8 + 2))(v8, 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }

}

void __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6230548;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "pictureInPictureProxy:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:", v5, v7);

}

uint64_t __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint8_t v14[16];

  if ((a2 & 1) == 0)
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "Timed out attempting to restore UI on PIP stop, attempt proceeding anyway", v14, 2u);
    }

  }
  if (*(_BYTE *)(a1 + 56)
    && (objc_msgSend(*(id *)(a1 + 32), "_interfaceOrientationForTransitionAnimationAssumeApplicationActive:", a2),
        *(_BYTE *)(a1 + 56)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_viewFrameForTransitionAnimationAssumeApplicationActive:", a2);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_isInCallService") && *(_QWORD *)(a1 + 48))
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v6, v8, v10, v12);
}

- (void)__actuallyStopAnimated:(BOOL)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  -[PGPictureInPictureProxy __actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completionHandler:](self, "__actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completionHandler:", a3, a4, 0, a5, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (void)__actuallyStopAnimated:(BOOL)a3 reason:(int64_t)a4 finalLayerFrame:(CGRect)a5 finalInterfaceOrientation:(int64_t)a6 completionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v13;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *queue;
  id v24;
  void *v25;
  _QWORD block[5];
  id v27;
  int64_t v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  BOOL v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  int64_t v37;
  uint8_t buf[4];
  const char *v39;
  uint64_t v40;
  CGRect v41;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v16 = a7;
  PGLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  objc_msgSend((id)objc_opt_class(), "_updatePictureInPictureActive:", 0);
  if (-[PGPictureInPictureProxy _activationState](self, "_activationState") == 4)
  {
    if (v13)
    {
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      if (CGRectIsNull(v41))
        v19 = 2;
      else
        v19 = 1;
    }
    else
    {
      v19 = 0;
    }
    -[PGPictureInPictureProxy _beginDeactivatingPictureInPictureWithAnimationType:stopReason:](self, "_beginDeactivatingPictureInPictureWithAnimationType:stopReason:", v19, a4);
    v21 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke;
    v34[3] = &unk_1E6231050;
    v34[4] = self;
    v36 = v19;
    v37 = a4;
    v35 = v16;
    v22 = (void *)MEMORY[0x1B5E0FE80](v34);
    queue = self->_queue;
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_151;
    block[3] = &unk_1E62302B0;
    block[4] = self;
    v27 = v22;
    v33 = v13;
    v28 = a6;
    v29 = x;
    v30 = y;
    v31 = width;
    v32 = height;
    v24 = v22;
    dispatch_async(queue, block);

  }
  else
  {
    PGLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[PGPictureInPictureProxy __actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completionHandler:]";
      _os_log_impl(&dword_1B0CD6000, v20, OS_LOG_TYPE_DEFAULT, "%s Skipping deactivation as we are no longer deactivating.", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
  }

}

void __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  BSDispatchMain();

}

uint64_t __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_activationState") == 4)
    return objc_msgSend(*(id *)(a1 + 32), "_endDeactivatingPictureInPictureIfNeededWithAnimationType:stopReason:cleanupHandlerOrNil:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[PGPictureInPictureProxy __actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completionHan"
         "dler:]_block_invoke_2";
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s Skipping deactivation as our state is not deactivating. Error had been: %{public}@", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_151(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 88);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_2_152;
  v5[3] = &unk_1E6230C00;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "stopPictureInPictureAnimated:withFinalInterfaceOrientation:finalLayerFrame:completionHandler:", v3, v4, v5, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

void __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_2_152(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v9 = a4;
  v10 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v9;
  BSDispatchMain();

}

void __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_4;
    v3[3] = &unk_1E6231078;
    v4 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v2, "performAsync:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)__cleanupWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;

  v5 = a3;
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6230148;
  block[4] = self;
  v12 = v5;
  v9 = v5;
  dispatch_async(queue, block);

}

void __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E6230BD8;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_remoteObjectWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E622F788;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "cleanupWithCompletionHandler:", v5);

}

void __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  BSDispatchMain();

}

uint64_t __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v5 = v4;
  BSDispatchMain();

}

uint64_t __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_beginDeactivatingPictureInPicture
{
  -[PGPictureInPictureProxy _beginDeactivatingPictureInPictureWithAnimationType:stopReason:](self, "_beginDeactivatingPictureInPictureWithAnimationType:stopReason:", 0, 1);
}

- (void)_beginDeactivatingPictureInPictureWithAnimationType:(int64_t)a3 stopReason:(int64_t)a4
{
  NSObject *v8;
  void *v9;
  void *v10;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureProxy _beginDeactivatingPictureInPictureWithAnimationType:stopReason:].cold.1();

  }
  if (-[PGPictureInPictureProxy _activationState](self, "_activationState") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1337, CFSTR("starting deactivating without being PGProxyActivationStateDeactivating"));

  }
  -[PGPictureInPictureProxy _setStashedOrUnderLock:reason:](self, "_setStashedOrUnderLock:reason:", 0, CFSTR("deactivation"));
  -[PGPictureInPictureProxy _setResourcesUsageReductionReasons:](self, "_setResourcesUsageReductionReasons:", 0);
  -[PGPictureInPictureProxy _setInterruptedForDefaultReason:initiatedByRemoteObject:](self, "_setInterruptedForDefaultReason:initiatedByRemoteObject:", 0, 0);
  -[PGPictureInPictureProxy _setPictureInPictureActive:](self, "_setPictureInPictureActive:", 0);
  -[PGPictureInPictureProxy _updateIsInterruptedIfNeededForReason:](self, "_updateIsInterruptedIfNeededForReason:", CFSTR("begin deactivation"));
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x80) != 0)
  {
    -[PGPictureInPictureProxy delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pictureInPictureProxy:willStopPictureInPictureWithAnimationType:reason:", self, a3, a4);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PGPictureInPictureViewController willAnimatePictureInPictureStop](self->_viewController, "willAnimatePictureInPictureStop");
}

- (void)_endDeactivatingPictureInPictureIfNeededWithAnimationType:(int64_t)a3 stopReason:(int64_t)a4
{
  -[PGPictureInPictureProxy _endDeactivatingPictureInPictureIfNeededWithAnimationType:stopReason:cleanupHandlerOrNil:](self, "_endDeactivatingPictureInPictureIfNeededWithAnimationType:stopReason:cleanupHandlerOrNil:", a3, a4, 0);
}

- (void)_endDeactivatingPictureInPictureIfNeededWithAnimationType:(int64_t)a3 stopReason:(int64_t)a4 cleanupHandlerOrNil:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  int64_t v18;

  v9 = a5;
  if (-[PGPictureInPictureProxy _activationState](self, "_activationState") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1360, CFSTR("ending deactivating without being PGProxyActivationStateDeactivating"));

  }
  -[PGPictureInPictureProxy _updateIsInterruptedIfNeededForReason:](self, "_updateIsInterruptedIfNeededForReason:", CFSTR("end deactivation"));
  -[PGPictureInPictureProxy _removeViewControllerFromHostedWindowIfNeeded](self, "_removeViewControllerFromHostedWindowIfNeeded");
  if (v9)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __116__PGPictureInPictureProxy__endDeactivatingPictureInPictureIfNeededWithAnimationType_stopReason_cleanupHandlerOrNil___block_invoke;
    v15[3] = &unk_1E6231050;
    v15[4] = self;
    v17 = a3;
    v18 = a4;
    v16 = v9;
    -[PGPictureInPictureProxy __cleanupWithCompletionHandler:](self, "__cleanupWithCompletionHandler:", v15);

  }
  else
  {
    if ((*(_WORD *)&self->_delegateRespondsTo & 0x100) != 0)
    {
      -[PGPictureInPictureProxy delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pictureInPictureProxy:didStopPictureInPictureWithAnimationType:reason:", self, a3, a4);

    }
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __116__PGPictureInPictureProxy__endDeactivatingPictureInPictureIfNeededWithAnimationType_stopReason_cleanupHandlerOrNil___block_invoke_2;
    v12[3] = &unk_1E62310A0;
    objc_copyWeak(&v13, &location);
    -[PGPictureInPictureProxy __cleanupWithCompletionHandler:](self, "__cleanupWithCompletionHandler:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __116__PGPictureInPictureProxy__endDeactivatingPictureInPictureIfNeededWithAnimationType_stopReason_cleanupHandlerOrNil___block_invoke(uint64_t a1, void *a2)
{
  _WORD *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(_WORD **)(a1 + 32);
  if ((v3[144] & 0x100) != 0)
  {
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pictureInPictureProxy:didStopPictureInPictureWithAnimationType:reason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded");

}

void __116__PGPictureInPictureProxy__endDeactivatingPictureInPictureIfNeededWithAnimationType_stopReason_cleanupHandlerOrNil___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded");

}

- (void)setReadyForDisplay:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  PGPictureInPictureProxy *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_readyForDisplay != a3)
  {
    v3 = a3;
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = "-[PGPictureInPictureProxy setReadyForDisplay:]";
      v8 = 2048;
      v9 = self;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p Ready for display: %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
    }

    self->_readyForDisplay = v3;
    -[PGPictureInPictureProxy _startBackgroundPIPWhilePrewarmingIfNeeded](self, "_startBackgroundPIPWhilePrewarmingIfNeeded");
  }
}

- (void)_prewarmAndStartAfterTimeout
{
  void *v3;
  NSTimer *v4;
  NSTimer *prewarmingTimeoutTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!-[PGPictureInPictureProxy _activationState](self, "_activationState")
    && !-[PGPictureInPictureProxy isReadyForDisplay](self, "isReadyForDisplay"))
  {
    -[PGPictureInPictureProxy _setActivationState:reason:](self, "_setActivationState:reason:", 1, CFSTR("_prewarmAndStartAfterTimeout"));
    -[PGPictureInPictureProxy _addViewControllerToHostedWindowIfNeeded](self, "_addViewControllerToHostedWindowIfNeeded");
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0C99E88];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__PGPictureInPictureProxy__prewarmAndStartAfterTimeout__block_invoke;
    v6[3] = &unk_1E622FD20;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 3.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    prewarmingTimeoutTimer = self->_prewarmingTimeoutTimer;
    self->_prewarmingTimeoutTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __55__PGPictureInPictureProxy__prewarmAndStartAfterTimeout__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v5, "isValid") && (id)WeakRetained[31] == v5)
  {
    if (objc_msgSend(WeakRetained, "_activationState") == 1)
      objc_msgSend(WeakRetained, "_startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:", 0, 0, CFSTR("Prewarming timeout fired"), 0);
    v4 = (void *)WeakRetained[31];
    WeakRetained[31] = 0;

  }
}

- (void)_cancelPrewarming
{
  NSTimer *prewarmingTimeoutTimer;
  NSTimer *v4;

  if (-[PGPictureInPictureProxy _activationState](self, "_activationState") == 1)
  {
    prewarmingTimeoutTimer = self->_prewarmingTimeoutTimer;
    self->_prewarmingTimeoutTimer = 0;
    v4 = prewarmingTimeoutTimer;

    -[NSTimer invalidate](v4, "invalidate");
    -[PGPictureInPictureProxy _removeViewControllerFromHostedWindowIfNeeded](self, "_removeViewControllerFromHostedWindowIfNeeded");
    -[PGPictureInPictureProxy _setActivationState:reason:](self, "_setActivationState:reason:", 0, CFSTR("_cancelPrewarming"));
  }
}

- (void)_startBackgroundPIPWhilePrewarmingIfNeeded
{
  NSTimer *prewarmingTimeoutTimer;
  NSTimer *v5;

  if (-[PGPictureInPictureProxy _activationState](self, "_activationState") == 1
    && -[PGPictureInPictureProxy isReadyForDisplay](self, "isReadyForDisplay")
    && (*MEMORY[0x1E0C9D820] != self->_preferredContentSize.width
     || *(double *)(MEMORY[0x1E0C9D820] + 8) != self->_preferredContentSize.height))
  {
    prewarmingTimeoutTimer = self->_prewarmingTimeoutTimer;
    self->_prewarmingTimeoutTimer = 0;
    v5 = prewarmingTimeoutTimer;

    -[NSTimer invalidate](v5, "invalidate");
    -[PGPictureInPictureProxy _startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:](self, "_startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:", 0, 0, CFSTR("became ready for display with a non-zero size while prewarming"), 0);
  }
}

- (void)_addViewControllerToHostedWindowIfNeeded
{
  UIViewController *v3;
  UIViewController *rootViewController;
  _QWORD v5[5];

  -[PGPictureInPictureViewController parentViewController](self->_viewController, "parentViewController");
  v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  rootViewController = self->_rootViewController;

  if (v3 != rootViewController)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PGPictureInPictureProxy__addViewControllerToHostedWindowIfNeeded__block_invoke;
    v5[3] = &unk_1E622F8C0;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v5);
  }
}

void __67__PGPictureInPictureProxy__addViewControllerToHostedWindowIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PG_setAllowsEdgeAntialiasing:", 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "didMoveToParentViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
    *(_DWORD *)buf = 138543618;
    v24 = v8;
    v25 = 2048;
    v26 = v9;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "PGHostedWindow root view controller *is* now containing: %{public}@[%p]", buf, 0x16u);

  }
  v10 = (void *)MEMORY[0x1E0CB3718];
  v21 = CFSTR("view");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[view]|"), 0, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v13);

  v14 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "view", CFSTR("view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[view]|"), 0, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v17);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "willAnimatePictureInPictureStart");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutIfNeeded");

}

- (void)_removeViewControllerFromHostedWindowIfNeeded
{
  UIViewController *v3;
  UIViewController *rootViewController;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  PGPictureInPictureViewController *viewController;
  int v10;
  void *v11;
  __int16 v12;
  PGPictureInPictureViewController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PGPictureInPictureViewController parentViewController](self->_viewController, "parentViewController");
  v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  rootViewController = self->_rootViewController;

  if (v3 == rootViewController)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PGPictureInPictureViewController didAnimatePictureInPictureStop](self->_viewController, "didAnimatePictureInPictureStop");
    -[PGPictureInPictureViewController willMoveToParentViewController:](self->_viewController, "willMoveToParentViewController:", 0);
    -[PGPictureInPictureViewController view](self->_viewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[PGPictureInPictureViewController removeFromParentViewController](self->_viewController, "removeFromParentViewController");
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      viewController = self->_viewController;
      v10 = 138543618;
      v11 = v8;
      v12 = 2048;
      v13 = viewController;
      _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "PGHostedWindow root view controller is *not* anymore containing: %{public}@[%p]", (uint8_t *)&v10, 0x16u);

    }
  }
}

- (int64_t)_interfaceOrientationForTransitionAnimationAssumeApplicationActive:(BOOL)a3
{
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __94__PGPictureInPictureProxy__interfaceOrientationForTransitionAnimationAssumeApplicationActive___block_invoke;
    v5[3] = &unk_1E62310C8;
    v5[4] = self;
    v5[5] = &v6;
    -[PGPictureInPictureProxy _executeDelegateCallbackBlock:assumeApplicationActive:](self, "_executeDelegateCallbackBlock:assumeApplicationActive:", v5, a3);
    v3 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __94__PGPictureInPictureProxy__interfaceOrientationForTransitionAnimationAssumeApplicationActive___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "pictureInPictureProxyInterfaceOrientationForTransitionAnimation:", *(_QWORD *)(a1 + 32));

}

- (CGRect)_viewFrameForTransitionAnimationAssumeApplicationActive:(BOOL)a3
{
  double *v3;
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[6];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  CGRect result;

  v3 = (double *)&v14;
  v14 = 0;
  v15 = (double *)&v14;
  v17 = &unk_1B0D1FC1A;
  v16 = 0x4010000000;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v18 = *MEMORY[0x1E0C9D628];
  v19 = v4;
  if ((*(_BYTE *)&self->_delegateRespondsTo & 2) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__PGPictureInPictureProxy__viewFrameForTransitionAnimationAssumeApplicationActive___block_invoke;
    v13[3] = &unk_1E6230910;
    v13[4] = self;
    v13[5] = &v14;
    -[PGPictureInPictureProxy _executeDelegateCallbackBlock:assumeApplicationActive:](self, "_executeDelegateCallbackBlock:assumeApplicationActive:", v13, a3);
    v3 = v15;
  }
  v5 = v3[4];
  v6 = v3[5];
  v7 = v3[6];
  v8 = v3[7];
  _Block_object_dispose(&v14, 8);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

void __83__PGPictureInPictureProxy__viewFrameForTransitionAnimationAssumeApplicationActive___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL IsNull;
  CGFloat *v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pictureInPictureProxyViewFrameForTransitionAnimation:", *(_QWORD *)(a1 + 32));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  if (!CGRectIsEmpty(v19))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fixedCoordinateSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v22.origin.x = v13;
    v22.origin.y = v14;
    v22.size.width = v15;
    v22.size.height = v16;
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    v21 = CGRectIntersection(v20, v22);
    IsNull = CGRectIsNull(v21);

    if (!IsNull)
    {
      v18 = *(CGFloat **)(*(_QWORD *)(a1 + 40) + 8);
      v18[4] = v4;
      v18[5] = v6;
      v18[6] = v8;
      v18[7] = v10;
    }
  }
}

- (id)_bestKnownConnectedSceneSessionPersistentIdentifier
{
  uint64_t v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  NSString *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v3 = MEMORY[0x1E0C809B0];
  if ((*(_BYTE *)&self->_delegateRespondsTo & 4) == 0)
    goto LABEL_4;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke;
  v18[3] = &unk_1E6230910;
  v18[4] = self;
  v18[5] = &v19;
  -[PGPictureInPictureProxy _executeDelegateCallbackBlock:assumeApplicationActive:](self, "_executeDelegateCallbackBlock:assumeApplicationActive:", v18, 1);
  v4 = (void *)v20[5];
  if (v4)
  {
    v5 = v4;
  }
  else
  {
LABEL_4:
    v5 = self->_sceneSessionPersistentIdentifier;
    if (!v5)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedScenes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke_2;
  v16[3] = &unk_1E62310F0;
  v8 = v5;
  v17 = v8;
  v9 = objc_msgSend(v7, "bs_containsObjectPassingTest:", v16);

  if ((v9 & 1) != 0)
  {
    v10 = v17;
LABEL_11:

    goto LABEL_12;
  }

LABEL_8:
  if (!-[PGPictureInPictureProxy _isInactive](self, "_isInactive"))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "connectedScenes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bs_firstObjectPassingTest:", &__block_literal_global_188);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistentIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v14, "copy");

    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:
  _Block_object_dispose(&v19, 8);

  return v8;
}

void __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pictureInPictureProxyViewControllerWindowForTransitionAnimation:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isViewControllerWindowSceneConsideredActive
{
  return -[PGPictureInPictureProxy _isInCallService](self, "_isInCallService")
      || self->_isInViewService
      || -[PGPictureInPictureProxy _isViewControllerWindowSceneActive](self, "_isViewControllerWindowSceneActive");
}

- (BOOL)_isViewControllerWindowSceneActive
{
  BOOL v3;
  void *v4;
  void *v5;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "applicationState"))
    return 0;
  -[PGPictureInPictureProxy _sourceScene](self, "_sourceScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 = objc_msgSend(v4, "activationState") == 0;
  else
    v3 = 1;

  return v3;
}

- (id)_sourceScene
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_sceneSessionPersistentIdentifier)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "connectedScenes", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v8, "session");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "persistentIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", self->_sceneSessionPersistentIdentifier);

          if (v11)
          {
            v12 = v8;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_12:

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)_executeDelegateCallbackBlock:(id)a3 assumeApplicationActive:(BOOL)a4
{
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  _BOOL4 v8;
  void (**v9)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = v6;
  if (v6)
  {
    v9 = v6;
    if (a4
      || (v8 = -[PGPictureInPictureProxy _isViewControllerWindowSceneConsideredActive](self, "_isViewControllerWindowSceneConsideredActive"), v7 = v9, v8))
    {
      v7[2](v7);
      v7 = v9;
    }
  }

}

- (id)_expectedScene
{
  void *v3;
  void *v4;
  void *v5;

  -[PGPictureInPictureProxy _sourceScene](self, "_sourceScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((*(_WORD *)&self->_delegateRespondsTo & 4) != 0)
    {
      -[PGPictureInPictureProxy delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pictureInPictureProxyViewControllerWindowForTransitionAnimation:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "windowScene");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)_updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded
{
  void *v4;
  id v5;

  -[PGPictureInPictureProxy _expectedScene](self, "_expectedScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v5, "activationState") && !self->_pictureInPictureStashedOrUnderLock)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PGPictureInPictureProxy _addWindowSceneActivationStateObserverIfNeeded:](self, "_addWindowSceneActivationStateObserverIfNeeded:", v5);
  }
  else
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureProxy _updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:](self, "_updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:", v4);

  }
}

- (void)_addWindowSceneActivationStateObserverIfNeeded:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id windowSceneActivationStateObserver;
  _QWORD v10[4];
  id v11[2];
  id location;

  v5 = a3;
  if (v5 && !self->_windowSceneActivationStateObserver)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CEBB40];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PGPictureInPictureProxy__addWindowSceneActivationStateObserverIfNeeded___block_invoke;
    v10[3] = &unk_1E6231158;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a2;
    objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, v5, 0, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    windowSceneActivationStateObserver = self->_windowSceneActivationStateObserver;
    self->_windowSceneActivationStateObserver = v8;

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }

}

void __74__PGPictureInPictureProxy__addWindowSceneActivationStateObserverIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:", v2);

}

- (void)_updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

  }
  -[PGPictureInPictureProxy _stopObservingWindowSceneActivationState](self, "_stopObservingWindowSceneActivationState");
  -[PGPictureInPictureProxy _viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:](self, "_viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:", v4);
  if (self->_pictureInPictureShouldStartWhenEnteringBackground && !self->_isPictureInPictureActive)
    -[PGPictureInPictureProxy _windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:](self, "_windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:", v4);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PGPictureInPictureProxy__updateAutoPIPSettingsAndNotifyRemoteObjectWithReason___block_invoke;
  block[3] = &unk_1E622F8C0;
  block[4] = self;
  dispatch_async(queue, block);

}

void __81__PGPictureInPictureProxy__updateAutoPIPSettingsAndNotifyRemoteObjectWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPictureInPictureShouldStartWhenEnteringBackground:completionHandler:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104), &__block_literal_global_190);

}

- (void)_stopObservingWindowSceneActivationState
{
  void *v3;
  id windowSceneActivationStateObserver;

  if (self->_windowSceneActivationStateObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_windowSceneActivationStateObserver);

    windowSceneActivationStateObserver = self->_windowSceneActivationStateObserver;
    self->_windowSceneActivationStateObserver = 0;

  }
}

- (void)_handleSceneConnectionChangedNotification:(id)a3
{
  void *v4;
  int v5;
  NSString *sceneSessionPersistentIdentifier;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  _QWORD v17[5];

  v16 = a3;
  objc_msgSend(v16, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEBB60]);

  sceneSessionPersistentIdentifier = self->_sceneSessionPersistentIdentifier;
  if (v5)
  {
    if (!sceneSessionPersistentIdentifier)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectedScenes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __69__PGPictureInPictureProxy__handleSceneConnectionChangedNotification___block_invoke;
    v17[3] = &unk_1E62310F0;
    v17[4] = self;
    v9 = objc_msgSend(v8, "bs_containsObjectPassingTest:", v17);

    if ((v9 & 1) == 0)
LABEL_4:
      -[PGPictureInPictureProxy _windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:](self, "_windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:", CFSTR("Scene Connection and _sceneSessionPersistentIdentifier is not connected"));
  }
  else if (sceneSessionPersistentIdentifier)
  {
    objc_msgSend(v16, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CEBB48]);

    if (v11)
    {
      objc_msgSend(v16, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "session");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "persistentIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", self->_sceneSessionPersistentIdentifier);

      if (v15)
        -[PGPictureInPictureProxy _windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:](self, "_windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:", CFSTR("Scene Disconnection"));

    }
  }

}

uint64_t __69__PGPictureInPictureProxy__handleSceneConnectionChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

  return v5;
}

- (BOOL)_canBeShownInMicroPIPMode
{
  void *v3;
  BOOL v4;

  -[PGPictureInPictureProxy playbackState](self, "playbackState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsMicroPIP"))
    v4 = -[PGPictureInPictureProxy _isInCallService](self, "_isInCallService");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isInCallService
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.InCallService"));

  return v4;
}

- (void)_establishConnection
{
  void *v4;
  void *v5;
  void *v6;
  _PGPictureInPictureConnectionExportedObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id from;
  id location;

  -[PGPictureInPictureProxy _connection](self, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 1661, CFSTR("Attempted to establish connection but %@ already had one"), self);

  }
  objc_initWeak(&location, self);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.pegasus"), 4096);
  objc_initWeak(&from, v5);
  objc_msgSend(v5, "_setQueue:", self->_queue);
  PGPictureInPictureExportedInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  v7 = -[_PGPictureInPictureConnectionExportedObject initWithPictureInPictureProxy:]([_PGPictureInPictureConnectionExportedObject alloc], "initWithPictureInPictureProxy:", self);
  objc_msgSend(v5, "setExportedObject:", v7);

  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__PGPictureInPictureProxy__establishConnection__block_invoke;
  v14[3] = &unk_1E62311A0;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  objc_msgSend(v5, "setInterruptionHandler:", v14);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __47__PGPictureInPictureProxy__establishConnection__block_invoke_2;
  v11[3] = &unk_1E62311A0;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  objc_msgSend(v5, "setInvalidationHandler:", v11);
  PGPictureInPictureRemoteObjectInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v9);

  -[PGPictureInPictureProxy __setConnection:](self, "__setConnection:", v5);
  objc_msgSend(v5, "resume");
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

void __47__PGPictureInPictureProxy__establishConnection__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_loadWeakRetained(v2);
      *(_DWORD *)buf = 136315394;
      v10 = "-[PGPictureInPictureProxy _establishConnection]_block_invoke";
      v11 = 2048;
      v12 = v5;
      _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s %p - Connection interrupted!", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "_connection");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)(a1 + 40));

    if (v6 == v7)
      objc_msgSend(WeakRetained, "_markConnectionAsInterrupted");
    v8 = WeakRetained;
    BSDispatchMain();

  }
}

void __47__PGPictureInPictureProxy__establishConnection__block_invoke_199(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 109) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_deactivateIfNeededForInterruptedOrInvalidatedConnection");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *MEMORY[0x1E0CEB270];
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__applicationDidBecomeActive, v5, v6);

}

void __47__PGPictureInPictureProxy__establishConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 136315394;
    v10 = "-[PGPictureInPictureProxy _establishConnection]_block_invoke_2";
    v11 = 2048;
    v12 = WeakRetained;
    _os_log_impl(&dword_1B0CD6000, v2, OS_LOG_TYPE_DEFAULT, "%s %p - Connection invalidated", buf, 0x16u);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_connection");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)(a1 + 40));

    if (v6 == v7)
    {
      v8 = v5;
      BSDispatchMain();

    }
  }

}

uint64_t __47__PGPictureInPictureProxy__establishConnection__block_invoke_202(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__setConnection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_resetInternalState");
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateIfNeededForInterruptedOrInvalidatedConnection");
}

- (void)_invalidateConnectionForFailure
{
  int64_t controlsStyle;
  PGPictureInPictureViewController *viewController;
  void *v6;
  id v7;

  BSDispatchQueueAssertMain();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy __setConnection:](self, "__setConnection:", 0);
  objc_msgSend(v7, "invalidate");
  -[PGPictureInPictureProxy _deactivateIfNeededForInterruptedOrInvalidatedConnection](self, "_deactivateIfNeededForInterruptedOrInvalidatedConnection");
  -[PGPictureInPictureProxy _establishConnection](self, "_establishConnection");
  -[PGPictureInPictureProxy _resetInternalState](self, "_resetInternalState");
  controlsStyle = self->_controlsStyle;
  viewController = self->_viewController;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _initializeWithControlsStyle:viewController:reason:](self, "_initializeWithControlsStyle:viewController:reason:", controlsStyle, viewController, v6);

}

- (void)_setMaybeNeedsUpdatePlaybackState
{
  PGRunLoopObserver *runLoopObserver;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  runLoopObserver = self->_runLoopObserver;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PGPictureInPictureProxy__setMaybeNeedsUpdatePlaybackState__block_invoke;
  v4[3] = &unk_1E6230520;
  objc_copyWeak(&v5, &location);
  -[PGRunLoopObserver setActions:](runLoopObserver, "setActions:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__PGPictureInPictureProxy__setMaybeNeedsUpdatePlaybackState__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePlaybackStateIfNeeded");

}

- (void)_updatePlaybackStateIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  PGPictureInPictureProxy *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_canSendPlaybackState
    && !-[PGPlaybackState isEquivalentToPlaybackState:](self->_playbackState, "isEquivalentToPlaybackState:", self->_playbackStateAccordingToRemoteObject))
  {
    -[PGPictureInPictureProxy _generatePlaybackStateDiffAndMarkAsSent](self, "_generatePlaybackStateDiffAndMarkAsSent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PGPictureInPictureProxy playbackState](self, "playbackState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v11 = "-[PGPictureInPictureProxy _updatePlaybackStateIfNeeded]";
      v12 = 2048;
      v13 = self;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s %p APP: %{public}@", buf, 0x20u);

    }
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__PGPictureInPictureProxy__updatePlaybackStateIfNeeded__block_invoke;
    v8[3] = &unk_1E622F898;
    v8[4] = self;
    v9 = v3;
    v7 = v3;
    dispatch_async(queue, v8);

  }
}

void __55__PGPictureInPictureProxy__updatePlaybackStateIfNeeded__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePlaybackStateWithDiff:", *(_QWORD *)(a1 + 40));

}

- (id)_generatePlaybackStateDiffAndMarkAsSent
{
  PGPlaybackState *playbackStateAccordingToRemoteObject;
  PGPlaybackState *v4;
  PGPlaybackState *v5;
  void *v6;
  PGPlaybackState *v7;
  PGPlaybackState *v8;

  playbackStateAccordingToRemoteObject = self->_playbackStateAccordingToRemoteObject;
  if (!playbackStateAccordingToRemoteObject)
  {
    v4 = -[PGPlaybackState initWithDictionary:]([PGPlaybackState alloc], "initWithDictionary:", 0);
    v5 = self->_playbackStateAccordingToRemoteObject;
    self->_playbackStateAccordingToRemoteObject = v4;

    playbackStateAccordingToRemoteObject = self->_playbackStateAccordingToRemoteObject;
  }
  -[PGPlaybackState diffFromPlaybackState:](playbackStateAccordingToRemoteObject, "diffFromPlaybackState:", self->_playbackState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (PGPlaybackState *)-[PGPlaybackState copy](self->_playbackState, "copy");
  v8 = self->_playbackStateAccordingToRemoteObject;
  self->_playbackStateAccordingToRemoteObject = v7;

  return v6;
}

- (void)_applicationDidBecomeActive
{
  if (self->_needsReinitialization)
  {
    -[PGPictureInPictureProxy _resetInternalState](self, "_resetInternalState");
    -[PGPictureInPictureProxy _initializeWithControlsStyle:viewController:reason:](self, "_initializeWithControlsStyle:viewController:reason:", self->_controlsStyle, self->_viewController, CFSTR("application did become active and no connection"));
  }
}

- (void)_deactivateIfNeededForInterruptedOrInvalidatedConnection
{
  int64_t v3;

  v3 = -[PGPictureInPictureProxy _activationState](self, "_activationState");
  if ((unint64_t)(v3 - 2) < 2)
  {
    -[PGPictureInPictureProxy _setActivationState:reason:](self, "_setActivationState:reason:", 4, CFSTR("deactivateIfNeededForInterruptedConnection"));
    -[PGPictureInPictureProxy _beginDeactivatingPictureInPicture](self, "_beginDeactivatingPictureInPicture");
    goto LABEL_6;
  }
  if (v3 == 4)
  {
LABEL_6:
    -[PGPictureInPictureProxy _endDeactivatingPictureInPictureIfNeededWithAnimationType:stopReason:](self, "_endDeactivatingPictureInPictureIfNeededWithAnimationType:stopReason:", 0, 1);
    -[PGPictureInPictureProxy _setActivationState:reason:](self, "_setActivationState:reason:", 0, CFSTR("deactivateIfNeededForInterruptedConnection"));
    return;
  }
  if (v3 == 1)
    -[PGPictureInPictureProxy _cancelPrewarming](self, "_cancelPrewarming");
}

- (void)_legacyPictureInPictureInterruptionBegan
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[PGPictureInPictureProxy _legacyPictureInPictureInterruptionBegan]";
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x200) != 0)
  {
    -[PGPictureInPictureProxy delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
    {
      -[PGPictureInPictureProxy delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pictureInPictureProxyPictureInPictureInterruptionBegan:", self);

    }
  }
}

- (void)_legacyPictureInPictureInterruptionEnded
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[PGPictureInPictureProxy _legacyPictureInPictureInterruptionEnded]";
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x400) != 0)
  {
    -[PGPictureInPictureProxy delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
    {
      -[PGPictureInPictureProxy delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pictureInPictureProxyPictureInPictureInterruptionEnded:", self);

    }
  }
}

- (void)_setPictureInPictureActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  PGPictureInPictureProxy *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_isPictureInPictureActive != a3)
  {
    v3 = a3;
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = "-[PGPictureInPictureProxy _setPictureInPictureActive:]";
      v8 = 2048;
      v9 = self;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
    }

    -[PGPictureInPictureProxy willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pictureInPictureActive"));
    self->_isPictureInPictureActive = v3;
    -[PGPictureInPictureProxy didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pictureInPictureActive"));
    -[PGPictureInPictureProxy _updateIsInterruptedIfNeededForReason:](self, "_updateIsInterruptedIfNeededForReason:", CFSTR("pip active"));
  }
}

- (void)_setPictureInPictureSuspended:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  PGPictureInPictureProxy *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_isPictureInPictureSuspended != a3)
  {
    v3 = a3;
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = "-[PGPictureInPictureProxy _setPictureInPictureSuspended:]";
      v8 = 2048;
      v9 = self;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
    }

    -[PGPictureInPictureProxy willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pictureInPictureSuspended"));
    self->_isPictureInPictureSuspended = v3;
    -[PGPictureInPictureProxy didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pictureInPictureSuspended"));
    -[PGPictureInPictureProxy _updateIsInterruptedIfNeededForReason:](self, "_updateIsInterruptedIfNeededForReason:", CFSTR("suspended changed"));
  }
}

- (void)_setPictureInPicturePossible:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  PGPictureInPictureProxy *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_isPictureInPicturePossible != a3)
  {
    v3 = a3;
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = "-[PGPictureInPictureProxy _setPictureInPicturePossible:]";
      v8 = 2048;
      v9 = self;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
    }

    -[PGPictureInPictureProxy willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pictureInPicturePossible"));
    self->_isPictureInPicturePossible = v3;
    -[PGPictureInPictureProxy didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pictureInPicturePossible"));
  }
}

- (void)_setStashedOrUnderLock:(BOOL)a3 reason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  BOOL v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _BYTE v16[14];
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureProxy _beginDeactivatingPictureInPictureWithAnimationType:stopReason:].cold.1();

  }
  if (self->_pictureInPictureStashedOrUnderLock != v4)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[PGPictureInPictureProxy _setStashedOrUnderLock:reason:]";
      v15 = 2048;
      *(_QWORD *)v16 = self;
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = v4;
      _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v13, 0x1Cu);
    }

    self->_pictureInPictureStashedOrUnderLock = v4;
    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _PGLogMethodProem(self, 1);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v10;
      v15 = 1024;
      *(_DWORD *)v16 = v4;
      *(_WORD *)&v16[4] = 2114;
      *(_QWORD *)&v16[6] = v6;
      _os_log_impl(&dword_1B0CD6000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Did update stashed or under lock state. stashedOrUnderLock{%{BOOL}u} reason: %{public}@", (uint8_t *)&v13, 0x1Cu);

    }
    v11 = self->_automaticallyInterruptsForLegacyFaceTimeBehaviors && v4;
    self->_isInterruptedForStash = v11;
    if ((*(_WORD *)&self->_delegateRespondsTo & 0x800) != 0)
    {
      -[PGPictureInPictureProxy delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pictureInPictureProxy:didUpdateStashedOrUnderLockState:", self, self->_pictureInPictureStashedOrUnderLock);

    }
    -[PGPictureInPictureProxy _updateIsInterruptedIfNeededForReason:](self, "_updateIsInterruptedIfNeededForReason:", CFSTR("stashed or underlock"));
    -[PGPictureInPictureProxy _updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:](self, "_updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:", CFSTR("stashed or underlock changed"));
  }

}

- (void)_setInterruptedForDefaultReason:(BOOL)a3 initiatedByRemoteObject:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  PGPictureInPictureProxy *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInterruptedForDefaultReason);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315906;
    v12 = "-[PGPictureInPictureProxy _setInterruptedForDefaultReason:initiatedByRemoteObject:]";
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", (uint8_t *)&v11, 0x2Au);

  }
  if (self->_isInterruptedForDefaultReason != v5)
  {
    self->_isInterruptedForDefaultReason = v5;
    if (v4)
      v10 = CFSTR("default reason initiated by remote");
    else
      v10 = CFSTR("default reason initiated locally");
    -[PGPictureInPictureProxy _updateIsInterruptedIfNeededForReason:initiatedByRemoteObject:](self, "_updateIsInterruptedIfNeededForReason:initiatedByRemoteObject:", v10, v4);
  }
}

- (void)_updateIsInterruptedIfNeededForReason:(id)a3
{
  -[PGPictureInPictureProxy _updateIsInterruptedIfNeededForReason:initiatedByRemoteObject:](self, "_updateIsInterruptedIfNeededForReason:initiatedByRemoteObject:", a3, 0);
}

- (void)_updateIsInterruptedIfNeededForReason:(id)a3 initiatedByRemoteObject:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int64_t v7;
  int64_t v8;
  _BOOL4 isInterruptedForDefaultReason;
  BOOL automaticallyInterruptsForLegacyFaceTimeBehaviors;
  NSObject *v11;
  void *v12;
  _BOOL4 isInterruptedForAnyReason;
  _BOOL4 v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  id v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PGPictureInPictureProxy _activationState](self, "_activationState");
  v8 = v7;
  isInterruptedForDefaultReason = v7 != 0;
  automaticallyInterruptsForLegacyFaceTimeBehaviors = self->_automaticallyInterruptsForLegacyFaceTimeBehaviors;
  if (automaticallyInterruptsForLegacyFaceTimeBehaviors)
  {
    if (self->_isPictureInPictureSuspended)
      goto LABEL_7;
    automaticallyInterruptsForLegacyFaceTimeBehaviors = self->_isInterruptedForStash;
  }
  if (!automaticallyInterruptsForLegacyFaceTimeBehaviors && v7)
    isInterruptedForDefaultReason = self->_isInterruptedForDefaultReason;
LABEL_7:
  PGLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isInterruptedForAnyReason = self->_isInterruptedForAnyReason;
    v14 = self->_isInterruptedForDefaultReason;
    v19 = 138544898;
    v20 = v12;
    v21 = 1024;
    v22 = isInterruptedForAnyReason;
    v23 = 1024;
    v24 = isInterruptedForDefaultReason;
    v25 = 2114;
    v26 = v6;
    v27 = 1024;
    v28 = v8 != 0;
    v29 = 1024;
    v30 = v14;
    v31 = 1024;
    v32 = v4;
    _os_log_impl(&dword_1B0CD6000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Did update _isInterruptedForAnyReason %{BOOL}u --> shouldBeInterruptedForAnyReason %{BOOL}u reason: %{public}@ canBeInterrupted %{BOOL}u _isInterruptedForDefaultReason %{BOOL}u initiatedByRemoteObject: %{BOOL}u", (uint8_t *)&v19, 0x34u);

  }
  if (self->_isInterruptedForAnyReason != isInterruptedForDefaultReason)
  {
    self->_isInterruptedForAnyReason = isInterruptedForDefaultReason;
    if (isInterruptedForDefaultReason)
    {
      -[PGPictureInPictureProxy _legacyPictureInPictureInterruptionBegan](self, "_legacyPictureInPictureInterruptionBegan");
    }
    else
    {
      -[PGPictureInPictureProxy _legacyPictureInPictureInterruptionEnded](self, "_legacyPictureInPictureInterruptionEnded");
      if (!v4)
      {
        -[PGPictureInPictureProxy delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          +[PGCommand commandForEndInterruptionWithShouldResumeSuggestion:](PGCommand, "commandForEndInterruptionWithShouldResumeSuggestion:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGPictureInPictureProxy delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pictureInPictureProxy:didReceivePlaybackCommand:", self, v17);

        }
      }
    }
  }

}

- (void)pictureInPictureStartRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  PGPictureInPictureProxy *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[PGPictureInPictureProxy pictureInPictureStartRequestedAnimated:withCompletionHandler:]";
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v11 = v5;
    BSDispatchMain();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v10);

  }
}

void __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E622FF98;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "_startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:", v1, 1, CFSTR("remote request"), v3);

}

void __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 200);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E622FF48;
  v11 = v6;
  v12 = a2;
  v8 = v5;
  v10 = v8;
  dispatch_async(v7, block);
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateConnectionForFailure");

}

uint64_t __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)pictureInPictureStopRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  PGPictureInPictureProxy *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[PGPictureInPictureProxy pictureInPictureStopRequestedAnimated:withCompletionHandler:]";
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v11 = v5;
    BSDispatchMain();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v10);

  }
}

void __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E622FF98;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "_stopPictureInPictureAnimated:restoreUserInterface:withCompletionHandler:", v1, 1, v3);

}

void __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  char v15;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 200);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E622FED0;
  v8 = v6;
  v15 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v9;
  v14 = v8;
  v10 = v5;
  dispatch_async(v7, v11);

}

void __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  _QWORD v2[5];
  char v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_4;
  v2[3] = &unk_1E622FC80;
  v3 = *(_BYTE *)(a1 + 56);
  v2[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_4(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_invalidateConnectionForFailure");
  return result;
}

- (void)beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  PGPictureInPictureProxy *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PGPictureInPictureProxy beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:]";
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    v10 = v4;
    BSDispatchMain();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

  }
}

void __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E62311C8;
  v3 = (void *)a1[5];
  v11 = (id)a1[4];
  v12 = v3;
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E62311F0;
  v4 = (void *)a1[5];
  v7[4] = a1[4];
  v5 = v4;
  v6 = a1[6];
  v8 = v5;
  v9 = v6;
  objc_msgSend(v11, "_twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock:completionHandler:", v10, v7);

}

void __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "set_pipStopUserInterfaceRestoreContinuationBlock:", v3);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 200);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E622FCF8;
  v8 = v4;
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) != 0, 0);
}

void __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  char v19;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 320))
  {
    v7 = (void *)MEMORY[0x1B5E0FE80]();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 320);
    *(_QWORD *)(v8 + 320) = 0;

    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 200);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_5;
    block[3] = &unk_1E622FF48;
    v18 = v7;
    v19 = a2;
    v17 = v5;
    v11 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    if ((a2 & 1) == 0)
    {
      v12 = *(NSObject **)(v6 + 200);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_6;
      v13[3] = &unk_1E6230120;
      v15 = *(id *)(a1 + 40);
      v14 = v5;
      dispatch_async(v12, v13);
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnectionForFailure");

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PGPictureInPictureProxy.m"), 1942, CFSTR("_twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock completed without error, but a __pipStopFinalStageCompletionHandler was not available"));
  }

LABEL_7:
}

uint64_t __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)endTwoStagePictureInPictureStopWithCompletionBlock:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  PGPictureInPictureProxy *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[PGPictureInPictureProxy endTwoStagePictureInPictureStopWithCompletionBlock:]";
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[PGPictureInPictureProxy set_pipStopFinalStageCompletionHandler:](self, "set_pipStopFinalStageCompletionHandler:", v4);
    v12 = MEMORY[0x1E0C809B0];
    v10 = __78__PGPictureInPictureProxy_endTwoStagePictureInPictureStopWithCompletionBlock___block_invoke_2;
    v11 = &v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

    v13 = MEMORY[0x1E0C809B0];
    v10 = __78__PGPictureInPictureProxy_endTwoStagePictureInPictureStopWithCompletionBlock___block_invoke;
    v11 = &v13;
  }
  v11[1] = 3221225472;
  v11[2] = (uint64_t)v10;
  v11[3] = (uint64_t)&unk_1E622F8C0;
  v11[4] = (uint64_t)self;
  BSDispatchMain();

}

uint64_t __78__PGPictureInPictureProxy_endTwoStagePictureInPictureStopWithCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateConnectionForFailure");
}

void __78__PGPictureInPictureProxy_endTwoStagePictureInPictureStopWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 312);
    *(_QWORD *)(v3 + 312) = 0;

  }
}

- (void)pictureInPictureCancelRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  PGPictureInPictureProxy *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[PGPictureInPictureProxy pictureInPictureCancelRequestedAnimated:withCompletionHandler:]";
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v11 = v5;
    BSDispatchMain();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v10);

  }
}

void __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E622FF98;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "_stopPictureInPictureAnimated:restoreUserInterface:withCompletionHandler:", v1, 0, v3);

}

void __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 200);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E622FF48;
  v11 = v6;
  v12 = a2;
  v8 = v5;
  v10 = v8;
  dispatch_async(v7, block);
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateConnectionForFailure");

}

uint64_t __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)updatePictureInPicturePossible:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  PGPictureInPictureProxy *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[PGPictureInPictureProxy updatePictureInPicturePossible:]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    BSDispatchMain();
}

uint64_t __58__PGPictureInPictureProxy_updatePictureInPicturePossible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPictureInPicturePossible:", *(unsigned __int8 *)(a1 + 40));
}

- (void)pictureInPictureInvalidated
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  PGPictureInPictureProxy *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[PGPictureInPictureProxy pictureInPictureInvalidated]";
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    BSDispatchMain();
}

uint64_t __54__PGPictureInPictureProxy_pictureInPictureInvalidated__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "_activationState") == 3
    || (result = objc_msgSend(*(id *)(a1 + 32), "_activationState"), result == 2))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setActivationState:reason:", 4, CFSTR("pictureInPictureInvalidated starting"));
    objc_msgSend((id)objc_opt_class(), "_updatePictureInPictureActive:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_beginDeactivatingPictureInPicture");
    objc_msgSend(*(id *)(a1 + 32), "_endDeactivatingPictureInPictureIfNeededWithAnimationType:stopReason:", 0, 1);
    return objc_msgSend(*(id *)(a1 + 32), "_setActivationState:reason:", 0, CFSTR("pictureInPictureInvalidated finished"));
  }
  return result;
}

- (void)updateHostedWindowSize:(CGSize)a3 animationType:(int64_t)a4 initialSpringVelocity:(double)a5 synchronizationFence:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  PGPictureInPictureProxy *v19;
  CGFloat v20;
  CGFloat v21;
  int64_t v22;
  double v23;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  PGLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v15)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke;
    v17[3] = &unk_1E6231240;
    v18 = v11;
    v19 = self;
    v20 = width;
    v21 = height;
    v22 = a4;
    v23 = a5;
    objc_msgSend(v16, "performAsync:", v17);

  }
}

void __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  _QWORD v8[5];
  char v9;
  _QWORD v10[5];
  char v11;
  _QWORD v12[5];
  __int128 v13;

  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(v2 + 256);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_2;
  v12[3] = &unk_1E6230008;
  v12[4] = v2;
  v13 = *(_OWORD *)(a1 + 48);
  v5 = (void *)MEMORY[0x1B5E0FE80](v12);
  v6 = *(_QWORD *)(a1 + 64);
  switch(v6)
  {
    case 2:
      if (!v3 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "viewWillResize");
      v7 = *(double *)(a1 + 72);
      v8[0] = v4;
      v8[1] = 3221225472;
      v8[2] = __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_4;
      v8[3] = &unk_1E6231218;
      v9 = v3;
      v8[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CEABB0], "PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity:animations:completion:", v5, v8, v7);
      break;
    case 1:
      if (!v3 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "viewWillResize");
      v10[0] = v4;
      v10[1] = 3221225472;
      v10[2] = __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_3;
      v10[3] = &unk_1E6231218;
      v11 = v3;
      v10[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CEABB0], "PG_animateUsingDefaultTimingWithAnimations:completion:", v5, v10);
      break;
    case 0:
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "PG_performWithoutAnimation:", v5);
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "viewWillResize");
        objc_msgSend(MEMORY[0x1E0CEABB0], "PG_performWithoutAnimation:", v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "viewDidResize");
      }
      break;
  }

}

uint64_t __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setFrame:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "layoutIfNeeded");
}

uint64_t __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 40))
  {
    v1 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 304), "viewDidResize");
  }
  return result;
}

uint64_t __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_4(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 40))
  {
    v1 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 304), "viewDidResize");
  }
  return result;
}

- (void)hostedWindowSizeChangeBegan
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    BSDispatchMain();
}

uint64_t __54__PGPictureInPictureProxy_hostedWindowSizeChangeBegan__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = 1;
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "viewWillResize");
  return result;
}

- (void)hostedWindowSizeChangeEnded
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    BSDispatchMain();
}

uint64_t __54__PGPictureInPictureProxy_hostedWindowSizeChangeEnded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "viewDidResize");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = 0;
  return result;
}

- (void)actionButtonTapped
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    BSDispatchMain();
}

uint64_t __45__PGPictureInPictureProxy_actionButtonTapped__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "actionButtonTapped");
  return result;
}

- (void)setStashedOrUnderLock:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    _PGLogMethodProem(self, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v9;
    v12 = 1024;
    v13 = v3;
    _os_log_debug_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ %{BOOL}u", buf, 0x12u);

  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    BSDispatchMain();
}

uint64_t __49__PGPictureInPictureProxy_setStashedOrUnderLock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStashedOrUnderLock:reason:", *(unsigned __int8 *)(a1 + 40), CFSTR("remote message"));
}

- (void)setResourcesUsageReductionReasons:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  PGPictureInPictureProxy *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[PGPictureInPictureProxy setResourcesUsageReductionReasons:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %@", (uint8_t *)&v10, 0x20u);

  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
    -[PGPictureInPictureProxy _setResourcesUsageReductionReasons:](self, "_setResourcesUsageReductionReasons:", a3);
}

- (void)_setResourcesUsageReductionReasons:(unint64_t)a3
{
  BSDispatchMain();
}

void __62__PGPictureInPictureProxy__setResourcesUsageReductionReasons___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v2 = (void **)(a1 + 32);
  v4 = *(_QWORD *)(v1 + 264);
  if (v3 == v4)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __62__PGPictureInPictureProxy__setResourcesUsageReductionReasons___block_invoke_cold_1(v2);
  }
  else
  {
    *(_QWORD *)(v1 + 264) = v3;
    if ((*((_WORD *)*v2 + 144) & 0x1000) == 0)
      return;
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315906;
      v11 = "-[PGPictureInPictureProxy _setResourcesUsageReductionReasons:]_block_invoke";
      v12 = 2114;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s Informing %{public}@ of didUpdateResourcesUsageReductionReasons:%@ oldReasons:%@", (uint8_t *)&v10, 0x2Au);

    }
    objc_msgSend(*v2, "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject pictureInPictureProxy:didUpdateResourcesUsageReductionReasons:oldReasons:](v5, "pictureInPictureProxy:didUpdateResourcesUsageReductionReasons:oldReasons:", *v2, v3, v4);
  }

}

- (void)handleCommand:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PGCommand *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  PGCommand *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  PGPictureInPictureProxy *v16;
  __int16 v17;
  PGCommand *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureProxy _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    v8 = -[PGCommand initWithDictionary:]([PGCommand alloc], "initWithDictionary:", v4);
    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _PGLogMethodProem(self, 1);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = (PGPictureInPictureProxy *)v8;
      _os_log_impl(&dword_1B0CD6000, v9, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);

    }
    PGLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "-[PGPictureInPictureProxy handleCommand:]";
      v15 = 2114;
      v16 = self;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1B0CD6000, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@", buf, 0x20u);
    }

    v12 = v8;
    BSDispatchMain();

  }
}

void __41__PGPictureInPictureProxy_handleCommand___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  int v22;
  unsigned __int8 *v23;
  int v24;
  BOOL v25;
  unsigned __int8 *v26;
  int v27;
  BOOL v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  id WeakRetained;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  int v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "systemAction") == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_notifyActionButtonTapped");
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "systemAction") == 7)
  {
    objc_msgSend(*(id *)(a1 + 40), "_invalidateConnectionForFailure");
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "systemAction") == 6)
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "_isInactive"))
      return;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 280));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = objc_msgSend(WeakRetained, "pictureInPictureProxySupportsPrewarming:", *(_QWORD *)(a1 + 40));
      if ((objc_msgSend(*(id *)(a1 + 40), "isReadyForDisplay") & 1) == 0 && v2)
      {
        objc_msgSend(*(id *)(a1 + 40), "_prewarmAndStartAfterTimeout");
LABEL_19:
        v11 = WeakRetained;
LABEL_39:

        return;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "isReadyForDisplay");
    }
    objc_msgSend(*(id *)(a1 + 40), "_startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:", 0, 0, CFSTR("PGSystemActionStartPIP"), 0);
    goto LABEL_19;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "faceTimeAction");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = objc_msgSend(v4, "associatedBoolValue");
    v6 = 5;
    switch(objc_msgSend(*(id *)(a1 + 32), "faceTimeAction"))
    {
      case 1:
        v7 = v5 == 0;
        v8 = 1;
        goto LABEL_23;
      case 2:
        v7 = v5 == 0;
        v8 = 3;
LABEL_23:
        if (v7)
          v6 = v8 + 1;
        else
          v6 = v8;
        goto LABEL_36;
      case 3:
        goto LABEL_36;
      case 4:
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v13 = *(id *)(*(_QWORD *)(a1 + 40) + 144);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        if (!v14)
          goto LABEL_71;
        v15 = v14;
        v16 = *(_QWORD *)v43;
        break;
      case 5:
        v6 = 6;
LABEL_36:
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_opt_respondsToSelector();

        if ((v21 & 1) == 0)
          return;
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v41 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "pictureInPictureProxy:didRequestFaceTimeAction:", *(_QWORD *)(a1 + 40), v6);
        goto LABEL_38;
      default:
        return;
    }
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "identifier");
        if (v19 == objc_msgSend(*(id *)(a1 + 32), "associatedIntegerValue"))
        {
          objc_msgSend(v18, "invokeAction");
          goto LABEL_71;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    if (objc_msgSend(v4, "testingAction"))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
        return;
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "pictureInPictureProxy:didReceiveTestingCommand:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
LABEL_38:
      v11 = v41;
      goto LABEL_39;
    }
    switch(objc_msgSend(*(id *)(a1 + 32), "playbackAction"))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 8:
        goto LABEL_21;
      case 5:
        v22 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 103);
        if (v22 == objc_msgSend(*(id *)(a1 + 32), "associatedBoolValue"))
          goto LABEL_63;
        objc_msgSend(*(id *)(a1 + 40), "_setPictureInPictureSuspended:", objc_msgSend(*(id *)(a1 + 32), "associatedBoolValue"));
        goto LABEL_21;
      case 6:
        v23 = *(unsigned __int8 **)(a1 + 40);
        v24 = v23[100];
        objc_msgSend(v23, "_setInterruptedForDefaultReason:initiatedByRemoteObject:", 1, 1);
        if (v24)
          v25 = 1;
        else
          v25 = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 100) == 0;
        v12 = !v25;
        goto LABEL_64;
      case 7:
        v26 = *(unsigned __int8 **)(a1 + 40);
        v27 = v26[100];
        objc_msgSend(v26, "_setInterruptedForDefaultReason:initiatedByRemoteObject:", 0, 1);
        if (v27)
          v28 = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 100) == 0;
        else
          v28 = 0;
        v12 = v28;
        goto LABEL_64;
      case 9:
        if (objc_msgSend(*(id *)(a1 + 40), "_activationState") != 3
          && objc_msgSend(*(id *)(a1 + 40), "_activationState") != 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("PGPictureInPictureProxy.m"), 2258, CFSTR("Received command to end or leave without at least being activated, which should never happen"));

        }
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "pictureInPictureProxyCanIssueOptionalCommand:", *(_QWORD *)(a1 + 32));

          if ((v31 & 1) != 0)
          {
LABEL_21:
            v12 = 1;
            goto LABEL_64;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)(a1 + 40), "stopPictureInPictureAndRestoreUserInterface:", 0);
LABEL_63:
        v12 = 0;
LABEL_64:
        v32 = objc_msgSend(*(id *)(a1 + 40), "_activationState");
        PGLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          _PGLogMethodProem(*(void **)(a1 + 40), 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          v47 = v34;
          v48 = 1024;
          v49 = v32 != 0;
          v50 = 2114;
          v51 = v35;
          v52 = 1024;
          v53 = v12;
          _os_log_impl(&dword_1B0CD6000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ isActiveOrStarting: %{BOOL}u handle command %{public}@ should notify: %{BOOL}u", buf, 0x22u);

        }
        v36 = v12 ^ 1;
        if (!v32)
          v36 = 1;
        if ((v36 & 1) != 0)
          return;
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_opt_respondsToSelector();

        if ((v38 & 1) == 0)
          return;
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pictureInPictureProxy:didReceivePlaybackCommand:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
        break;
      default:
        goto LABEL_63;
    }
  }
LABEL_71:

}

- (void)_notifyActionButtonTapped
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PGPictureInPictureViewController actionButtonTapped](self->_viewController, "actionButtonTapped");
}

- (void)skipForwardButtonTappedWithTimeInterval:(double)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PGPictureInPictureViewController skipForwardButtonTappedWithTimeInterval:](self->_viewController, "skipForwardButtonTappedWithTimeInterval:", a3);
}

- (void)_pipSceneComponentDidConnect:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", self->_requestedSceneIdentifier);

  if (v7)
  {
    objc_msgSend(v5, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureProxy _setRequestedWindowScene:](self, "_setRequestedWindowScene:", v8);

  }
}

- (void)_pipSceneComponentDidDisconnect:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(v5, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_requestedWindowScene);

  if (v6 == WeakRetained)
    -[PGPictureInPictureProxy _setRequestedWindowScene:](self, "_setRequestedWindowScene:", 0);

}

- (void)_setRequestedWindowScene:(id)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  UIWindow *v12;
  UIWindow *contentWindow;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_requestedWindowScene);

  v6 = obj;
  if (WeakRetained != obj)
  {
    if (obj)
    {
      v7 = objc_loadWeakRetained((id *)&self->_requestedWindowScene);

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureProxy.m"), 2328, CFSTR("We don't support changing scenes!"));

      }
    }
    objc_storeWeak((id *)&self->_requestedWindowScene, obj);
    -[UIWindow setHidden:](self->_contentWindow, "setHidden:", 1);
    v9 = objc_loadWeakRetained((id *)&self->_requestedWindowScene);

    v6 = obj;
    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0CEAC18]);
      v11 = objc_loadWeakRetained((id *)&self->_requestedWindowScene);
      v12 = (UIWindow *)objc_msgSend(v10, "initWithWindowScene:", v11);
      contentWindow = self->_contentWindow;
      self->_contentWindow = v12;

      -[UIWindow setBackgroundColor:](self->_contentWindow, "setBackgroundColor:", 0);
      -[UIWindow setRootViewController:](self->_contentWindow, "setRootViewController:", self->_rootViewController);
      -[UIWindow setHidden:](self->_contentWindow, "setHidden:", 0);
      v6 = obj;
    }
  }

}

- (void)pagingSkipByNumberOfPages:(int64_t)a3
{
  id v5;

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x4000) != 0)
  {
    -[PGPictureInPictureProxy delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pictureInPictureProxy:pagingSkipByNumberOfPages:", self, a3);

  }
}

- (int64_t)controlsStyle
{
  return self->_controlsStyle;
}

- (BOOL)isReadyForDisplay
{
  return self->_readyForDisplay;
}

- (PGPictureInPictureViewController)viewController
{
  return self->_viewController;
}

- (BOOL)isPictureInPictureStashedOrUnderLock
{
  return self->_pictureInPictureStashedOrUnderLock;
}

- (unint64_t)resourcesUsageReductionReasons
{
  return self->_resourcesUsageReductionReasons;
}

- (BOOL)isPictureInPictureStashed
{
  return self->_stashed;
}

- (void)setStashed:(BOOL)a3
{
  self->_stashed = a3;
}

- (id)_pipStopUserInterfaceRestoreContinuationBlock
{
  return self->__pipStopUserInterfaceRestoreContinuationBlock;
}

- (void)set_pipStopUserInterfaceRestoreContinuationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (id)_pipStopFinalStageCompletionHandler
{
  return self->__pipStopFinalStageCompletionHandler;
}

- (void)set_pipStopFinalStageCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__pipStopFinalStageCompletionHandler, 0);
  objc_storeStrong(&self->__pipStopUserInterfaceRestoreContinuationBlock, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestedSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_prewarmingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_contentWindow, 0);
  objc_destroyWeak((id *)&self->_requestedWindowScene);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_hostedWindow, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock_connectionIfInterrupted, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_runLoopObserver, 0);
  objc_storeStrong((id *)&self->_playbackStateAccordingToRemoteObject, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_loadedTimeRanges, 0);
  objc_storeStrong(&self->_windowSceneActivationStateObserver, 0);
  objc_storeStrong((id *)&self->_clientSessionIdentifierAccordingToRemoteObject, 0);
  objc_storeStrong((id *)&self->_sceneSessionPersistentIdentifierAccordingToRemoteObject, 0);
  objc_storeStrong((id *)&self->_overrideInterruptionExemptionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneSessionPersistentIdentifier, 0);
}

- (void)__coordinateStartAnimated:withCompletionHandler:.cold.2()
{
  void *v0;
  int v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  _PGLogMethodProem(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v3, v4, "%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)_beginDeactivatingPictureInPictureWithAnimationType:stopReason:.cold.1()
{
  void *v0;
  int v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  _PGLogMethodProem(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v3, v4, "%@ must be invoked on the main thread!", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __62__PGPictureInPictureProxy__setResourcesUsageReductionReasons___block_invoke_cold_1(void **a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  _PGLogMethodProem(*a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v2, v3, "%@ oldReasons cannot equal new ones.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end

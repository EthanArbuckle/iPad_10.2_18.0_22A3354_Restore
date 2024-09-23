@implementation _UIRemoteViewControllerConnectionRequest

+ (id)__requestRemoteViewController:(id)a3 service:(id)a4 fromServiceWithBundleIdentifier:(id)a5 serializedAppearanceCustomizations:(id)a6 traitCollection:(id)a7 exportedHostingObject:(id)a8 serviceViewControllerDeputyInterface:(id)a9 connectionHandler:(id)a10
{
  id v16;
  id v17;
  _UIRemoteViewControllerConnectionRequest *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSString *viewControllerClassName;
  void *v25;
  uint64_t v26;
  NSUUID *contextToken;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSString *viewServiceBundleIdentifier;
  uint64_t v36;
  NSString *v37;
  uint64_t v38;
  NSArray *serializedAppearanceCustomizations;
  _UIRemoteViewControllerConnectionInfo *v40;
  _UIRemoteViewControllerConnectionInfo *connectionInfo;
  id v42;
  dispatch_queue_t v43;
  OS_dispatch_queue *queue;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id handler;
  _UIRemoteViewControllerConnectionRequest *v49;
  uint64_t v50;
  _UIAsyncInvocation *requestCancellationInvocation;
  NSObject *v52;
  uint64_t (*v53)(uint64_t);
  uint64_t *v54;
  _UIRemoteViewControllerConnectionRequest *v55;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  NSString *aClassName;
  id v64;
  _QWORD v65[4];
  _UIRemoteViewControllerConnectionRequest *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[4];
  _UIRemoteViewControllerConnectionRequest *v70;
  _QWORD aBlock[4];
  id v72;
  _BYTE *v73;
  id v74;
  id location;
  _BYTE buf[24];
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  aClassName = (NSString *)a3;
  v64 = a4;
  v61 = a5;
  v60 = a6;
  v16 = a7;
  v59 = a8;
  v17 = a9;
  v62 = a10;
  if (!v62)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("connection handler can't be nil"));
  v18 = objc_alloc_init(_UIRemoteViewControllerConnectionRequest);
  v57 = v16;
  v58 = v17;
  if (v18)
  {
    v19 = __requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler____s_category;
    if (!__requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler____s_category)
    {
      v19 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&__requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler____s_category);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v64, "contextToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = aClassName;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2114;
      v77 = v61;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "Requesting remote view controller: %{public}@; contextToken: %{public}@; bundleId: %{public}@",
        buf,
        0x20u);

    }
    if (v64)
    {
      objc_storeStrong((id *)&v18->_service, a4);
      v18->_remoteViewControllerClass = NSClassFromString(aClassName);
      -[_UIRemoteViewService viewControllerClassName](v18->_service, "viewControllerClassName");
      v23 = objc_claimAutoreleasedReturnValue();
      viewControllerClassName = v18->_viewControllerClassName;
      v18->_viewControllerClassName = (NSString *)v23;

      -[_UIRemoteViewService contextToken](v18->_service, "contextToken");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      contextToken = v18->_contextToken;
      v18->_contextToken = (NSUUID *)v26;

      v28 = (void *)MEMORY[0x1E0CB3940];
      -[_UIRemoteViewService identifier](v18->_service, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("com.apple.uikit._UIRemoteViewControllerCreationRequest %@ %p"), v29, a1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v33 = objc_opt_class();
      v34 = objc_msgSend(v61, "copy");
      viewServiceBundleIdentifier = v18->_viewServiceBundleIdentifier;
      v18->_viewServiceBundleIdentifier = (NSString *)v34;

      v36 = -[NSString copy](aClassName, "copy");
      v37 = v18->_viewControllerClassName;
      v18->_viewControllerClassName = (NSString *)v36;

      v18->_remoteViewControllerClass = (Class)v33;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.uikit._UIRemoteViewControllerCreationRequest %@ %@ %p"), v61, aClassName, a1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = objc_msgSend(v60, "copy");
    serializedAppearanceCustomizations = v18->_serializedAppearanceCustomizations;
    v18->_serializedAppearanceCustomizations = (NSArray *)v38;

    objc_storeStrong((id *)&v18->_traits, a7);
    objc_storeStrong(&v18->_exportedHostingObject, a8);
    objc_storeStrong((id *)&v18->_serviceViewControllerDeputyInterface, a9);
    v40 = objc_alloc_init(_UIRemoteViewControllerConnectionInfo);
    connectionInfo = v18->_connectionInfo;
    v18->_connectionInfo = v40;

    v42 = objc_retainAutorelease(v30);
    v43 = dispatch_queue_create((const char *)objc_msgSend(v42, "UTF8String"), 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v43;

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v77) = 0;
    objc_initWeak(&location, v18);
    v45 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke;
    aBlock[3] = &unk_1E16E88D8;
    v73 = buf;
    v72 = v62;
    objc_copyWeak(&v74, &location);
    v46 = _Block_copy(aBlock);
    v47 = objc_msgSend(v46, "copy");
    handler = v18->_handler;
    v18->_handler = (id)v47;

    v69[0] = v45;
    v69[1] = 3221225472;
    v69[2] = __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_2;
    v69[3] = &unk_1E16C1710;
    v49 = v18;
    v70 = v49;
    +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v69);
    v50 = objc_claimAutoreleasedReturnValue();
    requestCancellationInvocation = v49->_requestCancellationInvocation;
    v49->_requestCancellationInvocation = (_UIAsyncInvocation *)v50;

    v52 = v18->_queue;
    if (v64)
    {
      v68 = v45;
      v53 = __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_3;
      v54 = &v68;
    }
    else
    {
      v67 = v45;
      v53 = __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_4;
      v54 = &v67;
    }
    v54[1] = 3221225472;
    v54[2] = (uint64_t)v53;
    v54[3] = (uint64_t)&unk_1E16B1B28;
    v55 = v49;
    v54[4] = (uint64_t)v55;
    dispatch_async(v52, v54);

    v65[0] = v45;
    v65[1] = 3221225472;
    v65[2] = __242___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_serializedAppearanceCustomizations_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_5;
    v65[3] = &unk_1E16C1710;
    v66 = v55;
    +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v65);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v74);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 786747, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v62 + 2))(v62, 0, v31);

    v32 = 0;
  }

  return v32;
}

+ (id)requestViewController:(id)a3 fromServiceWithBundleIdentifier:(id)a4 serializedAppearanceCustomizations:(id)a5 traitCollection:(id)a6 exportedHostingObject:(id)a7 serviceViewControllerDeputyInterface:(id)a8 connectionHandler:(id)a9
{
  return (id)objc_msgSend(a1, "__requestRemoteViewController:service:fromServiceWithBundleIdentifier:serializedAppearanceCustomizations:traitCollection:exportedHostingObject:serviceViewControllerDeputyInterface:connectionHandler:", a3, 0, a4, a5, a6, a7, a8, a9);
}

+ (id)requestViewControllerWithService:(id)a3 serializedAppearanceCustomizations:(id)a4 traitCollection:(id)a5 exportedHostingObject:(id)a6 remoteViewControllerClass:(Class)a7 serviceViewControllerDeputyInterface:(id)a8 connectionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;

  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  NSStringFromClass(a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__requestRemoteViewController:service:fromServiceWithBundleIdentifier:serializedAppearanceCustomizations:traitCollection:exportedHostingObject:serviceViewControllerDeputyInterface:connectionHandler:", v22, v21, 0, v20, v19, v18, v17, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSUUID *contextToken;
  objc_super v6;
  _QWORD v7[39];

  v7[38] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("UIWindowFirstResponderDidChangeNotification");
  v7[1] = CFSTR("UITextEffectsWindowViewControllerWillRotateNotification");
  v7[2] = CFSTR("UIApplicationDidChangeStatusBarOrientationNotification");
  v7[3] = CFSTR("UIApplicationStatusBarHeightChangedNotification");
  v7[4] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v7[5] = CFSTR("UISceneWillEnterForegroundNotification");
  v7[6] = 0x1E1784A60;
  v7[7] = 0x1E1784AA0;
  v7[8] = CFSTR("_UIPencilEventDidEvaluateBarrelFocusForSceneTransition");
  v7[9] = CFSTR("_UIViewServiceHostDidEvaluatePencilBarrelEventFocusForSceneTransition");
  v7[10] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v7[11] = CFSTR("UISceneDidEnterBackgroundNotification");
  v7[12] = 0x1E1784A40;
  v7[13] = 0x1E1784A80;
  v7[14] = CFSTR("_UIApplicationDidFinishSuspensionSnapshotNotification");
  v7[15] = 0x1E172F5C0;
  v7[16] = CFSTR("_UIScreenDisplayConfigurationUpdatedNotification");
  v7[17] = CFSTR("UIScreenReferenceDisplayModeStatusDidChangeNotification");
  v7[18] = *MEMORY[0x1E0DC5D30];
  v7[19] = CFSTR("_UIScreenDidConnectNotification");
  v7[20] = CFSTR("_UIScreenDidDisconnectNotification");
  v7[21] = CFSTR("UIScreenCapturedDidChangeNotification");
  v7[22] = _UIWindowDidAttachContextNotification;
  v7[23] = CFSTR("UIApplicationDidBecomeActiveNotification");
  v7[24] = CFSTR("UIApplicationWillResignActiveNotification");
  v7[25] = CFSTR("_UIApplicationWillAddDeactivationReasonNotification");
  v7[26] = CFSTR("_UISystemApplicationWillLockNotification");
  v7[27] = CFSTR("_UISystemApplicationDidUnlockNotification");
  v7[28] = CFSTR("_UIScreenUniqueIdDidChangeNotification");
  v7[29] = CFSTR("_UISceneWillChangeSettingsSceneNotification");
  v7[30] = CFSTR("_UIWindowWillBecomeApplicationKeyNotification");
  v7[31] = 0x1E1764CA0;
  v7[32] = 0x1E1764CC0;
  v7[33] = 0x1E1784B40;
  v7[34] = CFSTR("UIWindowDidBecomeKeyNotification");
  v7[35] = CFSTR("_UIWindowDidBecomeApplicationKeyNotification");
  v7[36] = CFSTR("UIWindowDidResignKeyNotification");
  v7[37] = CFSTR("_UIWindowDidResignApplicationKeyNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 38);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIWindowSceneEnhancedWindowingModeChanged"), 0);
  contextToken = self->_contextToken;
  self->_contextToken = 0;

  v6.receiver = self;
  v6.super_class = (Class)_UIRemoteViewControllerConnectionRequest;
  -[_UIRemoteViewControllerConnectionRequest dealloc](&v6, sel_dealloc);
}

- (void)_cancelUnconditionallyThen:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke;
  v7[3] = &unk_1E16B1D18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_connectToDeputyWithInterface:(id)a3 fromExportedHostingObject:(id)a4 successHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIRemoteViewControllerConnectionRequest *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _UIAsyncInvocation *cancelInvocationForCurrentOperation;
  _QWORD aBlock[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  _UIRemoteViewControllerConnectionRequest *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_isCancelledOrComplete)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__223;
    v21[4] = __Block_byref_object_dispose__223;
    v11 = self;
    v22 = v11;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __115___UIRemoteViewControllerConnectionRequest__connectToDeputyWithInterface_fromExportedHostingObject_successHandler___block_invoke;
    aBlock[3] = &unk_1E16E8900;
    v20 = v21;
    v12 = v8;
    v18 = v12;
    v19 = v10;
    v13 = _Block_copy(aBlock);
    -[_UIRemoteViewControllerConnectionInfo interface](v11->_connectionInfo, "interface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "connectToDeputyWithInterface:fromExportedHostingObject:connectionHandler:", v12, v9, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    cancelInvocationForCurrentOperation = v11->_cancelInvocationForCurrentOperation;
    v11->_cancelInvocationForCurrentOperation = (_UIAsyncInvocation *)v15;

    _Block_object_dispose(v21, 8);
  }

}

- (void)_connectToViewService
{
  _UIRemoteViewControllerConnectionRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIViewServiceDeputyXPCInterface *serviceViewControllerDeputyInterface;
  void *v9;
  _UIAsyncInvocation *v10;
  _UIAsyncInvocation *cancelInvocationForCurrentOperation;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _UIRemoteViewControllerConnectionRequest *v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  if (self->_cancelInvocationForCurrentOperation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRemoteViewController.m"), 1444, CFSTR("A connection is already in progress."));

  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__223;
  v15[4] = __Block_byref_object_dispose__223;
  v3 = self;
  v16 = v3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65___UIRemoteViewControllerConnectionRequest__connectToViewService__block_invoke;
  v14[3] = &unk_1E16E8928;
  v14[4] = v15;
  v4 = _Block_copy(v14);
  objc_msgSend((id)objc_opt_class(), "XPCInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend((id)objc_opt_class(), "XPCInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend((id)objc_opt_class(), "XPCInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  serviceViewControllerDeputyInterface = v3->_serviceViewControllerDeputyInterface;
  v17[2] = v7;
  v17[3] = serviceViewControllerDeputyInterface;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIViewServiceInterface connectToViewServiceWithBundleIdentifier:deputyInterfaces:connectionHandler:](_UIViewServiceInterface, "connectToViewServiceWithBundleIdentifier:deputyInterfaces:connectionHandler:", v3->_viewServiceBundleIdentifier, v9, v4);
  v10 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelInvocationForCurrentOperation = self->_cancelInvocationForCurrentOperation;
  self->_cancelInvocationForCurrentOperation = v10;

  _Block_object_dispose(v15, 8);
}

- (void)_connectToPlugInKitService
{
  _UIRemoteViewControllerConnectionRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIViewServiceDeputyXPCInterface *serviceViewControllerDeputyInterface;
  void *v9;
  _UIAsyncInvocation *v10;
  _UIAsyncInvocation *cancelInvocationForCurrentOperation;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _UIRemoteViewControllerConnectionRequest *v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  if (self->_cancelInvocationForCurrentOperation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRemoteViewController.m"), 1464, CFSTR("A connection is already in progress."));

  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__223;
  v15[4] = __Block_byref_object_dispose__223;
  v3 = self;
  v16 = v3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70___UIRemoteViewControllerConnectionRequest__connectToPlugInKitService__block_invoke;
  v14[3] = &unk_1E16E8928;
  v14[4] = v15;
  v4 = _Block_copy(v14);
  objc_msgSend((id)objc_opt_class(), "XPCInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend((id)objc_opt_class(), "XPCInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend((id)objc_opt_class(), "XPCInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  serviceViewControllerDeputyInterface = v3->_serviceViewControllerDeputyInterface;
  v17[2] = v7;
  v17[3] = serviceViewControllerDeputyInterface;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIViewServiceInterface connectToViewService:deputyInterfaces:connectionHandler:](_UIViewServiceInterface, "connectToViewService:deputyInterfaces:connectionHandler:", v3->_service, v9, v4);
  v10 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelInvocationForCurrentOperation = self->_cancelInvocationForCurrentOperation;
  self->_cancelInvocationForCurrentOperation = v10;

  _Block_object_dispose(v15, 8);
}

- (void)_connectToViewControllerOperator
{
  _UIRemoteViewControllerConnectionRequest *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _UIRemoteViewControllerConnectionRequest *v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__223;
  v6[4] = __Block_byref_object_dispose__223;
  v2 = self;
  v7 = v2;
  +[_UIViewServiceViewControllerOperator XPCInterface](_UIViewServiceViewControllerOperator, "XPCInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIRemoteViewControllerWeakWrapperProxy wrapperWithTarget:](_UIRemoteViewControllerWeakWrapperProxy, "wrapperWithTarget:", v2->_exportedHostingObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76___UIRemoteViewControllerConnectionRequest__connectToViewControllerOperator__block_invoke;
  v5[3] = &unk_1E16BE688;
  v5[4] = v6;
  -[_UIRemoteViewControllerConnectionRequest _connectToDeputyWithInterface:fromExportedHostingObject:successHandler:](v2, "_connectToDeputyWithInterface:fromExportedHostingObject:successHandler:", v3, v4, v5);

  _Block_object_dispose(v6, 8);
}

- (void)_sendServiceViewControllerRequest
{
  void *v4;
  ipc_space_t v5;
  mach_port_name_t v6;
  id v7;
  void *v8;
  int64_t v9;
  UITraitCollection *traits;
  UITraitCollection *v11;
  void *v12;
  _UIViewServiceViewControllerOperatorCreateOptions *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  NSString *v22;
  NSString *viewServiceBundleIdentifier;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_isCancelledOrComplete)
  {
    -[_UIRemoteViewControllerConnectionInfo hostedWindowHostingHandle](self->_connectionInfo, "hostedWindowHostingHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRemoteViewController.m"), 1496, CFSTR("Already got the hosted window context ID"));

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = *MEMORY[0x1E0C83DA0];
      v6 = objc_msgSend((id)UIApp, "_accessibilityMachPort");
      mach_port_insert_right(v5, v6, objc_msgSend((id)UIApp, "_accessibilityMachPort"), 0x14u);
      v7 = objc_alloc(MEMORY[0x1E0D017A0]);
      v8 = (void *)objc_msgSend(v7, "initWithPort:", objc_msgSend((id)UIApp, "_accessibilityMachPort"));
    }
    else
    {
      v8 = 0;
    }
    v9 = +[_UITextServiceSession availableTextServices](_UITextServiceSession, "availableTextServices");
    traits = self->_traits;
    if (traits)
    {
      v11 = traits;
    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "traitCollection");
      v11 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();

    }
    v13 = objc_alloc_init(_UIViewServiceViewControllerOperatorCreateOptions);
    -[_UIViewServiceViewControllerOperatorCreateOptions setViewControllerClassName:](v13, "setViewControllerClassName:", self->_viewControllerClassName);
    -[_UIViewServiceViewControllerOperatorCreateOptions setContextToken:](v13, "setContextToken:", self->_contextToken);
    +[UIScreen __displayConfigurationsForViewService](UIScreen, "__displayConfigurationsForViewService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceViewControllerOperatorCreateOptions setDisplayConfigurations:](v13, "setDisplayConfigurations:", v14);

    -[_UIViewServiceViewControllerOperatorCreateOptions setSerializedAppearanceRepresentations:](v13, "setSerializedAppearanceRepresentations:", self->_serializedAppearanceCustomizations);
    _obscuredTraitCollectionFromTraitCollection(v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceViewControllerOperatorCreateOptions setTraitCollection:](v13, "setTraitCollection:", v15);

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceViewControllerOperatorCreateOptions setInitialInterfaceOrientation:](v13, "setInitialInterfaceOrientation:", objc_msgSend(v16, "_interfaceOrientation"));

    -[_UIViewServiceViewControllerOperatorCreateOptions setHostAccessibilityServerPort:](v13, "setHostAccessibilityServerPort:", v8);
    -[_UIViewServiceViewControllerOperatorCreateOptions setAvailableTextServices:](v13, "setAvailableTextServices:", v9);
    -[_UIRemoteViewControllerConnectionInfo viewControllerOperatorProxy](self->_connectionInfo, "viewControllerOperatorProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __77___UIRemoteViewControllerConnectionRequest__sendServiceViewControllerRequest__block_invoke;
    v26[3] = &unk_1E16BB768;
    v26[4] = self;
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = _sendServiceViewControllerRequest___s_category;
    if (!_sendServiceViewControllerRequest___s_category)
    {
      v20 = __UILogCategoryGetNode("ViewServiceConnectionRequest", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&_sendServiceViewControllerRequest___s_category);
    }
    v21 = *(id *)(v20 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[_UIRemoteViewService identifier](self->_service, "identifier");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      viewServiceBundleIdentifier = v22;
      if (!v22)
        viewServiceBundleIdentifier = self->_viewServiceBundleIdentifier;
      *(_DWORD *)buf = 138543362;
      v28 = viewServiceBundleIdentifier;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "Sending view controller creation request to %{public}@", buf, 0xCu);

    }
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __77___UIRemoteViewControllerConnectionRequest__sendServiceViewControllerRequest__block_invoke_282;
    v25[3] = &unk_1E16E8950;
    v25[4] = self;
    objc_msgSend(v19, "__createViewControllerWithOptions:completionBlock:", v13, v25);

  }
}

- (void)_connectToTextEffectsOperator
{
  _UIRemoteViewControllerConnectionRequest *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _UIRemoteViewControllerConnectionRequest *v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__223;
  v6[4] = __Block_byref_object_dispose__223;
  v2 = self;
  v7 = v2;
  +[_UIViewServiceTextEffectsOperator XPCInterface](_UIViewServiceTextEffectsOperator, "XPCInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIRemoteViewControllerWeakWrapperProxy wrapperWithTarget:](_UIRemoteViewControllerWeakWrapperProxy, "wrapperWithTarget:", v2->_exportedHostingObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73___UIRemoteViewControllerConnectionRequest__connectToTextEffectsOperator__block_invoke;
  v5[3] = &unk_1E16BE688;
  v5[4] = v6;
  -[_UIRemoteViewControllerConnectionRequest _connectToDeputyWithInterface:fromExportedHostingObject:successHandler:](v2, "_connectToDeputyWithInterface:fromExportedHostingObject:successHandler:", v3, v4, v5);

  _Block_object_dispose(v6, 8);
}

- (void)_sendServiceTextEffectsRequest
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (!self->_isCancelledOrComplete)
  {
    -[_UIRemoteViewControllerConnectionInfo textEffectsWindowHostingHandle](self->_connectionInfo, "textEffectsWindowHostingHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRemoteViewController.m"), 1603, CFSTR("Already got the text effects window's hosting handle"));

    }
    -[_UIRemoteViewControllerConnectionInfo textEffectsOperatorProxy](self->_connectionInfo, "textEffectsOperatorProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74___UIRemoteViewControllerConnectionRequest__sendServiceTextEffectsRequest__block_invoke;
    v10[3] = &unk_1E16BB768;
    v10[4] = self;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __74___UIRemoteViewControllerConnectionRequest__sendServiceTextEffectsRequest__block_invoke_2;
    v9[3] = &unk_1E16E8978;
    v9[4] = self;
    objc_msgSend(v7, "__createHostedTextEffectsWithReplyHandler:", v9);

  }
}

- (void)_connectToServiceViewController
{
  _UIRemoteViewControllerConnectionRequest *v2;
  _UIViewServiceDeputyXPCInterface *serviceViewControllerDeputyInterface;
  void *v4;
  _UIRemoteViewControllerConnectionRequest *v5;
  _QWORD v6[4];
  _UIRemoteViewControllerConnectionRequest *v7;

  v2 = self;
  serviceViewControllerDeputyInterface = v2->_serviceViewControllerDeputyInterface;
  +[_UIRemoteViewControllerWeakWrapperProxy wrapperWithTarget:](_UIRemoteViewControllerWeakWrapperProxy, "wrapperWithTarget:", v2->_exportedHostingObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75___UIRemoteViewControllerConnectionRequest__connectToServiceViewController__block_invoke;
  v6[3] = &unk_1E16D7FB0;
  v7 = v2;
  v5 = v2;
  -[_UIRemoteViewControllerConnectionRequest _connectToDeputyWithInterface:fromExportedHostingObject:successHandler:](v5, "_connectToDeputyWithInterface:fromExportedHostingObject:successHandler:", serviceViewControllerDeputyInterface, v4, v6);

}

- (void)_connectToViewControllerControlMessageDeputy
{
  _UIRemoteViewControllerConnectionRequest *v2;
  void *v3;
  _UIRemoteViewControllerConnectionRequest *v4;
  _QWORD v5[4];
  _UIRemoteViewControllerConnectionRequest *v6;

  v2 = self;
  +[_UIViewControllerControlMessageDeputy XPCInterface](_UIViewControllerControlMessageDeputy, "XPCInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88___UIRemoteViewControllerConnectionRequest__connectToViewControllerControlMessageDeputy__block_invoke;
  v5[3] = &unk_1E16D7FB0;
  v6 = v2;
  v4 = v2;
  -[_UIRemoteViewControllerConnectionRequest _connectToDeputyWithInterface:fromExportedHostingObject:successHandler:](v4, "_connectToDeputyWithInterface:fromExportedHostingObject:successHandler:", v3, 0, v5);

}

- (void)_didFinishEstablishingConnection
{
  unint64_t v3;
  NSObject *v4;
  _UIRemoteViewControllerConnectionRequest *v5;
  void (**handler)(id, _UIRemoteViewControllerConnectionInfo *, _QWORD);
  id v7;
  __int16 v8[8];

  if (!self->_isCancelledOrComplete)
  {
    self->_isCancelledOrComplete = 1;
    -[objc_class __shouldHostRemoteTextEffectsWindow](self->_remoteViewControllerClass, "__shouldHostRemoteTextEffectsWindow");
    v3 = _didFinishEstablishingConnection___s_category;
    if (!_didFinishEstablishingConnection___s_category)
    {
      v3 = __UILogCategoryGetNode("ViewServiceConnectionRequest", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_didFinishEstablishingConnection___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Connection to service was established", (uint8_t *)v8, 2u);
    }
    v5 = objc_retainAutorelease(self);
    handler = (void (**)(id, _UIRemoteViewControllerConnectionInfo *, _QWORD))v5->_handler;
    if (handler)
    {
      handler[2](handler, v5->_connectionInfo, 0);
      v7 = v5->_handler;
    }
    else
    {
      v7 = 0;
    }
    v5->_handler = 0;

  }
}

- (id)_cancelWithError:(id)a3
{
  id v5;
  _UIAsyncInvocation *requestCancellationInvocation;
  _UIAsyncInvocation *v7;
  _UIAsyncInvocation *v8;
  void *v9;

  v5 = a3;
  if (!self->_error)
    objc_storeStrong((id *)&self->_error, a3);
  requestCancellationInvocation = self->_requestCancellationInvocation;
  if (requestCancellationInvocation)
  {
    v7 = requestCancellationInvocation;
  }
  else
  {
    +[_UIAsyncInvocation emptyInvocation](_UIAsyncInvocation, "emptyInvocation");
    v7 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  -[_UIAsyncInvocation invoke](v7, "invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCancellationInvocation, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_cancelInvocationForCurrentOperation, 0);
  objc_storeStrong((id *)&self->_serviceViewControllerDeputyInterface, 0);
  objc_storeStrong(&self->_exportedHostingObject, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_serializedAppearanceCustomizations, 0);
  objc_storeStrong((id *)&self->_contextToken, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_viewServiceBundleIdentifier, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end

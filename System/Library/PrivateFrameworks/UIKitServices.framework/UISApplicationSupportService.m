@implementation UISApplicationSupportService

void __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (NSClassFromString(CFSTR("UISApplicationInitializationContext")))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = v6;
  if (!v4 || v6)
  {

    if (v7)
      goto LABEL_13;
  }
  else
  {
    BSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "[signal context]";
      v23 = 2082;
      v24 = "UISApplicationInitializationContext";
      _os_log_impl(&dword_190875000, v8, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "defaultContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (objc_msgSend(v3, "isFailed"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "processName");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v18;
      _os_log_fault_impl(&dword_190875000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%{public}@ dropped the initialize-client request on the floor.", buf, 0xCu);

    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ dropped the initialize-client request on the floor."), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D68];
    v20 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("UISApplicationSupportService"), 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v7, v15);

}

void __74__UISApplicationSupportService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D23040];
  v5 = a2;
  objc_msgSend(v3, "userInteractive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setTargetDispatchingQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_88);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_89);

}

- (void)initializeClientWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  _BOOL4 lock_finishedLaunching;
  UISApplicationSupportServiceDelegate *v9;
  char lock_delegateFlags;
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
  void *v21;
  void *v22;
  void *v23;
  UISApplicationSupportServiceDelegate *v24;
  id v25;
  id v26;
  void (**v27)(_QWORD);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  pid_t v38;
  char v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  int v46;
  uint64_t v47;
  int v48;
  char v49;
  void *v50;
  id v51;
  char v52;
  void *v53;
  void (**v54)(_QWORD);
  uint64_t v55;
  _BOOL4 v56;
  void *v57;
  id v58;
  void (**v59)(id, void *, void *);
  UISApplicationSupportServiceDelegate *v60;
  _QWORD v61[4];
  UISApplicationSupportServiceDelegate *v62;
  UISApplicationSupportService *v63;
  id v64;
  id v65;
  id v66;
  BOOL v67;
  BOOL v68;
  BOOL v69;
  _QWORD v70[5];
  void (**v71)(id, void *, void *);
  uint64_t v72;
  void *v73;
  uint8_t buf[4];
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  os_unfair_lock_lock(&self->_lock);
  lock_finishedLaunching = self->_lock_finishedLaunching;
  v9 = self->_lock_delegate;
  if (!v9)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_5;
  }
  lock_delegateFlags = (char)self->_lock_delegateFlags;
  if ((lock_delegateFlags & 0x14) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_8;
  }
  os_unfair_lock_unlock(&self->_lock);
  if ((lock_delegateFlags & 0x28) == 0)
  {
LABEL_5:
    if (v7)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "processName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ does not implement this service. Returning default context."), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[UISApplicationSupportService defaultContext](self, "defaultContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v72 = *MEMORY[0x1E0CB2D68];
      v73 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("UISApplicationSupportService"), 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v15, v18);

    }
    goto LABEL_48;
  }
LABEL_8:
  v56 = lock_finishedLaunching;
  v60 = v9;
  v19 = MEMORY[0x1E0C809B0];
  v20 = (void *)MEMORY[0x1E0D22F88];
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke;
  v70[3] = &unk_1E2CAFC40;
  v70[4] = self;
  v59 = v7;
  v71 = v7;
  objc_msgSend(v20, "sentinelWithCompletion:", v70);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "remoteProcess");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v61[0] = v19;
  v61[1] = 3221225472;
  v61[2] = __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke_104;
  v61[3] = &unk_1E2CAFC90;
  v67 = (lock_delegateFlags & 8) != 0;
  v24 = v9;
  v62 = v24;
  v63 = self;
  v25 = v23;
  v64 = v25;
  v65 = v6;
  v26 = v21;
  v66 = v26;
  v68 = (lock_delegateFlags & 4) != 0;
  v69 = (lock_delegateFlags & 0x10) != 0;
  v27 = (void (**)(_QWORD))MEMORY[0x194010C34](v61);
  if ((lock_delegateFlags & 2) != 0
    && -[UISApplicationSupportServiceDelegate service:overrideClientInitialization:](v24, "service:overrideClientInitialization:", self, v25))
  {
    v27[2](v27);
  }
  else
  {
    v57 = v26;
    v28 = (void *)MEMORY[0x1E0D87D68];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v25, "pid"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleForIdentifier:error:", v29, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "identity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hostIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v32, 0);
        v33 = objc_claimAutoreleasedReturnValue();
        if (!v33)
          break;
        v34 = (void *)v33;

        objc_msgSend(v34, "identity");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "hostIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v34;
        if (!v32)
          goto LABEL_17;
      }

    }
    v34 = v30;
LABEL_17:
    v58 = v6;
    objc_msgSend(v34, "identity");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v34, "pid");
    v38 = getpid();
    if ((objc_msgSend(v36, "isApplication") & 1) != 0)
      v39 = 1;
    else
      v39 = objc_msgSend(v36, "isEmbeddedApplication");
    if (v37 == v38 && (v39 & 1) != 0 || !objc_msgSend(v36, "isXPCService"))
    {
      v48 = 0;
    }
    else
    {
      v54 = v27;
      objc_msgSend(v34, "bundle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v52 = v39;
        v53 = v36;
        v55 = *MEMORY[0x1E0CEC4B8];
        v42 = *MEMORY[0x1E0CEC440];
        while (1)
        {
          if ((objc_msgSend(v41, "isEqualToString:", CFSTR("/")) & 1) != 0)
          {
LABEL_29:
            v48 = 0;
            goto LABEL_33;
          }
          objc_msgSend(v41, "pathExtension");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v43, v55);
            v44 = v25;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "isEqual:", v42);

            v25 = v44;
            if (v46)
              break;
          }
          objc_msgSend(v41, "stringByDeletingLastPathComponent");
          v47 = objc_claimAutoreleasedReturnValue();

          v41 = (void *)v47;
          if (!v47)
            goto LABEL_29;
        }

        v48 = 1;
LABEL_33:
        v36 = v53;
        v39 = v52;
      }
      else
      {
        v48 = 0;
      }

      v27 = v54;
    }
    if (v37 == v38)
      v49 = 1;
    else
      v49 = v39;
    if ((v49 & 1) != 0 || v48)
    {
      v6 = v58;
      v7 = v59;
      if (v56)
      {
        v27[2](v27);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          if (v34)
            v51 = v34;
          else
            v51 = v25;
          *(_DWORD *)buf = 138543362;
          v75 = v51;
          _os_log_error_impl(&dword_190875000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[UISApplicationSupportService] Client connected before we finished launching: %{public}@)", buf, 0xCu);
        }
        -[UISApplicationSupportService _pendRequestUntilLaunch:](self, "_pendRequestUntilLaunch:", v27);
      }
      v26 = v57;
    }
    else
    {
      -[UISApplicationSupportService defaultContext](self, "defaultContext");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v57;
      objc_msgSend(v57, "signalWithContext:", v50);

      v6 = v58;
      v7 = v59;
    }

    v9 = v60;
  }

LABEL_48:
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  UISApplicationSupportService *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D22FE8], "interfaceWithIdentifier:", 0x1E2CB2280);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22FF8], "protocolForProtocol:", &unk_1EE1EC3F8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setServer:", v12);

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__UISApplicationSupportService_listener_didReceiveConnection_withContext___block_invoke;
  v20[3] = &unk_1E2CAF458;
  v14 = v11;
  v21 = v14;
  v22 = self;
  objc_msgSend(v9, "configureConnection:", v20);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v15 = (void *)qword_1ECDA5990;
  v27 = qword_1ECDA5990;
  if (!qword_1ECDA5990)
  {
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __getFBProcessManagerClass_block_invoke;
    v23[3] = &unk_1E2CAF658;
    v23[4] = &v24;
    __getFBProcessManagerClass_block_invoke((uint64_t)v23);
    v15 = (void *)v25[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v16, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "registerProcessForHandle:", v18);

  objc_msgSend(v9, "activate");
}

uint64_t __74__UISApplicationSupportService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

+ (id)sharedInstance
{
  if (qword_1ECDA5988 != -1)
    dispatch_once(&qword_1ECDA5988, &__block_literal_global_11);
  return (id)_MergedGlobals_17;
}

void __46__UISApplicationSupportService_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UISApplicationSupportService _initWithDelegate:targetQueue:]([UISApplicationSupportService alloc], "_initWithDelegate:targetQueue:", 0, 0);
  v1 = (void *)_MergedGlobals_17;
  _MergedGlobals_17 = (uint64_t)v0;

}

- (UISApplicationSupportService)init
{
  UISApplicationSupportService *v3;

  +[UISApplicationSupportService sharedInstance](UISApplicationSupportService, "sharedInstance");
  v3 = (UISApplicationSupportService *)objc_claimAutoreleasedReturnValue();
  -[UISApplicationSupportService start](v3, "start");

  return v3;
}

- (UISApplicationSupportService)initWithCalloutQueue:(id)a3
{
  FBSSerialQueue *v4;
  UISApplicationSupportService *v5;
  FBSSerialQueue *targetQueue;

  v4 = (FBSSerialQueue *)a3;
  +[UISApplicationSupportService sharedInstance](UISApplicationSupportService, "sharedInstance");
  v5 = (UISApplicationSupportService *)objc_claimAutoreleasedReturnValue();
  targetQueue = v5->_targetQueue;
  v5->_targetQueue = v4;

  -[UISApplicationSupportService start](v5, "start");
  return v5;
}

- (id)_initWithDelegate:(id)a3 targetQueue:(id)a4
{
  id v7;
  id v8;
  UISApplicationSupportService *v9;
  UISApplicationSupportService *v10;
  uint64_t v11;
  UISApplicationInitializationContext *lock_defaultContext;
  void *v13;
  UISApplicationSupportService *v14;
  uint64_t v15;
  BSServiceConnectionListener *listener;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  UISApplicationSupportService *v22;
  SEL v23;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)UISApplicationSupportService;
  v9 = -[UISApplicationSupportService init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_targetQueue, a4);
    +[UISApplicationInitializationContext defaultContext](UISApplicationInitializationContext, "defaultContext");
    v11 = objc_claimAutoreleasedReturnValue();
    lock_defaultContext = v10->_lock_defaultContext;
    v10->_lock_defaultContext = (UISApplicationInitializationContext *)v11;

    v13 = (void *)MEMORY[0x1E0D23030];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __62__UISApplicationSupportService__initWithDelegate_targetQueue___block_invoke;
    v21 = &unk_1E2CAF698;
    v23 = a2;
    v14 = v10;
    v22 = v14;
    objc_msgSend(v13, "listenerWithConfigurator:", &v18);
    v15 = objc_claimAutoreleasedReturnValue();
    listener = v14->_listener;
    v14->_listener = (BSServiceConnectionListener *)v15;

    if (v7)
      -[UISApplicationSupportService _setDelegate:](v14, "_setDelegate:", v7, v18, v19, v20, v21);

  }
  return v10;
}

void __62__UISApplicationSupportService__initWithDelegate_targetQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0D23048];
  v4 = a2;
  objc_msgSend(v3, "bootstrapConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainsContainingServiceIdentifier:", 0x1E2CB2280);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UISApplicationSupportService.m"), 92, CFSTR("must have one and only one domain specify %@ : domains=%@"), 0x1E2CB2280, v5);

  }
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDomain:", v7);

  objc_msgSend(v4, "setService:", 0x1E2CB2280);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UISApplicationSupportService;
  -[UISApplicationSupportService dealloc](&v3, sel_dealloc);
}

- (void)start
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  FBSSerialQueue *v7;
  FBSSerialQueue *targetQueue;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_started)
  {
    self->_lock_started = 1;
    if (!self->_targetQueue)
    {
      objc_msgSend(MEMORY[0x1E0D22FB0], "serial");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceClass:", 33);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)BSDispatchQueueCreate();

      objc_msgSend(MEMORY[0x1E0D23258], "queueWithDispatchQueue:", v6);
      v7 = (FBSSerialQueue *)objc_claimAutoreleasedReturnValue();
      targetQueue = self->_targetQueue;
      self->_targetQueue = v7;

    }
    -[BSServiceConnectionListener activate](self->_listener, "activate");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__UISApplicationSupportService_start__block_invoke;
    block[3] = &unk_1E2CAF370;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  os_unfair_lock_unlock(p_lock);
}

void __37__UISApplicationSupportService_start__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 1;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (v2)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__UISApplicationSupportService_start__block_invoke_2;
    v6[3] = &unk_1E2CAF370;
    v7 = v2;
    objc_msgSend(v5, "performAsync:", v6);

  }
}

void __37__UISApplicationSupportService_start__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (UISApplicationInitializationContext)defaultContext
{
  os_unfair_lock_s *p_lock;
  UISApplicationInitializationContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_defaultContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDefaultContext:(id)a3
{
  UISApplicationInitializationContext *v4;
  UISApplicationInitializationContext *lock_defaultContext;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    v4 = (UISApplicationInitializationContext *)objc_msgSend(v6, "copy");
  }
  else
  {
    +[UISApplicationInitializationContext defaultContext](UISApplicationInitializationContext, "defaultContext");
    v4 = (UISApplicationInitializationContext *)objc_claimAutoreleasedReturnValue();
  }
  lock_defaultContext = self->_lock_defaultContext;
  self->_lock_defaultContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)hasFinishedLaunching
{
  UISApplicationSupportService *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_finishedLaunching;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_delegate
{
  os_unfair_lock_s *p_lock;
  UISApplicationSupportServiceDelegate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setDelegate:(id)a3
{
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  void *v13;
  UISApplicationSupportServiceDelegate *v14;

  v14 = (UISApplicationSupportServiceDelegate *)a3;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationSupportService.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate != nil"));

  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_delegate != v14)
  {
    objc_storeStrong((id *)&self->_lock_delegate, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_lock_delegateFlags = *(_BYTE *)&self->_lock_delegateFlags & 0xFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_BYTE *)&self->_lock_delegateFlags = *(_BYTE *)&self->_lock_delegateFlags & 0xFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_lock_delegateFlags = *(_BYTE *)&self->_lock_delegateFlags & 0xF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_BYTE *)&self->_lock_delegateFlags = *(_BYTE *)&self->_lock_delegateFlags & 0xEF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 32;
    else
      v10 = 0;
    *(_BYTE *)&self->_lock_delegateFlags = *(_BYTE *)&self->_lock_delegateFlags & 0xDF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 64;
    else
      v11 = 0;
    *(_BYTE *)&self->_lock_delegateFlags = *(_BYTE *)&self->_lock_delegateFlags & 0xBF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 0x80;
    else
      v12 = 0;
    *(_BYTE *)&self->_lock_delegateFlags = v12 & 0x80 | *(_BYTE *)&self->_lock_delegateFlags & 0x7F;
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_pendRequestUntilLaunch:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *lock_launchPendedRequests;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  -[FBSSerialQueue assertOnQueue](self->_targetQueue, "assertOnQueue");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_finishedLaunching)
  {
    os_unfair_lock_unlock(&self->_lock);
    v10[2]();
  }
  else
  {
    lock_launchPendedRequests = self->_lock_launchPendedRequests;
    if (!lock_launchPendedRequests)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_lock_launchPendedRequests;
      self->_lock_launchPendedRequests = v6;

      lock_launchPendedRequests = self->_lock_launchPendedRequests;
    }
    v8 = (void *)objc_msgSend(v10, "copy");
    v9 = (void *)MEMORY[0x194010C34]();
    -[NSMutableArray addObject:](lock_launchPendedRequests, "addObject:", v9);

    os_unfair_lock_unlock(p_lock);
  }

}

uint64_t __74__UISApplicationSupportService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activate");
}

void __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke_104(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "service:initializeClient:withParameters:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v2 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v3 = (id)v2;
    v9 = (id)v2;
    v4 = *(void **)(a1 + 64);
LABEL_6:
    objc_msgSend(v4, "signalWithContext:", v3, v9);

    return;
  }
  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend(*(id *)(a1 + 32), "service:initializeClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v5 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(a1 + 74))
  {
    objc_msgSend(*(id *)(a1 + 48), "auditToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationInitializationContextForClient:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 64);
    v3 = v9;
    goto LABEL_6;
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke_2;
  v11[3] = &unk_1E2CAFC68;
  v12 = *(id *)(a1 + 64);
  objc_msgSend(v5, "service:initializeClient:withCompletion:", v6, v7, v11);

}

uint64_t __74__UISApplicationSupportService_initializeClientWithParameters_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalWithContext:", a2);
}

- (void)requestPasscodeUnlockUIWithCompletion:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_finishedLaunching;
  UISApplicationSupportServiceDelegate *v7;
  char lock_delegateFlags;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_finishedLaunching = self->_lock_finishedLaunching;
  v7 = self->_lock_delegate;
  if (!v7)
  {
    os_unfair_lock_unlock(&self->_lock);
    if (!v4)
      goto LABEL_13;
    goto LABEL_9;
  }
  lock_delegateFlags = (char)self->_lock_delegateFlags;
  os_unfair_lock_unlock(p_lock);
  if (lock_finishedLaunching && (lock_delegateFlags & 0x40) != 0)
  {
    v9 = (void *)MEMORY[0x1E0D22F88];
    v10 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __70__UISApplicationSupportService_requestPasscodeUnlockUIWithCompletion___block_invoke;
    v26[3] = &unk_1E2CAFCB8;
    v27 = v4;
    objc_msgSend(v9, "sentinelWithCompletion:", v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteProcess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "auditToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __70__UISApplicationSupportService_requestPasscodeUnlockUIWithCompletion___block_invoke_2;
    v24[3] = &unk_1E2CAFCE0;
    v25 = v11;
    v15 = v11;
    -[UISApplicationSupportServiceDelegate requestPasscodeUnlockUIForClient:withCompletion:](v7, "requestPasscodeUnlockUIForClient:withCompletion:", v14, v24);

    v16 = v27;
LABEL_12:

    goto LABEL_13;
  }
  if (v4)
  {
    if ((lock_delegateFlags & 0x40) != 0)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "processName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ has not yet finished launching."), v19);
      goto LABEL_11;
    }
LABEL_9:
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "processName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ does not implement this service."), v19);
LABEL_11:
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D68];
    v29[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("UISApplicationSupportService"), 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, MEMORY[0x1E0C9AAA0], v23);

    goto LABEL_12;
  }
LABEL_13:

}

void __70__UISApplicationSupportService_requestPasscodeUnlockUIWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "context");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
    v4 = v3;
  else
    v4 = MEMORY[0x1E0C9AAA0];
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v4, 0);

}

void __70__UISApplicationSupportService_requestPasscodeUnlockUIWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signalWithContext:", v3);

}

- (void)destroyScenesPersistentIdentifiers:(id)a3 animationType:(id)a4 destroySessions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_finishedLaunching;
  UISApplicationSupportServiceDelegate *v16;
  $6158441AD3FF881409B5EA1F780CD1B3 lock_delegateFlags;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  void (**v39)(id, _QWORD, void *);
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (!objc_msgSend(v10, "count"))
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D68];
    v43[0] = CFSTR("No persistent scene identifiers specified.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v16 = (UISApplicationSupportServiceDelegate *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("UISApplicationSupportService"), 2, v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, MEMORY[0x1E0C9AAA0], v27);
    goto LABEL_13;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_finishedLaunching = self->_lock_finishedLaunching;
  v16 = self->_lock_delegate;
  if (v16)
  {
    lock_delegateFlags = self->_lock_delegateFlags;
    os_unfair_lock_unlock(p_lock);
    if (lock_finishedLaunching && (*(_DWORD *)&lock_delegateFlags & 0x80000000) != 0)
    {
      v18 = (void *)MEMORY[0x1E0D22F88];
      v19 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __108__UISApplicationSupportService_destroyScenesPersistentIdentifiers_animationType_destroySessions_completion___block_invoke;
      v38[3] = &unk_1E2CAFCB8;
      v39 = v13;
      objc_msgSend(v18, "sentinelWithCompletion:", v38);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "remoteProcess");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "auditToken");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v11, "unsignedIntegerValue");
      v25 = objc_msgSend(v12, "BOOLValue");
      v36[0] = v19;
      v36[1] = 3221225472;
      v36[2] = __108__UISApplicationSupportService_destroyScenesPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_125;
      v36[3] = &unk_1E2CAFD08;
      v37 = v20;
      v26 = v20;
      -[UISApplicationSupportServiceDelegate destroyScenesWithPersistentIdentifiers:animationType:destroySessions:forClient:completion:](v16, "destroyScenesWithPersistentIdentifiers:animationType:destroySessions:forClient:completion:", v10, v24, v25, v23, v36);

      v27 = v39;
LABEL_13:

      goto LABEL_14;
    }
    if (v13)
    {
      if ((*(_DWORD *)&lock_delegateFlags & 0x80000000) != 0)
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "processName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@ has not yet finished launching."), v31);
        goto LABEL_12;
      }
LABEL_11:
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "processName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ does not implement this service."), v31);
LABEL_12:
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D68];
      v41 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("UISApplicationSupportService"), 1, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, MEMORY[0x1E0C9AAA0], v34);

      goto LABEL_13;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    if (v13)
      goto LABEL_11;
    v16 = 0;
  }
LABEL_14:

}

void __108__UISApplicationSupportService_destroyScenesPersistentIdentifiers_animationType_destroySessions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (NSClassFromString(CFSTR("NSError")))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = v6;
  if (v4 && !v6)
  {
    BSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "[signal context]";
      v23 = 2082;
      v24 = "NSError";
      _os_log_impl(&dword_190875000, v8, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\", buf, 0x16u);
    }

  }
  v9 = objc_msgSend(v3, "isFailed");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "processName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ dropped the request on the floor."), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D68];
    v20 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("UISApplicationSupportService"), 1, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v16;
  }
  v17 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7 == 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v7);

}

void __108__UISApplicationSupportService_destroyScenesPersistentIdentifiers_animationType_destroySessions_completion___block_invoke_125(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {

    v6 = 0;
  }
  else if (!v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ rejected the request, but neglected to provide an error."), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D68];
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("UISApplicationSupportService"), 1, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "signalWithContext:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_launchPendedRequests, 0);
  objc_storeStrong((id *)&self->_lock_defaultContext, 0);
  objc_storeStrong((id *)&self->_lock_delegate, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end

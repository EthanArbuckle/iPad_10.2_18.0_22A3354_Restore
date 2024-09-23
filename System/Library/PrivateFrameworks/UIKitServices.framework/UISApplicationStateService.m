@implementation UISApplicationStateService

void __72__UISApplicationStateService_listener_didReceiveConnection_withContext___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D23040];
  v5 = a2;
  objc_msgSend(v3, "userInteractive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setInterface:", a1[4]);
  objc_msgSend(v5, "setInterfaceTarget:", a1[5]);
  objc_msgSend(v5, "setTargetDispatchingQueue:", *(_QWORD *)(a1[5] + 16));
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_4);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_69);
  objc_msgSend(v5, "setUserInfo:", a1[6]);

}

- (void)setBadgeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  -[UISApplicationStateService _operatingBundleIdentifier](self, "_operatingBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISApplicationStateService _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:legacyEntitlement:](self, "_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:legacyEntitlement:", v5, CFSTR("set badge value"), CFSTR("com.apple.frontboard.app-badge-value-access")))
  {
    -[UISApplicationStateService _dataSourceForApplicationBundleIdentifier:](self, "_dataSourceForApplicationBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "setBadgeValue:", v4);
        _UISStateServiceLogger();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138543874;
          v11 = v8;
          v12 = 2114;
          v13 = v5;
          v14 = 2114;
          v15 = v4;
          v9 = "Client \"%{public}@\" set the badge value of %{public}@ to %{public}@";
LABEL_10:
          _os_log_impl(&dword_190875000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x20u);

        }
      }
      else
      {
        _UISStateServiceLogger();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138543874;
          v11 = v8;
          v12 = 2114;
          v13 = v5;
          v14 = 2114;
          v15 = v4;
          v9 = "Ignored client \"%{public}@\" request to change the badge value of %{public}@ to %{public}@ because the s"
               "erver does not support setting badge values for this application.";
          goto LABEL_10;
        }
      }
    }
    else
    {
      _UISStateServiceLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543874;
        v11 = v8;
        v12 = 2114;
        v13 = v5;
        v14 = 2114;
        v15 = v4;
        v9 = "Ignored client \"%{public}@\" request to change the badge value of %{public}@ to %{public}@ because the ser"
             "ver reported no data source for the application.";
        goto LABEL_10;
      }
    }

  }
}

- (void)badgeValueWithCompletion:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, void *, void *, _QWORD);

  v13 = (void (**)(id, void *, void *, _QWORD))a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationStateService.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  -[UISApplicationStateService _operatingBundleIdentifier](self, "_operatingBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISApplicationStateService _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:legacyEntitlement:](self, "_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:legacyEntitlement:", v5, CFSTR("get badge value"), CFSTR("com.apple.frontboard.app-badge-value-access")))
  {
    -[UISApplicationStateService _dataSourceForApplicationBundleIdentifier:](self, "_dataSourceForApplicationBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "badgeValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v10 = v7;
    else
      v10 = 0;
    if ((v9 & 1) != 0)
      v11 = v7;
    else
      v11 = 0;
    v13[2](v13, v10, v11, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E2CAFE80, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *, void *))v13)[2](v13, 0, 0, v7);
  }

}

- (id)_operatingBundleIdentifier
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationStateService.m"), 326, CFSTR("Must have a bundle identifier on the connection - userInfo: %@ (currentContext: %@)"), 0, v8);

  }
  return v5;
}

- (BOOL)_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:(id)a3 description:(id)a4 legacyEntitlement:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  NSObject *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    _UISStateServiceLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_190875000, v17, OS_LOG_TYPE_DEFAULT, "Client: %{public}@ unable to validate caller.", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_11;
  }
  objc_msgSend(v12, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v8);

  if ((v15 & 1) == 0
    && (objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.uikitservices.app.value-access")) & 1) == 0
    && (!v10 || (objc_msgSend(v13, "hasEntitlement:", v10) & 1) == 0))
  {
    _UISStateServiceLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v9;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_190875000, v17, OS_LOG_TYPE_ERROR, "Client: %{public}@ not authorized to %{public}@ on behalf of application: %{public}@", (uint8_t *)&v19, 0x20u);
    }
LABEL_11:

    v16 = 0;
    goto LABEL_12;
  }
  v16 = 1;
LABEL_12:

  return v16;
}

- (id)_dataSourceForApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;

  v4 = a3;
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dataSourceForApplicationBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  UISApplicationStateService *v15;
  id v16;

  v12 = a4;
  objc_msgSend(a5, "decodeStringForKey:", 0x1E2CAFDE0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D22FE8], "interfaceWithIdentifier:", 0x1E2CAFE60);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D22FF8], "protocolForProtocol:", &unk_1EE1E8650);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setServer:", v10);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__UISApplicationStateService_listener_didReceiveConnection_withContext___block_invoke;
    v13[3] = &unk_1E2CAF6E0;
    v14 = v9;
    v15 = self;
    v16 = v8;
    v11 = v9;
    objc_msgSend(v12, "configureConnection:", v13);
    objc_msgSend(v12, "activate");

  }
  else
  {
    objc_msgSend(v12, "invalidate");
  }

}

uint64_t __72__UISApplicationStateService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (void)setMinimumBackgroundFetchInterval:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE buf[24];
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  -[UISApplicationStateService _operatingBundleIdentifier](self, "_operatingBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISApplicationStateService _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:](self, "_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:", v5, CFSTR("set maximum background fetch interval")))
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    _UISStateServiceLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v7;
      _os_log_impl(&dword_190875000, v8, OS_LOG_TYPE_INFO, "%{public}@ wants minFetchInterval: %f", buf, 0x16u);
    }

    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v9 = (void *)qword_1ECDA58A8;
    v15 = qword_1ECDA58A8;
    if (!qword_1ECDA58A8)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __get_DASSchedulerClass_block_invoke;
      v17 = &unk_1E2CAF658;
      v18 = &v12;
      __get_DASSchedulerClass_block_invoke((uint64_t)buf);
      v9 = (void *)v13[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v12, 8);
    objc_msgSend(v10, "sharedScheduler", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMinimumBackgroundFetchInterval:forApp:", v5, v7);

  }
}

- (BOOL)_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:(id)a3 description:(id)a4
{
  return -[UISApplicationStateService _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:legacyEntitlement:](self, "_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:legacyEntitlement:", a3, a4, 0);
}

- (UISApplicationStateService)init
{
  dispatch_queue_t v3;
  void *v4;
  UISApplicationStateService *v5;

  v3 = dispatch_queue_create("com.apple.uikit.applicationstateservice.server", 0);
  objc_msgSend(MEMORY[0x1E0D23258], "queueWithDispatchQueue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UISApplicationStateService initWithCalloutQueue:](self, "initWithCalloutQueue:", v4);

  return v5;
}

- (UISApplicationStateService)initWithCalloutQueue:(id)a3
{
  id v6;
  UISApplicationStateService *v7;
  UISApplicationStateService *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id *v18;
  SEL v19;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UISApplicationStateService;
  v7 = -[UISApplicationStateService init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_calloutQueue, a3);
    v9 = (void *)MEMORY[0x1E0D23030];
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __51__UISApplicationStateService_initWithCalloutQueue___block_invoke;
    v17 = &unk_1E2CAF698;
    v19 = a2;
    v10 = v8;
    v18 = v10;
    objc_msgSend(v9, "listenerWithConfigurator:", &v14);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v10[1];
    v10[1] = (id)v11;

    objc_msgSend(v10[1], "activate", v14, v15, v16, v17);
  }

  return v8;
}

void __51__UISApplicationStateService_initWithCalloutQueue___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v9, "domainsContainingServiceIdentifier:", 0x1E2CAFE60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UISApplicationStateService.m"), 69, CFSTR("must have one and only one domain specify %@ : domains=%@"), 0x1E2CAFE60, v5);

  }
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDomain:", v7);

  objc_msgSend(v4, "setService:", 0x1E2CAFE60);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

  }
}

uint64_t __72__UISApplicationStateService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activate");
}

- (void)nextWakeIntervalSinceReferenceDateWithCompletion:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void (**v13)(id, void *, _QWORD);

  v13 = (void (**)(id, void *, _QWORD))a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationStateService.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  -[UISApplicationStateService _operatingBundleIdentifier](self, "_operatingBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISApplicationStateService _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:](self, "_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:", v5, CFSTR("get next wake interval")))
  {
    -[UISApplicationStateService _dataSourceForApplicationBundleIdentifier:](self, "_dataSourceForApplicationBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -1.0;
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "nextWakeDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "timeIntervalSinceReferenceDate");
        v7 = v10;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v11, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E2CAFE80, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v13)[2](v13, &unk_1E2CBABD8, v6);
  }

}

- (void)setNextWakeIntervalSinceReferenceDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  -[UISApplicationStateService _operatingBundleIdentifier](self, "_operatingBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISApplicationStateService _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:](self, "_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:", v5, CFSTR("set next wake interval")))
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    v8 = BSFloatEqualToFloat();
    v9 = v8;
    if (v8 && (BSSelfTaskHasEntitlement() & 1) == 0)
    {
      _UISStateServiceLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v19 = (id)objc_opt_class();
        v20 = 2112;
        v21 = CFSTR("aps-connection-initiate");
        v13 = v19;
        _os_log_error_impl(&dword_190875000, v10, OS_LOG_TYPE_ERROR, "%{public}@: The entitlement %@ is required to use the push keepalive interval", buf, 0x16u);

      }
    }
    -[UISApplicationStateService _dataSourceForApplicationBundleIdentifier:](self, "_dataSourceForApplicationBundleIdentifier:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_get_global_queue(21, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __68__UISApplicationStateService_setNextWakeIntervalSinceReferenceDate___block_invoke;
      v14[3] = &unk_1E2CAF708;
      v16 = v7;
      v17 = v9;
      v14[4] = self;
      v15 = v11;
      dispatch_async(v12, v14);

    }
  }

}

void __68__UISApplicationStateService_setNextWakeIntervalSinceReferenceDate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v2 = (void *)_MergedGlobals_7;
  v28 = _MergedGlobals_7;
  v3 = MEMORY[0x1E0C809B0];
  if (!_MergedGlobals_7)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = (uint64_t)__getAPSConnectionClass_block_invoke;
    v23 = &unk_1E2CAF658;
    v24 = &v25;
    __getAPSConnectionClass_block_invoke((uint64_t)&v20);
    v2 = (void *)v26[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v25, 8);
  v20 = 0;
  v21 = (uint64_t)&v20;
  v22 = 0x2020000000;
  v5 = (_QWORD *)qword_1ECDA58A0;
  v23 = (void *)qword_1ECDA58A0;
  if (!qword_1ECDA58A0)
  {
    v6 = ApplePushServiceLibrary();
    v5 = dlsym(v6, "APSEnvironmentProduction");
    *(_QWORD *)(v21 + 24) = v5;
    qword_1ECDA58A0 = (uint64_t)v5;
  }
  _Block_object_dispose(&v20, 8);
  if (v5)
  {
    objc_msgSend(v4, "keepAliveIntervalForEnvironmentName:", *v5);
    if (*(double *)(a1 + 48) == -1.0)
    {
      v11 = 0;
    }
    else
    {
      if (v7 <= 0.0)
        v8 = 1740.0;
      else
        v8 = v7;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v10 = v8 + v9;
      if (!*(_BYTE *)(a1 + 56) && *(double *)(a1 + 48) < v10)
        v10 = *(double *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = *(void **)(a1 + 40);
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v17[0] = v3;
    v17[1] = 3221225472;
    v17[2] = __68__UISApplicationStateService_setNextWakeIntervalSinceReferenceDate___block_invoke_2;
    v17[3] = &unk_1E2CAF5B8;
    v18 = v12;
    v19 = v11;
    v14 = v11;
    objc_msgSend(v13, "performAsync:", v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAPSEnvironmentProduction(void)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("UISApplicationStateService.m"), 26, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

uint64_t __68__UISApplicationStateService_setNextWakeIntervalSinceReferenceDate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNextWakeDate:", *(_QWORD *)(a1 + 40));
}

- (void)usesBackgroundNetworkWithCompletion:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, _QWORD);

  v10 = (void (**)(id, void *, _QWORD))a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationStateService.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  -[UISApplicationStateService _operatingBundleIdentifier](self, "_operatingBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISApplicationStateService _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:](self, "_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:", v5, CFSTR("get uses background network")))
  {
    -[UISApplicationStateService _dataSourceForApplicationBundleIdentifier:](self, "_dataSourceForApplicationBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v6, "usesBackgroundNetwork");
    else
      v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v8, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E2CAFE80, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, (void *)MEMORY[0x1E0C9AAA0], v6);
  }

}

- (void)setUsesBackgroundNetwork:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[FBSSerialQueue assertOnQueue](self->_calloutQueue, "assertOnQueue");
  -[UISApplicationStateService _operatingBundleIdentifier](self, "_operatingBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISApplicationStateService _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:](self, "_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:description:", v4, CFSTR("set uses background network")))
  {
    v5 = objc_msgSend(v7, "BOOLValue");
    -[UISApplicationStateService _dataSourceForApplicationBundleIdentifier:](self, "_dataSourceForApplicationBundleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setUsesBackgroundNetwork:", v5);

  }
}

- (UISApplicationStateServiceDelegate)delegate
{
  return (UISApplicationStateServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end

@implementation PRUISExternallyHostedPosterEditingService

+ (BOOL)isExternalEditingSupported
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceClass") == 2;

  return v3;
}

+ (id)editingRequestForEntryPoint:(id)a3
{
  return +[PRUISExternallyHostedPosterEntryPointWrapper wrapperWithEntryPoint:](PRUISExternallyHostedPosterEntryPointWrapper, "wrapperWithEntryPoint:", a3);
}

- (PRUISExternallyHostedPosterEditingService)init
{
  PRUISExternallyHostedPosterEditingService *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  BSServiceConnectionClient *serviceConnection;
  BSServiceConnectionClient *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  PRUISExternallyHostedPosterEditingService *v16;
  id v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PRUISExternallyHostedPosterEditingService;
  v2 = -[PRUISExternallyHostedPosterEditingService init](&v20, sel_init);
  if (v2)
  {
    PRUISExternallyHostedPosterEditingServiceInterface();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BE38030];
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointForMachName:service:instance:", CFSTR("com.apple.posterboardui.services"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BE38028], "connectionWithEndpoint:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      serviceConnection = v2->_serviceConnection;
      v2->_serviceConnection = (BSServiceConnectionClient *)v9;

      objc_initWeak(&location, v2);
      v11 = v2->_serviceConnection;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __49__PRUISExternallyHostedPosterEditingService_init__block_invoke;
      v14[3] = &unk_251535D90;
      v15 = v3;
      v16 = v2;
      v17 = v8;
      objc_copyWeak(&v18, &location);
      -[BSServiceConnectionClient configureConnection:](v11, "configureConnection:", v14);
      objc_destroyWeak(&v18);

      objc_destroyWeak(&location);
    }
    else
    {
      PRUISLogRemoteEditing();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PRUISExternallyHostedPosterEditingService init].cold.1((uint64_t)v8, (uint64_t)v2, v12);

    }
  }
  return v2;
}

void __49__PRUISExternallyHostedPosterEditingService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  PRUISDefaultServiceQuality();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_2;
  v9[3] = &unk_251535D40;
  v10 = *(id *)(a1 + 48);
  objc_copyWeak(&v11, (id *)(a1 + 56));
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_4;
  v6[3] = &unk_251535D68;
  v7 = *(id *)(a1 + 48);
  objc_copyWeak(&v8, (id *)(a1 + 56));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
}

void __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  PRUISLogRemoteEditing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = 138543618;
    v6 = v3;
    v7 = 2048;
    v8 = WeakRetained;
    _os_log_impl(&dword_2445ED000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> interrupted", (uint8_t *)&v5, 0x16u);

  }
}

void __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_4(uint64_t a1)
{
  NSObject *v2;

  PRUISLogRemoteEditing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_4_cold_1(a1, v2);

}

- (void)dealloc
{
  objc_super v3;

  -[PRUISExternallyHostedPosterEditingService invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRUISExternallyHostedPosterEditingService;
  -[PRUISExternallyHostedPosterEditingService dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[BSServiceConnectionClient invalidate](self->_serviceConnection, "invalidate");
}

- (void)willEndEditingWithResponse:(id)a3
{
  id v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = v4;
  v5 = v4;
  v6 = WeakRetained;
  BSDispatchMain();

}

uint64_t __72__PRUISExternallyHostedPosterEditingService_willEndEditingWithResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willEndEditingWithResponse:", *(_QWORD *)(a1 + 40));
}

- (void)didEndEditingWithResponse:(id)a3
{
  id v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = v4;
  v5 = v4;
  v6 = WeakRetained;
  BSDispatchMain();

}

uint64_t __71__PRUISExternallyHostedPosterEditingService_didEndEditingWithResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndEditingWithResponse:", *(_QWORD *)(a1 + 40));
}

- (void)beginEditingWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  char isKindOfClass;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  void (**v21)(_QWORD, _QWORD);
  SEL v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  PRUISExternallyHostedPosterEditingService *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRUISExternallyHostedPosterEditingService.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("editingRequest"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRUISExternallyHostedPosterEditingService.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRUISExternallyHostedPosterEditingService.m"), 99, CFSTR("editing request must be the appropriate concrete type"));

  }
  v12 = v7;
  v23 = 0;
  -[PRUISExternallyHostedPosterEditingService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (v13)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __80__PRUISExternallyHostedPosterEditingService_beginEditingWithRequest_completion___block_invoke;
    v20[3] = &unk_251535DB8;
    v22 = a2;
    v20[4] = self;
    v21 = v9;
    objc_msgSend(v13, "beginEditingWithEntryPointWrapper:completion:", v12, v20);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, id))v9)[2](v9, v14);
  }
  if (v14)
  {
    PRUISLogRemoteEditing();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v16;
      v26 = 2114;
      v27 = self;
      v28 = 2114;
      v29 = v14;
      _os_log_error_impl(&dword_2445ED000, v15, OS_LOG_TYPE_ERROR, "calling %{public}@ on %{public}@, error: %{public}@", buf, 0x20u);

    }
  }

}

void __80__PRUISExternallyHostedPosterEditingService_beginEditingWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRUISLogRemoteEditing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __80__PRUISExternallyHostedPosterEditingService_beginEditingWithRequest_completion___block_invoke_cold_1(a1, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)sendRequestDismissalActionWithRequest:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  PRUISExternallyHostedPosterEditingService *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRUISExternallyHostedPosterEditingService.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("editingRequest"));

  }
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRUISExternallyHostedPosterEditingService.m"), 120, CFSTR("editing request must be the appropriate concrete type"));

  }
  v8 = v5;
  v15 = 0;
  -[PRUISExternallyHostedPosterEditingService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
    objc_msgSend(v9, "sendRequestDismissalActionWithEntryPointWrapper:", v8);
  if (v10)
  {
    PRUISLogRemoteEditing();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v12;
      v18 = 2114;
      v19 = self;
      v20 = 2114;
      v21 = v10;
      _os_log_error_impl(&dword_2445ED000, v11, OS_LOG_TYPE_ERROR, "calling %{public}@ on %{public}@, error: %{public}@", buf, 0x20u);

    }
  }

}

- (id)_serviceInterfaceWithError:(id *)a3
{
  BSServiceConnectionClient **p_serviceConnection;
  BSServiceConnectionClient *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  p_serviceConnection = &self->_serviceConnection;
  -[BSServiceConnectionClient activate](self->_serviceConnection, "activate");
  v6 = *p_serviceConnection;
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](v6, "remoteTargetWithLaunchingAssertionAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PRUISLogRemoteEditing();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PRUISExternallyHostedPosterEditingService _serviceInterfaceWithError:].cold.1((uint64_t)self, (uint64_t)p_serviceConnection, v10);

    if (a3)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v13, 1, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v9;
}

- (PRUISExternallyHostedPosterEditingServiceDelegate)delegate
{
  return (PRUISExternallyHostedPosterEditingServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (void)init
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_1_3(&dword_2445ED000, a3, (uint64_t)a3, "%{public}@:%p> failed to lookup endpoint", (uint8_t *)&v3);
}

void __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = 138543618;
  v7 = v3;
  v8 = 2048;
  v9 = WeakRetained;
  OUTLINED_FUNCTION_1_3(&dword_2445ED000, a2, v5, "<%{public}@:%p> remotely invalidated", (uint8_t *)&v6);

  OUTLINED_FUNCTION_0_1();
}

void __80__PRUISExternallyHostedPosterEditingService_beginEditingWithRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_2445ED000, a2, OS_LOG_TYPE_DEBUG, "received reply to %{public}@ on %{public}@", v4, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

- (void)_serviceInterfaceWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(&dword_2445ED000, a3, v6, "%{public}@ failed to create proxy for connection: %{public}@", v7);

  OUTLINED_FUNCTION_0_1();
}

@end

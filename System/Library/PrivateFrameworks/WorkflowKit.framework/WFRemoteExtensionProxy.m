@implementation WFRemoteExtensionProxy

- (WFRemoteExtensionProxy)initWithConnection:(id)a3 andDevice:(id)a4
{
  id v8;
  id v9;
  WFRemoteExtensionProxy *v10;
  WFRemoteExtensionProxy *v11;
  uint64_t v12;
  SARemoteDevice *remoteDevice;
  WFRemoteExtensionProxy *v14;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExtensionProxy.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFRemoteExtensionProxy;
  v10 = -[WFRemoteExtensionProxy init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_connection, a3);
    v12 = objc_msgSend(v9, "copy");
    remoteDevice = v11->_remoteDevice;
    v11->_remoteDevice = (SARemoteDevice *)v12;

    v14 = v11;
  }

  return v11;
}

- (void)handleIntentRemotelyWithRemoteOperation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  WFRemoteExtensionProxy *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFRemoteExtensionProxy connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "_executionContext") == 2)
    objc_msgSend(v9, "_setExecutionContext:", 9);
  getWFIntentExecutionLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v20 = "-[WFRemoteExtensionProxy handleIntentRemotelyWithRemoteOperation:completion:]";
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s WFRemoteExtensionProxy is handling remote intent operation (%{public}@)", buf, 0x16u);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_2;
  v15[3] = &unk_1E7AF4DE0;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v9, "_injectProxiesForImages:completion:", &__block_literal_global_47097, v15);

}

- (void)confirmIntentWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  kdebug_trace();
  v5 = objc_alloc_init(MEMORY[0x1E0D88128]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__WFRemoteExtensionProxy_confirmIntentWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E7AF4E08;
  v8 = v4;
  v6 = v4;
  -[WFRemoteExtensionProxy handleIntentRemotelyWithRemoteOperation:completion:](self, "handleIntentRemotelyWithRemoteOperation:completion:", v5, v7);

}

- (void)handleIntentWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  kdebug_trace();
  v5 = objc_alloc_init(MEMORY[0x1E0D88130]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__WFRemoteExtensionProxy_handleIntentWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E7AF4E08;
  v8 = v4;
  v6 = v4;
  -[WFRemoteExtensionProxy handleIntentRemotelyWithRemoteOperation:completion:](self, "handleIntentRemotelyWithRemoteOperation:completion:", v5, v7);

}

- (void)resolveIntentSlotKeyPath:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)resolveIntentSlotKeyPaths:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[WFRemoteExtensionProxy connection](self, "connection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, void *, _QWORD))a4 + 2))(v6, 1, v7, 0);

}

- (INCExtensionConnection)connection
{
  return self->_connection;
}

- (SARemoteDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __60__WFRemoteExtensionProxy_handleIntentWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return kdebug_trace();
}

uint64_t __61__WFRemoteExtensionProxy_confirmIntentWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return kdebug_trace();
}

void __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a2;
  objc_msgSend(a1[4], "wf_setIntent:", v3);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__47100;
  v15[4] = __Block_byref_object_dispose__47101;
  v16 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v4 = (void *)getAFClientLiteClass_softClass;
  v21 = getAFClientLiteClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getAFClientLiteClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getAFClientLiteClass_block_invoke;
    v17[3] = &unk_1E7AF9520;
    v17[4] = &v18;
    __getAFClientLiteClass_block_invoke((uint64_t)v17);
    v4 = (void *)v19[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v18, 8);
  v7 = (void *)objc_opt_new();
  v8 = a1[4];
  objc_msgSend(a1[5], "remoteDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = 3221225472;
  v14[2] = __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_7;
  v14[3] = &unk_1E7AF4D90;
  v14[4] = v15;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_2_9;
  v10[3] = &unk_1E7AF4DB8;
  v13 = v15;
  v14[0] = v5;
  v11 = a1[4];
  v12 = a1[6];
  +[WFACEUtilities wf_handleCommand:onRemoteDevice:usingClient:commandHandler:completion:](WFACEUtilities, "wf_handleCommand:onRemoteDevice:usingClient:commandHandler:completion:", v8, v9, v7, v14, v10);

  _Block_object_dispose(v15, 8);
}

uint64_t __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
}

void __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_2_9(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id)*MEMORY[0x1E0D3E578];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ins_aceIntentResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getWFIntentExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315906;
    v13 = "-[WFRemoteExtensionProxy handleIntentRemotelyWithRemoteOperation:completion:]_block_invoke_2";
    v14 = 2114;
    v15 = v10;
    v16 = 1024;
    v17 = a2;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s WFRemoteExtensionProxy finished handling remote intent operation (%{public}@), success %d error %{public}@", (uint8_t *)&v12, 0x26u);

  }
  if (v7)
    v11 = 0;
  else
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E538]), "initWithErrorCode:underlyingError:", 1316, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end

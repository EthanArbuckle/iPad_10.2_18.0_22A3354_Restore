@implementation RTIInputSystemServiceSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_defaultRequest, 0);
  objc_storeStrong((id *)&self->_pendingRTISupplementalLexicons, 0);
  objc_storeStrong((id *)&self->_pendingSupplementalLexicons, 0);
  objc_storeStrong((id *)&self->_rtiSupplementalLexicons, 0);
  objc_storeStrong((id *)&self->_supplementalLexicons, 0);
  objc_storeStrong((id *)&self->_externalOperationsQueue, 0);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  Connection is nil in session dealloc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)beginRemoteTextInputSessionWithID:(id)a3 options:(id)a4 documentTraits:(id)a5 initialDocumentState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *externalOperationsQueue;
  uint64_t v16;
  id v17;
  NSObject *internalQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  RTIInputSessionChangeLogFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[RTIInputSystemServiceSession beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:]";
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_1991A8000, v14, OS_LOG_TYPE_DEFAULT, "%s  Begin input session: %@", buf, 0x16u);
  }

  externalOperationsQueue = self->_externalOperationsQueue;
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke;
  block[3] = &unk_1E35C2660;
  block[4] = self;
  v17 = v11;
  v29 = v17;
  dispatch_async(externalOperationsQueue, block);
  self->_lifecycleDispatchState = 1;
  internalQueue = self->_internalQueue;
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_3;
  v23[3] = &unk_1E35C2728;
  v23[4] = self;
  v24 = v10;
  v25 = v17;
  v26 = v12;
  v27 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v17;
  v22 = v10;
  dispatch_async(internalQueue, v23);

}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "setUuid:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setBeginOptions:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setDocumentTraits:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setDocumentState:", *(_QWORD *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_4;
  v10[3] = &unk_1E35C2660;
  v10[4] = v2;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:", v10);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_6;
  v9[3] = &unk_1E35C26D8;
  v9[4] = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 96);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_7;
  v8[3] = &unk_1E35C2700;
  v8[4] = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");

}

- (void)_updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[RTIInputSystemServiceSession bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTIInputSystemServiceSession pid](self, "pid");
  -[RTIInputSystemServiceSession valueForEntitlement:](self, "valueForEntitlement:", CFSTR("application-identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v8 = (void *)getLSApplicationProxyClass_softClass;
  v25 = getLSApplicationProxyClass_softClass;
  if (!getLSApplicationProxyClass_softClass)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __getLSApplicationProxyClass_block_invoke;
    v21[3] = &unk_1E35C2908;
    v21[4] = &v22;
    __getLSApplicationProxyClass_block_invoke((uint64_t)v21);
    v8 = (void *)v23[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v9, "applicationProxyForIdentifier:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C9AAC8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0C9AAC8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectsForInfoDictionaryKeys:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTIInputSystemSession documentTraits](self, "documentTraits");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAppId:", v7);

  -[RTIInputSystemSession documentTraits](self, "documentTraits");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBundleId:", v5);

  -[RTIInputSystemSession documentTraits](self, "documentTraits");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAppName:", v15);

  -[RTIInputSystemSession documentTraits](self, "documentTraits");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocalizedAppName:", v11);

  -[RTIInputSystemSession documentTraits](self, "documentTraits");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setProcessId:", v6);

  v4[2](v4);
}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_5;
  v2[3] = &unk_1E35C26B0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "enumerateSessionDelegatesUsingBlock:", v2);

}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_2;
  v2[3] = &unk_1E35C26B0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "enumerateSessionDelegatesUsingBlock:", v2);

}

uint64_t __59__RTIInputSystemServiceSession__killConnectionWithCallback__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__RTIInputSystemServiceSession__killConnectionWithCallback__block_invoke_2;
  v3[3] = &unk_1E35C24F8;
  v3[4] = v1;
  return objc_msgSend(v1, "enumerateSessionDelegatesUsingBlock:", v3);
}

void __59__RTIInputSystemServiceSession__killConnectionWithCallback__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inputSessionDidDie:", *(_QWORD *)(a1 + 32));

}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "inputSessionDidBegin:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "inputSessionDidBegin:", *(_QWORD *)(a1 + 32));
  }

}

void __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "prepareForInputSession:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (RTIInputSystemServiceSession)initWithConnection:(id)a3
{
  id v4;
  RTIInputSystemServiceSession *v5;
  RTIInputSystemServiceSession *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *externalOperationsQueue;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTIInputSystemServiceSession;
  v5 = -[RTIInputSystemServiceSession init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_payloadVersion = 1;
    objc_storeWeak((id *)&v5->_connection, v4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.RemoteTextInput.RTIInputSystemServiceSession.Internal", v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.RemoteTextInput.RTIInputSystemServiceSession.External", v7);
    externalOperationsQueue = v6->_externalOperationsQueue;
    v6->_externalOperationsQueue = (OS_dispatch_queue *)v10;

    v6->_lifecycleDispatchState = 0;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE347800);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v12);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE348650);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v13);

    objc_msgSend(v4, "setExportedObject:", v6);
    objc_initWeak(&location, v6);
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__RTIInputSystemServiceSession_initWithConnection___block_invoke;
    v20[3] = &unk_1E35C2598;
    objc_copyWeak(&v21, &location);
    v15 = (void *)MEMORY[0x19AEBCCAC](v20);
    objc_msgSend(v4, "setInterruptionHandler:", v15);
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __51__RTIInputSystemServiceSession_initWithConnection___block_invoke_91;
    v18[3] = &unk_1E35C2598;
    objc_copyWeak(&v19, &location);
    v16 = (void *)MEMORY[0x19AEBCCAC](v18);
    objc_msgSend(v4, "setInvalidationHandler:", v16);
    -[RTIInputSystemServiceSession didInitializeWithConnection:](v6, "didInitializeWithConnection:", v4);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v6;
}

void __51__RTIInputSystemServiceSession_initWithConnection___block_invoke_91(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    RTIInputSessionChangeLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315394;
      v4 = "-[RTIInputSystemServiceSession initWithConnection:]_block_invoke";
      v5 = 2112;
      v6 = WeakRetained;
      _os_log_impl(&dword_1991A8000, v2, OS_LOG_TYPE_DEFAULT, "%s  service session connection was invalidated: %@", (uint8_t *)&v3, 0x16u);
    }

    objc_msgSend(WeakRetained, "_killConnectionWithCallback");
  }

}

- (void)_killConnectionWithCallback
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTIInputSystemServiceSession__killConnectionWithCallback__block_invoke;
  block[3] = &unk_1E35C25C0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __83__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inputSession:performInputOperation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __83__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation___block_invoke_2;
    v5[3] = &unk_1E35C26B0;
    v5[4] = v4;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "enumerateSessionDelegatesUsingBlock:", v5);

  }
}

void __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 56) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_3;
    v6[3] = &unk_1E35C25C0;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v3, "inputSessionDidEnd:options:completion:", v5, v4, v6);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "inputSessionDidEnd:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "inputSessionDidEnd:", *(_QWORD *)(a1 + 40));
  }

}

void __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  dispatch_group_t v4;
  dispatch_time_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  RTIDocumentState *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) != 0)
  {
    v4 = dispatch_group_create();
    v5 = dispatch_time(0, 2100000000);
    v6 = *(void **)(a1 + 32);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_2;
    v23 = &unk_1E35C2778;
    v27 = *(id *)(a1 + 56);
    v7 = v4;
    v8 = *(_QWORD *)(a1 + 32);
    v24 = v7;
    v25 = v8;
    v26 = *(id *)(a1 + 48);
    objc_msgSend(v6, "enumerateSessionDelegatesUsingBlock:", &v20);
    if (*(_QWORD *)(a1 + 56))
    {
      if (dispatch_group_wait(v7, v5))
      {
        RTIInputSessionChangeLogFacility();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_cold_1();

      }
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v9, v10, v11, v12, v13);
    }
    objc_msgSend(*(id *)(a1 + 32), "documentTraits", v20, v21, v22, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textInputTraits");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "secureTextEntry");

    if (v17)
    {
      v18 = objc_alloc_init(RTIDocumentState);
      objc_msgSend(*(id *)(a1 + 32), "setDocumentState:", v18);

    }
  }
  else
  {
    v19 = *(_QWORD *)(a1 + 56);
    if (v19)
      (*(void (**)(void))(v19 + 16))();
  }
}

- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation___block_invoke;
  block[3] = &unk_1E35C2750;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  RTIInputSessionChangeLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[RTIInputSystemServiceSession endRemoteTextInputSessionWithID:options:completion:]";
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1991A8000, v11, OS_LOG_TYPE_DEFAULT, "%s  End input session: %@", buf, 0x16u);
  }

  -[RTIInputSystemSession uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v8);

  if (v13)
    self->_lifecycleDispatchState = 2;
  internalQueue = self->_internalQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke;
  v18[3] = &unk_1E35C27A0;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  dispatch_async(internalQueue, v18);

}

- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4
{
  -[RTIInputSystemServiceSession endRemoteTextInputSessionWithID:options:completion:](self, "endRemoteTextInputSessionWithID:options:completion:", a3, a4, 0);
}

+ (id)sessionWithConnection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConnection:", v4);

  return v5;
}

void __51__RTIInputSystemServiceSession_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    RTIInputSessionChangeLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __51__RTIInputSystemServiceSession_initWithConnection___block_invoke_cold_1();

    objc_msgSend(WeakRetained, "_killConnectionWithCallback");
  }

}

- (int)pid
{
  id WeakRetained;
  void *v3;
  pid_t v4;
  audit_token_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "auditToken");
    v4 = audit_token_to_pid(&v6);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)bundleIdentifier
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;

  v14 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "auditToken");
    if (CPCopyBundleIdentifierAndTeamFromAuditToken())
      v4 = v14;
    else
      v4 = 0;
  }
  else
  {
    RTIInputSessionChangeLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemServiceSession bundleIdentifier].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    v4 = 0;
  }

  return v4;
}

- (id)valueForEntitlement:(id)a3
{
  __CFString *v4;
  id WeakRetained;
  void *v6;
  __SecTask *v7;
  __SecTask *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFErrorRef error;
  audit_token_t token;

  v4 = (__CFString *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6 = WeakRetained;
  if (!WeakRetained)
  {
    RTIInputSessionChangeLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemServiceSession valueForEntitlement:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_11;
  }
  objc_msgSend(WeakRetained, "auditToken");
  v7 = SecTaskCreateWithAuditToken(0, &token);
  if (!v7)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v8 = v7;
  error = 0;
  v9 = (void *)SecTaskCopyValueForEntitlement(v7, v4, &error);
  if (error)
  {
    RTILogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemServiceSession valueForEntitlement:].cold.2();

    CFRelease(error);
  }
  CFRelease(v8);
LABEL_12:

  return v9;
}

- (void)flushOperations
{
  NSObject *internalQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTIInputSystemServiceSession_flushOperations__block_invoke;
  block[3] = &unk_1E35C25C0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __47__RTIInputSystemServiceSession_flushOperations__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "textOperations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(WeakRetained, "remoteObjectProxy");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "textOperations");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performTextOperations:", v5);

      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "textOperations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "documentState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_applyLocalTextOperations:toDocumentState:", v7, v8);

      objc_msgSend(*(id *)(a1 + 32), "setTextOperations:", 0);
    }
  }
  else
  {
    RTIInputSessionChangeLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __47__RTIInputSystemServiceSession_flushOperations__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (void)flushOperationsWithResultHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke;
  block[3] = &unk_1E35C2610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "textOperations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke_97;
      v18[3] = &unk_1E35C25E8;
      v19 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "remoteObjectProxyWithErrorHandler:", v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "textOperations");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performTextOperations:resultHandler:", v5, *(_QWORD *)(a1 + 40));

      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "textOperations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "documentState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_applyLocalTextOperations:toDocumentState:", v7, v8);

      objc_msgSend(*(id *)(a1 + 32), "setTextOperations:", 0);
    }
  }
  else
  {
    RTIInputSessionChangeLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
      (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, 0);
  }

}

void __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  RTIInputSessionChangeLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke_97_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

- (RTIDocumentRequest)defaultRequest
{
  NSObject *internalQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__RTIInputSystemServiceSession_defaultRequest__block_invoke;
  v6[3] = &unk_1E35C2638;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(internalQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (RTIDocumentRequest *)v4;
}

void __46__RTIInputSystemServiceSession_defaultRequest__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

- (void)setDefaultRequest:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTIInputSystemServiceSession_setDefaultRequest___block_invoke;
  block[3] = &unk_1E35C2660;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __50__RTIInputSystemServiceSession_setDefaultRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateDefaultDocumentRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));

  }
  else
  {
    RTIInputSessionChangeLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __50__RTIInputSystemServiceSession_setDefaultRequest___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke;
  block[3] = &unk_1E35C2688;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(internalQueue, block);

}

void __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 40);
    if (!v3)
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_99;
    v15[3] = &unk_1E35C25E8;
    v16 = *(id *)(a1 + 48);
    v4 = v3;
    objc_msgSend(WeakRetained, "remoteObjectProxyWithErrorHandler:", v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performDocumentRequest:completion:", v4, *(_QWORD *)(a1 + 48));

  }
  else
  {
    RTIInputSessionChangeLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
  }

}

void __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  RTIInputSessionChangeLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_99_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

- (NSSet)supplementalLexicons
{
  return (NSSet *)self->_supplementalLexicons;
}

- (NSSet)rtiSupplementalLexicons
{
  return (NSSet *)self->_rtiSupplementalLexicons;
}

- (RTIDataPayload)currentDataPayload
{
  void *v3;
  NSObject *internalQueue;
  id v5;
  RTIDataPayload *v6;
  _QWORD v8[4];
  id v9;
  RTIInputSystemServiceSession *v10;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  +[RTIInputSystemDataPayload payloadWithData:version:](RTIInputSystemDataPayload, "payloadWithData:version:", 0, -[RTIInputSystemServiceSession payloadVersion](self, "payloadVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__RTIInputSystemServiceSession_currentDataPayload__block_invoke;
  v8[3] = &unk_1E35C2660;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(internalQueue, v8);
  v6 = (RTIDataPayload *)v5;

  return v6;
}

uint64_t __50__RTIInputSystemServiceSession_currentDataPayload__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 40), "documentTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDocumentTraits:", v2);

  objc_msgSend(*(id *)(a1 + 40), "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDocumentState:", v3);

  objc_msgSend(*(id *)(a1 + 40), "_textOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTextOperations:", v4);

  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSessionUUID:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "updateData");
}

- (void)beginRemoteTextInputSessionWithID:(id)a3 documentTraits:(id)a4 initialDocumentState:(id)a5
{
  -[RTIInputSystemServiceSession beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:](self, "beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:", a3, 0, a4, a5);
}

uint64_t __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sessionWithID:didAddSupplementalLexicon:", a2, a3);
}

uint64_t __110__RTIInputSystemServiceSession_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sessionWithID:didAddRTISupplementalLexicon:", a2, a3);
}

- (void)remoteTextInputSessionWithID:(id)a3 documentDidChange:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentDidChange___block_invoke;
  block[3] = &unk_1E35C2750;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __79__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(*(id *)(a1 + 32), "setDocumentState:", v4);

    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentDidChange___block_invoke_2;
    v6[3] = &unk_1E35C26B0;
    v6[4] = v5;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v5, "enumerateSessionDelegatesUsingBlock:", v6);

  }
}

void __79__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inputSession:documentStateDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)endRemoteTextInputSessionWithID:(id)a3
{
  -[RTIInputSystemServiceSession endRemoteTextInputSessionWithID:options:](self, "endRemoteTextInputSessionWithID:options:", a3, 0);
}

void __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)remoteTextInputSessionWithID:(id)a3 documentTraitsDidChange:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke;
  block[3] = &unk_1E35C2750;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_2;
    v11[3] = &unk_1E35C25C0;
    v11[4] = *(_QWORD *)(a1 + 32);
    v5 = (void (**)(_QWORD))MEMORY[0x19AEBCCAC](v11);
    objc_msgSend(*(id *)(a1 + 32), "documentTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "documentTraits");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "copyContextualPropertiesFromDocumentTraits:", *(_QWORD *)(a1 + 48));

      v5[2](v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setDocumentTraits:", *(_QWORD *)(a1 + 48));
      v8 = *(void **)(a1 + 32);
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_4;
      v9[3] = &unk_1E35C27C8;
      v10 = v5;
      objc_msgSend(v8, "_updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:", v9);

    }
  }
}

uint64_t __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_3;
  v3[3] = &unk_1E35C24F8;
  v3[4] = v1;
  return objc_msgSend(v1, "enumerateSessionDelegatesUsingBlock:", v3);
}

void __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "documentTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputSession:documentTraitsDidChange:", v3, v4);

  }
}

uint64_t __85__RTIInputSystemServiceSession_remoteTextInputSessionWithID_documentTraitsDidChange___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remoteTextInputSessionWithID:(id)a3 didChangePause:(BOOL)a4 withReason:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  RTILogFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didChangePause:withReason:]";
    v20 = 2112;
    v21 = v8;
    v22 = 1024;
    v23 = v6;
    _os_log_impl(&dword_1991A8000, v10, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ did change pause: %d", buf, 0x1Cu);
  }

  internalQueue = self->_internalQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didChangePause_withReason___block_invoke;
  v14[3] = &unk_1E35C2818;
  v14[4] = self;
  v15 = v8;
  v17 = v6;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(internalQueue, v14);

}

void __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didChangePause_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsPaused:", *(unsigned __int8 *)(a1 + 56));
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didChangePause_withReason___block_invoke_2;
    v5[3] = &unk_1E35C27F0;
    v5[4] = v4;
    v7 = *(_BYTE *)(a1 + 56);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "enumerateSessionDelegatesUsingBlock:", v5);

  }
}

void __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didChangePause_withReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inputSession:didChangePause:withReason:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 textSuggestionsChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  RTILogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:textSuggestionsChanged:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1991A8000, v8, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ text suggestions changed", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__RTIInputSystemServiceSession_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke;
  block[3] = &unk_1E35C2750;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(internalQueue, block);

}

void __84__RTIInputSystemServiceSession_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __84__RTIInputSystemServiceSession_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke_2;
    v5[3] = &unk_1E35C26B0;
    v5[4] = v4;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "enumerateSessionDelegatesUsingBlock:", v5);

  }
}

void __84__RTIInputSystemServiceSession_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inputSession:textSuggestionsChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 didAddSupplementalLexicon:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  RTILogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didAddSupplementalLexicon:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1991A8000, v8, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ didAddSupplementalLexicon", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didAddSupplementalLexicon___block_invoke;
  block[3] = &unk_1E35C2750;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_async(internalQueue, block);

}

uint64_t __87__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didAddSupplementalLexicon___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_queue_sessionWithID:didAddSupplementalLexicon:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v5 = (void *)v3[11];
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 88);
    *(_QWORD *)(v7 + 88) = v6;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  }
  return objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_sessionWithID:(id)a3 didAddSupplementalLexicon:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSMutableSet *supplementalLexicons;
  NSMutableSet *v10;
  NSMutableSet *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v12 = a4;
  v6 = a3;
  -[RTIInputSystemSession uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if (v8)
  {
    supplementalLexicons = self->_supplementalLexicons;
    if (!supplementalLexicons)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v11 = self->_supplementalLexicons;
      self->_supplementalLexicons = v10;

      supplementalLexicons = self->_supplementalLexicons;
    }
    -[NSMutableSet addObject:](supplementalLexicons, "addObject:", v12);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__RTIInputSystemServiceSession__queue_sessionWithID_didAddSupplementalLexicon___block_invoke;
    v13[3] = &unk_1E35C26B0;
    v13[4] = self;
    v14 = v12;
    -[RTIInputSystemSession enumerateSessionDelegatesUsingBlock:](self, "enumerateSessionDelegatesUsingBlock:", v13);

  }
}

void __79__RTIInputSystemServiceSession__queue_sessionWithID_didAddSupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inputSession:didAddSupplementalLexicon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  RTILogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didAddRTISupplementalLexicon:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1991A8000, v8, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ didAddRTISupplementalLexicon", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didAddRTISupplementalLexicon___block_invoke;
  block[3] = &unk_1E35C2750;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_async(internalQueue, block);

}

uint64_t __90__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didAddRTISupplementalLexicon___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_queue_sessionWithID:didAddRTISupplementalLexicon:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v5 = (void *)v3[12];
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 96);
    *(_QWORD *)(v7 + 96) = v6;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  }
  return objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_sessionWithID:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSMutableSet *rtiSupplementalLexicons;
  NSMutableSet *v10;
  NSMutableSet *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v12 = a4;
  v6 = a3;
  -[RTIInputSystemSession uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if (v8)
  {
    rtiSupplementalLexicons = self->_rtiSupplementalLexicons;
    if (!rtiSupplementalLexicons)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v11 = self->_rtiSupplementalLexicons;
      self->_rtiSupplementalLexicons = v10;

      rtiSupplementalLexicons = self->_rtiSupplementalLexicons;
    }
    -[NSMutableSet addObject:](rtiSupplementalLexicons, "addObject:", v12);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__RTIInputSystemServiceSession__queue_sessionWithID_didAddRTISupplementalLexicon___block_invoke;
    v13[3] = &unk_1E35C26B0;
    v13[4] = self;
    v14 = v12;
    -[RTIInputSystemSession enumerateSessionDelegatesUsingBlock:](self, "enumerateSessionDelegatesUsingBlock:", v13);

  }
}

void __82__RTIInputSystemServiceSession__queue_sessionWithID_didAddRTISupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inputSession:didAddRTISupplementalLexicon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 didRemoveSupplementalLexiconWithIdentifier:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *internalQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  RTILogFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didRemoveSupplementalLexiconWithIdentifier:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1991A8000, v7, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ didRemoveSupplementalLexiconWithIdentifier", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke;
  block[3] = &unk_1E35C2890;
  block[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  dispatch_async(internalQueue, block);

}

void __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = 0;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke_2;
    v9[3] = &unk_1E35C2840;
    v6 = *(_QWORD *)(a1 + 48);
    v9[4] = &v10;
    v9[5] = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    if (v11[5])
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:");
      v7 = *(void **)(a1 + 32);
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke_3;
      v8[3] = &unk_1E35C2868;
      v8[4] = v7;
      v8[5] = &v10;
      objc_msgSend(v7, "enumerateSessionDelegatesUsingBlock:", v8);
    }
    _Block_object_dispose(&v10, 8);

  }
}

void __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "identifier") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __104__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inputSession:didRemoveSupplementalLexicon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 didRemoveRTISupplementalLexiconWithIdentifier:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *internalQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  RTILogFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[RTIInputSystemServiceSession remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1991A8000, v7, OS_LOG_TYPE_DEFAULT, "%s  Input session: %@ didRemoveRTISupplementalLexiconWithIdentifier", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke;
  block[3] = &unk_1E35C2890;
  block[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  dispatch_async(internalQueue, block);

}

void __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = 0;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke_2;
    v9[3] = &unk_1E35C28B8;
    v6 = *(_QWORD *)(a1 + 48);
    v9[4] = &v10;
    v9[5] = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    if (v11[5])
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:");
      v7 = *(void **)(a1 + 32);
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke_3;
      v8[3] = &unk_1E35C2868;
      v8[4] = v7;
      v8[5] = &v10;
      objc_msgSend(v7, "enumerateSessionDelegatesUsingBlock:", v8);
    }
    _Block_object_dispose(&v10, 8);

  }
}

void __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "identifier") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __107__RTIInputSystemServiceSession_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "inputSession:didRemoveRTISupplementalLexicon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke;
  v15[3] = &unk_1E35C27A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

void __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke(id *a1)
{
  void *v2;
  char v3;
  id v4;
  void (**v5)(id, uint64_t);
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;

  objc_msgSend(a1[4], "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", a1[5]);

  if ((v3 & 1) != 0)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    v4 = a1[4];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2;
    v6[3] = &unk_1E35C28E0;
    v6[4] = v4;
    v7 = a1[6];
    v9 = a1[7];
    v10 = v11;
    v8 = a1[5];
    objc_msgSend(v4, "enumerateSessionDelegatesUsingBlock:", v6);

    _Block_object_dispose(v11, 8);
  }
  else
  {
    v5 = (void (**)(id, uint64_t))a1[7];
    if (v5)
      v5[2](v5, 128);
  }
}

void __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "inputSession:performInputOperation:withResponse:", a1[4], a1[5], a1[7]);
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) && a1[7])
  {
    RTILogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2_cold_1();

    (*(void (**)(void))(a1[7] + 16))();
  }

}

- (void)handleTextActionPayload:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t payloadVersion;
  unint64_t v8;
  unint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  NSObject *internalQueue;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTIInputSystemDataPayload payloadWithData:version:](RTIInputSystemDataPayload, "payloadWithData:version:", v6, objc_msgSend(v4, "version"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  payloadVersion = self->_payloadVersion;
  v8 = objc_msgSend(v4, "version");
  if (payloadVersion >= v8)
    v9 = v8;
  else
    v9 = payloadVersion;
  self->_payloadVersion = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    if (objc_msgSend(v5, "version") == 1)
    {
      objc_msgSend(v5, "textOperations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(WeakRetained, "remoteObjectProxy");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "textOperations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "performTextOperations:", v13);

        internalQueue = self->_internalQueue;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __56__RTIInputSystemServiceSession_handleTextActionPayload___block_invoke;
        v23[3] = &unk_1E35C2660;
        v23[4] = self;
        v24 = v5;
        dispatch_async(internalQueue, v23);

      }
    }
  }
  else
  {
    RTIInputSessionChangeLogFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemServiceSession handleTextActionPayload:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
}

void __56__RTIInputSystemServiceSession_handleTextActionPayload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "textOperations");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_applyLocalTextOperations:toDocumentState:", v4, v3);

}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (unint64_t)payloadVersion
{
  return self->_payloadVersion;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

void __51__RTIInputSystemServiceSession_initWithConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  service session connection was interrupted: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)bundleIdentifier
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  Connection is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)valueForEntitlement:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  Connection is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)valueForEntitlement:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Cannot obtain entitlement: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __47__RTIInputSystemServiceSession_flushOperations__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  Connection is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  Connection is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __65__RTIInputSystemServiceSession_flushOperationsWithResultHandler___block_invoke_97_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Error sending -[connection.remoteObjectProxy performTextOperations:resultHandler:] message: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __50__RTIInputSystemServiceSession_setDefaultRequest___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  Connection is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  Connection is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __66__RTIInputSystemServiceSession_performDocumentRequest_completion___block_invoke_99_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Error sending -[client performDocumentRequest:completion:] message: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __83__RTIInputSystemServiceSession_endRemoteTextInputSessionWithID_options_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Timeout while waiting to end session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __96__RTIInputSystemServiceSession_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  No delegates for session: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)handleTextActionPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  Connection is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end

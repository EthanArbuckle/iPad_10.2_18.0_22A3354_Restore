@implementation VSSpeechConnection

- (VSSpeechConnection)init
{
  VSSpeechConnection *v2;
  VSSpeechConnectionDelegateWrapper *v3;
  VSSpeechConnectionDelegateWrapper *delegateWrapper;
  dispatch_queue_t v5;
  OS_dispatch_queue *threadSafeQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSSpeechConnection;
  v2 = -[VSSpeechConnection init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSSpeechConnectionDelegateWrapper);
    delegateWrapper = v2->_delegateWrapper;
    v2->_delegateWrapper = v3;

    -[VSSpeechConnectionDelegateWrapper setConnection:](v2->_delegateWrapper, "setConnection:", v2);
    v5 = dispatch_queue_create("com.apple.voiceservices.xpcconnection", 0);
    threadSafeQueue = v2->_threadSafeQueue;
    v2->_threadSafeQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  VSSpeechConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_DEFAULT, "Closing xpc connection %p", buf, 0xCu);
  }

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)VSSpeechConnection;
  -[VSSpeechConnection dealloc](&v4, sel_dealloc);
}

- (NSXPCConnection)xpcConnection
{
  NSObject *threadSafeQueue;
  _QWORD block[5];

  threadSafeQueue = self->_threadSafeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__VSSpeechConnection_xpcConnection__block_invoke;
  block[3] = &unk_1EA8AFFB8;
  block[4] = self;
  dispatch_sync(threadSafeQueue, block);
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  id v4;
  NSObject *threadSafeQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  threadSafeQueue = self->_threadSafeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VSSpeechConnection_setXpcConnection___block_invoke;
  block[3] = &unk_1EA8AFFE0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(threadSafeQueue, block);

}

- (id)_remoteObject
{
  void *v2;
  void *v3;

  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_remoteObjectSync
{
  void *v2;
  void *v3;

  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3005);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_remoteObjectWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_connectionInvalidated
{
  VSSpeechConnectionDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), -9, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "requests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "audioRequests");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (!v13)
      {
LABEL_8:
        -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "requests");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = MEMORY[0x1E0C809B0];
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __44__VSSpeechConnection__connectionInvalidated__block_invoke;
        v52[3] = &unk_1EA8B0048;
        v52[4] = self;
        v34 = v5;
        v53 = v34;
        objc_msgSend(v32, "enumerateObjectsUsingBlock:", v52);

        -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "audioRequests");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v33;
        v50[1] = 3221225472;
        v50[2] = __44__VSSpeechConnection__connectionInvalidated__block_invoke_2;
        v50[3] = &unk_1EA8B0070;
        v50[4] = self;
        v37 = v34;
        v51 = v37;
        objc_msgSend(v36, "enumerateObjectsUsingBlock:", v50);

        -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "concurrentSynthesisRequests");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v33;
        v48[1] = 3221225472;
        v48[2] = __44__VSSpeechConnection__connectionInvalidated__block_invoke_3;
        v48[3] = &unk_1EA8B0098;
        v48[4] = self;
        v49 = v37;
        v40 = v37;
        objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v48);

        v41 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v41, "connection:invalidatedWithError:", self, v40);

        goto LABEL_9;
      }
      -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "audioRequests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v11;
    objc_msgSend(v11, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "siriRequestId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0D9A5A0]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4294967287);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setErrorCodes:", v19);

      v20 = objc_alloc_init(MEMORY[0x1E0D9A570]);
      objc_msgSend(v20, "setFailed:", v17);
      v21 = objc_alloc(MEMORY[0x1E0D9A500]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithNSUUID:", v22);
      objc_msgSend(v20, "setContextId:", v23);

      v24 = objc_alloc_init(MEMORY[0x1E0D9A560]);
      objc_msgSend(v24, "setSpeechContext:", v20);
      v25 = objc_alloc_init(MEMORY[0x1E0D9A568]);
      objc_msgSend(v24, "setEventMetadata:", v25);

      v26 = objc_alloc(MEMORY[0x1E0D9A500]);
      objc_msgSend(MEMORY[0x1E0D978A0], "derivedIdentifierForComponentName:fromSourceIdentifier:", 13, v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithNSUUID:", v27);
      objc_msgSend(v24, "eventMetadata");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTtsId:", v28);

      objc_msgSend(MEMORY[0x1E0D978A0], "sharedStream");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "emitMessage:", v24);

    }
    goto LABEL_8;
  }
LABEL_9:
  -[VSSpeechConnection setXpcConnection:](self, "setXpcConnection:", 0);
  -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "requests");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "removeAllObjects");

  -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "audioRequests");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "removeAllObjects");

  -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "concurrentSynthesisRequests");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "removeAllObjects");

}

- (id)currentRequest
{
  void *v2;
  void *v3;
  void *v4;

  -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentAudioRequest
{
  void *v2;
  void *v3;
  void *v4;

  -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  VSSpeechConnectionDelegateWrapper *delegateWrapper;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    delegateWrapper = self->_delegateWrapper;
    v7 = v5;
    -[VSSpeechConnectionDelegateWrapper setDelegate:](delegateWrapper, "setDelegate:", obj);

  }
}

- (void)setKeepActive:(BOOL)a3
{
  _BOOL8 v3;
  NSString *identifier;

  if (self->_keepActive != a3)
  {
    v3 = a3;
    self->_keepActive = a3;
    identifier = self->_identifier;
    if (identifier)
      -[VSSpeechConnection updateWithConnectionIdentifier:keepActive:](self, "updateWithConnectionIdentifier:keepActive:", identifier, v3);
  }
}

- (void)updateWithConnectionIdentifier:(id)a3 keepActive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[VSSpeechConnection _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", &__block_literal_global_174);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithConnectionIdentifier:keepActive:", v6, v4);

}

- (void)prewarmIfNeededWithRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__VSSpeechConnection_prewarmIfNeededWithRequest_reply___block_invoke;
  v10[3] = &unk_1EA8B00E0;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[VSSpeechConnection _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prewarmIfNeededWithRequest:reply:", v8, v7);

}

- (BOOL)queryPhaticCapabilityWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_175);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__VSSpeechConnection_queryPhaticCapabilityWithRequest___block_invoke_176;
  v8[3] = &unk_1EA8B0128;
  v8[4] = &v9;
  objc_msgSend(v6, "queryPhaticCapabilityWithRequest:reply:", v4, v8);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_178);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "estimateDurationWithRequest:reply:", v7, v6);

}

- (id)availableVoicesForLanguageCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2992;
  v14 = __Block_byref_object_dispose__2993;
  v15 = 0;
  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_179);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__VSSpeechConnection_availableVoicesForLanguageCode___block_invoke_180;
  v9[3] = &unk_1EA8B0170;
  v9[4] = &v10;
  objc_msgSend(v6, "getVoiceNamesForLanguage:reply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)availableFootprintsForVoice:(id)a3 languageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2992;
  v17 = __Block_byref_object_dispose__2993;
  v18 = 0;
  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_182_2994);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__VSSpeechConnection_availableFootprintsForVoice_languageCode___block_invoke_183;
  v12[3] = &unk_1EA8B0170;
  v12[4] = &v13;
  objc_msgSend(v9, "getFootprintsForVoiceName:languageCode:reply:", v6, v7, v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (BOOL)isSystemSpeaking
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_184);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__VSSpeechConnection_isSystemSpeaking__block_invoke_185;
  v5[3] = &unk_1EA8B0128;
  v5[4] = &v6;
  objc_msgSend(v3, "getSpeechIsActiveReply:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isSystemSpeakingOnBehalfOfCurrentConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[VSSpeechConnection currentRequest](self, "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[VSSpeechConnection currentAudioRequest](self, "currentAudioRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v7 = 0;
      goto LABEL_5;
    }
  }
  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_186);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__VSSpeechConnection_isSystemSpeakingOnBehalfOfCurrentConnection__block_invoke_187;
  v9[3] = &unk_1EA8B0128;
  v9[4] = &v10;
  objc_msgSend(v6, "getSpeechIsActiveForConnectionReply:", v9);

  v7 = *((_BYTE *)v11 + 24) != 0;
LABEL_5:
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)startPhonemesRequest:(id)a3 phonemeSystem:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__VSSpeechConnection_startPhonemesRequest_phonemeSystem_reply___block_invoke;
  v12[3] = &unk_1EA8B00E0;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[VSSpeechConnection _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startPhonemesRequest:phonemeSystem:reply:", v10, a4, v9);

}

- (void)beginAudioPowerUpdateWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginAudioPowerUpdateWithReply:", v4);

}

- (void)endAudioPowerUpdate
{
  id v2;

  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endAudioPowerUpdate");

}

- (void)startSpeechRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startSpeechRequest:reply:", v4, &__block_literal_global_190);

  if (objc_msgSend(v4, "shouldWaitCurrentSpeaking"))
  {
    -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);

  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__VSSpeechConnection_startSpeechRequest___block_invoke_2;
    v12[3] = &unk_1EA8B01B8;
    v12[4] = &v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

    -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertObject:atIndex:", v4, v14[3]);

    _Block_object_dispose(&v13, 8);
  }

}

- (void)startPresynthesizedAudioRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startPresynthesizedAudioRequest:", v4);

  if (objc_msgSend(v4, "enqueue"))
  {
    -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);

  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__VSSpeechConnection_startPresynthesizedAudioRequest___block_invoke;
    v12[3] = &unk_1EA8B01E0;
    v12[4] = &v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

    -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audioRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertObject:atIndex:", v4, v14[3]);

    _Block_object_dispose(&v13, 8);
  }

}

- (void)cachePresynthesizedAudioRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSSpeechConnection _remoteObjectSync](self, "_remoteObjectSync");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachePresynthesizedAudioRequest:", v4);

}

- (void)stopPresynthesizedAudioRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopPresynthesizedAudioRequest:", v4);

}

- (void)startSynthesisRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startSynthesisRequest:", v4);

  -[VSSpeechConnection delegateWrapper](self, "delegateWrapper");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "concurrentSynthesisRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "pointer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v7);

}

- (void)stopSpeechRequest:(id)a3 atMark:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopSpeechRequest:atMark:", v6, a4);

}

- (void)pauseSpeechRequest:(id)a3 atMark:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pauseSpeechRequest:atMark:", v6, a4);

}

- (void)continueSpeechRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "continueSpeechRequest:", v4);

}

- (void)cleanUnusedAssets:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanUnusedAssets:", v4);

}

- (void)getLocalVoiceAssetsForLanguage:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__VSSpeechConnection_getLocalVoiceAssetsForLanguage_reply___block_invoke;
  v10[3] = &unk_1EA8B00E0;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[VSSpeechConnection _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getLocalVoicesForLanguage:reply:", v8, v7);

}

- (void)getLocalVoiceResources:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__VSSpeechConnection_getLocalVoiceResources___block_invoke;
  v7[3] = &unk_1EA8B00E0;
  v8 = v4;
  v5 = v4;
  -[VSSpeechConnection _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getLocalVoiceResourcesReply:", v5);

}

- (void)setSubscribedVoiceAssets:(id)a3 withClientID:(id)a4 forAccessoryID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSubscribedVoiceAssets:withClientID:forAccessoryID:", v10, v9, v8);

}

- (void)triggerCellularDownloadedVoiceAssets:(id)a3 withClientID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VSSpeechConnection _remoteObject](self, "_remoteObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "triggerCellularDownloadedVoiceAssets:withClientID:", v7, v6);

}

- (void)getSubscribedVoiceAssetsWithClientID:(id)a3 forAccessoryID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__VSSpeechConnection_getSubscribedVoiceAssetsWithClientID_forAccessoryID_reply___block_invoke;
  v13[3] = &unk_1EA8B00E0;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[VSSpeechConnection _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getSubscribedVoiceAssetsWithClientID:forAccessoryID:reply:", v11, v10, v9);

}

- (void)getAllVoiceSubscriptionsWithReply:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__VSSpeechConnection_getAllVoiceSubscriptionsWithReply___block_invoke;
  v7[3] = &unk_1EA8B00E0;
  v8 = v4;
  v5 = v4;
  -[VSSpeechConnection _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAllVoiceSubscriptionsWithReply:", v5);

}

- (void)getVoiceResourceForLanguage:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__VSSpeechConnection_getVoiceResourceForLanguage_reply___block_invoke;
  v10[3] = &unk_1EA8B00E0;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[VSSpeechConnection _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getVoiceResourceForLanguage:reply:", v8, v7);

}

- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 footprint:(int64_t)a5 gender:(int64_t)a6 type:(int64_t)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v14 = a8;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__VSSpeechConnection_getVoiceInfoForLanguageCode_name_footprint_gender_type_reply___block_invoke;
  v19[3] = &unk_1EA8B00E0;
  v20 = v14;
  v15 = v14;
  v16 = a4;
  v17 = a3;
  -[VSSpeechConnection _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "getVoiceInfoForLanguageCode:name:footprint:gender:type:reply:", v17, v16, a5, a6, a7, v15);

}

- (void)forwardStreamObject:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_191);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forwardStreamObject:", v4);

}

- (void)invokeDaemon:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invokeDaemon:", v4);

}

- (void)killDaemon
{
  void *v2;
  id v3;

  -[VSSpeechConnection xpcConnection](self, "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "killDaemon");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)keepActive
{
  return self->_keepActive;
}

- (VSSpeechConnectionDelegate)delegate
{
  return (VSSpeechConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (VSSpeechConnectionDelegateWrapper)delegateWrapper
{
  return self->_delegateWrapper;
}

- (void)setDelegateWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_delegateWrapper, a3);
}

- (OS_dispatch_queue)threadSafeQueue
{
  return self->_threadSafeQueue;
}

- (void)setThreadSafeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_threadSafeQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadSafeQueue, 0);
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __42__VSSpeechConnection_forwardStreamObject___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "-[VSSpeechConnection forwardStreamObject:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "%s, Error: %@", (uint8_t *)&v5, 0x16u);

  }
}

void __83__VSSpeechConnection_getVoiceInfoForLanguageCode_name_footprint_gender_type_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_ERROR, "Can't get voice info: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __56__VSSpeechConnection_getVoiceResourceForLanguage_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_ERROR, "Can't get VoiceResource: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __56__VSSpeechConnection_getAllVoiceSubscriptionsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_ERROR, "Can't get all subscribed voice assets: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __80__VSSpeechConnection_getSubscribedVoiceAssetsWithClientID_forAccessoryID_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_ERROR, "Can't get subscribed voice assets: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

uint64_t __45__VSSpeechConnection_getLocalVoiceResources___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __59__VSSpeechConnection_getLocalVoiceAssetsForLanguage_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __54__VSSpeechConnection_startPresynthesizedAudioRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  result = objc_msgSend(a2, "enqueue");
  *a4 = result;
  return result;
}

uint64_t __41__VSSpeechConnection_startSpeechRequest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  result = objc_msgSend(a2, "shouldWaitCurrentSpeaking");
  *a4 = result;
  return result;
}

void __63__VSSpeechConnection_startPhonemesRequest_phonemeSystem_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_ERROR, "Can't start PhonemesRequest: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__VSSpeechConnection_isSystemSpeakingOnBehalfOfCurrentConnection__block_invoke_187(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __65__VSSpeechConnection_isSystemSpeakingOnBehalfOfCurrentConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[VSSpeechConnection isSystemSpeakingOnBehalfOfCurrentConnection]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "Error at %s , %@ ", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __38__VSSpeechConnection_isSystemSpeaking__block_invoke_185(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __38__VSSpeechConnection_isSystemSpeaking__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[VSSpeechConnection isSystemSpeaking]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "Error at %s , %@ ", (uint8_t *)&v4, 0x16u);
  }

}

void __63__VSSpeechConnection_availableFootprintsForVoice_languageCode___block_invoke_183(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__VSSpeechConnection_availableFootprintsForVoice_languageCode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "Error %@ asking for voice footprints", (uint8_t *)&v4, 0xCu);
  }

}

void __53__VSSpeechConnection_availableVoicesForLanguageCode___block_invoke_180(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __53__VSSpeechConnection_availableVoicesForLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "Error %@ asking for voices", (uint8_t *)&v4, 0xCu);
  }

}

void __56__VSSpeechConnection_estimateDurationWithRequest_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "Error estimateDurationWithRequest:reply: %@", (uint8_t *)&v5, 0xCu);

  }
}

uint64_t __55__VSSpeechConnection_queryPhaticCapabilityWithRequest___block_invoke_176(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __55__VSSpeechConnection_queryPhaticCapabilityWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[VSSpeechConnection queryPhaticCapabilityWithRequest:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "Error at %s , %@ ", (uint8_t *)&v4, 0x16u);
  }

}

void __55__VSSpeechConnection_prewarmIfNeededWithRequest_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_ERROR, "Can't prewarm: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __64__VSSpeechConnection_updateWithConnectionIdentifier_keepActive___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "Error updateWithConnectionIdentifier: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __44__VSSpeechConnection__connectionInvalidated__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "connection:speechRequest:didStopAtEnd:phonemesSpoken:error:", *(_QWORD *)(a1 + 32), v4, 0, 0, *(_QWORD *)(a1 + 40));

}

void __44__VSSpeechConnection__connectionInvalidated__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "connection:presynthesizedAudioRequest:didStopAtEnd:error:", *(_QWORD *)(a1 + 32), v4, 0, *(_QWORD *)(a1 + 40));

}

void __44__VSSpeechConnection__connectionInvalidated__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(*(_QWORD *)(a1 + 32) + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "connection:synthesisRequest:didFinishWithInstrumentMetrics:error:", *(_QWORD *)(a1 + 32), v5, 0, *(_QWORD *)(a1 + 40));

}

void __39__VSSpeechConnection__remoteObjectSync__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    VSGetLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[VSSpeechConnection _remoteObjectSync]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "%s, error: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __39__VSSpeechConnection_setXpcConnection___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __35__VSSpeechConnection_xpcConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  _QWORD v32[5];
  _QWORD v33[3];
  _QWORD v34[2];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.voiceservices.tts"), 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0444538);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getLocalVoicesForLanguage_reply_, 0, 1);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getSubscribedVoiceAssetsWithClientID_forAccessoryID_reply_, 0, 1);
    v9 = (void *)MEMORY[0x1E0C99E60];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getLocalVoiceResourcesReply_, 0, 1);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getVoiceResourceForLanguage_reply_, 0, 1);
    v12 = (void *)MEMORY[0x1E0C99E60];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getAllVoiceSubscriptionsWithReply_, 0, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRemoteObjectInterface:", v5);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __35__VSSpeechConnection_xpcConnection__block_invoke_2;
    v29[3] = &unk_1EA8AFF90;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v15, "setInvalidationHandler:", v29);
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __35__VSSpeechConnection_xpcConnection__block_invoke_3;
    v27[3] = &unk_1EA8AFF90;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v17, "setInterruptionHandler:", v27);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F043F978);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E60];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    v32[3] = objc_opt_class();
    v32[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_speechRequest_didReceiveTimingInfo_, 1, 0);
    objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_synthesisRequest_didReceiveTimingInfo_, 1, 0);
    objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_synthesisRequest_didGenerateAudioChunk_, 1, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedInterface:", v18);
    v22 = *(_QWORD **)(a1 + 32);
    v23 = (void *)v22[2];
    objc_msgSend(v22, "delegateWrapper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setExportedObject:", v24);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    v25 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v25 + 24))
    {
      objc_msgSend(*(id *)(v25 + 16), "remoteObjectProxy");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "updateWithConnectionIdentifier:keepActive:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));

    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
}

void __35__VSSpeechConnection_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

void __35__VSSpeechConnection_xpcConnection__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

@end

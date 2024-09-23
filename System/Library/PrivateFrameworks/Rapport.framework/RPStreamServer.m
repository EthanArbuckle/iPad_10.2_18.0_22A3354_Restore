@implementation RPStreamServer

- (RPStreamServer)init
{
  RPStreamServer *v2;
  RPStreamServer *v3;
  RPStreamServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPStreamServer;
  v2 = -[RPStreamServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5)
    dispatchQueue = self->_dispatchQueue;
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__RPStreamServer_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E5F4ED70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __41__RPStreamServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  RPMessageable *v5;
  RPMessageable *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = (void (**)(id, _QWORD))a3;
  if (gLogCategory_RPStreamServer <= 30
    && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = self->_messenger;
  v6 = v5;
  if (v5)
  {
    -[RPMessageable setServiceType:](v5, "setServiceType:", self->_serviceType);
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__RPStreamServer__activateWithCompletion___block_invoke;
    v10[3] = &unk_1E5F50D30;
    v10[4] = self;
    -[RPMessageable registerRequestID:options:handler:](v6, "registerRequestID:options:handler:", CFSTR("_streamStart"), 0, v10);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __42__RPStreamServer__activateWithCompletion___block_invoke_2;
    v9[3] = &unk_1E5F50D30;
    v9[4] = self;
    -[RPMessageable registerRequestID:options:handler:](v6, "registerRequestID:options:handler:", CFSTR("_streamStop"), 0, v9);
    objc_storeStrong(&self->_selfRef, self);
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    RPErrorF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4)
      ((void (**)(id, void *))v4)[2](v4, v8);

  }
}

uint64_t __42__RPStreamServer__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStartRequest:options:responseHandler:", a2, a3, a4);
}

uint64_t __42__RPStreamServer__activateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStopRequest:options:responseHandler:", a2, a3, a4);
}

- (id)description
{
  return -[RPStreamServer descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  NSString *serviceType;
  id v7;
  id v9;
  NSString *v11;
  void *v12;

  -[NSMutableDictionary count](self->_streamSessions, "count", *(_QWORD *)&a3);
  NSAppendPrintF();
  v4 = 0;
  v5 = v4;
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v12 = v4;
    v11 = serviceType;
    NSAppendPrintF();
    v7 = v12;

    v5 = v7;
  }
  if (self->_streamQoS)
  {
    NSAppendPrintF();
    v9 = v5;

    v5 = v9;
  }
  return v5;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__RPStreamServer_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__RPStreamServer_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPStreamServer <= 30
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_streamStart"));
    -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_streamStop"));
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_streamSessions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_15);
    -[NSMutableDictionary removeAllObjects](self->_streamSessions, "removeAllObjects");
    -[RPStreamServer _invalidated](self, "_invalidated");
  }
}

uint64_t __29__RPStreamServer__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void)_invalidated
{
  uint64_t v3;
  void *v4;
  id invalidationHandler;
  RPMessageable *messenger;
  id streamAcceptHandler;
  id streamPrepareHandler;
  id streamPrepareHandlerEx;
  id selfRef;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v3 = MEMORY[0x1AF45BE48](self->_invalidationHandler);
    v4 = (void *)v3;
    if (v3)
      (*(void (**)(uint64_t))(v3 + 16))(v3);

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    messenger = self->_messenger;
    self->_messenger = 0;

    self->_invalidateDone = 1;
    streamAcceptHandler = self->_streamAcceptHandler;
    self->_streamAcceptHandler = 0;

    streamPrepareHandler = self->_streamPrepareHandler;
    self->_streamPrepareHandler = 0;

    streamPrepareHandlerEx = self->_streamPrepareHandlerEx;
    self->_streamPrepareHandlerEx = 0;

    selfRef = self->_selfRef;
    self->_selfRef = 0;

    if (gLogCategory_RPStreamServer <= 30
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_handleStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  uint64_t Int64Ranged;
  const char *v15;
  RPStreamSession *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id *v22;
  char v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void (**v33)(_QWORD);
  void *v34;
  id v35;
  _QWORD v36[7];
  id v37;
  void *v38;
  int v39;
  _QWORD v40[8];
  int v41;
  id obj;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46 = 0;
  v47 = (id *)&v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__3;
  v50 = __Block_byref_object_dispose__3;
  v51 = 0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke;
  v43[3] = &unk_1E5F50DE8;
  v45 = &v46;
  v11 = v10;
  v44 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v43);
  v33 = v12;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || (Int64Ranged = CFDictionaryGetInt64Ranged(), !(_DWORD)Int64Ranged))
  {
    RPErrorF();
    v29 = objc_claimAutoreleasedReturnValue();
    v35 = v47[5];
    v47[5] = (id)v29;

    goto LABEL_25;
  }
  v34 = (void *)MEMORY[0x1AF45BE48](self->_streamAcceptHandler);
  if (!v34)
  {
    RPErrorF();
    v30 = objc_claimAutoreleasedReturnValue();
    v16 = (RPStreamSession *)v47[5];
    v47[5] = (id)v30;
    goto LABEL_24;
  }
  if (gLogCategory_RPStreamServer <= 30
    && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 3)
      v15 = "?";
    else
      v15 = *(char **)((char *)off_1E5F50EF8 + (((Int64Ranged << 32) - 0x100000000) >> 29));
    v31 = v13;
    v32 = v15;
    LogPrintF();
  }
  v16 = objc_alloc_init(RPStreamSession);
  -[RPStreamSession setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue);
  -[RPStreamSession setMessenger:](v16, "setMessenger:", self->_messenger);
  -[RPStreamSession setStreamID:](v16, "setStreamID:", v13);
  -[RPStreamSession setStreamType:](v16, "setStreamType:", Int64Ranged);
  -[RPStreamSession setServiceType:](v16, "setServiceType:", self->_serviceType);
  -[RPStreamSession setStreamQoS:](v16, "setStreamQoS:", self->_streamQoS);
  v17 = v8;
  -[RPStreamSession setStreamFlags:](v16, "setStreamFlags:", -[RPStreamSession streamFlags](v16, "streamFlags") | CFDictionaryGetInt64Ranged() & 2);
  v18 = v11;
  v19 = MEMORY[0x1AF45BE48](self->_streamPrepareHandlerEx);
  v20 = (void *)v19;
  v21 = v9;
  if (!v19)
  {
    v26 = MEMORY[0x1AF45BE48](self->_streamPrepareHandler);
    v27 = (void *)v26;
    if (v26)
      (*(void (**)(uint64_t, RPStreamSession *))(v26 + 16))(v26, v16);

    goto LABEL_18;
  }
  v22 = v47;
  obj = v47[5];
  v23 = (*(uint64_t (**)(uint64_t, RPStreamSession *, id *))(v19 + 16))(v19, v16, &obj);
  objc_storeStrong(v22 + 5, obj);
  if ((v23 & 1) != 0)
  {
LABEL_18:
    v9 = v21;
    v11 = v18;
    v8 = v17;
    v28 = MEMORY[0x1E0C809B0];
    if ((self->_streamFlags & 1) != 0
      || (_DWORD)Int64Ranged == 2 && (-[RPStreamSession streamFlags](v16, "streamFlags") & 4) != 0)
    {
      v40[0] = v28;
      v40[1] = 3221225472;
      v40[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_2;
      v40[3] = &unk_1E5F50E88;
      v40[4] = v16;
      v40[5] = self;
      v41 = Int64Ranged;
      v40[6] = v13;
      v40[7] = v34;
      -[RPStreamSession setStreamAcceptHandler:](v16, "setStreamAcceptHandler:", v40, v31, v32);
    }
    v36[0] = v28;
    v36[1] = 3221225472;
    v36[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_6;
    v36[3] = &unk_1E5F50ED8;
    v36[4] = v16;
    v39 = Int64Ranged;
    v37 = v11;
    v38 = v34;
    v36[5] = self;
    v36[6] = v13;
    -[RPStreamSession activateForServerRequest:options:responseHandler:](v16, "activateForServerRequest:options:responseHandler:", v17, v9, v36);

    goto LABEL_23;
  }
  RPNestedErrorF();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v47[5];
  v47[5] = (id)v24;

  v9 = v21;
  v11 = v18;
  v8 = v17;
LABEL_23:

  v12 = v33;
LABEL_24:

LABEL_25:
  v12[2](v12);

  _Block_object_dispose(&v46, 8);
}

uint64_t __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_2(int8x16_t *a1)
{
  int8x16_t v1;
  uint64_t v2;
  _QWORD v4[4];
  int8x16_t v5;
  uint64_t v6;
  __int32 v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_3;
  v4[3] = &unk_1E5F50E60;
  v1 = a1[2];
  v5 = vextq_s8(v1, v1, 8uLL);
  v7 = a1[4].i32[0];
  v2 = a1[3].i64[1];
  v6 = a1[3].i64[0];
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v1.i64[0], v4);
}

void __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_3(int8x16_t *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  int8x16_t v8;
  uint64_t v9;
  __int32 v10;

  v3 = a2;
  v4 = *(NSObject **)(a1[2].i64[0] + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_4;
  block[3] = &unk_1E5F50E38;
  v7 = v3;
  v10 = a1[3].i32[2];
  v8 = vextq_s8(a1[2], a1[2], 8uLL);
  v9 = a1[3].i64[0];
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 40), "streamFlags");
    if ((result & 1) == 0)
    {
      if (*(_DWORD *)(a1 + 64) != 2 || (result = objc_msgSend(*(id *)(a1 + 40), "streamFlags"), (result & 4) == 0))
      {
        v3[0] = MEMORY[0x1E0C809B0];
        v3[1] = 3221225472;
        v3[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_5;
        v3[3] = &unk_1E5F50E10;
        v4 = *(_OWORD *)(a1 + 40);
        v5 = *(_QWORD *)(a1 + 56);
        return objc_msgSend((id)v4, "startServerConnectionWithCompletion:", v3);
      }
    }
  }
  return result;
}

void __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v7);
    }
  }
  else
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 32);
      *(_QWORD *)(v5 + 32) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

void __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13 = *(_QWORD *)(a1 + 56);
    if (v10)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v10);
    }
    else
    {
      RPErrorF();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v14);

    }
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 40) & 1) != 0
         || *(_DWORD *)(a1 + 72) == 2 && (objc_msgSend(*(id *)(a1 + 32), "streamFlags") & 4) != 0)
  {
    (*(void (**)(_QWORD, id, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v7, 0, 0);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_7;
    v15[3] = &unk_1E5F50EB0;
    v15[4] = v11;
    v12 = *(_QWORD *)(a1 + 64);
    v18 = *(id *)(a1 + 56);
    v16 = *(_OWORD *)(a1 + 40);
    v17 = v7;
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v12 + 16))(v12, v11, v15);

  }
}

void __62__RPStreamServer__handleStartRequest_options_responseHandler___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
  }
  else
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 32);
      *(_QWORD *)(v5 + 32) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "acceptedByServer");
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
  }

}

- (void)_handleStopRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD);

  v10 = (void (**)(_QWORD))a5;
  v7 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_streamSessions, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamSessions, "setObject:forKeyedSubscript:", 0, v8);
      objc_msgSend(v9, "invalidate");
      if (gLogCategory_RPStreamServer <= 30
        && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
      {
LABEL_8:
        LogPrintF();
      }
    }
    else if (gLogCategory_RPStreamServer <= 30
           && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_8;
    }
  }
  else
  {
    RPErrorF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamServer <= 90
      && (gLogCategory_RPStreamServer != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_8;
    }
  }
  v10[2](v10);

}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)streamAcceptHandler
{
  return self->_streamAcceptHandler;
}

- (void)setStreamAcceptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)streamFlags
{
  return self->_streamFlags;
}

- (void)setStreamFlags:(unsigned int)a3
{
  self->_streamFlags = a3;
}

- (id)streamPrepareHandlerEx
{
  return self->_streamPrepareHandlerEx;
}

- (void)setStreamPrepareHandlerEx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)streamPrepareHandler
{
  return self->_streamPrepareHandler;
}

- (void)setStreamPrepareHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int)streamQoS
{
  return self->_streamQoS;
}

- (void)setStreamQoS:(int)a3
{
  self->_streamQoS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamPrepareHandler, 0);
  objc_storeStrong(&self->_streamPrepareHandlerEx, 0);
  objc_storeStrong(&self->_streamAcceptHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_streamSessions, 0);
  objc_storeStrong(&self->_selfRef, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end

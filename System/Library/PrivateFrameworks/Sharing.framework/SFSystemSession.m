@implementation SFSystemSession

- (SFSystemSession)init
{
  SFSystemSession *v2;
  SFSystemSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSystemSession;
  v2 = -[SFSystemSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)_cleanup
{
  SFSession *sfSession;

  -[SFSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SFSystemSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __27__SFSystemSession_activate__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SFSystemSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SFSystemSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16)
    && gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = 7;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)_run
{
  int *v3;
  const char *v4;
  NSError *state;
  void *v6;
  const char *v7;
  int *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  NSError *v13;
  NSError *stateError;
  void *v15;
  int v16;
  BOOL v17;
  NSError *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v3 = &gLogCategory_SFSystemSession;
  v4 = "-[SFSystemSession _run]";
  v22[1] = *MEMORY[0x1E0C80C00];
  v19 = *MEMORY[0x1E0CB2D50];
  v20 = *MEMORY[0x1E0CB2F90];
  state = (NSError *)self->_state;
  do
  {
    switch((int)state)
    {
      case 0:
        self->_state = 10;
        break;
      case 3:
        if (!self->_stateError)
        {
          v6 = (void *)MEMORY[0x1E0CB35C8];
          v21 = v19;
          v7 = v4;
          v8 = v3;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (void *)v9;
          v11 = CFSTR("?");
          if (v9)
            v11 = (const __CFString *)v9;
          v22[0] = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "errorWithDomain:code:userInfo:", v20, -6700, v12);
          v13 = (NSError *)objc_claimAutoreleasedReturnValue();
          stateError = self->_stateError;
          self->_stateError = v13;

          v3 = v8;
          v4 = v7;
        }
        if (gLogCategory_SFSystemSession <= 60
          && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
        {
          v18 = self->_stateError;
          LogPrintF();
        }
        -[SFSystemSession _processRequestsWithError:](self, "_processRequestsWithError:", self->_stateError, v18);
        break;
      case 7:
        NSErrorWithOSStatusF();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSystemSession _processRequestsWithError:](self, "_processRequestsWithError:", v15);

        break;
      case 10:
        self->_state = 11;
        -[SFSystemSession _runSFSessionStart](self, "_runSFSessionStart");
        break;
      case 11:
        if (self->_stateDone)
        {
          if (self->_stateError)
            v16 = 3;
          else
            v16 = 12;
          goto LABEL_31;
        }
        break;
      case 12:
        self->_state = 13;
        self->_stateDone = 0;
        -[SFSystemSession _runPairVerifyStart](self, "_runPairVerifyStart");
        break;
      case 13:
        if (self->_stateDone)
        {
          if (self->_stateError && !self->_allowUnencrypted)
            v16 = 3;
          else
            v16 = 14;
LABEL_31:
          self->_state = v16;
        }
        break;
      case 14:
        -[SFSystemSession _processRequests](self, "_processRequests");
        break;
      default:
        if (gLogCategory_SFSystemSession <= 60
          && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
        {
          v18 = state;
          LogPrintF();
        }
        break;
    }
    v17 = self->_state == (_DWORD)state;
    state = (NSError *)self->_state;
  }
  while (!v17);
}

- (void)_runSFSessionStart
{
  SFSession *v3;
  SFSession *sfSession;
  uint64_t v5;
  SFSession *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = objc_alloc_init(SFSession);
  sfSession = self->_sfSession;
  self->_sfSession = v3;

  -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
  -[SFSession setLabel:](self->_sfSession, "setLabel:", CFSTR("System"));
  -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
  -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.System"));
  -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 33);
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SFSystemSession__runSFSessionStart__block_invoke;
  v8[3] = &unk_1E482DF78;
  v8[4] = self;
  -[SFSession setSessionStartedHandler:](self->_sfSession, "setSessionStartedHandler:", v8);
  v6 = self->_sfSession;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __37__SFSystemSession__runSFSessionStart__block_invoke_2;
  v7[3] = &unk_1E482DFF0;
  v7[4] = self;
  -[SFSession activateWithCompletion:](v6, "activateWithCompletion:", v7);
}

uint64_t __37__SFSystemSession__runSFSessionStart__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 16))
  {
    v1 = result;
    if (gLogCategory_SFSystemSession <= 30
      && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 44) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

void __37__SFSystemSession__runSFSessionStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a2;
  v5 = v4;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (v4)
    {
      v7 = v4;
      if (gLogCategory_SFSystemSession <= 60
        && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_run");
      goto LABEL_11;
    }
    if (gLogCategory_SFSystemSession <= 30)
    {
      v7 = 0;
      if (gLogCategory_SFSystemSession != -1 || (v6 = _LogCategory_Initialize(), v5 = 0, v6))
      {
        LogPrintF();
LABEL_11:
        v5 = v7;
      }
    }
  }

}

- (void)_runPairVerifyStart
{
  SFSession *sfSession;
  _QWORD v3[5];

  sfSession = self->_sfSession;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__SFSystemSession__runPairVerifyStart__block_invoke;
  v3[3] = &unk_1E482DFF0;
  v3[4] = self;
  -[SFSession pairVerifyWithFlags:completion:](sfSession, "pairVerifyWithFlags:completion:", 8, v3);
}

void __38__SFSystemSession__runPairVerifyStart__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v5 = v4;
    if (v4)
    {
      if (gLogCategory_SFSystemSession > 60
        || gLogCategory_SFSystemSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_12;
      }
    }
    else if (gLogCategory_SFSystemSession > 30
           || gLogCategory_SFSystemSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
    LogPrintF();
LABEL_12:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_run");
    v4 = v5;
  }

}

- (void)_processRequests
{
  SFSessionRequestInfo **p_currentRequest;
  void *v4;
  SFSession *sfSession;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  SFSystemSession *v13;

  p_currentRequest = &self->_currentRequest;
  if (!self->_currentRequest)
  {
    -[NSMutableArray firstObject](self->_requests, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_storeStrong((id *)p_currentRequest, v4);
      -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", 0);
      sfSession = self->_sfSession;
      objc_msgSend(v4, "requestID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "options");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "request");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = v8;
      else
        v10 = MEMORY[0x1E0C9AA70];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __35__SFSystemSession__processRequests__block_invoke;
      v11[3] = &unk_1E48346F8;
      v12 = v4;
      v13 = self;
      -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", v6, v7, v10, v11);

    }
  }
}

uint64_t __35__SFSystemSession__processRequests__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *v12;
  void *v13;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "responseHandler");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, id))v11)[2](v11, v10, v9, v8);

  v13 = *(void **)(a1 + 32);
  v12 = *(_QWORD **)(a1 + 40);
  if (v13 == (void *)v12[1])
  {
    v12[1] = 0;

    v12 = *(_QWORD **)(a1 + 40);
  }
  return objc_msgSend(v12, "_run");
}

- (void)_processRequestsWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_requests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "responseHandler", (_QWORD)v11);
        v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, _QWORD, _QWORD))v10)[2](v10, v4, 0, 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
}

- (void)getSystemInfoWithCompletion:(id)a3
{
  id v4;
  SFSessionRequestInfo *v5;
  uint64_t v6;
  id v7;
  NSObject *dispatchQueue;
  SFSessionRequestInfo *v9;
  _QWORD block[5];
  SFSessionRequestInfo *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = objc_alloc_init(SFSessionRequestInfo);
  -[SFSessionRequestInfo setRequestID:](v5, "setRequestID:", CFSTR("_getSysInfo"));
  if (self->_allowUnencrypted)
    -[SFSessionRequestInfo setOptions:](v5, "setOptions:", &unk_1E4891728);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__SFSystemSession_getSystemInfoWithCompletion___block_invoke;
  v12[3] = &unk_1E4834150;
  v13 = v4;
  v7 = v4;
  -[SFSessionRequestInfo setResponseHandler:](v5, "setResponseHandler:", v12);
  dispatchQueue = self->_dispatchQueue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __47__SFSystemSession_getSystemInfoWithCompletion___block_invoke_2;
  block[3] = &unk_1E482D3A0;
  block[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(dispatchQueue, block);

}

uint64_t __47__SFSystemSession_getSystemInfoWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__SFSystemSession_getSystemInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)getProfilesWithCompletion:(id)a3
{
  id v4;
  SFSessionRequestInfo *v5;
  uint64_t v6;
  id v7;
  NSObject *dispatchQueue;
  SFSessionRequestInfo *v9;
  _QWORD v10[5];
  SFSessionRequestInfo *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = objc_alloc_init(SFSessionRequestInfo);
  -[SFSessionRequestInfo setRequestID:](v5, "setRequestID:", CFSTR("_profilesGet"));
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__SFSystemSession_getProfilesWithCompletion___block_invoke;
  v12[3] = &unk_1E482F708;
  v12[4] = self;
  v13 = v4;
  v7 = v4;
  -[SFSessionRequestInfo setResponseHandler:](v5, "setResponseHandler:", v12);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __45__SFSystemSession_getProfilesWithCompletion___block_invoke_2;
  v10[3] = &unk_1E482D3A0;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(dispatchQueue, v10);

}

uint64_t __45__SFSystemSession_getProfilesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "getProfilesResponse:error:completion:", a4, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __45__SFSystemSession_getProfilesWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)getProfilesResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (a4)
  {
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, a4);
  }
  else
  {
    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v9, 0);
    }
    else
    {
      NSErrorWithOSStatusF();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);

    }
  }

}

- (void)installProfileWithData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  SFSessionRequestInfo *v11;
  SFSessionRequestInfo *v12;
  void *v13;
  uint64_t v14;
  NSObject *dispatchQueue;
  _QWORD v16[5];
  SFSessionRequestInfo *v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[4];
  id v21;
  SFSessionRequestInfo *v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0;
  NSDataCompress();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (v8)
  {
    if (gLogCategory_SFSystemSession <= 30
      && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v6, "length");
      objc_msgSend(v8, "length");
      LogPrintF();
    }
    v12 = objc_alloc_init(SFSessionRequestInfo);
    -[SFSessionRequestInfo setRequestID:](v12, "setRequestID:", CFSTR("_profileInstall"));
    v24 = CFSTR("profileData");
    v25[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSessionRequestInfo setRequest:](v12, "setRequest:", v13);

    v14 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__SFSystemSession_installProfileWithData_completion___block_invoke_2;
    v18[3] = &unk_1E482F708;
    v18[4] = self;
    v19 = v7;
    -[SFSessionRequestInfo setResponseHandler:](v12, "setResponseHandler:", v18);
    dispatchQueue = self->_dispatchQueue;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __53__SFSystemSession_installProfileWithData_completion___block_invoke_3;
    v16[3] = &unk_1E482D3A0;
    v16[4] = self;
    v17 = v12;
    v11 = v12;
    dispatch_async(dispatchQueue, v16);

  }
  else
  {
    v10 = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SFSystemSession_installProfileWithData_completion___block_invoke;
    block[3] = &unk_1E482E0F0;
    v22 = (SFSessionRequestInfo *)v7;
    v21 = v9;
    dispatch_async(v10, block);

    v11 = v22;
  }

}

uint64_t __53__SFSystemSession_installProfileWithData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __53__SFSystemSession_installProfileWithData_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "installProfileResponse:error:completion:", a4, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __53__SFSystemSession_installProfileWithData_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)installProfileWithURL:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *dispatchQueue;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v6 = a4;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 0, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    -[SFSystemSession installProfileWithData:completion:](self, "installProfileWithData:completion:", v7, v6);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SFSystemSession_installProfileWithURL_completion___block_invoke;
    block[3] = &unk_1E482E0F0;
    v12 = v6;
    v11 = v8;
    dispatch_async(dispatchQueue, block);

  }
}

uint64_t __52__SFSystemSession_installProfileWithURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)installProfileResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (a4)
  {
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, a4);
  }
  else
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v9, 0);
    }
    else
    {
      NSErrorWithOSStatusF();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);

    }
  }

}

- (void)removeProfileWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SFSessionRequestInfo *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *dispatchQueue;
  SFSessionRequestInfo *v13;
  _QWORD block[5];
  SFSessionRequestInfo *v15;
  _QWORD v16[4];
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = objc_alloc_init(SFSessionRequestInfo);
  -[SFSessionRequestInfo setRequestID:](v8, "setRequestID:", CFSTR("_profileRemove"));
  v18 = CFSTR("id");
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSessionRequestInfo setRequest:](v8, "setRequest:", v9);

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__SFSystemSession_removeProfileWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E4834150;
  v17 = v7;
  v11 = v7;
  -[SFSessionRequestInfo setResponseHandler:](v8, "setResponseHandler:", v16);
  dispatchQueue = self->_dispatchQueue;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __58__SFSystemSession_removeProfileWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E482D3A0;
  block[4] = self;
  v15 = v8;
  v13 = v8;
  dispatch_async(dispatchQueue, block);

}

uint64_t __58__SFSystemSession_removeProfileWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__SFSystemSession_removeProfileWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)rebootSystemWithCompletion:(id)a3
{
  id v4;
  SFSessionRequestInfo *v5;
  uint64_t v6;
  id v7;
  NSObject *dispatchQueue;
  _QWORD block[6];
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (gLogCategory_SFSystemSession <= 30
    && (gLogCategory_SFSystemSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = objc_alloc_init(SFSessionRequestInfo);
  -[SFSessionRequestInfo setRequestID:](v5, "setRequestID:", CFSTR("_rebootSystem"));
  -[SFSessionRequestInfo setRequest:](v5, "setRequest:", MEMORY[0x1E0C9AA70]);
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__SFSystemSession_rebootSystemWithCompletion___block_invoke;
  v10[3] = &unk_1E4834150;
  v11 = v4;
  v7 = v4;
  -[SFSessionRequestInfo setResponseHandler:](v5, "setResponseHandler:", v10);
  dispatchQueue = self->_dispatchQueue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __46__SFSystemSession_rebootSystemWithCompletion___block_invoke_2;
  block[3] = &unk_1E482D3A0;
  block[4] = self;
  block[5] = v5;
  dispatch_async(dispatchQueue, block);

}

uint64_t __46__SFSystemSession_rebootSystemWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__SFSystemSession_rebootSystemWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (BOOL)allowUnencrypted
{
  return self->_allowUnencrypted;
}

- (void)setAllowUnencrypted:(BOOL)a3
{
  self->_allowUnencrypted = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_stateError, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end

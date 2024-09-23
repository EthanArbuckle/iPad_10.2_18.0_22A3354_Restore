@implementation SFRemoteTextInputClient

- (SFRemoteTextInputClient)init
{
  SFRemoteTextInputClient *v2;
  SFRemoteTextInputClient *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFRemoteTextInputClient;
  v2 = -[SFRemoteTextInputClient init](&v7, sel_init);
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

- (void)dealloc
{
  SFRemoteTextInputClient *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFRemoteTextInputClient *)FatalErrorF();
    -[SFRemoteTextInputClient activate](v3, v4);
  }
  else
  {
    -[SFRemoteTextInputClient _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFRemoteTextInputClient;
    -[SFRemoteTextInputClient dealloc](&v5, sel_dealloc);
  }
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SFRemoteTextInputClient_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFRemoteTextInputClient_activate__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  if (gLogCategory_SFRemoteTextInputClient <= 30
    && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  v2 = objc_alloc((Class)getRTIInputSystemServiceClass[0]());
  getRTIServiceSharingName[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithMachName:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setEnabled:", 1);
  v7 = objc_alloc_init((Class)getRTIInputSystemSourceSessionClass[0]());
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v7;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setPayloadDelegate:");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFRemoteTextInputClient_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFRemoteTextInputClient_invalidate__block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9)
    && gLogCategory_SFRemoteTextInputClient <= 30
    && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setPayloadDelegate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)_cleanup
{
  id eventHandler;
  RTIInputSystemService *rtiService;
  RTIInputSystemSourceSession *rtiSourceSession;
  id textInputDidBegin;
  id textInputDidEnd;

  eventHandler = self->_eventHandler;
  self->_eventHandler = 0;

  self->_paused = 0;
  rtiService = self->_rtiService;
  self->_rtiService = 0;

  rtiSourceSession = self->_rtiSourceSession;
  self->_rtiSourceSession = 0;

  textInputDidBegin = self->_textInputDidBegin;
  self->_textInputDidBegin = 0;

  textInputDidEnd = self->_textInputDidEnd;
  self->_textInputDidEnd = 0;

}

- (NSDictionary)currentPayload
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[RTIInputSystemService currentSession](self->_rtiService, "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDataPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_activateCalled || self->_invalidateCalled)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2F90];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("?");
    if (v11)
      v13 = (const __CFString *)v11;
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -6709, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (!self->_rtiService || !v4)
  {
    NSErrorWithOSStatusF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  SFTextInputDataForRTIDataPayload(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    NSErrorWithOSStatusF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && gLogCategory_SFRemoteTextInputClient <= 60
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v7, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    goto LABEL_12;
  }
  v6 = (void *)v5;
  v7 = 0;
LABEL_13:

  return (NSDictionary *)v6;
}

- (RTIInputSystemSourceSession)sourceSession
{
  if (self->_activateCalled && !self->_invalidateCalled)
    return self->_rtiSourceSession;
  else
    return (RTIInputSystemSourceSession *)0;
}

- (void)handleTextInputData:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  RTIInputSystemService *rtiService;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (gLogCategory_SFRemoteTextInputClient <= 30)
  {
    if (gLogCategory_SFRemoteTextInputClient != -1 || (v5 = _LogCategory_Initialize(), v4 = v15, v5))
    {
      SFTextInputDataLogString(v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = v15;
    }
  }
  SFRTIDataPayloadForData(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[RTIInputSystemService currentSession](self->_rtiService, "currentSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else if (self->_rtiSourceSession)
    {
      if (gLogCategory_SFRemoteTextInputClient <= 30
        && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[RTIInputSystemSourceSession handleTextActionPayload:](self->_rtiSourceSession, "handleTextActionPayload:", v6, v12);
      goto LABEL_28;
    }
    -[RTIInputSystemService currentSession](self->_rtiService, "currentSession", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (gLogCategory_SFRemoteTextInputClient <= 30
        && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
      {
        rtiService = self->_rtiService;
        -[RTIInputSystemService currentSession](rtiService, "currentSession");
        v12 = rtiService;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      -[RTIInputSystemService currentSession](self->_rtiService, "currentSession", v12, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleTextActionPayload:", v6);

LABEL_28:
      v11 = 0;
      goto LABEL_29;
    }
    if (gLogCategory_SFRemoteTextInputClient <= 60
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  NSErrorWithOSStatusF();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && gLogCategory_SFRemoteTextInputClient <= 60
    && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v11, "localizedDescription", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
LABEL_29:

}

- (void)handleUsername:(id)a3 password:(id)a4
{
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v15 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[RTIInputSystemService currentSession](self->_rtiService, "currentSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (!v8)
  {
    if (gLogCategory_SFRemoteTextInputClient > 30
      || gLogCategory_SFRemoteTextInputClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
LABEL_18:
    LogPrintF();
    goto LABEL_12;
  }
  if (!(v15 | v6))
  {
    if (gLogCategory_SFRemoteTextInputClient > 30
      || gLogCategory_SFRemoteTextInputClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  if (gLogCategory_SFRemoteTextInputClient <= 30)
  {
    if (gLogCategory_SFRemoteTextInputClient != -1 || (v10 = _LogCategory_Initialize(), v9 = v15, v10))
    {
      LogPrintF();
      v9 = v15;
    }
  }
  if (v9)
  {
    getTIKeyboardOutputInfoTypeUsernameStr[0]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v11);

  }
  if (v6)
  {
    getTIKeyboardOutputInfoTypePasswordStr[0]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v12);

  }
  objc_msgSend(v8, "textOperations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyboardOutput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCustomInfo:", v7);

  objc_msgSend(v8, "setSessionDelegate:", self->_rtiService);
  objc_msgSend(v8, "flushOperations");
LABEL_12:

}

- (void)flushOperations
{
  -[RTIInputSystemSourceSession flushOperations](self->_rtiSourceSession, "flushOperations");
}

- (void)fireEventHandlerWithPayload:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SFRemoteTextInputClient_fireEventHandlerWithPayload___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __55__SFRemoteTextInputClient_fireEventHandlerWithPayload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireEventHandlerWithPayload:", *(_QWORD *)(a1 + 40));
}

- (void)_fireEventHandlerWithPayload:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  void *v6;
  void (**eventHandler)(id, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  SFTextInputDataForRTIDataPayload(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (gLogCategory_SFRemoteTextInputClient <= 30
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      SFTextInputDataLogString(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    eventHandler = (void (**)(id, void *))self->_eventHandler;
    if (eventHandler)
      eventHandler[2](eventHandler, v6);
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2F90];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("?");
    if (v11)
      v13 = (const __CFString *)v11;
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -6720, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && gLogCategory_SFRemoteTextInputClient <= 60
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v8, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }

}

- (void)_handleSessionEvent:(int64_t)a3 forSession:(id)a4
{
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void (**textInputDidBegin)(id, _BOOL8, id);
  void (**textInputDidEnd)(id, _BOOL8, id);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int64_t v22;
  _BOOL8 v23;
  id v24;

  v24 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v24, "documentTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "autofillMode");

  if (gLogCategory_SFRemoteTextInputClient >= 31)
  {
    v8 = v7 == 1;
  }
  else
  {
    if (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize())
    {
      v21 = v7;
      LogPrintF();
    }
    v8 = v7 == 1;
    if (gLogCategory_SFRemoteTextInputClient <= 30
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      if ((unint64_t)(a3 - 1) > 5)
        v9 = CFSTR("?");
      else
        v9 = (const __CFString *)*((_QWORD *)&off_1E4830EB0 + a3 - 1);
      v21 = (uint64_t)v9;
      v23 = v7 == 1;
      LogPrintF();
    }
  }
  objc_msgSend(v24, "documentTraits", v21, v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "associatedDomains");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("remoteAssociatedDomains"));

    objc_msgSend(v10, "bundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("remoteBundleID"));

    objc_msgSend(v10, "localizedAppName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("remoteLocalizedAppName"));

    objc_msgSend(v10, "appName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("remoteUnlocalizedAppName"));

  }
  else
  {
    v11 = 0;
  }

  v16 = 0;
  switch(a3)
  {
    case 1:
      self->_paused = 0;
      textInputDidBegin = (void (**)(id, _BOOL8, id))self->_textInputDidBegin;
      if (textInputDidBegin)
        textInputDidBegin[2](textInputDidBegin, v8, v11);
      goto LABEL_35;
    case 2:
      if (!self->_paused)
        goto LABEL_27;
      if (gLogCategory_SFRemoteTextInputClient > 30
        || gLogCategory_SFRemoteTextInputClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_35;
      }
      goto LABEL_26;
    case 3:
LABEL_27:
      textInputDidEnd = (void (**)(id, _BOOL8, id))self->_textInputDidEnd;
      if (textInputDidEnd)
        textInputDidEnd[2](textInputDidEnd, v8, v11);
      v16 = 1;
      goto LABEL_36;
    case 4:
      goto LABEL_36;
    case 5:
      v16 = 0;
      self->_paused = 1;
      goto LABEL_36;
    case 6:
      v16 = 0;
      self->_paused = 0;
      goto LABEL_36;
    default:
      if (gLogCategory_SFRemoteTextInputClient > 60
        || gLogCategory_SFRemoteTextInputClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_35;
      }
      v22 = a3;
LABEL_26:
      LogPrintF();
LABEL_35:
      v16 = 0;
LABEL_36:
      objc_msgSend(v24, "currentDataPayload", v22);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if ((v16 & 1) != 0 || !v19)
      {
        if (gLogCategory_SFRemoteTextInputClient <= 60
          && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        -[SFRemoteTextInputClient fireEventHandlerWithPayload:](self, "fireEventHandlerWithPayload:", v19);
      }

      return;
  }
}

- (void)performTextOperations:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_SFRemoteTextInputClient <= 30
    && ((v6 = v3, gLogCategory_SFRemoteTextInputClient != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteTextInputClient/didCreateInputSession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (gLogCategory_SFRemoteTextInputClient <= 30
    && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  os_activity_scope_leave(&state);

}

- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  os_activity_scope_state_s state;

  v5 = a4;
  v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteTextInputClient/inputSessionDidBegin", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SFRemoteTextInputClient_inputSystemService_inputSessionDidBegin___block_invoke;
  v9[3] = &unk_1E482D3A0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(dispatchQueue, v9);

  os_activity_scope_leave(&state);
}

uint64_t __67__SFRemoteTextInputClient_inputSystemService_inputSessionDidBegin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEvent:forSession:", 1, *(_QWORD *)(a1 + 40));
}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  os_activity_scope_state_s state;

  v5 = a4;
  v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteTextInputClient/inputSessionDidEnd", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SFRemoteTextInputClient_inputSystemService_inputSessionDidEnd___block_invoke;
  v9[3] = &unk_1E482D3A0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(dispatchQueue, v9);

  os_activity_scope_leave(&state);
}

uint64_t __65__SFRemoteTextInputClient_inputSystemService_inputSessionDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEvent:forSession:", 2, *(_QWORD *)(a1 + 40));
}

- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  os_activity_scope_state_s state;

  v5 = a4;
  v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteTextInputClient/inputSessionDidDie", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SFRemoteTextInputClient_inputSystemService_inputSessionDidDie___block_invoke;
  v9[3] = &unk_1E482D3A0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(dispatchQueue, v9);

  os_activity_scope_leave(&state);
}

uint64_t __65__SFRemoteTextInputClient_inputSystemService_inputSessionDidDie___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEvent:forSession:", 3, *(_QWORD *)(a1 + 40));
}

- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5
{
  id v6;
  NSObject *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteTextInputClient/inputSessionDidPause", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__SFRemoteTextInputClient_inputSystemService_inputSessionDidPause_withReason___block_invoke;
  v10[3] = &unk_1E482D3A0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(dispatchQueue, v10);

  os_activity_scope_leave(&state);
}

uint64_t __78__SFRemoteTextInputClient_inputSystemService_inputSessionDidPause_withReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEvent:forSession:", 5, *(_QWORD *)(a1 + 40));
}

- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5
{
  id v6;
  NSObject *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteTextInputClient/inputSessionDidUnpause", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SFRemoteTextInputClient_inputSystemService_inputSessionDidUnpause_withReason___block_invoke;
  v10[3] = &unk_1E482D3A0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(dispatchQueue, v10);

  os_activity_scope_leave(&state);
}

uint64_t __80__SFRemoteTextInputClient_inputSystemService_inputSessionDidUnpause_withReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEvent:forSession:", 6, *(_QWORD *)(a1 + 40));
}

- (void)inputSystemService:(id)a3 inputSessionDocumentDidChange:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__SFRemoteTextInputClient_inputSystemService_inputSessionDocumentDidChange___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

uint64_t __76__SFRemoteTextInputClient_inputSystemService_inputSessionDocumentDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEvent:forSession:", 4, *(_QWORD *)(a1 + 40));
}

- (void)handleTextActionPayload:(id)a3
{
  id v4;
  int v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (gLogCategory_SFRemoteTextInputClient <= 30)
  {
    if (gLogCategory_SFRemoteTextInputClient != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      v6 = v4;
      LogPrintF();
      v4 = v7;
    }
  }
  -[SFRemoteTextInputClient fireEventHandlerWithPayload:](self, "fireEventHandlerWithPayload:", v4, v6);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)textInputDidBegin
{
  return self->_textInputDidBegin;
}

- (void)setTextInputDidBegin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)textInputDidEnd
{
  return self->_textInputDidEnd;
}

- (void)setTextInputDidEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textInputDidEnd, 0);
  objc_storeStrong(&self->_textInputDidBegin, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_rtiSourceSession, 0);
  objc_storeStrong((id *)&self->_rtiService, 0);
}

@end

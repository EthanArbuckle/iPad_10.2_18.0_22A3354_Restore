@implementation SFUserAlert

- (SFUserAlert)init
{
  SFUserAlert *v2;
  SFUserAlert *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFUserAlert;
  v2 = -[SFUserAlert init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_hasDefaultButton = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFUserAlert;
  -[SFUserAlert dealloc](&v2, sel_dealloc);
}

- (id)description
{
  id v3;
  id v4;
  void *v7;
  id v8;

  NSAppendPrintF();
  v8 = 0;
  -[SFUserAlert _mergedDict](self, "_mergedDict", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v3 = v8;

  NSAppendPrintF();
  v4 = v3;

  return v4;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__SFUserAlert_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__SFUserAlert_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)present
{
  if (self->_asBanner)
    -[SFUserAlert _presentBanner](self, "_presentBanner");
  else
    -[SFUserAlert _present](self, "_present");
}

- (void)_present
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SFUserAlert__present__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

_QWORD *__23__SFUserAlert__present__block_invoke(uint64_t a1)
{
  _QWORD *result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(*(id *)(a1 + 32), "createNotification");
  result = *(_QWORD **)(a1 + 32);
  if (result[2])
    return (_QWORD *)objc_msgSend(result, "_postNotification:");
  return result;
}

- (void)_handleResponseForNotification:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  NSObject *dispatchQueue;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  __CFString *ResponseValue;
  NSObject *v11;
  __CFString *v12;
  _QWORD v13[5];
  __CFString *v14;
  _QWORD v15[6];
  _QWORD block[6];
  _QWORD v17[3];
  int v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = (a4 & 3) + 1;
  dispatchQueue = self->_dispatchQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SFUserAlert__handleResponseForNotification_flags___block_invoke;
  block[3] = &unk_1E4830E48;
  block[4] = self;
  block[5] = v17;
  dispatch_async(dispatchQueue, block);
  CFUserNotificationGetResponseDictionary(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = self->_dispatchQueue;
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __52__SFUserAlert__handleResponseForNotification_flags___block_invoke_2;
    v15[3] = &unk_1E482D3A0;
    v15[4] = self;
    v15[5] = v8;
    dispatch_async(v9, v15);
  }
  if (self->_textInput && self->_textInputTitle)
  {
    ResponseValue = (__CFString *)CFUserNotificationGetResponseValue(a3, (CFStringRef)*MEMORY[0x1E0C9B880], 0);
    if (ResponseValue)
      ResponseValue = (__CFString *)-[__CFString copy](ResponseValue, "copy");
    v11 = self->_dispatchQueue;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __52__SFUserAlert__handleResponseForNotification_flags___block_invoke_3;
    v13[3] = &unk_1E482D3A0;
    v13[4] = self;
    v14 = ResponseValue;
    v12 = ResponseValue;
    dispatch_async(v11, v13);

  }
  _Block_object_dispose(v17, 8);
}

uint64_t __52__SFUserAlert__handleResponseForNotification_flags___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return result;
}

uint64_t __52__SFUserAlert__handleResponseForNotification_flags___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __52__SFUserAlert__handleResponseForNotification_flags___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_postNotification:(__CFUserNotification *)a3
{
  void *v4;
  void *v5;
  double timeout;
  void (**errorHandler)(id, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  double v15;
  _QWORD aBlock[6];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__SFUserAlert__postNotification___block_invoke;
  aBlock[3] = &unk_1E482E018;
  aBlock[4] = self;
  aBlock[5] = a3;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  timeout = self->_timeout;
  if (timeout >= 0.0)
  {
    (*((void (**)(void *))v4 + 2))(v4);
    goto LABEL_3;
  }
  if (gLogCategory_SFUserAlert <= 90)
  {
    if (gLogCategory_SFUserAlert != -1)
    {
LABEL_6:
      v15 = timeout;
      LogPrintF();
      goto LABEL_8;
    }
    if (_LogCategory_Initialize())
    {
      timeout = self->_timeout;
      goto LABEL_6;
    }
  }
LABEL_8:
  errorHandler = (void (**)(id, void *))self->_errorHandler;
  if (errorHandler)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2F90];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("?");
    if (v10)
      v12 = (const __CFString *)v10;
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1, *(_QWORD *)&v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -6737, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    errorHandler[2](errorHandler, v14);

  }
LABEL_3:

}

void __33__SFUserAlert__postNotification___block_invoke(uint64_t a1)
{
  void *v2;
  __CFRunLoop *Main;
  id v4;

  callbackRoutingDict();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v2);
  if (gLogCategory_SFUserAlert <= 50 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
    LogPrintF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = CFUserNotificationCreateRunLoopSource(0, *(CFUserNotificationRef *)(a1 + 40), (CFUserNotificationCallBack)notificationResponseHandler, 0);
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, *(CFRunLoopSourceRef *)(*(_QWORD *)(a1 + 32) + 32), (CFRunLoopMode)*MEMORY[0x1E0C9B280]);

}

- (void)_presentBanner
{
  if (gLogCategory_SFUserAlert <= 90 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

- (id)_defaultDictionary
{
  id v3;
  void *v4;
  NSString *title;
  NSString *message;
  NSString *defaultButtonTitle;
  NSString *alternateButtonTitle;
  NSString *otherButtonTitle;
  NSString *textInputTitle;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", title, *MEMORY[0x1E0C9B800]);
  message = self->_message;
  if (message)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", message, *MEMORY[0x1E0C9B810]);
  defaultButtonTitle = self->_defaultButtonTitle;
  if (defaultButtonTitle)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", defaultButtonTitle, *MEMORY[0x1E0C9B838]);
  alternateButtonTitle = self->_alternateButtonTitle;
  if (alternateButtonTitle)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", alternateButtonTitle, *MEMORY[0x1E0C9B830]);
  otherButtonTitle = self->_otherButtonTitle;
  if (otherButtonTitle)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", otherButtonTitle, *MEMORY[0x1E0C9B868]);
  if (self->_textInput)
  {
    textInputTitle = self->_textInputTitle;
    if (textInputTitle)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", textInputTitle, *MEMORY[0x1E0C9B878]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &stru_1E483B8E8, *MEMORY[0x1E0C9B880]);
    }
  }
  return v4;
}

- (__CFUserNotification)createNotification
{
  const __CFDictionary *v3;
  double timeout;
  CFOptionFlags v5;
  int v6;
  CFUserNotificationRef v7;
  __CFUserNotification *v8;
  int v10;
  NSObject *dispatchQueue;
  _QWORD block[5];
  int v13;
  SInt32 error;

  error = 0;
  -[SFUserAlert _mergedDict](self, "_mergedDict");
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!self->_title)
  {
    v10 = -6737;
    error = -6737;
    if (gLogCategory_SFUserAlert > 90)
      goto LABEL_28;
    if (gLogCategory_SFUserAlert == -1 && !_LogCategory_Initialize())
    {
LABEL_25:
      v10 = -6737;
      goto LABEL_28;
    }
LABEL_18:
    LogPrintF();
    goto LABEL_25;
  }
  timeout = self->_timeout;
  if (timeout < 0.0)
  {
    v10 = -6737;
    error = -6737;
    if (gLogCategory_SFUserAlert > 90)
      goto LABEL_28;
    if (gLogCategory_SFUserAlert == -1 && !_LogCategory_Initialize())
      goto LABEL_25;
    goto LABEL_18;
  }
  if (self->_hasDefaultButton)
    v5 = 3;
  else
    v5 = 35;
  if (gLogCategory_SFUserAlert <= 50)
  {
    if (gLogCategory_SFUserAlert != -1 || (v6 = _LogCategory_Initialize(), timeout = self->_timeout, v6))
    {
      LogPrintF();
      timeout = self->_timeout;
    }
  }
  v7 = CFUserNotificationCreate(0, timeout, v5, &error, v3);
  if (!error)
  {
    v8 = v7;
    goto LABEL_12;
  }
  if (gLogCategory_SFUserAlert <= 90 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v10 = -6700;
  error = -6700;
LABEL_28:
  if (self->_errorHandler)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__SFUserAlert_createNotification__block_invoke;
    block[3] = &unk_1E4830D68;
    block[4] = self;
    v13 = v10;
    dispatch_async(dispatchQueue, block);
  }
  v8 = 0;
LABEL_12:

  return v8;
}

void __33__SFUserAlert_createNotification__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v2 = *(int *)(a1 + 40);
  if ((_DWORD)v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0CB2F90];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("?");
    if (v5)
      v7 = (const __CFString *)v5;
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v9);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 0);
  }
}

- (id)_mergedDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SFUserAlert _defaultDictionary](self, "_defaultDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSDictionary mutableCopy](self->_additionalInfo, "mutableCopy");
  v5 = v4;
  v6 = v3;
  if (v4)
  {
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (void)updateNotification
{
  __CFUserNotification *cfNotif;
  CFOptionFlags v4;
  const __CFDictionary *v5;
  int v6;
  CFDictionaryRef dictionary;

  cfNotif = self->_cfNotif;
  if (cfNotif)
  {
    if (self->_hasDefaultButton)
      v4 = 3;
    else
      v4 = 35;
    -[SFUserAlert _mergedDict](self, "_mergedDict");
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    dictionary = v5;
    if (gLogCategory_SFUserAlert <= 50)
    {
      if (gLogCategory_SFUserAlert != -1 || (v6 = _LogCategory_Initialize(), v5 = dictionary, v6))
      {
        LogPrintF();
        v5 = dictionary;
      }
    }
    CFUserNotificationUpdate(cfNotif, self->_timeout, v4, v5);

  }
}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B55E0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __32__SFUserAlert__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E482DF78;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __32__SFUserAlert__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBCE8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFUserAlert <= 10 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

uint64_t __32__SFUserAlert__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __32__SFUserAlert__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SFUserAlert__interrupted__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__SFUserAlert__interrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidate
{
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (!self->_invalidateCalled)
  {
    if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_invalidateCalled = 1;
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection invalidate](xpcCnx, "invalidate");
      v4 = self->_xpcCnx;
      self->_xpcCnx = 0;

    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__SFUserAlert__invalidate__block_invoke;
    block[3] = &unk_1E482DF78;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __26__SFUserAlert__invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidated
{
  NSObject *dispatchQueue;
  __CFUserNotification *cfNotif;
  __CFUserNotification *v5;
  id errorHandler;
  id responseHandler;
  id textResponseHandler;
  id dictionaryResponseHandler;
  _QWORD block[5];

  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __27__SFUserAlert__invalidated__block_invoke;
      block[3] = &unk_1E482DF78;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
    cfNotif = self->_cfNotif;
    if (cfNotif)
    {
      CFUserNotificationCancel(cfNotif);
      v5 = self->_cfNotif;
      if (v5)
      {
        CFRelease(v5);
        self->_cfNotif = 0;
      }
    }
    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    responseHandler = self->_responseHandler;
    self->_responseHandler = 0;

    textResponseHandler = self->_textResponseHandler;
    self->_textResponseHandler = 0;

    dictionaryResponseHandler = self->_dictionaryResponseHandler;
    self->_dictionaryResponseHandler = 0;

    self->_invalidateDone = 1;
  }
}

void __27__SFUserAlert__invalidated__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (gLogCategory_SFUserAlert <= 50 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0CB2F90];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("?");
    if (v5)
      v7 = (const __CFString *)v5;
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -6762, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);

  }
}

- (void)userNotificationError:(id)a3
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
  v7[2] = __37__SFUserAlert_userNotificationError___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __37__SFUserAlert_userNotificationError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)userNotificationResponse:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];
  int v7;

  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SFUserAlert_userNotificationResponse___block_invoke;
  block[3] = &unk_1E4830D68;
  block[4] = self;
  v7 = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__SFUserAlert_userNotificationResponse___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 40));
  return result;
}

- (void)userNotificationTextResponse:(id)a3
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
  v7[2] = __44__SFUserAlert_userNotificationTextResponse___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __44__SFUserAlert_userNotificationTextResponse___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)userNotificationDictionaryResponse:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SFUserAlert_userNotificationDictionaryResponse___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __50__SFUserAlert_userNotificationDictionaryResponse___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *additionalInfo;
  NSURL *iconURL;
  NSString *message;
  NSURL *soundURL;
  NSString *textInputTitle;
  NSString *title;
  NSString *defaultButtonTitle;
  NSString *alternateButtonTitle;
  NSString *otherButtonTitle;
  id v14;

  v4 = a3;
  additionalInfo = self->_additionalInfo;
  v14 = v4;
  if (additionalInfo)
  {
    objc_msgSend(v4, "encodeObject:forKey:", additionalInfo, CFSTR("ai"));
    v4 = v14;
  }
  if (self->_asBanner)
  {
    objc_msgSend(v14, "encodeBool:forKey:", 1, CFSTR("ab"));
    v4 = v14;
  }
  iconURL = self->_iconURL;
  if (iconURL)
  {
    objc_msgSend(v14, "encodeObject:forKey:", iconURL, CFSTR("iu"));
    v4 = v14;
  }
  message = self->_message;
  if (message)
  {
    objc_msgSend(v14, "encodeObject:forKey:", message, CFSTR("me"));
    v4 = v14;
  }
  soundURL = self->_soundURL;
  if (soundURL)
  {
    objc_msgSend(v14, "encodeObject:forKey:", soundURL, CFSTR("su"));
    v4 = v14;
  }
  if (self->_textInput)
  {
    objc_msgSend(v14, "encodeBool:forKey:", 1, CFSTR("tin"));
    v4 = v14;
  }
  textInputTitle = self->_textInputTitle;
  if (textInputTitle)
  {
    objc_msgSend(v14, "encodeObject:forKey:", textInputTitle, CFSTR("tint"));
    v4 = v14;
  }
  if (self->_timeout != 0.0)
  {
    objc_msgSend(v14, "encodeDouble:forKey:", CFSTR("to"));
    v4 = v14;
  }
  title = self->_title;
  if (title)
  {
    objc_msgSend(v14, "encodeObject:forKey:", title, CFSTR("ti"));
    v4 = v14;
  }
  if (self->_hasDefaultButton)
  {
    objc_msgSend(v14, "encodeBool:forKey:", 1, CFSTR("hdb"));
    v4 = v14;
  }
  defaultButtonTitle = self->_defaultButtonTitle;
  if (defaultButtonTitle)
  {
    objc_msgSend(v14, "encodeObject:forKey:", defaultButtonTitle, CFSTR("dbt"));
    v4 = v14;
  }
  alternateButtonTitle = self->_alternateButtonTitle;
  if (alternateButtonTitle)
  {
    objc_msgSend(v14, "encodeObject:forKey:", alternateButtonTitle, CFSTR("abt"));
    v4 = v14;
  }
  otherButtonTitle = self->_otherButtonTitle;
  if (otherButtonTitle)
  {
    objc_msgSend(v14, "encodeObject:forKey:", otherButtonTitle, CFSTR("obt"));
    v4 = v14;
  }

}

- (SFUserAlert)initWithCoder:(id)a3
{
  id v4;
  SFUserAlert *v5;
  uint64_t v6;
  NSDictionary *additionalInfo;
  uint64_t v8;
  NSURL *iconURL;
  uint64_t v10;
  NSURL *soundURL;
  double v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFUserAlert;
  v5 = -[SFUserAlert init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ai"));
    v6 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iu"));
    v8 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("su"));
    v10 = objc_claimAutoreleasedReturnValue();
    soundURL = v5->_soundURL;
    v5->_soundURL = (NSURL *)v10;

    v5->_asBanner = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ab"));
    v5->_hasDefaultButton = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hdb"));
    v5->_textInput = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tin"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("to"));
    v5->_timeout = v12;
    v13 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

  }
  return v5;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)textResponseHandler
{
  return self->_textResponseHandler;
}

- (void)setTextResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)dictionaryResponseHandler
{
  return self->_dictionaryResponseHandler;
}

- (void)setDictionaryResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
  objc_storeStrong((id *)&self->_additionalInfo, a3);
}

- (BOOL)asBanner
{
  return self->_asBanner;
}

- (void)setAsBanner:(BOOL)a3
{
  self->_asBanner = a3;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSURL)soundURL
{
  return self->_soundURL;
}

- (void)setSoundURL:(id)a3
{
  objc_storeStrong((id *)&self->_soundURL, a3);
}

- (BOOL)textInput
{
  return self->_textInput;
}

- (void)setTextInput:(BOOL)a3
{
  self->_textInput = a3;
}

- (NSString)textInputTitle
{
  return self->_textInputTitle;
}

- (void)setTextInputTitle:(id)a3
{
  objc_storeStrong((id *)&self->_textInputTitle, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)hasDefaultButton
{
  return self->_hasDefaultButton;
}

- (void)setHasDefaultButton:(BOOL)a3
{
  self->_hasDefaultButton = a3;
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_defaultButtonTitle, a3);
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_alternateButtonTitle, a3);
}

- (NSString)otherButtonTitle
{
  return self->_otherButtonTitle;
}

- (void)setOtherButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_otherButtonTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherButtonTitle, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textInputTitle, 0);
  objc_storeStrong((id *)&self->_soundURL, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong(&self->_dictionaryResponseHandler, 0);
  objc_storeStrong(&self->_textResponseHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end

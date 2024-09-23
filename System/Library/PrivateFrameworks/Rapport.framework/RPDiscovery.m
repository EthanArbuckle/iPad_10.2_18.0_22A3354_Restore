@implementation RPDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPDiscovery)init
{
  RPDiscovery *v2;
  RPDiscovery *v3;
  RPDiscovery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPDiscovery;
  v2 = -[RPDiscovery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPDiscovery;
    v4 = v3;
  }

  return v3;
}

- (RPDiscovery)initWithCoder:(id)a3
{
  id v4;
  RPDiscovery *v5;
  RPDiscovery *v6;
  id v7;
  id v8;
  NSString *label;
  NSString *v10;
  id v11;
  RPDiscovery *v12;
  objc_super v14;
  uint64_t v15;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RPDiscovery;
  v5 = -[RPDiscovery init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPDiscovery;
    v15 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_changeFlags = v15;
    v7 = v4;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("ctlF")))
      v6->_controlFlags = objc_msgSend(v7, "decodeInt64ForKey:", CFSTR("ctlF"));

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    label = v6->_label;
    if (label)
    {
      v10 = objc_retainAutorelease(label);
      -[NSString UTF8String](v10, "UTF8String");
      LogCategoryReplaceF();

    }
    v11 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t changeFlags;
  unint64_t controlFlags;
  NSString *label;
  NSString *serviceType;
  id v9;

  v4 = a3;
  changeFlags = self->_changeFlags;
  v9 = v4;
  if ((_DWORD)changeFlags)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", changeFlags, CFSTR("chgF"));
    v4 = v9;
  }
  controlFlags = self->_controlFlags;
  if (controlFlags)
  {
    objc_msgSend(v9, "encodeInt64:forKey:", controlFlags, CFSTR("ctlF"));
    v4 = v9;
  }
  label = self->_label;
  if (label)
  {
    objc_msgSend(v9, "encodeObject:forKey:", label, CFSTR("label"));
    v4 = v9;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_msgSend(v9, "encodeObject:forKey:", serviceType, CFSTR("st"));
    v4 = v9;
  }

}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RPDiscovery;
  -[RPDiscovery dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[RPDiscovery descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id *v5;
  id *v6;
  int v7;
  NSMutableDictionary *endpointMap;
  id v9;
  NSString *serviceType;
  uint64_t v12;
  unint64_t controlFlags;
  uint64_t changeFlags;
  _QWORD v15[5];
  int v16;
  id v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = (id *)&v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v19 = 0;
  changeFlags = self->_changeFlags;
  controlFlags = self->_controlFlags;
  serviceType = self->_serviceType;
  NSAppendPrintF();
  objc_storeStrong(&v25, 0);
  if (a3 <= 30)
  {
    v5 = v21;
    obj = v21[5];
    v12 = -[NSMutableDictionary count](self->_endpointMap, "count", serviceType, controlFlags, &unk_1AF306AE8, changeFlags, &unk_1AF306D6D);
    NSAppendPrintF();
    objc_storeStrong(v5 + 5, obj);
    if (a3 <= 20)
    {
      v6 = v21;
      v17 = v21[5];
      NSAppendPrintF();
      objc_storeStrong(v6 + 5, v17);
      if (a3 >= 11)
        v7 = 50;
      else
        v7 = 30;
      endpointMap = self->_endpointMap;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __36__RPDiscovery_descriptionWithLevel___block_invoke;
      v15[3] = &unk_1E5F4F9D0;
      v15[4] = &v20;
      v16 = v7;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](endpointMap, "enumerateKeysAndObjectsUsingBlock:", v15, v12);
    }
  }
  v9 = v21[5];
  _Block_object_dispose(&v20, 8);

  return v9;
}

void __36__RPDiscovery_descriptionWithLevel___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v1 + 40);
  CUDescriptionWithLevel();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);

}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  RPDiscovery *v5;
  BOOL activateCalled;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  activateCalled = v5->_activateCalled;
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__RPDiscovery_activateWithCompletion___block_invoke;
  block[3] = &unk_1E5F4EEB0;
  block[4] = v5;
  v10 = v4;
  v11 = activateCalled;
  v8 = v4;
  dispatch_async(dispatchQueue, block);

  objc_sync_exit(v5);
}

void __38__RPDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    RPErrorF();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 40);
    v9 = v3;
    if (v4 <= 115)
    {
      if (v4 != -1 || (v6 = _LogCategory_Initialize(), v3 = v9, v6))
      {
        LogPrintF();
        v3 = v9;
      }
    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
      v3 = v9;
    }

  }
  else if (*(_BYTE *)(a1 + 48))
  {
    v5 = **(_DWORD **)(v2 + 40);
    if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }
  else
  {
    objc_msgSend((id)v2, "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
  }
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int var0;
  const char *v8;
  const char *v9;
  NSXPCConnection *xpcCnx;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  _QWORD v18[5];
  id v19;
  BOOL v20;

  v4 = a4;
  v6 = a3;
  var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      if (self->_targetUserSession)
        v8 = "(TargetUserSession)";
      else
        v8 = "";
      v14 = v8;
LABEL_14:
      LogPrintF();
    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if (self->_targetUserSession)
      v9 = "(TargetUserSession)";
    else
      v9 = "";
    v14 = v9;
    goto LABEL_14;
  }
  if (-[RPDiscovery _ensureXPCStarted](self, "_ensureXPCStarted", v14))
  {
    xpcCnx = self->_xpcCnx;
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__RPDiscovery__activateWithCompletion_reactivate___block_invoke;
    v18[3] = &unk_1E5F4F478;
    v20 = v4;
    v18[4] = self;
    v12 = v6;
    v19 = v12;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __50__RPDiscovery__activateWithCompletion_reactivate___block_invoke_2;
    v15[3] = &unk_1E5F4F4A0;
    v17 = v4;
    v15[4] = self;
    v16 = v12;
    objc_msgSend(v13, "xpcDiscoveryActivate:completion:", self, v15);

  }
  else
  {
    -[RPDiscovery _scheduleRetry](self, "_scheduleRetry");
    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __50__RPDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      v5 = v6;
LABEL_8:
      LogPrintF();
    }
  }
  else if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
  {
    v5 = v6;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "_scheduleRetry", v5);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

void __50__RPDiscovery__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void (*v21)(void);
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v30 = v5;
  if (!v6)
  {
    v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v14 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          if (!v14)
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v16 = *(_QWORD *)(a1 + 32);
            v17 = *(void **)(v16 + 16);
            *(_QWORD *)(v16 + 16) = v15;

            v14 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          }
          objc_msgSend(v13, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v18);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v10);
    }

    objc_sync_exit(v8);
    v19 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 40);
    if (*(_BYTE *)(a1 + 48))
    {
      if (v19 > 30 || v19 == -1 && !_LogCategory_Initialize())
        goto LABEL_38;
    }
    else if (v19 > 30 || v19 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_38;
    }
    objc_msgSend(v9, "count");
    LogPrintF();
LABEL_38:
    v23 = *(_QWORD *)(a1 + 40);
    if (v23)
      (*(void (**)(uint64_t, _QWORD))(v23 + 16))(v23, 0);
    v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    if (v24)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v25 = v9;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v32 != v27)
              objc_enumerationMutation(v25);
            v24[2](v24, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v26);
      }

    }
    v6 = 0;
    goto LABEL_50;
  }
  v7 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
    {
      v29 = v6;
LABEL_22:
      LogPrintF();
    }
  }
  else if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
  {
    v29 = v6;
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "code", v29) == -71168)
  {
    v20 = *(_QWORD *)(a1 + 40);
    if (v20)
    {
      v21 = *(void (**)(void))(v20 + 16);
LABEL_34:
      v21();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_scheduleRetry");
    v22 = *(_QWORD *)(a1 + 40);
    if (v22)
    {
      v21 = *(void (**)(void))(v22 + 16);
      goto LABEL_34;
    }
  }
LABEL_50:

}

- (BOOL)_ensureXPCStarted
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSXPCConnection *v7;
  NSXPCConnection *xpcCnx;
  void *v9;
  uint64_t v10;
  int var0;
  _QWORD v13[5];
  _QWORD v14[5];

  if (!self->_xpcCnx)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4ABD8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    v5 = objc_opt_class();
    v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_xpcDiscoveryActivate_completion_, 0, 1);

    v7 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.CompanionLink"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v7;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE3CEE8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v3);
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __32__RPDiscovery__ensureXPCStarted__block_invoke;
    v14[3] = &unk_1E5F4EC60;
    v14[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v14);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __32__RPDiscovery__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_1E5F4EC60;
    v13[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v13);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();

  }
  return 1;
}

uint64_t __32__RPDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __32__RPDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = **(_DWORD **)(v4 + 40);
  if (*(_BYTE *)(v4 + 24))
  {
    if (v5 <= 30)
    {
      if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 32), v6))
      {
        LogPrintF();
        v4 = *(_QWORD *)(a1 + 32);
      }
    }
    return objc_msgSend((id)v4, "_invalidated");
  }
  else
  {
    if (v5 <= 90)
    {
      if (v5 != -1 || (v8 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 32), v8))
      {
        LogPrintF();
        v4 = *(_QWORD *)(a1 + 32);
      }
    }
    return objc_msgSend((id)v4, "_scheduleRetry");
  }
}

- (void)_interrupted
{
  int var0;
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[RPDiscovery _lostAllEndpoints](self, "_lostAllEndpoints");
  if (self->_activateCalled)
    -[RPDiscovery _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__RPDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__RPDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    v3 = *(_QWORD *)(result + 32);
    v4 = **(_DWORD **)(v3 + 40);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(v2 + 32), v5))
      {
        LogPrintF();
        v3 = *(_QWORD *)(v2 + 32);
      }
    }
    v6 = *(void **)(v3 + 32);
    if (v6)
    {
      v7 = v6;
      dispatch_source_cancel(v7);
      v8 = *(_QWORD *)(v2 + 32);
      v9 = *(void **)(v8 + 32);
      *(_QWORD *)(v8 + 32) = 0;

    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 48), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  OS_dispatch_source *retryTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  id foundHandler;
  id lostHandler;
  id changedHandler;
  id interruptionHandler;
  id v11;
  int var0;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v5 = retryTimer;
      dispatch_source_cancel(v5);
      v6 = self->_retryTimer;
      self->_retryTimer = 0;

    }
    foundHandler = self->_foundHandler;
    self->_foundHandler = 0;

    lostHandler = self->_lostHandler;
    self->_lostHandler = 0;

    changedHandler = self->_changedHandler;
    self->_changedHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v11 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)_scheduleRetry
{
  OS_dispatch_source *v3;
  OS_dispatch_source *retryTimer;
  NSObject *v5;
  _QWORD handler[5];

  if (!self->_invalidateCalled && !self->_retryTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v3;

    v5 = self->_retryTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __29__RPDiscovery__scheduleRetry__block_invoke;
    handler[3] = &unk_1E5F4EC60;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
}

_BYTE *__29__RPDiscovery__scheduleRetry__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _BYTE *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 40);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v5 = *(void **)(v2 + 32);
  if (v5)
  {
    v6 = v5;
    dispatch_source_cancel(v6);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0;

  }
  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "_activateWithCompletion:reactivate:", 0, 1);
  return result;
}

- (NSArray)discoveredEndpoints
{
  RPDiscovery *v2;
  NSMutableDictionary *endpointMap;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  endpointMap = v2->_endpointMap;
  if (endpointMap)
  {
    -[NSMutableDictionary allValues](endpointMap, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)_lostAllEndpoints
{
  int var0;
  void (**v4)(_QWORD, _QWORD);
  RPDiscovery *v5;
  NSMutableDictionary *endpointMap;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_lostHandler);
  v5 = self;
  objc_sync_enter(v5);
  endpointMap = v5->_endpointMap;
  if (v4)
  {
    -[NSMutableDictionary allValues](endpointMap, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](v5->_endpointMap, "removeAllObjects");
    objc_sync_exit(v5);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](endpointMap, "removeAllObjects");
    objc_sync_exit(v5);

  }
}

- (void)xpcDiscoveryFoundEndpoint:(id)a3
{
  RPDiscovery *v4;
  void *v5;
  NSMutableDictionary *endpointMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  v5 = v12;
  endpointMap = v4->_endpointMap;
  if (!endpointMap)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = v4->_endpointMap;
    v4->_endpointMap = v7;

    endpointMap = v4->_endpointMap;
    v5 = v12;
  }
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](endpointMap, "setObject:forKeyedSubscript:", v12, v9);

  objc_sync_exit(v4);
  v10 = MEMORY[0x1AF45BE48](v4->_foundHandler);
  v11 = (void *)v10;
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v12);

}

- (void)xpcDiscoveryLostEndpoint:(id)a3
{
  RPDiscovery *v4;
  NSMutableDictionary *endpointMap;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  endpointMap = v4->_endpointMap;
  objc_msgSend(v9, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](endpointMap, "setObject:forKeyedSubscript:", 0, v6);

  objc_sync_exit(v4);
  v7 = MEMORY[0x1AF45BE48](v4->_lostHandler);
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);

}

- (void)xpcDiscoveryChangedEndpoint:(id)a3
{
  RPDiscovery *v4;
  NSMutableDictionary *endpointMap;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  endpointMap = v4->_endpointMap;
  objc_msgSend(v9, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](endpointMap, "setObject:forKeyedSubscript:", v9, v6);

  objc_sync_exit(v4);
  v7 = MEMORY[0x1AF45BE48](v4->_changedHandler);
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
}

- (id)foundHandler
{
  return self->_foundHandler;
}

- (void)setFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)lostHandler
{
  return self->_lostHandler;
}

- (void)setLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)changedHandler
{
  return self->_changedHandler;
}

- (void)setChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_changedHandler, 0);
  objc_storeStrong(&self->_lostHandler, 0);
  objc_storeStrong(&self->_foundHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_endpointMap, 0);
}

@end

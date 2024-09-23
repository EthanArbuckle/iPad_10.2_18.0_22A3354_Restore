@implementation RPLegacyService

- (RPLegacyService)init
{
  RPLegacyService *v2;
  RPLegacyService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPLegacyService;
  v2 = -[RPLegacyService init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    *(_QWORD *)&v3->_tcpSockV4 = -1;
  }
  return v3;
}

- (void)dealloc
{
  RPLegacyService *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (RPLegacyService *)FatalErrorF();
    -[RPLegacyService _cleanup](v3, v4);
  }
  else
  {
    -[RPLegacyService _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)RPLegacyService;
    -[RPLegacyService dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  NSMutableDictionary *requestMap;
  id errorHandler;
  id interruptionHandler;
  id invalidationHandler;
  id sessionStartedHandler;
  id sessionEndedHandler;
  id showPINHandler;
  id hidePINHandler;

  -[NSMutableDictionary removeAllObjects](self->_requestMap, "removeAllObjects");
  requestMap = self->_requestMap;
  self->_requestMap = 0;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  sessionStartedHandler = self->_sessionStartedHandler;
  self->_sessionStartedHandler = 0;

  sessionEndedHandler = self->_sessionEndedHandler;
  self->_sessionEndedHandler = 0;

  showPINHandler = self->_showPINHandler;
  self->_showPINHandler = 0;

  hidePINHandler = self->_hidePINHandler;
  self->_hidePINHandler = 0;

}

- (id)description
{
  NSAppendPrintF();
  return 0;
}

- (void)activateWithCompletion:(id)a3
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
  v7[2] = __42__RPLegacyService_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __42__RPLegacyService_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  NSString *serviceType;
  void (**errorHandler)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_invalidateCalled)
    goto LABEL_17;
  if (self->_activateCalled)
    goto LABEL_17;
  serviceType = self->_serviceType;
  if (!serviceType)
    goto LABEL_17;
  self->_activateCalled = 1;
  if (*-[NSString UTF8String](serviceType, "UTF8String") == 95)
  {
    if (!-[RPLegacyService _tcpStart](self, "_tcpStart")
      && !-[RPLegacyService _bonjourUpdateService](self, "_bonjourUpdateService"))
    {
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  if (gLogCategory_RPLegacySupport <= 90)
  {
    if (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize())
      LogPrintF();
LABEL_17:
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  errorHandler = (void (**)(id, void *))self->_errorHandler;
  if (errorHandler)
  {
    RPErrorF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    errorHandler[2](errorHandler, v6);

  }
LABEL_23:
  v7 = v9;
  if (v9)
  {
    RPErrorF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v8);

    v7 = v9;
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__RPLegacyService_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__RPLegacyService_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int tcpSockV4;
  int tcpSockV6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_bonjourAdvertiser)
      BonjourAdvertiserStop();
    tcpSockV4 = self->_tcpSockV4;
    if ((tcpSockV4 & 0x80000000) == 0)
    {
      if (close(tcpSockV4) && *__error())
        __error();
      self->_tcpSockV4 = -1;
    }
    tcpSockV6 = self->_tcpSockV6;
    if ((tcpSockV6 & 0x80000000) == 0)
    {
      if (close(tcpSockV6))
      {
        if (*__error())
          __error();
      }
      self->_tcpSockV6 = -1;
    }
    -[RPLegacyService _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_bonjourAdvertiser)
    {
      invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler)
        invalidationHandler[2]();
      -[RPLegacyService _cleanup](self, "_cleanup");
      self->_invalidateDone = 1;
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__RPLegacyService_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_1E5F4F540;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __53__RPLegacyService_registerRequestID_options_handler___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1[4] + 16))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

  }
  v9[0] = CFSTR("handler");
  v5 = MEMORY[0x1AF45BE48](a1[7]);
  v6 = (void *)v5;
  v9[1] = CFSTR("options");
  v7 = a1[6];
  if (!v7)
    v7 = MEMORY[0x1E0C9AA70];
  v10[0] = v5;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v8, a1[5]);

}

- (int)_bonjourUpdateService
{
  BonjourAdvertiserPrivate **p_bonjourAdvertiser;
  int v4;
  int v5;
  NSString *serviceType;

  p_bonjourAdvertiser = &self->_bonjourAdvertiser;
  if (self->_bonjourAdvertiser)
  {
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      serviceType = self->_serviceType;
      LogPrintF();
    }
    v4 = -[RPLegacyService _bonjourUpdateTXT](self, "_bonjourUpdateTXT", serviceType);
    if (!v4)
    {
      v5 = BonjourAdvertiserUpdate();
      goto LABEL_11;
    }
  }
  else
  {
    if (gLogCategory_RPLegacySupport <= 30)
    {
      if (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (*p_bonjourAdvertiser)
      {
        BonjourAdvertiserStop();
        CFRelease(*p_bonjourAdvertiser);
        *p_bonjourAdvertiser = 0;
      }
    }
    v4 = BonjourAdvertiserCreate();
    if (!v4)
    {
      BonjourAdvertiserSetDispatchQueue();
      BonjourAdvertiserSetPort();
      -[NSString UTF8String](self->_serviceType, "UTF8String");
      BonjourAdvertiserSetServiceType();
      v4 = -[RPLegacyService _bonjourUpdateTXT](self, "_bonjourUpdateTXT");
      if (!v4)
      {
        v5 = BonjourAdvertiserStart();
LABEL_11:
        v4 = v5;
        if (!v5)
          return v4;
      }
    }
  }
  if (gLogCategory_RPLegacySupport <= 60
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v4;
}

- (int)_bonjourUpdateTXT
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  const char *v9;
  size_t v10;
  uint8_t v11;
  DNSServiceErrorType v12;
  int v13;
  int v14;
  int v15;
  NSDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE value[256];
  _BYTE buffer[256];
  TXTRecordRef txtRecord;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  txtRecord = 0uLL;
  TXTRecordCreate(&txtRecord, 0x100u, buffer);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_txtDictionary;
  v3 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v3)
    goto LABEL_15;
  v4 = v3;
  v5 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v19 != v5)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      -[NSDictionary objectForKeyedSubscript:](self->_txtDictionary, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (gLogCategory_RPLegacySupport > 90
          || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_47;
        }
        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = 0;
          v11 = 0;
          goto LABEL_12;
        }
        if (gLogCategory_RPLegacySupport > 90
          || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
        {
LABEL_47:
          v14 = -6756;
LABEL_48:

          goto LABEL_49;
        }
LABEL_36:
        LogPrintF();
        goto LABEL_47;
      }
      v9 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      v10 = strlen(v9);
      if (v10 >= 0x100)
      {
        if (gLogCategory_RPLegacySupport <= 90
          && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v14 = -6743;
        goto LABEL_48;
      }
      v11 = v10;
LABEL_12:
      v12 = TXTRecordSetValue(&txtRecord, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), v11, v9);
      if (v12)
      {
        v14 = v12;
        if (gLogCategory_RPLegacySupport <= 90
          && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_48;
      }

    }
    v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v4)
      continue;
    break;
  }
LABEL_15:

  if (self->_deviceActionType)
  {
    v13 = SNPrintF();
    if (v13 <= 255)
    {
      v14 = TXTRecordSetValue(&txtRecord, "rpFl", v13, value);
      if (!v14)
        goto LABEL_18;
      goto LABEL_49;
    }
LABEL_54:
    v14 = -6743;
    goto LABEL_49;
  }
LABEL_18:
  if (self->_needsSetup)
  {
    v15 = SNPrintF();
    if (v15 > 255)
      goto LABEL_54;
    v14 = TXTRecordSetValue(&txtRecord, "rpDA", v15, value);
    if (v14)
      goto LABEL_49;
  }
  if (!self->_bonjourAdvertiser)
  {
    v14 = -6762;
    goto LABEL_49;
  }
  TXTRecordGetBytesPtr(&txtRecord);
  TXTRecordGetLength(&txtRecord);
  if (gLogCategory_RPLegacySupport <= 20
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v14 = BonjourAdvertiserSetTXTRecord();
  if (v14)
  {
LABEL_49:
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  TXTRecordDeallocate(&txtRecord);
  return v14;
}

- (int)_tcpStart
{
  int v3;

  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if ((self->_tcpSockV4 & 0x80000000) == 0 || (self->_tcpSockV6 & 0x80000000) == 0)
  {
    v3 = -6721;
    goto LABEL_8;
  }
  v3 = ServerSocketPairOpen();
  if (v3)
  {
LABEL_8:
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return v3;
  }
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

- (unsigned)advertiseRate
{
  return self->_advertiseRate;
}

- (void)setAdvertiseRate:(unsigned int)a3
{
  self->_advertiseRate = a3;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  self->_deviceActionType = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)needsSetup
{
  return self->_needsSetup;
}

- (void)setNeedsSetup:(BOOL)a3
{
  self->_needsSetup = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (void)setTxtDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)sessionStartedHandler
{
  return self->_sessionStartedHandler;
}

- (void)setSessionStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)sessionEndedHandler
{
  return self->_sessionEndedHandler;
}

- (void)setSessionEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)showPINHandler
{
  return self->_showPINHandler;
}

- (void)setShowPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_txtDictionary, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_requestMap, 0);
}

@end

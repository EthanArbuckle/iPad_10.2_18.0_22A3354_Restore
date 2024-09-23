@implementation RPAppSignInService

- (RPAppSignInService)init
{
  RPAppSignInService *v2;
  RPAppSignInService *v3;
  RPAppSignInService *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPAppSignInService;
  v2 = -[RPAppSignInService init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (id)description
{
  NSAppendPrintF();
  return 0;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__RPAppSignInService_activate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__RPAppSignInService_activate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    *(_BYTE *)(v1 + 8) = 1;
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v2 + 32), "_activate");
  }
  return result;
}

- (void)_activate
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RPAppSignInService *v9;

  if (gLogCategory_RPAppSignInService <= 30
    && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = objc_alloc_init(getSFServiceClass());
  objc_storeStrong((id *)&self->_bleAdvertiser, v3);
  objc_msgSend(v3, "setDeviceActionType:", 28);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__RPAppSignInService__activate__block_invoke;
  v7[3] = &unk_1E5F4EC88;
  v8 = v3;
  v9 = self;
  v6 = v3;
  objc_msgSend(v6, "activateWithCompletion:", v7);

}

void __31__RPAppSignInService__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
  {
    if (v3)
    {
      v9 = v3;
      if (gLogCategory_RPAppSignInService <= 30
        && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
      {
        v8 = v9;
        LogPrintF();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "invalidate", v8);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = 0;

      goto LABEL_11;
    }
    if (gLogCategory_RPAppSignInService <= 30)
    {
      v9 = 0;
      if (gLogCategory_RPAppSignInService != -1 || (v7 = _LogCategory_Initialize(), v4 = 0, v7))
      {
        LogPrintF();
LABEL_11:
        v4 = v9;
      }
    }
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__RPAppSignInService_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPAppSignInService_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v2 + 32), "_invalidate");
  }
  return result;
}

- (void)_invalidate
{
  SFService *bleAdvertiser;

  if (self->_bleAdvertiser)
  {
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFService invalidate](self->_bleAdvertiser, "invalidate");
    bleAdvertiser = self->_bleAdvertiser;
    self->_bleAdvertiser = 0;

  }
  -[RPAppSignInService _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

@end

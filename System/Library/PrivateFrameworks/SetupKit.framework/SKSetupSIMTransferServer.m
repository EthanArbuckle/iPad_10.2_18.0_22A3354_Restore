@implementation SKSetupSIMTransferServer

- (SKSetupSIMTransferServer)init
{
  SKSetupSIMTransferServer *v2;
  SKSetupSIMTransferServer *v3;
  SKSetupSIMTransferServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupSIMTransferServer;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupSIMTransferServer);
  v3 = v2;
  if (v2)
  {
    v2->super._bluetoothUseCase = 258;
    v4 = v2;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v7;

  if ((a3 & 0x8000000) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v3 = (__CFString *)0;

  }
  v4 = &stru_24D22B2A0;
  if (v3)
    v4 = v3;
  v5 = v4;

  return v5;
}

- (void)_activate
{
  objc_super v3;

  if (self->super._sendDataHandler)
    -[SKSetupSIMTransferServer _oobEnsureStarted](self, "_oobEnsureStarted");
  else
    -[SKSetupSIMTransferServer _bleServerEnsureStarted](self, "_bleServerEnsureStarted");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupSIMTransferServer;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_invalidate
{
  objc_super v3;

  -[SKSetupSIMTransferServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  -[SKSetupSIMTransferServer _bleServerEnsureStopped](self, "_bleServerEnsureStopped");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupSIMTransferServer;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_run
{
  if (-[SKSetupSIMTransferServer _bleAdvertiserShouldRun](self, "_bleAdvertiserShouldRun"))
    -[SKSetupSIMTransferServer _bleAdvertiserEnsureStarted](self, "_bleAdvertiserEnsureStarted");
  else
    -[SKSetupSIMTransferServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
}

- (BOOL)_bleAdvertiserShouldRun
{
  int v3;

  v3 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
  if (v3)
    LOBYTE(v3) = self->super._skCnx == 0;
  return v3;
}

- (void)_bleAdvertiserEnsureStarted
{
  CBAdvertiser **p_bleAdvertiser;
  id v4;
  uint64_t v5;
  int var0;
  const char *v7;
  id v8;
  const char *v9;
  _QWORD v10[6];

  p_bleAdvertiser = &self->_bleAdvertiser;
  if (!self->_bleAdvertiser)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBB218]);
    objc_storeStrong((id *)p_bleAdvertiser, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v4, "setNearbyActionFlags:", 64);
    if (self->_useSecondTrigger)
      v5 = 45;
    else
      v5 = 2;
    objc_msgSend(v4, "setNearbyActionType:", v5);
    objc_msgSend(v4, "setUseCase:", 258);
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      if (self->_useSecondTrigger)
        v7 = "yes";
      else
        v7 = "no";
      v8 = v4;
      v9 = v7;
      LogPrintF();
    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__SKSetupSIMTransferServer__bleAdvertiserEnsureStarted__block_invoke;
    v10[3] = &unk_24D22B140;
    v10[4] = v4;
    v10[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v10, v8, v9);

  }
}

- (void)_bleAdvertiserEnsureStopped
{
  CBAdvertiser *bleAdvertiser;
  int var0;
  int v5;
  CBAdvertiser *v6;
  CBAdvertiser *v7;

  bleAdvertiser = self->_bleAdvertiser;
  if (bleAdvertiser)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (v5 = _LogCategory_Initialize(), bleAdvertiser = self->_bleAdvertiser, v5))
      {
        v7 = bleAdvertiser;
        LogPrintF();
        bleAdvertiser = self->_bleAdvertiser;
      }
    }
  }
  -[CBAdvertiser invalidate](bleAdvertiser, "invalidate", v7);
  v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0;

}

- (void)_bleServerEnsureStarted
{
  CBServer **p_bleServer;
  id v4;
  uint64_t v5;
  int var0;
  id v7;
  _QWORD v8[6];
  _QWORD v9[6];

  p_bleServer = &self->_bleServer;
  if (!self->_bleServer)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBB298]);
    objc_storeStrong((id *)p_bleServer, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v4, "setBleListenPSM:", 130);
    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke;
    v9[3] = &unk_24D22A798;
    v9[4] = v4;
    v9[5] = self;
    objc_msgSend(v4, "setAcceptHandler:", v9);
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v7 = v4;
      LogPrintF();
    }
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke_2;
    v8[3] = &unk_24D22B140;
    v8[4] = v4;
    v8[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v8, v7);

  }
}

- (void)_bleServerEnsureStopped
{
  int var0;
  CBServer *bleServer;

  if (self->_bleServer)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  -[CBServer invalidate](self->_bleServer, "invalidate");
  bleServer = self->_bleServer;
  self->_bleServer = 0;

}

- (void)_bleServerAcceptConnecton:(id)a3
{
  SKConnection *v4;
  SKConnection *v5;
  int var0;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = self->super._skCnx;
  if (!v4)
  {
    v5 = objc_alloc_init(SKConnection);
    -[SKConnection setBleConnection:](v5, "setBleConnection:", v11);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", v5, 0, 0, &__block_literal_global_1084);
    goto LABEL_8;
  }
  v5 = v4;
  var0 = self->super._ucat->var0;
  if (var0 > 90)
    goto LABEL_7;
  v7 = v11;
  if (var0 == -1)
  {
    if (_LogCategory_Initialize())
    {
      v7 = v11;
      goto LABEL_4;
    }
LABEL_7:
    objc_msgSend(v11, "invalidate", v8, v10);
    goto LABEL_8;
  }
LABEL_4:
  v9 = v7;
  LogPrintF();
  objc_msgSend(v11, "invalidate", v9, v5);
LABEL_8:

}

- (void)_oobEnsureStarted
{
  SKConnection *v3;

  if (!self->super._skCnx)
  {
    v3 = objc_alloc_init(SKConnection);
    -[SKConnection setSendDataHandler:](v3, "setSendDataHandler:", self->super._sendDataHandler);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", v3, 0, 0, &__block_literal_global_22);

  }
}

- (BOOL)useSecondTrigger
{
  return self->_useSecondTrigger;
}

- (void)setUseSecondTrigger:(BOOL)a3
{
  self->_useSecondTrigger = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bleServer, 0);
  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

void __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, _QWORD);
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  int v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v6 + 216))
  {
    v8 = **(_DWORD **)(v6 + 144);
    v9 = v12;
    if (v8 <= 30)
    {
      if (v8 == -1)
      {
        v10 = _LogCategory_Initialize();
        v6 = *(_QWORD *)(a1 + 40);
        if (!v10)
        {
          v9 = v12;
          goto LABEL_8;
        }
        v9 = v12;
      }
      v11 = v9;
      LogPrintF();
      v9 = v12;
      v6 = *(_QWORD *)(a1 + 40);
    }
LABEL_8:
    objc_msgSend((id)v6, "_bleServerAcceptConnecton:", v9, v11);
    objc_msgSend(*(id *)(a1 + 40), "_run");
    v5[2](v5, 0);
    goto LABEL_9;
  }
  NSErrorF_safe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v7);

LABEL_9:
}

void __51__SKSetupSIMTransferServer__bleServerEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v5 == *(_QWORD *)(v4 + 216))
  {
    v6 = **(_DWORD **)(v4 + 144);
    v12 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v10);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 216);
      *(_QWORD *)(v7 + 216) = 0;

      goto LABEL_13;
    }
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        v11 = v5;
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 40), "_run", v11);
LABEL_13:
        v3 = v12;
        goto LABEL_14;
      }
      v9 = _LogCategory_Initialize();
      v4 = *(_QWORD *)(a1 + 40);
      if (v9)
      {
        v5 = *(_QWORD *)(a1 + 32);
        goto LABEL_8;
      }
    }
    objc_msgSend((id)v4, "_run", v10);
    goto LABEL_13;
  }
LABEL_14:

}

void __55__SKSetupSIMTransferServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 208))
  {
    v9 = v3;
    if (v3)
    {
      v5 = **(_DWORD **)(v4 + 144);
      if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 208);
      *(_QWORD *)(v6 + 208) = 0;

    }
    else
    {
      objc_msgSend((id)v4, "_run");
    }
    v3 = v9;
  }

}

@end

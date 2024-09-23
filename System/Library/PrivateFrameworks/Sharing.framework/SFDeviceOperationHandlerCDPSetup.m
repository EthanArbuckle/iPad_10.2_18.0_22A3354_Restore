@implementation SFDeviceOperationHandlerCDPSetup

- (SFDeviceOperationHandlerCDPSetup)init
{
  SFDeviceOperationHandlerCDPSetup *v2;
  SFDeviceOperationHandlerCDPSetup *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  SFDeviceOperationHandlerCDPSetup *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFDeviceOperationHandlerCDPSetup;
  v2 = -[SFDeviceOperationHandlerCDPSetup init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFDeviceOperationHandlerCDPSetup_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__SFDeviceOperationHandlerCDPSetup_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  SFSession *sfSession;
  _QWORD v4[5];

  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  if (sfSession)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__SFDeviceOperationHandlerCDPSetup__activate__block_invoke;
    v4[3] = &unk_1E482E2D0;
    v4[4] = self;
    -[SFSession registerRequestID:options:handler:](sfSession, "registerRequestID:options:handler:", CFSTR("_cdpSetup"), 0, v4);
  }
  else if (gLogCategory_SFDeviceOperationCDPSetup <= 90
         && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __45__SFDeviceOperationHandlerCDPSetup__activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCDPSetupRequest:responseHandler:");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SFDeviceOperationHandlerCDPSetup_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __46__SFDeviceOperationHandlerCDPSetup_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

  v11 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 32));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = 0;

  if (v11)
  {
    NSErrorWithOSStatusF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v11 + 2))(v11, v8, 0, 0);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "deregisterRequestID:", CFSTR("_cdpSetup"));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 64);
  *(_QWORD *)(v9 + 64) = 0;

}

- (void)_handleCDPSetupRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  NSString *altDSIDNeedingRepair;
  Class v9;
  CDPContext *v10;
  CDPContext *cdpContext;
  CDPContext *v12;
  CDPStateController *v13;
  CDPStateController *cdpController;
  void *v15;
  id responseHandler;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (self->_responseHandler)
  {
    NSErrorWithOSStatusF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFDeviceOperationCDPSetup <= 90
      && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, v7, 0, 0);
  }
  else
  {
    -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_19;
    if (gLogCategory_SFDeviceOperationCDPSetup <= 30
      && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    altDSIDNeedingRepair = self->_altDSIDNeedingRepair;
    v9 = (Class)getCDPContextClass[0]();
    if (altDSIDNeedingRepair)
      -[objc_class contextForAccountWithAltDSID:](v9, "contextForAccountWithAltDSID:", self->_altDSIDNeedingRepair);
    else
      -[objc_class contextForPrimaryAccount](v9, "contextForPrimaryAccount");
    v10 = (CDPContext *)objc_claimAutoreleasedReturnValue();
    cdpContext = self->_cdpContext;
    self->_cdpContext = v10;

    v12 = self->_cdpContext;
    if (v12)
    {
      -[CDPContext setSharingChannel:](v12, "setSharingChannel:", v7);
      v13 = (CDPStateController *)objc_msgSend(objc_alloc((Class)getCDPStateControllerClass[0]()), "initWithContext:", self->_cdpContext);
      cdpController = self->_cdpController;
      self->_cdpController = v13;

      -[CDPStateController setUiProvider:](self->_cdpController, "setUiProvider:", self);
      v15 = _Block_copy(v6);
      responseHandler = self->_responseHandler;
      self->_responseHandler = v15;

      if (CFDictionaryGetInt64())
        -[SFDeviceOperationHandlerCDPSetup _repairCDP](self, "_repairCDP");
      else
        -[SFDeviceOperationHandlerCDPSetup _handleCDP](self, "_handleCDP");
    }
    else
    {
LABEL_19:
      NSErrorWithOSStatusF();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFDeviceOperationCDPSetup <= 90
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, v17, 0, 0);

    }
  }

}

- (void)_handleCDP
{
  CDPStateController *cdpController;
  _QWORD v3[5];

  cdpController = self->_cdpController;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__SFDeviceOperationHandlerCDPSetup__handleCDP__block_invoke;
  v3[3] = &unk_1E4832578;
  v3[4] = self;
  -[CDPStateController handleCloudDataProtectionStateWithCompletion:](cdpController, "handleCloudDataProtectionStateWithCompletion:", v3);
}

void __46__SFDeviceOperationHandlerCDPSetup__handleCDP__block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  char v13;
  char v14;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SFDeviceOperationHandlerCDPSetup__handleCDP__block_invoke_2;
  block[3] = &unk_1E4832550;
  block[4] = v8;
  v12 = v7;
  v13 = a3;
  v14 = a2;
  v10 = v7;
  dispatch_async(v9, block);

}

void __46__SFDeviceOperationHandlerCDPSetup__handleCDP__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(void **)(a1 + 40);
  if (v4 || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) && !*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_SFDeviceOperationCDPSetup <= 90)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup != -1
        || (v5 = _LogCategory_Initialize(), v4 = *(void **)(a1 + 40), v5))
      {
        LogPrintF();
        v4 = *(void **)(a1 + 40);
      }
    }
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      SFErrorF();
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (v9)
      (*((void (**)(id, id, _QWORD, _QWORD))v9 + 2))(v9, v6, 0, 0);

    goto LABEL_17;
  }
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, MEMORY[0x1E0C9AA70]);
LABEL_17:
    v8 = v9;
  }

}

- (void)_repairCDP
{
  CDPStateController *cdpController;
  _QWORD v3[5];

  cdpController = self->_cdpController;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__SFDeviceOperationHandlerCDPSetup__repairCDP__block_invoke;
  v3[3] = &unk_1E482F150;
  v3[4] = self;
  -[CDPStateController repairCloudDataProtectionStateWithCompletion:](cdpController, "repairCloudDataProtectionStateWithCompletion:", v3);
}

void __46__SFDeviceOperationHandlerCDPSetup__repairCDP__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SFDeviceOperationHandlerCDPSetup__repairCDP__block_invoke_2;
  block[3] = &unk_1E4832528;
  block[4] = v6;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __46__SFDeviceOperationHandlerCDPSetup__repairCDP__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(void **)(a1 + 40);
  if (v4 || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) && !*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_SFDeviceOperationCDPSetup <= 90)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup != -1
        || (v5 = _LogCategory_Initialize(), v4 = *(void **)(a1 + 40), v5))
      {
        LogPrintF();
        v4 = *(void **)(a1 + 40);
      }
    }
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      SFErrorF();
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (v9)
      (*((void (**)(id, id, _QWORD, _QWORD))v9 + 2))(v9, v6, 0, 0);

    goto LABEL_17;
  }
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, MEMORY[0x1E0C9AA70]);
LABEL_17:
    v8 = v9;
  }

}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharing.operation.cdp"), -8000, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a5;
  v10 = a7;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharing.operation.cdp"), -8001, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelValidationWithError:", v11);

}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, _QWORD, void *))a4;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharing.operation.cdp"), -8002, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v6);

}

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, _QWORD, void *))a4;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharing.operation.cdp"), -8003, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v6);

}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a6;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharing.operation.cdp"), -8004, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelValidationWithError:", v10);

}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "context");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPeersForRemoteApproval");

  -[SFDeviceOperationHandlerCDPSetup cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:](self, "cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:", v12, v9, v11, v8);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)failIfCDPNotEnabled
{
  return self->_failIfCDPNotEnabled;
}

- (void)setFailIfCDPNotEnabled:(BOOL)a3
{
  self->_failIfCDPNotEnabled = a3;
}

- (NSString)altDSIDNeedingRepair
{
  return self->_altDSIDNeedingRepair;
}

- (void)setAltDSIDNeedingRepair:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_altDSIDNeedingRepair, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_cdpController, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

@end

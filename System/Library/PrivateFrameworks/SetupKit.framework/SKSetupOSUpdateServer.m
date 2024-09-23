@implementation SKSetupOSUpdateServer

- (SKSetupOSUpdateServer)init
{
  SKSetupOSUpdateServer *v2;
  SKSetupOSUpdateServer *v3;
  SKSetupOSUpdateServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupOSUpdateServer;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupOSUpdateServer);
  v3 = v2;
  if (v2)
    v4 = v2;

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
    -[SKSetupOSUpdateServer _oobEnsureStarted](self, "_oobEnsureStarted");
  else
    -[SKSetupOSUpdateServer _bleServerEnsureStarted](self, "_bleServerEnsureStarted");
  -[SKSetupOSUpdateServer _prepareSteps](self, "_prepareSteps");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupOSUpdateServer;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_invalidate
{
  objc_super v3;

  -[SKSetupOSUpdateServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  -[SKSetupOSUpdateServer _bleServerEnsureStopped](self, "_bleServerEnsureStopped");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupOSUpdateServer;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_prepareSteps
{
  SKStepBasicConfigServer *v3;
  SKStepWiFiSetupServerCW *v4;
  _QWORD v5[5];

  v3 = objc_alloc_init(SKStepBasicConfigServer);
  -[SKStepBasicConfigServer setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigServer setSkMessaging:](v3, "setSkMessaging:", self);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);
  -[SKStepBasicConfigServer activate](v3, "activate");

  v4 = objc_alloc_init(SKStepWiFiSetupServerCW);
  -[SKStepWiFiSetupServerCW setDispatchQueue:](v4, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepWiFiSetupServerCW setSkMessaging:](v4, "setSkMessaging:", self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SKSetupOSUpdateServer__prepareSteps__block_invoke;
  v5[3] = &unk_24D22A9C8;
  v5[4] = self;
  -[SKStepWiFiSetupServerCW setSkCompletionHandler:](v4, "setSkCompletionHandler:", v5);
  -[SKSetupBase _addStep:](self, "_addStep:", v4);
  -[SKStepWiFiSetupServerCW activate](v4, "activate");

}

- (void)_run
{
  if (-[SKSetupOSUpdateServer _bleAdvertiserShouldRun](self, "_bleAdvertiserShouldRun"))
    -[SKSetupOSUpdateServer _bleAdvertiserEnsureStarted](self, "_bleAdvertiserEnsureStarted");
  else
    -[SKSetupOSUpdateServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
}

- (BOOL)_bleAdvertiserShouldRun
{
  int v2;

  if (self->_completed)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v2 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
    if (v2)
      LOBYTE(v2) = -[SKConnection state](self->super._skCnx, "state") != 1;
  }
  return v2;
}

- (void)_bleAdvertiserEnsureStarted
{
  CBAdvertiser **p_bleAdvertiser;
  id v4;
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  p_bleAdvertiser = &self->_bleAdvertiser;
  if (!self->_bleAdvertiser)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBB218]);
    objc_storeStrong((id *)p_bleAdvertiser, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v4, "setNearbyActionFlags:", 64);
    objc_msgSend(v4, "setNearbyActionType:", 83);
    logger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_2147EE000, v5, OS_LOG_TYPE_DEFAULT, "BLE advertiser start: %@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__SKSetupOSUpdateServer__bleAdvertiserEnsureStarted__block_invoke;
    v6[3] = &unk_24D22B140;
    v6[4] = v4;
    v6[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v6);

  }
}

- (void)_bleAdvertiserEnsureStopped
{
  NSObject *v3;
  CBAdvertiser *bleAdvertiser;
  CBAdvertiser *v5;
  CBAdvertiser *v6;
  int v7;
  CBAdvertiser *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_bleAdvertiser)
  {
    logger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bleAdvertiser = self->_bleAdvertiser;
      v7 = 138412290;
      v8 = bleAdvertiser;
      _os_log_impl(&dword_2147EE000, v3, OS_LOG_TYPE_DEFAULT, "BLE advertiser stop: %@", (uint8_t *)&v7, 0xCu);
    }

    v5 = self->_bleAdvertiser;
  }
  else
  {
    v5 = 0;
  }
  -[CBAdvertiser invalidate](v5, "invalidate");
  v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0;

}

- (void)_bleServerEnsureStarted
{
  CBServer **p_bleServer;
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  _QWORD v8[6];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_bleServer = &self->_bleServer;
  if (!self->_bleServer)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBB298]);
    objc_storeStrong((id *)p_bleServer, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v4, "setBleListenPSM:", 130);
    v5 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke;
    v8[3] = &unk_24D22A798;
    v8[4] = v4;
    v8[5] = self;
    objc_msgSend(v4, "setAcceptHandler:", v8);
    logger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_2147EE000, v6, OS_LOG_TYPE_DEFAULT, "BLE server start: %@", buf, 0xCu);
    }

    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke_13;
    v7[3] = &unk_24D22B140;
    v7[4] = v4;
    v7[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v7);

  }
}

- (void)_bleServerEnsureStopped
{
  NSObject *v3;
  CBServer *bleServer;
  CBServer *v5;
  uint8_t v6[16];

  if (self->_bleServer)
  {
    logger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2147EE000, v3, OS_LOG_TYPE_DEFAULT, "BLE server stop", v6, 2u);
    }

    bleServer = self->_bleServer;
  }
  else
  {
    bleServer = 0;
  }
  -[CBServer invalidate](bleServer, "invalidate");
  v5 = self->_bleServer;
  self->_bleServer = 0;

}

- (void)_bleServerAcceptConnecton:(id)a3
{
  id v4;
  SKConnection *v5;
  SKConnection *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  SKConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->super._skCnx;
  if (v5)
  {
    v6 = v5;
    logger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_2147EE000, v7, OS_LOG_TYPE_ERROR, "### Reject BLE connection when already connected: %@ vs %@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v4, "invalidate");
  }
  else
  {
    v6 = objc_alloc_init(SKConnection);
    -[SKConnection setBleConnection:](v6, "setBleConnection:", v4);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", v6, 0, 0, &__block_literal_global_1134);
  }

}

- (void)_oobEnsureStarted
{
  SKConnection *v3;

  if (!self->super._skCnx)
  {
    v3 = objc_alloc_init(SKConnection);
    -[SKConnection setSendDataHandler:](v3, "setSendDataHandler:", self->super._sendDataHandler);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", v3, 0, 0, &__block_literal_global_15);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bleServer, 0);
  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

void __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD))
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216))
  {
    v8 = a3;
    logger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_2147EE000, v9, OS_LOG_TYPE_DEFAULT, "BLE server incoming connection: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_bleServerAcceptConnecton:", v5);
    objc_msgSend(*(id *)(a1 + 40), "_run");
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);

  }
  else
  {
    v6 = a3;
    NSErrorF_safe();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))a3)[2](v6, v7);

  }
}

void __48__SKSetupOSUpdateServer__bleServerEnsureStarted__block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216))
  {
    logger();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        CUPrintNSError();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_error_impl(&dword_2147EE000, v5, OS_LOG_TYPE_ERROR, "### BLE server failed: %@", (uint8_t *)&v10, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 216);
      *(_QWORD *)(v6 + 216) = 0;

    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 32);
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_2147EE000, v5, OS_LOG_TYPE_DEFAULT, "BLE server started: %@", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_run");
    }
  }

}

void __52__SKSetupOSUpdateServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v4[26])
  {
    if (v3)
    {
      logger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CUPrintNSError();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_error_impl(&dword_2147EE000, v5, OS_LOG_TYPE_ERROR, "### BLE advertiser failed: %@", (uint8_t *)&v9, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 208);
      *(_QWORD *)(v6 + 208) = 0;

    }
    else
    {
      objc_msgSend(v4, "_run");
    }
  }

}

void __38__SKSetupOSUpdateServer__prepareSteps__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  SKEvent *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 20, v4);

  objc_msgSend(v3, "_reportEvent:", v5);
  if (!v4)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = 1;
}

@end

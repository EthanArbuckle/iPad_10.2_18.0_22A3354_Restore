@implementation SSProximityDevice

- (SSProximityDevice)initWithQueue:(id)a3 endpoint:(unint64_t)a4 remoteInfo:(id)a5
{
  id v8;
  id v9;
  SSProximityDevice *v10;
  id *p_isa;
  uint64_t v12;
  id v13;
  SSProximityDevice *v14;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  if (a4)
  {
    v16.receiver = self;
    v16.super_class = (Class)SSProximityDevice;
    v10 = -[SSProximityDevice init](&v16, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      v10->_endpoint = a4;
      objc_storeStrong((id *)&v10->_remoteInfo, a5);
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v8);
      v13 = p_isa[2];
      p_isa[2] = (id)v12;

      objc_msgSend(p_isa[2], "setDelegate:", p_isa);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)activate:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  unint64_t endpoint;
  NSDictionary *remoteInfo;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  client = self->_client;
  endpoint = self->_endpoint;
  remoteInfo = self->_remoteInfo;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __30__SSProximityDevice_activate___block_invoke;
  v9[3] = &unk_24DEF3028;
  v8 = v4;
  v10 = v8;
  objc_copyWeak(&v11, &location);
  -[CoreTelephonyClient getProximityTransportSession:remoteDeviceInfo:completion:](client, "getProximityTransportSession:remoteDeviceInfo:completion:", endpoint, remoteInfo, v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __30__SSProximityDevice_activate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    sLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __30__SSProximityDevice_activate___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setSession:", v5);

    v15 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v15, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained((id *)(a1 + 40));
    v18 = objc_msgSend(v17, "endpoint");
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __30__SSProximityDevice_activate___block_invoke_1;
    v19[3] = &unk_24DEF3000;
    v20 = *(id *)(a1 + 32);
    objc_msgSend(v16, "activateProximityTransfer:completion:", v18, v19);

  }
}

void __30__SSProximityDevice_activate___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    sLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __30__SSProximityDevice_activate___block_invoke_1_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)invalidate:(BOOL)a3
{
  -[CoreTelephonyClient invalidateProximityTransfer:force:completion:](self->_client, "invalidateProximityTransfer:force:completion:", self->_endpoint, a3, &__block_literal_global_3);
}

void __32__SSProximityDevice_invalidate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    sLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __32__SSProximityDevice_invalidate___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)verifyPIN:(id)a3
{
  id v4;
  unint64_t endpoint;
  CoreTelephonyClient *client;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  client = self->_client;
  endpoint = self->_endpoint;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__SSProximityDevice_verifyPIN___block_invoke;
  v8[3] = &unk_24DEF3070;
  v9 = v4;
  v7 = v4;
  -[CoreTelephonyClient validateProximityTransfer:pin:completion:](client, "validateProximityTransfer:pin:completion:", endpoint, v7, v8);

}

void __31__SSProximityDevice_verifyPIN___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    sLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __31__SSProximityDevice_verifyPIN___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (id)templateSession
{
  CUMessageSession *session;
  CUMessageSession *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  session = self->_session;
  if (session)
  {
    v3 = session;
  }
  else
  {
    sLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SSProximityDevice templateSession].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return session;
}

- (void)proxSetupAuthEventUpdate:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[SSProximityDevice eventHandler](self, "eventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SSProximityDevice eventHandler](self, "eventHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[SSProximityDevice skEventFromDictionary:](self, "skEventFromDictionary:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);

  }
  else
  {
    sLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SSProximityDevice proxSetupAuthEventUpdate:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (id)skEventFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "intValue");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE85CB0]), "initWithEventType:error:", v6, v7);
    }
    else
    {
      if ((int)v6 > 119)
      {
        if ((int)v6 <= 199)
        {
          if ((_DWORD)v6 == 120)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pairingFlags"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
              v15 = objc_msgSend(v14, "intValue");
            else
              v15 = 0;
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("passwordType"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
              v25 = objc_msgSend(v24, "intValue");
            else
              v25 = 0;
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("throttleSeconds"));
            v5 = (void *)objc_claimAutoreleasedReturnValue();

            if (v5)
              v26 = objc_msgSend(v5, "intValue");
            else
              v26 = 0;
            v8 = objc_msgSend(objc_alloc((Class)getSKAuthenticationRequestEventClass()), "initWithPasswordType:pairingFlags:throttleSeconds:", v25, v15, v26);
            goto LABEL_15;
          }
          if ((_DWORD)v6 == 130)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("password"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)objc_msgSend(objc_alloc((Class)getSKAuthenticationResponseEventClass((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23)), "initWithPassword:", v16);

            goto LABEL_16;
          }
        }
      }
      else if ((v6 > 0x29 || ((1 << v6) & 0x30040100401) == 0) && (_DWORD)v6 == 110)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("password"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("passwordType"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          v12 = objc_msgSend(v11, "intValue");
        else
          v12 = 0;
        v9 = (void *)objc_msgSend(objc_alloc((Class)getSKAuthenticationPresentEventClass()), "initWithPasswordType:password:", v12, v10);

        v5 = v11;
        goto LABEL_16;
      }
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE85CB0]), "initWithEventType:", v6);
    }
LABEL_15:
    v9 = (void *)v8;
LABEL_16:

    goto LABEL_17;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(unint64_t)a3
{
  self->_endpoint = a3;
}

- (CUMessageSession)session
{
  return (CUMessageSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)remoteInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemoteInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

void __30__SSProximityDevice_activate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a2, a3, "bootstrap proximity transfer failed : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __30__SSProximityDevice_activate___block_invoke_1_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a2, a3, "activate proximity transfer failed : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __32__SSProximityDevice_invalidate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a2, a3, "invalidate proximity transfer failed : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __31__SSProximityDevice_verifyPIN___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "verify PIN(%@) failed : %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)templateSession
{
  OUTLINED_FUNCTION_1_2(&dword_21B647000, a1, a3, "invalid template session", a5, a6, a7, a8, 0);
}

- (void)proxSetupAuthEventUpdate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21B647000, a1, a3, "no event handler registerred", a5, a6, a7, a8, 0);
}

@end

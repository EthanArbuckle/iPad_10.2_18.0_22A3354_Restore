@implementation RTTRemoteCall

- (RTTRemoteCall)initWithCall:(id)a3
{
  RTTRemoteCall *v3;
  NSMutableArray *v4;
  NSMutableArray *devices;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *connectionQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RTTRemoteCall;
  v3 = -[RTTCall initWithCall:](&v10, sel_initWithCall_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    devices = v3->_devices;
    v3->_devices = v4;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("rtt_relay_queue", v6);
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v7;

    -[RTTRemoteCall setupRapportClient](v3, "setupRapportClient");
  }
  return v3;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  int v5;
  objc_super v6;
  uint8_t buf[4];
  RTTRemoteCall *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Starting call: %@", buf, 0xCu);
  }

  -[RTTCall call](self, "call");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHostedOnCurrentDevice");

  if (v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)RTTRemoteCall;
    -[RTTCall start](&v6, sel_start);
  }
  if (!self->_client)
    -[RTTRemoteCall setupRapportClient](self, "setupRapportClient");
}

- (void)stop
{
  void *v3;
  int v4;
  NSObject *v5;
  RPCompanionLinkClient *client;
  objc_super v7;
  uint8_t buf[4];
  RTTRemoteCall *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[RTTCall call](self, "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHostedOnCurrentDevice");

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)RTTRemoteCall;
    -[RTTCall stop](&v7, sel_stop);
  }
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Stopping call: %@", buf, 0xCu);
  }

  -[RPCompanionLinkClient invalidate](self->_client, "invalidate");
  client = self->_client;
  self->_client = 0;

}

- (BOOL)isLocallyHosted
{
  return 0;
}

- (void)updateCallWithRemoteFailure
{
  id v3;

  -[RTTCall delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ttyCall:setVisible:serviceUpdate:", self, 1, RTTServiceUpdateTypeRemoteInterrupt);

}

- (void)sendString:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *connectionQueue;
  _QWORD block[4];
  id v10;
  RTTRemoteCall *v11;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Send string for remote call: %@", buf, 0xCu);
  }

  -[RTTCall call](self, "call");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHostedOnCurrentDevice");

  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTTRemoteCall;
    -[RTTCall sendString:](&v13, sel_sendString_, v4);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__RTTRemoteCall_sendString___block_invoke;
    block[3] = &unk_24D204170;
    objc_copyWeak(&v12, (id *)buf);
    v10 = v4;
    v11 = self;
    dispatch_async(connectionQueue, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

void __28__RTTRemoteCall_sendString___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  const __CFString *v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "call");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactPathForCall:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTTUtterance utteranceWithContactPath:andText:](RTTUtterance, "utteranceWithContactPath:andText:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addUtterance:", v6);

  +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v10, "conversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveConversation:", v11);

  AXLogRTT();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v13, "conversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v14;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "saving convo and utterance: %@/%@", buf, 0x16u);

  }
  v15 = objc_msgSend(*(id *)(a1 + 32), "length");
  AXLogRTT();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v17)
    {
      v18 = *(void **)(a1 + 32);
      v19 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v19, "client");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v18;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_21473C000, v16, OS_LOG_TYPE_INFO, "Sending text %@ - %@", buf, 0x16u);

    }
    v16 = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject client](v16, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 32);
    v29 = CFSTR("RTTSendKey");
    v30 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v24, "pairedCallDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __28__RTTRemoteCall_sendString___block_invoke_392;
    v28[3] = &unk_24D204148;
    v28[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v21, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.accessibility.RTT"), v23, v26, MEMORY[0x24BDBD1B8], v28);

  }
  else if (v17)
  {
    v27 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v32 = v27;
    _os_log_impl(&dword_21473C000, v16, OS_LOG_TYPE_INFO, "Not sending %@", buf, 0xCu);
  }

}

void __28__RTTRemoteCall_sendString___block_invoke_392(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Sent text response %@ = %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "updateCallWithRemoteFailure");

}

- (void)callDidReceiveText:(id)a3 forUtterance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_super v19;
  _QWORD v20[5];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[RTTCall call](self, "call");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEndpointOnCurrentDevice") & 1) != 0 || !objc_msgSend(v6, "length"))
  {

  }
  else
  {
    v9 = objc_msgSend(v7, "length");

    if (v9)
    {
      AXLogRTT();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Sending remote device received text %@", buf, 0xCu);
      }

      v11 = objc_initWeak((id *)buf, self);
      -[RTTRemoteCall client](self, "client");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("RTTReceiveKey");
      v25[0] = CFSTR("RTTTextKey");
      v25[1] = CFSTR("RTTUtteranceKey");
      v26[0] = v6;
      v26[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)buf);
      objc_msgSend(WeakRetained, "pairedCallDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke;
      v20[3] = &unk_24D204148;
      v20[4] = self;
      objc_msgSend(v12, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.accessibility.RTT"), v14, v17, MEMORY[0x24BDBD1B8], v20);

      objc_destroyWeak((id *)buf);
      goto LABEL_11;
    }
  }
  AXLogRTT();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_21473C000, v18, OS_LOG_TYPE_INFO, "Not sending remote device received text %@, %@", buf, 0x16u);
  }

LABEL_11:
  v19.receiver = self;
  v19.super_class = (Class)RTTRemoteCall;
  -[RTTCall callDidReceiveText:forUtterance:](&v19, sel_callDidReceiveText_forUtterance_, v6, v7);

}

void __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  AXLogRTT();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Received text response %@ = %@", buf, 0x16u);
  }

  objc_msgSend(v7, "objectForKey:", CFSTR("RTTError"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("ActionRepair")))
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke_404;
    v15[3] = &unk_24D203A08;
    v13 = v8;
    v14 = *(_QWORD *)(a1 + 32);
    v16 = v13;
    v17 = v14;
    dispatch_async(v12, v15);

  }
}

void __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke_404(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("senderID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);
    *(_DWORD *)buf = 138412546;
    v9 = v2;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Received request from %@ to re-pair with known devices: %@", buf, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 104);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke_407;
  v7[3] = &unk_24D204198;
  v7[4] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __49__RTTRemoteCall_callDidReceiveText_forUtterance___block_invoke_407(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendCallIDChallengeToDevice:", a2);
}

- (void)resetRapportClientAndInvalidate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  RPCompanionLinkClient *client;
  uint8_t v7[16];

  v3 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Invalidate Rapport client and setup again", v7, 2u);
  }

  if (v3)
    -[RPCompanionLinkClient invalidate](self->_client, "invalidate");
  client = self->_client;
  self->_client = 0;

  -[RTTRemoteCall setupRapportClient](self, "setupRapportClient");
}

- (void)setupRapportClient
{
  RPCompanionLinkClient *v3;
  RPCompanionLinkClient *client;
  NSObject *v5;
  RPCompanionLinkClient *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  v3 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
  client = self->_client;
  self->_client = v3;

  -[RPCompanionLinkClient setDispatchQueue:](self->_client, "setDispatchQueue:", self->_connectionQueue);
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Starting rapport support", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[RPCompanionLinkClient setInvalidationHandler:](self->_client, "setInvalidationHandler:", &__block_literal_global_411);
  v6 = self->_client;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__RTTRemoteCall_setupRapportClient__block_invoke_416;
  v7[3] = &unk_24D204250;
  objc_copyWeak(&v8, buf);
  -[RPCompanionLinkClient activateWithCompletion:](v6, "activateWithCompletion:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __35__RTTRemoteCall_setupRapportClient__block_invoke()
{
  NSObject *v0;
  int v1;
  __CFString *v2;
  int v3;
  __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall");
    if (v1)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = &stru_24D204B08;
    }
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_21473C000, v0, OS_LOG_TYPE_INFO, "Companion link was invalidated: %@", (uint8_t *)&v3, 0xCu);
    if (v1)

  }
}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_416(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    AXLogRTT();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Link failed to activate %@", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "resetRapportClientAndInvalidate:", 1);

  }
  else
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v6, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __35__RTTRemoteCall_setupRapportClient__block_invoke_417;
    v22[3] = &unk_24D2041E0;
    objc_copyWeak(&v23, (id *)(a1 + 32));
    objc_msgSend(v7, "registerRequestID:options:handler:", CFSTR("com.apple.accessibility.RTT"), MEMORY[0x24BDBD1B8], v22);

    v9 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v9, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __35__RTTRemoteCall_setupRapportClient__block_invoke_2;
    v20[3] = &unk_24D204208;
    objc_copyWeak(&v21, (id *)(a1 + 32));
    objc_msgSend(v10, "setDeviceFoundHandler:", v20);

    v11 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v11, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __35__RTTRemoteCall_setupRapportClient__block_invoke_3;
    v18[3] = &unk_24D204208;
    objc_copyWeak(&v19, (id *)(a1 + 32));
    objc_msgSend(v12, "setDeviceLostHandler:", v18);

    v13 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v13, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInterruptionHandler:", &__block_literal_global_420);

    AXLogRTT();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v16, "client");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_21473C000, v15, OS_LOG_TYPE_INFO, "Companion link is active: %@", buf, 0xCu);

    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
  }

}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_417(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "responseForRequest:options:", v9, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, id, _QWORD, _QWORD))v7 + 2))(v7, v11, 0, 0);
}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "addDevice:", v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "sendCallIDChallengeToDevice:", v3);

}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "removeDevice:", v3);

}

void __35__RTTRemoteCall_setupRapportClient__block_invoke_4()
{
  NSObject *v0;
  uint8_t v1[16];

  AXLogRTT();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21473C000, v0, OS_LOG_TYPE_INFO, "Companion link was interrupted", v1, 2u);
  }

}

- (void)sendCallIDChallengeToDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTRemoteCall client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("RTTActiveCallKey");
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__RTTRemoteCall_sendCallIDChallengeToDevice___block_invoke;
  v9[3] = &unk_24D204148;
  v9[4] = self;
  objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.accessibility.RTT"), v7, v8, MEMORY[0x24BDBD1B8], v9);

}

void __45__RTTRemoteCall_sendCallIDChallengeToDevice___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  AXLogRTT();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Call challenge response %@ - %@", (uint8_t *)&v12, 0x16u);
  }

  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "responseForRequest:options:", v7, v8);
}

- (void)sendCallIDChallengeToDeviceId:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke;
  v7[3] = &unk_24D203A08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

void __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v14[2] = __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke_2;
  v14[3] = &unk_24D204278;
  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v15 = v2;
  v5 = objc_msgSend(v3, "indexOfObjectPassingTest:", v14);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    AXLogRTT();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Sending pairing challenge to all known devices since id (%@) could not be matched to a known device: %@", buf, 0x16u);
    }

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 104);
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke_425;
    v13[3] = &unk_24D204198;
    v13[4] = v9;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectAtIndex:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogRTT();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Sending pairing challenge to %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "sendCallIDChallengeToDevice:", v11);
  }

}

uint64_t __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __47__RTTRemoteCall_sendCallIDChallengeToDeviceId___block_invoke_425(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendCallIDChallengeToDevice:", a2);
}

- (void)addDevice:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RTTRemoteCall *v9;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__RTTRemoteCall_addDevice___block_invoke;
  v7[3] = &unk_24D203A08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

void __27__RTTRemoteCall_addDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    AXLogRTT();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Found device %@", buf, 0xCu);
    }

    v4 = *(void **)(a1 + 32);
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __27__RTTRemoteCall_addDevice___block_invoke_426;
    v6[3] = &unk_24D204278;
    v7 = v4;
    objc_msgSend(v5, "ax_removeObjectsFromArrayUsingBlock:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "addObject:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __27__RTTRemoteCall_addDevice___block_invoke_426(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)removeDevice:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RTTRemoteCall *v9;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__RTTRemoteCall_removeDevice___block_invoke;
  v7[3] = &unk_24D203A08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

uint64_t __30__RTTRemoteCall_removeDevice___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    AXLogRTT();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Lost device %@", (uint8_t *)&v4, 0xCu);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 104), "removeObject:", *(_QWORD *)(v1 + 32));
  }
  return result;
}

- (id)responseForRequest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Received request %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTCall call](self, "call");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "status");

  if ((v11 - 3) > 0xFFFFFFFD)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("senderID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __44__RTTRemoteCall_responseForRequest_options___block_invoke;
    v18[3] = &unk_24D2042A0;
    v18[4] = self;
    v15 = v9;
    v19 = v15;
    v20 = v14;
    v12 = v14;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);
    v16 = v20;
    v13 = v15;

    goto LABEL_7;
  }
  AXLogRTT();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[RTTCall call](self, "call");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Call not yet connected. Ignoring request for call %@", buf, 0xCu);
LABEL_7:

  }
  return v9;
}

void __44__RTTRemoteCall_responseForRequest_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  char v49;
  void *v50;
  id v51;
  NSObject *v52;
  _QWORD v53[5];
  id v54;
  uint8_t buf[4];
  NSObject *v56;
  __int16 v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[3];

  v60[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("RTTActiveCallKey")))
  {
    objc_msgSend(*(id *)(a1 + 32), "call");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEndpointOnCurrentDevice"))
    {

      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 32), "call");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isHostedOnCurrentDevice");

    if ((v18 & 1) != 0)
    {
LABEL_15:
      objc_msgSend(*(id *)(a1 + 32), "call");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "callUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
      {
        v59[0] = CFSTR("RTTActiveCallKey");
        v22 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "call");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "callUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = CFSTR("com.apple.accessibility.RTT");
        v60[0] = v24;
        v60[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v25, CFSTR("RTTActiveCallResponseKey"));

      }
      AXLogRTT();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "call");
        v27 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "pairedCallDevice");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v56 = v27;
        v57 = 2112;
        v58 = v28;
        _os_log_impl(&dword_21473C000, v26, OS_LOG_TYPE_INFO, "Active call request for call: %@ with paired call device: %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "pairedCallDevice");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_21;
      v30 = (void *)v29;
      objc_msgSend(*(id *)(a1 + 32), "pairedCallDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", *(_QWORD *)(a1 + 48));

      if ((v33 & 1) == 0)
      {
LABEL_21:
        AXLogRTT();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "pairedCallDevice");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "identifier");
          v36 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v36;
LABEL_40:
          _os_log_impl(&dword_21473C000, v34, OS_LOG_TYPE_INFO, "Paired device id: %@", buf, 0xCu);

          goto LABEL_41;
        }
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    AXLogRTT();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "call");
      v47 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v47;
      _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Request received on non-endpoint and non-host device. Ignoring request for call %@", buf, 0xCu);

    }
LABEL_37:

    goto LABEL_42;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("RTTActiveCallResponseKey")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_42;
    objc_msgSend(v6, "objectForKey:", CFSTR("RTTActiveCallKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.accessibility.RTT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogRTT();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v56 = v8;
      v57 = 2112;
      v58 = v9;
      _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Active call response for call: %@ from client: %@", buf, 0x16u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "call");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "callUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v8);

        if (v13)
        {
          AXLogRTT();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21473C000, v14, OS_LOG_TYPE_INFO, "Active call response matched current call", buf, 2u);
          }

          v15 = *(_QWORD *)(a1 + 32);
          v16 = *(NSObject **)(v15 + 112);
          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = __44__RTTRemoteCall_responseForRequest_options___block_invoke_430;
          v53[3] = &unk_24D203A08;
          v53[4] = v15;
          v54 = v9;
          dispatch_async(v16, v53);

        }
      }
    }
    goto LABEL_36;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("RTTSendKey")))
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("RTTReceiveKey")))
      goto LABEL_42;
    objc_msgSend(*(id *)(a1 + 32), "call");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isEndpointOnCurrentDevice");

    if ((v49 & 1) == 0)
    {
      AXLogRTT();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21473C000, v52, OS_LOG_TYPE_INFO, "Received character on non-endpoint device. Replying with re-pair request", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", CFSTR("ActionRepair"), CFSTR("RTTError"));
      goto LABEL_42;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_42;
    objc_msgSend(v6, "objectForKey:", CFSTR("RTTTextKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("RTTUtteranceKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "conversation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (id)objc_msgSend(v50, "appendStringFromOtherContactPath:", v8);

    objc_msgSend(*(id *)(a1 + 32), "callDidReceiveText:forUtterance:", v8, v9);
    goto LABEL_36;
  }
  objc_msgSend(*(id *)(a1 + 32), "pairedCallDevice");
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37)
    goto LABEL_38;
  v38 = (void *)v37;
  objc_msgSend(*(id *)(a1 + 32), "pairedCallDevice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "identifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if ((v41 & 1) == 0)
  {
LABEL_38:
    AXLogRTT();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "pairedCallDevice");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "identifier");
      v36 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v36;
      goto LABEL_40;
    }
LABEL_41:

    objc_msgSend(*(id *)(a1 + 32), "sendCallIDChallengeToDeviceId:", *(_QWORD *)(a1 + 48));
    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(*(id *)(a1 + 32), "sendString:", v8);
    AXLogRTT();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v8;
      _os_log_impl(&dword_21473C000, v42, OS_LOG_TYPE_INFO, "Getting remote call send job: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *(void **)(a1 + 32);
    objc_msgSend(v43, "conversation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "lastUtteranceForMe:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "text");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ttyCall:didSendRemoteString:forUtterance:", v43, v8, v46);

LABEL_36:
    goto LABEL_37;
  }
LABEL_42:

}

void __44__RTTRemoteCall_responseForRequest_options___block_invoke_430(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __44__RTTRemoteCall_responseForRequest_options___block_invoke_2;
  v8[3] = &unk_24D204278;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v8[1] = 3221225472;
  v9 = v2;
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v8);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = *(id **)(a1 + 32);
    objc_msgSend(v5[13], "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPairedCallDevice:", v6);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ttyCall:setVisible:serviceUpdate:", *(_QWORD *)(a1 + 32), 0, RTTServiceUpdateTypeRemoteInterrupt);

  }
}

uint64_t __44__RTTRemoteCall_responseForRequest_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (RPCompanionLinkDevice)pairedCallDevice
{
  return self->_pairedCallDevice;
}

- (void)setPairedCallDevice:(id)a3
{
  objc_storeStrong((id *)&self->_pairedCallDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedCallDevice, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end

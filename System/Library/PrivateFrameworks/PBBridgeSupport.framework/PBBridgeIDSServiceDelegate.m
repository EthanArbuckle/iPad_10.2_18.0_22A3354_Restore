@implementation PBBridgeIDSServiceDelegate

- (void)beginSetupTransaction
{
  OUTLINED_FUNCTION_0(&dword_2113B6000, a1, a3, "Error: already within a setup transaction!", a5, a6, a7, a8, 0);
}

- (void)endSetupTransaction
{
  NSObject *v3;
  NSObject *v4;
  IDSService *service;
  IDSService *v6;
  NSMutableDictionary *inflightMessages;
  NSMutableDictionary *pendingMessages;
  NSTimer *transportReachabilityTimer;
  int v10;
  IDSService *v11;
  __int16 v12;
  PBBridgeIDSServiceDelegate *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "ENDED TRANSACTION!", (uint8_t *)&v10, 2u);
  }

  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    v10 = 138412546;
    v11 = service;
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "Destroyed Service (%@) and removed (%@) as delegate", (uint8_t *)&v10, 0x16u);
  }

  -[IDSService removeDelegate:](self->_service, "removeDelegate:", self);
  v6 = self->_service;
  self->_service = 0;

  -[NSMutableDictionary removeAllObjects](self->_inflightMessages, "removeAllObjects");
  inflightMessages = self->_inflightMessages;
  self->_inflightMessages = 0;

  -[NSMutableDictionary removeAllObjects](self->_pendingMessages, "removeAllObjects");
  pendingMessages = self->_pendingMessages;
  self->_pendingMessages = 0;

  -[NSTimer invalidate](self->_transportReachabilityTimer, "invalidate");
  transportReachabilityTimer = self->_transportReachabilityTimer;
  self->_transportReachabilityTimer = 0;

  self->_shouldSuppressTransportReachabilityTimeout = 0;
  self->_listeningForIDSSentMessages = 0;
}

- (BOOL)setupTransactionActive
{
  return self->_service != 0;
}

- (void)setupServiceMessageSelectorMappings
{
  NSLog(CFSTR("%s should be overridden by subclasses"), a2, "-[PBBridgeIDSServiceDelegate setupServiceMessageSelectorMappings]");
}

- (id)serviceIdentifier
{
  NSLog(CFSTR("%s should be overridden by subclasses"), a2, "-[PBBridgeIDSServiceDelegate serviceIdentifier]");
  return 0;
}

- (void)_postMessageSendFailureForErrorMessage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_listeningForIDSSentMessages)
  {
    if (PBIsInternalInstall())
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("SuppressMessageFailError"));

      if ((v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("PBBridgeMessageError");
        v10[0] = v4;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PBBridgeMessageFailedToSend"), 0, v8);

      }
    }
  }

}

- (id)_sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  PBBridgeIDSServiceDelegate *v21;

  v7 = a7;
  v12 = a3;
  v13 = a6;
  v14 = v13;
  if (self->_service)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __96__PBBridgeIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke;
    v18[3] = &unk_24CBBEB18;
    v19 = v13;
    v20 = v12;
    v21 = self;
    PBProtoSend(a4, v20, a5, v19, v7, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v19;
  }
  else
  {
    pbb_setupflow_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[PBBridgeIDSServiceDelegate _sendProtoBuf:service:priority:responseIdentifier:expectsResponse:].cold.1((uint64_t)v14, (uint64_t)v12, v16);
    v15 = 0;
  }

  return v15;
}

void __96__PBBridgeIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __96__PBBridgeIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  v5 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to Send Message (Pre-Send): %@"), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_postMessageSendFailureForErrorMessage:", v6);

}

- (id)sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7 retryCount:(int64_t)a8 retryInterval:(double)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  PBBridgeIDSServiceDelegate *v22;
  id v23;
  PBBridgeIDSServiceDelegate *v24;
  void *v25;
  NSMutableDictionary *inflightMessages;
  uint64_t v27;
  double v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  id (*v33)(uint64_t);
  void *v34;
  PBBridgeIDSServiceDelegate *v35;
  id v36;
  id v37;
  id v38;
  int64_t v39;
  BOOL v40;

  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  -[PBBridgeIDSServiceDelegate _sendProtoBuf:service:priority:responseIdentifier:expectsResponse:](self, "_sendProtoBuf:service:priority:responseIdentifier:expectsResponse:", v16, v17, a5, v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("SuppressMessageRetry"));

  if ((v21 & 1) == 0 && v19)
  {
    v22 = self;
    v31 = MEMORY[0x24BDAC760];
    v32 = 3221225472;
    v33 = __120__PBBridgeIDSServiceDelegate_sendProtoBuf_service_priority_responseIdentifier_expectsResponse_retryCount_retryInterval___block_invoke;
    v34 = &unk_24CBBEB40;
    v35 = v22;
    v23 = v16;
    v36 = v23;
    v37 = v17;
    v39 = a5;
    v38 = v18;
    v40 = v11;
    v24 = v22;
    v25 = (void *)MEMORY[0x212BD94D4](&v31);
    inflightMessages = v24->_inflightMessages;
    v27 = objc_msgSend(v23, "type", v31, v32, v33, v34);
    v28 = 0.0;
    if (a9 >= 0.0)
      v28 = a9;
    v29 = +[PBBridgeIDSMessageInstance newMessageInstanceOfType:retryCount:retryInterval:withAction:](PBBridgeIDSMessageInstance, "newMessageInstanceOfType:retryCount:retryInterval:withAction:", v27, a8 & ~(a8 >> 63), v25, v28);
    -[NSMutableDictionary setObject:forKey:](inflightMessages, "setObject:forKey:", v29, v19);

  }
  return v19;
}

id __120__PBBridgeIDSServiceDelegate_sendProtoBuf_service_priority_responseIdentifier_expectsResponse_retryCount_retryInterval___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_sendProtoBuf:service:priority:responseIdentifier:expectsResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
}

- (BOOL)connectionStateWithDevices:(id)a3 accounts:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  int v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  int v21;
  NSObject *v22;
  id v24;
  char v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  v8 = "se:]";
  if (v7)
  {
    v9 = v7;
    v24 = v5;
    v10 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        pbb_setupflow_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(v12, "canSend");
          *(_DWORD *)buf = 138412546;
          v37 = v12;
          v38 = 1024;
          v39 = v14;
          _os_log_impl(&dword_2113B6000, v13, OS_LOG_TYPE_DEFAULT, "account: %@ canSend: %d", buf, 0x12u);
        }

        if ((objc_msgSend(v12, "canSend") & 1) != 0)
        {
          v15 = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v9)
        continue;
      break;
    }
    v15 = 0;
LABEL_13:
    v5 = v24;
    v8 = "-[PBBridgeCompanionController handleDeviceManagementResponse:]" + 58;
  }
  else
  {
    v15 = 0;
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v25 = v15;
    v18 = *(_QWORD *)v28;
    v26 = *((_QWORD *)v8 + 86);
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        v21 = objc_msgSend(v20, "isNearby");
        pbb_setupflow_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v37 = v20;
          v38 = 1024;
          v39 = v21;
          _os_log_impl(&dword_2113B6000, v22, OS_LOG_TYPE_DEFAULT, "device: %@ isNearby: %d", buf, 0x12u);
        }

        if ((v21 & 1) != 0)
        {
          LOBYTE(v17) = 1;
          goto LABEL_27;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v17)
        continue;
      break;
    }
LABEL_27:
    v15 = v25;
  }

  return v15 & v17;
}

- (void)checkReachability
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[IDSService pb_mineTinkerDevices](self->_service, "pb_mineTinkerDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
      if (objc_msgSend(v8, "isDefaultPairedDevice"))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = objc_msgSend(v8, "isNearby");

    if ((v9 & 1) != 0)
      return;
  }
  else
  {
LABEL_9:

  }
  if (self->_service)
    -[PBBridgeIDSServiceDelegate startReachabilityTimer](self, "startReachabilityTimer");
}

- (void)startReachabilityTimer
{
  NSObject *v3;
  const __CFString *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSTimer *v8;
  NSTimer *transportReachabilityTimer;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!self->_transportReachabilityTimer && !self->_shouldSuppressTransportReachabilityTimeout)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_transportBecameUnreachable, 0, 0, 60.0);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    transportReachabilityTimer = self->_transportReachabilityTimer;
    self->_transportReachabilityTimer = v8;

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTimer:forMode:", self->_transportReachabilityTimer, *MEMORY[0x24BDBCB80]);

    pbb_setupflow_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    LOWORD(v11) = 0;
    v5 = "Started reachability timer.";
    v6 = v3;
    v7 = 2;
    goto LABEL_8;
  }
  pbb_setupflow_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldSuppressTransportReachabilityTimeout)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v11 = 138543362;
    v12 = v4;
    v5 = "Not starting reachability timer. (is suppressed? %{public}@)";
    v6 = v3;
    v7 = 12;
LABEL_8:
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
  }
LABEL_9:

}

- (void)cancelReachabilityTimer
{
  NSObject *v3;
  NSTimer *transportReachabilityTimer;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  pbb_setup_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[PBBridgeIDSServiceDelegate cancelReachabilityTimer]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[NSTimer invalidate](self->_transportReachabilityTimer, "invalidate");
  transportReachabilityTimer = self->_transportReachabilityTimer;
  self->_transportReachabilityTimer = 0;

}

- (void)resetTransportReachabilityTimer
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  pbb_setup_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PBBridgeIDSServiceDelegate resetTransportReachabilityTimer]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[PBBridgeIDSServiceDelegate cancelReachabilityTimer](self, "cancelReachabilityTimer");
  -[PBBridgeIDSServiceDelegate startReachabilityTimer](self, "startReachabilityTimer");
}

- (void)setShouldSuppressTransportReachabilityTimeout:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  pbb_setup_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[PBBridgeIDSServiceDelegate setShouldSuppressTransportReachabilityTimeout:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:%@", (uint8_t *)&v7, 0x16u);
  }

  if (self->_shouldSuppressTransportReachabilityTimeout != v3)
  {
    self->_shouldSuppressTransportReachabilityTimeout = v3;
    if (v3)
      -[PBBridgeIDSServiceDelegate cancelReachabilityTimer](self, "cancelReachabilityTimer");
    else
      -[PBBridgeIDSServiceDelegate checkReachability](self, "checkReachability");
  }
}

- (void)transportBecameReachable
{
  NSObject *v2;
  uint8_t v3[16];

  pbb_setupflow_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2113B6000, v2, OS_LOG_TYPE_DEFAULT, "Transport became reachable.", v3, 2u);
  }

}

- (void)transportBecameUnreachable
{
  OUTLINED_FUNCTION_0(&dword_2113B6000, a1, a3, "Error: Transport is unreachable!", a5, a6, a7, a8, 0);
}

- (void)stopListeningForIDSSentMessages
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[PBBridgeIDSServiceDelegate stopListeningForIDSSentMessages]";
  _os_log_error_impl(&dword_2113B6000, log, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)updateConnectivityTimer:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__PBBridgeIDSServiceDelegate_updateConnectivityTimer___block_invoke;
  v3[3] = &unk_24CBBE4D0;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __54__PBBridgeIDSServiceDelegate_updateConnectivityTimer___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 8))
  {
    if (*(_BYTE *)(a1 + 40) || !*(_QWORD *)(result + 16))
    {
      objc_msgSend((id)result, "cancelReachabilityTimer");
      return objc_msgSend(*(id *)(a1 + 32), "transportBecameReachable");
    }
    else
    {
      return objc_msgSend((id)result, "startReachabilityTimer");
    }
  }
  return result;
}

- (BOOL)reportConnectionForService:(id)a3 accounts:(id)a4 devices:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PBBridgeIDSServiceDelegate connectionStateWithDevices:accounts:](self, "connectionStateWithDevices:accounts:", v10, v9);
  pbb_setupflow_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    v15 = 138413058;
    if (v11)
      v13 = CFSTR("YES");
    v16 = v13;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "Connected: %@ (Service: %@ Accounts: %@ Devices: %@)", (uint8_t *)&v15, 0x2Au);
  }

  return v11;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  pbb_setupflow_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "Accounts Changed!", v10, 2u);
  }

  objc_msgSend(v7, "pb_mineTinkerDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeIDSServiceDelegate reportConnectionForService:accounts:devices:](self, "reportConnectionForService:accounts:devices:", v7, v6, v9);

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint8_t v10[16];

  v5 = a3;
  pbb_setupflow_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "Devices Changed!", v10, 2u);
  }

  objc_msgSend(v5, "pb_mineTinkerDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PBBridgeIDSServiceDelegate reportConnectionForService:accounts:devices:](self, "reportConnectionForService:accounts:devices:", v5, v8, v7);

  -[PBBridgeIDSServiceDelegate updateConnectivityTimer:](self, "updateConnectivityTimer:", v9);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  v11 = a7;
  pbb_setupflow_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    v13 = 138412802;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_fault_impl(&dword_2113B6000, v12, OS_LOG_TYPE_FAULT, "incomingUnhandledProtobuf: %@ from: %@ context: %@", (uint8_t *)&v13, 0x20u);
  }

}

- (id)customDescriptionOfMessageType:(unsigned __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Type: %d"), a3);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  __CFString *v12;
  double v13;
  __CFString *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  double v24;
  dispatch_time_t v25;
  __CFString *v26;
  double Current;
  void *v28;
  double v29;
  double v30;
  void *v31;
  NSObject *v32;
  _QWORD block[4];
  NSObject *v34;
  __CFString *v35;
  id v36;
  PBBridgeIDSServiceDelegate *v37;
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v12 = (__CFString *)a3;
  v13 = COERCE_DOUBLE(a4);
  v14 = (__CFString *)a5;
  v15 = a7;
  -[NSMutableDictionary objectForKey:](self->_inflightMessages, "objectForKey:", v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    pbb_setupflow_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_DWORD *)buf = 138413058;
    v39 = v14;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = v13;
    v44 = 2112;
    v45 = *(double *)&v15;
    v19 = "Unknown message ID: %@ (%@ -- %@) Error: %@. Not taking any action.";
LABEL_16:
    _os_log_error_impl(&dword_2113B6000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0x2Au);
    goto LABEL_25;
  }
  if (!v15 && a6)
  {
    kdebug_trace();
    -[NSMutableDictionary objectForKey:](self->_pendingMessages, "objectForKey:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject typeID](v16, "typeID") == 0xFFFF)
    {
      if (-[NSObject typeID](v17, "typeID") == 0xFFFF)
      {
        v26 = CFSTR("UNACCOUNTED MESSAGE!! Please file with Pepper Pairing!");
        goto LABEL_20;
      }
      v18 = v17;
    }
    else
    {
      v18 = v16;
    }
    -[PBBridgeIDSServiceDelegate customDescriptionOfMessageType:](self, "customDescriptionOfMessageType:", -[NSObject typeID](v18, "typeID"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    Current = CFAbsoluteTimeGetCurrent();
    -[NSObject sentAbsoluteTime](v16, "sentAbsoluteTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addMeasurement:timeSent:activityType:activityIdentifier:", v26, v14, Current - v30, v30);

    }
    +[PBBridgeCAReporter pushCommunicationTimingType:withValue:](PBBridgeCAReporter, "pushCommunicationTimingType:withValue:", 0, Current - v30);
    pbb_setupflow_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v39 = v26;
      v40 = 2112;
      v41 = v14;
      v42 = 2048;
      v43 = Current - v30;
      v44 = 2048;
      v45 = Current;
      v46 = 2048;
      v47 = v30;
      _os_log_impl(&dword_2113B6000, v32, OS_LOG_TYPE_DEFAULT, "Success Sending Message: (%@) ID: (%@) Sending took (%f // %f -> %f)", buf, 0x34u);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_inflightMessages, "removeObjectForKey:", v14);
    -[NSMutableDictionary removeObjectForKey:](self->_pendingMessages, "removeObjectForKey:", v14);

    goto LABEL_25;
  }
  pbb_setupflow_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    v39 = v14;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = v13;
    v44 = 2112;
    v45 = *(double *)&v15;
    _os_log_error_impl(&dword_2113B6000, v20, OS_LOG_TYPE_ERROR, "Failed to send message ID: %@ (%@ -- %@) Error: %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to Send Message (Post-Send): %@ (%@ -- %@) Error: %@"), v14, v12, *(_QWORD *)&v13, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeIDSServiceDelegate _postMessageSendFailureForErrorMessage:](self, "_postMessageSendFailureForErrorMessage:", v21);

  CFPreferencesSetAppValue(CFSTR("LastFailedMessageID"), v14, CFSTR("com.apple.pbbridge"));
  CFPreferencesSetAppValue(CFSTR("LastIDSFailureCode"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "code")), CFSTR("com.apple.pbbridge"));
  v22 = -[NSObject retryCount](v16, "retryCount");
  pbb_setupflow_log();
  v23 = objc_claimAutoreleasedReturnValue();
  v17 = v23;
  if (v22 < 1)
  {
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_DWORD *)buf = 138413058;
    v39 = v14;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = v13;
    v44 = 2112;
    v45 = *(double *)&v15;
    v19 = "Failed fallback attempt(s) for message ID: %@ (%@ -- %@) Error: %@";
    goto LABEL_16;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v39 = v14;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = v13;
    v44 = 2112;
    v45 = *(double *)&v15;
    _os_log_impl(&dword_2113B6000, v17, OS_LOG_TYPE_DEFAULT, "Attempt fallback message send for ID: %@ (%@ -- %@) Error: %@", buf, 0x2Au);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_inflightMessages, "removeObjectForKey:", v14);
  -[NSObject setRetryCount:](v16, "setRetryCount:", -[NSObject retryCount](v16, "retryCount") - 1);
  -[NSMutableDictionary setObject:forKey:](self->_pendingMessages, "setObject:forKey:", v16, v14);
  -[NSObject retryInterval](v16, "retryInterval");
  v25 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__PBBridgeIDSServiceDelegate_service_account_identifier_didSendWithSuccess_error___block_invoke;
  block[3] = &unk_24CBBE9F0;
  v34 = v14;
  v35 = v12;
  v36 = *(id *)&v13;
  v37 = self;
  dispatch_after(v25, MEMORY[0x24BDAC9B8], block);

  v17 = v34;
LABEL_25:

}

void __82__PBBridgeIDSServiceDelegate_service_account_identifier_didSendWithSuccess_error___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(void);
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v10 = 138412802;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2113B6000, v2, OS_LOG_TYPE_DEFAULT, "Firing fallback message ID: %@ (%@ -- %@)", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(*(id *)(a1[7] + 40), "objectForKey:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pbb_setupflow_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "Firing messageInstance %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    objc_msgSend(v6, "retryAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1[7] + 32), "setObject:forKey:", v6, a1[4]);
      objc_msgSend(v6, "retryAction");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();

    }
  }

}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (BOOL)shouldSuppressTransportReachabilityTimeout
{
  return self->_shouldSuppressTransportReachabilityTimeout;
}

- (BOOL)isTinkerPairing
{
  return self->_isTinkerPairing;
}

- (void)setTinkerPairing:(BOOL)a3
{
  self->_isTinkerPairing = a3;
}

- (NSTimer)transportReachabilityTimer
{
  return self->_transportReachabilityTimer;
}

- (void)setTransportReachabilityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_transportReachabilityTimer, a3);
}

- (NSMutableDictionary)inflightMessages
{
  return self->_inflightMessages;
}

- (void)setInflightMessages:(id)a3
{
  objc_storeStrong((id *)&self->_inflightMessages, a3);
}

- (NSMutableDictionary)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setPendingMessages:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMessages, a3);
}

- (BOOL)listeningForIDSSentMessages
{
  return self->_listeningForIDSSentMessages;
}

- (void)setListeningForIDSSentMessages:(BOOL)a3
{
  self->_listeningForIDSSentMessages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_inflightMessages, 0);
  objc_storeStrong((id *)&self->_transportReachabilityTimer, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)_sendProtoBuf:(os_log_t)log service:priority:responseIdentifier:expectsResponse:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("Response ");
  v4 = 138413058;
  if (!a1)
    v3 = &stru_24CBBF548;
  v5 = v3;
  v6 = 1024;
  v7 = 142;
  v8 = 2080;
  v9 = "-[PBBridgeIDSServiceDelegate _sendProtoBuf:service:priority:responseIdentifier:expectsResponse:]";
  v10 = 2112;
  v11 = a2;
  _os_log_fault_impl(&dword_2113B6000, log, OS_LOG_TYPE_FAULT, "Service Was Nil! %@Protobuf (%d %s) -- %@", (uint8_t *)&v4, 0x26u);
}

void __96__PBBridgeIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("Response ");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = 138413314;
  if (!v4)
    v3 = &stru_24CBBF548;
  v7 = v3;
  v8 = 1024;
  v9 = 145;
  v10 = 2080;
  v11 = "-[PBBridgeIDSServiceDelegate _sendProtoBuf:service:priority:responseIdentifier:expectsResponse:]_block_invoke";
  v12 = 2112;
  v13 = v5;
  v14 = 2112;
  v15 = a2;
  _os_log_fault_impl(&dword_2113B6000, log, OS_LOG_TYPE_FAULT, "Failed to send IDS %@Protobuf (%d %s) -- %@ (Error: %@)", (uint8_t *)&v6, 0x30u);
}

@end

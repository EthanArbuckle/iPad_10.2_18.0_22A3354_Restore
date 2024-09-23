@implementation TVRCRPCompanionLinkClientWrapper

+ (TVRCRPCompanionLinkClientWrapper)wrapperWithDevice:(id)a3
{
  id v3;
  TVRCRPCompanionLinkClientWrapper *v4;

  v3 = a3;
  v4 = -[TVRCRPCompanionLinkClientWrapper initWithDevice:]([TVRCRPCompanionLinkClientWrapper alloc], "initWithDevice:", v3);

  return v4;
}

- (TVRCRPCompanionLinkClientWrapper)initWithDevice:(id)a3
{
  id v5;
  TVRCRPCompanionLinkClientWrapper *v6;
  TVRCRPCompanionLinkClientWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRCRPCompanionLinkClientWrapper;
  v6 = -[TVRCRPCompanionLinkClientWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_connected = 0;
    -[TVRCRPCompanionLinkClientWrapper _resolveFeatureFlags](v7, "_resolveFeatureFlags");
  }

  return v7;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[RPCompanionLinkDevice name](self->_device, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[RPCompanionLinkDevice effectiveIdentifier](self->_device, "effectiveIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)idsIdentifier
{
  void *v2;
  void *v3;

  -[RPCompanionLinkDevice idsDeviceIdentifier](self->_device, "idsDeviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSDictionary)alternateIdentifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[RPCompanionLinkDevice mediaRemoteIdentifier](self->_device, "mediaRemoteIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPCompanionLinkDevice mediaRouteIdentifier](self->_device, "mediaRouteIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPCompanionLinkDevice name](self->_device, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("MediaRemoteID"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("AirplayID"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("DeviceName"));
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (NSString)model
{
  void *v2;
  void *v3;

  -[RPCompanionLinkDevice model](self->_device, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)isPaired
{
  return (-[RPCompanionLinkDevice flags](self->_device, "flags") & 1) == 0;
}

- (int64_t)connectionType
{
  return 1;
}

- (void)updateWithDevice:(id)a3
{
  id v5;
  NSObject *v6;
  RPCompanionLinkDevice **p_device;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  int v15;
  _BOOL8 v16;
  void *v17;
  int v18;
  _BYTE v19[10];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _TVRCRapportLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315394;
    *(_QWORD *)v19 = "-[TVRCRPCompanionLinkClientWrapper updateWithDevice:]";
    *(_WORD *)&v19[8] = 2114;
    v20 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "%s - device: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  p_device = &self->_device;
  v8 = -[RPCompanionLinkDevice isEqualToRPDevice:](self->_device, "isEqualToRPDevice:", v5);
  _TVRCRapportLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Devices ids are the same. Skip reconnecting.", (uint8_t *)&v18, 2u);
    }

    v11 = -[RPCompanionLinkDevice deviceCapabilityFlags](*p_device, "deviceCapabilityFlags");
    if (v11 == objc_msgSend(v5, "deviceCapabilityFlags"))
    {
      objc_storeStrong((id *)&self->_device, a3);
    }
    else
    {
      _TVRCRapportLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[RPCompanionLinkDevice deviceCapabilityFlags](*p_device, "deviceCapabilityFlags");
        v15 = objc_msgSend(v5, "deviceCapabilityFlags");
        v18 = 67109376;
        *(_DWORD *)v19 = v14;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = v15;
        _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Device capabilities changed: old: %d, new: %d", (uint8_t *)&v18, 0xEu);
      }

      objc_storeStrong((id *)&self->_device, a3);
      v16 = -[TVRCRPCompanionLinkClientWrapper _findMyRemoteSupportedForDevice:](self, "_findMyRemoteSupportedForDevice:", v5);
      -[TVRCRPCompanionLinkClientWrapper delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deviceSupportsFindMyRemote:", v16);

    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Devices are not the same", (uint8_t *)&v18, 2u);
    }

    objc_storeStrong((id *)&self->_device, a3);
    if (-[TVRCRPCompanionLinkClientWrapper connected](self, "connected"))
    {
      _TVRCRapportLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect to new device.", (uint8_t *)&v18, 2u);
      }

      -[TVRCRPCompanionLinkClientWrapper reconnect](self, "reconnect");
    }
  }

}

- (void)reconnect
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[TVRCRPCompanionLinkClientWrapper reconnect]";
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__TVRCRPCompanionLinkClientWrapper_reconnect__block_invoke;
  v4[3] = &unk_24DCD70C8;
  v4[4] = self;
  -[TVRCRPCompanionLinkClientWrapper _invalidateAndResetWithCompletionHandler:](self, "_invalidateAndResetWithCompletionHandler:", v4);
}

uint64_t __45__TVRCRPCompanionLinkClientWrapper_reconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connect");
}

- (void)reestablishConnectionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[TVRCRPCompanionLinkClientWrapper reestablishConnectionWithCompletionHandler:]";
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = -[TVRCRPCompanionLinkClientWrapper newCompanionLinkClient](self, "newCompanionLinkClient");
  objc_initWeak((id *)buf, v6);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__TVRCRPCompanionLinkClientWrapper_reestablishConnectionWithCompletionHandler___block_invoke;
  v8[3] = &unk_24DCD88A0;
  v7 = v4;
  v9 = v7;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v6, "activateWithCompletion:", v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak((id *)buf);
}

void __79__TVRCRPCompanionLinkClientWrapper_reestablishConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  uint8_t v8[16];

  v3 = a2;
  _TVRCRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__TVRCRPCompanionLinkClientWrapper_reestablishConnectionWithCompletionHandler___block_invoke_cold_1(v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Reestablished connection with success", v8, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)connect
{
  NSObject *v3;
  NSObject *v4;
  RPCompanionLinkClient *companionClient;
  uint64_t v6;
  RPCompanionLinkClient *v7;
  RPCompanionLinkClient *v8;
  RPCompanionLinkClient *v9;
  RPCompanionLinkClient *v10;
  char v11;
  RPCompanionLinkClient *v12;
  RPCompanionLinkClient *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[16];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[TVRCRPCompanionLinkClientWrapper connect]";
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  if (-[TVRCRPCompanionLinkClientWrapper activated](self, "activated"))
  {
    _TVRCRapportLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "CompanionClient is already activated", v24, 2u);
    }

    -[TVRCRPCompanionLinkClientWrapper _updateConnectedState](self, "_updateConnectedState");
  }
  else
  {
    companionClient = self->_companionClient;
    v6 = MEMORY[0x24BDAC760];
    if (!companionClient)
    {
      v7 = -[TVRCRPCompanionLinkClientWrapper newCompanionLinkClient](self, "newCompanionLinkClient");
      v8 = self->_companionClient;
      self->_companionClient = v7;

      v9 = self->_companionClient;
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke;
      v22[3] = &unk_24DCD71B8;
      objc_copyWeak(&v23, (id *)buf);
      -[RPCompanionLinkClient setInvalidationHandler:](v9, "setInvalidationHandler:", v22);
      v10 = self->_companionClient;
      v20[0] = v6;
      v20[1] = 3221225472;
      v20[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_4;
      v20[3] = &unk_24DCD71B8;
      objc_copyWeak(&v21, (id *)buf);
      -[RPCompanionLinkClient setInterruptionHandler:](v10, "setInterruptionHandler:", v20);
      v11 = -[RPCompanionLinkDevice flags](self->_device, "flags");
      self->_authenticated = (v11 & 1) == 0;
      if ((v11 & 1) != 0)
      {
        -[RPCompanionLinkClient setFlags:](self->_companionClient, "setFlags:", 1);
        -[RPCompanionLinkClient setPasswordType:](self->_companionClient, "setPasswordType:", 1);
        v12 = self->_companionClient;
        v18[0] = v6;
        v18[1] = 3221225472;
        v18[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_5;
        v18[3] = &unk_24DCD88F0;
        objc_copyWeak(&v19, (id *)buf);
        -[RPCompanionLinkClient setPromptForPasswordHandler:](v12, "setPromptForPasswordHandler:", v18);
        v13 = self->_companionClient;
        v16[0] = v6;
        v16[1] = 3221225472;
        v16[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_10;
        v16[3] = &unk_24DCD81E8;
        objc_copyWeak(&v17, (id *)buf);
        -[RPCompanionLinkClient setAuthCompletionHandler:](v13, "setAuthCompletionHandler:", v16);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&v19);
      }
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      companionClient = self->_companionClient;
    }
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_11;
    v14[3] = &unk_24DCD81E8;
    objc_copyWeak(&v15, (id *)buf);
    -[RPCompanionLinkClient activateWithCompletion:](companionClient, "activateWithCompletion:", v14);
    -[RPCompanionLinkClient setEventIDRegistrationCompletion:](self->_companionClient, "setEventIDRegistrationCompletion:", &__block_literal_global_14);
    -[TVRCRPCompanionLinkClientWrapper _updateConnectedState](self, "_updateConnectedState");
    objc_destroyWeak(&v15);
  }
  objc_destroyWeak((id *)buf);
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void (**v6)(void);
  uint8_t v7[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "companionLinkClient invalidationHandler", buf, 2u);
    }

    if (WeakRetained[8])
    {
      TVRCMakeError(400, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_disconnectWithError:", v3);

    }
    WeakRetained[16] = 0;
    objc_msgSend(WeakRetained, "invalidationCompletionBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      _TVRCRapportLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Executing queued connection request", v7, 2u);
      }

      objc_msgSend(WeakRetained, "invalidationCompletionBlock");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

      objc_msgSend(WeakRetained, "setInvalidationCompletionBlock:", 0);
    }
  }

}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "companionLinkClient interruptionHandler", v3, 2u);
    }

  }
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_5(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *((_QWORD *)WeakRetained + 3);
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "PromptForPasswordHandler called on companionLinkClient for device %{public}@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_7;
    v10[3] = &unk_24DCD88C8;
    v10[4] = WeakRetained;
    +[TVRXDeviceAuthenticationChallenge _challengeWithCodeToEnterLocally:](TVRXDeviceAuthenticationChallenge, "_challengeWithCodeToEnterLocally:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setThrottleSeconds:", a3);
    if (objc_msgSend(*((id *)WeakRetained + 9), "passwordTypeActual") == 7)
    {
      _TVRCRapportLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "companionLinkClient reports password type is text", buf, 2u);
      }

      objc_msgSend(v7, "setChallengeAttributes:", 2);
    }
    v9 = objc_loadWeakRetained((id *)WeakRetained + 7);
    objc_msgSend(v9, "deviceEncounteredAuthenticationChallenge:", v7);

  }
}

uint64_t __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_7(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v4;

  if (!a3)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "tryPassword:", a2);
  _TVRCRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_7_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "disconnect");
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = WeakRetained[3];
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "AuthCompletionHandler called on companionLinkClient for device %{public}@. Error - %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (v3)
    {
      _TVRCRapportLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_10_cold_1();

      if (objc_msgSend(v3, "code") == -6776)
      {
        TVRCMakeError(104, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_disconnectWithError:", v8);

      }
      else
      {
        objc_msgSend(WeakRetained, "_disconnectWithError:", v3);
      }
    }
    else
    {
      *((_BYTE *)WeakRetained + 10) = 1;
      objc_msgSend(WeakRetained, "_updateConnectedState");
    }
  }

}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_11_cold_1();

      objc_msgSend(WeakRetained, "_disconnectWithError:", v3);
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "companionLinkClient activateWithCompletion", v7, 2u);
      }

      WeakRetained[9] = 1;
      objc_msgSend(WeakRetained, "_updateConnectedState");
    }
  }

}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Successfully registered %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)disconnect
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRCRPCompanionLinkClientWrapper device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "-[TVRCRPCompanionLinkClientWrapper disconnect]";
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s - Disconnecting %{public}@", (uint8_t *)&v5, 0x16u);

  }
  -[TVRCRPCompanionLinkClientWrapper _disconnectWithError:](self, "_disconnectWithError:", 0);
}

- (id)supportedButtons
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[2];
  id v32;
  _QWORD v33[14];

  v33[12] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if ((-[TVRCRPCompanionLinkClientWrapper featureFlags](self, "featureFlags") & 1) != 0)
  {
    v29 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 12);
    v33[0] = v29;
    v28 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 13);
    v33[1] = v28;
    v27 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 14);
    v33[2] = v27;
    v26 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 15);
    v33[3] = v26;
    v25 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 5);
    v33[4] = v25;
    v24 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 3);
    v33[5] = v24;
    v23 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 2);
    v33[6] = v23;
    v4 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 1);
    v33[7] = v4;
    v5 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 21);
    v33[8] = v5;
    v6 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 22);
    v33[9] = v6;
    v7 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 19);
    v33[10] = v7;
    v8 = -[TVRCButton _initWithButtonType:hasTapAction:properties:]([TVRCButton alloc], "_initWithButtonType:hasTapAction:properties:", 20, 1, 0);
    v33[11] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  if (-[TVRCRPCompanionLinkClientWrapper isSiriEnabled](self, "isSiriEnabled"))
  {
    v10 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 4);
    v32 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v11);

  }
  if ((-[TVRCRPCompanionLinkClientWrapper featureFlags](self, "featureFlags") & 2) != 0)
  {
    v12 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 5);
    v31[0] = v12;
    v13 = -[TVRCButton _initWithButtonType:hasTapAction:properties:]([TVRCButton alloc], "_initWithButtonType:hasTapAction:properties:", 16, 1, 0);
    v31[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v14);

    -[TVRCRapportMediaEventsManager supportedMediaCommands](self->_mediaManager, "supportedMediaCommands");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v3, "unionSet:", v15);

  }
  if ((-[TVRCRPCompanionLinkClientWrapper featureFlags](self, "featureFlags") & 8) != 0)
  {
    v16 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 30);
    v30[0] = v16;
    v17 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 26);
    v30[1] = v17;
    v18 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 27);
    v30[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v19);

  }
  if (-[TVRCRPCompanionLinkClientWrapper isGuideButtonSupported](self, "isGuideButtonSupported"))
  {
    v20 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 28);
    objc_msgSend(v3, "addObject:", v20);

  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)_findMyRemoteSupportedForDevice:(id)a3
{
  return -[RPCompanionLinkDevice deviceCapabilityFlags](self->_device, "deviceCapabilityFlags", a3) & 1;
}

- (BOOL)supportsDirectCaptionQueries
{
  return (-[TVRCRPCompanionLinkClientWrapper featureFlags](self, "featureFlags") >> 5) & 1;
}

- (BOOL)supportsFindMyRemote
{
  return -[TVRCRPCompanionLinkClientWrapper _findMyRemoteSupportedForDevice:](self, "_findMyRemoteSupportedForDevice:", self->_device);
}

- (BOOL)supportsTouchEvents
{
  return ((unint64_t)-[RPCompanionLinkDevice statusFlags](self->_device, "statusFlags") >> 18) & 1;
}

- (void)sendButtonEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  RPSiriSession *siriSession;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  RPHIDSession *hidSession;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id location;

  v4 = a3;
  if (-[TVRCRPCompanionLinkClientWrapper connected](self, "connected"))
  {
    if (+[TVRCButton _isMediaButtonEvent:](TVRCButton, "_isMediaButtonEvent:", v4))
    {
      -[TVRCRapportMediaEventsManager sendMediaEvent:](self->_mediaManager, "sendMediaEvent:", v4);
      objc_msgSend(v4, "button");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "buttonType");

      if ((unint64_t)(v6 - 17) <= 1)
        -[TVRCRPCompanionLinkClientWrapper toggleCaptions:](self, "toggleCaptions:", v6 == 17);
      goto LABEL_22;
    }
    objc_msgSend(v4, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "buttonType") == 20)
    {
      v9 = objc_msgSend(v4, "eventType");

      if (!v9)
      {
        objc_msgSend(v4, "button");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "properties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKey:", CFSTR("TVRCButtonApplicationBundleIDKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRCRPCompanionLinkClientWrapper _launchApplicationOrURL:](self, "_launchApplicationOrURL:", v12);

        goto LABEL_22;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "buttonType") == 2)
    {

    }
    else
    {
      objc_msgSend(v4, "button");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "buttonType");

      if (v15 != 23)
      {
LABEL_19:
        v18 = -[TVRCRPCompanionLinkClientWrapper _commandForButtonEvent:](self, "_commandForButtonEvent:", v4);
        v19 = -[TVRCRPCompanionLinkClientWrapper _stateForButtonEvent:](self, "_stateForButtonEvent:", v4);
        _TVRCRapportLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[TVRCRPCompanionLinkClientWrapper sendButtonEvent:].cold.1();

        objc_initWeak(&location, self);
        hidSession = self->_hidSession;
        v22 = *MEMORY[0x24BE7CC80];
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __52__TVRCRPCompanionLinkClientWrapper_sendButtonEvent___block_invoke;
        v23[3] = &unk_24DCD8958;
        objc_copyWeak(&v25, &location);
        v23[4] = self;
        v24 = v4;
        -[RPHIDSession hidCommand:buttonState:destinationID:completion:](hidSession, "hidCommand:buttonState:destinationID:completion:", v18, v19, v22, v23);

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
        goto LABEL_22;
      }
    }
    if (self->_siriSession)
    {
      _TVRCRapportLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[TVRCRPCompanionLinkClientWrapper sendButtonEvent:].cold.2();

      -[RPSiriSession invalidate](self->_siriSession, "invalidate");
      siriSession = self->_siriSession;
      self->_siriSession = 0;

    }
    goto LABEL_19;
  }
  _TVRCRapportLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[TVRCRPCompanionLinkClientWrapper sendButtonEvent:].cold.3();

LABEL_22:
}

void __52__TVRCRPCompanionLinkClientWrapper_sendButtonEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      _TVRCRapportLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __52__TVRCRPCompanionLinkClientWrapper_sendButtonEvent___block_invoke_cold_1();

      _TVRCRapportLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect after an issue sending a HID event", v8, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "reconnect");
    }
    else
    {
      objc_msgSend(WeakRetained, "_handleSideEffectsForEvent:", *(_QWORD *)(a1 + 40));
    }
  }

}

- (void)sendTouchEvent:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  RPHIDTouchSession *hidTouchSession;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  if (!-[TVRCRPCompanionLinkClientWrapper connected](self, "connected"))
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[TVRCRPCompanionLinkClientWrapper sendTouchEvent:].cold.1();
    goto LABEL_13;
  }
  if (self->_hidTouchSession)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE7CC18]);
    -[NSObject setFinger:](v5, "setFinger:", objc_msgSend(v4, "finger"));
    objc_msgSend(v4, "digitizerLocation");
    -[NSObject setLocation:](v5, "setLocation:");
    switch(objc_msgSend(v4, "phase"))
    {
      case 1:
        v6 = 1;
        break;
      case 2:
        -[NSObject setPhase:](v5, "setPhase:", 2);
        goto LABEL_9;
      case 3:
LABEL_9:
        v6 = 3;
        break;
      case 4:
        v6 = 4;
        break;
      case 5:
        v6 = 5;
        break;
      default:
        v6 = 0;
        break;
    }
    -[NSObject setPhase:](v5, "setPhase:", v6);
    objc_msgSend(v4, "timestamp");
    -[NSObject setTimestampSeconds:](v5, "setTimestampSeconds:");
    objc_initWeak(&location, self);
    hidTouchSession = self->_hidTouchSession;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__TVRCRPCompanionLinkClientWrapper_sendTouchEvent___block_invoke;
    v8[3] = &unk_24DCD8980;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    -[RPHIDTouchSession sendTouchEvent:completion:](hidTouchSession, "sendTouchEvent:completion:", v5, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
LABEL_13:

  }
}

void __51__TVRCRPCompanionLinkClientWrapper_sendTouchEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    _TVRCRapportLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __51__TVRCRPCompanionLinkClientWrapper_sendTouchEvent___block_invoke_cold_1();

    _TVRCRapportLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect after an issue sending a touch event", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "reconnect");
  }

}

- (void)getCurrentRTISourceSession:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__TVRCRPCompanionLinkClientWrapper_getCurrentRTISourceSession___block_invoke;
  block[3] = &unk_24DCD89A8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__TVRCRPCompanionLinkClientWrapper_getCurrentRTISourceSession___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained[13], "rtiSession");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

      WeakRetained = v5;
    }
  }

}

- (void)setRTISessionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  -[TVRCRPCompanionLinkClientWrapper setRtiSessionHandler:](self, "setRtiSessionHandler:", v4);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__TVRCRPCompanionLinkClientWrapper_setRTISessionHandler___block_invoke;
  v6[3] = &unk_24DCD89A8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[RPTextInputSession setRtiUpdatedHandler:](self->_textInputSession, "setRtiUpdatedHandler:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __57__TVRCRPCompanionLinkClientWrapper_setRTISessionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained[13], "rtiSession");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

      WeakRetained = v5;
    }
  }

}

- (void)sendEvent:(id)a3 options:(id)a4 response:(id)a5
{
  -[TVRCRPCompanionLinkClientWrapper sendEvent:options:shouldRetry:response:](self, "sendEvent:options:shouldRetry:response:", a3, a4, 0, a5);
}

- (void)sendEvent:(id)a3 options:(id)a4 shouldRetry:(BOOL)a5 response:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  RPCompanionLinkClient *companionClient;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _TVRCRapportLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v10;
    _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@", buf, 0xCu);
  }

  v14 = (void *)MEMORY[0x24BDBD1B8];
  if (v11)
    v14 = v11;
  v15 = v14;
  objc_initWeak((id *)buf, self);
  companionClient = self->_companionClient;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke;
  v21[3] = &unk_24DCD89F8;
  v17 = v10;
  v22 = v17;
  v26 = a5;
  objc_copyWeak(&v25, (id *)buf);
  v18 = *MEMORY[0x24BE7CC80];
  v19 = v12;
  v24 = v19;
  v20 = v11;
  v23 = v20;
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](companionClient, "sendRequestID:request:destinationID:options:responseHandler:", v17, v15, v18, 0, v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

void __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id WeakRetained;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _TVRCRapportLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    v24 = 2114;
    v25 = v7;
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", buf, 0x20u);
  }

  if (v9 && *(_BYTE *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      _TVRCRapportLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Reestablishing connection after error", buf, 2u);
      }

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke_19;
      v15[3] = &unk_24DCD89D0;
      v16 = *(id *)(a1 + 32);
      v20 = *(id *)(a1 + 48);
      v17 = v7;
      v18 = v8;
      objc_copyWeak(&v21, (id *)(a1 + 56));
      v19 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "reestablishConnectionWithCompletionHandler:", v15);

      objc_destroyWeak(&v21);
    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      (*(void (**)(uint64_t, id, id, id))(v14 + 16))(v14, v7, v8, v9);
  }

}

void __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    _TVRCRapportLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke_19_cold_1();

    v5 = *(_QWORD *)(a1 + 64);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "sendEvent:options:shouldRetry:response:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));

  }
}

- (void)registerEvent:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[TVRCRPCompanionLinkClientWrapper activated](self, "activated");
  _TVRCRapportLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Registering event with ID %{public}@", (uint8_t *)&v14, 0xCu);
    }

    -[TVRCRPCompanionLinkClientWrapper companionClient](self, "companionClient");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject registerEventID:options:handler:](v13, "registerEventID:options:handler:", v8, v9, v10);
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[TVRCRPCompanionLinkClientWrapper registerEvent:options:handler:].cold.1();
  }

}

- (void)deregisterEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "De-registering event %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[TVRCRPCompanionLinkClientWrapper companionClient](self, "companionClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deregisterEventID:", v4);

}

- (void)toggleCaptions:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  if (-[TVRCRPCompanionLinkClientWrapper supportsDirectCaptionQueries](self, "supportsDirectCaptionQueries"))
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[TVRCRPCompanionLinkClientWrapper toggleCaptions:]";
      v14 = 1026;
      v15 = v3;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%s: %{public,BOOL}d", buf, 0x12u);
    }

    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v10 = CFSTR("CaptionsEnabled");
    v11 = v6;
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = v6;
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRCRPCompanionLinkClientWrapper sendEvent:options:shouldRetry:response:](self, "sendEvent:options:shouldRetry:response:", CFSTR("ToggleCaptions"), v9, 0, 0, v10, v11);
  }
}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  RPCompanionLinkClient *companionClient;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  id v15;
  _QWORD v16[4];
  __CFString *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  uint8_t buf[4];
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = CFSTR("FetchUpNextInfoEvent");
  _TVRCRapportLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@", buf, 0xCu);
  }

  companionClient = self->_companionClient;
  v19 = CFSTR("PaginationTokenKey");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE7CC80];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __82__TVRCRPCompanionLinkClientWrapper_fetchUpNextInfoWithPaginationToken_completion___block_invoke;
  v16[3] = &unk_24DCD8A20;
  v14 = v8;
  v17 = v14;
  v18 = v7;
  v15 = v7;
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](companionClient, "sendRequestID:request:destinationID:options:responseHandler:", v14, v12, v13, 0, v16);

  if (!v6)
}

void __82__TVRCRPCompanionLinkClientWrapper_fetchUpNextInfoWithPaginationToken_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  _TVRCRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138543874;
    v12 = v9;
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", (uint8_t *)&v11, 0x20u);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PaginationTokenKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  RPCompanionLinkClient *companionClient;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  __CFString *v15;
  id v16;
  const __CFString *v17;
  id v18;
  uint8_t buf[4];
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = CFSTR("MarkAsWatchedEvent");
  if (objc_msgSend(v6, "length"))
  {
    v17 = CFSTR("IdentifierKey");
    v18 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _TVRCRapportLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@", buf, 0xCu);
    }

    companionClient = self->_companionClient;
    v12 = *MEMORY[0x24BE7CC80];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __80__TVRCRPCompanionLinkClientWrapper_markAsWatchedWithMediaIdentifier_completion___block_invoke;
    v14[3] = &unk_24DCD8A20;
    v15 = v8;
    v16 = v7;
    -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](companionClient, "sendRequestID:request:destinationID:options:responseHandler:", v15, v9, v12, 0, v14);

  }
  else
  {
    _TVRCRapportLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Invalid mediaIdentifier sent to %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __80__TVRCRPCompanionLinkClientWrapper_markAsWatchedWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  _TVRCRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v9;
    v12 = 2114;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  RPCompanionLinkClient *companionClient;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  __CFString *v15;
  id v16;
  const __CFString *v17;
  id v18;
  uint8_t buf[4];
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = CFSTR("RemoveFromUpNextEvent");
  if (objc_msgSend(v6, "length"))
  {
    v17 = CFSTR("IdentifierKey");
    v18 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _TVRCRapportLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@", buf, 0xCu);
    }

    companionClient = self->_companionClient;
    v12 = *MEMORY[0x24BE7CC80];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __77__TVRCRPCompanionLinkClientWrapper_removeItemWithMediaIdentifier_completion___block_invoke;
    v14[3] = &unk_24DCD8A20;
    v15 = v8;
    v16 = v7;
    -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](companionClient, "sendRequestID:request:destinationID:options:responseHandler:", v15, v9, v12, 0, v14);

  }
  else
  {
    _TVRCRapportLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Invalid mediaIdentifier sent to %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __77__TVRCRPCompanionLinkClientWrapper_removeItemWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  _TVRCRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v9;
    v12 = 2114;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)playItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  RPCompanionLinkClient *companionClient;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  __CFString *v15;
  id v16;
  uint8_t buf[4];
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = CFSTR("PlayMediaEvent");
  if ((objc_msgSend(v6, "isValid") & 1) != 0)
  {
    objc_msgSend(v6, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _TVRCRapportLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@", buf, 0xCu);
    }

    companionClient = self->_companionClient;
    v12 = *MEMORY[0x24BE7CC80];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__TVRCRPCompanionLinkClientWrapper_playItem_completion___block_invoke;
    v14[3] = &unk_24DCD8A20;
    v15 = v8;
    v16 = v7;
    -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](companionClient, "sendRequestID:request:destinationID:options:responseHandler:", v15, v9, v12, 0, v14);

  }
  else
  {
    _TVRCRapportLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Invalid item sent to %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __56__TVRCRPCompanionLinkClientWrapper_playItem_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  _TVRCRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v9;
    v12 = 2114;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCRPCompanionLinkClientWrapper name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("name"));

  -[TVRCRPCompanionLinkClientWrapper identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("Identifier"));

  -[TVRCRPCompanionLinkClientWrapper model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("model"));

  -[TVRCRPCompanionLinkClientWrapper sourceVersion](self, "sourceVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("sourceVersion"));

  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper isSiriEnabled](self, "isSiriEnabled"), CFSTR("siriEnabled"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper pttFeatureSupported](self, "pttFeatureSupported"), CFSTR("siriPTTEnabled"));
  -[TVRCRPCompanionLinkClientWrapper _stringForFeatureFlags:](self, "_stringForFeatureFlags:", self->_featureFlags);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("featureFlags"));

  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper connected](self, "connected"), CFSTR("connected"));
  v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper isPaired](self, "isPaired"), CFSTR("isPaired"));
  v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper supportsFindMyRemote](self, "supportsFindMyRemote"), CFSTR("supportsFindMyRemote"));
  -[TVRCRPCompanionLinkClientWrapper alternateIdentifiers](self, "alternateIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", v14, CFSTR("alternateIdentifiers"), 0);

  objc_msgSend(v3, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (BOOL)_featureSupported:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVRCRPCompanionLinkClientWrapper sourceVersion](self, "sourceVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:options:", v4, 64);
  _TVRCRapportLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRCRPCompanionLinkClientWrapper name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v4;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 1024;
    v17 = v6 < 2;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Checking if '%@' is supported on '%@' for sourceVersion '%@': %{BOOL}d", (uint8_t *)&v10, 0x26u);

  }
  return v6 < 2;
}

- (NSString)sourceVersion
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  __CFString *v17;
  unint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  __CFString *v21;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[TVRCRPCompanionLinkClientWrapper device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceVersion");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[TVRCRPCompanionLinkClientWrapper device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-SourceVersion"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[__CFString length](v4, "length");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    if (-[__CFString length](v11, "length"))
    {
      _TVRCRapportLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v11;
        v25 = 2112;
        v26 = v8;
        v13 = "Currently cached sourceVersion '%@' for '%@'";
LABEL_11:
        _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
      }
    }
    else
    {

      _TVRCRapportLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("0.0");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = CFSTR("0.0");
        v25 = 2112;
        v26 = v8;
        v13 = "Setting default cached sourceVersion '%@' for '%@'";
        goto LABEL_11;
      }
    }

    v18 = -[__CFString compare:options:](v11, "compare:options:", v4, 64);
    _TVRCRapportLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18 > 1)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412802;
        v24 = v4;
        v25 = 2112;
        v26 = v8;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_21A51B000, v19, OS_LOG_TYPE_DEFAULT, "sourceVersion '%@' for '%@' is greater than cached version '%@' so caching and returning it", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v19, "setObject:forKey:", v4, v8);
      v21 = v4;
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412802;
        v24 = v11;
        v25 = 2112;
        v26 = v8;
        v27 = 2112;
        v28 = v4;
        _os_log_impl(&dword_21A51B000, v19, OS_LOG_TYPE_DEFAULT, "Cached version '%@' for '%@' is >= reported version '%@' so returning it", buf, 0x20u);
      }
      v21 = v11;
    }

    v17 = v21;
    goto LABEL_20;
  }

  v14 = -[__CFString length](v11, "length");
  _TVRCRapportLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "Found cached sourceVersion '%@' for '%@'", buf, 0x16u);
    }

    v4 = v11;
    v17 = v4;
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "Unknown sourceVersion, allowing all features", buf, 2u);
    }

    v17 = CFSTR("9999.9");
    v4 = v11;
  }
LABEL_20:

  return (NSString *)v17;
}

- (void)_resolveFeatureFlags
{
  NSObject *v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  _BOOL4 pttFeatureSupported;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[TVRCRPCompanionLinkClientWrapper _resolveFeatureFlags]";
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v4 = -[RPCompanionLinkDevice flags](self->_device, "flags");
  v5 = (-[RPCompanionLinkDevice flags](self->_device, "flags") >> 7) & 2 | (v4 >> 10) & 1;
  v6 = v5 | (-[RPCompanionLinkDevice flags](self->_device, "flags") >> 10) & 4;
  if (-[TVRCRPCompanionLinkClientWrapper _featureSupported:](self, "_featureSupported:", CFSTR("250.3")))
    v6 |= 8uLL;
  if (-[TVRCRPCompanionLinkClientWrapper _featureSupported:](self, "_featureSupported:", CFSTR("340.15")))
    v6 |= 0x10uLL;
  if (-[TVRCRPCompanionLinkClientWrapper _featureSupported:](self, "_featureSupported:", CFSTR("600.20")))
    v6 |= 0x20uLL;
  _TVRCRapportLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRCRPCompanionLinkClientWrapper _stringForFeatureFlags:](self, "_stringForFeatureFlags:", v6);
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Resolved Feature Flags: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  self->_pttFeatureSupported = 0;
  _TVRCRapportLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    pttFeatureSupported = self->_pttFeatureSupported;
    v11 = 67109120;
    LODWORD(v12) = pttFeatureSupported;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "PTT feature supported: %d", (uint8_t *)&v11, 8u);
  }

  self->_featureFlags = v6;
}

- (id)_stringForFeatureFlags:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("HID"));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("MediaControl"));
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v5, "addObject:", CFSTR("MVPD"));
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v5, "addObject:", CFSTR("TextInput"));
  if ((v3 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v3 & 0x10) != 0)
LABEL_6:
    objc_msgSend(v5, "addObject:", CFSTR("SiriPTT"));
LABEL_7:
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" | "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_disconnectWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[TVRCRPCompanionLinkClientWrapper _disconnectWithError:].cold.1((uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[TVRCRPCompanionLinkClientWrapper _disconnectWithError:]";
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[TVRCRPCompanionLinkClientWrapper _invalidateAndReset](self, "_invalidateAndReset");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "disconnectedFromDevice:error:", self, v4);

}

- (void)_invalidateAndReset
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TVRCRPCompanionLinkClientWrapper _invalidateAndReset]";
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[TVRCRPCompanionLinkClientWrapper _invalidateAndResetWithCompletionHandler:](self, "_invalidateAndResetWithCompletionHandler:", 0);
}

- (void)_invalidateAndResetWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  uint8_t v26[8];
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  _QWORD block[4];
  id v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[TVRCRPCompanionLinkClientWrapper _invalidateAndResetWithCompletionHandler:]";
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (!-[TVRCRPCompanionLinkClientWrapper isInvalidating](self, "isInvalidating"))
  {
    self->_isInvalidating = 1;
    -[TVRCRPCompanionLinkClientWrapper _sendSessionStop](self, "_sendSessionStop");
    -[TVRCRPCompanionLinkClientWrapper _stopMonitoringTVSystemStatus](self, "_stopMonitoringTVSystemStatus");
    -[TVRCRPCompanionLinkClientWrapper _stopMonitoringSupportedActions](self, "_stopMonitoringSupportedActions");
    -[TVRCRPCompanionLinkClientWrapper _stopMonitoringNowPlayingInfo](self, "_stopMonitoringNowPlayingInfo");
    -[TVRCRPCompanionLinkClientWrapper _invalidateRemoteFindingManager](self, "_invalidateRemoteFindingManager");
    v7 = dispatch_group_create();
    v8 = MEMORY[0x24BDAC9B8];
    objc_initWeak((id *)buf, self);
    v9 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke;
    block[3] = &unk_24DCD71B8;
    objc_copyWeak(&v31, (id *)buf);
    v10 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_group_async(v7, MEMORY[0x24BDAC9B8], block);
    -[TVRCRPCompanionLinkClientWrapper siriSession](self, "siriSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      dispatch_group_enter(v7);
      -[TVRCRPCompanionLinkClientWrapper siriSession](self, "siriSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_77;
      v27[3] = &unk_24DCD8980;
      objc_copyWeak(&v29, (id *)buf);
      v28 = v7;
      objc_msgSend(v12, "invalidateWithCompletion:", v27);

      objc_destroyWeak(&v29);
    }
    -[TVRCRPCompanionLinkClientWrapper hidTouchSession](self, "hidTouchSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else if (!-[TVRCRPCompanionLinkClientWrapper hidTouchSessionActivated](self, "hidTouchSessionActivated"))
    {
LABEL_15:
      dispatch_get_global_queue(25, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_79;
      v18[3] = &unk_24DCD8A70;
      v19 = v7;
      v20 = v10;
      v17 = v7;
      objc_copyWeak(&v22, (id *)buf);
      v21 = v4;
      dispatch_async(v16, v18);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }
    _TVRCRapportLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "Invalidating HIDTouchSession", v26, 2u);
    }

    dispatch_group_enter(v7);
    -[TVRCRPCompanionLinkClientWrapper hidTouchSession](self, "hidTouchSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_78;
    v23[3] = &unk_24DCD8980;
    objc_copyWeak(&v25, (id *)buf);
    v24 = v7;
    objc_msgSend(v15, "invalidateWithCompletion:", v23);

    objc_destroyWeak(&v25);
    goto LABEL_15;
  }
  _TVRCRapportLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Already in the process of invalidating. Ignoring this request.", buf, 2u);
  }

LABEL_16:
}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating HIDSession", buf, 2u);
    }

    objc_msgSend(WeakRetained, "hidSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(WeakRetained, "setHidSession:", 0);
    objc_msgSend(WeakRetained, "setHidSessionActivated:", 0);
    _TVRCRapportLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating MediaManager", v9, 2u);
    }

    objc_msgSend(WeakRetained, "mediaManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    objc_msgSend(WeakRetained, "setMediaManager:", 0);
    _TVRCRapportLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating TextInputSession", v8, 2u);
    }

    objc_msgSend(WeakRetained, "textInputSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    objc_msgSend(WeakRetained, "setTextInputSession:", 0);
    objc_msgSend(WeakRetained, "setTextInputSessionActivated:", 0);
  }

}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_77_cold_1();
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully invalidated RPSiriSession", v7, 2u);
    }

    if (objc_msgSend(WeakRetained, "isInvalidating"))
      objc_msgSend(WeakRetained, "setSiriSession:", 0);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_78_cold_1();
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully invalidated HIDTouchSession", v7, 2u);
    }

    if (objc_msgSend(WeakRetained, "isInvalidating"))
    {
      objc_msgSend(WeakRetained, "setHidTouchSession:", 0);
      objc_msgSend(WeakRetained, "setHidTouchSessionActivated:", 0);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_79(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  dispatch_time_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9[2];
  uint8_t buf[16];

  _TVRCRapportLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Waiting for rapport to invalidate all sessions", buf, 2u);
  }

  v3 = *(NSObject **)(a1 + 32);
  v4 = dispatch_time(0, 2000000000);
  v5 = (void *)dispatch_group_wait(v3, v4);
  v6 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_80;
  block[3] = &unk_24DCD8A48;
  v9[1] = v5;
  objc_copyWeak(v9, (id *)(a1 + 56));
  v8 = *(id *)(a1 + 48);
  dispatch_sync(v6, block);

  objc_destroyWeak(v9);
}

uint64_t __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_80(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  id WeakRetained;
  uint64_t result;
  __int16 v9;
  uint8_t buf[2];

  v2 = *(_QWORD *)(a1 + 48);
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4)
      goto LABEL_7;
    v9 = 0;
    v5 = "Failed to invalidate all sessions. Will force reset rapport sessions";
    v6 = (uint8_t *)&v9;
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = "Invalidated all sessions. Invalidating CompanionLinkClient.";
    v6 = buf;
  }
  _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
LABEL_7:

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resetState");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  return result;
}

- (void)_resetState
{
  NSObject *v3;
  void *v4;
  RPCompanionLinkClient *companionClient;
  uint8_t v6[16];

  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Resetting state", v6, 2u);
  }

  -[TVRCRPCompanionLinkClientWrapper companionClient](self, "companionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  companionClient = self->_companionClient;
  self->_companionClient = 0;

  -[TVRCRPCompanionLinkClientWrapper setConnected:](self, "setConnected:", 0);
  -[TVRCRPCompanionLinkClientWrapper setActivated:](self, "setActivated:", 0);
  -[TVRCRPCompanionLinkClientWrapper setAuthenticated:](self, "setAuthenticated:", 0);
  -[TVRCRPCompanionLinkClientWrapper setHidSession:](self, "setHidSession:", 0);
  -[TVRCRPCompanionLinkClientWrapper setHidSessionActivated:](self, "setHidSessionActivated:", 0);
  -[TVRCRPCompanionLinkClientWrapper setHidTouchSession:](self, "setHidTouchSession:", 0);
  -[TVRCRPCompanionLinkClientWrapper setHidTouchSessionActivated:](self, "setHidTouchSessionActivated:", 0);
  -[TVRCRPCompanionLinkClientWrapper setMediaManager:](self, "setMediaManager:", 0);
  -[TVRCRPCompanionLinkClientWrapper setTextInputSession:](self, "setTextInputSession:", 0);
  -[TVRCRPCompanionLinkClientWrapper setTextInputSessionActivated:](self, "setTextInputSessionActivated:", 0);
  -[TVRCRPCompanionLinkClientWrapper setSiriSession:](self, "setSiriSession:", 0);
  -[TVRCRPCompanionLinkClientWrapper setStartedSetup:](self, "setStartedSetup:", 0);
  -[TVRCRPCompanionLinkClientWrapper setIsInvalidating:](self, "setIsInvalidating:", 0);
}

- (void)_sendSessionStart
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__TVRCRPCompanionLinkClientWrapper__sendSessionStart__block_invoke;
  v3[3] = &unk_24DCD7CF0;
  objc_copyWeak(&v4, &location);
  -[TVRCRPCompanionLinkClientWrapper sendEvent:options:shouldRetry:response:](self, "sendEvent:options:shouldRetry:response:", CFSTR("TVRCSessionStart"), 0, 1, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __53__TVRCRPCompanionLinkClientWrapper__sendSessionStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __53__TVRCRPCompanionLinkClientWrapper__sendSessionStart__block_invoke_cold_1();
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = WeakRetained[9];
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Session started for companionLinkClient %{public}@.", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)_sendSessionStop
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__TVRCRPCompanionLinkClientWrapper__sendSessionStop__block_invoke;
  v3[3] = &unk_24DCD7CF0;
  objc_copyWeak(&v4, &location);
  -[TVRCRPCompanionLinkClientWrapper sendEvent:options:shouldRetry:response:](self, "sendEvent:options:shouldRetry:response:", CFSTR("TVRCSessionStop"), 0, 1, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__TVRCRPCompanionLinkClientWrapper__sendSessionStop__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __52__TVRCRPCompanionLinkClientWrapper__sendSessionStop__block_invoke_cold_1();
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = WeakRetained[9];
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Session stopped for companionLinkClient %{public}@.", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)_setupHidSessionIfNeeded
{
  NSObject *v2;
  RPHIDSession *v4;
  RPHIDSession *hidSession;
  RPHIDSession *v6;
  _QWORD v7[5];
  id v8;
  id buf[2];

  if (self->_hidSession)
  {
    _TVRCRapportLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Active HIDSession already exists", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    v4 = (RPHIDSession *)objc_alloc_init(MEMORY[0x24BE7CC10]);
    hidSession = self->_hidSession;
    self->_hidSession = v4;

    -[RPHIDSession setMessenger:](self->_hidSession, "setMessenger:", self->_companionClient);
    objc_initWeak(buf, self);
    v6 = self->_hidSession;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__TVRCRPCompanionLinkClientWrapper__setupHidSessionIfNeeded__block_invoke;
    v7[3] = &unk_24DCD8980;
    objc_copyWeak(&v8, buf);
    v7[4] = self;
    -[RPHIDSession activateWithCompletion:](v6, "activateWithCompletion:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __60__TVRCRPCompanionLinkClientWrapper__setupHidSessionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __60__TVRCRPCompanionLinkClientWrapper__setupHidSessionIfNeeded__block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "_disconnectWithError:", v3);
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = WeakRetained[9];
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully created hidSession for companionLinkClient %{public}@.", (uint8_t *)&v8, 0xCu);
      }

      *((_BYTE *)WeakRetained + 12) = 1;
      objc_msgSend(WeakRetained, "_updateConnectedState");
    }
  }

}

- (void)_setupFeatureServicesIfNeeded
{
  NSObject *v3;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  TVRCRapportMediaEventsManager *v7;
  RPCompanionLinkClient *companionClient;
  _BOOL8 v9;
  TVRCRapportMediaEventsManager *v10;
  TVRCRapportMediaEventsManager *mediaManager;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[TVRCRPCompanionLinkClientWrapper _setupFeatureServicesIfNeeded]";
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = self->_mediaManager == 0;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Setting up _TVRCRapportMediaEventsManager", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v7 = [TVRCRapportMediaEventsManager alloc];
    companionClient = self->_companionClient;
    v9 = -[TVRCRPCompanionLinkClientWrapper supportsDirectCaptionQueries](self, "supportsDirectCaptionQueries");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __65__TVRCRPCompanionLinkClientWrapper__setupFeatureServicesIfNeeded__block_invoke;
    v14[3] = &unk_24DCD71B8;
    objc_copyWeak(&v15, (id *)buf);
    v10 = -[TVRCRapportMediaEventsManager initWithCompanionLinkClient:supportsDirectCaptionQueries:eventHandler:](v7, "initWithCompanionLinkClient:supportsDirectCaptionQueries:eventHandler:", companionClient, v9, v14);
    mediaManager = self->_mediaManager;
    self->_mediaManager = v10;

    -[TVRCRPCompanionLinkClientWrapper device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "siriInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCRPCompanionLinkClientWrapper _updateSiriStatusFromSiriInfo:](self, "_updateSiriStatusFromSiriInfo:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "_TVRCRapportMediaEventsManager is already set up", buf, 2u);
    }

  }
}

void __65__TVRCRPCompanionLinkClientWrapper__setupFeatureServicesIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "_TVRCRapportMediaEventsManager eventHandlerCalled", v4, 2u);
    }

    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceUpdatedSupportedButtons:", WeakRetained);

  }
}

- (void)_setupTouchSessionIfNeeded
{
  NSObject *v2;
  RPHIDTouchSession *v4;
  RPHIDTouchSession *hidTouchSession;
  RPHIDTouchSession *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  if (self->_hidTouchSession)
  {
    _TVRCRapportLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Active HIDTouchSession already exists", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    v4 = (RPHIDTouchSession *)objc_alloc_init(MEMORY[0x24BE7CC20]);
    hidTouchSession = self->_hidTouchSession;
    self->_hidTouchSession = v4;

    -[RPHIDTouchSession setMessenger:](self->_hidTouchSession, "setMessenger:", self->_companionClient);
    objc_initWeak(buf, self);
    v6 = self->_hidTouchSession;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__TVRCRPCompanionLinkClientWrapper__setupTouchSessionIfNeeded__block_invoke;
    v7[3] = &unk_24DCD81E8;
    objc_copyWeak(&v8, buf);
    -[RPHIDTouchSession activateWithCompletion:](v6, "activateWithCompletion:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __62__TVRCRPCompanionLinkClientWrapper__setupTouchSessionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __62__TVRCRPCompanionLinkClientWrapper__setupTouchSessionIfNeeded__block_invoke_cold_1();

      WeakRetained[13] = 0;
      objc_msgSend(WeakRetained, "_disconnectWithError:", v3);
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *((_QWORD *)WeakRetained + 9);
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully created hidTouchSession for companionLinkClient %{public}@.", (uint8_t *)&v8, 0xCu);
      }

      WeakRetained[13] = 1;
      objc_msgSend(WeakRetained, "_updateConnectedState");
    }
  }

}

- (void)_setupTextInputSessionIfNeeded
{
  NSObject *v2;
  RPTextInputSession *v4;
  RPTextInputSession *textInputSession;
  RPTextInputSession *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  if (self->_textInputSession)
  {
    _TVRCRapportLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "Active TextInputSession already exists", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    v4 = (RPTextInputSession *)objc_alloc_init(MEMORY[0x24BE7CC78]);
    textInputSession = self->_textInputSession;
    self->_textInputSession = v4;

    -[RPTextInputSession setMessenger:](self->_textInputSession, "setMessenger:", self->_companionClient);
    objc_initWeak(buf, self);
    v6 = self->_textInputSession;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __66__TVRCRPCompanionLinkClientWrapper__setupTextInputSessionIfNeeded__block_invoke;
    v7[3] = &unk_24DCD81E8;
    objc_copyWeak(&v8, buf);
    -[RPTextInputSession activateWithCompletion:](v6, "activateWithCompletion:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __66__TVRCRPCompanionLinkClientWrapper__setupTextInputSessionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void (**v8)(id, void *);
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __66__TVRCRPCompanionLinkClientWrapper__setupTextInputSessionIfNeeded__block_invoke_cold_1();

      objc_msgSend(WeakRetained, "_disconnectWithError:", v3);
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = WeakRetained[9];
        v10 = 138543362;
        v11 = v7;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully created textInputSession for companionLinkClient %{public}@.", (uint8_t *)&v10, 0xCu);
      }

      *((_BYTE *)WeakRetained + 14) = 1;
      objc_msgSend(WeakRetained, "_updateConnectedState");
      v8 = (void (**)(id, void *))WeakRetained[14];
      if (v8)
      {
        objc_msgSend(WeakRetained[13], "rtiSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v9);

      }
    }
  }

}

- (void)_updateAttentionState:(int64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int64_t v8;
  __CFString *v9;
  id WeakRetained;
  uint8_t buf[4];
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[TVRCRPCompanionLinkClientWrapper attentionState](self, "attentionState") != a3)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) >= 3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %ld)"), a3);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_24DCD8B98[a3 - 1];
      }
      v7 = v6;
      v8 = -[TVRCRPCompanionLinkClientWrapper attentionState](self, "attentionState");
      if ((unint64_t)(v8 - 1) >= 3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %ld)"), v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_24DCD8B98[v8 - 1];
      }
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "TV attention state updated to %{public}@ from %{public}@", buf, 0x16u);

    }
    self->_attentionState = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deviceUpdatedAttentionState");

  }
}

- (void)_fetchTVSystemStatusAndStartMonitoring
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Fetching TV System Status", buf, 2u);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__TVRCRPCompanionLinkClientWrapper__fetchTVSystemStatusAndStartMonitoring__block_invoke;
  v4[3] = &unk_24DCD8A98;
  v4[4] = self;
  -[TVRCRPCompanionLinkClientWrapper sendEvent:options:response:](self, "sendEvent:options:response:", CFSTR("FetchAttentionState"), MEMORY[0x24BDBD1B8], v4);
  -[TVRCRPCompanionLinkClientWrapper _startMonitoringTVSystemStatus](self, "_startMonitoringTVSystemStatus");
}

void __74__TVRCRPCompanionLinkClientWrapper__fetchTVSystemStatusAndStartMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("state"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateAttentionState:", (int)objc_msgSend(v3, "intValue"));

}

- (void)_startMonitoringTVSystemStatus
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[TVRCRPCompanionLinkClientWrapper _startMonitoringTVSystemStatus]";
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8 = *MEMORY[0x24BE7CCB0];
  v9 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  -[TVRCRPCompanionLinkClientWrapper companionClient](self, "companionClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__TVRCRPCompanionLinkClientWrapper__startMonitoringTVSystemStatus__block_invoke;
  v6[3] = &unk_24DCD7D18;
  objc_copyWeak(&v7, (id *)buf);
  objc_msgSend(v5, "registerEventID:options:handler:", CFSTR("TVSystemStatus"), v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);

}

void __66__TVRCRPCompanionLinkClientWrapper__startMonitoringTVSystemStatus__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("state"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updateAttentionState:", (int)objc_msgSend(v4, "intValue"));

  }
}

- (void)_stopMonitoringTVSystemStatus
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Stopped monitoring TVSystemStatus", v5, 2u);
  }

  -[TVRCRPCompanionLinkClientWrapper companionClient](self, "companionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterRequestID:", CFSTR("TVSystemStatus"));

}

- (void)_setupRemoteFindingManagerIfNeeded
{
  TVRCSiriRemoteFindingManager *remoteFindingManager;
  NSObject *v4;
  _BOOL4 v5;
  TVRCSiriRemoteFindingManager *v6;
  TVRCSiriRemoteFindingManager *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  remoteFindingManager = self->_remoteFindingManager;
  _TVRCRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (remoteFindingManager)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Active RemoteFindingManager already exists", buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Creating RemoteFindingManager", v8, 2u);
    }

    v6 = -[TVRCSiriRemoteFindingManager initWithCompanionLinkClientWrapper:]([TVRCSiriRemoteFindingManager alloc], "initWithCompanionLinkClientWrapper:", self);
    v7 = self->_remoteFindingManager;
    self->_remoteFindingManager = v6;

    -[TVRCSiriRemoteFindingManager addObserver:forKeyPath:options:context:](self->_remoteFindingManager, "addObserver:forKeyPath:options:context:", self, CFSTR("pairedRemoteInfo"), 0, TVRCSiriRemoteObserverContext);
  }
}

- (void)enableFindingSession:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "no";
    if (v3)
      v6 = "yes";
    v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Enable Finding Session enabled: %s", (uint8_t *)&v8, 0xCu);
  }

  -[TVRCRPCompanionLinkClientWrapper _setupRemoteFindingManagerIfNeeded](self, "_setupRemoteFindingManagerIfNeeded");
  -[TVRCRPCompanionLinkClientWrapper remoteFindingManager](self, "remoteFindingManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enableFindingSession:", v3);

}

- (void)_invalidateRemoteFindingManager
{
  NSObject *v3;
  TVRCSiriRemoteFindingManager *remoteFindingManager;
  uint8_t v5[16];

  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating RemoteFindingManager", v5, 2u);
  }

  -[TVRCSiriRemoteFindingManager removeObserver:forKeyPath:context:](self->_remoteFindingManager, "removeObserver:forKeyPath:context:", self, CFSTR("pairedRemoteInfo"), TVRCSiriRemoteObserverContext);
  remoteFindingManager = self->_remoteFindingManager;
  self->_remoteFindingManager = 0;

}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return -[TVRCSiriRemoteFindingManager pairedRemoteInfo](self->_remoteFindingManager, "pairedRemoteInfo");
}

- (void)_updateSiriRemoteFindingState:(int64_t)a3
{
  id v3;

  if (self->_siriRemoteFindingSessionState != a3)
  {
    self->_siriRemoteFindingSessionState = a3;
    -[TVRCRPCompanionLinkClientWrapper delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceUpdateSiriRemoteFindingState");

  }
}

- (void)_startMonitoringNowPlayingInfo
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BE7CCB0];
  v9[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[TVRCRPCompanionLinkClientWrapper companionClient](self, "companionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__TVRCRPCompanionLinkClientWrapper__startMonitoringNowPlayingInfo__block_invoke;
  v5[3] = &unk_24DCD7D18;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "registerEventID:options:handler:", CFSTR("NowPlayingInfo"), v3, v5);

  -[TVRCRPCompanionLinkClientWrapper sendEvent:options:response:](self, "sendEvent:options:response:", CFSTR("FetchCurrentNowPlayingInfoEvent"), MEMORY[0x24BDBD1B8], &__block_literal_global_93);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __66__TVRCRPCompanionLinkClientWrapper__startMonitoringNowPlayingInfo__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateNowPlayingInfo:", v5);

}

- (void)_stopMonitoringNowPlayingInfo
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _TVRCRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Stopped monitoring NowPlayingInfo", v5, 2u);
  }

  -[TVRCRPCompanionLinkClientWrapper companionClient](self, "companionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterEventID:", CFSTR("NowPlayingInfo"));

}

- (void)_updateNowPlayingInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NowPlayingInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    _TVRCRapportLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[TVRCRPCompanionLinkClientWrapper _updateNowPlayingInfo:].cold.1();
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v11 = v5;
        _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Updated now playing info: %{public}@", buf, 0xCu);
      }

      -[TVRCRPCompanionLinkClientWrapper setNowPlayingInfo:](self, "setNowPlayingInfo:", v5);
      -[TVRCRPCompanionLinkClientWrapper delegate](self, "delegate");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject deviceUpdatedNowPlayingInfo:](v8, "deviceUpdatedNowPlayingInfo:", self);
    }

  }
}

- (void)_startMonitoringSupportedActions
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BE7CCB0];
  v9[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[TVRCRPCompanionLinkClientWrapper companionClient](self, "companionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__TVRCRPCompanionLinkClientWrapper__startMonitoringSupportedActions__block_invoke;
  v5[3] = &unk_24DCD7D18;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "registerEventID:options:handler:", CFSTR("SupportedActions"), v3, v5);

  -[TVRCRPCompanionLinkClientWrapper sendEvent:options:response:](self, "sendEvent:options:response:", CFSTR("FetchSupportedActionsEvent"), MEMORY[0x24BDBD1B8], 0);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __68__TVRCRPCompanionLinkClientWrapper__startMonitoringSupportedActions__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GuideSupportedKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setGuideButtonSupported:", objc_msgSend(v4, "BOOLValue"));
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceUpdatedSupportedButtons:", WeakRetained);

  }
}

- (void)_stopMonitoringSupportedActions
{
  id v2;

  -[TVRCRPCompanionLinkClientWrapper companionClient](self, "companionClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterEventID:", CFSTR("SupportedActions"));

}

- (int)_commandForButtonEvent:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonType");

  if ((unint64_t)(v4 - 1) > 0x1D)
    return 0;
  else
    return dword_21A5D5090[v4 - 1];
}

- (int)_stateForButtonEvent:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "eventType");
  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 == 2);
}

- (void)_handleSideEffectsForEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TVRCRPCompanionLinkClientWrapper *v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke;
  v6[3] = &unk_24DCD8B00;
  objc_copyWeak(&v9, &location);
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke(id *a1)
{
  id *v2;
  unsigned __int8 *WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 6;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "buttonType");

    if (v5 == 4)
    {
      v6 = objc_msgSend(a1[4], "eventType");
      if (objc_msgSend(a1[5], "attentionState") == 1 && (v6 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      {
        _TVRCRapportLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = objc_msgSend(a1[5], "attentionState");
          if ((unint64_t)(v8 - 1) >= 3)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %ld)"), v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_24DCD8B98[v8 - 1];
          }
          *(_DWORD *)buf = 138543362;
          v38 = v9;
          _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "TV is in %{public}@ state. Ignoring Siri invocation", buf, 0xCu);

        }
      }
      else
      {
        if (!objc_msgSend(a1[5], "attentionState"))
        {
          _TVRCRapportLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "TV is in an unkown state. Allowing Siri invocation", buf, 2u);
          }

        }
        switch(v6)
        {
          case 3:
            if (!*((_QWORD *)WeakRetained + 10))
            {
              v23 = objc_alloc_init(MEMORY[0x24BE7CC60]);
              v24 = (void *)*((_QWORD *)WeakRetained + 10);
              *((_QWORD *)WeakRetained + 10) = v23;

              objc_msgSend(*((id *)WeakRetained + 10), "setIsDestinationPTTEligible:", WeakRetained[15]);
              if (WeakRetained[15])
                objc_msgSend(*((id *)WeakRetained + 10), "setDelegate:", a1[5]);
            }
            _TVRCRapportLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A51B000, v25, OS_LOG_TYPE_DEFAULT, "Prewarming Siri Session", buf, 2u);
            }

            v26 = (void *)*((_QWORD *)WeakRetained + 10);
            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_101;
            v32[3] = &unk_24DCD81E8;
            objc_copyWeak(&v33, v2);
            objc_msgSend(v26, "prewarmWithCompletion:", v32);
            objc_destroyWeak(&v33);
            break;
          case 2:
            objc_msgSend(*((id *)WeakRetained + 10), "setIsDestinationPTTEligible:", WeakRetained[15]);
            if (WeakRetained[15])
            {
              v27 = (void *)*((_QWORD *)WeakRetained + 10);
              v30[0] = MEMORY[0x24BDAC760];
              v30[1] = 3221225472;
              v30[2] = __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_102;
              v30[3] = &unk_24DCD81E8;
              objc_copyWeak(&v31, v2);
              objc_msgSend(v27, "receivedButtonUpWithCompletion:", v30);
              objc_destroyWeak(&v31);
            }
            else
            {
              _TVRCRapportLog();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_cold_2();

              objc_msgSend(*((id *)WeakRetained + 10), "invalidate");
              v29 = (void *)*((_QWORD *)WeakRetained + 10);
              *((_QWORD *)WeakRetained + 10) = 0;

            }
            break;
          case 1:
            if (!*((_QWORD *)WeakRetained + 10))
            {
              v11 = objc_alloc_init(MEMORY[0x24BE7CC60]);
              v12 = (void *)*((_QWORD *)WeakRetained + 10);
              *((_QWORD *)WeakRetained + 10) = v11;

              objc_msgSend(*((id *)WeakRetained + 10), "setIsDestinationPTTEligible:", WeakRetained[15]);
              if (WeakRetained[15])
                objc_msgSend(*((id *)WeakRetained + 10), "setDelegate:", a1[5]);
            }
            if (WeakRetained[15])
            {
              objc_msgSend(*((id *)WeakRetained + 9), "localDevice");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "effectiveIdentifier");
              v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

              _TVRCRapportLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v14;
                _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "Setting source Id - %@", buf, 0xCu);
              }

              objc_msgSend(*((id *)WeakRetained + 10), "setSourceID:", v14);
            }
            objc_msgSend(*((id *)WeakRetained + 10), "setMessenger:", *((_QWORD *)WeakRetained + 9));
            v16 = (void *)*((_QWORD *)WeakRetained + 10);
            objc_msgSend(WeakRetained, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setDestinationID:", v17);

            _TVRCRapportLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A51B000, v18, OS_LOG_TYPE_DEFAULT, "Activating Siri Session", buf, 2u);
            }

            objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 0;
            objc_msgSend(v19, "setHostProcessAttribution:error:", &unk_24DCF93B0, &v36);
            v20 = v36;

            if (v20)
            {
              _TVRCRapportLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_cold_1();

            }
            v22 = (void *)*((_QWORD *)WeakRetained + 10);
            v34[0] = MEMORY[0x24BDAC760];
            v34[1] = 3221225472;
            v34[2] = __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_100;
            v34[3] = &unk_24DCD81E8;
            objc_copyWeak(&v35, v2);
            objc_msgSend(v22, "activateWithCompletion:", v34);
            objc_destroyWeak(&v35);

            break;
        }
      }
    }
  }

}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      _TVRCRapportLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_100_cold_1();

    }
  }

}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  if (!v3)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Prewarmed Rapport Siri Session", v7, 2u);
    }
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    _TVRCRapportLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_101_cold_1();

LABEL_8:
  }

}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_102(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      _TVRCRapportLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_100_cold_1();

    }
  }

}

- (void)_updateConnectedState
{
  NSObject *v3;
  RPCompanionLinkClient *companionClient;
  id WeakRetained;
  id v6;
  int v7;
  RPCompanionLinkClient *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!self->_isInvalidating)
  {
    if (!self->_startedSetup && self->_activated && self->_authenticated)
    {
      self->_startedSetup = 1;
      self->_isInvalidating = 0;
      -[TVRCRPCompanionLinkClientWrapper _sendSessionStart](self, "_sendSessionStart");
      -[TVRCRPCompanionLinkClientWrapper _setupHidSessionIfNeeded](self, "_setupHidSessionIfNeeded");
      -[TVRCRPCompanionLinkClientWrapper _setupFeatureServicesIfNeeded](self, "_setupFeatureServicesIfNeeded");
      -[TVRCRPCompanionLinkClientWrapper _setupTouchSessionIfNeeded](self, "_setupTouchSessionIfNeeded");
      -[TVRCRPCompanionLinkClientWrapper _setupTextInputSessionIfNeeded](self, "_setupTextInputSessionIfNeeded");
      -[TVRCRPCompanionLinkClientWrapper _fetchTVSystemStatusAndStartMonitoring](self, "_fetchTVSystemStatusAndStartMonitoring");
      -[TVRCRPCompanionLinkClientWrapper _setupRemoteFindingManagerIfNeeded](self, "_setupRemoteFindingManagerIfNeeded");
      -[TVRCRPCompanionLinkClientWrapper _startMonitoringSupportedActions](self, "_startMonitoringSupportedActions");
      -[TVRCRPCompanionLinkClientWrapper _startMonitoringNowPlayingInfo](self, "_startMonitoringNowPlayingInfo");
    }
    if (!self->_connected
      && self->_hidSessionActivated
      && self->_hidTouchSessionActivated
      && self->_textInputSessionActivated)
    {
      _TVRCRapportLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        companionClient = self->_companionClient;
        v7 = 138543362;
        v8 = companionClient;
        _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Successfully set up companionLinkClient %{public}@. Letting clients know we connected successfully", (uint8_t *)&v7, 0xCu);
      }

      self->_connected = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "connectedToDevice:", self);

      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "deviceUpdatedSupportedButtons:", self);

    }
  }
}

- (void)_launchApplicationOrURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  RPCompanionLinkClient *companionClient;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  RPCompanionLinkClient *v12;
  uint64_t v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "containsString:", CFSTR("://")))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
      _TVRCRapportLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to launch application with URL %@", buf, 0xCu);
      }

      companionClient = self->_companionClient;
      v9 = *MEMORY[0x24BE7CC80];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke;
      v16[3] = &unk_24DCD8260;
      v17 = v6;
      v10 = v6;
      -[RPCompanionLinkClient launchAppWithURL:destinationID:completion:](companionClient, "launchAppWithURL:destinationID:completion:", v10, v9, v16);

    }
    else
    {
      _TVRCRapportLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v5;
        _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to launch application with bundle ID %@", buf, 0xCu);
      }

      v12 = self->_companionClient;
      v13 = *MEMORY[0x24BE7CC80];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_106;
      v14[3] = &unk_24DCD8260;
      v15 = v5;
      -[RPCompanionLinkClient launchAppWithBundleID:destinationID:completion:](v12, "launchAppWithBundleID:destinationID:completion:", v15, v13, v14);
      v10 = v15;
    }
  }
  else
  {
    _TVRCRapportLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = 0;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Failed to launch App/URL %@", buf, 0xCu);
    }
  }

}

void __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TVRCRapportLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_cold_1();

  }
}

void __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_106(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TVRCRapportLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_106_cold_1();

  }
}

- (id)newCompanionLinkClient
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
  objc_msgSend(v3, "setControlFlags:", objc_msgSend(v3, "controlFlags"));
  objc_msgSend(v3, "setDispatchQueue:", MEMORY[0x24BDAC9B8]);
  objc_msgSend(v3, "setDestinationDevice:", self->_device);
  objc_msgSend(v3, "setRssiThreshold:", -75);
  objc_msgSend(v3, "tvrc_setAllowedTVs");
  objc_msgSend(v3, "setServiceType:", CFSTR("com.apple.tvremoteservices"));
  return v3;
}

- (void)_fetchSiriEnabledWithSiriInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _TVRCRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[TVRCRPCompanionLinkClientWrapper _fetchSiriEnabledWithSiriInfo:completionHandler:]";
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = objc_alloc_init(MEMORY[0x24BE092B8]);
  v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke;
  v11[3] = &unk_24DCD8B50;
  v11[4] = self;
  v10 = v7;
  v12 = v10;
  p_buf = &buf;
  objc_msgSend(v9, "getAssistantIsEnabledForDeviceWithSiriInfo:withCompletion:", v6, v11);

  _Block_object_dispose(&buf, 8);
}

void __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke_2;
  block[3] = &unk_24DCD8B28;
  v16 = a2;
  v6 = a1[4];
  v7 = (void *)a1[5];
  v12 = v5;
  v13 = v6;
  v8 = v7;
  v9 = a1[6];
  v14 = v8;
  v15 = v9;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  _BYTE v18[14];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  _TVRCRapportLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v17 = 67109378;
    *(_DWORD *)v18 = v3;
    *(_WORD *)&v18[4] = 2114;
    *(_QWORD *)&v18[6] = v4;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "getAssistantIsEnabledForDeviceWithSiriInfo, enabled=%{BOOL}d, error=%{public}@", (uint8_t *)&v17, 0x12u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setSiriEnabled:", 1);
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke_2_cold_1(a1 + 32, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setSiriEnabled:", *(unsigned __int8 *)(a1 + 64));
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(unsigned __int8 *)(a1 + 64);
      v17 = 138543618;
      *(_QWORD *)v18 = v12;
      *(_WORD *)&v18[8] = 1024;
      *(_DWORD *)&v18[10] = v13;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Siri Enabled on device %{public}@ : %d", (uint8_t *)&v17, 0x12u);

    }
  }

  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
  {
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, objc_msgSend(*(id *)(a1 + 40), "isSiriEnabled"));
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

  }
}

- (void)_updateSiriStatusFromSiriInfo:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[TVRCRPCompanionLinkClientWrapper _updateSiriStatusFromSiriInfo:]";
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__TVRCRPCompanionLinkClientWrapper__updateSiriStatusFromSiriInfo___block_invoke;
  v6[3] = &unk_24DCD8B78;
  objc_copyWeak(&v7, (id *)buf);
  -[TVRCRPCompanionLinkClientWrapper _fetchSiriEnabledWithSiriInfo:completionHandler:](self, "_fetchSiriEnabledWithSiriInfo:completionHandler:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);

}

void __66__TVRCRPCompanionLinkClientWrapper__updateSiriStatusFromSiriInfo___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRapportLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("disabled");
      if (a2)
        v5 = CFSTR("enabled");
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Siri is %{public}@. Calling delegate to update supported buttons", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceUpdatedSupportedButtons:", WeakRetained);

  }
}

- (void)rpSiriSessionDidReceiveStopRecording
{
  _QWORD v2[4];
  id v3;
  id location;

  if (self->_pttFeatureSupported)
  {
    objc_initWeak(&location, self);
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __72__TVRCRPCompanionLinkClientWrapper_rpSiriSessionDidReceiveStopRecording__block_invoke;
    v2[3] = &unk_24DCD71B8;
    objc_copyWeak(&v3, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

void __72__TVRCRPCompanionLinkClientWrapper_rpSiriSessionDidReceiveStopRecording__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[10])
  {
    _TVRCRapportLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Received Stop recording - Invalidating RPSiriSession", v5, 2u);
    }

    objc_msgSend(v2[10], "invalidate");
    v4 = v2[10];
    v2[10] = 0;

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if ((void *)TVRCSiriRemoteObserverContext == a6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__TVRCRPCompanionLinkClientWrapper_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24DCD70C8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TVRCRPCompanionLinkClientWrapper;
    -[TVRCRPCompanionLinkClientWrapper observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __83__TVRCRPCompanionLinkClientWrapper_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceUpdatedPairedRemoteInfo:", *(_QWORD *)(a1 + 32));

}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (int64_t)attentionState
{
  return self->_attentionState;
}

- (void)setAttentionState:(int64_t)a3
{
  self->_attentionState = a3;
}

- (int64_t)siriRemoteFindingSessionState
{
  return self->_siriRemoteFindingSessionState;
}

- (void)setSiriRemoteFindingSessionState:(int64_t)a3
{
  self->_siriRemoteFindingSessionState = a3;
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
}

- (_TVRCCompanionLinkClientWrapperDelegate)delegate
{
  return (_TVRCCompanionLinkClientWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRCRapportMediaEventsManager)mediaManager
{
  return self->_mediaManager;
}

- (void)setMediaManager:(id)a3
{
  objc_storeStrong((id *)&self->_mediaManager, a3);
}

- (RPCompanionLinkClient)companionClient
{
  return self->_companionClient;
}

- (void)setCompanionClient:(id)a3
{
  objc_storeStrong((id *)&self->_companionClient, a3);
}

- (RPSiriSession)siriSession
{
  return self->_siriSession;
}

- (void)setSiriSession:(id)a3
{
  objc_storeStrong((id *)&self->_siriSession, a3);
}

- (RPHIDSession)hidSession
{
  return self->_hidSession;
}

- (void)setHidSession:(id)a3
{
  objc_storeStrong((id *)&self->_hidSession, a3);
}

- (RPHIDTouchSession)hidTouchSession
{
  return self->_hidTouchSession;
}

- (void)setHidTouchSession:(id)a3
{
  objc_storeStrong((id *)&self->_hidTouchSession, a3);
}

- (RPTextInputSession)textInputSession
{
  return self->_textInputSession;
}

- (void)setTextInputSession:(id)a3
{
  objc_storeStrong((id *)&self->_textInputSession, a3);
}

- (id)rtiSessionHandler
{
  return self->_rtiSessionHandler;
}

- (void)setRtiSessionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(unint64_t)a3
{
  self->_featureFlags = a3;
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)startedSetup
{
  return self->_startedSetup;
}

- (void)setStartedSetup:(BOOL)a3
{
  self->_startedSetup = a3;
}

- (BOOL)hidSessionActivated
{
  return self->_hidSessionActivated;
}

- (void)setHidSessionActivated:(BOOL)a3
{
  self->_hidSessionActivated = a3;
}

- (BOOL)hidTouchSessionActivated
{
  return self->_hidTouchSessionActivated;
}

- (void)setHidTouchSessionActivated:(BOOL)a3
{
  self->_hidTouchSessionActivated = a3;
}

- (BOOL)textInputSessionActivated
{
  return self->_textInputSessionActivated;
}

- (void)setTextInputSessionActivated:(BOOL)a3
{
  self->_textInputSessionActivated = a3;
}

- (BOOL)pttFeatureSupported
{
  return self->_pttFeatureSupported;
}

- (void)setPttFeatureSupported:(BOOL)a3
{
  self->_pttFeatureSupported = a3;
}

- (BOOL)isInvalidating
{
  return self->_isInvalidating;
}

- (void)setIsInvalidating:(BOOL)a3
{
  self->_isInvalidating = a3;
}

- (id)invalidationCompletionBlock
{
  return self->_invalidationCompletionBlock;
}

- (void)setInvalidationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isSiriEnabled
{
  return self->_siriEnabled;
}

- (void)setSiriEnabled:(BOOL)a3
{
  self->_siriEnabled = a3;
}

- (TVRCSiriRemoteFindingManager)remoteFindingManager
{
  return self->_remoteFindingManager;
}

- (void)setRemoteFindingManager:(id)a3
{
  objc_storeStrong((id *)&self->_remoteFindingManager, a3);
}

- (BOOL)isGuideButtonSupported
{
  return self->_guideButtonSupported;
}

- (void)setGuideButtonSupported:(BOOL)a3
{
  self->_guideButtonSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteFindingManager, 0);
  objc_storeStrong(&self->_invalidationCompletionBlock, 0);
  objc_storeStrong(&self->_rtiSessionHandler, 0);
  objc_storeStrong((id *)&self->_textInputSession, 0);
  objc_storeStrong((id *)&self->_hidTouchSession, 0);
  objc_storeStrong((id *)&self->_hidSession, 0);
  objc_storeStrong((id *)&self->_siriSession, 0);
  objc_storeStrong((id *)&self->_companionClient, 0);
  objc_storeStrong((id *)&self->_mediaManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __79__TVRCRPCompanionLinkClientWrapper_reestablishConnectionWithCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21A51B000, a2, OS_LOG_TYPE_ERROR, "Failed to reestablish connection with client: %{public}@", v4, 0xCu);

}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_21A51B000, v0, v1, "User cancelled PIN pairing, disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "companionLinkClient authCompletionHandler, diconnecting with error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_11_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Could not create companionLinkClient for device %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)sendButtonEvent:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_21A51B000, v1, OS_LOG_TYPE_DEBUG, "Attempting to send button event %@ to Rapport device - %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)sendButtonEvent:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_21A51B000, v0, OS_LOG_TYPE_DEBUG, "Push To Talk Menu/Back detected. Invalidating Siri Session.", v1, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)sendButtonEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_21A51B000, v0, v1, "No active companion link client found. Ignoring sendButton event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __52__TVRCRPCompanionLinkClientWrapper_sendButtonEvent___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error sending HID event to Rapport companionLinkClient %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)sendTouchEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_21A51B000, v0, v1, "No active companion link client found. Ignoring sendTouch event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __51__TVRCRPCompanionLinkClientWrapper_sendTouchEvent___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error sending Touch event to Rapport companionLinkClient %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke_19_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Failed to reestablish connection for %{public}@: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)registerEvent:options:handler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_21A51B000, v0, OS_LOG_TYPE_FAULT, "Unable to register %{public}@. CompanionLinkClient is not active!", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_disconnectWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[TVRCRPCompanionLinkClientWrapper _disconnectWithError:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_21A51B000, a2, OS_LOG_TYPE_ERROR, "%s, error=%{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_77_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "RPSiriSession invalidation failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_78_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "HIDTouchSession invalidation failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__TVRCRPCompanionLinkClientWrapper__sendSessionStart__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Could not send SessionStart for companionLinkClient %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __52__TVRCRPCompanionLinkClientWrapper__sendSessionStop__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Could not send SessionStop for companionLinkClient %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __60__TVRCRPCompanionLinkClientWrapper__setupHidSessionIfNeeded__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Could not create hidSession for companionLinkClient %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __62__TVRCRPCompanionLinkClientWrapper__setupTouchSessionIfNeeded__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Could not create hidTouchSession for companionLinkClient %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __66__TVRCRPCompanionLinkClientWrapper__setupTextInputSessionIfNeeded__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Could not create textInputSession for companionLinkClient %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_updateNowPlayingInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, v0, v1, "AVAudioSession hostProcessAttribution error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_21A51B000, v0, v1, "Releasing RPSiriSession", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_100_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error activating Siri session for Rapport companionLinkClient %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_101_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error prewarming Siri session for Rapport companionLinkClient %{public}@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error launching URL %@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_106_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error launching application %@. Error - %{public}@");
  OUTLINED_FUNCTION_2();
}

void __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, a2, a3, "Received an error from settingsConnection - %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end

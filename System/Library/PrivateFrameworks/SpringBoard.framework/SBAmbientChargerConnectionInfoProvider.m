@implementation SBAmbientChargerConnectionInfoProvider

- (SBAmbientChargerConnectionInfoProvider)initWithDelegate:(id)a3
{
  id v4;
  SBAmbientChargerConnectionInfoProvider *v5;
  SBAmbientChargerConnectionInfoProvider *v6;
  uint64_t v7;
  SBAccessoryConnectionInfoProvider *accessoryConnectionInfoProvider;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBAmbientChargerConnectionInfoProvider;
  v5 = -[SBAmbientChargerConnectionInfoProvider init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    +[SBAccessoryConnectionInfoProvider sharedInstance](SBAccessoryConnectionInfoProvider, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    accessoryConnectionInfoProvider = v6->_accessoryConnectionInfoProvider;
    v6->_accessoryConnectionInfoProvider = (SBAccessoryConnectionInfoProvider *)v7;

    -[SBAccessoryConnectionInfoProvider addObserver:](v6->_accessoryConnectionInfoProvider, "addObserver:", v6);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SBAccessoryConnectionInfoProvider removeObserver:](self->_accessoryConnectionInfoProvider, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientChargerConnectionInfoProvider;
  -[SBAmbientChargerConnectionInfoProvider dealloc](&v3, sel_dealloc);
}

- (BOOL)isChargerConnected
{
  return self->_connectedChargerConnectionUUID != 0;
}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointAttached:(id)a4 transportType:(int)a5 protocol:(int)a6 properties:(id)a7 forConnection:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  SBAccessoryConnectionInfoProvider *accessoryConnectionInfoProvider;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = -[SBAccessoryConnectionInfoProvider accessoryConnectionType:](self->_accessoryConnectionInfoProvider, "accessoryConnectionType:", v16);
  if (a5 == 12 && v17 == 4)
  {
    if (self->_connectedChargerConnectionUUID && (objc_msgSend(v16, "isEqualToString:") & 1) == 0)
    {
      SBLogAmbientChargerConnection();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SBAmbientChargerConnectionInfoProvider accessoryConnectionInfoProvider:accessoryEndpointAttached:transportType:protocol:properties:forConnection:].cold.1((uint64_t)v16, (uint64_t *)&self->_connectedChargerConnectionUUID, v18);

    }
    if (!-[NSString isEqualToString:](self->_connectedChargerConnectionUUID, "isEqualToString:", v16))
    {
      SBLogAmbientChargerConnection();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v16;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Connected inductive charger with connection id %{public}@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_connectedChargerConnectionUUID, a8);
    }
    objc_initWeak((id *)buf, self);
    accessoryConnectionInfoProvider = self->_accessoryConnectionInfoProvider;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __148__SBAmbientChargerConnectionInfoProvider_accessoryConnectionInfoProvider_accessoryEndpointAttached_transportType_protocol_properties_forConnection___block_invoke;
    v21[3] = &unk_1E8EA8A40;
    objc_copyWeak(&v22, (id *)buf);
    -[SBAccessoryConnectionInfoProvider accessoryInfoForEndpoint:connection:withReply:](accessoryConnectionInfoProvider, "accessoryInfoForEndpoint:connection:withReply:", v14, v16, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

void __148__SBAmbientChargerConnectionInfoProvider_accessoryConnectionInfoProvider_accessoryEndpointAttached_transportType_protocol_properties_forConnection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D153A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      v10 = objc_opt_class();
      v11 = v7;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      if (v13)
      {
        objc_msgSend(WeakRetained, "currentConnectedChargerId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) == 0)
        {
          SBLogAmbientChargerConnection();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v18 = 138543362;
            v19 = v13;
            _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Connected inductive charger with accesory id %{public}@", (uint8_t *)&v18, 0xCu);
          }

          objc_msgSend(WeakRetained, "_setCurrentConnectedChargerId:", v13);
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    SBLogAmbientChargerConnection();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Connected inductive charger does not have an accessory id!", (uint8_t *)&v18, 2u);
    }

    v13 = 0;
    goto LABEL_17;
  }
LABEL_18:

}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointDetached:(id)a4 forConnection:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSString *connectedChargerConnectionUUID;
  NSString *currentConnectedChargerId;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(v6, "isEqualToString:", self->_connectedChargerConnectionUUID))
  {
    SBLogAmbientChargerConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Disconnected inductive charger with connection id %{public}@", (uint8_t *)&v12, 0xCu);
    }

    -[SBAmbientChargerConnectionInfoProvider delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAmbientChargerConnectionInfoProvider currentConnectedChargerId](self, "currentConnectedChargerId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chargerConnectionInfoProvider:didDisconnectChargerWithId:", self, v9);

    connectedChargerConnectionUUID = self->_connectedChargerConnectionUUID;
    self->_connectedChargerConnectionUUID = 0;

    currentConnectedChargerId = self->_currentConnectedChargerId;
    self->_currentConnectedChargerId = 0;

  }
}

- (void)_setCurrentConnectedChargerId:(id)a3
{
  id v5;
  NSString *currentConnectedChargerId;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  currentConnectedChargerId = self->_currentConnectedChargerId;
  if (!currentConnectedChargerId || !-[NSString isEqualToString:](currentConnectedChargerId, "isEqualToString:", v5))
  {
    SBLogAmbientChargerConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Setting current connected inductive charger id %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)&self->_currentConnectedChargerId, a3);
    -[SBAmbientChargerConnectionInfoProvider delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chargerConnectionInfoProvider:didConnectChargerWithId:", self, v5);

  }
}

- (SBAmbientChargerConnectionInfoProviderDelegate)delegate
{
  return (SBAmbientChargerConnectionInfoProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)currentConnectedChargerId
{
  return self->_currentConnectedChargerId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnectedChargerId, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectedChargerConnectionUUID, 0);
  objc_storeStrong((id *)&self->_accessoryConnectionInfoProvider, 0);
}

- (void)accessoryConnectionInfoProvider:(os_log_t)log accessoryEndpointAttached:transportType:protocol:properties:forConnection:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Connected inductive charger with connection id %{public}@ while charger with connection id %{public}@ is already connected!", (uint8_t *)&v4, 0x16u);
}

@end

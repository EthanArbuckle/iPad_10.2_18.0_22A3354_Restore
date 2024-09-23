@implementation SACaseConnectionInfoProvider

- (SACaseConnectionInfoProvider)init
{
  SACaseConnectionInfoProvider *v2;
  uint64_t v3;
  ACCConnectionInfo *connectionInfoProvider;
  objc_class *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SACaseConnectionInfoProvider;
  v2 = -[SACaseConnectionInfoProvider init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE1A0C0], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    connectionInfoProvider = v2->_connectionInfoProvider;
    v2->_connectionInfoProvider = (ACCConnectionInfo *)v3;

    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCConnectionInfo registerDelegate:withIdentifier:](v2->_connectionInfoProvider, "registerDelegate:withIdentifier:", v2, v6);

  }
  return v2;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCConnectionInfo registerDelegate:withIdentifier:](self->_connectionInfoProvider, "registerDelegate:withIdentifier:", 0, v4);

  v5.receiver = self;
  v5.super_class = (Class)SACaseConnectionInfoProvider;
  -[SACaseConnectionInfoProvider dealloc](&v5, sel_dealloc);
}

- (BOOL)caseConnected
{
  return self->_connectedCaseConnectionUUID != 0;
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  const char *v28;
  uint64_t *p_connectedCaseConnectionUUID;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43[6];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  v10 = a7;
  v11 = *MEMORY[0x24BE1A190];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE1A190]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedCharValue");

  }
  SALoggingGeneral();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = OUTLINED_FUNCTION_0_0(v16);
  if (v17)
  {
    OUTLINED_FUNCTION_3(v17, v18, v19, v20, v21, v22, v23, v24, v43[0]);
    OUTLINED_FUNCTION_1(&dword_245BE5000, v16, v25, "[SACaseConnectionInfoProvider] Connected case with NFC type %{public}d", (uint8_t *)v43);
  }

  if ((v15 - 144) > 5 || (OUTLINED_FUNCTION_4(), v26))
  {
    SALoggingGeneral();
    v27 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_0_0(v27))
    {
      __os_log_helper_16_0_0(v43);
      v28 = "[SACaseConnectionInfoProvider] Connected case with a mismatched NFC type";
      goto LABEL_12;
    }
  }
  else
  {
    SALoggingGeneral();
    v27 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_0_0(v27))
    {
      __os_log_helper_16_0_0(v43);
      v28 = "[SACaseConnectionInfoProvider] Connected case with a matching NFC type";
LABEL_12:
      _os_log_impl(&dword_245BE5000, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)v43, 2u);
    }
  }

  if ((v15 - 144) <= 5)
  {
    OUTLINED_FUNCTION_4();
    if (!v26)
    {
      p_connectedCaseConnectionUUID = (uint64_t *)&self->_connectedCaseConnectionUUID;
      if (self->_connectedCaseConnectionUUID && (objc_msgSend(v10, "isEqualToString:") & 1) == 0)
      {
        SALoggingGeneral();
        v30 = objc_claimAutoreleasedReturnValue();
        if (OUTLINED_FUNCTION_0_0(v30))
        {
          __os_log_helper_16_2_2_8_66_8_66((uint64_t)v43, (uint64_t)v10, *p_connectedCaseConnectionUUID);
          _os_log_impl(&dword_245BE5000, v30, OS_LOG_TYPE_DEFAULT, "[SACaseConnectionInfoProvider] Connected case with connection id %{public}@ while case with connection id %{public}@ is already connected!", (uint8_t *)v43, 0x16u);
        }

      }
      if ((objc_msgSend((id)*p_connectedCaseConnectionUUID, "isEqualToString:", v10) & 1) == 0)
      {
        SALoggingGeneral();
        v31 = objc_claimAutoreleasedReturnValue();
        if (OUTLINED_FUNCTION_0_0(v31))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v43, (uint64_t)v10);
          OUTLINED_FUNCTION_2(&dword_245BE5000, v31, v32, "[SACaseConnectionInfoProvider] Connected case with connection id %{public}@", (uint8_t *)v43);
        }

        objc_storeStrong((id *)&self->_connectedCaseConnectionUUID, a7);
      }
      if (self->_currentConnectedCaseId != (_DWORD)v15)
      {
        SALoggingGeneral();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = OUTLINED_FUNCTION_0_0(v33);
        if (v34)
        {
          OUTLINED_FUNCTION_3(v34, v35, v36, v37, v38, v39, v40, v41, v43[0]);
          OUTLINED_FUNCTION_1(&dword_245BE5000, v33, v42, "[SACaseConnectionInfoProvider] Connected case with NFC type %{public}d", (uint8_t *)v43);
        }

        -[SACaseConnectionInfoProvider setConnectedCaseId:](self, "setConnectedCaseId:", v15);
      }
    }
  }

}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSString *connectedCaseConnectionUUID;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", self->_connectedCaseConnectionUUID))
  {
    SALoggingGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_0_0(v6))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v9, (uint64_t)v5);
      OUTLINED_FUNCTION_2(&dword_245BE5000, v6, v7, "[SACaseConnectionInfoProvider] Disconnected case with connection id %{public}@", v9);
    }

    connectedCaseConnectionUUID = self->_connectedCaseConnectionUUID;
    self->_connectedCaseConnectionUUID = 0;

    -[SACaseConnectionInfoProvider setConnectedCaseId:](self, "setConnectedCaseId:", 0);
  }

}

- (void)setConnectedCaseId:(unsigned __int8)a3
{
  BOOL v3;
  int v4;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_currentConnectedCaseId)
    v3 = self->_currentConnectedCaseId == a3;
  else
    v3 = 0;
  if (!v3)
  {
    v4 = a3;
    SALoggingGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_0_0(v6))
    {
      __os_log_helper_16_0_1_4_2(v8, v4);
      OUTLINED_FUNCTION_1(&dword_245BE5000, v6, v7, "[SACaseConnectionInfoProvider] Setting current connected case id %{public}d", v8);
    }

    self->_currentConnectedCaseId = v4;
  }
}

- (unsigned)currentConnectedCaseId
{
  return self->_currentConnectedCaseId;
}

- (void)setCurrentConnectedCaseId:(unsigned __int8)a3
{
  self->_currentConnectedCaseId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedCaseConnectionUUID, 0);
  objc_storeStrong((id *)&self->_connectionInfoProvider, 0);
}

@end

@implementation WPAdvertising

- (WPAdvertising)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7;
  WPAdvertising *v8;
  WPAdvertising *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPAdvertising;
  v8 = -[WPClient initWithQueue:machName:](&v11, sel_initWithQueue_machName_, a4, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_delegate, a3);

  return v9;
}

- (id)clientAsString
{
  return CFSTR("WPAdvertising");
}

- (void)invalidate
{
  objc_super v3;

  -[WPAdvertising setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPAdvertising;
  -[WPClient invalidate](&v3, sel_invalidate);
}

+ (unsigned)puckStringToType:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("WPBeaconTypeCompany")))
    return 2;
  else
    return 27;
}

+ (id)puckTypeToString:(unsigned __int8)a3
{
  unsigned int v4;
  void *v7;

  if (a3 == 2)
    return CFSTR("WPBeaconTypeCompany");
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WPAdvertising.m"), 79, CFSTR("Unknown puck type %ld"), v4);

  return 0;
}

- (void)registerService:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_3);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPAdvertising registerService:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPBeaconType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[WPAdvertising puckStringToType:](WPAdvertising, "puckStringToType:", v12);

  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v13 == 2)
  {
    -[WPAdvertising parseCompanyData:](self, "parseCompanyData:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdvertisingData:", v15);

    if (+[WPClient isHomePodOrIOS](WPClient, "isHomePodOrIOS"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPBeaconAdvInterval"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPBeaconAdvInterval"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAdvertisingRate:", objc_msgSend(v17, "integerValue"));

      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)WPAdvertising;
  -[WPClient startAdvertising:](&v18, sel_startAdvertising_, v14);

}

- (void)deregisterService:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_111);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPAdvertising deregisterService:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPBeaconType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[WPAdvertising puckStringToType:](WPAdvertising, "puckStringToType:", v12);

  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)WPAdvertising;
  -[WPClient stopAdvertising:](&v15, sel_stopAdvertising_, v14);

}

- (void)stateDidChange:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WPAdvertising;
  -[WPClient stateDidChange:](&v7, sel_stateDidChange_, a3);
  -[WPAdvertising delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAdvertising delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "advertiserDidUpdateState:", self);

  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAdvertising delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAdvertising delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "advertiserDidRegisterService");

  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_120);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPAdvertising advertisingStoppedOfType:withError:].cold.1(v5);

}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  id v7;

  -[WPAdvertising delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPAdvertising delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "advertiserFailedToRegisterService");

  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAdvertising delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAdvertising delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "advertiserPendingServiceOfType:", 0);

  }
}

- (id)parseCompanyData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPBeaconTypeCompanyMajor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPBeaconTypeCompanyMinor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPBeaconTX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPBeaconTypeCompanyUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
  memset(v21, 0, 22);
  objc_msgSend(v8, "getUUIDBytes:", v21);
  if (v4)
  {
    LOBYTE(v21[2]) = (unsigned __int16)objc_msgSend(v4, "integerValue") >> 8;
    BYTE1(v21[2]) = objc_msgSend(v4, "integerValue");
    if (v5)
    {
      BYTE2(v21[2]) = (unsigned __int16)objc_msgSend(v5, "integerValue") >> 8;
      BYTE3(v21[2]) = objc_msgSend(v5, "integerValue");
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_126_0);
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPAdvertising parseCompanyData:].cold.1((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
  }
  BYTE4(v21[2]) = objc_msgSend(v6, "integerValue");
  if (+[WPClient isHomePodOrIOS](WPClient, "isHomePodOrIOS"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPBeaconTypeCompanyConfig"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      BYTE5(v21[2]) = objc_msgSend(v16, "integerValue");
      v18 = 22;
    }
    else
    {
      v18 = 21;
    }

  }
  else
  {
    v18 = 21;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (WPAdvertisingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)registerService:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209E41000, a2, a3, "Attempting to register WPAdvertising client with data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deregisterService:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209E41000, a2, a3, "Attempting to deregister WPAdvertiisng client with data %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)advertisingStoppedOfType:(os_log_t)log withError:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209E41000, log, OS_LOG_TYPE_DEBUG, "Advertising stopped in WPAdvertising class", v1, 2u);
}

- (void)parseCompanyData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209E41000, a2, a3, "No major value set for WPAdvertising request %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

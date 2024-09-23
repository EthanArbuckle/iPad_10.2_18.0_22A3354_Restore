@implementation WPAWDL

- (WPAWDL)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5
{
  id v8;
  WPAWDL *v9;
  WPAWDL *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  float v19;
  NSObject *v20;
  objc_super v22;

  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WPAWDL;
  v9 = -[WPClient initWithQueue:machName:](&v22, sel_initWithQueue_machName_, a4, a5);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_useSmallerAirDrop = 0;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistentDomainForName:", CFSTR("com.apple.MobileBluetooth.debug"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WIPROX"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("UseSmallerAirDrop"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v10->_useSmallerAirDrop = objc_msgSend(v14, "BOOLValue");
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_0);
      v16 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPAWDL initWithDelegate:queue:machName:].cold.2((unsigned __int8 *)&v10->_useSmallerAirDrop, v16);
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AirDropADVTimer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "floatValue");
      *(double *)&AdvertiseTimer = v19;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_79);
      v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPAWDL initWithDelegate:queue:machName:].cold.1(v20);
    }

  }
  return v10;
}

- (WPAWDL)initWithDelegate:(id)a3 queue:(id)a4
{
  return -[WPAWDL initWithDelegate:queue:machName:](self, "initWithDelegate:queue:machName:", a3, a4, 0);
}

- (WPAWDL)initWithDelegate:(id)a3
{
  return -[WPAWDL initWithDelegate:queue:](self, "initWithDelegate:queue:", a3, 0);
}

- (id)clientAsString
{
  return CFSTR("WPAWDL");
}

- (void)invalidate
{
  objc_super v3;

  -[WPAWDL setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPAWDL;
  -[WPClient invalidate](&v3, sel_invalidate);
}

+ (id)hashEmail:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WPAWDL.m"), 91, CFSTR("Invalid email"));

  }
  objc_msgSend(v5, "dataUsingEncoding:", 4, 0, 0, 0, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA256((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), (unsigned __int8 *)&v10);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)generateDataFromEmails:(id)a3
{
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  char *v14;
  void *v15;
  void *v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WPAWDL.m"), 104, CFSTR("emails not valid"));

  }
  v20 = 0;
  v19 = 0;
  v18 = 1;
  if ((unint64_t)objc_msgSend(v5, "count") > 2)
  {
    v6 = 3;
  }
  else
  {
    v6 = objc_msgSend(v5, "count");
    if (v6 < 1)
      goto LABEL_12;
  }
  v7 = 0;
  v8 = v6;
  v9 = 3;
  do
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) == 0)
      {
        +[WPAWDL hashEmail:](WPAWDL, "hashEmail:", v10);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = (char *)objc_msgSend(v13, "bytes");
        *(&v18 + v9 - 2) = *v14;
        *(&v18 + v9 - 1) = v14[1];
        *(&v18 + v9) = v14[2];

      }
    }

    ++v7;
    v9 += 3;
  }
  while (v8 != v7);
LABEL_12:
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v18, 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)startConnectionlessAWDLServiceAdvertisingWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  _BYTE *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  _QWORD v18[2];
  __int16 v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") < 0x17)
  {
    v18[0] = 0;
    v18[1] = 0;
    v19 = 0;
    v9 = 0;
    if (!-[WPAWDL useSmallerAirDrop](self, "useSmallerAirDrop"))
    {
      v18[0] = 0;
      v9 = 8;
    }
    v10 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
    if (!-[WPAWDL useSmallerAirDrop](self, "useSmallerAirDrop"))
    {
      *((_BYTE *)v18 + v9) = *v10;
      v9 |= 1u;
    }
    v11 = (char *)v18 + v9;
    *v11 = v10[1];
    v11[1] = v10[2];
    v11[2] = v10[3];
    v11[3] = v10[4];
    v11[4] = v10[5];
    v11[5] = v10[6];
    v11[6] = v10[7];
    v12 = v9 + 8;
    v11[7] = v10[8];
    if (!-[WPAWDL useSmallerAirDrop](self, "useSmallerAirDrop"))
    {
      *((_BYTE *)v18 + v12) = v10[9];
      LODWORD(v12) = v9 + 9;
    }
    +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAdvertisingRate:", 48);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v18, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAdvertisingData:", v13);

    objc_msgSend(v8, "setUpdateTime:", *(double *)&AdvertiseTimer);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_101);
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_209E41000, v14, OS_LOG_TYPE_DEFAULT, "AWDL start advertising with data: %{public}@", buf, 0xCu);
    }
    v15.receiver = self;
    v15.super_class = (Class)WPAWDL;
    -[WPClient startAdvertising:](&v15, sel_startAdvertising_, v8);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_94);
    v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPAWDL startConnectionlessAWDLServiceAdvertisingWithData:].cold.1(v5, v4);
    v6 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FC8];
    v21[0] = CFSTR("WirelessProximity can't start advertising at this time.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPAWDL advertisingFailedToStart:ofType:](self, "advertisingFailedToStart:ofType:", v8, 5);
  }

}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  id v5;
  void (**v6)(id, id);
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  objc_msgSend(v5, "setUpdateTime:", 0.0);
  objc_msgSend(v5, "setAdvertisingRate:", 290);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_104);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "AWDL update advertising with data: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v6[2](v6, v5);

}

- (void)stopConnectionlessAWDLServiceAdvertising
{
  void *v3;
  objc_super v4;

  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)WPAWDL;
  -[WPClient stopAdvertising:](&v4, sel_stopAdvertising_, v3);

}

- (void)startConnectionlessAWDLServiceScanning
{
  void *v3;
  objc_super v4;
  __int128 v5;
  uint64_t v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setClientType:", 5);
  v5 = xmmword_209E73C10;
  v6 = 30;
  objc_msgSend(v3, "setScanningRates:", &v5);
  objc_msgSend(v3, "setRssiThreshold:", &unk_24C290C98);
  v4.receiver = self;
  v4.super_class = (Class)WPAWDL;
  -[WPClient startScanning:](&v4, sel_startScanning_, v3);

}

- (void)stopConnectionlessAWDLServiceScanning
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setClientType:", 5);
  v4.receiver = self;
  v4.super_class = (Class)WPAWDL;
  -[WPClient stopScanning:](&v4, sel_stopScanning_, v3);

}

- (void)stateDidChange:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WPAWDL;
  -[WPClient stateDidChange:](&v7, sel_stateDidChange_, a3);
  -[WPAWDL delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAWDL delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "awdlDidUpdateState:", self);

  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAWDL delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAWDL delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "awdlStartedAdvertising:", self);

  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[WPAWDL delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPAWDL delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "awdlStoppedAdvertising:", self);

  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAWDL delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAWDL delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "awdlAdvertisingPending:", self);

  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPAWDL delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPAWDL delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "awdl:failedToStartAdvertisingWithError:", self, v8);

  }
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAWDL delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAWDL delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "awdlStartedScanning:", self);

  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAWDL delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAWDL delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "awdlStoppedScanning:", self);

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPAWDL delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPAWDL delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "awdl:failedToStartScanningWithError:", self, v8);

  }
}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6 >= 22)
  {
    objc_msgSend(v5, "subdataWithRange:", 12, 10);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
LABEL_5:
    -[WPAWDL delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[WPAWDL delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "awdl:foundDevice:", self, v5);

    }
    -[WPAWDL delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPAWDL delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "awdl:foundDevice:rssi:", self, v5, v15);

    }
    goto LABEL_13;
  }
  v8 = v6;
  if (v6 >= 8)
  {
    v19 = 1;
    v9 = objc_retainAutorelease(v5);
    v20 = *(_QWORD *)objc_msgSend(v9, "bytes");
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v19, 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_131_0);
  v17 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPAWDL deviceDiscovered:].cold.1(v8, v17, v18);
LABEL_13:

}

- (WPAWDLDelegate)delegate
{
  return (WPAWDLDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useSmallerAirDrop
{
  return self->_useSmallerAirDrop;
}

- (void)setUseSmallerAirDrop:(BOOL)a3
{
  self->_useSmallerAirDrop = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(os_log_t)log queue:machName:.cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = AdvertiseTimer;
  _os_log_debug_impl(&dword_209E41000, log, OS_LOG_TYPE_DEBUG, "Using custom AirDrop aggressive advertising timer of %f seconds", (uint8_t *)&v1, 0xCu);
}

- (void)initWithDelegate:(unsigned __int8 *)a1 queue:(NSObject *)a2 machName:.cold.2(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_209E41000, a2, OS_LOG_TYPE_DEBUG, "Using custom (smaller) AirDrop: %d", (uint8_t *)v3, 8u);
}

- (void)startConnectionlessAWDLServiceAdvertisingWithData:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v5 = 134217984;
  v6 = objc_msgSend(a2, "length");
  OUTLINED_FUNCTION_0_0(&dword_209E41000, v3, v4, "Adv payload length is too big: %lu", (uint8_t *)&v5);

}

- (void)deviceDiscovered:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_209E41000, a2, a3, "AWDL: Minimum advertisement data length expected: 8, received: %lu", (uint8_t *)&v3);
}

@end

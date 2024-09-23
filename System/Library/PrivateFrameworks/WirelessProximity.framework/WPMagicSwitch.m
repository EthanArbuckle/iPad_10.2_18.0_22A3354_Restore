@implementation WPMagicSwitch

- (WPMagicSwitch)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  WPMagicSwitch *v7;
  WPMagicSwitch *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPMagicSwitch;
  v7 = -[WPClient initWithQueue:machName:](&v10, sel_initWithQueue_machName_, a4, 0);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_delegate, v6);

  return v8;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)dutyCycleToScanningRates:(SEL)a3
{
  __int128 v4;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *v6;
  id v7;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 30;
  if (a4 == 2)
  {
    v4 = xmmword_209E73DB0;
    goto LABEL_5;
  }
  if (!a4)
  {
    v4 = xmmword_209E73DC0;
LABEL_5:
    *(_OWORD *)&retstr->var0 = v4;
    return self;
  }
  v6 = self;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a3, v6, CFSTR("WPMagicSwitch.m"), 51, CFSTR("Unknown duty cycle type"));

  return self;
}

- (id)clientAsString
{
  return CFSTR("WPMagicSwitch");
}

- (void)invalidate
{
  objc_super v3;

  -[WPMagicSwitch setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPMagicSwitch;
  -[WPClient invalidate](&v3, sel_invalidate);
}

- (void)startScanningWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  objc_super v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPMagicSwitchScanBlobData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPMagicSwitchScanMaskData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPMagicSwitchScanDutyCycle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPMagicSwitchScanPeers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "length") <= 0x16
    && (unint64_t)objc_msgSend(v6, "length") <= 0x16
    && (objc_msgSend(v7, "integerValue") & 0x8000000000000000) == 0
    && objc_msgSend(v7, "integerValue") < 3)
  {
    v12 = (void *)objc_opt_new();
    -[WPMagicSwitch dutyCycleToScanningRates:](self, "dutyCycleToScanningRates:", objc_msgSend(v7, "integerValue"));
    v26 = v28;
    v27 = v29;
    objc_msgSend(v12, "setScanningRates:", &v26);
    objc_msgSend(v12, "setClientType:", 11);
    objc_msgSend(v12, "setPeers:", v8);
    if (v5 || !v6)
    {
      if (!v5 || !v6 || (v20 = objc_msgSend(v6, "length"), v20 <= objc_msgSend(v5, "length")))
      {
        objc_msgSend(v12, "setBlobValue:", v5);
        objc_msgSend(v12, "setMaskValue:", v6);
        v25.receiver = self;
        v25.super_class = (Class)WPMagicSwitch;
        -[WPClient startScanning:](&v25, sel_startScanning_, v12);
        goto LABEL_8;
      }
      v15 = (void *)MEMORY[0x24BDD1540];
      v30 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid data provided, Mask data length: %lu > Blob data length: %lu"), objc_msgSend(v6, "length"), objc_msgSend(v5, "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v16;
      v17 = (void *)MEMORY[0x24BDBCE70];
      v18 = &v31;
      v19 = &v30;
    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid data provided, Blob Data: %@ is null but Mask data: %@ is not null"), 0, v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v16;
      v17 = (void *)MEMORY[0x24BDBCE70];
      v18 = &v33;
      v19 = &v32;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPMagicSwitch delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[WPMagicSwitch delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "magicSwitch:failedToStartScanningWithError:", self, v14);

    }
    goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x24BDD1540];
  v34 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid data provided, Blob data: %@, Mask data: %@, Duty Cycle: %@"), v5, v6, v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v35[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPMagicSwitch delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "magicSwitch:failedToStartScanningWithError:", self, v12);
LABEL_7:

  }
LABEL_8:

}

- (void)stopScanning
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setClientType:", 11);
  v4.receiver = self;
  v4.super_class = (Class)WPMagicSwitch;
  -[WPClient stopScanning:](&v4, sel_stopScanning_, v3);

}

- (void)startAdvertisingWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPMagicSwitchAdvertisingData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPMagicSwitchAdvertiseTypeInterval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      || (unint64_t)objc_msgSend(v5, "length") > 0x16
      || objc_msgSend(v6, "integerValue") < 0
      || objc_msgSend(v6, "integerValue") >= 3)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid data provided, adv data: %@, adv Interval: %@"), v5, v6);
      v8 = objc_claimAutoreleasedReturnValue();
      v23 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[WPMagicSwitch delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[WPMagicSwitch delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "magicSwitch:failedToStartAdvertisingWithError:", self, v10);

      }
      goto LABEL_8;
    }
    +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdvertisingData:", v5);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPMagicSwitchAdvertiseTypeInterval"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    objc_msgSend(v10, "setConnectable:", 1);
    objc_msgSend(v10, "setStopOnAdvertisingAddressChange:", 1);
    if (v18 == 2)
    {
      v19 = v10;
      v20 = 1636;
    }
    else if (v18 == 1)
    {
      v19 = v10;
      v20 = 48;
    }
    else
    {
      if (v18)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Invalid Advertising Rate"), CFSTR("An invalid advertising rate was provided to WPMagicSwitch"));
        goto LABEL_21;
      }
      v19 = v10;
      v20 = 290;
    }
    objc_msgSend(v19, "setAdvertisingRate:", v20);
LABEL_21:
    v21.receiver = self;
    v21.super_class = (Class)WPMagicSwitch;
    -[WPClient startAdvertising:](&v21, sel_startAdvertising_, v10);
LABEL_8:

LABEL_11:
    goto LABEL_12;
  }
  v13 = (void *)MEMORY[0x24BDD1540];
  v24 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid data provided, Dictionary: %@"), v4);
  v14 = objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 5, v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPMagicSwitch delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "magicSwitch:failedToStartAdvertisingWithError:", self, v5);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)stopAdvertising
{
  void *v3;
  objc_super v4;

  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)WPMagicSwitch;
  -[WPClient stopAdvertising:](&v4, sel_stopAdvertising_, v3);

}

- (void)stateDidChange:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WPMagicSwitch;
  -[WPClient stateDidChange:](&v7, sel_stateDidChange_, a3);
  -[WPMagicSwitch delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "magicSwitchDidUpdateState:", self);

  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPMagicSwitch delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "magicSwitchStartedAdvertising:", self);

  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_11);
  v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v5;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "MagicSwitch advertising stopped with error: %@", (uint8_t *)&v15, 0xCu);
  }
  if (v5)
  {
    if (objc_msgSend(v5, "code") == 28)
    {
      -[WPMagicSwitch delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_137_1);
        v9 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          objc_msgSend(v5, "localizedDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = v11;
          _os_log_impl(&dword_209E41000, v10, OS_LOG_TYPE_DEFAULT, "[Privacy] MagicSwitch advertising stopped with error: %@", (uint8_t *)&v15, 0xCu);

        }
        -[WPMagicSwitch delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "magicSwitchStoppedAdvertising:withError:", self, v5);
        goto LABEL_15;
      }
    }
  }
  else
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[WPMagicSwitch delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "magicSwitchStoppedAdvertising:", self);
LABEL_15:

    }
  }

}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPMagicSwitch delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "magicSwitch:failedToStartAdvertisingWithError:", self, v8);

  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPMagicSwitch delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "magicSwitchPendingAdvertising:", self);

  }
}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WPMagicSwitch delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subdataWithRange:", 4, objc_msgSend(v8, "length") - 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPMagicSwitch delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("WPMagicSwitchAdvertisingData");
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "magicSwitch:foundDevice:withData:", self, v7, v11);

  }
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPMagicSwitch delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "magicSwitchStartedScanning:", self);

  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPMagicSwitch delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "magicSwitchStoppedScanning:", self);

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPMagicSwitch delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPMagicSwitch delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "magicSwitch:failedToStartScanningWithError:", self, v8);

  }
}

- (WPMagicSwitchDelegate)delegate
{
  return (WPMagicSwitchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation WPAirPlaySolo

- (WPAirPlaySolo)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  WPAirPlaySolo *v7;
  WPAirPlaySolo *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPAirPlaySolo;
  v7 = -[WPClient initWithQueue:machName:](&v10, sel_initWithQueue_machName_, a4, 0);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_delegate, v6);

  return v8;
}

- (WPAirPlaySolo)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCA98];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is not a valid initializer for %@"), v5, v7);

  return 0;
}

- (id)clientAsString
{
  return CFSTR("AirplaySolo");
}

- (void)invalidate
{
  objc_super v3;

  -[WPAirPlaySolo setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPAirPlaySolo;
  -[WPClient invalidate](&v3, sel_invalidate);
}

+ (unsigned)puckStringToType:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WPPuckTypeAirPlaySoloSourcePresence")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WPPuckTypeAirPlaySoloTargetPresence")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 27;
  }

  return v4;
}

+ (id)puckTypeToString:(unsigned __int8)a3
{
  unsigned int v3;
  void *v7;

  if (a3 == 10)
    return CFSTR("WPPuckTypeAirPlaySoloSourcePresence");
  v3 = a3;
  if (a3 == 9)
    return CFSTR("WPPuckTypeAirPlaySoloTargetPresence");
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WPAirPlaySolo.m"), 102, CFSTR("Unknown puck type %ld"), v3);

  return 0;
}

- (void)startConnectionlessAdvertisingWithData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPPuckType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[WPAirPlaySolo puckStringToType:](WPAirPlaySolo, "puckStringToType:", v5);

  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPPuckTypeAirPlaySoloAdvertisingData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdvertisingData:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPAirPlaySoloAdvertisingMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPPuckType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("WPPuckTypeAirPlaySoloSourcePresence"))
    && v9
    && objc_msgSend(v9, "intValue") == 48)
  {
    objc_msgSend(v7, "setAdvertisingRate:", 48);
  }
  v11.receiver = self;
  v11.super_class = (Class)WPAirPlaySolo;
  -[WPClient startAdvertising:](&v11, sel_startAdvertising_, v7);

}

- (void)stopConnectionlessAdvertising
{
  void *v3;
  void *v4;
  objc_super v5;
  objc_super v6;

  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)WPAirPlaySolo;
  -[WPClient stopAdvertising:](&v6, sel_stopAdvertising_, v3);
  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)WPAirPlaySolo;
  -[WPClient stopAdvertising:](&v5, sel_stopAdvertising_, v4);

}

- (void)stopConnectionlessAdvertising:(id)a3
{
  void *v4;
  objc_super v5;

  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", +[WPAirPlaySolo puckStringToType:](WPAirPlaySolo, "puckStringToType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)WPAirPlaySolo;
  -[WPClient stopAdvertising:](&v5, sel_stopAdvertising_, v4);

}

- (void)startConnectionlessScanningWithData:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;
  _QWORD v10[3];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WPPuckType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[WPAirPlaySolo puckStringToType:](WPAirPlaySolo, "puckStringToType:", v4);

  v6 = (void *)objc_opt_new();
  v7 = v6;
  if ((_DWORD)v5 == 10)
    v8 = 966;
  else
    v8 = 0xFFFFLL;
  objc_msgSend(v6, "setAllowDuplicates:", 1);
  v10[0] = 300;
  v10[1] = v8;
  v10[2] = 30;
  objc_msgSend(v7, "setScanningRates:", v10);
  objc_msgSend(v7, "setClientType:", v5);
  v9.receiver = self;
  v9.super_class = (Class)WPAirPlaySolo;
  -[WPClient startScanning:](&v9, sel_startScanning_, v7);

}

- (void)stopConnectionlessScanningWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPPuckType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setClientType:", +[WPAirPlaySolo puckStringToType:](WPAirPlaySolo, "puckStringToType:", v6));
  v7.receiver = self;
  v7.super_class = (Class)WPAirPlaySolo;
  -[WPClient stopScanning:](&v7, sel_stopScanning_, v5);

}

- (void)startTrackingPeer:(id)a3 withData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WPPuckType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setClientType:", +[WPAirPlaySolo puckStringToType:](WPAirPlaySolo, "puckStringToType:", v9));
  objc_msgSend(v8, "setPeerUUID:", v7);

  v10.receiver = self;
  v10.super_class = (Class)WPAirPlaySolo;
  -[WPClient startTrackingPeerWithRequest:](&v10, sel_startTrackingPeerWithRequest_, v8);

}

- (void)stopTrackingPeer:(id)a3 withData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WPPuckType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setClientType:", +[WPAirPlaySolo puckStringToType:](WPAirPlaySolo, "puckStringToType:", v9));
  objc_msgSend(v8, "setPeerUUID:", v7);

  v10.receiver = self;
  v10.super_class = (Class)WPAirPlaySolo;
  -[WPClient stopTrackingPeerWithRequest:](&v10, sel_stopTrackingPeerWithRequest_, v8);

}

- (void)stateDidChange:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WPAirPlaySolo;
  -[WPClient stateDidChange:](&v7, sel_stateDidChange_, a3);
  -[WPAirPlaySolo delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airPlaySoloDidUpdateState:", self);

  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAirPlaySolo delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airPlaySoloStartedAdvertising:", self);

  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[WPAirPlaySolo delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "airPlaySoloStoppedAdvertising:", self);

  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPAirPlaySolo delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "airPlaySolo:failedToStartAdvertisingWithError:", self, v8);

  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAirPlaySolo delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airPlaySoloAdvertisingPending:", self);

  }
}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WPAirPlaySolo delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceChannel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subdataWithRange:", 4, objc_msgSend(v7, "length") - 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = CFSTR("WPPuckTypeAirPlaySoloRSSI");
    v21 = CFSTR("WPPuckTypeAirPlaySoloAdvertisingData");
    v18 = v9;
    v25[0] = v9;
    v25[1] = v13;
    v22 = CFSTR("WPPuckTypeAirPlaySoloAdvertisingChannel");
    v14 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null", v9, v20, v21, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25[2] = v14;
    v23 = CFSTR("WPAirPlaySoloKeyDeviceAddress");
    v15 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = CFSTR("WPAirPlaySoloKeyDeviceTime");
    v25[3] = v15;
    v25[4] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (v8)
      {
LABEL_8:
        -[WPAirPlaySolo delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "airPlaySolo:foundDevice:withData:", self, v10, v16);

        goto LABEL_9;
      }
    }
    else
    {

      if (v8)
        goto LABEL_8;
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAirPlaySolo delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airPlaySoloStartedScanning:", self);

  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPAirPlaySolo delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airPlaySoloStoppedScanning:", self);

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPAirPlaySolo delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "airPlaySolo:failedToStartScanningWithError:", self, v8);

  }
}

- (void)startedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WPAirPlaySolo delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    +[WPAirPlaySolo puckTypeToString:](WPAirPlaySolo, "puckTypeToString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("WPPuckType");
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPAirPlaySolo delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "airPlaySolo:didStartTrackingPeer:withData:error:", self, v6, v10, 0);

  }
}

- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WPAirPlaySolo delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    +[WPAirPlaySolo puckTypeToString:](WPAirPlaySolo, "puckTypeToString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("WPPuckType");
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPAirPlaySolo delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "airPlaySolo:didStopTrackingPeer:withData:", self, v6, v10);

  }
}

- (void)failedToStartTrackingPeer:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[WPAirPlaySolo delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "peerUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "peerTrackingDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "airPlaySolo:didStartTrackingPeer:withData:error:", self, v10, v11, v6);

  }
}

- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WPAirPlaySolo delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    +[WPAirPlaySolo puckTypeToString:](WPAirPlaySolo, "puckTypeToString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("WPPuckType");
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPAirPlaySolo delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "airPlaySolo:didFindPeer:withData:", self, v6, v10);

  }
}

- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WPAirPlaySolo delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    +[WPAirPlaySolo puckTypeToString:](WPAirPlaySolo, "puckTypeToString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("WPPuckType");
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPAirPlaySolo delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "airPlaySolo:didLosePeer:withData:", self, v6, v10);

  }
}

- (void)peerTrackingFull
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WPAirPlaySolo;
  -[WPClient peerTrackingFull](&v6, sel_peerTrackingFull);
  -[WPAirPlaySolo delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "airplaySolo:peerTrackingSlotsAvailable:", self, 0);

  }
}

- (void)peerTrackingAvailable
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WPAirPlaySolo;
  -[WPClient peerTrackingAvailable](&v6, sel_peerTrackingAvailable);
  -[WPAirPlaySolo delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WPAirPlaySolo delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "airplaySolo:peerTrackingSlotsAvailable:", self, 1);

  }
}

- (WPAirPlaySoloDelegate)delegate
{
  return (WPAirPlaySoloDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

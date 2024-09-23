@implementation WiProxScanner

- (WiProxScanner)initWithDelegate:(id)a3
{
  id v4;
  WiProxScanner *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  WPMagicSwitch *v10;
  WPMagicSwitch *wirelessProximityManager;
  objc_super v13;
  uint8_t buf[4];
  WiProxScanner *v15;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WiProxScanner;
  v5 = -[WiProxScanner init](&v13, "init");
  if (v5)
  {
    v6 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- Initializing (%p)", buf, 0xCu);
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_alloc((Class)WPMagicSwitch);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workQueue"));
    v10 = (WPMagicSwitch *)objc_msgSend(v7, "initWithDelegate:queue:", v5, v9);
    wirelessProximityManager = v5->_wirelessProximityManager;
    v5->_wirelessProximityManager = v10;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[WiProxScanner invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WiProxScanner;
  -[WiProxScanner dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSObject *v3;
  WPMagicSwitch *wirelessProximityManager;
  int v5;
  WiProxScanner *v6;

  if (!self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- Invalidating (%p)", (uint8_t *)&v5, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    if (self->_isScanning)
      -[WiProxScanner stopScanning](self, "stopScanning");
    -[WPMagicSwitch setDelegate:](self->_wirelessProximityManager, "setDelegate:", 0);
    -[WPMagicSwitch invalidate](self->_wirelessProximityManager, "invalidate");
    wirelessProximityManager = self->_wirelessProximityManager;
    self->_wirelessProximityManager = 0;

  }
}

- (void)startScanningWithHighDutyCycle:(BOOL)a3 filteredPeers:(id)a4 filteringBlob:(id)a5 filteringMask:(id)a6
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[4];

  v9 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_isScanning)
  {
    v14 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Already scanning", (uint8_t *)&v22, 2u);
    }
  }
  if (!objc_msgSend(v11, "count"))
  {
    v15 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No filtered peers", (uint8_t *)&v22, 2u);
    }
  }
  if ((unint64_t)objc_msgSend(v12, "length") >= 0x17)
  {
    v16 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Blob too large", (uint8_t *)&v22, 2u);
    }
  }
  if ((unint64_t)objc_msgSend(v13, "length") >= 0x17)
  {
    v17 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Mask too large", (uint8_t *)&v22, 2u);
    }
  }
  if (!self->_isScanning)
  {
    self->_isScanning = 1;
    self->_highDutyCycle = v9;
    objc_storeStrong((id *)&self->_filteredPeers, a4);
    objc_storeStrong((id *)&self->_filteringBlob, a5);
    objc_storeStrong((id *)&self->_filteringMask, a6);
    if (v9)
      v18 = 2;
    else
      v18 = 0;
    v24[0] = WPMagicSwitchScanBlobData;
    v24[1] = WPMagicSwitchScanMaskData;
    v25[0] = v12;
    v25[1] = v13;
    v24[2] = WPMagicSwitchScanDutyCycle;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
    v24[3] = WPMagicSwitchScanPeers;
    v25[2] = v19;
    v25[3] = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 4));

    v21 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- Telling WirelessProximity to start scanning with options: (%@)", (uint8_t *)&v22, 0xCu);
    }
    -[WPMagicSwitch startScanningWithData:](self->_wirelessProximityManager, "startScanningWithData:", v20);

  }
}

- (void)stopScanning
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (self->_isScanning)
    goto LABEL_5;
  v3 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", buf, 2u);
  }
  if (self->_isScanning)
  {
LABEL_5:
    self->_isScanning = 0;
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- Telling WirelessProximity to stop scanning", v5, 2u);
    }
    -[WPMagicSwitch stopScanning](self->_wirelessProximityManager, "stopScanning");
  }
}

- (BOOL)isPoweredOn
{
  return -[WPMagicSwitch state](self->_wirelessProximityManager, "state") == (id)3;
}

- (BOOL)highDutyCycle
{
  NSObject *v3;
  uint8_t v5[16];

  if (!self->_isScanning)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", v5, 2u);
    }
  }
  return self->_highDutyCycle;
}

- (NSArray)filteredPeers
{
  NSObject *v3;
  uint8_t v5[16];

  if (!self->_isScanning)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", v5, 2u);
    }
  }
  return self->_filteredPeers;
}

- (NSData)filteringBlob
{
  NSObject *v3;
  uint8_t v5[16];

  if (!self->_isScanning)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", v5, 2u);
    }
  }
  return self->_filteringBlob;
}

- (void)magicSwitchDidUpdateState:(id)a3
{
  WPMagicSwitch *wirelessProximityManager;
  WPMagicSwitch *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  int v12;
  void *v13;

  wirelessProximityManager = (WPMagicSwitch *)a3;
  v5 = wirelessProximityManager;
  if (self->_wirelessProximityManager != wirelessProximityManager)
  {
    v6 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", (uint8_t *)&v12, 2u);
    }
    wirelessProximityManager = self->_wirelessProximityManager;
  }
  v7 = (uint64_t)-[WPMagicSwitch state](wirelessProximityManager, "state");
  v8 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[WPClient stateAsString:](WPClient, "stateAsString:", v7));
    v12 = 138412290;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch did update state (%@)", (uint8_t *)&v12, 0xCu);

  }
  if (v7 <= 2)
  {
    if (v7 == 2)
    {
      if (self->_isScanning)
        -[WiProxScanner stopScanning](self, "stopScanning");
    }
    else
    {
      self->_isScanning = 0;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "wiProxScannerChangedState");

}

- (void)magicSwitchStartedScanning:(id)a3
{
  WPMagicSwitch *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = (WPMagicSwitch *)a3;
  if (self->_wirelessProximityManager != v4)
  {
    v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", buf, 2u);
    }
  }
  v6 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch started scanning", v7, 2u);
  }

}

- (void)magicSwitchStoppedScanning:(id)a3
{
  WPMagicSwitch *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = (WPMagicSwitch *)a3;
  if (self->_wirelessProximityManager != v4)
  {
    v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", buf, 2u);
    }
  }
  v6 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch stopped scanning", v7, 2u);
  }

}

- (void)magicSwitch:(id)a3 failedToStartScanningWithError:(id)a4
{
  WPMagicSwitch *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = (WPMagicSwitch *)a3;
  v7 = a4;
  if (self->_wirelessProximityManager != v6)
  {
    v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", (uint8_t *)&v10, 2u);
    }
  }
  v9 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch failed to start scanning with error: (%@)", (uint8_t *)&v10, 0xCu);
  }

}

- (void)magicSwitch:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  WPMagicSwitch *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;

  v8 = (WPMagicSwitch *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_wirelessProximityManager != v8)
  {
    v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unknown WPMagicSwitch", (uint8_t *)&v18, 2u);
    }
  }
  v12 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v18 = 138412546;
    v19 = v14;
    v20 = 2112;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch discovered peripheral (%@); data: (%@)",
      (uint8_t *)&v18,
      0x16u);

  }
  if (self->_isScanning)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", WPMagicSwitchAdvertisingData));
    if (v15)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "wiProxScannerFoundDevice:withData:", v9, v15);

    }
  }
  else
  {
    v17 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "WiProxScanner --- WPMagicSwitch early return because NOT scanning", (uint8_t *)&v18, 2u);
    }
  }

}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setHighDutyCycle:(BOOL)a3
{
  self->_highDutyCycle = a3;
}

- (void)setFilteredPeers:(id)a3
{
  objc_storeStrong((id *)&self->_filteredPeers, a3);
}

- (void)setFilteringBlob:(id)a3
{
  objc_storeStrong((id *)&self->_filteringBlob, a3);
}

- (NSData)filteringMask
{
  return self->_filteringMask;
}

- (void)setFilteringMask:(id)a3
{
  objc_storeStrong((id *)&self->_filteringMask, a3);
}

- (WiProxScannerDelegate)delegate
{
  return (WiProxScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (WPMagicSwitch)wirelessProximityManager
{
  return self->_wirelessProximityManager;
}

- (void)setWirelessProximityManager:(id)a3
{
  objc_storeStrong((id *)&self->_wirelessProximityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wirelessProximityManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_filteringMask, 0);
  objc_storeStrong((id *)&self->_filteringBlob, 0);
  objc_storeStrong((id *)&self->_filteredPeers, 0);
}

@end

@implementation TVLAudioLatencyEstimator

- (TVLAudioLatencyEstimator)initWithMessageSession:(id)a3
{
  id v4;
  TVLAudioLatencyEstimator *v5;
  TVLAudioLatencyEstimator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVLAudioLatencyEstimator;
  v5 = -[TVLAudioLatencyEstimator init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_version = 1.1;
    v5->_role = 1;
    -[TVLAudioLatencyEstimator _initWithMessageSession:](v5, "_initWithMessageSession:", v4);
  }

  return v6;
}

- (void)startNetworkMonitoring
{
  TVLNetworkMonitor *v3;
  TVLNetworkMonitor *networkMonitor;
  TVLNetworkMonitor *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = objc_alloc_init(TVLNetworkMonitor);
  networkMonitor = self->_networkMonitor;
  self->_networkMonitor = v3;

  objc_initWeak(&location, self);
  v5 = self->_networkMonitor;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__TVLAudioLatencyEstimator_startNetworkMonitoring__block_invoke;
  v6[3] = &unk_24E3E9890;
  objc_copyWeak(&v7, &location);
  -[TVLNetworkMonitor startMonitoringForInterfaceTypes:updateHandler:](v5, "startMonitoringForInterfaceTypes:updateHandler:", 2, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __50__TVLAudioLatencyEstimator_startNetworkMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "networkMonitorInterfacesDidUpdate:", v3);

}

- (void)networkMonitorInterfacesDidUpdate:(id)a3
{
  id v4;
  TVLNetworkInterface *v5;
  TVLNetworkInterface *awdlInterface;
  TVLNetworkInterface *v7;
  TVLNetworkInterface *wifiInterface;

  v4 = a3;
  -[TVLAudioLatencyEstimator networkInterfaceOfType:fromInterfaces:](self, "networkInterfaceOfType:fromInterfaces:", 3, v4);
  v5 = (TVLNetworkInterface *)objc_claimAutoreleasedReturnValue();
  awdlInterface = self->_awdlInterface;
  self->_awdlInterface = v5;

  -[TVLAudioLatencyEstimator networkInterfaceOfType:fromInterfaces:](self, "networkInterfaceOfType:fromInterfaces:", 2, v4);
  v7 = (TVLNetworkInterface *)objc_claimAutoreleasedReturnValue();

  wifiInterface = self->_wifiInterface;
  self->_wifiInterface = v7;

}

- (id)networkInterfaceOfType:(unint64_t)a3 fromInterfaces:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = a4;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__TVLAudioLatencyEstimator_networkInterfaceOfType_fromInterfaces___block_invoke;
  v8[3] = &unk_24E3E98B8;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __66__TVLAudioLatencyEstimator_networkInterfaceOfType_fromInterfaces___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "interfaceType") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v9, "ipv4");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

LABEL_5:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
      goto LABEL_6;
    }
    objc_msgSend(v9, "ipv6");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_5;
  }
LABEL_6:

}

- (void)_initWithMessageSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE297D0]), "initWithTemplate:", v4);
  -[TVLAudioLatencyEstimator setSession:](self, "setSession:", v5);

  objc_initWeak(&location, self);
  -[TVLAudioLatencyEstimator session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__TVLAudioLatencyEstimator__initWithMessageSession___block_invoke;
  v7[3] = &unk_24E3E94F0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "registerRequestID:options:handler:", CFSTR("com.apple.tvlatency"), 0, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __52__TVLAudioLatencyEstimator__initWithMessageSession___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, int, void *, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_3 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
    v9 = _TVLLogDefault_log_3;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_DEFAULT, "Incoming Message: %{public}@", buf, 0xCu);
    }
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __52__TVLAudioLatencyEstimator__initWithMessageSession___block_invoke_12;
    v17 = &unk_24E3E94C8;
    v10 = v6;
    v18 = v10;
    v19 = v7;
    v11 = (void *)MEMORY[0x2207C5BC0](&v14);
    objc_msgSend(v10, "objectForKey:", CFSTR("MESSAGE"), v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("SYNC_CLOCK")))
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("OPTIONS"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_synchronizeClocksWithOptions:withResponseHandler:", v13, v11);
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("ESTIMATE_AUDIO_LATENCY")))
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("OPTIONS"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_estimateAudioLatencyWithOptions:withResponseHandler:", v13, v11);
    }
    else
    {
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("BEGIN_LIPSYNC_TEST")) & 1) != 0)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVLatencyErrorDomain"), 1207, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_respondAndInvalidateWithError:responseHandler:", v13, v11);
    }

    goto LABEL_13;
  }
LABEL_14:

}

void __52__TVLAudioLatencyEstimator__initWithMessageSession___block_invoke_12(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (_TVLLogDefault_onceToken_3 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  v9 = (id)_TVLLogDefault_log_3;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_21F2AB000, v9, OS_LOG_TYPE_DEFAULT, "Responding To Message: %{public}@ | Response: %{public}@ | Error: %{public}@", (uint8_t *)&v12, 0x20u);
    if (a2)

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)activate
{
  id v2;

  -[TVLAudioLatencyEstimator session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

}

- (void)estimate
{
  -[TVLAudioLatencyEstimator estimateAudioLatencyWithToneIdentifier:](self, "estimateAudioLatencyWithToneIdentifier:", CFSTR("Calibration_tone_22_clean_190531.wav"));
}

- (void)estimateAudioLatencyWithToneIdentifier:(id)a3
{
  id v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVLAudioLatencyEstimator _postProgressEvent:withInfo:](self, "_postProgressEvent:withInfo:", 0, 0);
  v5 = objc_alloc(MEMORY[0x24BDBCED8]);
  v19[0] = v4;
  v18[0] = CFSTR("TONE");
  v18[1] = CFSTR("VERSION");
  *(float *)&v6 = self->_version;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithDictionary:", v8);

  if (DeviceProductType_onceToken != -1)
    dispatch_once(&DeviceProductType_onceToken, &__block_literal_global_174);
  v10 = (id)DeviceProductType_type;
  if (v10)
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("DEVICE_TYPE"));
  if (OSBuildVersion_onceToken != -1)
    dispatch_once(&OSBuildVersion_onceToken, &__block_literal_global_177);
  v11 = (id)OSBuildVersion_build;
  if (v11)
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("DEVICE_BUILD"));
  objc_initWeak(&location, self);
  v16[0] = CFSTR("MESSAGE");
  v16[1] = CFSTR("OPTIONS");
  v17[0] = CFSTR("START");
  v17[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__TVLAudioLatencyEstimator_estimateAudioLatencyWithToneIdentifier___block_invoke;
  v13[3] = &unk_24E3E98E0;
  objc_copyWeak(&v14, &location);
  -[TVLAudioLatencyEstimator _sendMessage:withResponse:](self, "_sendMessage:withResponse:", v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __67__TVLAudioLatencyEstimator_estimateAudioLatencyWithToneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  float v11;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("VERSION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("VERSION"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      objc_msgSend(v5, "setVersion:");

    }
    else
    {
      LODWORD(v7) = 1.0;
      objc_msgSend(v5, "setVersion:", v7);
    }
    if (_TVLLogDefault_onceToken_3 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
    v9 = (void *)_TVLLogDefault_log_3;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v5, "version");
      v12 = 134217984;
      v13 = v11;
      _os_log_impl(&dword_21F2AB000, v10, OS_LOG_TYPE_DEFAULT, "TVLatency will use protocol v%.1f", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(v5, "startNetworkMonitoring");
  }

}

- (void)invalidate
{
  -[TVLAudioLatencyEstimator _invalidateWithError:](self, "_invalidateWithError:", 0);
}

- (void)_invalidateWithError:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVLAudioLatencyEstimator _tearDown](self, "_tearDown");
  if (v4)
  {
    v6 = CFSTR("TVLAudioLatencyEstimationProgressEventErrorObjectKey");
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLAudioLatencyEstimator _postProgressEvent:withInfo:](self, "_postProgressEvent:withInfo:", 2, v5);

  }
  else
  {
    -[TVLAudioLatencyEstimator _postProgressEvent:withInfo:](self, "_postProgressEvent:withInfo:", 3, 0);
  }

}

- (void)_tearDown
{
  TVLNetworkMonitor *networkMonitor;

  +[TVLTimeSync invalidate](TVLTimeSync, "invalidate");
  -[TVLAudioLatencyEstimator setTimeSync:](self, "setTimeSync:", 0);
  +[TVLListenEngine invalidate](TVLListenEngine, "invalidate");
  -[TVLAudioLatencyEstimator setListenEngine:](self, "setListenEngine:", 0);
  -[TVLNetworkMonitor stopMonitoring](self->_networkMonitor, "stopMonitoring");
  networkMonitor = self->_networkMonitor;
  self->_networkMonitor = 0;

}

- (void)_sendMessage:(id)a3 withResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_TVLLogDefault_onceToken_3 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  v8 = _TVLLogDefault_log_3;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "Outgoing Message: %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[TVLAudioLatencyEstimator session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__TVLAudioLatencyEstimator__sendMessage_withResponse___block_invoke;
  v12[3] = &unk_24E3E9908;
  objc_copyWeak(&v15, (id *)buf);
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v9, "sendRequestID:options:request:responseHandler:", CFSTR("com.apple.tvlatency"), 0, v10, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __54__TVLAudioLatencyEstimator__sendMessage_withResponse___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_3 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
    v8 = (id)_TVLLogDefault_log_3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (a2)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      v27 = 2114;
      v28 = v6;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "Received Response To Message: %{public}@ | Response: %{public}@ | Error: %{public}@", buf, 0x20u);
      if (a2)

    }
    if (a2)
    {
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_invalidateWithError:", v12);
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", CFSTR("MESSAGE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToDictionary:", v14))
    {

    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("MESSAGE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("FAILURE"));

      if (v16)
      {
        v17 = *(_QWORD *)(a1 + 40);
        if (v17)
          (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, 0);
        objc_msgSend(v6, "objectForKey:", CFSTR("OPTIONS"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("ERROR_DOMAIN"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("ERROR_CODE"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "integerValue");

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v18, v20, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_invalidateWithError:", v21);

        goto LABEL_14;
      }
    }
    v22 = *(_QWORD *)(a1 + 40);
    if (v22)
      (*(void (**)(uint64_t, id))(v22 + 16))(v22, v6);
  }
LABEL_15:

}

- (void)_synchronizeClocksWithOptions:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  TVLNetworkInterface *wifiInterface;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v20 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[TVLNetworkInterface ipv6](self->_wifiInterface, "ipv6");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLNetworkInterface ipv4](self->_wifiInterface, "ipv4");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("IPV4"));
  if (v7)
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("IPV6"));
  objc_msgSend(v23, "objectForKey:", CFSTR("IPV6"), v20);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("IPV4"));
  v10 = objc_claimAutoreleasedReturnValue();
  -[TVLNetworkInterface interfaceName](self->_wifiInterface, "interfaceName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (_TVLLogDefault_onceToken_3 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  v11 = (void *)_TVLLogDefault_log_3;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_INFO))
  {
    wifiInterface = self->_wifiInterface;
    v13 = v11;
    -[TVLNetworkInterface interfaceName](wifiInterface, "interfaceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLNetworkInterface ipv4](self->_wifiInterface, "ipv4");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLNetworkInterface ipv6](self->_wifiInterface, "ipv6");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v14;
    v30 = 2114;
    v31 = v15;
    v32 = 2114;
    v33 = v16;
    _os_log_impl(&dword_21F2AB000, v13, OS_LOG_TYPE_INFO, "synchronizeClocksWithOptions WIFI %{public}@,%{public}@,%{public}@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __78__TVLAudioLatencyEstimator__synchronizeClocksWithOptions_withResponseHandler___block_invoke;
  v24[3] = &unk_24E3E9930;
  objc_copyWeak(&v25, (id *)buf);
  v17 = (void *)MEMORY[0x2207C5BC0](v24);
  if (v10 | v9
    && v22
    && (-[TVLAudioLatencyEstimator session](self, "session"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        +[TVLTimeSync timeSyncWithRemoteIPv4:IPv6:interface:session:master:completion:](TVLTimeSync, "timeSyncWithRemoteIPv4:IPv6:interface:session:master:completion:", v10, v9, v22, v18, 0, v17), v18, objc_msgSend(v6, "count")))
  {
    v26[0] = CFSTR("MESSAGE");
    v26[1] = CFSTR("OPTIONS");
    v27[0] = CFSTR("SYNC_CLOCK");
    v27[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v21)[2](v21, 0, 0, v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVLatencyErrorDomain"), 1202, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLAudioLatencyEstimator _respondAndInvalidateWithError:responseHandler:](self, "_respondAndInvalidateWithError:responseHandler:", v19, v21);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

void __78__TVLAudioLatencyEstimator__synchronizeClocksWithOptions_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "setTimeSync:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVLatencyErrorDomain"), 1203, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_invalidateWithError:", v5);

    }
  }

}

- (void)_estimateAudioLatencyWithOptions:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26[2];
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("TONE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(v6, "objectForKey:", CFSTR("TIME")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("TONE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    +[TVLToneProvider provideToneWithIdentifier:error:](TVLToneProvider, "provideToneWithIdentifier:error:", v10, &v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v28;

    if (v12)
    {
      if (_TVLLogDefault_onceToken_3 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
      v13 = _TVLLogDefault_log_3;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_ERROR))
        -[TVLAudioLatencyEstimator _estimateAudioLatencyWithOptions:withResponseHandler:].cold.1((uint64_t)v12, v13);
      -[TVLAudioLatencyEstimator _respondAndInvalidateWithError:responseHandler:](self, "_respondAndInvalidateWithError:responseHandler:", v12, v7);
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("TIME"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedLongLongValue");

      v27 = 0;
      -[TVLAudioLatencyEstimator timeSync](self, "timeSync");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "convertToHostTimeFromDomainTime:grandmasterIdentity:", v16, &v27);

      if (_TVLLogDefault_onceToken_3 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
      v19 = _TVLLogDefault_log_3;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v30 = v18;
        v31 = 2048;
        v32 = v16;
        v33 = 2048;
        v34 = v27;
        _os_log_impl(&dword_21F2AB000, v19, OS_LOG_TYPE_DEFAULT, "Estimate audio latency with startTime=%llu PTPtime=%llu GM=%llu", buf, 0x20u);
      }
      if (isInternalBuild_onceToken_0 != -1)
        dispatch_once(&isInternalBuild_onceToken_0, &__block_literal_global_180);
      if (isInternalBuild_internalBuild_0)
      {
        +[TVLPersistenceManager URLForRecording](TVLPersistenceManager, "URLForRecording");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
      objc_initWeak((id *)buf, self);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke;
      v22[3] = &unk_24E3E99D0;
      objc_copyWeak(v26, (id *)buf);
      v25 = v7;
      v26[1] = v18;
      v23 = v11;
      v21 = v20;
      v24 = v21;
      +[TVLListenEngine engineWithCompletion:](TVLListenEngine, "engineWithCompletion:", v22);

      objc_destroyWeak(v26);
      objc_destroyWeak((id *)buf);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVLatencyErrorDomain"), 1207, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLAudioLatencyEstimator _respondAndInvalidateWithError:responseHandler:](self, "_respondAndInvalidateWithError:responseHandler:", v14, v7);

  }
}

void __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  _QWORD block[5];
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = *(_QWORD *)(a1 + 48);
      v19 = CFSTR("MESSAGE");
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v5 + 16))(v5, 0, 0, v7);

      v8 = *(_QWORD *)(a1 + 64);
      v9 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_2;
      block[3] = &unk_24E3E96B8;
      block[4] = WeakRetained;
      dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
      objc_msgSend(WeakRetained, "setListenEngine:", v3);
      objc_msgSend(WeakRetained, "listenEngine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 64);
      v13 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_3;
      v17[3] = &unk_24E3E9958;
      v17[4] = WeakRetained;
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_4;
      v15[3] = &unk_24E3E99A8;
      objc_copyWeak(&v16, (id *)(a1 + 56));
      objc_msgSend(v10, "startListeningWithReferenceTone:at:saveToFile:withCallback:completion:", v13, v11, v12, v17, v15);

      objc_destroyWeak(&v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVLatencyErrorDomain"), 1206, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_respondAndInvalidateWithError:responseHandler:", v14, *(_QWORD *)(a1 + 48));

    }
  }

}

uint64_t __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postProgressEvent:withInfo:", 1, 0);
}

void __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_3(uint64_t a1, double a2, float a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v9[0] = CFSTR("TVLAudioLatencyEstimationInternalProgressEventEstimationLatencyKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v9[1] = CFSTR("TVLAudioLatencyEstimationInternalProgressEventEstimationConfidenceKey");
  v7 = MEMORY[0x24BDBD1C0];
  if (a3 > 0.0)
    v7 = MEMORY[0x24BDBD1C8];
  v10[0] = v5;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_postInternalProgressEvent:withInfo:", 0, v8);

}

void __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v23[0] = CFSTR("TVLAudioLatencyEstimationInternalProgressEventEstimationLatencyKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    v23[1] = CFSTR("TVLAudioLatencyEstimationInternalProgressEventEstimationConfidenceKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_postInternalProgressEvent:withInfo:", 1, v11);

    v12 = objc_alloc(MEMORY[0x24BDBCED8]);
    v22[0] = MEMORY[0x24BDBD1C8];
    v21[0] = CFSTR("COMPLETE");
    v21[1] = CFSTR("LATENCY");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v13;
    v21[2] = CFSTR("CONFIDENT");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v12, "initWithDictionary:", v15);

    if (v7)
      objc_msgSend(v16, "setObject:forKey:", v7, CFSTR("STATISTICS"));
    v19[0] = CFSTR("MESSAGE");
    v19[1] = CFSTR("OPTIONS");
    v20[0] = CFSTR("AUDIO_LATENCY_ESTIMATION");
    v20[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_5;
    v18[3] = &unk_24E3E9980;
    v18[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_sendMessage:withResponse:", v17, v18);

  }
}

void __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint8_t v14[16];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("MESSAGE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ASK_RETRY"));

    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v8 = 4;
LABEL_12:
      objc_msgSend(v7, "_postProgressEvent:withInfo:", v8, 0);
      goto LABEL_13;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("MESSAGE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("CONTINUE"));

    if (v10)
    {
      if (_TVLLogDefault_onceToken_3 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
      v11 = _TVLLogDefault_log_3;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_21F2AB000, v11, OS_LOG_TYPE_DEFAULT, "Continuing to next estimation...", v14, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "estimate");
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("MESSAGE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("FINAL"));

      if (v13)
      {
        v7 = *(void **)(a1 + 32);
        v8 = 3;
        goto LABEL_12;
      }
    }
  }
LABEL_13:

}

- (void)_respondAndInvalidateWithError:(id)a3 responseHandler:(id)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("MESSAGE");
  v16[1] = CFSTR("OPTIONS");
  v17[0] = CFSTR("FAILURE");
  v14[0] = CFSTR("ERROR_CODE");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v9, "code"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("ERROR_DOMAIN");
  v15[0] = v10;
  objc_msgSend(v9, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))a4 + 2))(v8, 0, 0, v13);

  -[TVLAudioLatencyEstimator _invalidateWithError:](self, "_invalidateWithError:", v9);
}

- (void)_postProgressEvent:(unint64_t)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__TVLAudioLatencyEstimator__postProgressEvent_withInfo___block_invoke;
  block[3] = &unk_24E3E99F8;
  v9 = v6;
  v10 = a3;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __56__TVLAudioLatencyEstimator__postProgressEvent_withInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (_TVLLogDefault_onceToken_3 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  v2 = (id)_TVLLogDefault_log_3;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "progressEventHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x2207C5BC0]();
    v5 = (void *)v4;
    v6 = *(_QWORD *)(a1 + 48) - 1;
    if (v6 > 3)
      v7 = "Start";
    else
      v7 = off_24E3E9A98[v6];
    v8 = *(_QWORD *)(a1 + 40);
    v16 = 138412802;
    v17 = v4;
    v18 = 2082;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_21F2AB000, v2, OS_LOG_TYPE_DEFAULT, "Calling Progress Event Handler: %@ with Event: %{public}s | Info %{public}@", (uint8_t *)&v16, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "progressEventHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "progressEventHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

    if (*(_QWORD *)(a1 + 48) == 3)
    {
      if (_TVLLogDefault_onceToken_3 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
      v11 = (void *)_TVLLogDefault_log_3;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(void **)(a1 + 32);
        v13 = v11;
        objc_msgSend(v12, "progressEventHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x2207C5BC0]();
        v16 = 138412290;
        v17 = (uint64_t)v15;
        _os_log_impl(&dword_21F2AB000, v13, OS_LOG_TYPE_DEFAULT, "Deleting Progress Event Handler: %@ | This should not be invoked again!", (uint8_t *)&v16, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "setProgressEventHandler:", 0);
    }
  }
}

- (void)_postInternalProgressEvent:(unint64_t)a3 withInfo:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;
  _QWORD block[5];
  id v14;
  unint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (_TVLLogDefault_onceToken_3 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  v7 = (void *)_TVLLogDefault_log_3;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[TVLAudioLatencyEstimator internalProgressEventHandler](self, "internalProgressEventHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x2207C5BC0]();
    v11 = "Final Estimation";
    *(_DWORD *)buf = 138412802;
    v17 = v10;
    if (!a3)
      v11 = "New Estimation";
    v18 = 2082;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "Calling Internal Progress Event Handler: %@ with Event: %{public}s | Info: %@", buf, 0x20u);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__TVLAudioLatencyEstimator__postInternalProgressEvent_withInfo___block_invoke;
  block[3] = &unk_24E3E99F8;
  v14 = v6;
  v15 = a3;
  block[4] = self;
  v12 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __64__TVLAudioLatencyEstimator__postInternalProgressEvent_withInfo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "internalProgressEventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "internalProgressEventHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

- (unint64_t)role
{
  return self->_role;
}

- (id)progressEventHandler
{
  return self->_progressEventHandler;
}

- (void)setProgressEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)version
{
  return self->_version;
}

- (void)setVersion:(float)a3
{
  self->_version = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TVLNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitor, a3);
}

- (TVLNetworkInterface)awdlInterface
{
  return self->_awdlInterface;
}

- (void)setAwdlInterface:(id)a3
{
  objc_storeStrong((id *)&self->_awdlInterface, a3);
}

- (TVLNetworkInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInterface, a3);
}

- (CUMessageSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (TVLTimeSync)timeSync
{
  return self->_timeSync;
}

- (void)setTimeSync:(id)a3
{
  objc_storeStrong((id *)&self->_timeSync, a3);
}

- (TVLListenEngine)listenEngine
{
  return self->_listenEngine;
}

- (void)setListenEngine:(id)a3
{
  objc_storeStrong((id *)&self->_listenEngine, a3);
}

- (id)internalProgressEventHandler
{
  return self->_internalProgressEventHandler;
}

- (void)setInternalProgressEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internalProgressEventHandler, 0);
  objc_storeStrong((id *)&self->_listenEngine, 0);
  objc_storeStrong((id *)&self->_timeSync, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong((id *)&self->_awdlInterface, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progressEventHandler, 0);
}

- (void)_estimateAudioLatencyWithOptions:(uint64_t)a1 withResponseHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21F2AB000, a2, OS_LOG_TYPE_ERROR, "Failed to provide tone. Error=%{public}@", (uint8_t *)&v2, 0xCu);
}

@end

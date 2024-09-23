@implementation WRMBasebandMetricsInterface

- (void)registerClient:(int)a3 queue:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  OS_dispatch_queue *mQueue;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC9B8];
  }
  objc_storeStrong((id *)&self->super.mQueue, v7);
  if (!v6)

  self->super.mProcessId = v4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__WRMBasebandMetricsInterface_registerClient_queue___block_invoke;
  v12[3] = &unk_24C30CFE0;
  objc_copyWeak(&v13, &location);
  v9 = (void *)MEMORY[0x20BD2502C](v12);
  mQueue = self->super.mQueue;
  v11.receiver = self;
  v11.super_class = (Class)WRMBasebandMetricsInterface;
  -[WRMClientInterface registerClient:queue:notificationHandler:](&v11, sel_registerClient_queue_notificationHandler_, v4, mQueue, v9);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __52__WRMBasebandMetricsInterface_registerClient_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleNotification::", v8, a4);

}

- (void)unregisterClient
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRMBasebandMetricsInterface;
  -[WRMClientInterface unregisterClient](&v2, sel_unregisterClient);
}

- (void)getWiFiBWEstimationMetrics:(id)a3
{
  id v4;
  id wifiMetricsHandler;
  void *v6;
  id v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  xpc_object_t v11;
  uint64_t i;
  xpc_object_t v13[2];
  char *keys[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wifiMetricsHandler = self->wifiMetricsHandler;
  if (wifiMetricsHandler)
  {
    self->wifiMetricsHandler = 0;

  }
  v6 = (void *)MEMORY[0x20BD2502C](v4);
  v7 = self->wifiMetricsHandler;
  self->wifiMetricsHandler = v6;

  v8 = xpc_dictionary_create(0, 0, 0);
  *(_OWORD *)keys = xmmword_24C30D000;
  v9 = xpc_uint64_create(0x834uLL);
  v13[0] = v9;
  v10 = v8;
  v13[1] = v10;
  v11 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  xpc_connection_send_message(self->super.mConnection, v11);

  for (i = 1; i != -1; --i)
}

- (void)getNRPhyMetrics:(id)a3
{
  id v4;
  id metricsHandler;
  void *v6;
  id v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  xpc_object_t v11;
  uint64_t i;
  xpc_object_t v13[2];
  char *keys[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  metricsHandler = self->metricsHandler;
  if (metricsHandler)
  {
    self->metricsHandler = 0;

  }
  v6 = (void *)MEMORY[0x20BD2502C](v4);
  v7 = self->metricsHandler;
  self->metricsHandler = v6;

  v8 = xpc_dictionary_create(0, 0, 0);
  *(_OWORD *)keys = xmmword_24C30D000;
  v9 = xpc_uint64_create(0x7D0uLL);
  v13[0] = v9;
  v10 = v8;
  v13[1] = v10;
  v11 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  xpc_connection_send_message(self->super.mConnection, v11);

  for (i = 1; i != -1; --i)
}

- (void)getCellularDataMetrics:(id)a3
{
  id v4;
  id dataMetricsHandler;
  void *v6;
  id v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  xpc_object_t v11;
  uint64_t i;
  xpc_object_t v13[2];
  char *keys[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dataMetricsHandler = self->dataMetricsHandler;
  if (dataMetricsHandler)
  {
    self->dataMetricsHandler = 0;

  }
  v6 = (void *)MEMORY[0x20BD2502C](v4);
  v7 = self->dataMetricsHandler;
  self->dataMetricsHandler = v6;

  v8 = xpc_dictionary_create(0, 0, 0);
  *(_OWORD *)keys = xmmword_24C30D000;
  v9 = xpc_uint64_create(0x7D1uLL);
  v13[0] = v9;
  v10 = v8;
  v13[1] = v10;
  v11 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  xpc_connection_send_message(self->super.mConnection, v11);

  for (i = 1; i != -1; --i)
}

- (void)getQSHMetrics:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  xpc_object_t v8;
  void *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  id v12;
  xpc_object_t v13;
  OS_xpc_object *mConnection;
  uint64_t i;
  _QWORD handler[4];
  id v17;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x20BD2502C](v4);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = xpc_dictionary_create(0, 0, 0);
      if (v8)
      {
        v9 = v8;
        v10 = xpc_dictionary_create(0, 0, 0);
        *(_OWORD *)keys = xmmword_24C30D000;
        v11 = xpc_uint64_create(0x7D2uLL);
        values[0] = v11;
        v12 = v10;
        values[1] = v12;
        v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
        mConnection = self->super.mConnection;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __45__WRMBasebandMetricsInterface_getQSHMetrics___block_invoke;
        handler[3] = &unk_24C30D018;
        v17 = v7;
        xpc_connection_send_message_with_reply(mConnection, v13, 0, handler);

        for (i = 1; i != -1; --i)
      }

    }
  }

}

void __45__WRMBasebandMetricsInterface_getQSHMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t uint64;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[7];
  _QWORD v20[8];

  v20[7] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  uint64 = xpc_dictionary_get_uint64(v3, "totalCellularBW");
  v5 = xpc_dictionary_get_uint64(v3, "nrConfiguredBW");
  v6 = xpc_dictionary_get_uint64(v3, "totalLayers");
  v7 = xpc_dictionary_get_uint64(v3, "nrLayers");
  v8 = xpc_dictionary_get_uint64(v3, "lteMaxScheduledLayers");
  v9 = xpc_dictionary_get_uint64(v3, "nrModulation");
  v10 = xpc_dictionary_get_uint64(v3, "totalCCs");

  v19[0] = CFSTR("totalCellularBW");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", uint64);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v19[1] = CFSTR("nrConfiguredBW");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  v19[2] = CFSTR("totalLayers");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v13;
  v19[3] = CFSTR("nrLayers");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v14;
  v19[4] = CFSTR("lteMaxScheduledLayers");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v15;
  v19[5] = CFSTR("nrModulation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v16;
  v19[6] = CFSTR("totalCCs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (WRMBasebandMetricsInterface)init
{
  WRMBasebandMetricsInterface *v2;
  WRMBasebandMetricsInterface *v3;
  id metricsHandler;
  id dataMetricsHandler;
  id wifiMetricsHandler;
  WRMBasebandMetricsInterface *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WRMBasebandMetricsInterface;
  v2 = -[WRMClientInterface init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    metricsHandler = v2->metricsHandler;
    v2->metricsHandler = 0;

    dataMetricsHandler = v3->dataMetricsHandler;
    v3->dataMetricsHandler = 0;

    wifiMetricsHandler = v3->wifiMetricsHandler;
    v3->wifiMetricsHandler = 0;

    v7 = v3;
  }

  return v3;
}

- (void)handleNotification:(id)a3 :(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t uint64;
  void *v8;
  xpc_object_t xdict;

  v4 = a4;
  v6 = a3;
  xdict = v6;
  if (v4)
  {
    NSLog(CFSTR("Invoking reConnect"));
    -[WRMBasebandMetricsInterface reConnect](self, "reConnect");
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(v6, "kMessageId");
    xpc_dictionary_get_value(xdict, "kMessageArgs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    switch(uint64)
    {
      case 0x834uLL:
        -[WRMBasebandMetricsInterface processWRMWiFiBWEstMetrics:](self, "processWRMWiFiBWEstMetrics:", v8);
        break;
      case 0x7D1uLL:
        -[WRMBasebandMetricsInterface processWRMCellDataMetrics:](self, "processWRMCellDataMetrics:", v8);
        break;
      case 0x7D0uLL:
        -[WRMBasebandMetricsInterface processWRMNrPhyMetrics:](self, "processWRMNrPhyMetrics:", v8);
        break;
    }

  }
}

- (void)processWRMNrPhyMetrics:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRMBasebandMetricsInterface *v9;

  v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__WRMBasebandMetricsInterface_processWRMNrPhyMetrics___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

void __54__WRMBasebandMetricsInterface_processWRMNrPhyMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "nrRSRP");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = 0.0;
  v4 = 0.0;
  if (v2)
    v4 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "nrRSRP");
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "nrRSRQ");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v3 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "nrRSRQ");
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "nrSNR");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "nrSNR");
  else
    v7 = 0.0;
  v13[0] = CFSTR("nrRSRP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v13[1] = CFSTR("nrRSRQ");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v13[2] = CFSTR("nrSNR");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  if (v12)
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);

}

- (void)processWRMCellDataMetrics:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRMBasebandMetricsInterface *v9;

  v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__WRMBasebandMetricsInterface_processWRMCellDataMetrics___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

void __57__WRMBasebandMetricsInterface_processWRMCellDataMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t uint64;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "cellularDataLQM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "cellularDataLQM");
  else
    uint64 = 0;
  v7 = CFSTR("cellularDataLQM");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", uint64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

}

- (void)processWRMWiFiBWEstMetrics:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRMBasebandMetricsInterface *v9;

  v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__WRMBasebandMetricsInterface_processWRMWiFiBWEstMetrics___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

void __58__WRMBasebandMetricsInterface_processWRMWiFiBWEstMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *uint64;
  void *v11;
  _BOOL8 v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[7];
  _QWORD v25[8];

  v25[7] = *MEMORY[0x24BDAC8D0];
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "wghtRSSI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = 0.0;
  v4 = 0.0;
  if (v2)
    v4 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "wghtRSSI");
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "wghtSNR");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v3 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "wghtSNR");
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "wghtPhyRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  v8 = 0.0;
  if (v6)
    v8 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "wghtPhyRate");
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "tcpRTT");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v7 = xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "tcpRTT");
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "chType");
  uint64 = (void *)objc_claimAutoreleasedReturnValue();

  if (uint64)
    uint64 = (void *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "chType");
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "isCaptive");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "isCaptive");
  else
    v12 = 0;
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "CCA");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = (double)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "CCA");
  else
    v14 = 0.0;
  v24[0] = CFSTR("wghtRSSI");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v24[1] = CFSTR("wghtSNR");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v16;
  v24[2] = CFSTR("wghtPhyRate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("tcpRTT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v18;
  v24[4] = CFSTR("chType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", uint64);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v19;
  v24[5] = CFSTR("isCaptive");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v20;
  v24[6] = CFSTR("CCA");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
  if (v23)
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v22);

}

- (void)reConnect
{
  -[WRMBasebandMetricsInterface unregisterClient](self, "unregisterClient");
  -[WRMBasebandMetricsInterface registerClient:queue:](self, "registerClient:queue:", self->super.mProcessId, self->super.mQueue);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->wifiMetricsHandler, 0);
  objc_storeStrong(&self->dataMetricsHandler, 0);
  objc_storeStrong(&self->metricsHandler, 0);
}

@end

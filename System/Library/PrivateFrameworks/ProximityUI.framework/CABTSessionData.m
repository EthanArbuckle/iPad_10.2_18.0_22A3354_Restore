@implementation CABTSessionData

- (CABTSessionData)init
{
  CABTSessionData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CABTSessionData;
  v2 = -[CABTSessionData init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABTSessionData setNumberOfErrorEvents:](v2, "setNumberOfErrorEvents:", v3);

    -[CABTSessionData setTxPower:](v2, "setTxPower:", 4294967096);
  }
  return v2;
}

- (void)configure:(id)a3 withOwner:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CABTSessionData setIsOwner:](self, "setIsOwner:", v4);
  -[CABTSessionData setConfigureEvent:](self, "setConfigureEvent:", v6);

}

- (void)configureComplete:(id)a3 withTxPower:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CABTSessionData setConfigureCompleteEvent:](self, "setConfigureCompleteEvent:");
  -[CABTSessionData setTxPower:](self, "setTxPower:", v4);

}

- (void)error:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CABTSessionData numberOfErrorEvents](self, "numberOfErrorEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABTSessionData setNumberOfErrorEvents:](self, "setNumberOfErrorEvents:", v7);

  v16[0] = CFSTR("status");
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("errorDescription");
  v17[0] = v8;
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v9 = objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABTSessionData productUUID](self, "productUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = v12 == 0;

  if ((v9 & 1) == 0)
  {
    -[CABTSessionData productUUID](self, "productUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("ProductUUID"));

  }
  v15 = v11;
  AnalyticsSendEventLazy();

}

id __25__CABTSessionData_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logData
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x24BDAC8D0];
  -[CABTSessionData configureEvent](self, "configureEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CABTSessionData configureEvent](self, "configureEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

  }
  else
  {
    v7 = -1.0;
  }
  -[CABTSessionData configureCompleteEvent](self, "configureCompleteEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CABTSessionData configureCompleteEvent](self, "configureCompleteEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11 - v7;

  }
  else
  {
    v12 = -1.0;
  }
  -[CABTSessionData deinitEvent](self, "deinitEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CABTSessionData deinitEvent](self, "deinitEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16 - v7;

  }
  else
  {
    v17 = -1.0;
  }
  v18 = (void *)MEMORY[0x24BDBCED8];
  v30[0] = CFSTR("TimeToConfigure");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v19 = objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  v30[1] = CFSTR("SessionDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v20;
  v30[2] = CFSTR("NumberOfErrorEvents");
  -[CABTSessionData numberOfErrorEvents](self, "numberOfErrorEvents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v21;
  v30[3] = CFSTR("IsOwner");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CABTSessionData isOwner](self, "isOwner"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v22;
  v30[4] = CFSTR("TxPower");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[CABTSessionData txPower](self, "txPower"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryWithDictionary:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[CABTSessionData productUUID](self, "productUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = v26 == 0;

  if ((v19 & 1) == 0)
  {
    -[CABTSessionData productUUID](self, "productUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("ProductUUID"));

  }
  v29 = v25;
  AnalyticsSendEventLazy();

}

id __26__CABTSessionData_logData__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSDictionary)configureEvent
{
  return self->_configureEvent;
}

- (void)setConfigureEvent:(id)a3
{
  objc_storeStrong((id *)&self->_configureEvent, a3);
}

- (NSDictionary)configureCompleteEvent
{
  return self->_configureCompleteEvent;
}

- (void)setConfigureCompleteEvent:(id)a3
{
  objc_storeStrong((id *)&self->_configureCompleteEvent, a3);
}

- (NSDictionary)deinitEvent
{
  return self->_deinitEvent;
}

- (void)setDeinitEvent:(id)a3
{
  objc_storeStrong((id *)&self->_deinitEvent, a3);
}

- (NSNumber)numberOfErrorEvents
{
  return self->_numberOfErrorEvents;
}

- (void)setNumberOfErrorEvents:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfErrorEvents, a3);
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(BOOL)a3
{
  self->_isOwner = a3;
}

- (int)txPower
{
  return self->_txPower;
}

- (void)setTxPower:(int)a3
{
  self->_txPower = a3;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
  objc_storeStrong((id *)&self->_productUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_numberOfErrorEvents, 0);
  objc_storeStrong((id *)&self->_deinitEvent, 0);
  objc_storeStrong((id *)&self->_configureCompleteEvent, 0);
  objc_storeStrong((id *)&self->_configureEvent, 0);
}

@end

@implementation CASessionData

- (CASessionData)init
{
  CASessionData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CASessionData;
  v2 = -[CASessionData init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CASessionData setNumberOfErrorEvents:](v2, "setNumberOfErrorEvents:", v3);

  }
  return v2;
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
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CASessionData numberOfErrorEvents](self, "numberOfErrorEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CASessionData setNumberOfErrorEvents:](self, "setNumberOfErrorEvents:", v7);

  v19[0] = CFSTR("status");
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("errorDescription");
  v20[0] = v8;
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v9 = objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CASessionData productUUID](self, "productUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = v12 == 0;

  if ((v9 & 1) == 0)
  {
    -[CASessionData productUUID](self, "productUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("ProductUUID"));

  }
  -[CASessionData isOwner](self, "isOwner");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
    -[CASessionData isOwner](self, "isOwner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("IsOwner"));

  }
  v18 = v11;
  AnalyticsSendEventLazy();

}

id __23__CASessionData_error___block_invoke(uint64_t a1)
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
  BOOL v28;
  void *v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  -[CASessionData configureEvent](self, "configureEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CASessionData configureEvent](self, "configureEvent");
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
  -[CASessionData configureCompleteEvent](self, "configureCompleteEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CASessionData configureCompleteEvent](self, "configureCompleteEvent");
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
  -[CASessionData deinitEvent](self, "deinitEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CASessionData deinitEvent](self, "deinitEvent");
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
  v31[0] = CFSTR("TimeToConfigure");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v19 = objc_claimAutoreleasedReturnValue();
  v32[0] = v19;
  v31[1] = CFSTR("SessionDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v20;
  v31[2] = CFSTR("NumberOfErrorEvents");
  -[CASessionData numberOfErrorEvents](self, "numberOfErrorEvents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryWithDictionary:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[CASessionData productUUID](self, "productUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = v24 == 0;

  if ((v19 & 1) == 0)
  {
    -[CASessionData productUUID](self, "productUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("ProductUUID"));

  }
  -[CASessionData isOwner](self, "isOwner");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (!v28)
  {
    -[CASessionData isOwner](self, "isOwner");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, CFSTR("IsOwner"));

  }
  v30 = v23;
  AnalyticsSendEventLazy();

}

id __24__CASessionData_logData__block_invoke(uint64_t a1)
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

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
  objc_storeStrong((id *)&self->_productUUID, a3);
}

- (NSNumber)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(id)a3
{
  objc_storeStrong((id *)&self->_isOwner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_numberOfErrorEvents, 0);
  objc_storeStrong((id *)&self->_deinitEvent, 0);
  objc_storeStrong((id *)&self->_configureCompleteEvent, 0);
  objc_storeStrong((id *)&self->_configureEvent, 0);
}

@end

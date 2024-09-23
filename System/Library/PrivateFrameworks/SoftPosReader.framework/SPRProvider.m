@implementation SPRProvider

+ (SPRProvider)shared
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_shared(SPRPrimer, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getProvider(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPRProvider *)v12;
}

- (id)makeConfiguratorAndReturnError:(id *)a3
{
  SPRConfigurator *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];

  v5 = [SPRConfigurator alloc];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_2159742D0;
  v17[3] = &unk_24D3CD238;
  v17[4] = self;
  v10 = (void *)objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)makeMonitorAndReturnError:(id *)a3
{
  SPRMonitor *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];

  v5 = [SPRMonitor alloc];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_215974558;
  v17[3] = &unk_24D3CD288;
  v17[4] = self;
  v10 = (void *)objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)makeReaderAndReturnError:(id *)a3
{
  SPRReader *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];

  v5 = [SPRReader alloc];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_2159747C8;
  v17[3] = &unk_24D3CD2D8;
  v17[4] = self;
  v10 = (void *)objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)makePINControllerAndReturnError:(id *)a3
{
  SPRPINController *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];

  v5 = [SPRPINController alloc];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_215974A38;
  v17[3] = &unk_24D3CD328;
  v17[4] = self;
  v10 = (void *)objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)makeORReaderAndReturnError:(id *)a3
{
  ORReader *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];

  v5 = [ORReader alloc];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_215974CA8;
  v17[3] = &unk_24D3CD378;
  v17[4] = self;
  v10 = (void *)objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v17, v7, v8, v9);
  objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)maxConfiguratorInstance
{
  return self->_maxConfiguratorInstance;
}

- (int64_t)maxMonitorInstance
{
  return self->_maxMonitorInstance;
}

- (int64_t)maxReaderInstance
{
  return self->_maxReaderInstance;
}

@end

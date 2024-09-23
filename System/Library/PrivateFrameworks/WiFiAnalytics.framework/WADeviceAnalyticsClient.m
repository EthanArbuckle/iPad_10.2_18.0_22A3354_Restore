@implementation WADeviceAnalyticsClient

+ (id)sharedDeviceAnalyticsClientWithPersist
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (+[WAUtil isAnalyticsProcessorAllowed](WAUtil, "isAnalyticsProcessorAllowed"))
  {
    if (_MergedGlobals_5
      || +[AnalyticsStoreMOHandler isStoreCompatible](AnalyticsStoreMOHandler, "isStoreCompatible"))
    {
      if (qword_253D3A4D0 != -1)
        dispatch_once(&qword_253D3A4D0, &__block_literal_global_5);
      return (id)_MergedGlobals_5;
    }
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446466;
      v7 = "+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist]";
      v8 = 1024;
      v9 = 41;
      v4 = "%{public}s::%d:Store needs migration - Wait for wifianalyticsd to complete migration and retry";
      goto LABEL_11;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446466;
      v7 = "+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist]";
      v8 = 1024;
      v9 = 36;
      v4 = "%{public}s::%d:Writing in the WiFi Analytics Store is disabled on this platform";
LABEL_11:
      _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v6, 0x12u);
    }
  }

  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 136446466;
    v7 = "+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist]";
    v8 = 1024;
    v9 = 54;
    _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:ERROR: Exiting with nil WADeviceAnalyticsClient", (uint8_t *)&v6, 0x12u);
  }

  return 0;
}

void __65__WADeviceAnalyticsClient_sharedDeviceAnalyticsClientWithPersist__block_invoke()
{
  WADeviceAnalyticsClient *v0;
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = -[WADeviceAnalyticsClient initWithSharedServerType]([WADeviceAnalyticsClient alloc], "initWithSharedServerType");
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = (uint64_t)v0;

  if (!_MergedGlobals_5)
  {
    WALogCategoryDefaultHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = 136446466;
      v4 = "+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist]_block_invoke";
      v5 = 1024;
      v6 = 47;
      _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:WADeviceAnalyticsClient failed initWithSharedServerType", (uint8_t *)&v3, 0x12u);
    }

  }
}

- (WADeviceAnalyticsClient)init
{
  WADeviceAnalyticsClient *v2;
  AnalyticsStoreMOHandler *v3;
  NSObject *v5;
  const char *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)WADeviceAnalyticsClient;
  v2 = -[WADeviceAnalyticsClient init](&v7, sel_init);
  if (v2)
  {
    v3 = -[AnalyticsStoreMOHandler initWithType:options:]([AnalyticsStoreMOHandler alloc], "initWithType:options:", 0, 0);
    if (v3)
    {
      objc_storeStrong((id *)&v2->_managedObjectHandler, v3);
      if (-[WADeviceAnalyticsClient initCommon](v2, "initCommon"))
      {
LABEL_4:

        return v2;
      }
      WALogCategoryDefaultHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v9 = "-[WADeviceAnalyticsClient init]";
        v10 = 1024;
        v11 = 73;
        v6 = "%{public}s::%d:Error [self initCommon] failed";
        goto LABEL_10;
      }
    }
    else
    {
      WALogCategoryDefaultHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v9 = "-[WADeviceAnalyticsClient init]";
        v10 = 1024;
        v11 = 67;
        v6 = "%{public}s::%d:Error getting managedObjectHandler";
LABEL_10:
        _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
      }
    }

    v2 = 0;
    goto LABEL_4;
  }
  return v2;
}

- (WADeviceAnalyticsClient)initWithSharedServerType
{
  WADeviceAnalyticsClient *v2;
  void *v3;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)WADeviceAnalyticsClient;
  v2 = -[WADeviceAnalyticsClient init](&v8, sel_init);
  if (v2)
  {
    +[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist](AnalyticsStoreMOHandler, "sharedAnalyticsStoreMOHandlerWithPersist");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_storeStrong((id *)&v2->_managedObjectHandler, v3);
      if (-[WADeviceAnalyticsClient initCommon](v2, "initCommon"))
      {
LABEL_4:

        return v2;
      }
      WALogCategoryDefaultHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v10 = "-[WADeviceAnalyticsClient initWithSharedServerType]";
        v11 = 1024;
        v12 = 95;
        v6 = "%{public}s::%d:Error [self initCommon] failed";
        goto LABEL_10;
      }
    }
    else
    {
      WALogCategoryDefaultHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v10 = "-[WADeviceAnalyticsClient initWithSharedServerType]";
        v11 = 1024;
        v12 = 91;
        v6 = "%{public}s::%d:Error getting sharedAnalyticsStoreMOHandlerWithPersist";
LABEL_10:
        _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
      }
    }

    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "-[WADeviceAnalyticsClient initWithSharedServerType]";
      v11 = 1024;
      v12 = 100;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ERROR: Exiting with nil WADeviceAnalyticsClient", buf, 0x12u);
    }

    v2 = 0;
    goto LABEL_4;
  }
  return v2;
}

- (BOOL)initCommon
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  OS_dispatch_queue *v6;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifianalytics.deviceanalyticsclient", v3);
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v4;

  v6 = self->_dispatchQueue;
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446466;
      v10 = "-[WADeviceAnalyticsClient initCommon]";
      v11 = 1024;
      v12 = 110;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:_dispatchQueue nil", (uint8_t *)&v9, 0x12u);
    }

  }
  return v6 != 0;
}

- (void)dealloc
{
  AnalyticsReader *analyticsReaderObj;
  AnalyticsStoreFileWriter *analyticsFileWriterObj;
  objc_super v5;

  analyticsReaderObj = self->_analyticsReaderObj;
  self->_analyticsReaderObj = 0;

  analyticsFileWriterObj = self->_analyticsFileWriterObj;
  self->_analyticsFileWriterObj = 0;

  v5.receiver = self;
  v5.super_class = (Class)WADeviceAnalyticsClient;
  -[WADeviceAnalyticsClient dealloc](&v5, sel_dealloc);
}

- (id)analyticsReader
{
  AnalyticsReader *analyticsReaderObj;
  AnalyticsReader *v4;
  AnalyticsReader *v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  analyticsReaderObj = self->_analyticsReaderObj;
  if (analyticsReaderObj)
    return analyticsReaderObj;
  v4 = -[AnalyticsReader initWithAnalyticsStore:]([AnalyticsReader alloc], "initWithAnalyticsStore:", self->_managedObjectHandler);
  v5 = self->_analyticsReaderObj;
  self->_analyticsReaderObj = v4;

  analyticsReaderObj = self->_analyticsReaderObj;
  if (analyticsReaderObj)
    return analyticsReaderObj;
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 136446466;
    v9 = "-[WADeviceAnalyticsClient analyticsReader]";
    v10 = 1024;
    v11 = 129;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:_analyticsReaderObj nil", (uint8_t *)&v8, 0x12u);
  }

  return 0;
}

- (id)analyticsFileWriter
{
  AnalyticsStoreFileWriter *analyticsFileWriterObj;
  AnalyticsStoreFileWriter *v4;
  AnalyticsStoreFileWriter *v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  analyticsFileWriterObj = self->_analyticsFileWriterObj;
  if (analyticsFileWriterObj)
    return analyticsFileWriterObj;
  v4 = -[AnalyticsStoreFileWriter initWithAnalyticsStore:]([AnalyticsStoreFileWriter alloc], "initWithAnalyticsStore:", self->_managedObjectHandler);
  v5 = self->_analyticsFileWriterObj;
  self->_analyticsFileWriterObj = v4;

  analyticsFileWriterObj = self->_analyticsFileWriterObj;
  if (analyticsFileWriterObj)
    return analyticsFileWriterObj;
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 136446466;
    v9 = "-[WADeviceAnalyticsClient analyticsFileWriter]";
    v10 = 1024;
    v11 = 144;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:_analyticsFileWriterObj nil", (uint8_t *)&v8, 0x12u);
  }

  return 0;
}

- (id)neighborChannelsForBSS:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "neighborChannelsForBSS:ssid:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)neighborsForBSS:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "neighborsForBSS:ssid:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)rssiRoamTriggerForBSS:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  v7 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rssiRoamTriggerForBSS:ssid:", v7, v6);

  return v9;
}

- (int64_t)autoLeaveRssiForBSS:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  v7 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "autoLeaveRssiForBss:ssid:", v7, v6);

  return v9;
}

- (unint64_t)manualLeaveCountForBss:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;

  v6 = a4;
  v7 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "manualLeaveCountForBss:ssid:", v7, v6);

  return v9;
}

- (BOOL)parsedBeaconInfoIsStored:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "parsedBeaconInfoIsStored:ssid:", v7, v6);

  return v9;
}

- (BOOL)dumpDeviceAnalyticsToFileWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsFileWriter](self, "analyticsFileWriter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WADeviceAnalyticsClient dispatchQueue](self, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __67__WADeviceAnalyticsClient_dumpDeviceAnalyticsToFileWithCompletion___block_invoke;
    v8[3] = &unk_24CDDE5C0;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v6, v8);

  }
  return v5 != 0;
}

void __67__WADeviceAnalyticsClient_dumpDeviceAnalyticsToFileWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "analyticsFileWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeAnalyticsStoreToFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  objc_autoreleasePoolPop(v2);
}

- (BOOL)dumpDeviceAnalyticsToFileWithCompletion:(id)a3 fetchLimit:(unint64_t)a4 maxAge:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!a4)
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "-[WADeviceAnalyticsClient dumpDeviceAnalyticsToFileWithCompletion:fetchLimit:maxAge:]";
      v20 = 1024;
      v21 = 194;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchLimit is 0", buf, 0x12u);
    }

    goto LABEL_7;
  }
  -[WADeviceAnalyticsClient analyticsFileWriter](self, "analyticsFileWriter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  -[WADeviceAnalyticsClient dispatchQueue](self, "dispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__WADeviceAnalyticsClient_dumpDeviceAnalyticsToFileWithCompletion_fetchLimit_maxAge___block_invoke;
  v14[3] = &unk_24CDDE5E8;
  v16 = a5;
  v17 = a4;
  v14[4] = self;
  v15 = v8;
  dispatch_async(v10, v14);

  v11 = 1;
LABEL_8:

  return v11;
}

void __85__WADeviceAnalyticsClient_dumpDeviceAnalyticsToFileWithCompletion_fetchLimit_maxAge___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v10 = 136446978;
    v11 = "-[WADeviceAnalyticsClient dumpDeviceAnalyticsToFileWithCompletion:fetchLimit:maxAge:]_block_invoke";
    v12 = 1024;
    v13 = 198;
    v14 = 2048;
    v15 = v4;
    v16 = 2048;
    v17 = v5;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEBUG, "%{public}s::%d:maxAge:%lu fetchLimit:%lu", (uint8_t *)&v10, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 32), "analyticsFileWriter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "batchedWriteAnalyticsStoreToFile:maxAge:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  objc_autoreleasePoolPop(v2);
}

- (BOOL)dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:(id)a3 batchSize:(unint64_t)a4 maxAge:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  unint64_t v15;

  v8 = a3;
  -[WADeviceAnalyticsClient analyticsFileWriter](self, "analyticsFileWriter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WADeviceAnalyticsClient dispatchQueue](self, "dispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __98__WADeviceAnalyticsClient_dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion_batchSize_maxAge___block_invoke;
    v12[3] = &unk_24CDDE5E8;
    v14 = a5;
    v15 = a4;
    v12[4] = self;
    v13 = v8;
    dispatch_async(v10, v12);

  }
  return v9 != 0;
}

void __98__WADeviceAnalyticsClient_dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion_batchSize_maxAge___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v10 = 136446978;
    v11 = "-[WADeviceAnalyticsClient dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:]_block_invoke";
    v12 = 1024;
    v13 = 217;
    v14 = 2048;
    v15 = v4;
    v16 = 2048;
    v17 = v5;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEBUG, "%{public}s::%d:maxAge:%lu batchSize:%lu", (uint8_t *)&v10, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 32), "analyticsFileWriter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  objc_autoreleasePoolPop(v2);
}

- (BOOL)dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:(id)a3 batchSize:(unint64_t)a4 maxAge:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  unint64_t v15;

  v8 = a3;
  -[WADeviceAnalyticsClient analyticsFileWriter](self, "analyticsFileWriter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WADeviceAnalyticsClient dispatchQueue](self, "dispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __102__WADeviceAnalyticsClient_dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion_batchSize_maxAge___block_invoke;
    v12[3] = &unk_24CDDE5E8;
    v14 = a5;
    v15 = a4;
    v12[4] = self;
    v13 = v8;
    dispatch_async(v10, v12);

  }
  return v9 != 0;
}

void __102__WADeviceAnalyticsClient_dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion_batchSize_maxAge___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v10 = 136446978;
    v11 = "-[WADeviceAnalyticsClient dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:]_block_invoke";
    v12 = 1024;
    v13 = 235;
    v14 = 2048;
    v15 = v4;
    v16 = 2048;
    v17 = v5;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEBUG, "%{public}s::%d:maxAge:%lu batchSize:%lu", (uint8_t *)&v10, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 32), "analyticsFileWriter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  else
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  objc_autoreleasePoolPop(v2);
}

- (BOOL)dumpDeploymentGraphJSONFileWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsFileWriter](self, "analyticsFileWriter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WADeviceAnalyticsClient dispatchQueue](self, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __69__WADeviceAnalyticsClient_dumpDeploymentGraphJSONFileWithCompletion___block_invoke;
    v8[3] = &unk_24CDDE5C0;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v6, v8);

  }
  return v5 != 0;
}

void __69__WADeviceAnalyticsClient_dumpDeploymentGraphJSONFileWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "analyticsFileWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeDeploymentGraphToFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  objc_autoreleasePoolPop(v2);
}

- (unint64_t)isNetworkWithinRangeOfLocation:(id)a3 range:(double)a4 location:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  unint64_t v12;
  uint64_t v14;

  v14 = 0;
  v8 = a5;
  v9 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isNetworkWithinRangeOfLocation:range:location:count:", v9, v8, &v14, a4);

  v12 = 1;
  if (v11)
    v12 = 2;
  if (v14)
    return v12;
  else
    return 0;
}

- (id)copyGeoTagsForNetwork:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyGeoTagsForNetwork:location:", v7, v6);

  return v9;
}

- (id)copyNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:", v8, v5, a4);

  return v10;
}

- (id)copyScoreSortedNetworksAvailableAtLocationWithinDistance:(id)a3 distance:(double)a4 authComparator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:", v9, v8, a4);

  return v11;
}

- (id)copyPreferenceScoreDictionaryForNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyPreferenceScoreDictionaryForNetwork:", v4);

  return v6;
}

- (BOOL)isMovingNetwork:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMovingNetwork:", v4);

  return v6;
}

- (BOOL)isOmnipresentNetwork:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOmnipresentNetwork:", v4);

  return v6;
}

- (BOOL)isHistoricallyBadLinkQualityNetwork:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHistoricallyBadLinkQualityNetwork:", v4);

  return v6;
}

- (id)copyLocationsForNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyLocationsForNetwork:", v4);

  return v6;
}

- (id)copyAllStoredNetworkSsidsWithTrait:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyAllStoredNetworkSsidsWithTrait:", a3);

  return v5;
}

- (id)copyAllStoredNetworkSsids
{
  void *v2;
  void *v3;

  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyAllStoredNetworkSsids");

  return v3;
}

- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyAllStoredNetworkSsidsWithColocatedScopeId:", v4);

  return v6;
}

- (id)copyColocatedScopeIdForSsid:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyColocatedScopeIdForSsid:", v4);

  return v6;
}

- (id)copyColocatedScopeTransitionInfo:(id)a3 bssid:(id)a4 minRssi:(int)a5 maxRssi:(int)a6 band:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v12 = a4;
  v13 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:", v13, v12, v9, v8, v7);

  return v15;
}

- (id)copyNetworkUsageDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WADeviceAnalyticsClient analyticsReader](self, "analyticsReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyNetworkUsageDictionary:", v4);

  return v6;
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (void)setManagedObjectHandler:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectHandler, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (AnalyticsReader)analyticsReaderObj
{
  return self->_analyticsReaderObj;
}

- (void)setAnalyticsReaderObj:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReaderObj, a3);
}

- (AnalyticsStoreFileWriter)analyticsFileWriterObj
{
  return self->_analyticsFileWriterObj;
}

- (void)setAnalyticsFileWriterObj:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsFileWriterObj, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsFileWriterObj, 0);
  objc_storeStrong((id *)&self->_analyticsReaderObj, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
}

@end

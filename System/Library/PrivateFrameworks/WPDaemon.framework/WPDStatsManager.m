@implementation WPDStatsManager

uint64_t __32__WPDStatsManager_stopActivity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopTime");
}

uint64_t __32__WPDStatsManager_stopActivity___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopTime");
}

- (void)startActivity:(unint64_t)a3 forType:(unsigned __int8)a4 scanRate:(int64_t)a5
{
  unsigned int v5;
  unsigned int v7;
  void *v8;
  NSObject *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *scanArray;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v5 = a4;
  if (a4 < 0x1Bu)
  {
    v7 = a4;
    if (a3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_advertisingArray, "objectAtIndexedSubscript:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WPDStatsManager regularScanArray](self, "regularScanArray");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stopTime");

      -[WPDStatsManager aggressiveScanArray](self, "aggressiveScanArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stopTime");

      scanArray = self->_scanArray;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](scanArray, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v7);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v18;
    }
    v19 = v8;
    objc_msgSend(v8, "startTime");

  }
  else if (+[WPDaemonServer isInternalBuild](WPDaemonServer, "isInternalBuild", a3))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("WPClientType beyond bounds"), CFSTR("Trying to start activity for type %ld when WPClientMax is %ld"), v5, 27);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_127_1);
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDStatsManager startActivity:forType:scanRate:].cold.1(v5, v9);
  }
}

- (NSMutableArray)regularScanArray
{
  return self->_regularScanArray;
}

- (NSMutableArray)aggressiveScanArray
{
  return self->_aggressiveScanArray;
}

- (void)stopActivity:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    -[WPDStatsManager advertisingArray](self, "advertisingArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = &__block_literal_global_132_2;
  }
  else
  {
    -[WPDStatsManager regularScanArray](self, "regularScanArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_130_3);

    -[WPDStatsManager aggressiveScanArray](self, "aggressiveScanArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = &__block_literal_global_131_1;
  }
  v7 = v4;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (void)resetActivity:(unint64_t)a3 forType:(unsigned __int8)a4
{
  int v4;
  unint64_t *v6;

  v4 = a4;
  if (a3)
  {
    if (!-[WPDStatsManager resetAdvertisingArray](self, "resetAdvertisingArray"))
      return;
    v6 = -[WPDStatsManager resetAdvertisingArray](self, "resetAdvertisingArray");
  }
  else
  {
    if (!-[WPDStatsManager resetScanArray](self, "resetScanArray"))
      return;
    v6 = -[WPDStatsManager resetScanArray](self, "resetScanArray");
  }
  ++v6[v4];
}

- (unint64_t)resetScanArray
{
  return self->_resetScanArray;
}

- (WPDStatsManager)initWithServer:(id)a3
{
  id v4;
  WPDStatsManager *v5;
  WPDStatsManager *v6;
  NSString *name;
  uint64_t v8;
  NSMutableArray *regularScanArray;
  uint64_t v10;
  NSMutableArray *aggressiveScanArray;
  NSMutableArray *v12;
  uint64_t v13;
  NSDictionary *scanArray;
  uint64_t v15;
  NSMutableArray *advertisingArray;
  uint64_t v17;
  NSMutableArray *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  unint64_t *resetAdvertisingArray;
  OS_dispatch_queue *reportQueue;
  BOOL v26;
  char v27;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WPDStatsManager;
  v5 = -[WPDStatsManager init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    name = v5->_name;
    v5->_name = (NSString *)CFSTR("StatsManager");

    objc_storeWeak((id *)&v6->_server, v4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 27);
    v8 = objc_claimAutoreleasedReturnValue();
    regularScanArray = v6->_regularScanArray;
    v6->_regularScanArray = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 27);
    v10 = objc_claimAutoreleasedReturnValue();
    aggressiveScanArray = v6->_aggressiveScanArray;
    v6->_aggressiveScanArray = (NSMutableArray *)v10;

    v30[0] = &unk_24D7D7EC0;
    v30[1] = &unk_24D7D7ED8;
    v12 = v6->_aggressiveScanArray;
    v31[0] = v6->_regularScanArray;
    v31[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v13 = objc_claimAutoreleasedReturnValue();
    scanArray = v6->_scanArray;
    v6->_scanArray = (NSDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 27);
    v15 = objc_claimAutoreleasedReturnValue();
    advertisingArray = v6->_advertisingArray;
    v6->_advertisingArray = (NSMutableArray *)v15;

    v6->_resetScanArray = (unint64_t *)malloc_type_malloc(0xD8uLL, 0x100004000313F17uLL);
    v17 = 0;
    v6->_resetAdvertisingArray = (unint64_t *)malloc_type_malloc(0xD8uLL, 0x100004000313F17uLL);
    do
    {
      v18 = v6->_regularScanArray;
      v19 = (void *)objc_opt_new();
      -[NSMutableArray addObject:](v18, "addObject:", v19);

      v20 = v6->_aggressiveScanArray;
      v21 = (void *)objc_opt_new();
      -[NSMutableArray addObject:](v20, "addObject:", v21);

      v22 = v6->_advertisingArray;
      v23 = (void *)objc_opt_new();
      -[NSMutableArray addObject:](v22, "addObject:", v23);

      resetAdvertisingArray = v6->_resetAdvertisingArray;
      v6->_resetScanArray[v17] = 0;
      resetAdvertisingArray[v17++] = 0;
    }
    while (v17 != 27);
    reportQueue = v6->_reportQueue;
    v6->_reportQueue = 0;

    v6->_nextPushTime = 0.0;
    if (MEMORY[0x24BE74F58])
      v26 = MEMORY[0x24BE74F70] == 0;
    else
      v26 = 1;
    v27 = !v26;
    v6->_PLLogAvailable = v27;
  }

  return v6;
}

- (void)dealloc
{
  unint64_t *resetScanArray;
  unint64_t *resetAdvertisingArray;
  objc_super v5;

  resetScanArray = self->_resetScanArray;
  if (resetScanArray)
  {
    free(resetScanArray);
    self->_resetScanArray = 0;
  }
  resetAdvertisingArray = self->_resetAdvertisingArray;
  if (resetAdvertisingArray)
  {
    free(resetAdvertisingArray);
    self->_resetAdvertisingArray = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WPDStatsManager;
  -[WPDStatsManager dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x219A0EE8C](self, a2);
  -[WPDStatsManager generateStateDumpStrings](self, "generateStateDumpStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@\n"), self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "subarrayWithRange:", 1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "appendString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v12;
}

- (id)generateStateDumpStrings
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double Current;
  double v8;
  void *v9;
  void *v10;
  uint64_t v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("========= %@ =========\n"), self->_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if (self->_PLLogAvailable)
  {
    -[WPDStatsManager nextPushTime](self, "nextPushTime");
    v5 = (void *)MEMORY[0x24BDD17C8];
    if (v6 <= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Last pushed to PL log (%@) - never)"), CFSTR("WirelessProximity"), v12);
    }
    else
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[WPDStatsManager nextPushTime](self, "nextPushTime");
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Last pushed to PL log (%@) - %f seconds ago)"), CFSTR("WirelessProximity"), Current - v8 + 1200.0);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  else
  {
    objc_msgSend(v3, "addObject:", CFSTR("Push to PL log is not supported"));
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)generateStateDump
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WPDStatsManager generateStateDumpStrings](self, "generateStateDumpStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_15);
        v8 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v7;
          _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

}

- (void)startActivity:(unint64_t)a3 forType:(unsigned __int8)a4
{
  -[WPDStatsManager startActivity:forType:scanRate:](self, "startActivity:forType:scanRate:", a3, a4, 1);
}

- (void)stopActivity:(unint64_t)a3 forType:(unsigned __int8)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  if (a3)
  {
    -[WPDStatsManager advertisingArray](self, "advertisingArray");
  }
  else
  {
    -[WPDStatsManager regularScanArray](self, "regularScanArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopTime");

    -[WPDStatsManager aggressiveScanArray](self, "aggressiveScanArray");
  }
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopTime");

}

uint64_t __32__WPDStatsManager_stopActivity___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopTime");
}

- (id)getStatsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x219A0EE8C]();
  -[WPDStatsManager regularScanArray](self, "regularScanArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  timeArrayFromArray(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Scan"));

  -[WPDStatsManager advertisingArray](self, "advertisingArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  timeArrayFromArray(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Advertise"));

  -[WPDStatsManager aggressiveScanArray](self, "aggressiveScanArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  timeArrayFromArray(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("AggressiveScan"));

  counterArrayFromCounters((uint64_t)-[WPDStatsManager resetScanArray](self, "resetScanArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ResetScan"));

  counterArrayFromCounters((uint64_t)-[WPDStatsManager resetAdvertisingArray](self, "resetAdvertisingArray"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ResetAdvertise"));

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (void)reportPLStats
{
  NSObject *reportQueue;
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (self->_PLLogAvailable)
  {
    reportQueue = self->_reportQueue;
    if (!reportQueue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
      v5 = objc_claimAutoreleasedReturnValue();

      v6 = (OS_dispatch_queue *)dispatch_queue_create("WPStatsQueue", v5);
      v7 = self->_reportQueue;
      self->_reportQueue = v6;

      location = 0;
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __32__WPDStatsManager_reportPLStats__block_invoke;
      v10[3] = &unk_24D7C1C00;
      objc_copyWeak(&v11, &location);
      v8 = MEMORY[0x219A0F018](v10);
      v9 = (void *)reportPLStats_reportBlock;
      reportPLStats_reportBlock = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);

      reportQueue = self->_reportQueue;
    }
    dispatch_async(reportQueue, (dispatch_block_t)reportPLStats_reportBlock);
  }
}

void __32__WPDStatsManager_reportPLStats__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  CFAbsoluteTime v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x219A0EE8C]();
    objc_msgSend(WeakRetained, "nextPushTime");
    if (v3 <= CFAbsoluteTimeGetCurrent())
    {
      if (PLShouldLogRegisteredEvent())
      {
        objc_msgSend(WeakRetained, "getStatsDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PLLogRegisteredEvent();
        objc_msgSend(WeakRetained, "setNextPushTime:", CFAbsoluteTimeGetCurrent() + 1200.0);
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_149_2);
        v13 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          __32__WPDStatsManager_reportPLStats__block_invoke_cold_3((uint64_t)v12, v13);

      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_147_0);
        v14 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          __32__WPDStatsManager_reportPLStats__block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_145);
      v4 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        __32__WPDStatsManager_reportPLStats__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    objc_autoreleasePoolPop(v2);
  }

}

+ (id)getStringFromActivity:(unint64_t)a3
{
  if (a3)
    return CFSTR("WPDStatActivityAdvertise");
  else
    return CFSTR("WPDStatActivityScan");
}

- (void)startActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4 scanRate:(int64_t)a5
{
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12[3];
  unsigned __int8 v13;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPDStatsManager server](self, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serverQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__WPDStatsManager_startActivityAsync_forType_scanRate___block_invoke;
  block[3] = &unk_24D7C7B50;
  objc_copyWeak(v12, &location);
  v13 = a4;
  v12[1] = (id)a3;
  v12[2] = (id)a5;
  dispatch_async(v10, block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __55__WPDStatsManager_startActivityAsync_forType_scanRate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "startActivity:forType:scanRate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)startActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4
{
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10[2];
  unsigned __int8 v11;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPDStatsManager server](self, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__WPDStatsManager_startActivityAsync_forType___block_invoke;
  v9[3] = &unk_24D7C7B78;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  v11 = a4;
  dispatch_async(v8, v9);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __46__WPDStatsManager_startActivityAsync_forType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "startActivity:forType:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)stopActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4
{
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10[2];
  unsigned __int8 v11;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPDStatsManager server](self, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__WPDStatsManager_stopActivityAsync_forType___block_invoke;
  v9[3] = &unk_24D7C7B78;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  v11 = a4;
  dispatch_async(v8, v9);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __45__WPDStatsManager_stopActivityAsync_forType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "stopActivity:forType:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)stopActivityAsync:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8[2];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPDStatsManager server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WPDStatsManager_stopActivityAsync___block_invoke;
  block[3] = &unk_24D7C7BA0;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  dispatch_async(v6, block);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __37__WPDStatsManager_stopActivityAsync___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "stopActivity:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)resetActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4
{
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10[2];
  unsigned __int8 v11;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[WPDStatsManager server](self, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__WPDStatsManager_resetActivityAsync_forType___block_invoke;
  v9[3] = &unk_24D7C7B78;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  v11 = a4;
  dispatch_async(v8, v9);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __46__WPDStatsManager_resetActivityAsync_forType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "resetActivity:forType:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)scanArray
{
  return self->_scanArray;
}

- (void)setScanArray:(id)a3
{
  objc_storeStrong((id *)&self->_scanArray, a3);
}

- (void)setRegularScanArray:(id)a3
{
  objc_storeStrong((id *)&self->_regularScanArray, a3);
}

- (void)setAggressiveScanArray:(id)a3
{
  objc_storeStrong((id *)&self->_aggressiveScanArray, a3);
}

- (NSMutableArray)advertisingArray
{
  return self->_advertisingArray;
}

- (void)setAdvertisingArray:(id)a3
{
  objc_storeStrong((id *)&self->_advertisingArray, a3);
}

- (void)setResetScanArray:(unint64_t *)a3
{
  self->_resetScanArray = a3;
}

- (unint64_t)resetAdvertisingArray
{
  return self->_resetAdvertisingArray;
}

- (void)setResetAdvertisingArray:(unint64_t *)a3
{
  self->_resetAdvertisingArray = a3;
}

- (OS_dispatch_queue)reportQueue
{
  return self->_reportQueue;
}

- (void)setReportQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reportQueue, a3);
}

- (double)nextPushTime
{
  return self->_nextPushTime;
}

- (void)setNextPushTime:(double)a3
{
  self->_nextPushTime = a3;
}

- (BOOL)PLLogAvailable
{
  return self->_PLLogAvailable;
}

- (WPDaemonServer)server
{
  return (WPDaemonServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_reportQueue, 0);
  objc_storeStrong((id *)&self->_advertisingArray, 0);
  objc_storeStrong((id *)&self->_aggressiveScanArray, 0);
  objc_storeStrong((id *)&self->_regularScanArray, 0);
  objc_storeStrong((id *)&self->_scanArray, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)startActivity:(unsigned __int8)a1 forType:(NSObject *)a2 scanRate:.cold.1(unsigned __int8 a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 27;
  _os_log_error_impl(&dword_2175D1000, a2, OS_LOG_TYPE_ERROR, "WPClientType %ld beyond bounds WPClientMax = %ld", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __32__WPDStatsManager_reportPLStats__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a1, a3, "WPStatsManager skipped write to PL log (%{private}@)", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_0();
}

void __32__WPDStatsManager_reportPLStats__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a1, a3, "WPStatsManager denied write to PL log (%{private}@)", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_0();
}

void __32__WPDStatsManager_reportPLStats__block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138478083;
  v3 = CFSTR("WirelessProximity");
  v4 = 2113;
  v5 = a1;
  _os_log_debug_impl(&dword_2175D1000, a2, OS_LOG_TYPE_DEBUG, "WPStatsManager did write to PL log %{private}@ info:%{private}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end

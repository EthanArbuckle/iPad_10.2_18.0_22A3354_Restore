@implementation PowerUIBDCDataManager

- (PowerUIBDCDataManager)init
{
  PowerUIBDCDataManager *v2;
  os_log_t v3;
  OS_os_log *log;
  NSObject *v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *bdcCallbackSemaphore;
  uint64_t v8;
  NSMutableArray *dataQueue;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PowerUIBDCDataManager;
  v2 = -[PowerUIBDCDataManager init](&v12, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.powerui.smartcharging", "bdcDataManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "BDCDataManager intializing...", v11, 2u);
    }
    v2->_bdcDataLock._os_unfair_lock_opaque = 0;
    v6 = dispatch_semaphore_create(0);
    bdcCallbackSemaphore = v2->_bdcCallbackSemaphore;
    v2->_bdcCallbackSemaphore = (OS_dispatch_semaphore *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    dataQueue = v2->_dataQueue;
    v2->_dataQueue = (NSMutableArray *)v8;

  }
  return v2;
}

+ (PowerUIBDCDataManager)sharedInstance
{
  if (sharedInstance_once_1 != -1)
    dispatch_once(&sharedInstance_once_1, &__block_literal_global_15);
  return (PowerUIBDCDataManager *)(id)sharedInstance_instance_1;
}

void __39__PowerUIBDCDataManager_sharedInstance__block_invoke()
{
  PowerUIBDCDataManager *v0;
  void *v1;

  if (!sharedInstance_instance_1)
  {
    v0 = objc_alloc_init(PowerUIBDCDataManager);
    v1 = (void *)sharedInstance_instance_1;
    sharedInstance_instance_1 = (uint64_t)v0;

  }
}

- (BOOL)promptBDCToQueryState:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *bdcCallbackSemaphore;
  dispatch_time_t v7;
  intptr_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = a3;
  os_unfair_lock_lock(&self->_bdcDataLock);
  -[NSMutableArray addObject:](self->_dataQueue, "addObject:", v4);
  os_unfair_lock_unlock(&self->_bdcDataLock);
  -[PowerUIBDCDataManager log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_INFO, "Prompt BDC to record current state", buf, 2u);
  }

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.smartcharging.charging"), "UTF8String"));
  bdcCallbackSemaphore = self->_bdcCallbackSemaphore;
  v7 = dispatch_time(0, 5000000000);
  v8 = dispatch_semaphore_wait(bdcCallbackSemaphore, v7);
  -[PowerUIBDCDataManager log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PowerUIBDCDataManager promptBDCToQueryState:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    os_unfair_lock_lock(&self->_bdcDataLock);
    if (-[NSMutableArray count](self->_dataQueue, "count"))
      -[NSMutableArray removeObject:](self->_dataQueue, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_bdcDataLock);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_INFO, "BDC received current PowerUI state", v19, 2u);
    }

  }
  return v8 == 0;
}

- (id)bdcSemaphoreToUse
{
  return self->_bdcCallbackSemaphore;
}

- (id)getNextBDCDataDict
{
  os_unfair_lock_s *p_bdcDataLock;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  p_bdcDataLock = &self->_bdcDataLock;
  os_unfair_lock_lock(&self->_bdcDataLock);
  if (-[NSMutableArray count](self->_dataQueue, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_dataQueue, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_dataQueue, "removeObjectAtIndex:", 0);
    os_unfair_lock_unlock(p_bdcDataLock);
  }
  else
  {
    os_unfair_lock_unlock(p_bdcDataLock);
    -[PowerUIBDCDataManager log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PowerUIBDCDataManager getNextBDCDataDict].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    -[PowerUIBDCDataManager getBDCDataDictTemplate](self, "getBDCDataDictTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)getBDCDataDictTemplate
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24D443CF0, CFSTR("MessageVersion"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24D443D08, CFSTR("ChargingState"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24D443D08, CFSTR("InflowState"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24D443D08, CFSTR("ChargeLimit"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24D443D08, CFSTR("CheckPoint"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24D443D08, CFSTR("ModeOfOperation"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24D443D08, CFSTR("DecisionMaker"));
  return v2;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (os_unfair_lock_s)bdcDataLock
{
  return self->_bdcDataLock;
}

- (void)setBdcDataLock:(os_unfair_lock_s)a3
{
  self->_bdcDataLock = a3;
}

- (OS_dispatch_semaphore)bdcCallbackSemaphore
{
  return self->_bdcCallbackSemaphore;
}

- (void)setBdcCallbackSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_bdcCallbackSemaphore, a3);
}

- (NSMutableArray)dataQueue
{
  return self->_dataQueue;
}

- (void)setDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_bdcCallbackSemaphore, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)promptBDCToQueryState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_215A71000, a1, a3, "BDC Error: BDC timed out calling back for PowerUI state", a5, a6, a7, a8, 0);
}

- (void)getNextBDCDataDict
{
  OUTLINED_FUNCTION_5(&dword_215A71000, a1, a3, "Trying to access next BDC data dict, but none available", a5, a6, a7, a8, 0);
}

@end

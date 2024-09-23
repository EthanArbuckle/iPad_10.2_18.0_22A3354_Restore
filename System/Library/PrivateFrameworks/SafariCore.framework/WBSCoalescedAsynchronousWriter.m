@implementation WBSCoalescedAsynchronousWriter

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  return self;
}

- (id)_initWithName:(id)a3 fileURL:(id)a4 writerBlock:(id)a5 dataSourceQueue:(id)a6 dataSourceBlock:(id)a7 plistDictionarySourceBlock:(id)a8 plistFormat:(unint64_t)a9 writeDelayInterval:(double)a10 fileResourceValues:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  WBSCoalescedAsynchronousWriter *v23;
  WBSCoalescedAsynchronousWriter *v24;
  uint64_t v25;
  NSString *name;
  id v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *diskAccessQueue;
  uint64_t v30;
  id dataSourceBlock;
  uint64_t v32;
  id plistDictionarySourceBlock;
  id *p_dataSourceQueue;
  uint64_t v35;
  id writerBlock;
  id v37;
  dispatch_queue_t v38;
  OS_dispatch_queue *internalQueue;
  uint64_t v40;
  NSDictionary *fileResourceValues;
  WBSCoalescedAsynchronousWriter *v42;
  id v44;
  id v45;
  objc_super v46;

  v18 = a3;
  v45 = a4;
  v19 = a5;
  v44 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a11;
  v46.receiver = self;
  v46.super_class = (Class)WBSCoalescedAsynchronousWriter;
  v23 = -[WBSCoalescedAsynchronousWriter init](&v46, sel_init);
  v24 = v23;
  if (v23)
  {
    v25 = objc_msgSend(v18, "copy");
    name = v23->_name;
    v23->_name = (NSString *)v25;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.CoalescedAsynchronousWriter.%p.%@.DiskAccessQueue"), v23, v18, v44, v45);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = dispatch_queue_create((const char *)objc_msgSend(v27, "UTF8String"), 0);
    diskAccessQueue = v23->_diskAccessQueue;
    v23->_diskAccessQueue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v23->_fileURL, a4);
    v30 = objc_msgSend(v20, "copy");
    dataSourceBlock = v23->_dataSourceBlock;
    v23->_dataSourceBlock = (id)v30;

    v32 = objc_msgSend(v21, "copy");
    plistDictionarySourceBlock = v23->_plistDictionarySourceBlock;
    v23->_plistDictionarySourceBlock = (id)v32;

    v23->_plistFormat = a9;
    p_dataSourceQueue = (id *)&v23->_dataSourceQueue;
    objc_storeStrong(p_dataSourceQueue, a6);
    if (!v24->_dataSourceQueue)
      objc_storeStrong(p_dataSourceQueue, MEMORY[0x1E0C80D38]);
    v35 = objc_msgSend(v19, "copy");
    writerBlock = v24->_writerBlock;
    v24->_writerBlock = (id)v35;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.CoalescedAsynchronousWriter.%p.%@.InternalQueue"), v24, v18);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38 = dispatch_queue_create((const char *)objc_msgSend(v37, "UTF8String"), 0);
    internalQueue = v24->_internalQueue;
    v24->_internalQueue = (OS_dispatch_queue *)v38;

    v24->_writeDelayInterval = a10;
    v40 = objc_msgSend(v22, "copy");
    fileResourceValues = v24->_fileResourceValues;
    v24->_fileResourceValues = (NSDictionary *)v40;

    v42 = v24;
  }

  return v24;
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceQueue:(id)a5 dataSourceBlock:(id)a6
{
  return (WBSCoalescedAsynchronousWriter *)-[WBSCoalescedAsynchronousWriter _initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:writeDelayInterval:fileResourceValues:](self, "_initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:writeDelayInterval:fileResourceValues:", a3, a4, 0, a5, a6, 0, 10.0);
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceQueue:(id)a5 plistFormat:(unint64_t)a6 plistDictionarySourceBlock:(id)a7
{
  return (WBSCoalescedAsynchronousWriter *)-[WBSCoalescedAsynchronousWriter _initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:plistDictionarySourceBlock:plistFormat:writeDelayInterval:fileResourceValues:](self, "_initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:plistDictionarySourceBlock:plistFormat:writeDelayInterval:fileResourceValues:", a3, a4, 0, a5, 0, a7, 10.0, a6, 0);
}

- (id)_initWithName:(id)a3 fileURL:(id)a4 writerBlock:(id)a5 dataSourceQueue:(id)a6 dataSourceBlock:(id)a7 writeDelayInterval:(double)a8 fileResourceValues:(id)a9
{
  return -[WBSCoalescedAsynchronousWriter _initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:plistDictionarySourceBlock:plistFormat:writeDelayInterval:fileResourceValues:](self, "_initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:plistDictionarySourceBlock:plistFormat:writeDelayInterval:fileResourceValues:", a3, a4, a5, a6, a7, 0, a8, 200, a9);
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceQueue:(id)a5 dataSourceBlock:(id)a6 fileResourceValues:(id)a7
{
  return (WBSCoalescedAsynchronousWriter *)-[WBSCoalescedAsynchronousWriter _initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:writeDelayInterval:fileResourceValues:](self, "_initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:writeDelayInterval:fileResourceValues:", a3, a4, 0, a5, a6, a7, 10.0);
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceBlock:(id)a5
{
  return -[WBSCoalescedAsynchronousWriter initWithName:fileURL:dataSourceQueue:dataSourceBlock:](self, "initWithName:fileURL:dataSourceQueue:dataSourceBlock:", a3, a4, MEMORY[0x1E0C80D38], a5);
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 fileURL:(id)a4 dataSourceBlock:(id)a5 writeDelayInterval:(double)a6
{
  return (WBSCoalescedAsynchronousWriter *)-[WBSCoalescedAsynchronousWriter _initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:writeDelayInterval:fileResourceValues:](self, "_initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:writeDelayInterval:fileResourceValues:", a3, a4, 0, MEMORY[0x1E0C80D38], a5, 0, a6);
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 writerBlock:(id)a4 dataSourceBlock:(id)a5
{
  return -[WBSCoalescedAsynchronousWriter initWithName:writerBlock:dataSourceQueue:dataSourceBlock:](self, "initWithName:writerBlock:dataSourceQueue:dataSourceBlock:", a3, a4, MEMORY[0x1E0C80D38], a5);
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 writerBlock:(id)a4 dataSourceQueue:(id)a5 dataSourceBlock:(id)a6
{
  return (WBSCoalescedAsynchronousWriter *)-[WBSCoalescedAsynchronousWriter _initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:writeDelayInterval:fileResourceValues:](self, "_initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:writeDelayInterval:fileResourceValues:", a3, 0, a4, a5, a6, 0, 10.0);
}

- (WBSCoalescedAsynchronousWriter)initWithName:(id)a3 writerBlock:(id)a4 dataSourceQueue:(id)a5 plistFormat:(unint64_t)a6 plistDictionarySourceBlock:(id)a7
{
  return (WBSCoalescedAsynchronousWriter *)-[WBSCoalescedAsynchronousWriter _initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:plistDictionarySourceBlock:plistFormat:writeDelayInterval:fileResourceValues:](self, "_initWithName:fileURL:writerBlock:dataSourceQueue:dataSourceBlock:plistDictionarySourceBlock:plistFormat:writeDelayInterval:fileResourceValues:", a3, 0, a4, a5, 0, a7, 10.0, a6, 0);
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B2621000, v0, v1, "WBSCoalescedAsynchronousWriter <%{public}@, %p>: Writer is not properly cleaned up before deallocation", v2);
}

- (void)_invalidateTimer
{
  NSObject *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)_timerFired
{
  NSObject *dataSourceQueue;
  _QWORD block[5];

  -[WBSCoalescedAsynchronousWriter _invalidateTimer](self, "_invalidateTimer");
  if (self->_writeGroup)
  {
    -[WBSCoalescedAsynchronousWriter _scheduleTimer](self, "_scheduleTimer");
  }
  else
  {
    dataSourceQueue = self->_dataSourceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__WBSCoalescedAsynchronousWriter__timerFired__block_invoke;
    block[3] = &unk_1E649A460;
    block[4] = self;
    dispatch_async(dataSourceQueue, block);
  }
}

void __45__WBSCoalescedAsynchronousWriter__timerFired__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_dataFromDataSourceOnDataSourceQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_plistDictionaryFromDataSourceOnDataSourceQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__WBSCoalescedAsynchronousWriter__timerFired__block_invoke_2;
  block[3] = &unk_1E649A6B0;
  block[4] = v4;
  v9 = v2;
  v10 = v3;
  v6 = v3;
  v7 = v2;
  dispatch_async(v5, block);

}

uint64_t __45__WBSCoalescedAsynchronousWriter__timerFired__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_asynchronouslyWriteData:orPlistDictionary:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)_scheduleTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_internalQueue);
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  v6 = dispatch_walltime(0, (uint64_t)(self->_writeDelayInterval * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_writeDelayInterval * 0.1 * 1000000000.0));
  objc_initWeak(&location, self);
  v7 = self->_timer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__WBSCoalescedAsynchronousWriter__scheduleTimer__block_invoke;
  v8[3] = &unk_1E649BB00;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_timer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__WBSCoalescedAsynchronousWriter__scheduleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerFired");

}

- (id)_dataFromDataSourceOnDataSourceQueue
{
  void (**dataSourceBlock)(_QWORD, _QWORD);

  dataSourceBlock = (void (**)(_QWORD, _QWORD))self->_dataSourceBlock;
  if (dataSourceBlock)
  {
    ((void (**)(_QWORD, SEL))dataSourceBlock)[2](dataSourceBlock, a2);
    dataSourceBlock = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return dataSourceBlock;
}

- (id)_plistDictionaryFromDataSourceOnDataSourceQueue
{
  void (**plistDictionarySourceBlock)(_QWORD, _QWORD);

  plistDictionarySourceBlock = (void (**)(_QWORD, _QWORD))self->_plistDictionarySourceBlock;
  if (plistDictionarySourceBlock)
  {
    ((void (**)(_QWORD, SEL))plistDictionarySourceBlock)[2](plistDictionarySourceBlock, a2);
    plistDictionarySourceBlock = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return plistDictionarySourceBlock;
}

- (id)_dataForPlistDictionary:(id)a3
{
  id v4;
  unint64_t plistFormat;
  void *v6;
  id v7;
  NSObject *v8;
  NSString *name;
  void *v11;
  id v12;
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  WBSCoalescedAsynchronousWriter *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    plistFormat = self->_plistFormat;
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, plistFormat, 0, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (!v6)
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        objc_msgSend(v7, "safari_privacyPreservingDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v14 = name;
        v15 = 2048;
        v16 = self;
        v17 = 2114;
        v18 = v11;
        _os_log_error_impl(&dword_1B2621000, v8, OS_LOG_TYPE_ERROR, "WBSCoalescedAsynchronousWriter <%{public}@, %p>: Unable to serialize dictionary to data with error: %{public}@", buf, 0x20u);

      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_synchronousDataOnDataSourceQueue
{
  void *v3;
  void *v4;

  if (self->_dataSourceBlock)
  {
    -[WBSCoalescedAsynchronousWriter _dataFromDataSourceOnDataSourceQueue](self, "_dataFromDataSourceOnDataSourceQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WBSCoalescedAsynchronousWriter _plistDictionaryFromDataSourceOnDataSourceQueue](self, "_plistDictionaryFromDataSourceOnDataSourceQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCoalescedAsynchronousWriter _dataForPlistDictionary:](self, "_dataForPlistDictionary:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_waitForWriteCompletion
{
  NSObject *writeGroup;
  OS_dispatch_group *v4;

  writeGroup = self->_writeGroup;
  if (writeGroup)
  {
    dispatch_group_wait(writeGroup, 0xFFFFFFFFFFFFFFFFLL);
    v4 = self->_writeGroup;
    self->_writeGroup = 0;

  }
}

- (void)_writeData:(id)a3
{
  id v4;
  void (**writerBlock)(id, id);
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSURL *fileURL;
  NSDictionary *fileResourceValues;
  BOOL v12;
  id v13;
  NSObject *v14;
  NSString *name;
  void *v16;
  id WeakRetained;
  id v18;
  uint8_t buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    writerBlock = (void (**)(id, id))self->_writerBlock;
    if (writerBlock)
    {
      writerBlock[2](writerBlock, v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByDeletingLastPathComponent](self->_fileURL, "URLByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v6, "safari_ensureDirectoryExists:", v7);

      objc_msgSend(v4, "writeToURL:atomically:", self->_fileURL, 1);
      if (-[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("SessionState")))
      {
        v9 = WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_INFO, "Writing LastSession.plist file.", buf, 2u);
        }
      }
      if (-[NSDictionary count](self->_fileResourceValues, "count"))
      {
        fileURL = self->_fileURL;
        fileResourceValues = self->_fileResourceValues;
        v18 = 0;
        v12 = -[NSURL setResourceValues:error:](fileURL, "setResourceValues:error:", fileResourceValues, &v18);
        v13 = v18;
        if (!v12)
        {
          v14 = (id)WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            name = self->_name;
            objc_msgSend(v13, "safari_privacyPreservingDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSCoalescedAsynchronousWriter _writeData:].cold.1((uint64_t)name, v16, (uint64_t)buf, v14);
          }

        }
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "coalescedAsynchronousWriter:didFinishWritingData:", self, v4);

  }
}

- (void)_asynchronouslyWriteData:(id)a3 orPlistDictionary:(id)a4 completionHandler:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  OS_dispatch_group *v12;
  OS_dispatch_group *writeGroup;
  NSObject *v14;
  NSObject *diskAccessQueue;
  _QWORD v16[4];
  id v17;
  WBSCoalescedAsynchronousWriter *v18;
  id v19;
  id v20;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  v11 = v10;
  if (v8 | v9)
  {
    v12 = (OS_dispatch_group *)dispatch_group_create();
    writeGroup = self->_writeGroup;
    self->_writeGroup = v12;

    v14 = self->_writeGroup;
    diskAccessQueue = self->_diskAccessQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __95__WBSCoalescedAsynchronousWriter__asynchronouslyWriteData_orPlistDictionary_completionHandler___block_invoke;
    v16[3] = &unk_1E649BB28;
    v17 = (id)v8;
    v18 = self;
    v19 = (id)v9;
    v20 = v11;
    dispatch_group_async(v14, diskAccessQueue, v16);

  }
  else if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
  }

}

void __95__WBSCoalescedAsynchronousWriter__asynchronouslyWriteData_orPlistDictionary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "_writeData:", v3);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(NSObject **)(v4 + 72);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __95__WBSCoalescedAsynchronousWriter__asynchronouslyWriteData_orPlistDictionary_completionHandler___block_invoke_2;
    v9[3] = &unk_1E649A640;
    v9[4] = v4;
    v10 = *(id *)(a1 + 56);
    dispatch_async(v5, v9);

    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "_dataForPlistDictionary:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_4;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = 0;

  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(void))(v8 + 16))();
}

uint64_t __95__WBSCoalescedAsynchronousWriter__asynchronouslyWriteData_orPlistDictionary_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 112))
  {
    v2 = result;
    if (!*(_QWORD *)(v1 + 80))
    {
      std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(v1 + 104), 0);
      v1 = *(_QWORD *)(v2 + 32);
    }
    v3 = *(void **)(v1 + 96);
    *(_QWORD *)(v1 + 96) = 0;

    result = *(_QWORD *)(v2 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_cancelPendingWriteSynchronouslyLeavingSuddenTerminationIntact
{
  NSObject *v3;
  NSString *name;
  int v5;
  NSString *v6;
  __int16 v7;
  WBSCoalescedAsynchronousWriter *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_done)
  {
    self->_done = 1;
    -[WBSCoalescedAsynchronousWriter _waitForWriteCompletion](self, "_waitForWriteCompletion");
    -[WBSCoalescedAsynchronousWriter _invalidateTimer](self, "_invalidateTimer");
    v3 = WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      name = self->_name;
      v5 = 138543618;
      v6 = name;
      v7 = 2048;
      v8 = self;
      _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_INFO, "WBSCoalescedAsynchronousWriter <%{public}@, %p>: Done with writer", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)scheduleWrite
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WBSCoalescedAsynchronousWriter_scheduleWrite__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

_BYTE *__47__WBSCoalescedAsynchronousWriter_scheduleWrite__block_invoke(uint64_t a1)
{
  _BYTE *result;
  SafariShared::SuddenTerminationDisabler *v3;

  result = *(_BYTE **)(a1 + 32);
  if (!result[112])
  {
    objc_msgSend(result, "_invalidateTimer");
    v3 = (SafariShared::SuddenTerminationDisabler *)operator new();
    SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(v3, CFSTR("com.apple.SafariShared.CoalescedAsynchronousWriter"));
    std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(_QWORD *)(a1 + 32) + 104), (id *)v3);
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_scheduleTimer");
  }
  return result;
}

- (void)startScheduledWriteNow
{
  -[WBSCoalescedAsynchronousWriter startScheduledWriteNowWithCompletionHandler:](self, "startScheduledWriteNowWithCompletionHandler:", 0);
}

- (void)startScheduledWriteNowWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSCoalescedAsynchronousWriter_startScheduledWriteNowWithCompletionHandler___block_invoke;
  block[3] = &unk_1E649A640;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __78__WBSCoalescedAsynchronousWriter_startScheduledWriteNowWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 112) || !*(_QWORD *)(v2 + 80))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
  else
  {
    objc_msgSend((id)v2, "_invalidateTimer");
    objc_msgSend(*(id *)(a1 + 32), "_waitForWriteCompletion");
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_dataFromDataSourceOnDataSourceQueue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_plistDictionaryFromDataSourceOnDataSourceQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_asynchronouslyWriteData:orPlistDictionary:completionHandler:", v6, v5, *(_QWORD *)(a1 + 40));

  }
}

- (void)performScheduledWriteSynchronously
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__WBSCoalescedAsynchronousWriter_performScheduledWriteSynchronously__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __68__WBSCoalescedAsynchronousWriter_performScheduledWriteSynchronously__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 112))
  {
    if (*(_QWORD *)(v2 + 80))
    {
      objc_msgSend((id)v2, "_invalidateTimer");
      objc_msgSend(*(id *)(a1 + 32), "_waitForWriteCompletion");
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(NSObject **)(v3 + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__WBSCoalescedAsynchronousWriter_performScheduledWriteSynchronously__block_invoke_2;
      block[3] = &unk_1E649A460;
      block[4] = v3;
      dispatch_sync(v4, block);
    }
  }
}

void __68__WBSCoalescedAsynchronousWriter_performScheduledWriteSynchronously__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_synchronousDataOnDataSourceQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_writeData:");

}

- (void)completePendingWriteSynchronously
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSCoalescedAsynchronousWriter_completePendingWriteSynchronously__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

id *__67__WBSCoalescedAsynchronousWriter_completePendingWriteSynchronously__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[10];
  objc_msgSend(v2, "_cancelPendingWriteSynchronouslyLeavingSuddenTerminationIntact");
  v4 = *(_QWORD *)(a1 + 32);
  if (v3 && (*(_QWORD *)(v4 + 32) || *(_QWORD *)(v4 + 56)))
  {
    v5 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__WBSCoalescedAsynchronousWriter_completePendingWriteSynchronously__block_invoke_2;
    block[3] = &unk_1E649A460;
    block[4] = v4;
    dispatch_sync(v5, block);
    v4 = *(_QWORD *)(a1 + 32);
  }
  return std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(v4 + 104), 0);
}

void __67__WBSCoalescedAsynchronousWriter_completePendingWriteSynchronously__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_synchronousDataOnDataSourceQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_writeData:");

}

- (void)cancelPendingWriteSynchronously
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WBSCoalescedAsynchronousWriter_cancelPendingWriteSynchronously__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

id *__65__WBSCoalescedAsynchronousWriter_cancelPendingWriteSynchronously__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelPendingWriteSynchronouslyLeavingSuddenTerminationIntact");
  return std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(_QWORD *)(a1 + 32) + 104), 0);
}

- (WBSCoalescedAsynchronousWriterDelegate)delegate
{
  return (WBSCoalescedAsynchronousWriterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_suddenTerminationDisabler, 0);
  objc_storeStrong((id *)&self->_writeGroup, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_plistDictionarySourceBlock, 0);
  objc_storeStrong((id *)&self->_fileResourceValues, 0);
  objc_storeStrong((id *)&self->_dataSourceQueue, 0);
  objc_storeStrong(&self->_dataSourceBlock, 0);
  objc_storeStrong(&self->_writerBlock, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_diskAccessQueue, 0);
}

- (void)_writeData:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_1(&dword_1B2621000, a4, a3, "Error setting file resource values for %{public}@: %{public}@", (uint8_t *)a3);

}

@end

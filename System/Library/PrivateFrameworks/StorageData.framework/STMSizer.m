@implementation STMSizer

+ (id)sharedAppSizer
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__STMSizer_Apps__sharedAppSizer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAppSizer_onceToken != -1)
    dispatch_once(&sharedAppSizer_onceToken, block);
  return (id)sharedAppSizer__gSizer;
}

void __32__STMSizer_Apps__sharedAppSizer__block_invoke(uint64_t a1)
{
  STMSizer *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = -[STMSizer initWithPrefsKey:]([STMSizer alloc], "initWithPrefsKey:", CFSTR("AppSizes"));
  v3 = (void *)sharedAppSizer__gSizer;
  sharedAppSizer__gSizer = (uint64_t)v2;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("/private/var/containers/"), CFSTR("/private/var/mobile/Containers/"), CFSTR("/private/var/PersonaVolumes"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  +[STAppOverrides overrides](STAppOverrides, "overrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listOfUsedPathsInOverrides:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v6);

  objc_msgSend((id)sharedAppSizer__gSizer, "setRootPaths:", v7);
}

- (id)containersForApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userVisible"))
  {
    objc_msgSend(v3, "appContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "addObject:", v5);
    objc_msgSend(v3, "dataContainers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v6);
    objc_msgSend(v3, "sharedContainers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v7);

  }
  return v4;
}

- (void)addApp:(id)a3
{
  id v4;
  id v5;

  -[STMSizer containersForApp:](self, "containersForApp:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[STMSizer addContainers:](self, "addContainers:", v5);

}

- (void)addApps:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4 * objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        -[STMSizer containersForApp:](self, "containersForApp:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  +[STContainer containersWithClass:personaUniqueString:](STContainer, "containersWithClass:personaUniqueString:", 4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v12);
  v24 = v12;
  -[STMSizer addContainers:](self, "addContainers:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "itemPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length"))
        {
          v20 = (void *)MEMORY[0x24BDBCF48];
          objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("Library/Caches/"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "fileURLWithPath:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v25, "addObject:", v22);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v16);
  }

  v23 = -[STMSizer addURLs:usingFastSizingIfPossible:](self, "addURLs:usingFastSizingIfPossible:", v25, 1);
}

- (void)reloadAppContainer:(id)a3
{
  void *v4;
  void *v5;
  STMSizeCacheEntry *v6;
  id v7;

  objc_msgSend(a3, "appContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = -[STMSizeCacheEntry initWithContainer:]([STMSizeCacheEntry alloc], "initWithContainer:", v7);
    -[STMSizeCache addItem:](self, "addItem:", v6);
    -[STMSizeCacheEntry calculateSize](v6, "calculateSize");

  }
}

+ (id)listOfUsedPathsInOverrides:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "includeFsPaths");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (STMSizer)initWithPrefsKey:(id)a3
{
  STMSizer *v3;
  STMSizer *v4;
  uint64_t v5;
  NSMutableDictionary *pendingEventsByPath;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)STMSizer;
  v3 = -[STMSizeCache initWithPrefsKey:](&v16, sel_initWithPrefsKey_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_pendingEventsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    pendingEventsByPath = v4->_pendingEventsByPath;
    v4->_pendingEventsByPath = (NSMutableDictionary *)v5;

    if (!_gSharedFSQueue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_queue_create("fsevtQ", v8);
      v10 = (void *)_gSharedFSQueue;
      _gSharedFSQueue = (uint64_t)v9;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("updateQ", v12);
      v14 = (void *)_gSharedUpdateQueue;
      _gSharedUpdateQueue = (uint64_t)v13;

    }
  }
  return v4;
}

- (void)dealloc
{
  STMSizer *v2;
  uint64_t fsStream;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  NSObject *v12;
  objc_super v13;
  _QWORD block[4];
  dispatch_semaphore_t v15;

  v2 = self;
  objc_sync_enter(v2);
  fsStream = (uint64_t)v2->_fsStream;
  if (fsStream)
  {
    FSEventStreamGetLatestEventId(v2->_fsStream);
    STLog(1, CFSTR("Stop <FSEventStream: %p> at #%llu"), v4, v5, v6, v7, v8, v9, fsStream);
    FSEventStreamStop(v2->_fsStream);
    FSEventStreamInvalidate(v2->_fsStream);
    FSEventStreamRelease(v2->_fsStream);
    v2->_fsStream = 0;
  }
  objc_sync_exit(v2);

  v10 = dispatch_semaphore_create(0);
  v11 = _gSharedUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__STMSizer_dealloc__block_invoke;
  block[3] = &unk_24C75F658;
  v15 = v10;
  v12 = v10;
  dispatch_async(v11, block);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  v13.receiver = v2;
  v13.super_class = (Class)STMSizer;
  -[STMSizeCache dealloc](&v13, sel_dealloc);
}

intptr_t __19__STMSizer_dealloc__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setRootPaths:(id)a3
{
  id v4;
  STMSizer *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 streamRunning;
  uint64_t fsStream;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  FSEventStreamEventId v34;
  FSEventStreamRef v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  FSEventStreamContext context;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "count");
  STLog(1, CFSTR("Recreating FSEventStream, -setRootPaths called with %ld paths"), v7, v8, v9, v10, v11, v12, v6);
  streamRunning = v5->_streamRunning;
  fsStream = (uint64_t)v5->_fsStream;
  if (fsStream)
  {
    FSEventStreamGetLatestEventId(v5->_fsStream);
    STLog(1, CFSTR("Stop <FSEventStream: %p> at #%llu"), v21, v22, v23, v24, v25, v26, fsStream);
    FSEventStreamStop(v5->_fsStream);
    FSEventStreamInvalidate(v5->_fsStream);
    FSEventStreamRelease(v5->_fsStream);
    v5->_fsStream = 0;
    v5->_streamRunning = 0;
  }
  else
  {
    STLog(1, CFSTR("\tNo FSEventStream to stop"), v13, v14, v15, v16, v17, v18, v49);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v28 = v4;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v52 != v30)
          objc_enumerationMutation(v28);
        STMakeDirPath(*(void **)(*((_QWORD *)&v51 + 1) + 8 * i));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v32);

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v29);
  }

  objc_storeStrong((id *)&v5->_rootPaths, v27);
  if (objc_msgSend(v27, "count"))
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = v5;
    v33 = -[STMSizeCache cacheEventID](v5, "cacheEventID");
    if (v33)
      v34 = v33;
    else
      v34 = -1;
    v35 = FSEventStreamCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (FSEventStreamCallback)_FSEventStreamCallback, &context, (CFArrayRef)v27, v34, 1.0, 0x10u);
    v5->_fsStream = v35;
    -[STMSizeCache cacheEventID](v5, "cacheEventID");
    STLog(1, CFSTR("\tNew <FSEventStream: %p> at #%llu"), v36, v37, v38, v39, v40, v41, (uint64_t)v35);
    FSEventStreamSetDispatchQueue(v5->_fsStream, (dispatch_queue_t)_gSharedFSQueue);
    if (streamRunning)
    {
      v42 = (uint64_t)v5->_fsStream;
      -[STMSizeCache cacheEventID](v5, "cacheEventID");
      STLog(1, CFSTR("Starting <FSEventStream: %p> at #%llu"), v43, v44, v45, v46, v47, v48, v42);
      FSEventStreamStart(v5->_fsStream);
      v5->_streamRunning = 1;
    }
  }

  objc_sync_exit(v5);
}

- (void)startSizer
{
  STMSizer *v2;
  uint64_t fsStream;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  STMSizer *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  fsStream = (uint64_t)obj->_fsStream;
  if (fsStream)
  {
    FSEventStreamGetLatestEventId(obj->_fsStream);
    STLog(1, CFSTR("Starting <FSEventStream: %p> at #%llu"), v4, v5, v6, v7, v8, v9, fsStream);
    FSEventStreamStart(obj->_fsStream);
    v2 = obj;
    obj->_streamRunning = 1;
  }
  objc_sync_exit(v2);

}

- (void)stopSizer
{
  STMSizer *v2;
  uint64_t fsStream;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  STMSizer *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  fsStream = (uint64_t)obj->_fsStream;
  if (fsStream)
  {
    FSEventStreamGetLatestEventId(obj->_fsStream);
    STLog(1, CFSTR("Stop <FSEventStream: %p> at #%llu"), v4, v5, v6, v7, v8, v9, fsStream);
    FSEventStreamStop(obj->_fsStream);
    v2 = obj;
    obj->_streamRunning = 0;
  }
  objc_sync_exit(v2);

}

- (void)processPendingEvents
{
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingEventsByPath;
  id v5;

  if (-[NSMutableDictionary count](self->_pendingEventsByPath, "count"))
  {
    os_unfair_lock_lock(&self->_pendingEventsLock);
    v5 = (id)-[NSMutableDictionary copy](self->_pendingEventsByPath, "copy");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    pendingEventsByPath = self->_pendingEventsByPath;
    self->_pendingEventsByPath = v3;

    os_unfair_lock_unlock(&self->_pendingEventsLock);
    -[STMSizeCache updateLastCacheEventID:](self, "updateLastCacheEventID:", -[STMSizeCache processCacheEvents:](self, "processCacheEvents:", v5));

  }
}

- (void)_asyncProcessPendingEvents:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__STMSizer__asyncProcessPendingEvents___block_invoke;
  block[3] = &unk_24C75F658;
  block[4] = self;
  dispatch_async((dispatch_queue_t)_gSharedUpdateQueue, block);
}

uint64_t __39__STMSizer__asyncProcessPendingEvents___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processPendingEvents");
}

- (void)setEvent:(id)a3 forItem:(id)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a4, "itemPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "evtID");
  -[NSMutableDictionary objectForKey:](self->_pendingEventsByPath, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || objc_msgSend(v8, "evtID") <= v7)
    -[NSMutableDictionary setObject:forKey:](self->_pendingEventsByPath, "setObject:forKey:", v10, v6);

}

- (void)processEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id obj;
  _QWORD block[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_pendingEventsLock);
  v5 = objc_msgSend(v4, "count");
  STLog(1, CFSTR("Processing %ld STMSizeCacheEvent"), v6, v7, v8, v9, v10, v11, v5);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v4;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v16, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "flags") & 1) != 0)
        {
          -[STMSizeCache itemsContainedByPath:](self, "itemsContainedByPath:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = CFSTR("FSEvents triggering deep rescan at %@, invalidating %lu cache entries");
LABEL_10:
          objc_msgSend(v18, "count");
          STLog(4, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v17);
          goto LABEL_11;
        }
        -[STMSizeCache itemsContainingPath:](self, "itemsContainingPath:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("FSEvent at %@ is invalidating %lu cache entries containing it");
        if ((unint64_t)objc_msgSend(v18, "count") >= 0xB)
          goto LABEL_10;
LABEL_11:
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v26 = v18;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v34 != v29)
                objc_enumerationMutation(v26);
              -[STMSizer setEvent:forItem:](self, "setEvent:forItem:", v16, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v28);
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(&self->_pendingEventsLock);
  if (-[NSMutableDictionary count](self->_pendingEventsByPath, "count"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__STMSizer_processEvents___block_invoke;
    block[3] = &unk_24C75F658;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __26__STMSizer_processEvents___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__asyncProcessPendingEvents_, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__asyncProcessPendingEvents_, 0, 0.1);
}

- (void)flushCacheAsynchronously
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_streamRunning)
  {
    FSEventStreamFlushAsync(self->_fsStream);
    STLog(1, CFSTR("Flushing <FSEventStream: %p> asynchronously, latest event id passed: %llu"), v3, v4, v5, v6, v7, v8, (uint64_t)self->_fsStream);
  }
}

- (NSArray)rootPaths
{
  return self->_rootPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPaths, 0);
  objc_storeStrong((id *)&self->_pendingEventsByPath, 0);
}

- (id)addURL:(id)a3
{
  return -[STMSizer addURL:usingFastSizingIfPossible:](self, "addURL:usingFastSizingIfPossible:", a3, 0);
}

- (id)addURL:(id)a3 usingFastSizingIfPossible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  STMSizeCacheEntry *v8;
  void *v9;
  uint64_t v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMSizeCache itemForPath:](self, "itemForPath:", v7);
  v8 = (STMSizeCacheEntry *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[STMSizeCacheEntry setItem:](v8, "setItem:", v6);
    -[STMSizeCacheEntry itemSize](v8, "itemSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = 3;
    else
      v10 = 0;
    -[STMSizeCacheEntry setStatus:](v8, "setStatus:", v10);

  }
  else
  {
    v8 = -[STMSizeCacheEntry initWithURL:usingFastSizingIfPossible:]([STMSizeCacheEntry alloc], "initWithURL:usingFastSizingIfPossible:", v6, v4);
    if (v8)
      -[STMSizeCache addItem:](self, "addItem:", v8);
  }

  return v8;
}

- (id)addURLs:(id)a3
{
  return -[STMSizer addURLs:usingFastSizingIfPossible:](self, "addURLs:usingFastSizingIfPossible:", a3, 0);
}

- (id)addURLs:(id)a3 usingFastSizingIfPossible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[STMSizer addURL:usingFastSizingIfPossible:](self, "addURL:usingFastSizingIfPossible:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v4, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)sizeForURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMSizeCache sizeOfItemForPath:](self, "sizeOfItemForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updatedSizeForURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMSizeCache updatedSizeOfItemForPath:](self, "updatedSizeOfItemForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathOfContainer:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cachePathOfContainer:(id)a3
{
  void *v3;
  void *v4;

  -[STMSizer pathOfContainer:](self, "pathOfContainer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library/Caches/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)addContainer:(id)a3
{
  id v4;
  void *v5;
  STMSizeCacheEntry *v6;

  v4 = a3;
  -[STMSizer pathOfContainer:](self, "pathOfContainer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[STMSizeCacheEntry initWithContainer:]([STMSizeCacheEntry alloc], "initWithContainer:", v4);
    -[STMSizeCache addItem:](self, "addItem:", v6);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)addContainers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[STMSizer addContainer:](self, "addContainer:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)sizeForContainer:(id)a3
{
  void *v4;
  void *v5;

  -[STMSizer pathOfContainer:](self, "pathOfContainer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMSizeCache sizeOfItemForPath:](self, "sizeOfItemForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updatedSizeForContainer:(id)a3
{
  void *v4;
  void *v5;

  -[STMSizer pathOfContainer:](self, "pathOfContainer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMSizeCache updatedSizeOfItemForPath:](self, "updatedSizeOfItemForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cacheSizeForContainer:(id)a3
{
  void *v4;
  void *v5;

  -[STMSizer cachePathOfContainer:](self, "cachePathOfContainer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMSizeCache sizeOfItemForPath:](self, "sizeOfItemForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updatedCacheSizeForContainer:(id)a3
{
  void *v4;
  void *v5;

  -[STMSizer cachePathOfContainer:](self, "cachePathOfContainer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMSizeCache updatedSizeOfItemForPath:](self, "updatedSizeOfItemForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)containersWithClass:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[STContainer containersWithClass:personaUniqueString:](STContainer, "containersWithClass:personaUniqueString:", 7, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

@end

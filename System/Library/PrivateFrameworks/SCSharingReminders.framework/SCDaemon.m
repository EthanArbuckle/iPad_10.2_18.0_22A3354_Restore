@implementation SCDaemon

+ (id)sharedDaemon
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__SCDaemon_sharedDaemon__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemon_onceToken != -1)
    dispatch_once(&sharedDaemon_onceToken, block);
  return (id)sharedDaemon___sharedDaemon;
}

void __24__SCDaemon_sharedDaemon__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDaemon___sharedDaemon;
  sharedDaemon___sharedDaemon = (uint64_t)v1;

}

- (SCDaemon)init
{
  SCDaemon *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCDaemon;
  v2 = -[SCDaemon init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.safetycheckd.queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)start
{
  -[SCDaemon wakeXPCListeners](self, "wakeXPCListeners");
  -[SCDaemon registerXPCEventHandlers](self, "registerXPCEventHandlers");
  -[SCDaemon registerBackgroundSystemTasks](self, "registerBackgroundSystemTasks");
}

- (void)wakeXPCListeners
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[SCDaemon XPCListenerPairs](self, "XPCListenerPairs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "first");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resume");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[SCDaemon setActiveXPCListenerPairs:](self, "setActiveXPCListenerPairs:", v3);

}

- (void)registerXPCEventHandlers
{
  void *v3;
  NSObject *workQueue;
  id v5;
  _QWORD handler[4];
  id v7;

  -[SCDaemon _listenersByEventName](self, "_listenersByEventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __36__SCDaemon_registerXPCEventHandlers__block_invoke;
  handler[3] = &unk_2516629F0;
  v7 = v3;
  v5 = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", workQueue, handler);

}

void __36__SCDaemon_registerXPCEventHandlers__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF50]));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "handleXPCEventWithName:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)registerBackgroundSystemTasks
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SCDaemon backgroundSystemTasks](self, "backgroundSystemTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[SCDaemon workQueue](self, "workQueue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "registerForTaskUsingQueue:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_listenersByEventName
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SCDaemon notifyDListeners](self, "notifyDListeners");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "interestedEvents");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v18 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
              objc_msgSend(v3, "objectForKey:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v12)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKey:", v12, v11);
              }
              objc_msgSend(v12, "addObject:", v5);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v8);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

  return v3;
}

- (NSArray)XPCListenerPairs
{
  SCSharingReminderDelegate *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  const __CFString *v20;
  _QWORD v21[3];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v20 = CFSTR("com.apple.safetycheckd");
  v2 = objc_alloc_init(SCSharingReminderDelegate);
  v21[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v9);
        objc_msgSend(v11, "setDelegate:", v10);
        +[SCPair pairWithFirst:second:](SCPair, "pairWithFirst:second:", v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSArray *)v4;
}

- (NSArray)notifyDListeners
{
  SCSharingReminderXPCService *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(SCSharingReminderXPCService);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)backgroundSystemTasks
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  +[SCSharingReminderXPCService tasks](SCSharingReminderXPCService, "tasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return (NSArray *)v2;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSArray)activeXPCListenerPairs
{
  return self->_activeXPCListenerPairs;
}

- (void)setActiveXPCListenerPairs:(id)a3
{
  objc_storeStrong((id *)&self->_activeXPCListenerPairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeXPCListenerPairs, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end

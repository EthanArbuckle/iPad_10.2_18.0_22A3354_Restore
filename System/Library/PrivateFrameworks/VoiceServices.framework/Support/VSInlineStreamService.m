@implementation VSInlineStreamService

- (VSInlineStreamService)init
{
  VSInlineStreamService *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *queuedNotification;
  uint64_t v5;
  NSMutableArray *streamRequestQueue;
  NSMutableSet *v7;
  NSMutableSet *ongoingNotifications;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *notifyQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VSInlineStreamService;
  v2 = -[VSInlineStreamService init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    queuedNotification = v2->_queuedNotification;
    v2->_queuedNotification = v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    streamRequestQueue = v2->_streamRequestQueue;
    v2->_streamRequestQueue = (NSMutableArray *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    ongoingNotifications = v2->_ongoingNotifications;
    v2->_ongoingNotifications = v7;

    pthread_mutexattr_init(&v2->_recursiveLockAttr);
    pthread_mutexattr_settype(&v2->_recursiveLockAttr, 2);
    pthread_mutex_init(&v2->_lock, &v2->_recursiveLockAttr);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.voiced.VSInlineStreamService", v9);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)VSInlineStreamService;
  -[VSInlineStreamService dealloc](&v3, sel_dealloc);
}

- (void)addInlineStreamRequest:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[VSInlineStreamService streamRequestQueue](self, "streamRequestQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_21AA84000, v7, OS_LOG_TYPE_DEFAULT, "Received inline streaming TTS with id %@, text: %@", (uint8_t *)&v10, 0x16u);

  }
  pthread_mutex_unlock(p_lock);

}

- (id)popInlineStreamRequestForSpeakRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  pthread_mutex_lock(&self->_lock);
  -[VSInlineStreamService streamRequestQueue](self, "streamRequestQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    do
    {
      -[VSInlineStreamService streamRequestQueue](self, "streamRequestQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectAtIndex:", 0);

      objc_msgSend(v6, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
        break;
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSInlineStreamService removeStreamId:](self, "removeStreamId:", v11);

      -[VSInlineStreamService streamRequestQueue](self, "streamRequestQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    while (v13);
  }
  pthread_mutex_unlock(&self->_lock);

  return v6;
}

- (BOOL)hasInlineStreamRequestForSpeakRequest:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VSInlineStreamService streamRequestQueue](self, "streamRequestQueue", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  pthread_mutex_unlock(p_lock);
  return v7;
}

- (void)enqueueStreamId:(id)a3 withObject:(id)a4
{
  id v6;
  id v7;
  _opaque_pthread_mutex_t *p_lock;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[VSInlineStreamService ongoingNotifications](self, "ongoingNotifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  VSGetLogDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_INFO, "Notification for %@ is on-going. Posting object immediately %@", buf, 0x16u);
    }

    -[VSInlineStreamService notifyQueue](self, "notifyQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __52__VSInlineStreamService_enqueueStreamId_withObject___block_invoke;
    v17[3] = &unk_24DD8EDB0;
    v18 = v6;
    v19 = v7;
    dispatch_async(v13, v17);

    pthread_mutex_unlock(p_lock);
    v14 = v18;
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_INFO, "Notification for %@ has not started. Cache object %@", buf, 0x16u);
    }

    -[VSInlineStreamService queuedNotification](self, "queuedNotification");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[VSInlineStreamService queuedNotification](self, "queuedNotification");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v6);

    }
    objc_msgSend(v14, "addObject:", v7);
    pthread_mutex_unlock(p_lock);
  }

}

- (void)startStreamingWithId:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  VSInlineStreamService *v23;
  _QWORD block[4];
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  _BYTE v33[14];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(p_lock);
  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v33 = v4;
    _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_INFO, "Start notifying for: %@", buf, 0xCu);
  }

  -[VSInlineStreamService ongoingNotifications](v23, "ongoingNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  -[VSInlineStreamService queuedNotification](v23, "queuedNotification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  VSGetLogDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      v12 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v33 = v12;
      *(_WORD *)&v33[4] = 2112;
      *(_QWORD *)&v33[6] = v4;
      _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_INFO, "%d cached objects found for notification: %@", buf, 0x12u);
    }
    v13 = v4;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = v9;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      v18 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[VSInlineStreamService notifyQueue](v23, "notifyQueue");
          v21 = objc_claimAutoreleasedReturnValue();
          block[0] = v18;
          block[1] = 3221225472;
          block[2] = __46__VSInlineStreamService_startStreamingWithId___block_invoke;
          block[3] = &unk_24DD8EDB0;
          v25 = v13;
          v26 = v20;
          dispatch_async(v21, block);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v16);
    }

    objc_msgSend(v14, "removeAllObjects");
    v4 = v13;
    v9 = v22;
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v33 = v4;
      _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_INFO, "No cached object found for notification %@.", buf, 0xCu);
    }

  }
  pthread_mutex_unlock(p_lock);

}

- (void)removeStreamId:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_INFO, "Remove notification %@", (uint8_t *)&v9, 0xCu);
  }

  -[VSInlineStreamService ongoingNotifications](self, "ongoingNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v4);

  -[VSInlineStreamService queuedNotification](self, "queuedNotification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v4);

  pthread_mutex_unlock(p_lock);
}

- (NSMutableDictionary)queuedNotification
{
  return self->_queuedNotification;
}

- (void)setQueuedNotification:(id)a3
{
  objc_storeStrong((id *)&self->_queuedNotification, a3);
}

- (NSMutableSet)ongoingNotifications
{
  return self->_ongoingNotifications;
}

- (void)setOngoingNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingNotifications, a3);
}

- (NSMutableArray)streamRequestQueue
{
  return self->_streamRequestQueue;
}

- (void)setStreamRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_streamRequestQueue, a3);
}

- (_opaque_pthread_mutex_t)lock
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)self[1].__opaque;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[48];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[1].__opaque[32];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[16];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setLock:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_lock.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[24] = v5;
  *(_OWORD *)&self->_lock.__opaque[8] = v4;
  *(_OWORD *)&self->_lock.__sig = v3;
}

- (_opaque_pthread_mutexattr_t)recursiveLockAttr
{
  uint64_t v2;
  uint64_t sig;
  _opaque_pthread_mutexattr_t result;

  v2 = *(_QWORD *)self->_recursiveLockAttr.__opaque;
  sig = self->_recursiveLockAttr.__sig;
  *(_QWORD *)result.__opaque = v2;
  result.__sig = sig;
  return result;
}

- (void)setRecursiveLockAttr:(_opaque_pthread_mutexattr_t)a3
{
  self->_recursiveLockAttr = a3;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notifyQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_streamRequestQueue, 0);
  objc_storeStrong((id *)&self->_ongoingNotifications, 0);
  objc_storeStrong((id *)&self->_queuedNotification, 0);
}

void __46__VSInlineStreamService_startStreamingWithId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21AA84000, v2, OS_LOG_TYPE_INFO, "Notify %@ with cached object %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __52__VSInlineStreamService_enqueueStreamId_withObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (id)sharedService
{
  if (sharedService_onceToken_2798 != -1)
    dispatch_once(&sharedService_onceToken_2798, &__block_literal_global_2799);
  return (id)sharedService___sharedQueue;
}

void __38__VSInlineStreamService_sharedService__block_invoke()
{
  VSInlineStreamService *v0;
  void *v1;

  v0 = objc_alloc_init(VSInlineStreamService);
  v1 = (void *)sharedService___sharedQueue;
  sharedService___sharedQueue = (uint64_t)v0;

}

@end

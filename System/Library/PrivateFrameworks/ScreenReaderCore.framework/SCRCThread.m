@implementation SCRCThread

+ (void)initialize
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v3 = (void *)_RegistryLock;
    _RegistryLock = (uint64_t)v2;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_RegisteredThreads;
    _RegisteredThreads = v4;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_WaitingForStoppingThreads;
    _WaitingForStoppingThreads = v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_StoppingThreads;
    _StoppingThreads = v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)_StoppableThreads;
    _StoppableThreads = v10;

    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v13 = (void *)_AvailableThreads;
    _AvailableThreads = (uint64_t)v12;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    _DistantFuture = v14;

  }
}

+ (id)activity
{
  return 0;
}

+ (int64_t)activeThreadCount
{
  int64_t v2;

  objc_msgSend((id)_RegistryLock, "lock");
  v2 = objc_msgSend((id)_RegisteredThreads, "count");
  objc_msgSend((id)_RegistryLock, "unlock");
  return v2;
}

+ (void)setDefaultThreadPriority:(int64_t)a3
{
  __defaultThreadPriority = a3;
}

+ (int64_t)defaultThreadPriority
{
  return __defaultThreadPriority;
}

- (void)_assignThreadPriority
{
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  int v4;
  sched_param v5;

  if (__defaultThreadPriority)
  {
    v5 = 0;
    v4 = 0;
    v2 = pthread_self();
    pthread_getschedparam(v2, &v4, &v5);
    v5.sched_priority = 47;
    v3 = pthread_self();
    pthread_setschedparam(v3, 2, &v5);
  }
}

+ (double)_performSelector:(SEL)a3 withThreadKey:(id)a4 onTarget:(id)a5 waitTime:(double)a6 cancelMask:(unsigned int)a7 count:(unsigned int)a8 firstObject:(id)a9 moreObjects:(char *)a10
{
  uint64_t v11;
  uint64_t v12;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _BYTE *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v28;

  v11 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a7;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  if (v16)
  {
    v28 = 0.0;
    v19 = +[_SCRCThreadTask newThreadTaskWithTarget:selector:cancelMask:count:firstObject:moreObjects:](_SCRCThreadTask, "newThreadTaskWithTarget:selector:cancelMask:count:firstObject:moreObjects:", v17, a3, v12, v11, v18, a10);
    v20 = 0;
    if (a6 >= 0.0)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
      objc_msgSend(v19, "setWaitLock:", v20);
    }
    objc_msgSend((id)_RegistryLock, "lock");
    objc_msgSend((id)_RegisteredThreads, "objectForKeyedSubscript:", v16);
    v21 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend((id)_StoppingThreads, "objectForKey:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22
        || (objc_msgSend((id)_WaitingForStoppingThreads, "objectForKey:", v16),
            (v21 = (_BYTE *)objc_claimAutoreleasedReturnValue()) == 0)
        && (v21 = -[SCRCThread _initWithKey:task:]([SCRCThread alloc], "_initWithKey:task:", v16, v19),
            objc_msgSend(v21, "_setIsWaitingForStoppingThread:", 1),
            objc_msgSend((id)_WaitingForStoppingThreads, "setObject:forKeyedSubscript:", v21, v16),
            !v21))
      {
        v23 = objc_msgSend((id)_AvailableThreads, "count");
        if (v23)
        {
          v24 = v23 - 1;
          objc_msgSend((id)_AvailableThreads, "objectAtIndexedSubscript:", v23 - 1);
          v21 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "_setKey:", v16);
          objc_msgSend((id)_AvailableThreads, "removeObjectAtIndex:", v24);
        }
        else
        {
          v21 = -[SCRCThread _initWithKey:task:]([SCRCThread alloc], "_initWithKey:task:", v16, v19);

          v19 = 0;
        }
        objc_msgSend((id)_RegisteredThreads, "setObject:forKey:", v21, v16);
        v21[49] = 1;
      }
    }
    if (v19)
      objc_msgSend(v21, "_enqueueTask:cancelMask:lastStartTime:", v19, v12, &v28);

    objc_msgSend((id)_RegistryLock, "unlock");
    if (v20)
    {
      if (a6 == 0.0)
      {
        objc_msgSend(v20, "lockWhenCondition:", 1);
        objc_msgSend(v20, "unlock");
      }
      else
      {
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", a6);
        if (objc_msgSend(v20, "lockWhenCondition:beforeDate:", 1, v26))
          objc_msgSend(v20, "unlock");

      }
    }
    v25 = v28;

  }
  else
  {
    v25 = 0.0;
  }

  return v25;
}

+ (double)lastStartTimeForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  if (!a3)
    return 0.0;
  v3 = (void *)_RegistryLock;
  v4 = a3;
  objc_msgSend(v3, "lock");
  objc_msgSend((id)_RegisteredThreads, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_RegistryLock, "unlock");
  if (v5)
  {
    objc_msgSend(v5, "lastStartTime");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (void)invalidateForKey:(id)a3
{
  id v3;
  _BYTE *v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v5 = v3;
    objc_msgSend((id)_RegistryLock, "lock");
    objc_msgSend((id)_RegisteredThreads, "objectForKeyedSubscript:", v5);
    v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend((id)_RegisteredThreads, "removeObjectForKey:", v5);
      objc_msgSend((id)_StoppableThreads, "removeObject:", v4);
      objc_msgSend((id)_RegistryLock, "unlock");
      objc_msgSend(v4, "setIsInvalid:", 1);
      v4[49] = 0;
    }
    else
    {
      objc_msgSend((id)_RegistryLock, "unlock");
    }

    v3 = v5;
  }

}

+ (void)postStopNotification
{
  objc_msgSend((id)_RegistryLock, "lock");
  objc_msgSend((id)_StoppableThreads, "enumerateObjectsUsingBlock:", &__block_literal_global_7);
  objc_msgSend((id)_StoppableThreads, "removeAllObjects");
  objc_msgSend((id)_RegistryLock, "unlock");
}

void __34__SCRCThread_postStopNotification__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE *v10;

  v10 = a2;
  objc_msgSend(v10, "setIsInvalid:", 1);
  v10[49] = 0;
  v10[51] = 1;
  objc_msgSend(v10, "_key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)_RegisteredThreads;
    objc_msgSend(v10, "_key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)_StoppingThreads;
      objc_msgSend(v10, "_key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v7);

      v8 = (void *)_RegisteredThreads;
      objc_msgSend(v10, "_key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v9);

    }
  }

}

- (SCRCThread)init
{
  return (SCRCThread *)-[SCRCThread _initWithKey:task:](self, "_initWithKey:task:", 0, 0);
}

- (id)_initWithKey:(id)a3 task:(id)a4
{
  id v7;
  id v8;
  SCRCThread *v9;
  SCRCThread *v10;
  id v11;
  id queueLock;
  SCRCStackQueue *v13;
  SCRCStackQueue *queue;
  SCRCStackQueue *v15;
  SCRCStackQueue *waitingQueue;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SCRCThread;
  v9 = -[SCRCThread init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->__key, a3);
    v11 = objc_alloc_init(MEMORY[0x24BDD1648]);
    queueLock = v10->_queueLock;
    v10->_queueLock = v11;

    v13 = objc_alloc_init(SCRCStackQueue);
    queue = v10->_queue;
    v10->_queue = v13;

    v15 = objc_alloc_init(SCRCStackQueue);
    waitingQueue = v10->_waitingQueue;
    v10->_waitingQueue = v15;

    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__runThread_, v10, v8);
  }

  return v10;
}

- (void)_setKey:(id)a3
{
  objc_storeStrong(&self->__key, a3);
}

- (void)_runThread:(id)a3
{
  id v4;
  __CFRunLoop *Current;
  void *v6;
  void *v7;
  void *v8;
  __CFRunLoopSource *v9;
  CFRunLoopSourceContext v10;

  v4 = a3;
  -[SCRCThread _assignThreadPriority](self, "_assignThreadPriority");
  Current = CFRunLoopGetCurrent();
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", self, CFSTR("SCRCThreadKey"));
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SCRCThreadCache"));
  objc_msgSend(v4, "fire");
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("SCRCThreadCache"));
  v10.version = 0;
  memset(&v10.retain, 0, 56);
  v10.info = self;
  v10.perform = (void (__cdecl *)(void *))_handler_0;
  v9 = CFRunLoopSourceCreate(0, 0, &v10);
  CFRunLoopAddSource(Current, v9, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  CFRunLoopSourceSignal(v9);
  objc_msgSend(self->_queueLock, "lock");
  self->_source = v9;
  self->_runLoop = Current;
  objc_msgSend(self->_queueLock, "unlock");
  if (!-[SCRCThread isInvalid](self, "isInvalid"))
  {
    do
      CFRunLoopRunSpecific();
    while (!-[SCRCThread isInvalid](self, "isInvalid"));
  }
  -[SCRCThread _threadDidStop](self, "_threadDidStop");

}

- (BOOL)_debug_currentlyRunningOnThisThread
{
  __CFRunLoop *runLoop;

  runLoop = self->_runLoop;
  return runLoop == CFRunLoopGetCurrent();
}

- (void)_threadDidStop
{
  _BYTE *v3;

  if (self->_shouldStop)
  {
    objc_msgSend((id)_RegistryLock, "lock");
    objc_msgSend((id)_StoppingThreads, "removeObjectForKey:", self->__key);
    objc_msgSend((id)_WaitingForStoppingThreads, "objectForKeyedSubscript:", self->__key);
    v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend((id)_RegisteredThreads, "setObject:forKeyedSubscript:", v3, self->__key);
      objc_msgSend((id)_WaitingForStoppingThreads, "removeObjectForKey:", self->__key);
      v3[49] = 1;
      objc_msgSend(v3, "_setIsWaitingForStoppingThread:", 0);
    }
    objc_msgSend((id)_RegistryLock, "unlock");

  }
}

- (void)dealloc
{
  SCRCStackQueue *v3;
  SCRCStackQueue *queue;
  SCRCStackQueue *v5;
  SCRCStackQueue *waitingQueue;
  id queueLock;
  __CFRunLoopSource *source;
  id v9;
  id v10;
  objc_super v11;

  objc_msgSend(self->_queueLock, "lock");
  v3 = self->_queue;
  queue = self->_queue;
  self->_queue = 0;

  v5 = self->_waitingQueue;
  waitingQueue = self->_waitingQueue;
  self->_waitingQueue = 0;

  queueLock = self->_queueLock;
  source = self->_source;
  self->_source = 0;
  self->_isInvalid = 1;
  v9 = queueLock;
  v10 = self->_queueLock;
  self->_queueLock = 0;

  objc_msgSend(v9, "unlock");
  if (source)
    CFRelease(source);

  v11.receiver = self;
  v11.super_class = (Class)SCRCThread;
  -[SCRCThread dealloc](&v11, sel_dealloc);
}

- (double)_performSelector:(SEL)a3 onTarget:(id)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 firstObject:(id)a7 moreObjects:(char *)a8
{
  uint64_t v8;
  id v10;
  double v11;
  double v13;

  v8 = *(_QWORD *)&a5;
  v13 = 0.0;
  v10 = +[_SCRCThreadTask newThreadTaskWithTarget:selector:cancelMask:count:firstObject:moreObjects:](_SCRCThreadTask, "newThreadTaskWithTarget:selector:cancelMask:count:firstObject:moreObjects:", a4, a3, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a8);
  -[SCRCThread _enqueueTask:cancelMask:lastStartTime:](self, "_enqueueTask:cancelMask:lastStartTime:", v10, v8, &v13);
  v11 = v13;

  return v11;
}

- (double)performSelector:(SEL)a3 onTarget:(id)a4 count:(unsigned int)a5 objects:(id)a6
{
  double result;
  uint64_t v7;

  -[SCRCThread _performSelector:onTarget:cancelMask:count:firstObject:moreObjects:](self, "_performSelector:onTarget:cancelMask:count:firstObject:moreObjects:", a3, a4, 0, *(_QWORD *)&a5, a6, &v7);
  return result;
}

- (double)performSelector:(SEL)a3 onTarget:(id)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 objects:(id)a7
{
  double result;
  uint64_t v8;

  -[SCRCThread _performSelector:onTarget:cancelMask:count:firstObject:moreObjects:](self, "_performSelector:onTarget:cancelMask:count:firstObject:moreObjects:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, &v8);
  return result;
}

- (void)setIsInvalid:(BOOL)a3
{
  _BOOL4 v3;
  SCRCStackQueue *queue;
  SCRCStackQueue *v6;
  SCRCStackQueue *waitingQueue;
  __CFRunLoop *runLoop;
  SCRCStackQueue *v9;

  v3 = a3;
  objc_msgSend(self->_queueLock, "lock");
  self->_isInvalid = v3;
  if (v3)
  {
    v9 = self->_queue;
    queue = self->_queue;
    self->_queue = 0;

    v6 = self->_waitingQueue;
    waitingQueue = self->_waitingQueue;
    self->_waitingQueue = 0;

    self->_lastStartTime = -3061152000.0;
    runLoop = self->_runLoop;
    if (runLoop)
      CFRunLoopStop(runLoop);
  }
  else
  {
    v9 = 0;
    v6 = 0;
  }
  objc_msgSend(self->_queueLock, "unlock");

}

- (BOOL)_shouldStop
{
  return self->_shouldStop;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)_setIsWaitingForStoppingThread:(BOOL)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  self->_isWaitingForStoppingThread = a3;
  if (!a3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(self->_queueLock, "lock");
    while (-[SCRCStackQueue count](self->_waitingQueue, "count"))
    {
      v5 = -[SCRCStackQueue dequeueObjectRetained](self->_waitingQueue, "dequeueObjectRetained");
      v6 = (void *)MEMORY[0x212BD44B0]();
      objc_msgSend(v4, "addObject:", v6);

    }
    objc_msgSend(self->_queueLock, "unlock");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)_isWaitingForStoppingThread
{
  return self->_isWaitingForStoppingThread;
}

- (double)lastStartTime
{
  double lastStartTime;
  double result;

  objc_msgSend(self->_queueLock, "lock");
  lastStartTime = self->_lastStartTime;
  objc_msgSend(self->_queueLock, "unlock");
  result = 0.0;
  if (lastStartTime != -3061152000.0)
    return lastStartTime;
  return result;
}

- (void)_enqueueWaitingTask:(id)a3 cancelMask:(unsigned int)a4 lastStartTime:(double *)a5
{
  id v8;
  SCRCThread *v9;
  id v10;
  void *v11;
  SCRCStackQueue *waitingQueue;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD *v19;
  double *v20;
  unsigned int v21;
  _QWORD v22[5];
  SCRCThread *v23;

  v8 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__0;
  v22[4] = __Block_byref_object_dispose__0;
  v9 = self;
  v23 = v9;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __59__SCRCThread__enqueueWaitingTask_cancelMask_lastStartTime___block_invoke;
  v17 = &unk_24CB256D8;
  v19 = v22;
  v10 = v8;
  v21 = a4;
  v18 = v10;
  v20 = a5;
  v11 = (void *)MEMORY[0x212BD44B0](&v14);
  objc_msgSend(v9->_queueLock, "lock", v14, v15, v16, v17);
  waitingQueue = v9->_waitingQueue;
  v13 = (void *)MEMORY[0x212BD44B0](v11);
  -[SCRCStackQueue enqueueObject:](waitingQueue, "enqueueObject:", v13);

  objc_msgSend(v9->_queueLock, "unlock");
  _Block_object_dispose(v22, 8);

}

uint64_t __59__SCRCThread__enqueueWaitingTask_cancelMask_lastStartTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_enqueueImmediateTask:cancelMask:lastStartTime:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_enqueueImmediateTask:(id)a3 cancelMask:(unsigned int)a4 lastStartTime:(double *)a5
{
  SCRCStackQueue *queue;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __CFRunLoop *runLoop;
  double lastStartTime;
  __CFRunLoopSource *source;
  id v17;

  v17 = a3;
  objc_msgSend(self->_queueLock, "lock");
  if (self->_isInvalid || self->_shouldStop)
  {
    objc_msgSend(self->_queueLock, "unlock");
  }
  else
  {
    if (a4 && !-[SCRCStackQueue isEmpty](self->_queue, "isEmpty"))
    {
      queue = self->_queue;
      if (a4 == -1)
      {
        -[SCRCStackQueue removeAllObjects](queue, "removeAllObjects");
      }
      else
      {
        -[SCRCStackQueue objectEnumerator](queue, "objectEnumerator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "nextObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = v10;
          do
          {
            if ((*(_DWORD *)(v11 + 32) & a4) != 0)
            {
              v12 = *(void **)(v11 + 8);
              *(_QWORD *)(v11 + 8) = 0;

            }
            objc_msgSend(v9, "nextObject");
            v13 = objc_claimAutoreleasedReturnValue();

            v11 = v13;
          }
          while (v13);
        }

      }
    }
    -[SCRCStackQueue enqueueObject:](self->_queue, "enqueueObject:", v17);
    runLoop = self->_runLoop;
    lastStartTime = self->_lastStartTime;
    if (lastStartTime == -3061152000.0)
      lastStartTime = 0.0;
    *a5 = lastStartTime;
    source = self->_source;
    objc_msgSend(self->_queueLock, "unlock");
    if (source)
      CFRunLoopSourceSignal(source);
    if (runLoop)
      CFRunLoopWakeUp(runLoop);
  }

}

- (void)_enqueueTask:(id)a3 cancelMask:(unsigned int)a4 lastStartTime:(double *)a5
{
  if (self->_isWaitingForStoppingThread)
    -[SCRCThread _enqueueWaitingTask:cancelMask:lastStartTime:](self, "_enqueueWaitingTask:cancelMask:lastStartTime:", a3, *(_QWORD *)&a4, a5);
  else
    -[SCRCThread _enqueueImmediateTask:cancelMask:lastStartTime:](self, "_enqueueImmediateTask:cancelMask:lastStartTime:", a3, *(_QWORD *)&a4, a5);
}

- (void)_processQueueFromTimer
{
  self->_isTimerSet = 0;
  -[SCRCThread _processQueue](self, "_processQueue");
}

- (void)_processQueue
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  const char *v6;
  const char *Name;
  size_t v8;
  const char *v9;
  size_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  double NextTimerFireDate;
  double v19;
  double Current;
  double v21;

  objc_msgSend(self->_queueLock, "lock");
  if (!self->_isInvalid)
  {
    while (1)
    {
      v3 = -[SCRCStackQueue dequeueObjectRetained](self->_queue, "dequeueObjectRetained");
      if (!v3)
        break;
      v4 = v3;
      self->_lastStartTime = CFAbsoluteTimeGetCurrent();
      objc_msgSend(self->_queueLock, "unlock");
      v5 = (objc_class *)objc_opt_class();
      v6 = (const char *)v4[2];
      if (_appendInfoToRecentTaskBuffer__recentTaskOnceToken != -1)
        dispatch_once(&_appendInfoToRecentTaskBuffer__recentTaskOnceToken, &__block_literal_global_161);
      Name = class_getName(v5);
      v8 = strlen(Name);
      v9 = sel_getName(v6);
      v10 = strlen(v9);
      v11 = v8 + v10 + 4;
      do
        v12 = __ldaxr(&_appendInfoToRecentTaskBuffer__recentTaskBufferOffset);
      while (__stlxr(v12 + v11, &_appendInfoToRecentTaskBuffer__recentTaskBufferOffset));
      if (v12 + v11 < 0x258
        || (v12 = 0, atomic_store(0, &_appendInfoToRecentTaskBuffer__recentTaskBufferOffset), v11 <= 0x257))
      {
        v13 = _appendInfoToRecentTaskBuffer__recentTaskBuffer + v12;
        *(_WORD *)v13 = 91;
        v14 = &strncpy((char *)(v13 + 1), Name, v8)[v8];
        *(_WORD *)v14 = 32;
        strcpy(&strncpy(v14 + 1, v9, v10)[v10], "]\n");
      }
      v15 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "threadDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setObject:forKey:", v15, CFSTR("SCRCThreadCache"));
      objc_msgSend(v4, "fire");
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("SCRCThreadCache"));

      objc_msgSend(self->_queueLock, "lock");
      if (self->_isInvalid)
        goto LABEL_13;
    }
    self->_lastStartTime = -3061152000.0;
  }
LABEL_13:
  objc_msgSend(self->_queueLock, "unlock");
  objc_msgSend((id)_RegistryLock, "lock");
  if (self->_isRegistered && -[SCRCStackQueue isEmpty](self->_queue, "isEmpty"))
  {
    NextTimerFireDate = CFRunLoopGetNextTimerFireDate(self->_runLoop, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    if (NextTimerFireDate > 0.0
      && (v19 = NextTimerFireDate, Current = CFAbsoluteTimeGetCurrent(), v19 < Current + 31536000.0))
    {
      if (!self->_isTimerSet)
      {
        v21 = v19 + 1.0 - Current;
        if (v21 < 0.1)
          v21 = 0.1;
        -[SCRCThread performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__processQueueFromTimer, 0, v21);
        self->_isTimerSet = 1;
      }
    }
    else
    {
      if (!self->_isInvalid)
      {
        if ((unint64_t)objc_msgSend((id)_AvailableThreads, "count") > 5)
          -[SCRCThread setIsInvalid:](self, "setIsInvalid:", 1);
        else
          objc_msgSend((id)_AvailableThreads, "addObject:", self);
      }
      objc_msgSend((id)_RegisteredThreads, "removeObjectForKey:", self->__key);
      objc_msgSend((id)_StoppableThreads, "removeObject:", self);
      self->_isRegistered = 0;
    }
  }
  objc_msgSend((id)_RegistryLock, "unlock");
}

+ (id)currentThreadTaskCache
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("SCRCThreadCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)threadTaskCacheKey
{
  return CFSTR("SCRCThreadCache");
}

- (void)_setLastStartTime:(double)a3
{
  self->_lastStartTime = a3;
}

- (id)_key
{
  return self->__key;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__key, 0);
  objc_storeStrong(&self->_queueLock, 0);
  objc_storeStrong((id *)&self->_waitingQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (BOOL)_addThreadToRegisteredThreads:(id)a3 withThreadKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  if (v6
    && (objc_msgSend((id)_RegisteredThreads, "objectForKey:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    objc_msgSend((id)_RegisteredThreads, "setObject:forKeyedSubscript:", v5, v6);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_removeThreadFromRegisteredThreads:(id)a3 withThreadKey:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend((id)_RegisteredThreads, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend((id)_RegisteredThreads, "removeObjectForKey:", v6);
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

@end

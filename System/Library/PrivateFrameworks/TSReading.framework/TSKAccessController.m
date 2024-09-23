@implementation TSKAccessController

- (TSKAccessController)initWithDelegate:(id)a3
{
  TSKAccessController *v4;
  __CFRunLoop *Main;
  CFRunLoopSourceContext v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSKAccessController;
  v4 = -[TSKAccessController init](&v8, sel_init);
  if (v4)
  {
    v4->_delegate = (TSUWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3D18]), "initWithObject:", a3);
    v4->_writerQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4->_cond = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    pthread_rwlock_init(&v4->_rwLock, 0);
    v4->_waitIdentifiers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4->_signalIdentifiers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7.version = 0;
    v7.info = v4;
    memset(&v7.retain, 0, 24);
    v7.equal = (Boolean (__cdecl *)(const void *, const void *))TSKMainThreadRunLoopEqual;
    v7.hash = (CFHashCode (__cdecl *)(const void *))TSKMainThreadRunLoopHash;
    v7.schedule = 0;
    v7.cancel = 0;
    v7.perform = (void (__cdecl *)(void *))TSKMainThreadRunLoopPerform;
    v4->_mainThreadPingSource = CFRunLoopSourceCreate(0, 0, &v7);
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v4->_mainThreadPingSource, (CFRunLoopMode)*MEMORY[0x24BDBCB80]);
    v4->_pendingMainThreadInvocations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  return v4;
}

- (TSKAccessController)init
{
  return -[TSKAccessController initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  if (-[NSMutableDictionary count](self->_waitIdentifiers, "count"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 147, CFSTR("access controller being deallocated when it is still in use"));
  }

  if (-[NSMutableDictionary count](self->_signalIdentifiers, "count"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController dealloc]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 150, CFSTR("access controller being deallocated when it is still in use"));
  }

  CFRunLoopSourceInvalidate(self->_mainThreadPingSource);
  pthread_rwlock_destroy(&self->_rwLock);
  CFRelease(self->_mainThreadPingSource);

  v7.receiver = self;
  v7.super_class = (Class)TSKAccessController;
  -[TSKAccessController dealloc](&v7, sel_dealloc);
}

- (void)waitOnIdentifier:(id)a3
{
  -[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:](self, "waitOnIdentifier:untilDate:releaseReadWhileWaiting:", a3, objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture"), 0);
}

- (BOOL)waitOnIdentifier:(id)a3 untilDate:(id)a4 releaseReadWhileWaiting:(BOOL)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;

  if (a5)
  {
    if (!-[TSKAccessController p_hasRead](self, "p_hasRead"))
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 179, CFSTR("shoulnd't set releaseRead when we're not holding a read lock"));
    }
    if (-[TSKAccessController p_hasRead](self, "p_hasRead"))
    {
      if (!objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        -[TSKAccessController p_readUnlock](self, "p_readUnlock");
        if (-[TSKAccessController p_hasRead](self, "p_hasRead"))
        {
          v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]");
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 189, CFSTR("failed to release read privs"));
        }
        v12 = 1;
        goto LABEL_9;
      }
      if (self->_secondaryThreadWriting)
      {
        v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]");
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 184, CFSTR("we shouldn't have read privs if a secondary thread is writing"));
      }
    }
  }
  v12 = 0;
LABEL_9:
  if (-[TSKAccessController p_hasWrite](self, "p_hasWrite"))
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 195, CFSTR("waiting on an identifier with write lock held, deadlock likely in our future"));
  }
  -[NSCondition lock](self->_cond, "lock");
  if (-[NSMutableDictionary objectForKey:](self->_waitIdentifiers, "objectForKey:", a3))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 200, CFSTR("multiple threads cannot wait on the same identifier simultaneously"));
  }
  -[NSMutableDictionary setObject:forKey:](self->_waitIdentifiers, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), a3);
  while (1)
  {
    v17 = -[NSMutableDictionary objectForKey:](self->_signalIdentifiers, "objectForKey:", a3);
    if (v17)
      break;
    if (!-[TSKAccessController p_waitWithCondition:untilDate:](self, "p_waitWithCondition:untilDate:", self->_cond, a4))
      goto LABEL_20;
  }
  v18 = -[NSMutableDictionary objectForKey:](self->_signalIdentifiers, "objectForKey:", a3);
  if (!v18)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 213, CFSTR("expect to have a signaling thread if we were signaled"));
  }
  -[NSMutableDictionary removeObjectForKey:](self->_signalIdentifiers, "removeObjectForKey:", a3);
  -[TSKAccessController p_signalThread:](self, "p_signalThread:", v18);
LABEL_20:
  -[NSMutableDictionary removeObjectForKey:](self->_waitIdentifiers, "removeObjectForKey:", a3);
  -[NSCondition broadcast](self->_cond, "broadcast");
  -[NSCondition unlock](self->_cond, "unlock");
  if (v12)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]");
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 226, CFSTR("should only reacquire read for secondary threads"));
    }
    -[TSKAccessController p_readLock](self, "p_readLock");
  }
  return v17 != 0;
}

- (void)signalIdentifier:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[NSCondition lock](self->_cond, "lock");
  if (-[NSMutableDictionary objectForKey:](self->_signalIdentifiers, "objectForKey:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController signalIdentifier:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 237, CFSTR("multiple threads cannot signal the same identifier simultaneously"));
  }
  -[NSMutableDictionary setObject:forKey:](self->_signalIdentifiers, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), a3);
  v7 = -[NSMutableDictionary objectForKey:](self->_waitIdentifiers, "objectForKey:", a3);
  if (v7)
    -[TSKAccessController p_signalThread:](self, "p_signalThread:", v7);
  while (-[NSMutableDictionary objectForKey:](self->_signalIdentifiers, "objectForKey:", a3))
    -[TSKAccessController p_waitWithCondition:untilDate:](self, "p_waitWithCondition:untilDate:", self->_cond, objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture"));
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)spinMainThreadRunLoopUntil:(SEL)a3 onTarget:(id)a4
{
  void *v7;
  uint64_t v8;

  -[NSCondition lock](self->_cond, "lock");
  while (!objc_msgSend(a4, "performSelector:", a3))
  {
    if (!-[TSKAccessController p_waitWithCondition:untilDate:](self, "p_waitWithCondition:untilDate:", self->_cond, objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5)))
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController spinMainThreadRunLoopUntil:onTarget:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 279, CFSTR("we should never timeout in -spinMainThreadRunLoopUntil:onTarget:"));
    }
  }
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)performRead:(id)a3
{
  -[TSKAccessController p_readLock](self, "p_readLock");
  (*((void (**)(id))a3 + 2))(a3);
  -[TSKAccessController p_readUnlock](self, "p_readUnlock");
}

- (void)performRead:(SEL)a3 withTarget:(id)a4 argument:(void *)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__TSKAccessController_performRead_withTarget_argument___block_invoke;
  v5[3] = &unk_24D82A578;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = a5;
  -[TSKAccessController performRead:](self, "performRead:", v5);
}

uint64_t __55__TSKAccessController_performRead_withTarget_argument___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)performRead:(SEL)a3 withTarget:(id)a4 argument:(void *)a5 argument2:(void *)a6
{
  _QWORD v6[8];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__TSKAccessController_performRead_withTarget_argument_argument2___block_invoke;
  v6[3] = &unk_24D82A5A0;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = a5;
  v6[7] = a6;
  -[TSKAccessController performRead:](self, "performRead:", v6);
}

uint64_t __65__TSKAccessController_performRead_withTarget_argument_argument2___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:withObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)performWrite:(id)a3
{
  -[TSKAccessController performWrite:blockMainThread:](self, "performWrite:blockMainThread:", a3, 1);
}

- (void)performWrite:(id)a3 blockMainThread:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[TSKAccessController p_enqueueWriteAndBlock](self, "p_enqueueWriteAndBlock");
  -[TSKAccessController p_writeLockAndBlockMainThread:](self, "p_writeLockAndBlockMainThread:", v4);
  (*((void (**)(id))a3 + 2))(a3);
  -[TSKAccessController p_writeUnlock](self, "p_writeUnlock");
  -[TSKAccessController p_dequeueWrite](self, "p_dequeueWrite");
}

- (void)performWrite:(SEL)a3 withTarget:(id)a4 argument:(void *)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__TSKAccessController_performWrite_withTarget_argument___block_invoke;
  v5[3] = &unk_24D82A578;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = a5;
  -[TSKAccessController performWrite:](self, "performWrite:", v5);
}

uint64_t __56__TSKAccessController_performWrite_withTarget_argument___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)performRead:(SEL)a3 thenReadOnMainThread:(SEL)a4 withTarget:(id)a5 argument:(void *)a6
{
  TSKACReadArguments *v11;

  -[TSKAccessController p_enqueueWriteAndBlock](self, "p_enqueueWriteAndBlock");
  -[TSKAccessController p_readLock](self, "p_readLock");
  if (a3)
    objc_msgSend(a5, "performSelector:withObject:", a3, a6);
  v11 = -[TSKACReadArguments initWithSelector:target:argument:]([TSKACReadArguments alloc], "initWithSelector:target:argument:", a4, a5, a6);
  -[TSKAccessController p_scheduleMainThreadRead:](self, "p_scheduleMainThreadRead:", v11);

  -[TSKAccessController p_readUnlock](self, "p_readUnlock");
  -[TSKAccessController p_dequeueWrite](self, "p_dequeueWrite");
}

- (void)performRead:(SEL)a3 thenWrite:(SEL)a4 thenReadOnMainThread:(SEL)a5 withTarget:(id)a6 argument:(void *)a7
{
  -[TSKAccessController performRead:thenWrite:thenReadOnMainThread:withTarget:argument:passReadResultToMainThreadRead:](self, "performRead:thenWrite:thenReadOnMainThread:withTarget:argument:passReadResultToMainThreadRead:", a3, a4, a5, a6, a7, 0);
}

- (void)performRead:(SEL)a3 thenWrite:(SEL)a4 thenReadOnMainThread:(SEL)a5 withTarget:(id)a6 argument:(void *)a7 passReadResultToMainThreadRead:(BOOL)a8
{
  _BOOL4 v8;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  TSKACReadArguments *v18;
  TSKACReadArguments *v19;
  char v20;
  TSKACReadArguments *v21;
  char v22;
  _QWORD v23[6];

  v8 = a8;
  -[TSKAccessController p_enqueueWriteAndBlock](self, "p_enqueueWriteAndBlock");
  if (a3)
  {
    if (strcmp((const char *)objc_msgSend((id)objc_msgSend(a6, "methodSignatureForSelector:", a3), "methodReturnType"), "B"))
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController performRead:thenWrite:thenReadOnMainThread:withTarget:argument:passReadResultToMainThreadRead:]");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 393, CFSTR("Expected method that returns a BOOL for readSelector"));
    }
    -[TSKAccessController p_readLock](self, "p_readLock");
    v17 = (uint64_t)objc_msgSend(a6, a3, a7);
    -[TSKAccessController p_readUnlock](self, "p_readUnlock");
    if (a5)
      goto LABEL_5;
  }
  else
  {
    v17 = 1;
    if (a5)
    {
LABEL_5:
      if (v8)
      {
        v18 = [TSKACReadArguments alloc];
        v19 = -[TSKACReadArguments initWithSelector:target:argument:argument2:](v18, "initWithSelector:target:argument:argument2:", a5, a6, a7, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17));
      }
      else
      {
        v19 = -[TSKACReadArguments initWithSelector:target:argument:]([TSKACReadArguments alloc], "initWithSelector:target:argument:", a5, a6, a7);
      }
      v21 = v19;
      if (a4)
        v22 = v17;
      else
        v22 = 0;
      if ((v22 & 1) != 0)
        goto LABEL_17;
      if (v19)
      {
        -[TSKAccessController p_scheduleMainThreadRead:](self, "p_scheduleMainThreadRead:", v19);

      }
      goto LABEL_22;
    }
  }
  v20 = v17 ^ 1;
  if (!a4)
    v20 = 1;
  if ((v20 & 1) == 0)
  {
    v21 = 0;
LABEL_17:
    -[TSKAccessController p_writeLockAndBlockMainThread:](self, "p_writeLockAndBlockMainThread:", 1);
    objc_msgSend(a6, "performSelector:withObject:", a4, a7);
    if (v21)
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __117__TSKAccessController_performRead_thenWrite_thenReadOnMainThread_withTarget_argument_passReadResultToMainThreadRead___block_invoke;
      v23[3] = &unk_24D82A5C8;
      v23[4] = self;
      v23[5] = v21;
      -[TSKAccessController p_writeUnlockAndPerformWithMainThreadBlocked:](self, "p_writeUnlockAndPerformWithMainThreadBlocked:", v23);
    }
  }
LABEL_22:
  -[TSKAccessController p_dequeueWrite](self, "p_dequeueWrite");
}

void __117__TSKAccessController_performRead_thenWrite_thenReadOnMainThread_withTarget_argument_passReadResultToMainThreadRead___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "p_scheduleMainThreadRead:", *(_QWORD *)(a1 + 40));

}

- (void)p_readLock
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  pthread_t v7;
  pthread_t v8;
  unsigned int readerCount;
  unsigned int *p_count;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  char *v14;
  int v15;
  void *v16;

  if (-[TSKAccessController p_hasWrite](self, "p_hasWrite"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_readLock]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 489, CFSTR("can't acquire a read lock if we already have a write lock"));
  }
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    if (self->_secondaryThreadWriting)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_readLock]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 493, CFSTR("trying to acquire read from MT while a secondary thread is writing"));
    }
  }
  else
  {
    -[NSCondition lock](self->_cond, "lock");
    v7 = pthread_self();
    v8 = v7;
    readerCount = self->_readerCount;
    if (readerCount)
    {
      p_count = &self->_readerInfo[0].count;
      v11 = self->_readerCount;
      do
      {
        if (*((pthread_t *)p_count - 1) == v7)
        {
          v15 = 0;
          ++*p_count;
          goto LABEL_14;
        }
        p_count += 4;
        --v11;
      }
      while (v11);
      if (readerCount >= 0x40)
      {
        v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_readLock]");
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 517, CFSTR("Maximum number of readers reached"));
        readerCount = self->_readerCount;
      }
    }
    self->_readerCount = readerCount + 1;
    v14 = (char *)self + 16 * readerCount;
    *((_QWORD *)v14 + 32) = v8;
    v15 = 1;
    *((_DWORD *)v14 + 66) = 1;
LABEL_14:
    -[NSCondition unlock](self->_cond, "unlock");
    if (v15)
      pthread_rwlock_rdlock(&self->_rwLock);
  }
  v16 = (void *)-[TSUWeakReference object](self->_delegate, "object");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "didAcquireReadLock");
}

- (BOOL)p_hasRead
{
  BOOL v3;
  pthread_t v4;
  unint64_t readerCount;
  _TSKThreadInfo *readerInfo;
  unint64_t v7;
  _opaque_pthread_t *v8;
  _opaque_pthread_t *threadId;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    return !self->_secondaryThreadWriting;
  -[NSCondition lock](self->_cond, "lock");
  v4 = pthread_self();
  readerCount = self->_readerCount;
  if ((_DWORD)readerCount)
  {
    readerInfo = self->_readerInfo;
    v7 = 1;
    do
    {
      threadId = readerInfo->threadId;
      ++readerInfo;
      v8 = threadId;
      v3 = threadId == v4;
      if (v7 >= readerCount)
        break;
      ++v7;
    }
    while (v8 != v4);
  }
  else
  {
    v3 = 0;
  }
  -[NSCondition unlock](self->_cond, "unlock");
  return v3;
}

- (BOOL)p_hasWrite
{
  void *v3;
  BOOL v4;

  -[NSCondition lock](self->_cond, "lock");
  v4 = -[NSMutableArray count](self->_writerQueue, "count")
    && (v3 = (void *)-[NSMutableArray objectAtIndex:](self->_writerQueue, "objectAtIndex:", 0),
        v3 == -[TSKAccessController p_threadIdentifier](self, "p_threadIdentifier"))
    && self->_writeHeld;
  -[NSCondition unlock](self->_cond, "unlock");
  return v4;
}

- (void)p_readUnlock
{
  void *v3;
  void *v4;
  uint64_t v5;
  pthread_t v6;
  unsigned int readerCount;
  int v8;
  _TSKThreadInfo *readerInfo;
  void *v10;
  uint64_t v11;
  _TSKThreadInfo *v12;
  unsigned int count;
  unsigned int *p_count;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;

  v3 = (void *)-[TSUWeakReference object](self->_delegate, "object");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "willRelinquishReadLock");
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    if (self->_secondaryThreadWriting)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_readUnlock]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 609, CFSTR("releasing read from MT when a secondary thread is writing"));
    }
  }
  else
  {
    -[NSCondition lock](self->_cond, "lock");
    v6 = pthread_self();
    readerCount = self->_readerCount;
    if (readerCount)
    {
      v8 = 0;
      readerInfo = self->_readerInfo;
      while (readerInfo->threadId != v6)
      {
        ++v8;
        ++readerInfo;
        if (readerCount == v8)
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_readUnlock]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 627, CFSTR("Trying to unlock read for a reader that doesn't hold read lock"));
      v8 = -1;
    }
    v12 = &self->_readerInfo[v8];
    p_count = &v12->count;
    count = v12->count;
    if (!count)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_readUnlock]");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 629, CFSTR("Reader is in the list of readers but doesn't have any read locks held"));
      count = *p_count;
    }
    v17 = count - 1;
    *p_count = v17;
    if (!v17)
    {
      v18 = self->_readerCount - 1;
      self->_readerCount = v18;
      *v12 = self->_readerInfo[v18];
      pthread_rwlock_unlock(&self->_rwLock);
    }
    -[NSCondition unlock](self->_cond, "unlock");
  }
}

- (void)p_blockMainThreadForWrite
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_blockMainThreadForWrite]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 648, CFSTR("this method should only be invoked on the main thread"));
  }
  if (self->_secondaryThreadWriting)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_blockMainThreadForWrite]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 649, CFSTR("shouldn't be trying to block the main thread for a secondary thread write if there's already one ongoing"));
  }
  self->_secondaryThreadWriting = 1;
  if (-[TSKAccessController p_hasRead](self, "p_hasRead"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_blockMainThreadForWrite]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 655, CFSTR("failed to release read privs"));
  }
  -[TSKAccessController signalIdentifier:](self, "signalIdentifier:", CFSTR("kTSKMainThreadBlockedIdentifier"));
  -[TSKAccessController waitOnIdentifier:](self, "waitOnIdentifier:", CFSTR("kTSKWriteCompleteIdentifier"));
  self->_secondaryThreadWriting = 0;
  -[TSKAccessController waitOnIdentifier:](self, "waitOnIdentifier:", CFSTR("kTSKPostWriteCompleteIdentifier"));
}

- (void)p_asyncPerformSelectorOnMainThread:(SEL)a3 withTarget:(id)a4 argument:(void *)a5
{
  void *v8;
  void *v9;
  __CFRunLoop *Main;
  void *v11;

  v11 = a5;
  v8 = (void *)objc_msgSend(a4, "methodSignatureForSelector:");
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v8);
  objc_msgSend(v9, "setTarget:", a4);
  objc_msgSend(v9, "setSelector:", a3);
  if ((unint64_t)objc_msgSend(v8, "numberOfArguments") >= 3)
    objc_msgSend(v9, "setArgument:atIndex:", &v11, 2);
  -[NSCondition lock](self->_cond, "lock");
  -[NSMutableArray addObject:](self->_pendingMainThreadInvocations, "addObject:", v9);
  CFRunLoopSourceSignal(self->_mainThreadPingSource);
  Main = CFRunLoopGetMain();
  CFRunLoopWakeUp(Main);
  -[NSCondition broadcast](self->_cond, "broadcast");
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)p_writeLockAndBlockMainThread:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0
    && -[TSKAccessController p_hasRead](self, "p_hasRead"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_writeLockAndBlockMainThread:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 695, CFSTR("shouldn't have read while waiting on write"));
  }
  pthread_rwlock_wrlock(&self->_rwLock);
  if (self->_writeHeld)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_writeLockAndBlockMainThread:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 700, CFSTR("Write mutex should be available; we are holding the write lock"));
  }
  if (v3 && (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    -[TSKAccessController p_asyncPerformSelectorOnMainThread:withTarget:argument:](self, "p_asyncPerformSelectorOnMainThread:withTarget:argument:", sel_p_blockMainThreadForWrite, self, 0);
    -[TSKAccessController waitOnIdentifier:](self, "waitOnIdentifier:", CFSTR("kTSKMainThreadBlockedIdentifier"));
    self->_writeBlockedMainThread = 1;
  }
  self->_writeHeld = 1;
}

- (void)p_writeUnlock
{
  -[TSKAccessController p_writeUnlockAndPerformWithMainThreadBlocked:](self, "p_writeUnlockAndPerformWithMainThreadBlocked:", 0);
}

- (void)p_writeUnlockAndPerformWithMainThreadBlocked:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!-[TSKAccessController p_hasWrite](self, "p_hasWrite"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_writeUnlockAndPerformWithMainThreadBlocked:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 719, CFSTR("Must already be holding the write mutex when unlocking write"));
  }
  pthread_rwlock_unlock(&self->_rwLock);
  if (self->_writeBlockedMainThread)
    -[TSKAccessController signalIdentifier:](self, "signalIdentifier:", CFSTR("kTSKWriteCompleteIdentifier"));
  self->_writeHeld = 0;
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
  if (self->_writeBlockedMainThread)
    -[TSKAccessController signalIdentifier:](self, "signalIdentifier:", CFSTR("kTSKPostWriteCompleteIdentifier"));
  self->_writeBlockedMainThread = 0;
}

- (id)p_threadIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
}

- (void)p_enqueueWriteAndBlock
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSMutableArray *writerQueue;
  void *v15;
  uint64_t v16;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    if (!self->_secondaryThreadWriting)
      goto LABEL_7;
    v3 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_enqueueWriteAndBlock]");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m");
    v6 = CFSTR("main thread should be locked out while a secondary thread is writing");
    v7 = (void *)v3;
    v8 = v4;
    v9 = 753;
  }
  else
  {
    if (!-[TSKAccessController p_hasRead](self, "p_hasRead"))
      goto LABEL_7;
    v10 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_enqueueWriteAndBlock]");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m");
    v6 = CFSTR("shouldn't have read while waiting on write");
    v7 = (void *)v10;
    v8 = v11;
    v9 = 757;
  }
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v5, v9, v6);
LABEL_7:
  -[NSCondition lock](self->_cond, "lock");
  v12 = -[TSKAccessController p_threadIdentifier](self, "p_threadIdentifier");
  v13 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_writerQueue, "indexOfObjectIdenticalTo:", v12);
  writerQueue = self->_writerQueue;
  if (v13)
  {
    -[NSMutableArray addObject:](writerQueue, "addObject:", v12);
    while ((id)-[NSMutableArray objectAtIndex:](self->_writerQueue, "objectAtIndex:", 0) != v12)
      -[TSKAccessController p_waitWithCondition:untilDate:](self, "p_waitWithCondition:untilDate:", self->_cond, objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture"));
    if ((id)-[NSMutableArray objectAtIndex:](self->_writerQueue, "objectAtIndex:", 0) != v12)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_enqueueWriteAndBlock]");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 787, CFSTR("Expected to block until correct thread was at queue head"));
    }
  }
  else
  {
    -[NSMutableArray insertObject:atIndex:](writerQueue, "insertObject:atIndex:", v12, 0);
  }
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)p_dequeueWrite
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[NSCondition lock](self->_cond, "lock");
  v3 = (void *)-[NSMutableArray objectAtIndex:](self->_writerQueue, "objectAtIndex:", 0);
  if (v3 != -[TSKAccessController p_threadIdentifier](self, "p_threadIdentifier"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_dequeueWrite]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 802, CFSTR("Dequeueing write for wrong thread"));
  }
  -[NSMutableArray removeObjectAtIndex:](self->_writerQueue, "removeObjectAtIndex:", 0);
  if (-[NSMutableArray count](self->_writerQueue, "count"))
    -[TSKAccessController p_signalThread:](self, "p_signalThread:", -[NSMutableArray objectAtIndex:](self->_writerQueue, "objectAtIndex:", 0));
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)p_scheduleMainThreadRead:(id)a3
{
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[TSKAccessController performRead:withTarget:argument:argument2:](self, "performRead:withTarget:argument:argument2:", objc_msgSend(a3, "selector"), objc_msgSend(a3, "target"), objc_msgSend(a3, "argument"), objc_msgSend(a3, "argument2"));
  }
  else
  {
    -[TSKAccessController p_asyncPerformSelectorOnMainThread:withTarget:argument:](self, "p_asyncPerformSelectorOnMainThread:withTarget:argument:", sel_p_performReadOnMainThread_, self, a3);
    -[TSKAccessController waitOnIdentifier:](self, "waitOnIdentifier:", CFSTR("kTSKMainThreadReadCompletedIdentifier"));
  }
}

- (void)p_performReadOnMainThread:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_performReadOnMainThread:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 838, CFSTR("p_performReadOnMainThread may only be called from main thread"));
  }
  if (!-[TSKAccessController p_hasRead](self, "p_hasRead"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAccessController p_performReadOnMainThread:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 839, CFSTR("should have read privs on the main thread"));
  }
  objc_msgSend((id)objc_msgSend(a3, "target"), "performSelector:withObject:withObject:", objc_msgSend(a3, "selector"), objc_msgSend(a3, "argument"), objc_msgSend(a3, "argument2"));
  -[TSKAccessController signalIdentifier:](self, "signalIdentifier:", CFSTR("kTSKMainThreadReadCompletedIdentifier"));
}

- (void)p_flushPendingMainThreadBlocksQueueAcquiringLock:(BOOL)a3
{
  _BOOL4 v3;
  TSKAccessController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  if (v3)
    -[NSCondition lock](self->_cond, "lock");
  while (-[NSMutableArray count](self->_pendingMainThreadInvocations, "count"))
  {
    v5 = (id)-[NSMutableArray objectAtIndex:](self->_pendingMainThreadInvocations, "objectAtIndex:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->_pendingMainThreadInvocations, "removeObjectAtIndex:", 0);
    -[NSCondition unlock](self->_cond, "unlock");
    objc_msgSend(v5, "invoke");
    -[NSCondition lock](self->_cond, "lock");

  }
  if (v3)
    -[NSCondition unlock](self->_cond, "unlock");

}

- (BOOL)p_waitWithCondition:(id)a3 untilDate:(id)a4
{
  char v7;

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "isMainThread")
    && -[NSMutableArray count](self->_pendingMainThreadInvocations, "count"))
  {
    -[TSKAccessController p_flushPendingMainThreadBlocksQueueAcquiringLock:](self, "p_flushPendingMainThreadBlocksQueueAcquiringLock:", 0);
    return 1;
  }
  else
  {
    v7 = objc_msgSend(a3, "waitUntilDate:", a4);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "isMainThread"))
      -[TSKAccessController p_flushPendingMainThreadBlocksQueueAcquiringLock:](self, "p_flushPendingMainThreadBlocksQueueAcquiringLock:", 0);
  }
  return v7;
}

- (void)p_signalThread:(id)a3
{
  if (a3)
    -[NSCondition broadcast](self->_cond, "broadcast");
}

@end

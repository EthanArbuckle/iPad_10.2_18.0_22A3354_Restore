@implementation TSUFlushingManager

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSUFlushingManager;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedManager
{
  id result;
  uint64_t v4;
  id v5;
  uint64_t v6;

  result = (id)+[TSUFlushingManager sharedManager]::sSingletonInstance;
  if (!+[TSUFlushingManager sharedManager]::sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!+[TSUFlushingManager sharedManager]::sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      +[TSUFlushingManager sharedManager]::sSingletonInstance = v4;
      if (!v4)
      {
        v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUFlushingManager sharedManager]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 165, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSUFlushingManager sharedManager]::sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUFlushingManager allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 165, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSUFlushingManager)init
{
  TSUFlushingManager *v2;
  _QWORD *v3;
  _QWORD *v4;
  NSCondition *v5;
  NSCondition *v6;
  unint64_t v7;
  TSUMemoryWatcher *v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSUFlushingManager;
  v2 = -[TSUFlushingManager init](&v11, sel_init);
  if (v2)
  {
    v2->_objects = objc_alloc_init(TSURetainedPointerKeyDictionary);
    v3 = (_QWORD *)operator new();
    v3[2] = 0;
    v3[1] = 0;
    *v3 = v3 + 1;
    v2->_sortedObjects = v3;
    v4 = (_QWORD *)operator new();
    v4[2] = 0;
    v4[1] = 0;
    *v4 = v4 + 1;
    v2->_sortedNewObjects = v4;
    v2->_inactiveObjects = objc_alloc_init(TSUPointerKeyDictionary);
    v2->_isFlushing = 0;
    v2->_stopFlushing = 0;
    v5 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    v2->_cond = v5;
    -[NSCondition setName:](v5, "setName:", CFSTR("TSUFlushingManager condition"));
    v6 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    v2->_isFlushingCond = v6;
    -[NSCondition setName:](v6, "setName:", CFSTR("TSUFlushingManager _isFlushing condition"));
    v7 = *MEMORY[0x24BDF7608];
    v2->_backgroundTransitionTaskId = *MEMORY[0x24BDF7608];
    v2->_activeBgThreadTask = v7;
    v8 = -[TSUMemoryWatcher initWithFlushingManager:]([TSUMemoryWatcher alloc], "initWithFlushingManager:", v2);
    v2->_memoryWatcher = v8;
    -[TSUMemoryWatcher beginObserving](v8, "beginObserving");
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TSUFlushImmediately"));
    v2->_alwaysFlushing = v9;
    if (v9)
    {
      NSLog((NSString *)CFSTR("%@ enabled, TSUFlushingManager will flush immediately"), CFSTR("TSUFlushImmediately"));
      -[TSUFlushingManager _startFlushingObjects](v2, "_startFlushingObjects");
    }
  }
  return v2;
}

- (void)dealloc
{
  TSURetainedPointerKeyDictionary *objects;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  TSUPointerKeyDictionary *inactiveObjects;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  _QWORD **sortedObjects;
  _QWORD **sortedNewObjects;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[TSUMemoryWatcher stopObserving](self->_memoryWatcher, "stopObserving");

  if (self->_isFlushing)
    -[TSUFlushingManager _stopFlushingObjects](self, "_stopFlushingObjects");
  -[NSCondition lock](self->_cond, "lock");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objects = self->_objects;
  v4 = -[TSUNoCopyDictionary countByEnumeratingWithState:objects:count:](objects, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(objects);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "setFlushingManager:", 0);
        v9 = objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", v8), "pointerValue");
        if (v9)
          MEMORY[0x219A01ED0](v9, 0x1080C40DCAC275BLL);
      }
      v5 = -[TSUNoCopyDictionary countByEnumeratingWithState:objects:count:](objects, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  inactiveObjects = self->_inactiveObjects;
  v11 = -[TSUNoCopyDictionary countByEnumeratingWithState:objects:count:](inactiveObjects, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(inactiveObjects);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "setFlushingManager:", 0);
        v16 = objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", v15), "pointerValue");
        if (v16)
          MEMORY[0x219A01ED0](v16, 0x1080C40DCAC275BLL);
      }
      v12 = -[TSUNoCopyDictionary countByEnumeratingWithState:objects:count:](inactiveObjects, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v12);
  }
  sortedObjects = (_QWORD **)self->_sortedObjects;
  if (sortedObjects)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)self->_sortedObjects, sortedObjects[1]);
    MEMORY[0x219A01ED0](sortedObjects, 0x1020C4062D53EE8);
  }
  sortedNewObjects = (_QWORD **)self->_sortedNewObjects;
  if (sortedNewObjects)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)self->_sortedNewObjects, sortedNewObjects[1]);
    MEMORY[0x219A01ED0](sortedNewObjects, 0x1020C4062D53EE8);
  }

  -[NSCondition unlock](self->_cond, "unlock");
  v19.receiver = self;
  v19.super_class = (Class)TSUFlushingManager;
  -[TSUFlushingManager dealloc](&v19, sel_dealloc);
}

- (void)addObject:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[NSCondition lock](self->_cond, "lock");
  if (-[TSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3))
  {
    -[TSUFlushingManager _didUseObject:](self, "_didUseObject:", a3);
  }
  else
  {
    -[TSUFlushingManager advanceClock](self, "advanceClock");
    v5 = operator new();
    TSUFlushableObjectInfo::TSUFlushableObjectInfo(v5, a3);
    v7 = v5;
    *(_DWORD *)(v5 + 20) = self->_clock;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v7, &v7);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", &v7, "^v");
    -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->_objects, "setObject:forUncopiedKey:", v6, a3);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a3, "setFlushingManager:", self);
  }
  -[NSCondition broadcast](self->_cond, "broadcast");
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)removeObject:(id)a3
{
  TSUFlushable *flushingObject;
  NSThread *bgThread;
  id v7;
  uint64_t v8;
  TSUFlushableObjectInfo *v9;
  uint64_t v10;
  id *p_objects;
  uint64_t v12;

  -[NSCondition lock](self->_cond, "lock");
  flushingObject = self->_flushingObject;
  if (flushingObject != a3)
    goto LABEL_6;
  bgThread = self->_bgThread;
  if (bgThread == (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"))
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager removeObject:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 305, CFSTR("Flushing manager encountered a circular reference in removeObject:, returning"));
  }
  else
  {
    while (1)
    {
      flushingObject = self->_flushingObject;
LABEL_6:
      if (flushingObject != a3)
        break;
      -[NSCondition wait](self->_cond, "wait");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a3, "setFlushingManager:", 0);
    v9 = -[TSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
    if (v9)
    {
      v10 = (uint64_t)v9;
      p_objects = (id *)&self->_objects;
    }
    else
    {
      p_objects = (id *)&self->_inactiveObjects;
      v12 = objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3), "pointerValue");
      if (!v12)
        goto LABEL_14;
      v10 = v12;
    }
    objc_msgSend(*p_objects, "removeObjectForKey:", a3);
    MEMORY[0x219A01ED0](v10, 0x1080C40DCAC275BLL);
  }
LABEL_14:
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)protectObject:(id)a3
{
  TSUFlushableObjectInfo *v5;
  id v6;
  uint64_t v7;

  -[NSCondition lock](self->_cond, "lock");
  v5 = -[TSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
  if (v5)
  {
    v5->var3 = 0;
    -[TSUFlushingManager insertObjectInfo:](self, "insertObjectInfo:", v5);
  }
  else
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager protectObject:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 363, CFSTR("Object not under the flushing manager's control"));
  }
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)stopProtectingObject:(id)a3
{
  TSUFlushableObjectInfo *v5;
  TSUFlushableObjectInfo *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  -[NSCondition lock](self->_cond, "lock");
  v5 = -[TSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
  if (v5)
  {
    v6 = v5;
    if (v5->var3)
    {
      v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager stopProtectingObject:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 387, CFSTR("The object isn't protected"));
    }
    v6->var3 = 1;
    -[TSUFlushingManager insertObjectInfo:](self, "insertObjectInfo:", v6);
  }
  else
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager stopProtectingObject:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 384, CFSTR("Object not under the flushing manager's control"));
  }
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)doneWithObject:(id)a3
{
  TSUFlushableObjectInfo *v5;
  id v6;
  uint64_t v7;

  -[NSCondition lock](self->_cond, "lock");
  v5 = -[TSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
  if (v5)
  {
    v5->var3 = 2;
    -[TSUFlushingManager insertObjectInfo:](self, "insertObjectInfo:", v5);
  }
  else
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager doneWithObject:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 406, CFSTR("Object not under the flushing manager's control"));
  }
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)unsafeToFlush:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  NSThread *bgThread;
  id v9;
  uint64_t v10;
  TSUFlushableObjectInfo *v11;

  -[NSCondition lock](self->_cond, "lock");
  if (self->_flushingObject != a3)
  {
    if (!-[TSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3))
    {
      v11 = -[TSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
      if (!v11)
      {
        v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager unsafeToFlush:]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 450, CFSTR("Object not under the flushing manager's control"));
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", &v11, "^v");
      -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->_inactiveObjects, "setObject:forUncopiedKey:", v7, a3);

      -[TSUNoCopyDictionary removeObjectForKey:](self->_objects, "removeObjectForKey:", a3);
    }
    goto LABEL_6;
  }
  bgThread = self->_bgThread;
  if (bgThread != (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"))
  {
    while (self->_flushingObject == a3)
      -[NSCondition wait](self->_cond, "wait");
LABEL_6:
    -[NSCondition unlock](self->_cond, "unlock");
    return;
  }
  v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager unsafeToFlush:]");
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 435, CFSTR("Flushing manager encountered a circular reference in unsafeToFlush:, returning"));
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)safeToFlush:(id)a3 wasAccessed:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a4;
  -[NSCondition lock](self->_cond, "lock");
  if (-[TSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3))
  {
    if (v4)
LABEL_3:
      -[TSUFlushingManager _didUseObject:](self, "_didUseObject:", a3);
  }
  else
  {
    v10 = objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3), "pointerValue");
    if (!v10)
    {
      v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager safeToFlush:wasAccessed:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 480, CFSTR("Object not among the flushing manager's cached objects"));
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", &v10, "^v");
    -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->_objects, "setObject:forUncopiedKey:", v9, a3);

    -[TSUNoCopyDictionary removeObjectForKey:](self->_inactiveObjects, "removeObjectForKey:", a3);
    -[TSUFlushingManager insertObjectInfo:](self, "insertObjectInfo:", v10);
    if (v4)
      goto LABEL_3;
  }
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)didReceiveMemoryWarning
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__TSUFlushingManager_didReceiveMemoryWarning__block_invoke;
  block[3] = &unk_24D61AB38;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __45__TSUFlushingManager_didReceiveMemoryWarning__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushAllEligible");
}

- (void)memoryLevelIncreased:(int)a3 was:(int)a4
{
  __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  if (a3 < 1 || a4 > 0)
  {
    if (a4 > 3)
      v7 = 0;
    else
      v7 = off_24D61AB70[a4];
    if (a3 > 3)
      v8 = 0;
    else
      v8 = off_24D61AB70[a3];
    NSLog((NSString *)CFSTR("TSUFlushingManager: Memory level increased from %@ to %@"), a2, v7, v8);
  }
  else
  {
    v5 = 0;
    v6 = CFSTR("Normal (0)");
    if (a4)
      v6 = 0;
    if (a3 <= 3)
      v5 = off_24D61AB58[a3 - 1];
    NSLog((NSString *)CFSTR("TSUFlushingManager: Memory level increased from %@ to %@, flushing starting."), a2, v6, v5);
    -[TSUFlushingManager _startFlushingObjects](self, "_startFlushingObjects");
  }
}

- (void)memoryLevelDecreased:(int)a3 was:(int)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  const __CFString *v8;

  if (a3 > 0 || a4 < 1)
  {
    if (a4 > 3)
      v6 = 0;
    else
      v6 = off_24D61AB70[a4];
    if (a3 > 3)
      v7 = 0;
    else
      v7 = off_24D61AB70[a3];
    NSLog((NSString *)CFSTR("TSUFlushingManager: Memory level decreased from %@ to %@"), a2, v6, v7);
  }
  else
  {
    if (a4 > 3)
      v5 = 0;
    else
      v5 = off_24D61AB58[a4 - 1];
    v8 = CFSTR("Normal (0)");
    if (a3)
      v8 = 0;
    NSLog((NSString *)CFSTR("TSUFlushingManager: Memory level decreased from %@ to %@, flushing stopping."), a2, v5, v8);
    -[TSUFlushingManager _stopFlushingObjects](self, "_stopFlushingObjects");
  }
}

- (void)_flushAllEligible
{
  -[NSCondition lock](self->_isFlushingCond, "lock");
  if (!self->_isFlushing)
  {
    self->_isFlushing = 1;
    -[NSCondition unlock](self->_isFlushingCond, "unlock");
    -[TSUFlushingManager _bgTaskStarted](self, "_bgTaskStarted");
    *(_WORD *)&self->_stopFlushing = 256;
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__backgroundThread_, self, self);
    -[NSCondition lock](self->_isFlushingCond, "lock");
    while (self->_isFlushing)
      -[NSCondition wait](self->_isFlushingCond, "wait");
    self->_stopFlushingWhenQueueEmpty = 0;
  }
  -[NSCondition unlock](self->_isFlushingCond, "unlock");
}

- (void)_startFlushingObjects
{
  if (!self->_alwaysFlushing)
  {
    -[NSCondition lock](self->_isFlushingCond, "lock");
    while (self->_isFlushing)
      -[NSCondition wait](self->_isFlushingCond, "wait");
    self->_isFlushing = 1;
    -[NSCondition unlock](self->_isFlushingCond, "unlock");
    self->_stopFlushing = 0;
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__backgroundThread_, self, self);
  }
}

- (void)_stopFlushingObjects
{
  id v3;
  uint64_t v4;

  if (!self->_alwaysFlushing)
  {
    -[NSCondition lock](self->_isFlushingCond, "lock");
    if (self->_isFlushing
      || (v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"),
          v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager _stopFlushingObjects]"),
          objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 628, CFSTR("-stopFlushingObjects called when not flushing.")), self->_isFlushing))
    {
      -[NSCondition lock](self->_cond, "lock");
      self->_stopFlushing = 1;
      -[NSCondition broadcast](self->_cond, "broadcast");
      -[NSCondition unlock](self->_cond, "unlock");
      while (self->_isFlushing)
        -[NSCondition wait](self->_isFlushingCond, "wait");
    }
    -[NSCondition unlock](self->_isFlushingCond, "unlock");
  }
}

- (void)_backgroundThread:(id)a3
{
  void *v4;
  TSUFlushingManager *v5;
  _QWORD *sortedObjects;
  const TSUFlushableObjectInfo *v7;

  self->_bgThread = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread", a3);
  v4 = (void *)objc_opt_new();
  v5 = self;
  -[TSUFlushingManager _bgThreadActive](self, "_bgThreadActive");
  -[NSCondition lock](self->_cond, "lock");
  while (!self->_stopFlushing)
  {
    sortedObjects = self->_sortedObjects;
    if (sortedObjects[2])
    {
      v7 = 0;
      v7 = *(const TSUFlushableObjectInfo **)(*sortedObjects + 32);
      self->_flushingObject = (TSUFlushable *)v7->var0;
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedObjects, &v7);
      if (v7)
        MEMORY[0x219A01ED0](v7, 0x1080C40DCAC275BLL);
      v7 = 0;
      -[TSUNoCopyDictionary removeObjectForKey:](self->_objects, "removeObjectForKey:", self->_flushingObject);
      -[NSCondition unlock](self->_cond, "unlock");
      -[TSUFlushable flush](self->_flushingObject, "flush");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TSUFlushable setFlushingManager:](self->_flushingObject, "setFlushingManager:", 0);

      -[NSCondition lock](self->_cond, "lock");
      self->_flushingObject = 0;
      -[NSCondition broadcast](self->_cond, "broadcast");
      objc_msgSend(v4, "drain");
      v4 = (void *)objc_opt_new();
    }
    else
    {
      if (self->_stopFlushingWhenQueueEmpty)
        break;
      -[TSUFlushingManager advanceClock](self, "advanceClock");
      -[TSUFlushingManager _bgThreadInactive](self, "_bgThreadInactive");
      -[NSCondition wait](self->_cond, "wait");
      -[TSUFlushingManager _bgThreadActive](self, "_bgThreadActive");
    }
  }
  -[TSUFlushingManager _bgThreadInactive](self, "_bgThreadInactive");
  -[TSUFlushingManager _bgTaskFinished](self, "_bgTaskFinished");
  -[NSCondition broadcast](self->_cond, "broadcast");
  -[NSCondition unlock](self->_cond, "unlock");
  -[NSCondition lock](self->_isFlushingCond, "lock");
  self->_isFlushing = 0;
  -[NSCondition signal](self->_isFlushingCond, "signal");
  -[NSCondition unlock](self->_isFlushingCond, "unlock");

  objc_msgSend(v4, "drain");
  self->_bgThread = 0;
}

- (BOOL)isNewObject:(TSUFlushableObjectInfo *)a3
{
  return self->_clock - a3->var4[0] <= 4 && !a3->var4[1] && a3->var3 != 2;
}

- (TSUFlushableObjectInfo)eraseInfoForObject:(id)a3
{
  const TSUFlushableObjectInfo *v4;
  const TSUFlushableObjectInfo *v6;

  v4 = (const TSUFlushableObjectInfo *)objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3), "pointerValue");
  v6 = v4;
  if (v4)
  {
    if (-[TSUFlushingManager isNewObject:](self, "isNewObject:", v4))
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v6);
    else
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedObjects, &v6);
  }
  return (TSUFlushableObjectInfo *)v6;
}

- (void)insertObjectInfo:(TSUFlushableObjectInfo *)a3
{
  id v4;
  uint64_t v5;
  TSUFlushableObjectInfo *v6;

  v6 = a3;
  if (a3)
  {
    if (-[TSUFlushingManager isNewObject:](self, "isNewObject:"))
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v6, (uint64_t *)&v6);
    else
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedObjects, &v6, (uint64_t *)&v6);
  }
  else
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager insertObjectInfo:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 786, CFSTR("Expecting info to be non-NULL"));
  }
}

- (void)transferNewObjects
{
  char *i;
  TSUFlushableObjectInfo *v4;

  for (i = (char *)self->_sortedNewObjects; *(char **)i != i + 8; i = (char *)self->_sortedNewObjects)
  {
    v4 = 0;
    v4 = *(TSUFlushableObjectInfo **)(*(_QWORD *)i + 32);
    if (!v4)
      break;
    if (-[TSUFlushingManager isNewObject:](self, "isNewObject:"))
      break;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v4);
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedObjects, &v4, (uint64_t *)&v4);
  }
}

- (void)advanceClock
{
  ++self->_clock;
  -[TSUFlushingManager transferNewObjects](self, "transferNewObjects");
}

- (BOOL)controlsActiveObject:(id)a3
{
  return -[TSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3) != 0;
}

- (BOOL)controlsInactiveObject:(id)a3
{
  return -[TSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3) != 0;
}

- (void)_didUseObject:(id)a3
{
  TSUFlushableObjectInfo *v5;
  int var3;
  id v7;
  uint64_t v8;

  -[TSUFlushingManager advanceClock](self, "advanceClock");
  v5 = -[TSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
  if (v5)
  {
    var3 = v5->var3;
    v5->var4[1] = v5->var4[0];
    v5->var4[0] = self->_clock;
    if (var3 == 2)
      v5->var3 = 1;
    -[TSUFlushingManager insertObjectInfo:](self, "insertObjectInfo:", v5);
  }
  else
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager _didUseObject:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 838, CFSTR("Object not under the flushing manager's control"));
  }

}

- (void)_bgTaskStarted
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_sync_enter(self);
  if (self->_backgroundTransitionTaskId != *MEMORY[0x24BDF7608])
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager _bgTaskStarted]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 869, CFSTR("Should only be one bg task at a time"));
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__TSUFlushingManager__bgTaskStarted__block_invoke;
  v6[3] = &unk_24D61AB38;
  v6[4] = self;
  self->_backgroundTransitionTaskId = objc_msgSend(v3, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("TSUFlushingManager"), v6);
  objc_sync_exit(self);
}

uint64_t __36__TSUFlushingManager__bgTaskStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bgTaskFinished");
}

- (void)_bgTaskFinished
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_sync_enter(self);
  v4 = *MEMORY[0x24BDF7608];
  if (self->_backgroundTransitionTaskId != *MEMORY[0x24BDF7608])
  {
    objc_msgSend(v3, "endBackgroundTask:");
    self->_backgroundTransitionTaskId = v4;
  }
  objc_sync_exit(self);
}

- (void)_bgThreadActive
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_sync_enter(self);
  if (self->_activeBgThreadTask != *MEMORY[0x24BDF7608])
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushingManager _bgThreadActive]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 903, CFSTR("Should only be one bg thread active at a time"));
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__TSUFlushingManager__bgThreadActive__block_invoke;
  v6[3] = &unk_24D61AB38;
  v6[4] = self;
  self->_activeBgThreadTask = objc_msgSend(v3, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("TSUFlushingManager"), v6);
  objc_sync_exit(self);
}

uint64_t __37__TSUFlushingManager__bgThreadActive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bgThreadInactive");
}

- (void)_bgThreadInactive
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_sync_enter(self);
  v4 = *MEMORY[0x24BDF7608];
  if (self->_activeBgThreadTask != *MEMORY[0x24BDF7608])
  {
    objc_msgSend(v3, "endBackgroundTask:");
    self->_activeBgThreadTask = v4;
  }
  objc_sync_exit(self);
}

@end

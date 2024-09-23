@implementation OITSUFlushingManager

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___OITSUFlushingManager;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__OITSUFlushingManager_sharedManager__block_invoke;
  block[3] = &unk_24F39A608;
  block[4] = a1;
  if (+[OITSUFlushingManager sharedManager]::sOnceToken != -1)
    dispatch_once(&+[OITSUFlushingManager sharedManager]::sOnceToken, block);
  return (id)+[OITSUFlushingManager sharedManager]::sSingletonInstance;
}

uint64_t __37__OITSUFlushingManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_singletonAlloc"), "init");
  +[OITSUFlushingManager sharedManager]::sSingletonInstance = result;
  if (!result)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OITSUFlushingManager sharedManager]_block_invoke");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 144, 0, "Couldn't create singleton instance of %@", *(_QWORD *)(a1 + 32));
    return +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OITSUFlushingManager allocWithZone:]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 144, 0, "Don't alloc a singleton");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (OITSUFlushingManager)init
{
  OITSUFlushingManager *v2;
  _QWORD *v3;
  _QWORD *v4;
  NSCondition *v5;
  NSCondition *v6;
  unint64_t v7;
  int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OITSUFlushingManager;
  v2 = -[OITSUFlushingManager init](&v10, sel_init);
  if (v2)
  {
    v2->_objects = objc_alloc_init(OITSURetainedPointerKeyDictionary);
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
    v2->_inactiveObjects = objc_alloc_init(OITSUPointerKeyDictionary);
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
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TSUFlushImmediately"));
    v2->_alwaysFlushing = v8;
    if (v8)
    {
      NSLog((NSString *)CFSTR("%@ enabled, TSUFlushingManager will flush immediately"), CFSTR("TSUFlushImmediately"));
      -[OITSUFlushingManager _startFlushingObjects](v2, "_startFlushingObjects");
    }
  }
  return v2;
}

- (void)dealloc
{
  OITSURetainedPointerKeyDictionary *objects;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  OITSUPointerKeyDictionary *inactiveObjects;
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
  if (self->_isFlushing)
    -[OITSUFlushingManager _stopFlushingObjects](self, "_stopFlushingObjects");
  -[NSCondition lock](self->_cond, "lock");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objects = self->_objects;
  v4 = -[OITSUNoCopyDictionary countByEnumeratingWithState:objects:count:](objects, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
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
        v9 = objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", v8), "pointerValue");
        if (v9)
          MEMORY[0x22E2DD408](v9, 0x1080C40DCAC275BLL);
      }
      v5 = -[OITSUNoCopyDictionary countByEnumeratingWithState:objects:count:](objects, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  inactiveObjects = self->_inactiveObjects;
  v11 = -[OITSUNoCopyDictionary countByEnumeratingWithState:objects:count:](inactiveObjects, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
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
        v16 = objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", v15), "pointerValue");
        if (v16)
          MEMORY[0x22E2DD408](v16, 0x1080C40DCAC275BLL);
      }
      v12 = -[OITSUNoCopyDictionary countByEnumeratingWithState:objects:count:](inactiveObjects, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v12);
  }
  sortedObjects = (_QWORD **)self->_sortedObjects;
  if (sortedObjects)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)self->_sortedObjects, sortedObjects[1]);
    MEMORY[0x22E2DD408](sortedObjects, 0x1020C4062D53EE8);
  }
  sortedNewObjects = (_QWORD **)self->_sortedNewObjects;
  if (sortedNewObjects)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)self->_sortedNewObjects, sortedNewObjects[1]);
    MEMORY[0x22E2DD408](sortedNewObjects, 0x1020C4062D53EE8);
  }

  -[NSCondition unlock](self->_cond, "unlock");
  v19.receiver = self;
  v19.super_class = (Class)OITSUFlushingManager;
  -[OITSUFlushingManager dealloc](&v19, sel_dealloc);
}

- (void)addObject:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[NSCondition lock](self->_cond, "lock");
  if (-[OITSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3))
  {
    -[OITSUFlushingManager _didUseObject:](self, "_didUseObject:", a3);
  }
  else
  {
    -[OITSUFlushingManager advanceClock](self, "advanceClock");
    v5 = operator new();
    TSUFlushableObjectInfo::TSUFlushableObjectInfo(v5, a3);
    v7 = v5;
    *(_DWORD *)(v5 + 20) = self->_clock;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v7, &v7);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", &v7, "^v");
    -[OITSUNoCopyDictionary setObject:forUncopiedKey:](self->_objects, "setObject:forUncopiedKey:", v6, a3);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a3, "setFlushingManager:", self);
  }
  -[NSCondition broadcast](self->_cond, "broadcast");
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)removeObject:(id)a3
{
  TSUiOSMemoryWarningFlushable *flushingObject;
  NSThread *bgThread;
  uint64_t v7;
  TSUFlushableObjectInfo *v8;
  uint64_t v9;
  id *p_objects;
  uint64_t v11;

  -[NSCondition lock](self->_cond, "lock");
  flushingObject = self->_flushingObject;
  if (flushingObject != a3)
    goto LABEL_6;
  bgThread = self->_bgThread;
  if (bgThread != (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"))
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
    v8 = -[OITSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
    if (v8)
    {
      v9 = (uint64_t)v8;
      p_objects = (id *)&self->_objects;
    }
    else
    {
      p_objects = (id *)&self->_inactiveObjects;
      v11 = objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3), "pointerValue");
      if (!v11)
        goto LABEL_14;
      v9 = v11;
    }
    objc_msgSend(*p_objects, "removeObjectForKey:", a3);
    MEMORY[0x22E2DD408](v9, 0x1080C40DCAC275BLL);
    goto LABEL_14;
  }
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager removeObject:]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 261, 0, "Flushing manager encountered a circular reference in removeObject:, returning");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_14:
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)doneWithObject:(id)a3
{
  TSUFlushableObjectInfo *v5;
  uint64_t v6;

  -[NSCondition lock](self->_cond, "lock");
  v5 = -[OITSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
  if (v5)
  {
    v5->var3 = 2;
    -[OITSUFlushingManager insertObjectInfo:](self, "insertObjectInfo:", v5);
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager doneWithObject:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 312, 0, "Object not under the flushing manager's control");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)unsafeToFlush:(id)a3
{
  uint64_t v5;
  void *v6;
  NSThread *bgThread;
  uint64_t v8;
  TSUFlushableObjectInfo *v9;

  -[NSCondition lock](self->_cond, "lock");
  if (self->_flushingObject != a3)
  {
    if (!-[OITSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3))
    {
      v9 = -[OITSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
      if (!v9)
      {
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager unsafeToFlush:]");
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 347, 0, "Object not under the flushing manager's control");
        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", &v9, "^v");
      -[OITSUNoCopyDictionary setObject:forUncopiedKey:](self->_inactiveObjects, "setObject:forUncopiedKey:", v6, a3);

      -[OITSUNoCopyDictionary removeObjectForKey:](self->_objects, "removeObjectForKey:", a3);
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
  v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager unsafeToFlush:]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 337, 0, "Flushing manager encountered a circular reference in unsafeToFlush:, returning");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  -[NSCondition unlock](self->_cond, "unlock");
}

- (void)safeToFlush:(id)a3 wasAccessed:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  -[NSCondition lock](self->_cond, "lock");
  if (-[OITSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3))
  {
    if (v4)
LABEL_3:
      -[OITSUFlushingManager _didUseObject:](self, "_didUseObject:", a3);
  }
  else
  {
    v9 = objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3), "pointerValue");
    if (!v9)
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager safeToFlush:wasAccessed:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 373, 0, "Object not among the flushing manager's cached objects");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", &v9, "^v");
    -[OITSUNoCopyDictionary setObject:forUncopiedKey:](self->_objects, "setObject:forUncopiedKey:", v8, a3);

    -[OITSUNoCopyDictionary removeObjectForKey:](self->_inactiveObjects, "removeObjectForKey:", a3);
    -[OITSUFlushingManager insertObjectInfo:](self, "insertObjectInfo:", v9);
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
  block[2] = __47__OITSUFlushingManager_didReceiveMemoryWarning__block_invoke;
  block[3] = &unk_24F39A608;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __47__OITSUFlushingManager_didReceiveMemoryWarning__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushAllEligible");
}

- (void)_flushAllEligible
{
  -[NSCondition lock](self->_isFlushingCond, "lock");
  if (!self->_isFlushing)
  {
    self->_isFlushing = 1;
    -[NSCondition unlock](self->_isFlushingCond, "unlock");
    -[OITSUFlushingManager _bgTaskStarted](self, "_bgTaskStarted");
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
  uint64_t v3;

  if (!self->_alwaysFlushing)
  {
    -[NSCondition lock](self->_isFlushingCond, "lock");
    if (self->_isFlushing
      || (v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager _stopFlushingObjects]"), +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 469, 0, "-stopFlushingObjects called when not flushing."), +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled"), self->_isFlushing))
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
  OITSUFlushingManager *v5;
  void *v6;
  _QWORD *sortedObjects;
  const TSUFlushableObjectInfo *v8;

  self->_bgThread = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread", a3);
  v4 = (void *)MEMORY[0x22E2DDB58]();
  v5 = self;
  -[OITSUFlushingManager _bgThreadActive](self, "_bgThreadActive");
  v6 = (void *)MEMORY[0x22E2DDB58](-[NSCondition lock](self->_cond, "lock"));
  while (!self->_stopFlushing)
  {
    sortedObjects = self->_sortedObjects;
    if (sortedObjects[2])
    {
      v8 = 0;
      v8 = *(const TSUFlushableObjectInfo **)(*sortedObjects + 32);
      self->_flushingObject = (TSUiOSMemoryWarningFlushable *)v8->var0;
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedObjects, &v8);
      if (v8)
        MEMORY[0x22E2DD408](v8, 0x1080C40DCAC275BLL);
      v8 = 0;
      -[OITSUNoCopyDictionary removeObjectForKey:](self->_objects, "removeObjectForKey:", self->_flushingObject);
      -[NSCondition unlock](self->_cond, "unlock");
      -[TSUiOSMemoryWarningFlushable flush](self->_flushingObject, "flush");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TSUiOSMemoryWarningFlushable setFlushingManager:](self->_flushingObject, "setFlushingManager:", 0);

      -[NSCondition lock](self->_cond, "lock");
      self->_flushingObject = 0;
      -[NSCondition broadcast](self->_cond, "broadcast");
      objc_autoreleasePoolPop(v6);
      v6 = (void *)MEMORY[0x22E2DDB58]();
    }
    else
    {
      if (self->_stopFlushingWhenQueueEmpty)
        break;
      -[OITSUFlushingManager advanceClock](self, "advanceClock");
      -[OITSUFlushingManager _bgThreadInactive](self, "_bgThreadInactive");
      -[NSCondition wait](self->_cond, "wait");
      -[OITSUFlushingManager _bgThreadActive](self, "_bgThreadActive");
    }
  }
  objc_autoreleasePoolPop(v6);
  -[OITSUFlushingManager _bgThreadInactive](self, "_bgThreadInactive");
  -[OITSUFlushingManager _bgTaskFinished](self, "_bgTaskFinished");
  -[NSCondition broadcast](self->_cond, "broadcast");
  -[NSCondition unlock](self->_cond, "unlock");
  -[NSCondition lock](self->_isFlushingCond, "lock");
  self->_isFlushing = 0;
  -[NSCondition signal](self->_isFlushingCond, "signal");
  -[NSCondition unlock](self->_isFlushingCond, "unlock");
  objc_autoreleasePoolPop(v4);
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

  v4 = (const TSUFlushableObjectInfo *)objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3), "pointerValue");
  v6 = v4;
  if (v4)
  {
    if (-[OITSUFlushingManager isNewObject:](self, "isNewObject:", v4))
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v6);
    else
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedObjects, &v6);
  }
  return (TSUFlushableObjectInfo *)v6;
}

- (void)insertObjectInfo:(TSUFlushableObjectInfo *)a3
{
  uint64_t v4;
  TSUFlushableObjectInfo *v5;

  v5 = a3;
  if (a3)
  {
    if (-[OITSUFlushingManager isNewObject:](self, "isNewObject:"))
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v5, (uint64_t *)&v5);
    else
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedObjects, &v5, (uint64_t *)&v5);
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager insertObjectInfo:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 598, 0, "Expecting info to be non-NULL");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
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
    if (-[OITSUFlushingManager isNewObject:](self, "isNewObject:"))
      break;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v4);
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedObjects, &v4, (uint64_t *)&v4);
  }
}

- (void)advanceClock
{
  ++self->_clock;
  -[OITSUFlushingManager transferNewObjects](self, "transferNewObjects");
}

- (BOOL)controlsActiveObject:(id)a3
{
  return -[OITSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3) != 0;
}

- (BOOL)controlsInactiveObject:(id)a3
{
  return -[OITSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3) != 0;
}

- (void)_didUseObject:(id)a3
{
  TSUFlushableObjectInfo *v5;
  int var3;
  uint64_t v7;

  -[OITSUFlushingManager advanceClock](self, "advanceClock");
  v5 = -[OITSUFlushingManager eraseInfoForObject:](self, "eraseInfoForObject:", a3);
  if (v5)
  {
    var3 = v5->var3;
    v5->var4[1] = v5->var4[0];
    v5->var4[0] = self->_clock;
    if (var3 == 2)
      v5->var3 = 1;
    -[OITSUFlushingManager insertObjectInfo:](self, "insertObjectInfo:", v5);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager _didUseObject:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 639, 0, "Object not under the flushing manager's control");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
}

- (void)_bgTaskStarted
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_sync_enter(self);
  if (self->_backgroundTransitionTaskId != *MEMORY[0x24BDF7608])
  {
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager _bgTaskStarted]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 666, 0, "Should only be one bg task at a time");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__OITSUFlushingManager__bgTaskStarted__block_invoke;
  v5[3] = &unk_24F39A608;
  v5[4] = self;
  self->_backgroundTransitionTaskId = objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", v5);
  objc_sync_exit(self);
}

uint64_t __38__OITSUFlushingManager__bgTaskStarted__block_invoke(uint64_t a1)
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
  uint64_t v4;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_sync_enter(self);
  if (self->_activeBgThreadTask != *MEMORY[0x24BDF7608])
  {
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFlushingManager _bgThreadActive]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 695, 0, "Should only be one bg thread active at a time");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__OITSUFlushingManager__bgThreadActive__block_invoke;
  v5[3] = &unk_24F39A608;
  v5[4] = self;
  self->_activeBgThreadTask = objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", v5);
  objc_sync_exit(self);
}

uint64_t __39__OITSUFlushingManager__bgThreadActive__block_invoke(uint64_t a1)
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

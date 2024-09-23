@implementation _UICache

- (id)retainedObjectForKey:(id)a3
{
  NSObject *cacheQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___UICache_retainedObjectForKey___block_invoke;
  block[3] = &unk_1E260C288;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)objectForKey:(id)a3
{
  return -[_UICache retainedObjectForKey:](self, "retainedObjectForKey:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSObject *cacheQueue;
  _QWORD block[7];

  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29___UICache_setObject_forKey___block_invoke;
  block[3] = &unk_1E260C260;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(cacheQueue, block);
}

- (void)removeObjectForKey:(id)a3
{
  NSObject *cacheQueue;
  _QWORD v4[6];

  cacheQueue = self->_cacheQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31___UICache_removeObjectForKey___block_invoke;
  v4[3] = &unk_1E260C238;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(cacheQueue, v4);
}

- (_UICache)init
{
  _UICache *v2;
  NSObject *v3;
  __int128 v4;
  _QWORD v6[4];
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICache;
  v2 = -[_UICache init](&v8, sel_init);
  if (v2)
  {
    v2->_cacheQueue = (OS_dispatch_queue *)dispatch_queue_create("Internal _UICache queue", 0);
    v2->_cache = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
    v3 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, 0);
    v2->_memoryWarningsSource = (OS_dispatch_source *)v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v4 = *(_OWORD *)&v2->_cacheQueue;
    v6[1] = 3221225472;
    v6[2] = __16___UICache_init__block_invoke;
    v6[3] = &unk_1E260C238;
    v7 = v4;
    dispatch_source_set_event_handler(v3, v6);
    -[_UICache setClearsCacheOnLowMemoryWarnings:](v2, "setClearsCacheOnLowMemoryWarnings:", 1);
    -[_UICache setClearsCacheOnApplicationBackground:](v2, "setClearsCacheOnApplicationBackground:", 1);
  }
  return v2;
}

- (void)setClearsCacheOnLowMemoryWarnings:(BOOL)a3
{
  NSObject *memoryWarningsSource;

  if (self->_clearsCacheOnLowMemoryWarnings != a3)
  {
    memoryWarningsSource = self->_memoryWarningsSource;
    if (a3)
      dispatch_resume(memoryWarningsSource);
    else
      dispatch_suspend(memoryWarningsSource);
    self->_clearsCacheOnLowMemoryWarnings = a3;
  }
}

- (void)setClearsCacheOnApplicationBackground:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t UIApplicationDidEnterBackgroundNotification_0;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;

  if (self->_clearsCacheOnApplicationBackground != a3)
  {
    v3 = a3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = v5;
    if (v3)
    {
      v8 = *(_OWORD *)&self->_cacheQueue;
      UIApplicationDidEnterBackgroundNotification_0 = getUIApplicationDidEnterBackgroundNotification_0();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50___UICache_setClearsCacheOnApplicationBackground___block_invoke;
      v9[3] = &unk_1E260C2B0;
      v10 = v8;
      self->_noteObserver = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", UIApplicationDidEnterBackgroundNotification_0, 0, 0, v9);
    }
    else
    {
      objc_msgSend(v5, "removeObserver:", self->_noteObserver);
      self->_noteObserver = 0;
    }
    self->_clearsCacheOnApplicationBackground = v3;
  }
}

- (void)dealloc
{
  NSObject *cacheQueue;
  objc_super v4;
  _QWORD block[5];

  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19___UICache_dealloc__block_invoke;
  block[3] = &unk_1E2602FF0;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
  if (!self->_clearsCacheOnLowMemoryWarnings)
    dispatch_resume((dispatch_object_t)self->_memoryWarningsSource);
  dispatch_source_cancel((dispatch_source_t)self->_memoryWarningsSource);
  dispatch_release((dispatch_object_t)self->_memoryWarningsSource);
  if (self->_clearsCacheOnApplicationBackground)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_noteObserver);
  dispatch_release((dispatch_object_t)self->_cacheQueue);
  v4.receiver = self;
  v4.super_class = (Class)_UICache;
  -[_UICache dealloc](&v4, sel_dealloc);
}

- (void)removeAllObjects
{
  NSObject *cacheQueue;
  _QWORD block[5];

  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28___UICache_removeAllObjects__block_invoke;
  block[3] = &unk_1E2602FF0;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
}

- (BOOL)clearsCacheOnLowMemoryWarnings
{
  return self->_clearsCacheOnLowMemoryWarnings;
}

- (BOOL)clearsCacheOnApplicationBackground
{
  return self->_clearsCacheOnApplicationBackground;
}

- (id)cacheKeys
{
  void *v3;
  NSObject *cacheQueue;
  _QWORD v6[6];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  cacheQueue = self->_cacheQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __21___UICache_cacheKeys__block_invoke;
  v6[3] = &unk_1E260C238;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(cacheQueue, v6);
  return v3;
}

@end

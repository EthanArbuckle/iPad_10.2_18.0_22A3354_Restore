@implementation TKDisplayLinkManager

+ (TKDisplayLinkManager)currentDisplayLinkManager
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  TKDisplayLinkManager *v6;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", v3);
    v6 = (TKDisplayLinkManager *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = objc_alloc_init(TKDisplayLinkManager);
      if (v6)
        objc_msgSend(v5, "setObject:forKey:", v6, v3);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_releaseCurrentDisplayLinkManager
{
  objc_class *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "removeObjectForKey:", v5);
  }

}

- (TKDisplayLinkManager)init
{
  TKDisplayLinkManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *activeObservers;
  NSMutableDictionary *v5;
  NSMutableDictionary *updatedObservers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TKDisplayLinkManager;
  v2 = -[TKDisplayLinkManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    activeObservers = v2->_activeObservers;
    v2->_activeObservers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    updatedObservers = v2->_updatedObservers;
    v2->_updatedObservers = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TKDisplayLinkManager;
  -[TKDisplayLinkManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isPaused
{
  return -[CADisplayLink isPaused](self->_displayLink, "isPaused");
}

- (double)duration
{
  double result;

  -[CADisplayLink duration](self->_displayLink, "duration");
  return result;
}

- (double)timestamp
{
  double result;

  -[CADisplayLink timestamp](self->_displayLink, "timestamp");
  return result;
}

- (id)_displayLink
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  CADisplayLink *v5;
  CADisplayLink *v6;
  void *v7;

  displayLink = self->_displayLink;
  if (!displayLink)
  {
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel__displayDidRefresh_);
    v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v5 = self->_displayLink;
    self->_displayLink = v4;

    v6 = self->_displayLink;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x24BDBCA90]);

    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
    displayLink = self->_displayLink;
  }
  return displayLink;
}

- (void)_setDisplayLink:(id)a3
{
  CADisplayLink *v5;
  CADisplayLink *v6;
  CADisplayLink **p_displayLink;
  CADisplayLink *displayLink;
  CADisplayLink *v9;

  v5 = (CADisplayLink *)a3;
  displayLink = self->_displayLink;
  p_displayLink = &self->_displayLink;
  v6 = displayLink;
  if (displayLink != v5)
  {
    v9 = v5;
    -[CADisplayLink invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_displayLink, a3);
    v5 = v9;
  }

}

- (id)addObserverWithHandler:(id)a3
{
  return -[TKDisplayLinkManager addObserverForFrameInterval:handler:](self, "addObserverForFrameInterval:handler:", 1, a3);
}

- (id)addObserverForFrameInterval:(unint64_t)a3 handler:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  TKDisplayLinkManagerObserver *v9;
  void *v10;
  uint64_t v11;

  v6 = (void *)MEMORY[0x24BDD1880];
  v7 = a4;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TKDisplayLinkManagerObserver initWithBlock:frameInterval:]([TKDisplayLinkManagerObserver alloc], "initWithBlock:frameInterval:", v7, a3);

  if (self->_isHandlingDisplayRefresh)
  {
    -[TKDisplayLinkManager _prepareUpdatedObserversForModification](self, "_prepareUpdatedObserversForModification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v8);

  }
  else
  {
    v11 = -[NSMutableDictionary count](self->_activeObservers, "count");
    -[NSMutableDictionary setObject:forKey:](self->_activeObservers, "setObject:forKey:", v9, v8);
    if (!v11)
      -[TKDisplayLinkManager _didAddFirstObserver](self, "_didAddFirstObserver");
  }

  return v8;
}

- (void)removeObserverWithToken:(id)a3
{
  id v4;
  NSMutableDictionary *activeObservers;
  id v6;
  uint64_t v7;
  id v8;

  if (self->_isHandlingDisplayRefresh)
  {
    v4 = a3;
    -[TKDisplayLinkManager _prepareUpdatedObserversForModification](self, "_prepareUpdatedObserversForModification");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v4);

  }
  else
  {
    activeObservers = self->_activeObservers;
    v6 = a3;
    v7 = -[NSMutableDictionary count](activeObservers, "count");
    -[NSMutableDictionary removeObjectForKey:](self->_activeObservers, "removeObjectForKey:", v6);

    if (v7)
    {
      if (!-[NSMutableDictionary count](self->_activeObservers, "count"))
        -[TKDisplayLinkManager _didRemoveLastObserver](self, "_didRemoveLastObserver");
    }
  }
}

- (id)_prepareUpdatedObserversForModification
{
  if (!self->_hasUpdatedObservers)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_updatedObservers, "addEntriesFromDictionary:", self->_activeObservers);
    self->_hasUpdatedObservers = 1;
  }
  return self->_updatedObservers;
}

- (void)_didAddFirstObserver
{
  id v2;

  -[TKDisplayLinkManager _displayLink](self, "_displayLink");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPaused:", 0);

}

- (void)_didRemoveLastObserver
{
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  if (!-[TKDisplayLinkManager _isWarmUpModeEnabled](self, "_isWarmUpModeEnabled"))
  {
    -[TKDisplayLinkManager _setDisplayLink:](self, "_setDisplayLink:", 0);
    objc_msgSend((id)objc_opt_class(), "_releaseCurrentDisplayLinkManager");
  }
}

- (BOOL)_isWarmUpModeEnabled
{
  return self->_warmUpModeRequirementsCount != 0;
}

- (void)beginRequiringWarmUpMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2157C4000, v0, v1, "Unexpectedly has updated target actions even though not handling display refresh.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)endRequiringWarmUpMode
{
  unint64_t v2;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = self->_warmUpModeRequirementsCount - 1;
  self->_warmUpModeRequirementsCount = v2;
  if (!v2 && !self->_isHandlingDisplayRefresh)
  {
    if (self->_hasUpdatedObservers)
    {
      TLLogGeneral();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Shared/Embedded/DisplayLink/TKDisplayLinkManager.m");
        v6 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v6, "lastPathComponent");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 136381443;
          v12 = "-[TKDisplayLinkManager endRequiringWarmUpMode]";
          v13 = 2113;
          v14 = v8;
          v15 = 2049;
          v16 = 187;
          v17 = 2113;
          v18 = v9;
          _os_log_impl(&dword_2157C4000, v7, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v11, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.2();
      }

      TLLogGeneral();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[TKDisplayLinkManager beginRequiringWarmUpMode].cold.1();

    }
    if (!-[NSMutableDictionary count](self->_activeObservers, "count"))
      -[TKDisplayLinkManager _didRemoveLastObserver](self, "_didRemoveLastObserver");
  }
}

- (void)_displayDidRefresh:(id)a3
{
  _BOOL4 isHandlingDisplayRefresh;
  NSMutableDictionary *activeObservers;
  NSMutableDictionary **p_activeObservers;
  uint64_t v7;
  NSMutableDictionary *updatedObservers;
  NSMutableDictionary *v9;
  _QWORD v10[5];

  isHandlingDisplayRefresh = self->_isHandlingDisplayRefresh;
  p_activeObservers = &self->_activeObservers;
  activeObservers = self->_activeObservers;
  v7 = MEMORY[0x24BDAC760];
  self->_isHandlingDisplayRefresh = 1;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __43__TKDisplayLinkManager__displayDidRefresh___block_invoke;
  v10[3] = &unk_24D380018;
  v10[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeObservers, "enumerateKeysAndObjectsUsingBlock:", v10);
  self->_isHandlingDisplayRefresh = isHandlingDisplayRefresh;
  if (!isHandlingDisplayRefresh && self->_hasUpdatedObservers)
  {
    -[NSMutableDictionary removeAllObjects](self->_activeObservers, "removeAllObjects");
    updatedObservers = self->_updatedObservers;
    v9 = updatedObservers;
    objc_storeStrong((id *)&self->_updatedObservers, self->_activeObservers);
    objc_storeStrong((id *)p_activeObservers, updatedObservers);
    self->_hasUpdatedObservers = 0;
    if (!-[NSMutableDictionary count](self->_activeObservers, "count"))
      -[TKDisplayLinkManager _didRemoveLastObserver](self, "_didRemoveLastObserver");

  }
}

uint64_t __43__TKDisplayLinkManager__displayDidRefresh___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "displayDidRefresh:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedObservers, 0);
  objc_storeStrong((id *)&self->_activeObservers, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end

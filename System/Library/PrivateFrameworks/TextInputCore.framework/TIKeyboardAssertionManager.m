@implementation TIKeyboardAssertionManager

+ (id)sharedAssertionManager
{
  if (__testingInstance_19130)
    return (id)__testingInstance_19130;
  +[TIKeyboardAssertionManager singletonInstance](TIKeyboardAssertionManager, "singletonInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_19126 != -1)
    dispatch_once(&singletonInstance_onceToken_19126, &__block_literal_global_19127);
  return (id)singletonInstance_singletonInstance_19128;
}

- (void)scheduleUpdate
{
  if (!-[TIKeyboardAssertionManager pendingUpdate](self, "pendingUpdate"))
  {
    -[TIKeyboardAssertionManager setPendingUpdate:](self, "setPendingUpdate:", 1);
    -[TIKeyboardAssertionManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_performUpdate, 0, 0);
  }
}

- (void)performUpdate
{
  void *v3;
  uint64_t v4;
  id v5;

  -[TIKeyboardAssertionManager setPendingUpdate:](self, "setPendingUpdate:", 0);
  -[TIKeyboardAssertionManager assertions](self, "assertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if ((v4 != 0) != -[TIKeyboardAssertionManager hasAssertions](self, "hasAssertions"))
  {
    -[TIKeyboardAssertionManager setHasAssertions:](self, "setHasAssertions:", v4 != 0);
    -[TIKeyboardAssertionManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardAssertionsDidChange");

  }
}

- (void)setPendingUpdate:(BOOL)a3
{
  self->_pendingUpdate = a3;
}

- (NSHashTable)assertions
{
  return self->_assertions;
}

- (void)setHasAssertions:(BOOL)a3
{
  self->_hasAssertions = a3;
}

- (BOOL)pendingUpdate
{
  return self->_pendingUpdate;
}

- (TIKeyboardAssertionManagerDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)hasAssertions
{
  return self->_hasAssertions;
}

- (void)addAssertionForObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TIKeyboardAssertionManager assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[TIKeyboardAssertionManager scheduleUpdate](self, "scheduleUpdate");
}

- (void)removeAssertionForObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TIKeyboardAssertionManager assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[TIKeyboardAssertionManager scheduleUpdate](self, "scheduleUpdate");
}

- (TIKeyboardAssertionManager)init
{
  TIKeyboardAssertionManager *v2;
  uint64_t v3;
  NSHashTable *assertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardAssertionManager;
  v2 = -[TIKeyboardAssertionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;

  }
  return v2;
}

- (void)performBackgroundActivityUpdate
{
  int64_t v3;
  id v4;

  v3 = -[TIKeyboardAssertionManager backgroundActivityAssertions](self, "backgroundActivityAssertions");
  if (-[TIKeyboardAssertionManager hasBackgroundActivityAssertions](self, "hasBackgroundActivityAssertions") != v3 > 0)
  {
    -[TIKeyboardAssertionManager setHasBackgroundActivityAssertions:](self, "setHasBackgroundActivityAssertions:", v3 > 0);
    -[TIKeyboardAssertionManager delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundActivityAssertionsDidChange");

  }
}

- (void)retainBackgroundActivityAssertion
{
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[TIKeyboardAssertionManager setBackgroundActivityAssertions:](self, "setBackgroundActivityAssertions:", -[TIKeyboardAssertionManager backgroundActivityAssertions](self, "backgroundActivityAssertions") + 1);
    -[TIKeyboardAssertionManager performBackgroundActivityUpdate](self, "performBackgroundActivityUpdate");
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s increment background activity assertions (count=%ld)"), "-[TIKeyboardAssertionManager retainBackgroundActivityAssertion]", -[TIKeyboardAssertionManager backgroundActivityAssertions](self, "backgroundActivityAssertions"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v7 = v5;
        _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }
  else
  {
    -[TIKeyboardAssertionManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 1);
  }
}

- (void)releaseBackgroundActivityAssertion
{
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (-[TIKeyboardAssertionManager backgroundActivityAssertions](self, "backgroundActivityAssertions") >= 1)
      -[TIKeyboardAssertionManager setBackgroundActivityAssertions:](self, "setBackgroundActivityAssertions:", -[TIKeyboardAssertionManager backgroundActivityAssertions](self, "backgroundActivityAssertions") - 1);
    -[TIKeyboardAssertionManager performBackgroundActivityUpdate](self, "performBackgroundActivityUpdate");
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s decrement background activity assertions (count=%ld)"), "-[TIKeyboardAssertionManager releaseBackgroundActivityAssertion]", -[TIKeyboardAssertionManager backgroundActivityAssertions](self, "backgroundActivityAssertions"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v7 = v5;
        _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }
  else
  {
    -[TIKeyboardAssertionManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TIKeyboardAssertionManagerDelegate *)a3;
}

- (BOOL)hasBackgroundActivityAssertions
{
  return self->_hasBackgroundActivityAssertions;
}

- (void)setHasBackgroundActivityAssertions:(BOOL)a3
{
  self->_hasBackgroundActivityAssertions = a3;
}

- (int64_t)backgroundActivityAssertions
{
  return self->_backgroundActivityAssertions;
}

- (void)setBackgroundActivityAssertions:(int64_t)a3
{
  self->_backgroundActivityAssertions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
}

void __47__TIKeyboardAssertionManager_singletonInstance__block_invoke()
{
  TIKeyboardAssertionManager *v0;
  void *v1;

  v0 = objc_alloc_init(TIKeyboardAssertionManager);
  v1 = (void *)singletonInstance_singletonInstance_19128;
  singletonInstance_singletonInstance_19128 = (uint64_t)v0;

}

+ (void)setSharedAssertionManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance_19130 != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance_19130, a3);
    v4 = v5;
  }

}

@end

@implementation MTDBExtensionAccess

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_15);
  return (id)sharedInstance_sharedInstance;
}

void __37__MTDBExtensionAccess_sharedInstance__block_invoke()
{
  MTDBExtensionAccess *v0;
  void *v1;

  v0 = objc_alloc_init(MTDBExtensionAccess);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (MTDBExtensionAccess)init
{
  MTDBExtensionAccess *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTDBExtensionAccess;
  v2 = -[MTDBExtensionAccess init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    -[MTDBExtensionAccess _startObserving](v2, "_startObserving");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MTDBExtensionAccess _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)MTDBExtensionAccess;
  -[MTDBExtensionAccess dealloc](&v3, sel_dealloc);
}

- (BOOL)isReady
{
  return +[MTDB canExtensionOpenDatabase](MTDB, "canExtensionOpenDatabase");
}

- (void)attemptToFix
{
  MTDBExtensionAccess *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_hasAttemptedToFix)
    obj->_hasAttemptedToFix = 1;
  objc_sync_exit(obj);

}

- (void)addObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)MTDBExtensionAccessContext == a6)
  {
    -[MTDBExtensionAccess _handleChange](self, "_handleChange", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MTDBExtensionAccess;
    -[MTDBExtensionAccess observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_startObserving
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _MTLogCategoryDatabase();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A904E000, v3, OS_LOG_TYPE_DEFAULT, "MTDBExtensionAccess will start observing", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("MTDetectedCorruptDB"), 0, MTDBExtensionAccessContext);

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("MTCoreDataMigrationVersion"), 0, MTDBExtensionAccessContext);

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("MTLibraryMigrationVersion"), 0, MTDBExtensionAccessContext);

}

- (void)_stopObserving
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("MTDetectedCorruptDB"), MTDBExtensionAccessContext);

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("MTCoreDataMigrationVersion"), MTDBExtensionAccessContext);

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("MTLibraryMigrationVersion"), MTDBExtensionAccessContext);

  _MTLogCategoryDatabase();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A904E000, v6, OS_LOG_TYPE_DEFAULT, "MTDBExtensionAccess did stop observing", v7, 2u);
  }

}

- (void)_handleChange
{
  NSObject *v3;
  NSHashTable *v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryDatabase();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = +[MTDB canExtensionOpenDatabase](MTDB, "canExtensionOpenDatabase");
    _os_log_impl(&dword_1A904E000, v3, OS_LOG_TYPE_DEFAULT, "MTDBExtensionAccess extension access did change %x will notify observers", buf, 8u);
  }

  v4 = self->_observers;
  objc_sync_enter(v4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "extensionAccessDidChange", (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end

@implementation WFVoiceShortcutCache

- (WFVoiceShortcutCache)init
{
  WFVoiceShortcutCache *v2;
  uint64_t v3;
  NSMutableArray *waitingFetchRequests;
  void *v5;
  WFVoiceShortcutCache *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFVoiceShortcutCache;
  v2 = -[WFVoiceShortcutCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    waitingFetchRequests = v2->_waitingFetchRequests;
    v2->_waitingFetchRequests = (NSMutableArray *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    +[VCAccessSpecifier accessSpecifierForCurrentProcess](VCAccessSpecifier, "accessSpecifierForCurrentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_enabled = objc_msgSend(v5, "allowUnrestrictedAccess") ^ 1;
    v6 = v2;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[WFVoiceShortcutCache unregisterFromDatabaseNotifications](self, "unregisterFromDatabaseNotifications");
  v3.receiver = self;
  v3.super_class = (Class)WFVoiceShortcutCache;
  -[WFVoiceShortcutCache dealloc](&v3, sel_dealloc);
}

- (void)getCachedVoiceShortcuts:(id)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**aBlock)(id, _QWORD);

  aBlock = (void (**)(id, _QWORD))a3;
  if (!aBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVoiceShortcutCache.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultBlock"));

  }
  if (!-[WFVoiceShortcutCache isEnabled](self, "isEnabled"))
  {
    aBlock[2](aBlock, 0);
    goto LABEL_9;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[WFVoiceShortcutCache state](self, "state");
  if (v6 == 1)
  {
    -[WFVoiceShortcutCache waitingFetchRequests](self, "waitingFetchRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _Block_copy(aBlock);
    objc_msgSend(v10, "addObject:", v11);

    os_unfair_lock_unlock(p_lock);
    goto LABEL_9;
  }
  v7 = aBlock;
  if (!v6)
  {
    -[WFVoiceShortcutCache voiceShortcuts](self, "voiceShortcuts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    os_unfair_lock_unlock(p_lock);
    ((void (**)(id, void *))aBlock)[2](aBlock, v9);

LABEL_9:
    v7 = aBlock;
  }

}

- (void)setCachedVoiceShortcuts:(id)a3
{
  void (**v5)(id, _QWORD *);
  void *v6;
  _QWORD v7[5];

  v5 = (void (**)(id, _QWORD *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVoiceShortcutCache.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("setterBlock"));

  }
  if (-[WFVoiceShortcutCache isEnabled](self, "isEnabled"))
  {
    os_unfair_lock_lock(&self->_lock);
    if (-[WFVoiceShortcutCache state](self, "state") == 1)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      self->_state = 1;
      os_unfair_lock_unlock(&self->_lock);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __48__WFVoiceShortcutCache_setCachedVoiceShortcuts___block_invoke_2;
      v7[3] = &unk_1E5FC6388;
      v7[4] = self;
      v5[2](v5, v7);
    }
  }
  else
  {
    v5[2](v5, __block_literal_global_6366);
  }

}

- (void)clear
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WFVoiceShortcutCache setVoiceShortcuts:](self, "setVoiceShortcuts:", 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)setVoiceShortcuts:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_voiceShortcuts != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_voiceShortcuts, a3);
    -[WFVoiceShortcutCache registerForDatabaseNotifications](self, "registerForDatabaseNotifications");
    v5 = v6;
  }

}

- (void)registerForDatabaseNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_databaseDidChange, CFSTR("com.apple.shortcuts.WFCoreDataDatabaseContextDidSaveNotification"), 0);

}

- (void)unregisterFromDatabaseNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.shortcuts.WFCoreDataDatabaseContextDidSaveNotification"), 0);

}

- (void)databaseDidChange
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFVoiceShortcutClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[WFVoiceShortcutCache databaseDidChange]";
    _os_log_impl(&dword_1AF681000, v3, OS_LOG_TYPE_DEBUG, "%s Shortcuts database changed - clearing out voice shortcuts cache.", (uint8_t *)&v4, 0xCu);
  }

  -[WFVoiceShortcutCache clear](self, "clear");
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSArray)voiceShortcuts
{
  return self->_voiceShortcuts;
}

- (NSMutableArray)waitingFetchRequests
{
  return self->_waitingFetchRequests;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingFetchRequests, 0);
  objc_storeStrong((id *)&self->_voiceShortcuts, 0);
}

void __48__WFVoiceShortcutCache_setCachedVoiceShortcuts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
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

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "setVoiceShortcuts:", v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "waitingFetchRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(*(id *)(a1 + 32), "waitingFetchRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v5;
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

@end

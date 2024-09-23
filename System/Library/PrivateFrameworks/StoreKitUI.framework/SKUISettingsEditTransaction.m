@implementation SKUISettingsEditTransaction

- (SKUISettingsEditTransaction)initWithSettingDescriptions:(id)a3
{
  id v4;
  SKUISettingsEditTransaction *v5;
  uint64_t v6;
  NSSet *all;
  NSLock *v8;
  NSLock *lock;
  objc_super v11;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsEditTransaction initWithSettingDescriptions:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUISettingsEditTransaction;
  v5 = -[SKUISettingsEditTransaction init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    all = v5->_all;
    v5->_all = (NSSet *)v6;

    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v5->_lock;
    v5->_lock = v8;

    -[NSLock setName:](v5->_lock, "setName:", CFSTR("com.apple.StoreKit.settingsEditTransaction"));
  }

  return v5;
}

- (void)beginTransaction
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_all;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "beginEditing", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[SKUISettingsEditTransaction _delegateWillBeginTransaction](self, "_delegateWillBeginTransaction");
}

- (void)cancelTransaction
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *pending;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_all;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancelEdits", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSLock lock](self->_lock, "lock");
  pending = self->_pending;
  self->_pending = 0;

  -[NSLock unlock](self->_lock, "unlock");
  -[SKUISettingsEditTransaction _delegateDidFailTransaction](self, "_delegateDidFailTransaction");
}

- (void)commitTransaction
{
  NSMutableSet *v3;
  NSMutableSet *pending;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id location;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[SKUISettingsEditTransaction _delegateWillCommitTransaction](self, "_delegateWillCommitTransaction");
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  pending = self->_pending;
  self->_pending = v3;

  self->_success = 1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_all;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __48__SKUISettingsEditTransaction_commitTransaction__block_invoke;
        v11[3] = &unk_1E73A7CC8;
        objc_copyWeak(&v12, &location);
        v11[4] = v10;
        if (objc_msgSend(v10, "commitEdits:", v11))
        {
          -[NSLock lock](self->_lock, "lock");
          -[NSMutableSet addObject:](self->_pending, "addObject:", v10);
          -[NSLock unlock](self->_lock, "unlock");
        }
        objc_destroyWeak(&v12);
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }

  objc_destroyWeak(&location);
}

void __48__SKUISettingsEditTransaction_commitTransaction__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_settingDescription:completedWithSuccess:", *(_QWORD *)(a1 + 32), a2);

}

- (BOOL)isCommiting
{
  NSMutableSet *pending;
  BOOL v4;

  -[NSLock lock](self->_lock, "lock");
  pending = self->_pending;
  if (pending)
    v4 = -[NSMutableSet count](pending, "count") != 0;
  else
    v4 = 0;
  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

- (BOOL)isValid
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_all;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "editsValid", (_QWORD)v9))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (void)rollbackTransaction
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *pending;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_all;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "discardEdits", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSLock lock](self->_lock, "lock");
  pending = self->_pending;
  self->_pending = 0;

  -[NSLock unlock](self->_lock, "unlock");
  -[SKUISettingsEditTransaction _delegateDidCompleteTransaction](self, "_delegateDidCompleteTransaction");
}

- (void)_delegateDidCompleteTransaction
{
  SKUISettingsEditTransactionDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "settingsEditTransactionDidCompleteTransaction:", self);

    }
  }
}

- (void)_delegateDidFailTransaction
{
  SKUISettingsEditTransactionDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "settingsEditTransactionDidFailTransaction:", self);

    }
  }
}

- (void)_delegateWillBeginTransaction
{
  SKUISettingsEditTransactionDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "settingsEditTransactionWillBeginTransaction:", self);

    }
  }
}

- (void)_delegateWillCommitTransaction
{
  SKUISettingsEditTransactionDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "settingsEditTransactionWillCommitTransaction:", self);

    }
  }
}

- (void)_finalizeCommit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SKUISettingsEditTransaction__finalizeCommit__block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __46__SKUISettingsEditTransaction__finalizeCommit__block_invoke(uint64_t a1)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[40])
    return objc_msgSend(v1, "_delegateDidCompleteTransaction");
  else
    return objc_msgSend(v1, "_delegateDidFailTransaction");
}

- (void)_settingDescription:(id)a3 completedWithSuccess:(BOOL)a4
{
  NSLock *lock;
  id v7;
  BOOL v8;
  uint64_t v9;

  lock = self->_lock;
  v7 = a3;
  -[NSLock lock](lock, "lock");
  v8 = self->_success && a4;
  self->_success = v8;
  -[NSMutableSet removeObject:](self->_pending, "removeObject:", v7);

  v9 = -[NSMutableSet count](self->_pending, "count");
  -[NSLock unlock](self->_lock, "unlock");
  if (!v9)
    -[SKUISettingsEditTransaction _finalizeCommit](self, "_finalizeCommit");
}

- (SKUISettingsEditTransactionDelegate)delegate
{
  return (SKUISettingsEditTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_commitBlock, 0);
  objc_storeStrong((id *)&self->_all, 0);
}

- (void)initWithSettingDescriptions:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISettingsEditTransaction initWithSettingDescriptions:]";
}

@end

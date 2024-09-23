@implementation STUIStatusBarDataAggregator

- (NSSet)delayedEntryKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_delayedKeys);
}

- (void)updateWithData:(id)a3
{
  id v4;
  objc_class *v5;
  Class dataClass;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!self->_dataClass)
  {
    objc_opt_class();
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    dataClass = self->_dataClass;
    self->_dataClass = v5;

    v4 = v7;
  }
  -[STUIStatusBarDataAggregator _updateForOverlayWithData:](self, "_updateForOverlayWithData:", v4);

}

- (void)_updateForOverlayWithData:(id)a3
{
  id v4;

  objc_msgSend(a3, "dataByApplyingOverlay:", self->_overlayData);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDataAggregator _updateForDelayedKeysWithData:](self, "_updateForDelayedKeysWithData:", v4);

}

- (void)_updateForDelayedKeysWithData:(id)a3
{
  NSCountedSet *delayedKeys;
  uint64_t v5;
  void *v6;
  id v7;

  delayedKeys = self->_delayedKeys;
  v7 = a3;
  if (-[NSCountedSet count](delayedKeys, "count"))
  {
    -[STUIStatusBarDataAggregator _updatedDataFromData:delayedKeys:](self, "_updatedDataFromData:delayedKeys:", v7, self->_delayedKeys);
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[STUIStatusBarDataAggregator _updateForCoalescedKeysWithData:](self, "_updateForCoalescedKeysWithData:", v5);
      v6 = (void *)v5;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[STUIStatusBarDataAggregator _updateForCoalescedKeysWithData:](self, "_updateForCoalescedKeysWithData:", v7);
    v6 = v7;
  }

}

- (void)_updateForCoalescedKeysWithData:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  NSMutableDictionary *coalescedKeys;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  _QWORD v9[4];
  id v10;
  STUIStatusBarDataAggregator *v11;

  v8 = a3;
  if (-[NSMutableDictionary count](self->_coalescedKeys, "count"))
  {
    -[STUIStatusBarDataAggregator coalescedEntryKeys](self, "coalescedEntryKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarDataAggregator _updatedDataFromData:delayedKeys:](self, "_updatedDataFromData:delayedKeys:", v8, v4);
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    coalescedKeys = self->_coalescedKeys;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__STUIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke;
    v9[3] = &unk_1E8D63FA8;
    v10 = v8;
    v11 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](coalescedKeys, "enumerateKeysAndObjectsUsingBlock:", v9);
    if (v5)
    {
      -[STUIStatusBarDataAggregator updateBlock](self, "updateBlock");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, v5);

    }
  }
  else
  {
    -[STUIStatusBarDataAggregator updateBlock](self, "updateBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v8);
  }

}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (id)_updatedDataFromData:(id)a3 delayedKeys:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v7;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v6, "valueForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            +[STUIStatusBarDataAggregatorUpdate updateWithEntry:](STUIStatusBarDataAggregatorUpdate, "updateWithEntry:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingUpdates, "setObject:forKeyedSubscript:", v15, v13);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(v6, "dataByRemovingEntriesForKeys:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEmpty") & 1) != 0)
      v17 = 0;
    else
      v17 = v16;

    v7 = v19;
  }
  else
  {
    v17 = v6;
  }

  return v17;
}

- (STStatusBarData)overlayData
{
  return self->_overlayData;
}

- (STUIStatusBarDataAggregator)initWithUpdateBlock:(id)a3
{
  id v4;
  STUIStatusBarDataAggregator *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  BSInvalidatable *stateCaptureHandle;
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STUIStatusBarDataAggregator;
  v5 = -[STUIStatusBarDataAggregator init](&v19, sel_init);
  -[STUIStatusBarDataAggregator setUpdateBlock:](v5, "setUpdateBlock:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  -[STUIStatusBarDataAggregator setDelayedKeys:](v5, "setDelayedKeys:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[STUIStatusBarDataAggregator setPendingUpdates:](v5, "setPendingUpdates:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[STUIStatusBarDataAggregator setCoalescedKeys:](v5, "setCoalescedKeys:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[STUIStatusBarDataAggregator setCoalescedTimers:](v5, "setCoalescedTimers:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[STUIStatusBarDataAggregator succinctDescription](v5, "succinctDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SystemStatusUI - StatusBar - %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v5);
  v13 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v17, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v14 = objc_claimAutoreleasedReturnValue();
  stateCaptureHandle = v5->_stateCaptureHandle;
  v5->_stateCaptureHandle = (BSInvalidatable *)v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarDataAggregator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setPendingUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUpdates, a3);
}

- (void)setDelayedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_delayedKeys, a3);
}

- (void)setCoalescedTimers:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedTimers, a3);
}

- (void)setCoalescedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedKeys, a3);
}

- (id)beginDelayingUpdatesForEntryKeys:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  STUIStatusBarDataAggregatorUpdateDelayToken *v11;
  STUIStatusBarDataAggregatorUpdateDelayToken *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _STUIStatusBar_Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_1CFE2E000, v5, OS_LOG_TYPE_DEBUG, "begin delaying updates for %@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSCountedSet addObject:](self->_delayedKeys, "addObject:", v10);
        objc_msgSend((id)_statusBarDelayedDataEntryKeys, "addObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_initWeak((id *)buf, self);
  v11 = [STUIStatusBarDataAggregatorUpdateDelayToken alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__STUIStatusBarDataAggregator_beginDelayingUpdatesForEntryKeys___block_invoke;
  v14[3] = &unk_1E8D63F30;
  objc_copyWeak(&v15, (id *)buf);
  v12 = -[STUIStatusBarDataAggregatorUpdateDelayToken initWithEntryKeys:timeout:timeoutBlock:](v11, "initWithEntryKeys:timeout:timeoutBlock:", v6, v14, 5.0);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return v12;
}

- (void)endDelayingUpdates:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSCountedSet *delayedKeys;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSCountedSet *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isInvalidated") & 1) == 0)
    {
      objc_msgSend(v5, "invalidate");
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_delayedKeys);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v5, "delayedKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            -[NSCountedSet removeObject:](self->_delayedKeys, "removeObject:", v12);
            objc_msgSend((id)_statusBarDelayedDataEntryKeys, "removeObject:", v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        }
        while (v9);
      }

      _STUIStatusBar_Log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "delayedKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        delayedKeys = self->_delayedKeys;
        *(_DWORD *)buf = 138412546;
        v22 = v14;
        v23 = 2112;
        v24 = delayedKeys;
        _os_log_impl(&dword_1CFE2E000, v13, OS_LOG_TYPE_DEBUG, "end delaying updates for %@, remaining keys: %@", buf, 0x16u);

      }
      objc_msgSend(v6, "minusSet:", self->_delayedKeys);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __50__STUIStatusBarDataAggregator_endDelayingUpdates___block_invoke;
      v16[3] = &unk_1E8D63F58;
      v16[4] = self;
      -[STUIStatusBarDataAggregator _updateFromPendingUpdatesForKeys:block:](self, "_updateFromPendingUpdatesForKeys:block:", v6, v16);

    }
  }

}

- (void)_updateFromPendingUpdatesForKeys:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  id obj;
  _QWORD v28[4];
  id v29;
  void (**v30)(_QWORD, _QWORD);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v8)
  {
    v9 = v8;
    v26 = (void (**)(_QWORD, _QWORD))v7;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingUpdates, "objectForKeyedSubscript:", v14, v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = objc_msgSend(v15, "animated");
          if (v17)
            v18 = v10;
          else
            v18 = v11;
          if (!v18)
          {
            v19 = v17;
            v20 = objc_alloc_init(MEMORY[0x1E0DB0950]);
            v18 = v20;
            if (v19)
              v10 = v20;
            else
              v11 = v20;
          }
          objc_msgSend(v16, "entry");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setEntry:forKey:", v21, v14);

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingUpdates, "setObject:forKeyedSubscript:", 0, v14);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v9);
    v7 = v26;
    if (v11)
    {
      _STUIStatusBar_Log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v11;
        _os_log_impl(&dword_1CFE2E000, v22, OS_LOG_TYPE_DEBUG, "performing pending non-animated updates with data: %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x1E0DC3F10];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __70__STUIStatusBarDataAggregator__updateFromPendingUpdatesForKeys_block___block_invoke;
      v28[3] = &unk_1E8D63F08;
      v30 = v26;
      v29 = v11;
      objc_msgSend(v23, "performWithoutAnimation:", v28);

    }
    if (v10)
    {
      _STUIStatusBar_Log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v10;
        _os_log_impl(&dword_1CFE2E000, v24, OS_LOG_TYPE_DEBUG, "performing pending animated updates with data: %@", buf, 0xCu);
      }

      objc_msgSend(v10, "immutableCopy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v26)[2](v26, v25);

    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

}

uint64_t __50__STUIStatusBarDataAggregator_endDelayingUpdates___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCoalescedKeysWithData:", a2);
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarDataAggregator;
  -[STUIStatusBarDataAggregator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_coalescedTimers, 0);
  objc_storeStrong((id *)&self->_coalescedKeys, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_delayedKeys, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_overlayData, 0);
}

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v3 = (void *)_statusBarDelayedDataEntryKeys;
    _statusBarDelayedDataEntryKeys = (uint64_t)v2;

  }
}

id __51__STUIStatusBarDataAggregator_initWithUpdateBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __70__STUIStatusBarDataAggregator__updateFromPendingUpdatesForKeys_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "immutableCopy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __64__STUIStatusBarDataAggregator_beginDelayingUpdatesForEntryKeys___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4 && WeakRetained)
    objc_msgSend(WeakRetained, "endDelayingUpdates:", v4);

}

void __63__STUIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id location;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v8 = (void *)MEMORY[0x1E0C99E88];
    objc_msgSend(v6, "doubleValue");
    v10 = v9;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__STUIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke_2;
    v13[3] = &unk_1E8D63F80;
    objc_copyWeak(&v14, &location);
    v13[4] = v5;
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", v11, v5);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __63__STUIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_coalescedUpdateForEntryKeys:", v2);

}

- (void)_coalescedUpdateForEntryKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[STUIStatusBarDataAggregator updateBlock](self, "updateBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDataAggregator _updateFromPendingUpdatesForKeys:block:](self, "_updateFromPendingUpdatesForKeys:block:", v4, v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_coalescedTimers, "objectForKeyedSubscript:", v11, (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "invalidate");

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coalescedTimers, "setObject:forKeyedSubscript:", 0, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)beginCoalescingUpdatesForEntryKeys:(id)a3 delay:(double)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_coalescedKeys, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coalescedKeys, "setObject:forKeyedSubscript:", v13, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)endCoalescingUpdatesForEntryKeys:(id)a3
{
  id v4;
  NSMutableDictionary *coalescedKeys;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v7, "minusSet:", self->_delayedKeys);
  -[STUIStatusBarDataAggregator _coalescedUpdateForEntryKeys:](self, "_coalescedUpdateForEntryKeys:", v7);
  coalescedKeys = self->_coalescedKeys;
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectsForKeys:](coalescedKeys, "removeObjectsForKeys:", v6);
}

- (NSSet)coalescedEntryKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_coalescedKeys, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarDataAggregator descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDataAggregator descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  STUIStatusBarDataAggregator *v11;

  v4 = a3;
  -[STUIStatusBarDataAggregator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__STUIStatusBarDataAggregator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8D62C88;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __69__STUIStatusBarDataAggregator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "delayedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("delayedKeys"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "coalescedKeys");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("coalescedKeys"), 1);

}

- (void)setOverlayData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (Class)dataClass
{
  return self->_dataClass;
}

- (void)setDataClass:(Class)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSCountedSet)delayedKeys
{
  return self->_delayedKeys;
}

- (NSMutableDictionary)pendingUpdates
{
  return self->_pendingUpdates;
}

- (NSMutableDictionary)coalescedKeys
{
  return self->_coalescedKeys;
}

- (NSMutableDictionary)coalescedTimers
{
  return self->_coalescedTimers;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

@end

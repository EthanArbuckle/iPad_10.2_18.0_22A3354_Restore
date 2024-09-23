@implementation _UIStatusBarDataAggregator

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

- (_UIStatusBarDataAggregator)initWithUpdateBlock:(id)a3
{
  id v3;
  _UIStatusBarDataAggregator *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataAggregator;
  v3 = a3;
  v4 = -[_UIStatusBarDataAggregator init](&v10, sel_init);
  -[_UIStatusBarDataAggregator setUpdateBlock:](v4, "setUpdateBlock:", v3, v10.receiver, v10.super_class);

  v5 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  -[_UIStatusBarDataAggregator setDelayedKeys:](v4, "setDelayedKeys:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_UIStatusBarDataAggregator setPendingUpdates:](v4, "setPendingUpdates:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_UIStatusBarDataAggregator setCoalescedKeys:](v4, "setCoalescedKeys:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_UIStatusBarDataAggregator setCoalescedTimers:](v4, "setCoalescedTimers:", v8);

  return v4;
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
  -[_UIStatusBarDataAggregator _updateForOverlayWithData:](self, "_updateForOverlayWithData:", v4);

}

- (id)_updatedDataFromData:(id)a3 delayedKeys:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
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
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v19 = v7;
      v11 = 0;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v6, "valueForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            if (!v11)
              v11 = (id)objc_msgSend(v6, "copy");
            objc_msgSend(v11, "setValue:forKey:", 0, v14);
            +[_UIStatusBarDataAggregatorUpdate updateWithEntry:](_UIStatusBarDataAggregatorUpdate, "updateWithEntry:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingUpdates, "setObject:forKeyedSubscript:", v16, v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);

      v7 = v19;
      if (v11)
      {
        if ((objc_msgSend(v11, "isEmpty") & 1) != 0)
        {
          v17 = 0;
        }
        else
        {
          v11 = v11;
          v17 = v11;
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
    v17 = v6;
    v11 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v17 = v6;
LABEL_21:

  return v17;
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
  void (**v22)(_QWORD, _QWORD);
  id obj;
  _QWORD v24[4];
  id v25;
  void (**v26)(_QWORD, _QWORD);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v22 = (void (**)(_QWORD, _QWORD))v7;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingUpdates, "objectForKeyedSubscript:", v14, v22);
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
            v20 = objc_alloc_init(self->_dataClass);
            v18 = v20;
            if (v19)
              v10 = v20;
            else
              v11 = v20;
          }
          objc_msgSend(v16, "entry");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setValue:forKey:", v21, v14);

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingUpdates, "setObject:forKeyedSubscript:", 0, v14);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
    v7 = v22;
    if (v11)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __69___UIStatusBarDataAggregator__updateFromPendingUpdatesForKeys_block___block_invoke;
      v24[3] = &unk_1E16B2F48;
      v26 = v22;
      v25 = v11;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);

    }
    if (v10)
      ((void (**)(_QWORD, void *))v22)[2](v22, v10);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

}

- (void)_updateForOverlayWithData:(id)a3
{
  id v4;

  objc_msgSend(a3, "dataByApplyingOverlay:", self->_overlayData);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDataAggregator _updateForDelayedKeysWithData:](self, "_updateForDelayedKeysWithData:", v4);

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
    -[_UIStatusBarDataAggregator _updatedDataFromData:delayedKeys:](self, "_updatedDataFromData:delayedKeys:", v7, self->_delayedKeys);
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UIStatusBarDataAggregator _updateForCoalescedKeysWithData:](self, "_updateForCoalescedKeysWithData:", v5);
      v6 = (void *)v5;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[_UIStatusBarDataAggregator _updateForCoalescedKeysWithData:](self, "_updateForCoalescedKeysWithData:", v7);
    v6 = v7;
  }

}

- (void)beginDelayingUpdatesForEntryKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[NSCountedSet addObject:](self->_delayedKeys, "addObject:", v9);
        objc_msgSend((id)_statusBarDelayedDataEntryKeys, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)endDelayingUpdatesForEntryKeys:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_delayedKeys);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!-[NSCountedSet countForObject:](self->_delayedKeys, "countForObject:", v13))
        {
          objc_msgSend(*(id *)(v11 + 1160), "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDataAggregator.m"), 187, CFSTR("Ending delayed updates for non-delayed key %@"), v13);

          v11 = 0x1E0CB3000;
        }
        -[NSCountedSet removeObject:](self->_delayedKeys, "removeObject:", v13);
        objc_msgSend((id)_statusBarDelayedDataEntryKeys, "removeObject:", v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "minusSet:", self->_delayedKeys);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61___UIStatusBarDataAggregator_endDelayingUpdatesForEntryKeys___block_invoke;
  v15[3] = &unk_1E16E26F0;
  v15[4] = self;
  -[_UIStatusBarDataAggregator _updateFromPendingUpdatesForKeys:block:](self, "_updateFromPendingUpdatesForKeys:block:", v6, v15);

}

- (NSSet)delayedEntryKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_delayedKeys);
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
  _UIStatusBarDataAggregator *v11;

  v8 = a3;
  if (-[NSMutableDictionary count](self->_coalescedKeys, "count"))
  {
    -[_UIStatusBarDataAggregator coalescedEntryKeys](self, "coalescedEntryKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDataAggregator _updatedDataFromData:delayedKeys:](self, "_updatedDataFromData:delayedKeys:", v8, v4);
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    coalescedKeys = self->_coalescedKeys;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62___UIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke;
    v9[3] = &unk_1E16E2718;
    v10 = v8;
    v11 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](coalescedKeys, "enumerateKeysAndObjectsUsingBlock:", v9);
    if (v5)
    {
      -[_UIStatusBarDataAggregator updateBlock](self, "updateBlock");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, v5);

    }
  }
  else
  {
    -[_UIStatusBarDataAggregator updateBlock](self, "updateBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v8);
  }

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
  -[_UIStatusBarDataAggregator updateBlock](self, "updateBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDataAggregator _updateFromPendingUpdatesForKeys:block:](self, "_updateFromPendingUpdatesForKeys:block:", v4, v5);

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
  -[_UIStatusBarDataAggregator _coalescedUpdateForEntryKeys:](self, "_coalescedUpdateForEntryKeys:", v7);
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

- (_UIStatusBarData)overlayData
{
  return self->_overlayData;
}

- (void)setOverlayData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (void)setDelayedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_delayedKeys, a3);
}

- (NSMutableDictionary)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUpdates, a3);
}

- (NSMutableDictionary)coalescedKeys
{
  return self->_coalescedKeys;
}

- (void)setCoalescedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedKeys, a3);
}

- (NSMutableDictionary)coalescedTimers
{
  return self->_coalescedTimers;
}

- (void)setCoalescedTimers:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedTimers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedTimers, 0);
  objc_storeStrong((id *)&self->_coalescedKeys, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_delayedKeys, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_overlayData, 0);
}

@end

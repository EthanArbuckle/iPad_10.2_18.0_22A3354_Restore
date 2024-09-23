@implementation REMChangedKeysObserver

- (REMChangedKeysObserver)initWithTarget:(id)a3 keysToObserve:(id)a4 includeInitial:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  REMChangedKeysObserver *v11;
  REMChangedKeysObserver *v12;
  NSMutableSet *v13;
  NSMutableSet *mutableChangedKeys;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)REMChangedKeysObserver;
  v11 = -[REMChangedKeysObserver init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_target, a3);
    objc_storeStrong((id *)&v12->_keysToObserve, a4);
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableChangedKeys = v12->_mutableChangedKeys;
    v12->_mutableChangedKeys = v13;

    v24 = 0u;
    v25 = 0u;
    if (v5)
      v15 = 7;
    else
      v15 = 3;
    v22 = 0uLL;
    v23 = 0uLL;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v12, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v15, 0, (_QWORD)v22);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v18);
    }

  }
  return v12;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
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
  v3 = self->_keysToObserve;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[NSObject removeObserver:forKeyPath:context:](self->_target, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)REMChangedKeysObserver;
  -[REMChangedKeysObserver dealloc](&v8, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = *MEMORY[0x1E0CB2CC8];
  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v11;
  if (v11 != v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqual:", v14);

    if (v15)
    {

      v12 = 0;
    }
    v13 = v11;
    if (v11 != v12)
    {
      if ((objc_msgSend(v11, "isEqual:", v12) & 1) == 0)
      {
        +[REMLog utility](REMLog, "utility");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v18 = 138412802;
          v19 = v8;
          v20 = 2112;
          v21 = v11;
          v22 = 2112;
          v23 = v12;
          _os_log_debug_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_DEBUG, "REMChangedKeysObserver detected a change {keyPath: %@, old: %@, new: %@}", (uint8_t *)&v18, 0x20u);
        }

        -[REMChangedKeysObserver mutableChangedKeys](self, "mutableChangedKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v8);

      }
      v13 = v12;
    }
  }

}

- (void)keyDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMChangedKeysObserver mutableChangedKeys](self, "mutableChangedKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSObject)target
{
  return self->_target;
}

- (NSArray)keysToObserve
{
  return self->_keysToObserve;
}

- (void)setKeysToObserve:(id)a3
{
  objc_storeStrong((id *)&self->_keysToObserve, a3);
}

- (NSMutableSet)mutableChangedKeys
{
  return self->_mutableChangedKeys;
}

- (void)setMutableChangedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_mutableChangedKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableChangedKeys, 0);
  objc_storeStrong((id *)&self->_keysToObserve, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end

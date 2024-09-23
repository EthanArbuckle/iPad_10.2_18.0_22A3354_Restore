@implementation _LTDLanguageAssetCache

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_8);
  return (id)shared__cache;
}

- (_LTDLanguageAssetCache)init
{
  _LTDLanguageAssetCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  uint64_t v5;
  NSSet *requiredAssetIdentifiers;
  uint64_t v7;
  NSMutableDictionary *observers;
  _LTDLanguageAssetCache *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_LTDLanguageAssetCache;
  v2 = -[_LTDLanguageAssetCache init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    requiredAssetIdentifiers = v2->_requiredAssetIdentifiers;
    v2->_requiredAssetIdentifiers = (NSSet *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_readyFilterSet = 0;
    v7 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v7;

    v9 = v2;
  }

  return v2;
}

- (id)_readAllAssets
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_cache, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)_availableIdentifiers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_cache, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)markReadyForFilter:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t v6;
  NSObject *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  switch(__ROR8__(a3, 4))
  {
    case 0:
      break;
    case 1:
      v6 = self->_readyFilterSet | 0x10;
      goto LABEL_7;
    case 2:
      v6 = self->_readyFilterSet | 0x20;
      goto LABEL_7;
    case 4:
      v6 = self->_readyFilterSet | 0x40;
LABEL_7:
      self->_readyFilterSet = v6;
      break;
    default:
      v7 = _LTOSLogAssets();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[_LTDLanguageAssetCache markReadyForFilter:].cold.1(a3, v7);
      break;
  }
  os_unfair_lock_unlock(p_lock);
  -[_LTDLanguageAssetCache _multicastObservers](self, "_multicastObservers");
}

- (BOOL)isReadyForFilter:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t readyFilterSet;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  readyFilterSet = self->_readyFilterSet;
  os_unfair_lock_unlock(p_lock);
  return (a3 & ~readyFilterSet) == 0;
}

- (id)preheatWithLanguages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const __CFString *v28;
  NSObject *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v35;
  id v36;
  id obj;
  uint8_t v38;
  _BYTE v39[15];
  uint8_t v40;
  _BYTE v41[15];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[_LTDLanguageAssetService _selectedIdentifiers](_LTDLanguageAssetService, "_selectedIdentifiers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v11, "locale");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        objc_msgSend(v11, "ltIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v8);
  }

  +[_LTDLanguageAssetService setSelectedLocales:](_LTDLanguageAssetService, "setSelectedLocales:", v5);
  v14 = _LTOSLogAssets();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[_LTDLanguageAssetCache preheatWithLanguages:].cold.3((uint64_t)v6, v14);
  v15 = (void *)MEMORY[0x24BDBCEF0];
  -[_LTDLanguageAssetCache _availableIdentifiers](self, "_availableIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "unionSet:", v35);
  objc_msgSend(v17, "unionSet:", v6);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v19)
  {
    v20 = v19;
    v36 = v18;
    v21 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v43 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        -[_LTDLanguageAssetCache assetForIdentifier:](self, "assetForIdentifier:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsObject:", v23))
        {
          if (objc_msgSend(v5, "count") == 1)
          {
            if ((objc_msgSend(v23, "isEqualToString:", CFSTR("hi_IN")) & 1) != 0)
              goto LABEL_38;
            objc_msgSend(v24, "progress");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setComponentFilter:", CFSTR("ASR"));
          }
          else
          {
            if (objc_msgSend(v23, "isEqualToString:", CFSTR("uk_UA")))
            {
              v27 = _LTOSLogAssets();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                -[_LTDLanguageAssetCache preheatWithLanguages:].cold.1(&v40, v41, v27);
              objc_msgSend(v24, "progress");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "isFinished"))
                v28 = CFSTR("ASR");
              else
                v28 = CFSTR("ASR|MT");
            }
            else
            {
              if (!objc_msgSend(v23, "isEqualToString:", CFSTR("hi_IN")))
              {
                objc_msgSend(v24, "progress");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v25, "isFinished"))
                  v31 = CFSTR("ASR|PB");
                else
                  v31 = CFSTR("ASR|PB|MT");
                objc_msgSend(v24, "progress");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v31;
                v18 = v36;
                objc_msgSend(v32, "setComponentFilter:", v33);

                goto LABEL_37;
              }
              v29 = _LTOSLogAssets();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                -[_LTDLanguageAssetCache preheatWithLanguages:].cold.2(&v38, v39, v29);
              objc_msgSend(v24, "progress");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "isFinished"))
                v28 = CFSTR("PB");
              else
                v28 = CFSTR("PB|MT");
            }
            objc_msgSend(v24, "progress");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setComponentFilter:", v28);

            v18 = v36;
          }
        }
        else
        {
          objc_msgSend(v24, "progress");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeAllComponents");

          objc_msgSend(v24, "progress");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setOfflineState:", 0);
        }
LABEL_37:

LABEL_38:
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v20);
  }

  return v5;
}

- (void)applyAssetUpdates:(id)a3
{
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[_LTDLanguageAssetService _selectedIdentifiers](_LTDLanguageAssetService, "_selectedIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x24BDBCEF0];
        objc_msgSend(v6, "localeIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setWithArray:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "intersectSet:", v20);
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              -[_LTDLanguageAssetCache assetForIdentifier:](self, "assetForIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "progress");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "progress");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addComponent:", v17);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }

  -[_LTDLanguageAssetCache _multicastObservers](self, "_multicastObservers");
}

- (void)setRequiredAssets:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *requiredAssetIdentifiers;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "_ltCompactMap:", &__block_literal_global_21);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  requiredAssetIdentifiers = self->_requiredAssetIdentifiers;
  self->_requiredAssetIdentifiers = v5;

  os_unfair_lock_unlock(&self->_lock);
  -[_LTDLanguageAssetCache applyAssetUpdates:](self, "applyAssetUpdates:", v4);

}

- (BOOL)applyProgressUpdateForAsset:(id)a3
{
  id v4;
  NSSet *requiredAssetIdentifiers;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  requiredAssetIdentifiers = self->_requiredAssetIdentifiers;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(requiredAssetIdentifiers) = -[NSSet containsObject:](requiredAssetIdentifiers, "containsObject:", v6);

  os_unfair_lock_unlock(&self->_lock);
  if ((requiredAssetIdentifiers & 1) != 0 || !objc_msgSend(v4, "shouldPurgeWithLocale"))
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v4, "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

    if (objc_msgSend(v4, "isMultiLocaleAsset"))
    {
      -[_LTDLanguageAssetCache _readAllAssets](self, "_readAllAssets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "progress");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "progress");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeComponent:", v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v10);
      }

    }
    v15 = 0;
  }
  v22 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDLanguageAssetCache applyAssetUpdates:](self, "applyAssetUpdates:", v16);

  return v15;
}

- (id)assetForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  NSMutableDictionary *cache;
  void *v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63E0]), "initWithLocale:state:", v7, 3);
    cache = self->_cache;
    objc_msgSend(v6, "ltIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](cache, "setObject:forKeyedSubscript:", v6, v9);

  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)assetsFilteredUsing:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!-[_LTDLanguageAssetCache isReadyForFilter:](self, "isReadyForFilter:"))
    return 0;
  -[_LTDLanguageAssetCache _readAllAssets](self, "_readAllAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LTDLanguageAssetService _selectedIdentifiers](_LTDLanguageAssetService, "_selectedIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0;
  switch(__ROR8__(a3, 4))
  {
    case 0:
      v9 = v5;
      goto LABEL_17;
    case 1:
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (!v12)
        goto LABEL_16;
      v13 = v12;
      v14 = *(_QWORD *)v21;
      break;
    case 2:
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __46___LTDLanguageAssetCache_assetsFilteredUsing___block_invoke_2;
      v24[3] = &unk_251A11D00;
      v25 = v6;
      objc_msgSend(v5, "lt_filterUsingBlock:", v24);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;
      goto LABEL_20;
    case 4:
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __46___LTDLanguageAssetCache_assetsFilteredUsing___block_invoke;
      v26[3] = &unk_251A11D00;
      v27 = v6;
      objc_msgSend(v5, "lt_filterUsingBlock:", v26);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v27;
LABEL_20:

      goto LABEL_21;
    default:
      goto LABEL_21;
  }
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_msgSend(v16, "ltIdentifier", (_QWORD)v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "containsObject:", v17) & 1) == 0)
      {
        v18 = objc_msgSend(v16, "state");

        if (!v18)
          continue;
        objc_msgSend(v16, "progress");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setOfflineState:", 0);
      }

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  }
  while (v13);
LABEL_16:

  v9 = v11;
LABEL_17:
  v8 = v9;
LABEL_21:

  return v8;
}

- (BOOL)isReadyForAllFilters
{
  return -[_LTDLanguageAssetCache isReadyForFilter:](self, "isReadyForFilter:", 112);
}

- (void)reset
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_readyFilterSet = 0;
  -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *observers;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;

  v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  objc_msgSend(v11, "observerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](observers, "setObject:forKeyedSubscript:", v11, v6);

  v7 = objc_msgSend(v11, "isIndeterminate");
  v8 = 16;
  if (v7)
    v8 = 24;
  v9 = (void *)objc_msgSend(*(id *)((char *)&self->super.isa + v8), "copy");
  os_unfair_lock_unlock(p_lock);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v11, "observations");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v9);

  }
}

- (void)removeObserverForID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observers, "objectForKeyedSubscript:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observers, "setObject:forKeyedSubscript:", 0, v5);

  os_unfair_lock_unlock(p_lock);
  v6 = v8;
  if (v8)
  {
    objc_msgSend(v8, "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0);

    v6 = v8;
  }

}

+ (id)_normalizeUpdateFromObservation:(id)a3 toObservation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  double v17;
  double v18;
  double v19;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_ltLocaleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_ltLocaleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if (v13)
    {
      if (objc_msgSend(v7, "status") == 1)
      {
        v14 = objc_msgSend(v5, "status");
        v15 = v5;
        switch(v14)
        {
          case 1:
            objc_msgSend(v5, "progress");
            v18 = v17;
            objc_msgSend(v7, "progress");
            if (v18 <= v19)
              v15 = v7;
            else
              v15 = v5;
            break;
          case 2:
            break;
          default:
            goto LABEL_6;
        }
      }
      else
      {
LABEL_6:
        v15 = v7;
      }
      v8 = v15;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (id)_normalizeAndSortUpdatesFromObservations:(id)a3 toObservations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v14, "locale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_ltLocaleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v16);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v11);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v22, "locale");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_ltLocaleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_normalizeUpdateFromObservation:toObservation:", v22, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v8, "addObject:", v26);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v24);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v19);
  }

  objc_msgSend(v9, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v27);

  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (BOOL)_isReadyForObservers
{
  return -[_LTDLanguageAssetCache isReadyForFilter:](self, "isReadyForFilter:", 48);
}

- (void)_multicastObservers
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Skipping observer multicast due to empty cache", v1, 2u);
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (NSSet)requiredAssetIdentifiers
{
  return self->_requiredAssetIdentifiers;
}

- (unint64_t)readyFilterSet
{
  return self->_readyFilterSet;
}

- (void)setReadyFilterSet:(unint64_t)a3
{
  self->_readyFilterSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastIndeterminateObservationsSorted, 0);
  objc_storeStrong((id *)&self->_lastObservationsSorted, 0);
}

- (void)markReadyForFilter:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_2491B9000, a2, OS_LOG_TYPE_ERROR, "Invalid mark ready filter: %lu", (uint8_t *)&v2, 0xCu);
}

- (void)preheatWithLanguages:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_5(&dword_2491B9000, (int)a2, a3, "Cache preheat PB exception encountered", a1);
}

- (void)preheatWithLanguages:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_5(&dword_2491B9000, (int)a2, a3, "Cache preheat ASR exception encountered", a1);
}

- (void)preheatWithLanguages:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2491B9000, a2, OS_LOG_TYPE_DEBUG, "Cache update new identifiers: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end

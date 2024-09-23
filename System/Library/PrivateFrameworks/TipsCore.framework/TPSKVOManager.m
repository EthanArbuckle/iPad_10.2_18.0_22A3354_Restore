@implementation TPSKVOManager

- (TPSKVOManager)initWithObserver:(id)a3
{
  id v4;
  TPSKVOManager *v5;
  TPSKVOManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSKVOManager;
  v5 = -[TPSKVOManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TPSKVOManager setObserver:](v5, "setObserver:", v4);

  return v6;
}

- (void)dealloc
{
  __CFDictionary *KVODictionary;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[TPSKVOManager removeAllKVOObjects](self, "removeAllKVOObjects");
  KVODictionary = self->_KVODictionary;
  if (KVODictionary)
    CFRelease(KVODictionary);
  -[TPSKVOManager setObserver:](self, "setObserver:", 0);
  v4.receiver = self;
  v4.super_class = (Class)TPSKVOManager;
  -[TPSKVOManager dealloc](&v4, sel_dealloc);
}

- (__CFDictionary)KVODictionary
{
  __CFDictionary *result;

  result = self->_KVODictionary;
  if (!result)
  {
    result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    self->_KVODictionary = result;
  }
  return result;
}

- (void)addKVOObject:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  id key;

  key = a3;
  v10 = a4;
  if (key && v10)
  {
    if (-[TPSKVOManager KVODictionary](self, "KVODictionary")
      && (CFDictionaryGetValue(-[TPSKVOManager KVODictionary](self, "KVODictionary"), key),
          (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = v11;
      if (objc_msgSend(v11, "indexOfObject:", v10) == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(key, "addObserver:forKeyPath:options:context:", self, v10, a5, a6);
        objc_msgSend(v12, "addObject:", v10);
      }
    }
    else
    {
      objc_msgSend(key, "addObserver:forKeyPath:options:context:", self, v10, a5, a6);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v10);
      CFDictionarySetValue(-[TPSKVOManager KVODictionary](self, "KVODictionary"), key, v12);
    }

  }
}

- (void)removeKVOObject:(id)a3 forKeyPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id key;

  key = a3;
  v6 = a4;
  if (v6 && key && self->_KVODictionary)
  {
    CFDictionaryGetValue(-[TPSKVOManager KVODictionary](self, "KVODictionary"), key);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "indexOfObject:", v6);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = v9;
        objc_msgSend(key, "removeObserver:forKeyPath:", self, v6);
        objc_msgSend(v8, "removeObjectAtIndex:", v10);
      }
    }

  }
}

- (void)removeKVOForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && self->_KVODictionary)
  {
    CFDictionaryGetValue(-[TPSKVOManager KVODictionary](self, "KVODictionary"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(v4, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }
      CFDictionaryRemoveValue(self->_KVODictionary, v4);
    }

  }
}

- (void)removeAllKVOObjects
{
  __CFDictionary *KVODictionary;
  CFIndex Count;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  void *values[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[512];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  KVODictionary = self->_KVODictionary;
  if (KVODictionary)
  {
    Count = CFDictionaryGetCount(KVODictionary);
    if (Count)
    {
      v5 = Count;
      memset(v49, 0, 512);
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      *(_OWORD *)values = 0u;
      v18 = 0u;
      CFDictionaryGetKeysAndValues(self->_KVODictionary, (const void **)v49, (const void **)values);
      if (v5 >= 1)
      {
        for (i = 0; i != v5; ++i)
        {
          v7 = values[i];
          v12 = 0u;
          v13 = 0u;
          v14 = 0u;
          v15 = 0u;
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
                objc_msgSend(*((id *)v49 + i), "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
              }
              while (v9 != v11);
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
            }
            while (v9);
          }

        }
      }
      CFDictionaryRemoveAllValues(self->_KVODictionary);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  -[TPSKVOManager observer](self, "observer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  -[TPSKVOManager observer](self, "observer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v14, "performSelector:withObject:withObject:", a6, v10, v11);
LABEL_5:

    goto LABEL_6;
  }
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[TPSKVOManager observer](self, "observer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "observeValueForKeyPath:ofObject:change:context:", v17, v10, v11, a6);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)observer
{
  return objc_loadWeakRetained(&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak(&self->_observer, a3);
}

- (void)setKVODictionary:(__CFDictionary *)a3
{
  self->_KVODictionary = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observer);
}

@end

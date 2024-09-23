@implementation STMSizeCache

- (STMSizeCache)initWithPrefsKey:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  dispatch_source_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)STMSizeCache;
  v5 = -[STMSizeCache init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v6;

    *((_QWORD *)v5 + 1) = v4;
    v8 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v9 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 200);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v10;

    v12 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    v13 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v12;

    objc_initWeak(&location, v5);
    v14 = *((_QWORD *)v5 + 4);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __33__STMSizeCache_initWithPrefsKey___block_invoke;
    v19 = &unk_24C75F5F0;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v14, &v16);
    dispatch_resume(*((dispatch_object_t *)v5 + 4));
    objc_msgSend(v5, "loadCacheFromPref", v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return (STMSizeCache *)v5;
}

void __33__STMSizeCache_initWithPrefsKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_flushCache");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[STMSizeCache setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)STMSizeCache;
  -[STMSizeCache dealloc](&v3, sel_dealloc);
}

- (void)loadCacheFromPref
{
  STMSizeCache *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  STMSizeCache *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  STMSizeCacheEntry *v26;
  STMSizeCacheEntry *v27;
  STMSizeCacheEntry *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  FSEventStreamEventId CurrentEventId;
  uint64_t v34;
  NSDate *cacheEventDate;
  int v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v2 = self;
  v56 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)CFPreferencesCopyValue(self->_prefsKey, CFSTR("com.apple.settings.storage"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  if (!v3)
    goto LABEL_39;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ItemSizes"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("EventIDDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STAppOverrides overrides](STAppOverrides, "overrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.mobilemail"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "includeFsPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock lock](v2->_itemsLock, "lock");
  v39 = v4;
  v40 = v3;
  v38 = v8;
  if (v4 && (objc_msgSend(v4, "timeIntervalSinceNow"), v9 > -1800.0))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("EventID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
  }
  else if (v8)
  {
    v11 = (void *)MEMORY[0x24BDBCE30];
    _CompressPath(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithObject:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    v36 = 1;
  }
  else
  {
    v36 = 0;
    v10 = 0;
    v37 = 0;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v10;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (!v45)
    goto LABEL_33;
  v43 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v45; ++i)
    {
      if (*(_QWORD *)v47 != v43)
        objc_enumerationMutation(obj);
      v14 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * i);
      if (objc_msgSend(v14, "hasPrefix:", CFSTR("$")))
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v15 = objc_msgSend(&unk_24C768D88, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v51;
          while (2)
          {
            v19 = v2;
            v20 = 0;
            v21 = v16 + v17;
            do
            {
              if (*(_QWORD *)v51 != v18)
                objc_enumerationMutation(&unk_24C768D88);
              v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v20);
              if ((objc_msgSend(v14, "hasPrefix:", v22) & 1) != 0)
              {
                v24 = objc_msgSend(v22, "length");
                objc_msgSend(&unk_24C768D70, "objectAtIndexedSubscript:", v17 + v20);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", 0, v24, v25);
                v23 = (id)objc_claimAutoreleasedReturnValue();

                v2 = v19;
                goto LABEL_24;
              }
              ++v20;
            }
            while (v16 != v20);
            v16 = objc_msgSend(&unk_24C768D88, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
            v17 = v21;
            v2 = v19;
            if (v16)
              continue;
            break;
          }
        }
      }
      v23 = v14;
LABEL_24:

      if (objc_msgSend(v44, "fileExistsAtPath:", v23))
      {
        -[NSMutableDictionary objectForKey:](v2->_itemsByPath, "objectForKey:", v23);
        v26 = (STMSizeCacheEntry *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = v26;
          if (!-[STMSizeCacheEntry status](v26, "status"))
          {
LABEL_29:
            objc_msgSend(v41, "objectForKey:", v14);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[STMSizeCacheEntry setItemSize:](v27, "setItemSize:", v30);

            -[STMSizeCacheEntry setStatus:](v27, "setStatus:", 2);
            -[NSMutableDictionary setObject:forKey:](v2->_itemsByPath, "setObject:forKey:", v27, v23);
          }

          goto LABEL_31;
        }
        v28 = [STMSizeCacheEntry alloc];
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v23);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[STMSizeCacheEntry initWithURL:](v28, "initWithURL:", v29);

        goto LABEL_29;
      }
LABEL_31:

    }
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  }
  while (v45);
LABEL_33:

  if (v36)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v2->_itemsByPath, "objectForKeyedSubscript:", v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setStatus:", 3);
    -[STMSizeCache updateSizeOfItem:synchronous:](v2, "updateSizeOfItem:synchronous:", v31, 0);

  }
  v32 = objc_msgSend(v37, "longLongValue");
  if (v32)
  {
    CurrentEventId = v32;
    objc_storeStrong((id *)&v2->_cacheEventDate, v39);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v34 = objc_claimAutoreleasedReturnValue();
    cacheEventDate = v2->_cacheEventDate;
    v2->_cacheEventDate = (NSDate *)v34;

    CurrentEventId = FSEventsGetCurrentEventId();
  }
  v3 = v40;
  v2->_cacheEventID = CurrentEventId;
  -[NSLock unlock](v2->_itemsLock, "unlock");

LABEL_39:
}

- (void)_writeCache
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CFTypeRef v17;
  CFTypeRef v18;
  id v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  CFTypeRef v23;
  CFTypeRef v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[STMSizeCache pruneCache](self, "pruneCache");
  -[NSLock lock](self->_itemsLock, "lock");
  -[NSMutableDictionary allValues](self->_itemsByPath, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cacheEventID);
  v20 = objc_claimAutoreleasedReturnValue();
  -[STMSizeCache cacheEventDate](self, "cacheEventDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_itemsLock, "unlock");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v11, "status") == 2)
        {
          objc_msgSend(v11, "itemSize");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v11, "itemPath");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            _CompressPath(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v12, v14);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v5, CFSTR("ItemSizes"));
    v16 = (void *)v20;
    objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("EventID"));
    if (v4)
      objc_msgSend(v15, "setObject:forKey:", v4, CFSTR("EventIDDate"));
  }
  else
  {
    v15 = 0;
    v16 = (void *)v20;
  }
  v17 = CFRetain(self->_prefsKey);
  v18 = CFRetain(CFSTR("com.apple.settings.storage"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__STMSizeCache__writeCache__block_invoke;
  block[3] = &unk_24C75FCA8;
  v22 = v15;
  v23 = v17;
  v24 = v18;
  v19 = v15;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __27__STMSizeCache__writeCache__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)*MEMORY[0x24BDBD590];
  v3 = (const __CFString *)*MEMORY[0x24BDBD588];
  CFPreferencesSetValue(*(CFStringRef *)(a1 + 40), *(CFPropertyListRef *)(a1 + 32), *(CFStringRef *)(a1 + 48), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  CFPreferencesSynchronize(*(CFStringRef *)(a1 + 48), v2, v3);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

- (void)_flushCache
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__STMSizeCache__flushCache__block_invoke;
  block[3] = &unk_24C75F658;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __27__STMSizeCache__flushCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeCache");
}

- (void)flushCacheToPref
{
  NSObject *cacheFlushTimer;
  dispatch_time_t v3;

  cacheFlushTimer = self->_cacheFlushTimer;
  v3 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(cacheFlushTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
}

- (void)notifyItemsAdded:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "sizeCacheItemsUpdated:", self);
      v5 = v7;
    }
  }

}

- (void)notifySizesChanged:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "sizeCache:itemSizesChanged:", self, v5);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "sizeCacheItemsUpdated:", self);
    }
  }

}

- (NSArray)items
{
  void *v3;

  -[NSLock lock](self->_itemsLock, "lock");
  -[NSMutableDictionary allValues](self->_itemsByPath, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_itemsLock, "unlock");
  return (NSArray *)v3;
}

- (id)itemForPath:(id)a3
{
  NSLock *itemsLock;
  id v5;
  void *v6;

  itemsLock = self->_itemsLock;
  v5 = a3;
  -[NSLock lock](itemsLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_itemsByPath, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_itemsLock, "unlock");
  return v6;
}

- (void)updateSizeOfItem:(id)a3 synchronous:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  STMSizeCache *v19;
  _QWORD v20[2];

  v4 = a4;
  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "status");
  objc_msgSend(v6, "itemSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __45__STMSizeCache_updateSizeOfItem_synchronous___block_invoke;
    v16[3] = &unk_24C75FCD0;
    v9 = v6;
    v17 = v9;
    v18 = v8;
    v19 = self;
    v10 = (void *)MEMORY[0x212BA747C](v16);
    objc_msgSend(v9, "dispatchQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "dispatchQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v4)
        dispatch_sync(v12, v10);
      else
        dispatch_async(v12, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "queue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addOperations:waitUntilFinished:", v15, v4);

    }
  }

}

void __45__STMSizeCache_updateSizeOfItem_synchronous___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "calculateSize");
  objc_msgSend(a1[4], "itemSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_msgSend(a1[5], "isEqual:", v2) & 1) == 0)
  {
    v3 = a1[6];
    v5[0] = a1[4];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notifySizesChanged:", v4);

  }
  objc_msgSend(a1[6], "flushCacheToPref");

}

- (id)updatedSizeOfItemForPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v11;

  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v11);

  if (v6)
  {
    if (v11)
    {
      STMakeDirPath(v4);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v7;
    }
    -[STMSizeCache itemForPath:](self, "itemForPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[STMSizeCache updateSizeOfItem:synchronous:](self, "updateSizeOfItem:synchronous:", v8, 1);
      objc_msgSend(v8, "itemSize");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)sizeOfItemForPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v12;

  v4 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v12);

  if (v6)
  {
    if (v12)
    {
      STMakeDirPath(v4);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v7;
    }
    -[STMSizeCache itemForPath:](self, "itemForPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "itemSize");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STMSizeCache updateSizeOfItem:synchronous:](self, "updateSizeOfItem:synchronous:", v9, 0);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)itemsContainingPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSLock lock](self->_itemsLock, "lock");
  -[NSMutableDictionary allValues](self->_itemsByPath, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_itemsLock, "unlock");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
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
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x212BA72F0](v8);
        objc_msgSend(v12, "itemPath", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "hasPrefix:", v14))
          objc_msgSend(v6, "addObject:", v12);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v9 = v8;
    }
    while (v8);
  }

  return v6;
}

- (id)itemsContainedByPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSLock lock](self->_itemsLock, "lock");
  -[NSMutableDictionary allValues](self->_itemsByPath, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_itemsLock, "unlock");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v4, &v28))
  {
    v21 = v6;
    v23 = v7;
    if (v28)
    {
      STMakeDirPath(v4);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v8;
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x212BA72F0]();
          objc_msgSend(v14, "itemPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "commonPrefixWithString:options:", v16, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v4);

          if (v18)
            objc_msgSend(v23, "addObject:", v14);

          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v11);
    }

    v7 = v23;
    v19 = v23;
    v6 = v21;
    v5 = v22;
  }
  else
  {
    v19 = (id)MEMORY[0x24BDBD1A8];
  }

  return v19;
}

- (void)pruneCache
{
  void *v3;
  void *v4;
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

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_itemsLock, "lock");
  -[NSMutableDictionary allKeys](self->_itemsByPath, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        if ((objc_msgSend(v3, "fileExistsAtPath:", v9) & 1) == 0)
          -[NSMutableDictionary removeObjectForKey:](self->_itemsByPath, "removeObjectForKey:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[NSLock unlock](self->_itemsLock, "unlock");

}

- (void)addItem:(id)a3 andComputeSizeSynchronously:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "itemPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_itemsLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_itemsByPath, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8 == (_QWORD)v6;
  else
    v10 = 1;
  if (!v10 && !objc_msgSend(v6, "status") && objc_msgSend(v9, "status") == 2)
  {
    objc_msgSend(v9, "itemSize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItemSize:", v11);

    objc_msgSend(v6, "setStatus:", objc_msgSend(v9, "status"));
  }
  -[NSMutableDictionary setObject:forKey:](self->_itemsByPath, "setObject:forKey:", v6, v7);
  -[NSLock unlock](self->_itemsLock, "unlock");
  if (!v9)
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STMSizeCache notifyItemsAdded:](self, "notifyItemsAdded:", v12);

  }
  -[STMSizeCache updateSizeOfItem:synchronous:](self, "updateSizeOfItem:synchronous:", v6, v4);

}

- (void)addItem:(id)a3
{
  -[STMSizeCache addItem:andComputeSizeSynchronously:](self, "addItem:andComputeSizeSynchronously:", a3, 0);
}

- (void)addItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[STMSizeCache addItem:](self, "addItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeItemForPath:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSLock lock](self->_itemsLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_itemsByPath, "objectForKey:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableDictionary removeObjectForKey:](self->_itemsByPath, "removeObjectForKey:", v5);
  -[NSLock unlock](self->_itemsLock, "unlock");

}

- (void)removeItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "itemPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STMSizeCache removeItemForPath:](self, "removeItemForPath:", v4);

}

- (unint64_t)processCacheEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  uint64_t v39;
  void *v40;
  id obj;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSLock lock](self->_itemsLock, "lock");
  v5 = objc_msgSend(v4, "count");
  STLog(1, CFSTR("%ld events to process"), v6, v7, v8, v9, v10, v11, v5);
  objc_msgSend(v4, "keysSortedByValueUsingSelector:", sel_eventIDCompare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v45;
    v39 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x212BA72F0]();
        objc_msgSend(v4, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByPath, "objectForKeyedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v21;
        if (v21)
        {
          if (objc_msgSend(v21, "status") != 1)
          {
            v42 = objc_msgSend(v20, "evtID");
            objc_msgSend(v20, "path");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            _CompressPath(v43);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "flags");
            objc_msgSend(v28, "itemPath");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            STLog(1, CFSTR("Processing FSEvent #%llu : path = %@ (flags: %x), cache entry path : %@"), v30, v31, v32, v33, v34, v35, v42);

            v16 = v39;
            if (objc_msgSend(v28, "status") == 2)
              v36 = 3;
            else
              v36 = 0;
            objc_msgSend(v28, "setStatus:", v36);
            objc_msgSend(v40, "addObject:", v28);
          }
          v15 = objc_msgSend(v20, "evtID");
        }
        else
        {
          STLog(1, CFSTR("No associated cache entry for eventKey: %@"), v22, v23, v24, v25, v26, v27, v18);
        }

        objc_autoreleasePoolPop(v19);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  -[NSLock unlock](self->_itemsLock, "unlock");
  -[STMSizeCache notifySizesChanged:](self, "notifySizesChanged:", v40);

  return v15;
}

- (void)updateLastCacheEventID:(unint64_t)a3
{
  NSDate *v4;
  NSDate *cacheEventDate;

  self->_cacheEventID = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  cacheEventDate = self->_cacheEventDate;
  self->_cacheEventDate = v4;

}

- (STMSizeCacheDelegate)delegate
{
  return (STMSizeCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)cacheEventID
{
  return self->_cacheEventID;
}

- (void)setCacheEventID:(unint64_t)a3
{
  self->_cacheEventID = a3;
}

- (NSDate)cacheEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCacheEventDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSLock)itemsLock
{
  return (NSLock *)objc_getProperty(self, a2, 64, 1);
}

- (void)setItemsLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_cacheEventDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cacheFlushTimer, 0);
  objc_storeStrong((id *)&self->_eventsToProcess, 0);
  objc_storeStrong((id *)&self->_itemsByPath, 0);
}

@end

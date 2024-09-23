@implementation SUMediaLibraryAdamIDCache

- (SUMediaLibraryAdamIDCache)init
{
  SUMediaLibraryAdamIDCache *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUMediaLibraryAdamIDCache;
  v2 = -[SUMediaLibraryAdamIDCache init](&v6, sel_init);
  if (v2)
  {
    v2->_adamIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v2->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iTunesStoreUI.SUMediaLibraryAdamIDCache.callback", 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iTunesStoreUI.SUMediaLibraryAdamIDCache", 0);
    objc_msgSend(MEMORY[0x24BDDC818], "setFilteringDisabled:", 1);
    v3 = (void *)objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__libraryChangedNotification_, *MEMORY[0x24BDDBCF0], v3);
    objc_msgSend(v3, "beginGeneratingLibraryChangeNotifications");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSObject *callbackQueue;
  NSObject *dispatchQueue;
  objc_super v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDBCF0], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary"), "endGeneratingLibraryChangeNotifications");
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
    dispatch_release(callbackQueue);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v6.receiver = self;
  v6.super_class = (Class)SUMediaLibraryAdamIDCache;
  -[SUMediaLibraryAdamIDCache dealloc](&v6, sel_dealloc);
}

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SUMediaLibraryAdamIDCache_sharedCache__block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = a1;
  if (sharedCache_sOnce != -1)
    dispatch_once(&sharedCache_sOnce, block);
  return (id)sharedCache_sCache;
}

id __40__SUMediaLibraryAdamIDCache_sharedCache__block_invoke()
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  sharedCache_sCache = (uint64_t)result;
  return result;
}

- (void)getContainsAdamID:(id)a3 completionBlock:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SUMediaLibraryAdamIDCache_getContainsAdamID_completionBlock___block_invoke;
  block[3] = &unk_24DE7C820;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __63__SUMediaLibraryAdamIDCache_getContainsAdamID_completionBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  char v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  v2 = a1[4];
  if (!*(_BYTE *)(v2 + 32))
  {
    objc_msgSend((id)v2, "_populateCache");
    v2 = a1[4];
  }
  v3 = objc_msgSend(*(id *)(v2 + 8), "containsObject:", a1[5]);
  v4 = *(NSObject **)(a1[4] + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__SUMediaLibraryAdamIDCache_getContainsAdamID_completionBlock___block_invoke_2;
  v5[3] = &unk_24DE7D2B0;
  v5[4] = a1[6];
  v6 = v3;
  dispatch_async(v4, v5);
}

uint64_t __63__SUMediaLibraryAdamIDCache_getContainsAdamID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getIntersectionWithSet:(id)a3 completionBlock:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SUMediaLibraryAdamIDCache_getIntersectionWithSet_completionBlock___block_invoke;
  block[3] = &unk_24DE7C820;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __68__SUMediaLibraryAdamIDCache_getIntersectionWithSet_completionBlock___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[6];

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[32])
    objc_msgSend(v2, "_populateCache");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(v3, "intersectSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__SUMediaLibraryAdamIDCache_getIntersectionWithSet_completionBlock___block_invoke_2;
  v6[3] = &unk_24DE7B900;
  v5 = *(_QWORD *)(a1 + 48);
  v6[4] = v3;
  v6[5] = v5;
  dispatch_async(v4, v6);

}

uint64_t __68__SUMediaLibraryAdamIDCache_getIntersectionWithSet_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getProperties:(id)a3 ofAdamIDs:(id)a4 withCompletionBlock:(id)a5
{
  NSObject *dispatchQueue;
  _QWORD v6[8];

  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__SUMediaLibraryAdamIDCache_getProperties_ofAdamIDs_withCompletionBlock___block_invoke;
  v6[3] = &unk_24DE7B9B0;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(dispatchQueue, v6);
}

void __73__SUMediaLibraryAdamIDCache_getProperties_ofAdamIDs_withCompletionBlock___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *context;
  _QWORD block[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x220763454]();
  v2 = objc_alloc_init(MEMORY[0x24BDDC818]);
  objc_msgSend(v2, "setItemPropertiesToFetch:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a1[4]));
  objc_msgSend(v2, "setSortItems:", 0);
  objc_msgSend(v2, "setUseSections:", 0);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)a1[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = *MEMORY[0x24BDDBCB0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), v8);
        objc_msgSend(v2, "addFilterPredicate:", v10);
        v11 = (void *)objc_msgSend(v2, "items");
        if (objc_msgSend(v11, "count"))
          objc_msgSend(v3, "addObjectsFromArray:", v11);
        objc_msgSend(v2, "removeFilterPredicate:", v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  v12 = a1[7];
  if (v12)
  {
    v13 = *(NSObject **)(a1[6] + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__SUMediaLibraryAdamIDCache_getProperties_ofAdamIDs_withCompletionBlock___block_invoke_2;
    block[3] = &unk_24DE7B900;
    block[4] = v3;
    block[5] = v12;
    dispatch_async(v13, block);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __73__SUMediaLibraryAdamIDCache_getProperties_ofAdamIDs_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)populateCache
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUMediaLibraryAdamIDCache_populateCache__block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

_BYTE *__42__SUMediaLibraryAdamIDCache_populateCache__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[32])
    return (_BYTE *)objc_msgSend(result, "_populateCache");
  return result;
}

- (void)_libraryChangedNotification:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUMediaLibraryAdamIDCache__libraryChangedNotification___block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __57__SUMediaLibraryAdamIDCache__libraryChangedNotification___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 32))
  {
    *(_BYTE *)(v1 + 32) = 0;
    return objc_msgSend(*(id *)(result + 32), "_populateCache");
  }
  return result;
}

- (void)_populateCache
{
  id v3;
  uint64_t v4;
  NSObject *callbackQueue;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD block[5];
  _QWORD v15[5];
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDDC818]);
  objc_msgSend(v3, "addFilterPredicate:", objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDDBBE0]));
  objc_msgSend(v3, "setItemPropertiesToFetch:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDDBCB0], *MEMORY[0x24BDDBCB8], 0));
  objc_msgSend(v3, "setSortItems:", 0);
  objc_msgSend(v3, "setUseSections:", 0);
  -[NSMutableSet removeAllObjects](self->_adamIDs, "removeAllObjects");
  v4 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__SUMediaLibraryAdamIDCache__populateCache__block_invoke;
  v15[3] = &unk_24DE7E298;
  v15[4] = self;
  objc_msgSend(v3, "_enumerateItemsUsingBlock:", v15);
  self->_isPopulated = 1;
  callbackQueue = self->_callbackQueue;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __43__SUMediaLibraryAdamIDCache__populateCache__block_invoke_2;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v8 &= 2u;
  if (v8)
  {
    v9 = objc_opt_class();
    v10 = -[NSMutableSet count](self->_adamIDs, "count");
    v16 = 138412546;
    v17 = v9;
    v18 = 2048;
    v19 = v10;
    LODWORD(v13) = 22;
    v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }
  }

}

uint64_t __43__SUMediaLibraryAdamIDCache__populateCache__block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(a2, "valueForProperty:", *MEMORY[0x24BDDBCB0]);
    if (v4)
      objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 8), "addObject:", v4);
    result = objc_msgSend(a2, "valueForProperty:", *MEMORY[0x24BDDBCB8]);
    if (result)
      return objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 8), "addObject:", result);
  }
  return result;
}

uint64_t __43__SUMediaLibraryAdamIDCache__populateCache__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUMediaLibraryCacheDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

@end

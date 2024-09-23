@implementation SUUpdateDiscoveryDateManager

- (SUUpdateDiscoveryDateManager)init
{
  return -[SUUpdateDiscoveryDateManager initWithDiscoveryDateDictionary:](self, "initWithDiscoveryDateDictionary:", 0);
}

- (SUUpdateDiscoveryDateManager)initWithDiscoveryDateDictionary:(id)a3
{
  id v4;
  SUUpdateDiscoveryDateManager *v5;
  NSMutableArray *v6;
  NSMutableArray *buildVersionArray;
  NSMutableArray *v8;
  NSMutableArray *discoveryDateArray;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *stateQueue;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  SUUpdateDiscoveryDateManager *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUpdateDiscoveryDateManager;
  v5 = -[SUUpdateDiscoveryDateManager init](&v18, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    buildVersionArray = v5->_buildVersionArray;
    v5->_buildVersionArray = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    discoveryDateArray = v5->_discoveryDateArray;
    v5->_discoveryDateArray = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.softwareupdateservices.discoveryStateQueue", v10);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v11;

    if (v4)
    {
      v13 = v5->_stateQueue;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __64__SUUpdateDiscoveryDateManager_initWithDiscoveryDateDictionary___block_invoke;
      v15[3] = &unk_24CE3B610;
      v16 = v4;
      v17 = v5;
      dispatch_sync(v13, v15);

    }
  }

  return v5;
}

void __64__SUUpdateDiscoveryDateManager_initWithDiscoveryDateDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v23 = v2;
            if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"))
            {
              v24 = 0;
              while (1)
              {
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectAtIndexedSubscript:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "laterDate:", v22);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v26 == v22)
                  break;
                if (++v24 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"))
                  goto LABEL_13;
              }
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "insertObject:atIndex:", v7, v24);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "insertObject:atIndex:", v22, v24);
            }
            else
            {
LABEL_13:
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v7);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", v22);
            }
            v2 = v23;
          }
          else
          {
            SULogInfo(CFSTR("discoveryDateDictionary value is unexpected type. File a radar!"), v15, v16, v17, v18, v19, v20, v21, v27);
          }

        }
        else
        {
          SULogInfo(CFSTR("discoveryDateDictionary key is unexpected type. File a radar!"), v8, v9, v10, v11, v12, v13, v14, v27);
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v4);
  }

}

- (void)setDiscoveryDate:(id)a3 forBuildVersion:(id)a4
{
  id v6;
  id v7;
  NSObject *stateQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SUUpdateDiscoveryDateManager *v14;

  v6 = a3;
  v7 = a4;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SUUpdateDiscoveryDateManager_setDiscoveryDate_forBuildVersion___block_invoke;
  block[3] = &unk_24CE3BB38;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(stateQueue, block);

}

_QWORD *__65__SUUpdateDiscoveryDateManager_setDiscoveryDate_forBuildVersion___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  if (result[4])
  {
    v1 = result;
    if (result[5])
    {
      if ((unint64_t)objc_msgSend(*(id *)(result[6] + 16), "count") >= 3)
      {
        do
          objc_msgSend(*(id *)(v1[6] + 16), "removeLastObject");
        while ((unint64_t)objc_msgSend(*(id *)(v1[6] + 16), "count") > 2);
      }
      if ((unint64_t)objc_msgSend(*(id *)(v1[6] + 24), "count") >= 3)
      {
        do
          objc_msgSend(*(id *)(v1[6] + 24), "removeLastObject");
        while ((unint64_t)objc_msgSend(*(id *)(v1[6] + 24), "count") > 2);
      }
      objc_msgSend(*(id *)(v1[6] + 16), "insertObject:atIndex:", v1[4], 0);
      return (_QWORD *)objc_msgSend(*(id *)(v1[6] + 24), "insertObject:atIndex:", v1[5], 0);
    }
  }
  return result;
}

- (void)removeDiscoveryDateForBuildVersion:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUUpdateDiscoveryDateManager *v9;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SUUpdateDiscoveryDateManager_removeDiscoveryDateForBuildVersion___block_invoke;
  block[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

unint64_t __67__SUUpdateDiscoveryDateManager_removeDiscoveryDateForBuildVersion___block_invoke(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 16), "indexOfObject:");
    result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 16), "count");
    if (v2 < result)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 16), "removeObjectAtIndex:", v2);
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 24), "removeObjectAtIndex:", v2);
    }
  }
  return result;
}

- (id)discoveryDateforBuildVersion:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SUUpdateDiscoveryDateManager_discoveryDateforBuildVersion___block_invoke;
  block[3] = &unk_24CE3CB18;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(stateQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__SUUpdateDiscoveryDateManager_discoveryDateforBuildVersion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  if (objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]))
  {
    v10 = objc_msgSend(*(id *)(a1[4] + 16), "indexOfObject:", a1[5]);
    if (v10 >= objc_msgSend(*(id *)(a1[4] + 24), "count"))
    {
      SULogInfo(CFSTR("_descriptorArray and _discoveryDateArray are out of sync. File a radar!"), v11, v12, v13, v14, v15, v16, v17, a9);
    }
    else
    {
      objc_msgSend(*(id *)(a1[4] + 24), "objectAtIndex:", v10);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1[6] + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
  }
}

- (id)dictionaryRepresentation
{
  NSObject *stateQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__SUUpdateDiscoveryDateManager_dictionaryRepresentation__block_invoke;
  v6[3] = &unk_24CE3B700;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  if (objc_msgSend((id)v8[5], "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__SUUpdateDiscoveryDateManager_dictionaryRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (v10 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    {
      v18 = 0;
      do
      {
        v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v20, v21);

        ++v18;
      }
      while (v18 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
    }
  }
  else
  {
    SULogInfo(CFSTR("_descriptorArray and _discoveryDateArray are out of sync. File a radar!"), v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

- (BOOL)containsBuildVersion:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUUpdateDiscoveryDateManager_containsBuildVersion___block_invoke;
  block[3] = &unk_24CE3C768;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);
  LOBYTE(stateQueue) = v12[3] != 0;

  _Block_object_dispose(&v11, 8);
  return (char)stateQueue;
}

uint64_t __53__SUUpdateDiscoveryDateManager_containsBuildVersion___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryDateArray, 0);
  objc_storeStrong((id *)&self->_buildVersionArray, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end

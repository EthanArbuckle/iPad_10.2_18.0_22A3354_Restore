@implementation RadioRecentStationsController

- (RadioRecentStationsController)init
{
  RadioRecentStationsController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  RadioRecentStationsController *v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RadioRecentStationsController;
  v2 = -[RadioRecentStationsController init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Radio.RadioRecentStationsController.accessQueue", MEMORY[0x24BDAC9C0]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v2->_hasValidStationGroups = 1;
    v5 = -[RadioRecentStationsController _newRecentStationsRequest](v2, "_newRecentStationsRequest");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__RadioRecentStationsController_init__block_invoke;
    v8[3] = &unk_24CA2E618;
    v9 = v2;
    v10 = v5;
    v6 = v5;
    objc_msgSend(v6, "getCachedRecentStationsResponseWithCompletionHandler:", v8);

  }
  return v2;
}

- (id)_newRecentStationsRequest
{
  NSObject *accessQueue;
  RadioRecentStationsRequest *v3;
  RadioRecentStationsRequest *v4;
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
  v10 = __Block_byref_object_copy__711;
  v11 = __Block_byref_object_dispose__712;
  v12 = 0;
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__RadioRecentStationsController__newRecentStationsRequest__block_invoke;
  v6[3] = &unk_24CA2EB50;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  v3 = [RadioRecentStationsRequest alloc];
  v4 = -[RadioRecentStationsRequest initWithCurrentStation:](v3, "initWithCurrentStation:", v8[5]);
  -[RadioRecentStationsRequest setShouldGroupResponses:](v4, "setShouldGroupResponses:", 1);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __37__RadioRecentStationsController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRecentStationsResponse:fromRequest:pendingRecentStations:isInitialCacheLoad:", a2, *(_QWORD *)(a1 + 40), 0, 1);
}

- (void)_handleRecentStationsResponse:(id)a3 fromRequest:(id)a4 pendingRecentStations:(id)a5 isInitialCacheLoad:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  RadioMutableRecentStationsGroup *v25;
  void *v26;
  NSObject *accessQueue;
  id v28;
  RadioRecentStationsController *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  void *v35;
  void *v36;
  _QWORD block[5];
  id v38;
  id v39;
  BOOL v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    v29 = self;
    v30 = v12;
    objc_msgSend(v10, "stationGroups");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    v31 = v11;
    v14 = 0;
    v15 = 0;
    if (v33)
    {
      v32 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v36 = v14;
          objc_msgSend(v35, "stationDictionaries");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v18)
          {
            v19 = v18;
            v20 = 0;
            v21 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v42 != v21)
                  objc_enumerationMutation(v17);
                v23 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
                if (!v15)
                {
                  +[RadioModel backgroundModel](RadioModel, "backgroundModel");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v24 = (void *)objc_msgSend(v15, "newStationWithDictionary:", v23);
                if (v24)
                {
                  if (!v20)
                    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v17, "count"));
                  objc_msgSend(v20, "addObject:", v24);
                }

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            }
            while (v19);
          }
          else
          {
            v20 = 0;
          }
          v14 = v36;
          if (!v36)
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(obj, "count"));
          v25 = objc_alloc_init(RadioMutableRecentStationsGroup);
          -[RadioMutableRecentStationsGroup setActive:](v25, "setActive:", objc_msgSend(v35, "isActive"));
          objc_msgSend(v35, "localizedTitle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[RadioMutableRecentStationsGroup setLocalizedTitle:](v25, "setLocalizedTitle:", v26);

          -[RadioMutableRecentStationsGroup setStations:](v25, "setStations:", v20);
          if (v25)
          {
            if (!v14)
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(obj, "count"));
            objc_msgSend(v14, "addObject:", v25);
          }

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v33);
    }
    accessQueue = v29->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __116__RadioRecentStationsController__handleRecentStationsResponse_fromRequest_pendingRecentStations_isInitialCacheLoad___block_invoke;
    block[3] = &unk_24CA2E6E0;
    block[4] = v29;
    v40 = a6;
    v13 = v30;
    v38 = v30;
    v39 = v14;
    v28 = v14;
    dispatch_barrier_async(accessQueue, block);

    v11 = v31;
  }

}

void __58__RadioRecentStationsController__newRecentStationsRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)stationGroups
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__711;
  v10 = __Block_byref_object_dispose__712;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__RadioRecentStationsController_stationGroups__block_invoke;
  v5[3] = &unk_24CA2EB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)stations
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[RadioRecentStationsController stationGroups](self, "stationGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "stations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          if (!v5)
            v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
          objc_msgSend(v5, "addObjectsFromArray:", v8);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)insertPendingRecentStation:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__RadioRecentStationsController_insertPendingRecentStation___block_invoke;
    v7[3] = &unk_24CA2E640;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_async(accessQueue, v7);

  }
}

- (void)insertPendingRecentStationDictionary:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[4];
  id v8;
  RadioRecentStationsController *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__RadioRecentStationsController_insertPendingRecentStationDictionary___block_invoke;
    v7[3] = &unk_24CA2E640;
    v8 = v4;
    v9 = self;
    dispatch_barrier_async(accessQueue, v7);

  }
}

- (void)refreshWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_pendingRecentStations, "copy");
  v6 = -[RadioRecentStationsController _newRecentStationsRequest](self, "_newRecentStationsRequest");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__RadioRecentStationsController_refreshWithCompletionHandler___block_invoke;
  v10[3] = &unk_24CA2E668;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v9, "startWithCompletionHandler:", v10);

}

- (void)removePendingRecentStation:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__RadioRecentStationsController_removePendingRecentStation___block_invoke;
    v7[3] = &unk_24CA2E640;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_async(accessQueue, v7);

  }
}

- (void)_createStationGroups
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *serverRecentStationGroups;
  id v7;
  RadioMutableRecentStationsGroup *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  RadioRecentStationsController *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  if (-[NSMutableArray count](self->_pendingRecentStations, "count"))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithArray:", self->_pendingRecentStations);
  else
    v3 = 0;
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__711;
  v30 = __Block_byref_object_dispose__712;
  v31 = 0;
  if (-[NSArray count](self->_serverRecentStationGroups, "count") || !objc_msgSend(v3, "count"))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    serverRecentStationGroups = self->_serverRecentStationGroups;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __53__RadioRecentStationsController__createStationGroups__block_invoke;
    v17[3] = &unk_24CA2E6B8;
    v20 = &v22;
    v7 = v5;
    v21 = &v26;
    v18 = v7;
    v19 = self;
    -[NSArray enumerateObjectsUsingBlock:](serverRecentStationGroups, "enumerateObjectsUsingBlock:", v17);
    if (v23[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend((id)v27[5], "count"))
      {
        v23[3] = 0;
      }
      else if (v23[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_20:

        _Block_object_dispose(&v22, 8);
        goto LABEL_21;
      }
    }
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend((id)v27[5], "objectAtIndex:", v23[3]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v13, "stations");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v14);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = v7;
        }
        v16 = v15;
        objc_msgSend(v13, "setStations:", v15);
        objc_msgSend((id)v27[5], "replaceObjectAtIndex:withObject:", v23[3], v13);

      }
    }
    goto LABEL_20;
  }
  v8 = objc_alloc_init(RadioMutableRecentStationsGroup);
  -[RadioMutableRecentStationsGroup setStations:](v8, "setStations:", v5);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v8, 0);
    v10 = (void *)v27[5];
    v27[5] = v9;

  }
LABEL_21:
  objc_storeStrong((id *)&self->_stationGroups, (id)v27[5]);
  _Block_object_dispose(&v26, 8);

}

- (void)_insertPendingRecentStation:(id)a3
{
  char v4;
  NSMutableArray *pendingRecentStations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  v4 = -[NSMutableArray containsObject:](self->_pendingRecentStations, "containsObject:");
  pendingRecentStations = self->_pendingRecentStations;
  if (!pendingRecentStations)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v7 = self->_pendingRecentStations;
    self->_pendingRecentStations = v6;

    pendingRecentStations = self->_pendingRecentStations;
  }
  -[NSMutableArray insertObject:atIndex:](pendingRecentStations, "insertObject:atIndex:", v8, 0);
  if ((v4 & 1) == 0)
  {
    self->_hasValidStationGroups = 0;
    -[RadioRecentStationsController _postStationsDidChangeNotification](self, "_postStationsDidChangeNotification");
  }

}

- (void)_postStationsDidChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__RadioRecentStationsController__postStationsDidChangeNotification__block_invoke;
  block[3] = &unk_24CA2EB28;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationGroups, 0);
  objc_storeStrong((id *)&self->_serverRecentStationGroups, 0);
  objc_storeStrong((id *)&self->_pendingRecentStations, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __67__RadioRecentStationsController__postStationsDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("RadioRecentStationsControllerStationsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

id *__116__RadioRecentStationsController__handleRecentStationsResponse_fromRequest_pendingRecentStations_isInitialCacheLoad___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id *result;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 16) && !*(_BYTE *)(a1 + 56))
  {
    *(_BYTE *)(v2 + 16) = 1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 24))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v3);
          v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
          if (v9 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", v9);
            v6 = 1;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    v13 = *(_QWORD *)(a1 + 32);
    result = (id *)(v13 + 32);
    v12 = *(void **)(a1 + 48);
    if (*(void **)(v13 + 32) != v12)
      goto LABEL_19;
    if ((v6 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
    v11 = *(void **)(v2 + 32);
    result = (id *)(v2 + 32);
    v12 = *(void **)(a1 + 48);
    if (v11 != v12)
    {
LABEL_19:
      objc_storeStrong(result, v12);
      v13 = *(_QWORD *)(a1 + 32);
LABEL_20:
      *(_BYTE *)(v13 + 17) = 0;
      return (id *)objc_msgSend(*(id *)(a1 + 32), "_postStationsDidChangeNotification", (_QWORD)v14);
    }
  }
  return result;
}

void __53__RadioRecentStationsController__createStationGroups__block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = v5;
  v16 = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_msgSend(v5, "isActive");
    v6 = v16;
    if (v7)
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  }
  objc_msgSend(v6, "stations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "removeObjectsInArray:", a1[4]);
    if (v8 != v9 && (objc_msgSend(v8, "isEqualToArray:", v9) & 1) == 0)
    {
      v10 = (void *)objc_msgSend(v16, "mutableCopy");
      objc_msgSend(v10, "setStations:", v9);

      v16 = v10;
    }

  }
  v11 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  v12 = v16;
  if (!v11)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1[5] + 32), "count"));
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v12 = v16;
    v11 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  }
  v17 = v12;
  objc_msgSend(v11, "addObject:", v12);

}

void __60__RadioRecentStationsController_removePendingRecentStation___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v1)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__RadioRecentStationsController_removePendingRecentStation___block_invoke_2;
    v6[3] = &unk_24CA2E690;
    v7 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v1, "indexOfObjectWithOptions:passingTest:", 2, v6);
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", v3);
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v5 = *(void **)(v4 + 24);
        *(_QWORD *)(v4 + 24) = 0;

      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 0;
    }

  }
}

uint64_t __60__RadioRecentStationsController_removePendingRecentStation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

void __62__RadioRecentStationsController_refreshWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "_handleRecentStationsResponse:fromRequest:pendingRecentStations:isInitialCacheLoad:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

void __70__RadioRecentStationsController_insertPendingRecentStationDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[RadioModel backgroundModel](RadioModel, "backgroundModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "newStationWithDictionary:", *(_QWORD *)(a1 + 32));

  v3 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_insertPendingRecentStation:", v4);
    v3 = v4;
  }

}

uint64_t __60__RadioRecentStationsController_insertPendingRecentStation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertPendingRecentStation:", *(_QWORD *)(a1 + 40));
}

void __46__RadioRecentStationsController_stationGroups__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 17))
  {
    *(_BYTE *)(v2 + 17) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_createStationGroups");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 40));
}

@end

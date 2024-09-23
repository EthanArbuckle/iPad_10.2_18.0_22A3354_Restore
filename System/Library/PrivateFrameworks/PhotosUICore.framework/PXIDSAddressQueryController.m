@implementation PXIDSAddressQueryController

- (PXIDSAddressQueryController)init
{
  PXIDSAddressQueryController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *queryStateForAddress;
  NSMutableArray *v5;
  NSMutableArray *queries;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXIDSAddressQueryController;
  v2 = -[PXIDSAddressQueryController init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryStateForAddress = v2->_queryStateForAddress;
    v2->_queryStateForAddress = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    queries = v2->_queries;
    v2->_queries = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.photos.PXIDSAddressQueryController", v8);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSBatchIDQueryController invalidate](self->_idsBatchIDQueryController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PXIDSAddressQueryController;
  -[PXIDSAddressQueryController dealloc](&v3, sel_dealloc);
}

- (void)performBatchQueryForAddresses:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *serialQueue;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXIDSAddressQueryController.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("addresses"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXIDSAddressQueryController.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PXIDSAddressQueryController_performBatchQueryForAddresses_resultHandler___block_invoke;
  block[3] = &unk_1E51422C8;
  objc_copyWeak(&v18, &location);
  v16 = v7;
  v17 = v9;
  v11 = v9;
  v12 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_performBatchQueryForAddresses:(id)a3 resultHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  PXIDSAddressQuery *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  IDSBatchIDQueryController *idsBatchIDQueryController;
  id v32;
  IDSBatchIDQueryController *v33;
  IDSBatchIDQueryController *v34;
  id v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD block[4];
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_queryStateForAddress, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v13)
          goto LABEL_10;
        v15 = objc_msgSend(v13, "integerValue");
        if ((v15 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15 == 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v16, v12);

          goto LABEL_12;
        }
        if (!v15)
LABEL_10:
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queryStateForAddress, "setObject:forKeyedSubscript:", &unk_1E53EC828, v12);
        objc_msgSend(v7, "addObject:", v12);
LABEL_12:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v9);
  }

  v17 = v37;
  v18 = v36;
  if (objc_msgSend(v37, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PXIDSAddressQueryController__performBatchQueryForAddresses_resultHandler___block_invoke;
    block[3] = &unk_1E5148CE0;
    v45 = v36;
    v44 = v37;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  if (objc_msgSend(v7, "count"))
  {
    v19 = -[PXIDSAddressQuery initWithDestinations:resultHandler:]([PXIDSAddressQuery alloc], "initWithDestinations:resultHandler:", v7, v36);
    -[NSMutableArray addObject:](self->_queries, "addObject:", v19);
    if (!-[NSMutableArray count](self->_queries, "count"))
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = self->_queries;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          if (objc_msgSend(v26, "isComplete"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXIDSAddressQueryController.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!query.isComplete"));

          }
          objc_msgSend(v26, "remainingDestinations");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "unionSet:", v27);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v23);
    }

    v18 = v36;
    v17 = v37;
    if (v20)
    {
      objc_msgSend(v20, "allObjects");
      v29 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_29:
      v29 = v7;
    }
    PLUIGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v29;
      _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEBUG, "Querying status for phone numbers/email addresses: %@", buf, 0xCu);
    }

    idsBatchIDQueryController = self->_idsBatchIDQueryController;
    if (!idsBatchIDQueryController)
    {
      v32 = objc_alloc(MEMORY[0x1E0D342B0]);
      v33 = (IDSBatchIDQueryController *)objc_msgSend(v32, "initWithService:delegate:queue:", *MEMORY[0x1E0D34240], self, self->_serialQueue);
      v34 = self->_idsBatchIDQueryController;
      self->_idsBatchIDQueryController = v33;

      idsBatchIDQueryController = self->_idsBatchIDQueryController;
    }
    -[IDSBatchIDQueryController setDestinations:](idsBatchIDQueryController, "setDestinations:", v29);

  }
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  if (v10)
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Error updating IDS destinations %@ : %@", (uint8_t *)&v12, 0x16u);
    }

  }
  else
  {
    -[PXIDSAddressQueryController _idStatusUpdatedForDestinations:service:](self, "_idStatusUpdatedForDestinations:service:", v9, a5);
  }

}

- (void)_idStatusUpdatedForDestinations:(id)a3 service:(id)a4
{
  id v7;
  NSObject *serialQueue;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id location;
  _QWORD v19[4];
  id v20;
  PXIDSAddressQueryController *v21;

  v7 = a3;
  serialQueue = self->_serialQueue;
  v9 = a4;
  dispatch_assert_queue_V2(serialQueue);
  LODWORD(serialQueue) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D34240]);

  if ((_DWORD)serialQueue)
  {
    if (!-[NSMutableArray count](self->_queries, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXIDSAddressQueryController.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_queries.count > 0"));

    }
    v10 = (void *)-[NSMutableArray copy](self->_queries, "copy");
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__PXIDSAddressQueryController__idStatusUpdatedForDestinations_service___block_invoke;
    v19[3] = &unk_1E5122868;
    v12 = v10;
    v20 = v12;
    v21 = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v19);
    objc_initWeak(&location, self);
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __71__PXIDSAddressQueryController__idStatusUpdatedForDestinations_service___block_invoke_59;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v17, &location);
    v16 = v12;
    v13 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

- (void)_callResultsHandlerForQueries:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "popStashedResults", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          objc_msgSend(v9, "resultHandler");
          v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v10, 0);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsBatchIDQueryController, 0);
  objc_storeStrong((id *)&self->_queryStateForAddress, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __71__PXIDSAddressQueryController__idStatusUpdatedForDestinations_service___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = a3;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v5;
    v27 = 2112;
    v28 = v19;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "IDS status update for %@: %@", buf, 0x16u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isComplete") & 1) == 0)
        {
          objc_msgSend(v12, "remainingDestinations");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "containsObject:", v5))
          {
            v14 = objc_msgSend(v19, "integerValue");
            v15 = 2;
            if (v14 != 1)
              v15 = 0;
            if (v14 == 2)
              v16 = 3;
            else
              v16 = v15;
            v17 = v14 != 2 && v14 == 1;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKeyedSubscript:", v18, v5);

            objc_msgSend(v12, "stashDestination:withResult:", v5, v17);
            if (objc_msgSend(v12, "isComplete"))
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", v12);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

void __71__PXIDSAddressQueryController__idStatusUpdatedForDestinations_service___block_invoke_59(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_callResultsHandlerForQueries:", *(_QWORD *)(a1 + 32));

}

uint64_t __76__PXIDSAddressQueryController__performBatchQueryForAddresses_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __75__PXIDSAddressQueryController_performBatchQueryForAddresses_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_performBatchQueryForAddresses:resultHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end

@implementation WFDatabaseResult

- (void)registerObserver:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabaseResult.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  -[WFDatabaseResult queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__WFDatabaseResult_registerObserver___block_invoke;
  block[3] = &unk_1E7AF92C0;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(v6, block);

}

- (unint64_t)count
{
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  _QWORD v9[6];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[WFDatabaseResult queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__WFDatabaseResult_count__block_invoke;
  block[3] = &unk_1E7AF92E8;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v3, block);

  v5 = v12[3];
  if (!v5)
  {
    v6 = -[WFDatabase countForResult:](self->_database, "countForResult:", self);
    v12[3] = v6;
    -[WFDatabaseResult queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __25__WFDatabaseResult_count__block_invoke_2;
    v9[3] = &unk_1E7AF92E8;
    v9[4] = self;
    v9[5] = &v11;
    dispatch_sync(v7, v9);

    v5 = v12[3];
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

- (NSArray)descriptors
{
  NSObject *v3;
  id v4;
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
  v10 = __Block_byref_object_copy__62914;
  v11 = __Block_byref_object_dispose__62915;
  v12 = 0;
  -[WFDatabaseResult queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__WFDatabaseResult_descriptors__block_invoke;
  v6[3] = &unk_1E7AF92E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __39__WFDatabaseResult_unregisterObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observersTable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __37__WFDatabaseResult_registerObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observersTable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSHashTable)observersTable
{
  return self->_observersTable;
}

void __25__WFDatabaseResult_count__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCachedCount:", v2);

}

- (void)setCachedCount:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCount, a3);
}

void __25__WFDatabaseResult_count__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    v3 = (void *)v2[1];
LABEL_3:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count");
    return;
  }
  objc_msgSend(v2, "cachedCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "cachedCount");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "unsignedIntValue");

  }
  else
  {
    v3 = (void *)v5[6];
    if (v3)
      goto LABEL_3;
  }
}

- (NSNumber)cachedCount
{
  return self->_cachedCount;
}

- (void)setSearchPredicate:(id)a3
{
  NSObject *v4;
  NSPredicate *v5;
  _QWORD block[5];
  NSPredicate *v7;

  v5 = (NSPredicate *)a3;
  if (self->_searchPredicate != v5)
  {
    -[WFDatabaseResult queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__WFDatabaseResult_setSearchPredicate___block_invoke;
    block[3] = &unk_1E7AF92C0;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void __31__WFDatabaseResult_descriptors__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (!v3)
  {
    v4 = *(void **)(v2 + 48);
    if (v4)
    {
      objc_storeStrong((id *)(v2 + 8), v4);
    }
    else
    {
      v16 = 0;
      objc_msgSend((id)v2, "unsearchedDescriptorsWithError:", &v16);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v16;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 8);
      *(_QWORD *)(v7 + 8) = v5;

      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 24);
      *(_QWORD *)(v9 + 24) = v6;

    }
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v11 + 32))
    {
      objc_msgSend(*(id *)(v11 + 8), "filteredArrayUsingPredicate:");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 8);
      *(_QWORD *)(v13 + 8) = v12;

      v11 = *(_QWORD *)(a1 + 32);
    }
    v15 = *(void **)(v11 + 72);
    *(_QWORD *)(v11 + 72) = 0;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (id)_init
{
  WFDatabaseResult *v2;
  WFDatabaseResult *v3;
  WFDatabaseResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFDatabaseResult;
  v2 = -[WFDatabaseResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    WFDatabaseResultCommonInit(v2);
    v4 = v3;
  }

  return v3;
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[WFDatabaseResult queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WFDatabaseResult_unregisterObserver___block_invoke;
  block[3] = &unk_1E7AF92C0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCount, 0);
  objc_storeStrong((id *)&self->_observersTable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_staticDescriptors, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_searchPredicate, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

- (WFDatabaseResult)initWithStaticDescriptors:(id)a3
{
  id v5;
  WFDatabaseResult *v6;
  WFDatabaseResult *v7;
  uint64_t v8;
  NSArray *staticDescriptors;
  WFDatabaseResult *v10;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabaseResult.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptors"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFDatabaseResult;
  v6 = -[WFDatabaseResult init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    WFDatabaseResultCommonInit(v6);
    v8 = objc_msgSend(v5, "copy");
    staticDescriptors = v7->_staticDescriptors;
    v7->_staticDescriptors = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)unsearchedDescriptorsWithError:(id *)a3
{
  return 0;
}

- (void)updateDescriptorsAndNotify:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  WFDatabaseResult *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[WFDatabaseResult descriptors](self, "descriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabaseResult queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WFDatabaseResult_updateDescriptorsAndNotify_state___block_invoke;
  block[3] = &unk_1E7AF9298;
  v14 = v6;
  v15 = self;
  v16 = v8;
  v17 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_sync(v9, block);

}

- (void)reset
{
  NSObject *v3;
  _QWORD block[5];

  -[WFDatabaseResult queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__WFDatabaseResult_reset__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (NSArray)observers
{
  NSObject *v3;
  id v4;
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
  v10 = __Block_byref_object_copy__62914;
  v11 = __Block_byref_object_dispose__62915;
  v12 = 0;
  -[WFDatabaseResult queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__WFDatabaseResult_observers__block_invoke;
  v6[3] = &unk_1E7AF92E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)setDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_descriptors, a3);
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_fetchError, a3);
}

- (NSPredicate)searchPredicate
{
  return self->_searchPredicate;
}

- (WFDatabaseResultState)state
{
  return self->_state;
}

- (NSArray)staticDescriptors
{
  return self->_staticDescriptors;
}

void __29__WFDatabaseResult_observers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "observersTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __25__WFDatabaseResult_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = 0;

}

void __39__WFDatabaseResult_setSearchPredicate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = 0;

}

void __53__WFDatabaseResult_updateDescriptorsAndNotify_state___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "searchPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "searchPredicate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "filteredArrayUsingPredicate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v5;
  }
  v6 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v9 = objc_msgSend(v6, "isEqualToArray:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

    }
    v10 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(*(id *)(a1 + 40), "setDescriptors:", v10);

    objc_msgSend(*(id *)(a1 + 40), "setFetchError:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setCachedCount:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setState:", *(_QWORD *)(a1 + 56));
    getWFDatabaseLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFDatabaseResult updateDescriptorsAndNotify:state:]_block_invoke";
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEBUG, "%s Database result changed: %@", buf, 0x16u);
    }

    +[WFDatabaseResult callbackQueue](WFDatabaseResult, "callbackQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__WFDatabaseResult_updateDescriptorsAndNotify_state___block_invoke_122;
    block[3] = &unk_1E7AF94B0;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v13, block);

  }
LABEL_13:

}

void __53__WFDatabaseResult_updateDescriptorsAndNotify_state___block_invoke_122(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "databaseResultDidChange:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)callbackQueue
{
  if (callbackQueue_onceToken != -1)
    dispatch_once(&callbackQueue_onceToken, &__block_literal_global_62929);
  return (id)callbackQueue_callbackQueue;
}

void __33__WFDatabaseResult_callbackQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.shortcuts.WFDatabaseResult-callback", v2);
  v1 = (void *)callbackQueue_callbackQueue;
  callbackQueue_callbackQueue = (uint64_t)v0;

}

@end

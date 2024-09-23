@implementation PXSectionedChangeDetailsRepository

- (id)changeDetailsFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  id v5;
  void *v6;
  id *v7;
  id v10;
  NSObject *internalQueue;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD block[5];
  id v48;
  int64_t v49;
  int64_t v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  id v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == a4)
  {
    +[PXSectionedDataSourceChangeDetails changeDetailsWithNoChangesFromDataSourceIdentifier:toDataSourceIdentifier:](PXSectionedDataSourceChangeDetails, "changeDetailsWithNoChangesFromDataSourceIdentifier:toDataSourceIdentifier:", a3, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v55[0] = v5;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = (id *)v55;
LABEL_21:
    objc_msgSend(v6, "arrayWithObjects:count:", v7, 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (!a3 || !a4)
  {
    +[PXSectionedDataSourceChangeDetails changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:](PXSectionedDataSourceChangeDetails, "changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:", a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v54 = v5;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = &v54;
    goto LABEL_21;
  }
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__PXSectionedChangeDetailsRepository_changeDetailsFromDataSourceIdentifier_toDataSourceIdentifier___block_invoke;
  block[3] = &unk_2514CF8F0;
  block[4] = self;
  v49 = a4;
  v12 = v10;
  v48 = v12;
  v50 = a3;
  dispatch_sync(internalQueue, block);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = v12;
  v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_23;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v44;
  do
  {
    v17 = 0;
    v38 = v14;
    do
    {
      if (*(_QWORD *)v44 != v16)
        objc_enumerationMutation(v5);
      v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v17);
      if (!v15
        || (v19 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v17), "count"), v19 < objc_msgSend(v15, "count")))
      {
        objc_msgSend(v18, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "fromDataSourceIdentifier") != a3)
          goto LABEL_15;
        v21 = v16;
        v22 = v5;
        objc_msgSend(v18, "lastObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "toDataSourceIdentifier");

        if (v24 == a4)
        {
          v20 = v15;
          v15 = v18;
          v5 = v22;
          v16 = v21;
          v14 = v38;
LABEL_15:

          goto LABEL_17;
        }
        v5 = v22;
        v16 = v21;
        v14 = v38;
      }
LABEL_17:
      ++v17;
    }
    while (v14 != v17);
    v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  }
  while (v14);
LABEL_23:

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = v15;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "sectionChanges");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "hasIncrementalChanges");

        if (!v32)
        {
          v33 = v26;
          goto LABEL_35;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      if (v28)
        continue;
      break;
    }
  }

  objc_msgSend(v26, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "fromDataSourceIdentifier") == a3)
  {
    objc_msgSend(v26, "lastObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "toDataSourceIdentifier");

    if (v35 == a4)
    {
      v25 = v26;
      goto LABEL_37;
    }
  }
  else
  {
LABEL_35:

  }
  +[PXSectionedDataSourceChangeDetails changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:](PXSectionedDataSourceChangeDetails, "changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:", a3, a4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
  v25 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
LABEL_38:

  return v25;
}

- (void)addChangeDetails:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    internalQueue = self->_internalQueue;
    block[1] = 3221225472;
    block[2] = __55__PXSectionedChangeDetailsRepository_addChangeDetails___block_invoke;
    block[3] = &unk_2514D0CC0;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_sync(internalQueue, block);

    v4 = v6;
  }

}

- (PXSectionedChangeDetailsRepository)initWithChangeHistoryLimit:(int64_t)a3
{
  PXSectionedChangeDetailsRepository *v4;
  PXSectionedChangeDetailsRepository *v5;
  uint64_t v6;
  NSMutableArray *allChangeDetails;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *internalQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXSectionedChangeDetailsRepository;
  v4 = -[PXSectionedChangeDetailsRepository init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_historyLimit = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    allChangeDetails = v5->_allChangeDetails;
    v5->_allChangeDetails = (NSMutableArray *)v6;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.photosUIFoundation.changeDetailsRepository", v8);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v9;

  }
  return v5;
}

unint64_t __55__PXSectionedChangeDetailsRepository_addChangeDetails___block_invoke(uint64_t a1)
{
  unint64_t result;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 24);
  if (result > 2 * v4)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectsInRange:", v4, objc_msgSend(*(id *)(v3 + 8), "count") - v4);
  return result;
}

void __99__PXSectionedChangeDetailsRepository_changeDetailsFromDataSourceIdentifier_toDataSourceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v1 = a1;
  v34 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v29;
    v19 = *(_QWORD *)v29;
    v20 = v1;
    do
    {
      v5 = 0;
      v21 = v3;
      do
      {
        if (*(_QWORD *)v29 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        v23 = v5;
        if (objc_msgSend(v6, "toDataSourceIdentifier") == *(_QWORD *)(v1 + 48))
        {
          v7 = *(void **)(v1 + 40);
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v6, 0);
          objc_msgSend(v7, "addObject:", v8);

LABEL_18:
          if (objc_msgSend(v6, "fromDataSourceIdentifier") == *(_QWORD *)(v1 + 56))
            goto LABEL_23;
          goto LABEL_21;
        }
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = *(id *)(v1 + 40);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (!v10)
        {

          goto LABEL_21;
        }
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v15, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "fromDataSourceIdentifier");
            v18 = objc_msgSend(v6, "toDataSourceIdentifier");

            if (v17 == v18)
            {
              objc_msgSend(v15, "insertObject:atIndex:", v6, 0);
              v12 = 1;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v11);

        v4 = v19;
        v1 = v20;
        v3 = v21;
        if ((v12 & 1) != 0)
          goto LABEL_18;
LABEL_21:
        v5 = v23 + 1;
      }
      while (v23 + 1 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v3);
  }
LABEL_23:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_allChangeDetails, 0);
}

- (PXSectionedChangeDetailsRepository)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedChangeDetailsRepository.m"), 19, CFSTR("%@ not supported"), v5);

  abort();
}

- (id)coalescedChangeDetailsFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  void *v4;
  void *v5;

  -[PXSectionedChangeDetailsRepository changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:](self, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    +[PXSectionedChangeDetailsCoalescer changeDetailsByCoalescingChangeDetails:](PXSectionedChangeDetailsCoalescer, "changeDetailsByCoalescingChangeDetails:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)historyLimit
{
  return self->_historyLimit;
}

@end

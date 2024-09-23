@implementation PXSectionedChangeDetailsCoalescer

- (PXSectionedChangeDetailsCoalescer)initWithSectionedChangeDetails:(id)a3
{
  id v4;
  PXSectionedChangeDetailsCoalescer *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  PXMutableArrayChangeDetails *sectionChangeDetails;
  void *v10;
  uint64_t v11;
  NSMutableArray *itemChangeEntries;
  _QWORD v14[4];
  id v15;
  PXSectionedChangeDetailsCoalescer *v16;
  objc_super v17;
  uint8_t buf[4];
  PXSectionedChangeDetailsCoalescer *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXSectionedChangeDetailsCoalescer;
  v5 = -[PXSectionedChangeDetailsCoalescer init](&v17, sel_init);
  if (v5)
  {
    PXChangeDetailsCoalescerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_24430E000, v6, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: Initializing %@ with change details: %@", buf, 0x16u);
    }

    v5->_fromDataSourceIdentifier = objc_msgSend(v4, "fromDataSourceIdentifier");
    v5->_currentToDataSourceIdentifier = objc_msgSend(v4, "toDataSourceIdentifier");
    objc_msgSend(v4, "sectionChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    sectionChangeDetails = v5->_sectionChangeDetails;
    v5->_sectionChangeDetails = (PXMutableArrayChangeDetails *)v8;

    objc_msgSend(v4, "sectionsWithItemChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    itemChangeEntries = v5->_itemChangeEntries;
    v5->_itemChangeEntries = (NSMutableArray *)v11;

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__PXSectionedChangeDetailsCoalescer_initWithSectionedChangeDetails___block_invoke;
    v14[3] = &unk_2514D1018;
    v15 = v4;
    v16 = v5;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v14);

  }
  return v5;
}

- (PXSectionedChangeDetailsCoalescer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedChangeDetailsCoalescer.m"), 159, CFSTR("%s is not available as initializer"), "-[PXSectionedChangeDetailsCoalescer init]");

  abort();
}

- (void)addChangeDetails:(id)a3
{
  id v4;
  PXSectionedDataSourceChangeDetails *cachedResult;
  int64_t currentToDataSourceIdentifier;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  PXSectionedChangeDetailsCoalescer *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  int64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  cachedResult = self->_cachedResult;
  self->_cachedResult = 0;

  currentToDataSourceIdentifier = self->_currentToDataSourceIdentifier;
  if (currentToDataSourceIdentifier == objc_msgSend(v4, "fromDataSourceIdentifier"))
  {
    self->_currentToDataSourceIdentifier = objc_msgSend(v4, "toDataSourceIdentifier");
    objc_msgSend(v4, "sectionChanges");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v21 = self->_currentToDataSourceIdentifier;
      *(_DWORD *)buf = 134218240;
      v29 = v21;
      v30 = 2048;
      v31 = objc_msgSend(v4, "fromDataSourceIdentifier");
      _os_log_fault_impl(&dword_24430E000, v8, OS_LOG_TYPE_FAULT, "Invalid coalescing operation. Sectioned change details are not contiguous (data source don't match: %lu <-> %lu)", buf, 0x16u);
    }

    self->_currentToDataSourceIdentifier = objc_msgSend(v4, "toDataSourceIdentifier");
    +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges](PXArrayChangeDetails, "changeDetailsWithNoIncrementalChanges");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;
  -[PXMutableArrayChangeDetails addChangeDetails:](self->_sectionChangeDetails, "addChangeDetails:", v7);
  if (-[PXMutableArrayChangeDetails hasIncrementalChanges](self->_sectionChangeDetails, "hasIncrementalChanges"))
  {
    objc_msgSend(v4, "sectionsWithItemChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = self;
    v12 = self->_itemChangeEntries;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v18 = objc_msgSend(v9, "indexAfterApplyingChangesToIndex:", objc_msgSend(v17, "index"));
          objc_msgSend(v17, "setIndex:", v18);
          if (v18 != 0x7FFFFFFFFFFFFFFFLL && -[NSObject containsIndex:](v11, "containsIndex:", v18))
          {
            objc_msgSend(v17, "updateWithSectionedChangeDetails:", v4);
            -[NSObject removeIndex:](v11, "removeIndex:", v18);
          }
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    while (-[NSObject count](v11, "count"))
    {
      v19 = -[NSObject firstIndex](v11, "firstIndex");
      -[NSObject removeIndex:](v11, "removeIndex:", v19);
      if (-[PXArrayChangeDetails indexAfterRevertingChangesFromIndex:](v22->_sectionChangeDetails, "indexAfterRevertingChangesFromIndex:", v19) != 0x7FFFFFFFFFFFFFFFLL)
      {
        _PXChangeDetailsEntryForSection(v19, v4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v22->_itemChangeEntries, "addObject:", v20);

      }
    }
  }
  else
  {
    PXChangeDetailsCoalescerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24430E000, v11, OS_LOG_TYPE_DEFAULT, "Failed to coalesce sectioned change details due to non-incremental section changes", buf, 2u);
    }
  }

}

- (PXSectionedDataSourceChangeDetails)coalescedChangeDetails
{
  PXSectionedDataSourceChangeDetails *cachedResult;
  PXSectionedChangeDetailsCoalescer *v4;
  int64_t fromDataSourceIdentifier;
  int64_t currentToDataSourceIdentifier;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PXSectionedDataSourceChangeDetails *v21;
  PXSectionedDataSourceChangeDetails *v22;
  int64_t v23;
  int64_t v24;
  PXSectionedChangeDetailsCoalescer *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  cachedResult = self->_cachedResult;
  if (cachedResult)
    return cachedResult;
  v4 = self;
  fromDataSourceIdentifier = self->_fromDataSourceIdentifier;
  currentToDataSourceIdentifier = self->_currentToDataSourceIdentifier;
  v7 = (void *)-[PXMutableArrayChangeDetails copy](self->_sectionChangeDetails, "copy");
  if (objc_msgSend(v7, "hasIncrementalChanges"))
  {
    v23 = currentToDataSourceIdentifier;
    v24 = fromDataSourceIdentifier;
    v25 = v4;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSMutableArray count](v4->_itemChangeEntries, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v4->_itemChangeEntries;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v14, "index") != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v14, "changeDetails");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v15, "copy");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "index"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v16, v17);

            objc_msgSend(v14, "subitemChangesByItem");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "count"))
            {
              if (!v11)
              {
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "index"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v19);

            }
          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v4 = v25;
    currentToDataSourceIdentifier = v23;
    fromDataSourceIdentifier = v24;
    v20 = v26;
  }
  else
  {
    v20 = 0;
    v11 = 0;
  }
  v21 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:]([PXSectionedDataSourceChangeDetails alloc], "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", fromDataSourceIdentifier, currentToDataSourceIdentifier, v7, v20, v11);
  v22 = v4->_cachedResult;
  v4->_cachedResult = v21;

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResult, 0);
  objc_storeStrong((id *)&self->_itemChangeEntries, 0);
  objc_storeStrong((id *)&self->_sectionChangeDetails, 0);
}

void __68__PXSectionedChangeDetailsCoalescer_initWithSectionedChangeDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  _PXChangeDetailsEntryForSection(a2, *(void **)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", v3);

}

+ (id)changeDetailsByCoalescingChangeDetails:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  PXSectionedChangeDetailsCoalescer *v10;
  void *v11;
  PXSectionedChangeDetailsCoalescer *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSectionedChangeDetailsCoalescer.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeDetailsArray.count > 0"));

  }
  v6 = objc_msgSend(v5, "count");
  PXChangeDetailsCoalescerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6 == 1)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24430E000, v7, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: Early return for single changeDetails", buf, 2u);
    }

    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v22 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_24430E000, v7, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: BEGIN COALESCING %lu changes", buf, 0xCu);
    }

    v10 = [PXSectionedChangeDetailsCoalescer alloc];
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXSectionedChangeDetailsCoalescer initWithSectionedChangeDetails:](v10, "initWithSectionedChangeDetails:", v11);

    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v13 = 1;
      do
      {
        PXChangeDetailsCoalescerGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v22 = (uint64_t)v15;
          _os_log_impl(&dword_24430E000, v14, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: Adding child details: %@", buf, 0xCu);

        }
        objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSectionedChangeDetailsCoalescer addChangeDetails:](v12, "addChangeDetails:", v16);

        ++v13;
      }
      while (v13 < objc_msgSend(v5, "count"));
    }
    -[PXSectionedChangeDetailsCoalescer coalescedChangeDetails](v12, "coalescedChangeDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXChangeDetailsCoalescerGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = (uint64_t)v9;
      _os_log_impl(&dword_24430E000, v17, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: Final details: %@", buf, 0xCu);
    }

    PXChangeDetailsCoalescerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24430E000, v18, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: END COALESCING", buf, 2u);
    }

  }
  return v9;
}

@end

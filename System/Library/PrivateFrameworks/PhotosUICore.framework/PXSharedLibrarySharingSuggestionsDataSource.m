@implementation PXSharedLibrarySharingSuggestionsDataSource

- (PXSharedLibrarySharingSuggestionsDataSource)initWithSharingSuggestions:(id)a3 aggregateBeforeDate:(id)a4
{
  id v7;
  id v8;
  PXSharedLibrarySharingSuggestionsDataSource *v9;
  id v10;
  PXSharedLibraryAggregateSharingSuggestionContainer *v11;
  PXSharedLibraryAggregateSharingSuggestionContainer *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *containers;
  NSMutableDictionary *v19;
  NSMutableDictionary *promiseByContainer;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSource;
  v9 = -[PXSharedLibrarySharingSuggestionsDataSource init](&v22, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = -[PXSharedLibraryAggregateSharingSuggestionContainer initWithSharingSuggestions:aggregateBeforeDate:]([PXSharedLibraryAggregateSharingSuggestionContainer alloc], "initWithSharingSuggestions:aggregateBeforeDate:", v7, v8);
    v12 = v11;
    if (v11)
    {
      v13 = -[PXSharedLibraryAggregateSharingSuggestionContainer aggregationRange](v11, "aggregationRange");
      objc_msgSend(v7, "fetchedObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subarrayWithRange:", 0, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v15);

      objc_msgSend(v10, "addObject:", v12);
    }
    else
    {
      objc_msgSend(v7, "fetchedObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v16);

    }
    v17 = objc_msgSend(v10, "copy");
    containers = v9->_containers;
    v9->_containers = (NSArray *)v17;

    objc_storeStrong((id *)&v9->_sharingSuggestions, a3);
    objc_storeStrong((id *)&v9->_aggregateBeforeDate, a4);
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    promiseByContainer = v9->_promiseByContainer;
    v9->_promiseByContainer = v19;

  }
  return v9;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return -[NSArray count](self->_containers, "count", a3);
}

- (id)_promiseForContainer:(id)a3
{
  id v4;
  PXSharedLibrarySharingSuggestionsDataSource *v5;
  PXSharedLibrarySharingSuggestionPromise *v6;
  void *v7;
  PXSharedLibrarySharingSuggestionPromise *v8;
  void *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_promiseByContainer, "objectForKeyedSubscript:", v4);
  v6 = (PXSharedLibrarySharingSuggestionPromise *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[PXSharedLibrarySharingSuggestionsDataSource delegate](v5, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSource:promiseForContainer:", v5, v4);
    v6 = (PXSharedLibrarySharingSuggestionPromise *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v8 = [PXSharedLibrarySharingSuggestionPromise alloc];
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PXSharedLibrarySharingSuggestionPromise initWithContainer:considerNewAfterDate:lightweightPlaceholder:](v8, "initWithContainer:considerNewAfterDate:lightweightPlaceholder:", v4, v9, 1);

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_promiseByContainer, "setObject:forKeyedSubscript:", v6, v4);
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t item;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXSharedLibrarySharingSuggestionsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsDataSourceManager.m"), 602, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_OWORD *)&a3->dataSourceIdentifier;
    v15 = *(_OWORD *)&a3->item;
    PXSimpleIndexPathDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsDataSourceManager.m"), 610, CFSTR("%@ unsupported indexPath:%@"), self, v13, v14, v15);

    abort();
  }
  item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_11;
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    return CFSTR("PXSharedLibrarySuggestionDataSourceSection");
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
  -[NSArray objectAtIndexedSubscript:](self->_containers, "objectAtIndexedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibrarySharingSuggestionsDataSource _promiseForContainer:](self, "_promiseForContainer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)itemIndexesForSharingSuggestions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSArray *containers;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  containers = self->_containers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PXSharedLibrarySharingSuggestionsDataSource_itemIndexesForSharingSuggestions___block_invoke;
  v11[3] = &unk_1E5127A48;
  v12 = v6;
  v8 = v6;
  -[NSArray indexesOfObjectsPassingTest:](containers, "indexesOfObjectsPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)containers
{
  return self->_containers;
}

- (NSDate)aggregateBeforeDate
{
  return self->_aggregateBeforeDate;
}

- (PHFetchResult)sharingSuggestions
{
  return self->_sharingSuggestions;
}

- (PXSharedLibrarySharingSuggestionsDataSourceDelegate)delegate
{
  return (PXSharedLibrarySharingSuggestionsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharingSuggestions, 0);
  objc_storeStrong((id *)&self->_aggregateBeforeDate, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_promiseByContainer, 0);
}

uint64_t __80__PXSharedLibrarySharingSuggestionsDataSource_itemIndexesForSharingSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "px_sl_containedSharingSuggestionObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end

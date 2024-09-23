@implementation PXCNRecipientSearchDataSourceManager

- (PXCNRecipientSearchDataSourceManager)initWithVerificationType:(int64_t)a3
{
  PXCNRecipientSearchDataSourceManager *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *creationQueue;
  uint64_t v9;
  CNAutocompleteSearchManager *searchManager;
  PXSharedLibraryParticipantValidationManager *v11;
  uint64_t v12;
  void *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *searchResultsQueue;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXCNRecipientSearchDataSourceManager;
  v4 = -[PXRecipientSearchDataSourceManager init](&v17, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.PXCNRecipientSearchDataSourceManager.creationQueue", v6);
    creationQueue = v4->_creationQueue;
    v4->_creationQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13658]), "initWithAutocompleteSearchType:", 2);
    searchManager = v4->_searchManager;
    v4->_searchManager = (CNAutocompleteSearchManager *)v9;

    -[CNAutocompleteSearchManager setShouldIncludeGroupResults:](v4->_searchManager, "setShouldIncludeGroupResults:", 0);
    v4->__verificationType = a3;
    if (a3 == 1)
    {
      v11 = objc_alloc_init(PXSharedLibraryParticipantValidationManager);
      v12 = 208;
    }
    else
    {
      if (a3)
      {
LABEL_7:
        v14 = dispatch_queue_create("com.apple.PXCNRecipientSearchDataSourceManager.searchResultsQueue", v6);
        searchResultsQueue = v4->_searchResultsQueue;
        v4->_searchResultsQueue = (OS_dispatch_queue *)v14;

        -[PXCNRecipientSearchDataSourceManager _createDataSource](v4, "_createDataSource");
        return v4;
      }
      v11 = objc_alloc_init(PXIDSAddressQueryController);
      v12 = 184;
    }
    v13 = *(Class *)((char *)&v4->super.super.super.super.isa + v12);
    *(Class *)((char *)&v4->super.super.super.super.isa + v12) = (Class)v11;

    goto LABEL_7;
  }
  return v4;
}

- (void)_createDataSource
{
  PXCNRecipientSearchDataSource *v3;
  void *v4;
  PXCNRecipientSearchDataSource *v5;

  v3 = [PXCNRecipientSearchDataSource alloc];
  -[PXCNRecipientSearchDataSourceManager _searchResults](self, "_searchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXCNRecipientSearchDataSource initWithSearchResults:](v3, "initWithSearchResults:", v4);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v5, 0);
}

- (void)queryStringDidChange
{
  NSNumber *currentSearchTaskID;
  NSMutableArray *v4;
  NSMutableArray *autocompleteSearchResults;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;
  NSObject *v9;
  NSNumber *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[4];
  NSNumber *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_currentSearchTaskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
    currentSearchTaskID = self->_currentSearchTaskID;
    self->_currentSearchTaskID = 0;

    atomic_store(-[NSNumber unsignedIntegerValue](self->_currentSearchTaskID, "unsignedIntegerValue"), &self->_currentAtomicSearchTaskID);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  autocompleteSearchResults = self->_autocompleteSearchResults;
  self->_autocompleteSearchResults = v4;

  -[PXRecipientSearchDataSourceManager queryString](self, "queryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__PXCNRecipientSearchDataSourceManager_queryStringDidChange__block_invoke;
    v12[3] = &unk_1E51479C8;
    v12[4] = self;
    -[PXCNRecipientSearchDataSourceManager performChanges:](self, "performChanges:", v12);
    -[CNAutocompleteSearchManager searchForText:consumer:](self->_searchManager, "searchForText:consumer:", v6, self);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_currentSearchTaskID;
    self->_currentSearchTaskID = v7;

    atomic_store(-[NSNumber unsignedIntegerValue](self->_currentSearchTaskID, "unsignedIntegerValue"), &self->_currentAtomicSearchTaskID);
    PLSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_currentSearchTaskID;
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[auto-complete task %{public}@] started", buf, 0xCu);
    }

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PXCNRecipientSearchDataSourceManager_queryStringDidChange__block_invoke_32;
    v11[3] = &unk_1E51479C8;
    v11[4] = self;
    -[PXCNRecipientSearchDataSourceManager performChanges:](self, "performChanges:", v11);
  }

}

- (void)_setSearchResults:(id)a3
{
  NSArray **p_searchResults;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  PXCNComposeRecipient *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  PXIDSAddressQueryController *idsAddressQueryController;
  PXSharedLibraryParticipantValidationManager *cloudKitShareQueryController;
  NSObject *searchResultsQueue;
  id v26;
  void *v27;
  PXCNRecipientSearchDataSource *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SEL v38;
  void *v39;
  PXCNRecipientSearchDataSourceManager *val;
  NSArray *v41;
  id v42;
  id v43;
  NSArray *obj;
  void *v45;
  _QWORD block[5];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  void *v57;
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  p_searchResults = &self->__searchResults;
  v41 = (NSArray *)a3;
  if (*p_searchResults != v41)
  {
    v38 = a2;
    val = self;
    -[PXCNRecipientSearchDataSourceManager _searchResults](self, "_searchResults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v60 = objc_msgSend(v39, "count");
      v61 = 2048;
      v62 = -[NSArray count](v41, "count");
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[auto-complete results] set (old: %lu, new: %lu)", buf, 0x16u);
    }

    objc_storeStrong((id *)p_searchResults, a3);
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](v41, "count"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXCNRecipientSearchDataSourceManager _verificationType](val, "_verificationType");
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v41;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v53 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v12, "recipient");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[PXCNComposeRecipient initWithRecipient:]([PXCNComposeRecipient alloc], "initWithRecipient:", v13);
          -[PXRecipient suggestedTransport](v14, "suggestedTransport");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "address");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "addressKind");
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v38, val, CFSTR("PXCNRecipientSearchDataSourceManager.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestedAddress"));

          }
          switch(v17)
          {
            case 1:
              if (v8)
                v20 = v16;
              else
                v20 = (id)MEMORY[0x1A85CBC14](v16);
              v18 = v20;
              objc_msgSend(v43, "addObject:", v20);
              break;
            case 2:
              if (v8)
                v19 = v16;
              else
                v19 = (id)IDSCopyIDForPhoneNumber();
              v18 = v19;
              objc_msgSend(v42, "addObject:", v19);
              break;
            case 0:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v38, val, CFSTR("PXCNRecipientSearchDataSourceManager.m"), 197, CFSTR("Code which should be unreachable has been reached"));

              abort();
            default:
              v18 = 0;
              break;
          }
          if (objc_msgSend(v18, "length"))
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v12, v18);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v9);
    }

    v21 = MEMORY[0x1E0C809B0];
    if (v8 == 1)
    {
      objc_initWeak((id *)buf, val);
      cloudKitShareQueryController = val->_cloudKitShareQueryController;
      v48[0] = v21;
      v48[1] = 3221225472;
      v48[2] = __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke_2;
      v48[3] = &unk_1E5127EF0;
      objc_copyWeak(&v49, (id *)buf);
      -[PXSharedLibraryParticipantValidationManager requestValidationForPhoneNumbers:emailAddresses:resultHandler:](cloudKitShareQueryController, "requestValidationForPhoneNumbers:emailAddresses:resultHandler:", v42, v43, v48);
      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)buf);
    }
    else if (!v8)
    {
      objc_msgSend(v43, "arrayByAddingObjectsFromArray:", v42);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        objc_initWeak((id *)buf, val);
        idsAddressQueryController = val->_idsAddressQueryController;
        v50[0] = v21;
        v50[1] = 3221225472;
        v50[2] = __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke;
        v50[3] = &unk_1E5127EF0;
        objc_copyWeak(&v51, (id *)buf);
        -[PXIDSAddressQueryController performBatchQueryForAddresses:resultHandler:](idsAddressQueryController, "performBatchQueryForAddresses:resultHandler:", v22, v50);
        objc_destroyWeak(&v51);
        objc_destroyWeak((id *)buf);
      }

    }
    searchResultsQueue = val->_searchResultsQueue;
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke_3;
    block[3] = &unk_1E5148D08;
    block[4] = val;
    v47 = v45;
    v26 = v45;
    dispatch_sync(searchResultsQueue, block);
    -[PXSectionedDataSourceManager dataSource](val, "dataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PXCNRecipientSearchDataSource initWithSearchResults:]([PXCNRecipientSearchDataSource alloc], "initWithSearchResults:", obj);
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v39, obj, MEMORY[0x1E0C9AA60]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc((Class)off_1E50B4A18);
    v31 = objc_msgSend(v27, "identifier");
    v32 = -[PXCNRecipientSearchDataSource identifier](v28, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = &unk_1E53EB9B8;
    v57 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v30, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v31, v32, v33, v34, 0);

    -[PXSectionedDataSourceManager setDataSource:changeDetails:](val, "setDataSource:changeDetails:", v28, v35);
  }

}

- (void)_handleAddressQueryResults:(id)a3 error:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  PXCNRecipientSearchDataSource *v11;
  void *v12;
  PXCNRecipientSearchDataSource *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  PXCNRecipientSearchDataSource *v24;
  PXCNRecipientSearchDataSource *v25;
  uint8_t buf[16];
  _QWORD v27[5];
  id v28;
  void *v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke;
  v27[3] = &unk_1E5122868;
  v27[4] = self;
  v8 = v7;
  v28 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v27);

  if (objc_msgSend(v8, "count"))
  {
    PLSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Update datasource with changed results", buf, 2u);
    }

    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [PXCNRecipientSearchDataSource alloc];
    -[PXCNRecipientSearchDataSourceManager _searchResults](self, "_searchResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXCNRecipientSearchDataSource initWithSearchResults:](v11, "initWithSearchResults:", v12);

    -[PXCNRecipientSearchDataSourceManager _searchResults](self, "_searchResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCNRecipientSearchDataSourceManager _searchResults](self, "_searchResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v14, v15, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc((Class)off_1E50B4A18);
    v18 = objc_msgSend(v10, "identifier");
    v19 = -[PXCNRecipientSearchDataSource identifier](v13, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = &unk_1E53EB9B8;
    v30[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v17, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v18, v19, v20, v21, 0);

    v25 = v13;
    v23 = v22;
    v24 = v13;
    px_dispatch_on_main_queue();

  }
}

- (void)removeRecipientResult:(id)a3
{
  -[CNAutocompleteSearchManager removeRecipientResult:](self->_searchManager, "removeRecipientResult:", a3);
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSNumber *currentSearchTaskID;
  uint8_t buf[4];
  NSNumber *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_currentSearchTaskID && objc_msgSend(v7, "isEqualToNumber:"))
  {
    -[PXRecipientSearchDataSourceManager usedAddresses](self, "usedAddresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    v13 = v12;
    PXFilter();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharingGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      currentSearchTaskID = self->_currentSearchTaskID;
      *(_DWORD *)buf = 138543874;
      v18 = currentSearchTaskID;
      v19 = 2048;
      v20 = objc_msgSend(v6, "count");
      v21 = 2048;
      v22 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "[auto-complete task %{public}@] consuming %lu results, filtered to %lu", buf, 0x20u);
    }

    -[NSMutableArray addObjectsFromArray:](self->_autocompleteSearchResults, "addObjectsFromArray:", v14);
  }

}

- (void)finishedSearchingForAutocompleteResults
{
  NSObject *v3;
  NSNumber *currentSearchTaskID;
  void *v5;
  NSNumber *v6;
  NSObject *creationQueue;
  NSNumber *v8;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;
  NSNumber *v12;
  id v13;
  uint8_t buf[4];
  NSNumber *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentSearchTaskID = self->_currentSearchTaskID;
    *(_DWORD *)buf = 138543362;
    v15 = currentSearchTaskID;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[auto-complete task %{public}@] finished", buf, 0xCu);
  }

  v5 = (void *)-[NSMutableArray copy](self->_autocompleteSearchResults, "copy");
  if (objc_msgSend(v5, "count"))
  {
    v6 = self->_currentSearchTaskID;
    objc_initWeak((id *)buf, self);
    creationQueue = self->_creationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__PXCNRecipientSearchDataSourceManager_finishedSearchingForAutocompleteResults__block_invoke;
    block[3] = &unk_1E5147B18;
    objc_copyWeak(&v13, (id *)buf);
    v11 = v5;
    v12 = v6;
    v8 = v6;
    dispatch_async(creationQueue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__PXCNRecipientSearchDataSourceManager_finishedSearchingForAutocompleteResults__block_invoke_2;
    v9[3] = &unk_1E51479C8;
    v9[4] = self;
    -[PXCNRecipientSearchDataSourceManager performChanges:](self, "performChanges:", v9);
  }

}

- (void)_creationQueue_creatingRecipientSearchResultsForResults:(id)a3 forSearchTaskID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t i;
  PXCNRecipientSearchResult *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PXCNRecipientSearchDataSourceManager *v26;
  PXCNRecipientSearchDataSourceManager *val;
  id v28;
  void *v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = atomic_load(&self->_currentAtomicSearchTaskID);
  if (objc_msgSend(v7, "unsignedIntegerValue") != v9)
    goto LABEL_25;
  val = self;
  v28 = v7;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (!v11)
  {

    v7 = v28;
    v26 = self;
LABEL_24:
    objc_initWeak((id *)buf, v26);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__PXCNRecipientSearchDataSourceManager__creationQueue_creatingRecipientSearchResultsForResults_forSearchTaskID___block_invoke;
    block[3] = &unk_1E5147B18;
    objc_copyWeak(&v33, (id *)buf);
    v31 = v8;
    v32 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
    goto LABEL_25;
  }
  v12 = v11;
  v29 = v8;
  v13 = 0;
  v14 = *(_QWORD *)v35;
  LOBYTE(v15) = 1;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v35 != v14)
        objc_enumerationMutation(v10);
      if (!v15)
      {

        v7 = v28;
        v8 = v29;
        goto LABEL_25;
      }
      v17 = -[PXCNComposeRecipient initWithRecipient:]([PXCNRecipientSearchResult alloc], "initWithRecipient:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      -[PXRecipient invalidAddressString](v17, "invalidAddressString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      PLSharingGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          -[PXRecipient invalidAddressString](v17, "invalidAddressString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v39 = v21;
          _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Invalid address %@. Recipient not added to search results.", buf, 0xCu);

        }
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          -[PXRecipient suggestedTransport](v17, "suggestedTransport");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "address");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v39 = v23;
          _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "Added recipient %@ to search results.", buf, 0xCu);

        }
        objc_msgSend(v29, "addObject:", v17);
      }
      if (v13 >= 0x19)
      {
        v24 = v28;
        v25 = atomic_load(&val->_currentAtomicSearchTaskID);
        v13 = 0;
        v15 = objc_msgSend(v24, "unsignedIntegerValue") == v25;
      }
      else
      {
        ++v13;
        v15 = 1;
      }

    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v12)
      continue;
    break;
  }

  v26 = val;
  v7 = v28;
  v8 = v29;
  if (v15)
    goto LABEL_24;
LABEL_25:

}

- (void)_finishedCreatingRecipientSearchResults:(id)a3 forSearchTaskID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCNRecipientSearchDataSourceManager.m"), 341, CFSTR("%s must be called on the main thread"), "-[PXCNRecipientSearchDataSourceManager _finishedCreatingRecipientSearchResults:forSearchTaskID:]");

  }
  if (-[NSNumber isEqualToNumber:](self->_currentSearchTaskID, "isEqualToNumber:", v8))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __96__PXCNRecipientSearchDataSourceManager__finishedCreatingRecipientSearchResults_forSearchTaskID___block_invoke;
    v10[3] = &unk_1E5144868;
    v10[4] = self;
    v11 = v7;
    -[PXCNRecipientSearchDataSourceManager performChanges:](self, "performChanges:", v10);

  }
}

- (NSArray)_searchResults
{
  return self->__searchResults;
}

- (int64_t)_verificationType
{
  return self->__verificationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__searchResults, 0);
  objc_storeStrong((id *)&self->_cloudKitShareQueryController, 0);
  objc_storeStrong((id *)&self->_searchResultsByDestination, 0);
  objc_storeStrong((id *)&self->_searchResultsQueue, 0);
  objc_storeStrong((id *)&self->_idsAddressQueryController, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchResults, 0);
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_creationQueue, 0);
}

uint64_t __96__PXCNRecipientSearchDataSourceManager__finishedCreatingRecipientSearchResults_forSearchTaskID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSearchState:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "_setSearchResults:", *(_QWORD *)(a1 + 40));
}

void __112__PXCNRecipientSearchDataSourceManager__creationQueue_creatingRecipientSearchResultsForResults_forSearchTaskID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishedCreatingRecipientSearchResults:forSearchTaskID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __79__PXCNRecipientSearchDataSourceManager_finishedSearchingForAutocompleteResults__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_creationQueue_creatingRecipientSearchResultsForResults:forSearchTaskID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __79__PXCNRecipientSearchDataSourceManager_finishedSearchingForAutocompleteResults__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSearchState:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "_setSearchResults:", MEMORY[0x1E0C9AA60]);
}

uint64_t __80__PXCNRecipientSearchDataSourceManager_consumeAutocompleteSearchResults_taskID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

void __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a2;
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__45440;
  v19 = __Block_byref_object_dispose__45441;
  v20 = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 192);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke_45;
  block[3] = &unk_1E513FD98;
  v14 = &v15;
  block[4] = v7;
  v9 = v5;
  v13 = v9;
  dispatch_sync(v8, block);
  if (objc_msgSend(v6, "BOOLValue"))
    v10 = 1;
  else
    v10 = 2;
  v11 = (void *)v16[5];
  if (v11 && objc_msgSend(v11, "validationType") != v10)
  {
    objc_msgSend((id)v16[5], "setValidationType:", v10);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v16[5]);
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDataSource:changeDetails:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke_45(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 200), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleAddressQueryResults:error:", v6, v5);

}

void __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleAddressQueryResults:error:", v6, v5);

}

void __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;

}

uint64_t __60__PXCNRecipientSearchDataSourceManager_queryStringDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSearchState:", 1);
}

uint64_t __60__PXCNRecipientSearchDataSourceManager_queryStringDidChange__block_invoke_32(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSearchState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setSearchResults:", 0);
}

@end

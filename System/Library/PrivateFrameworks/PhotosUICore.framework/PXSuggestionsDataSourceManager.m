@implementation PXSuggestionsDataSourceManager

- (PXSuggestionsDataSourceManager)initWithDataSourceType:(unsigned __int16)a3 libraryFilterState:(id)a4
{
  id v7;
  PXSuggestionsDataSourceManager *v8;
  PXSuggestionsDataSourceManager *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXSuggestionsDataSourceManager;
  v8 = -[PXSectionedDataSourceManager init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_dataSourceType = a3;
    objc_storeStrong((id *)&v8->_libraryFilterState, a4);
    -[PXSuggestionsDataSourceManager _resetDataSource](v9, "_resetDataSource");
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_registerChangeObserver:", v9);

    if (v9->_dataSourceType == 2)
    {
      +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "registerChangeObserver:context:", v9, PXConfigurationObservationContext);

    }
    -[PXLibraryFilterState registerChangeObserver:context:](v9->_libraryFilterState, "registerChangeObserver:context:", v9, PXLibraryFilterStateObservationContext_34653);
  }

  return v9;
}

- (PXSuggestionsDataSourceManager)initWithFetchResult:(id)a3 libraryFilterState:(id)a4
{
  id v7;
  id v8;
  PXSuggestionsDataSourceManager *v9;
  PXSuggestionsDataSourceManager *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXSuggestionsDataSourceManager;
  v9 = -[PXSectionedDataSourceManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryFilterState, a4);
    objc_storeStrong((id *)&v10->_fetchResult, a3);
    -[PXSuggestionsDataSourceManager _resetDataSource](v10, "_resetDataSource");
    objc_msgSend(v7, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_registerChangeObserver:", v10);

    +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerChangeObserver:context:", v10, PXConfigurationObservationContext);

    -[PXLibraryFilterState registerChangeObserver:context:](v10->_libraryFilterState, "registerChangeObserver:context:", v10, PXLibraryFilterStateObservationContext_34653);
  }

  return v10;
}

- (PXSuggestionsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSuggestionsDataSourceManager.m"), 135, CFSTR("%s is not available as initializer"), "-[PXSuggestionsDataSourceManager init]");

  abort();
}

- (id)_createNewDataSourceWithFetchResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PXSuggestionsDataSource *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "baseFetchPredicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "typePredicateForDataSourceType:", -[PXSuggestionsDataSourceManager dataSourceType](self, "dataSourceType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSuggestionsDataSourceManager libraryFilterState](self, "libraryFilterState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "viewMode");
    if (v12 == 2)
      v13 = 1;
    else
      v13 = 2 * (v12 != 1);
    objc_msgSend(v8, "setSharingFilter:", v13);

    v14 = (void *)MEMORY[0x1E0CB3528];
    v23[0] = v9;
    v23[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setPredicate:", v16);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v19);

    objc_msgSend(v8, "setFetchLimit:", 12);
    objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v20 = -[PXSuggestionsDataSource initWithSuggestionsFetchResult:]([PXSuggestionsDataSource alloc], "initWithSuggestionsFetchResult:", v6);

  return v20;
}

- (void)_resetDataSource
{
  id v3;

  -[PXSuggestionsDataSourceManager _createNewDataSourceWithFetchResult:](self, "_createNewDataSourceWithFetchResult:", self->_fetchResult);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v3, 0);

}

- (id)createInitialDataSource
{
  return +[PXSectionedDataSource emptyDataSource](PXSuggestionsDataSource, "emptyDataSource");
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v7, "changeDetailsForFetchResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[PXSuggestionsDataSourceManager _handleChangeWithDetails:](self, "_handleChangeWithDetails:", v6);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXConfigurationObservationContext == a5)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  if ((void *)PXLibraryFilterStateObservationContext_34653 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSuggestionsDataSourceManager.m"), 218, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
LABEL_4:
    v11 = v9;
    -[PXSuggestionsDataSourceManager _resetDataSource](self, "_resetDataSource");
    v9 = v11;
  }
LABEL_5:

}

- (void)_handleChangeWithDetails:(id)a3
{
  id v4;
  PXSuggestionsDataSource *v5;
  void *v6;
  PXSuggestionsDataSource *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [PXSuggestionsDataSource alloc];
  objc_msgSend(v4, "fetchResultAfterChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXSuggestionsDataSource initWithSuggestionsFetchResult:](v5, "initWithSuggestionsFetchResult:", v6);

  if (objc_msgSend(v4, "hasIncrementalChanges"))
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc((Class)off_1E50B4A18);
    v11 = objc_msgSend(v8, "identifier");
    v12 = -[PXSuggestionsDataSource identifier](v7, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = &unk_1E53EB778;
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v11, v12, v13, v14, 0);

  }
  else
  {
    v15 = 0;
  }
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v7, v15);

}

- (unsigned)dataSourceType
{
  return self->_dataSourceType;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
}

+ (NSPredicate)baseFetchPredicate
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(state == %d || state == %d || state == %d) && version <= %d"), 1, 0, 3, 3);
}

+ (id)typePredicateForDataSourceType:(unsigned __int16)a3
{
  id result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0u:
      goto LABEL_8;
    case 1u:
      *(_QWORD *)&a3 = 1;
      goto LABEL_8;
    case 2u:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("featuredState == %d"), 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllFeaturedStateEnabledSuggestionTypesForWidget");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0CB3528];
      v16[0] = v5;
      v16[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "showUnsavedSyndicatedContentInFeaturedPhotos");

      if ((v10 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("subtype != %d"), 306);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3528];
        v15[0] = v8;
        v15[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v14;
      }

      goto LABEL_9;
    case 3u:
      *(_QWORD *)&a3 = 4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d"), a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      result = v8;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)mostRecentCreationDateForPXSuggestionDataSourceType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v3 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setFetchLimit:", 1);
  +[PXSuggestionsDataSourceManager baseFetchPredicate](PXSuggestionsDataSourceManager, "baseFetchPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSuggestionsDataSourceManager typePredicateForDataSourceType:](PXSuggestionsDataSourceManager, "typePredicateForDataSourceType:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v12);
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end

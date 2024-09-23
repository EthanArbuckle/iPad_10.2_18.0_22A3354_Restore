@implementation PXSmartAlbumPhotoKitQuery

- (PXSmartAlbumPhotoKitQuery)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 70, CFSTR("%s is not available as initializer"), "-[PXSmartAlbumPhotoKitQuery init]");

  abort();
}

- (id)_initWithSmartAlbum:(id)a3 collectionList:(id)a4 photoLibrary:(id)a5 query:(id)a6 editingContext:(id)a7 conditions:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PXSmartAlbumPhotoKitQuery *v19;
  PXSmartAlbumPhotoKitQuery *v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *title;
  void *v25;
  uint64_t v26;
  NSArray *conjunctionValues;
  PXSmartAlbumPhotoKitQuery *v28;
  uint64_t v29;
  NSMutableArray *conditions;
  NSString *statusString;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  _QWORD v40[4];
  PXSmartAlbumPhotoKitQuery *v41;
  objc_super v42;

  v39 = a3;
  v38 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v17)
      goto LABEL_4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  if (!v16)
    goto LABEL_13;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("editingContext"));

LABEL_4:
  if (!objc_msgSend(v18, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conditions.count"));

  }
  v42.receiver = self;
  v42.super_class = (Class)PXSmartAlbumPhotoKitQuery;
  v19 = -[PXSmartAlbumPhotoKitQuery init](&v42, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_albumToEdit, a3);
    objc_storeStrong((id *)&v20->_collectionList, a4);
    objc_storeStrong((id *)&v20->_photoLibrary, a5);
    objc_storeStrong((id *)&v20->_query, a6);
    objc_msgSend(v39, "localizedTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("PXSmartAlbumDefaultName"), CFSTR("PXSmartAlbumStrings"));
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    title = v20->_title;
    v20->_title = v23;

    PXSmartAlbumLocalizedStringsForConjunctionValues(&unk_1E53E8748);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PXLabeledValuesWithValuesAndLocalizedLabels(&unk_1E53E8748, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    conjunctionValues = v20->_conjunctionValues;
    v20->_conjunctionValues = (NSArray *)v26;

    objc_storeStrong((id *)&v20->_editingContext, a7);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __109__PXSmartAlbumPhotoKitQuery__initWithSmartAlbum_collectionList_photoLibrary_query_editingContext_conditions___block_invoke;
    v40[3] = &unk_1E5119070;
    v28 = v20;
    v41 = v28;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v40);
    v29 = objc_msgSend(v18, "mutableCopy");
    conditions = v28->_conditions;
    v28->_conditions = (NSMutableArray *)v29;

    -[PXSmartAlbumPhotoKitQuery _updateCanPersistChanges](v28, "_updateCanPersistChanges");
    statusString = v28->_statusString;
    v28->_statusString = (NSString *)&stru_1E5149688;

    -[PXSmartAlbumPhotoKitQuery _updateFetchResultCountObserver](v28, "_updateFetchResultCountObserver");
  }

  return v20;
}

- (void)setTitle:(id)a3
{
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v7 = self->_title;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSString isEqualToString:](v7, "isEqualToString:", v6);

    if (!v9)
    {
      objc_storeStrong((id *)&self->_title, a3);
      PLUIGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: title set to: \"%@\", buf, 0xCu);
      }

      -[PXSmartAlbumPhotoKitQuery _updateCanPersistChanges](self, "_updateCanPersistChanges");
    }
  }

}

- (PXLabeledValue)conjunctionValue
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[PLQuery conjunction](self->_query, "conjunction");
  -[PXSmartAlbumPhotoKitQuery conjunctionValues](self, "conjunctionValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLabeledValueForValueInLabeledValues(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXLabeledValue *)v6;
}

- (void)setConjunctionValue:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conjunctionValue"));

  }
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  if (-[PLQuery conjunction](self->_query, "conjunction") != (_DWORD)v7)
  {
    -[PLQuery setConjunction:](self->_query, "setConjunction:", v7);
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      PLStringFromPLQueryConjunction();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: conjunction value set to: \"%@\", buf, 0xCu);

    }
    -[PXSmartAlbumPhotoKitQuery _updateFetchResultCountObserver](self, "_updateFetchResultCountObserver");
  }

}

- (id)addNewConditionAfterCondition:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v8;

  v5 = -[NSMutableArray indexOfObject:](self->_conditions, "indexOfObject:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != NSNotFound"));

  }
  +[PXSmartAlbumCondition conditionWithConditionType:editingContext:](PXSmartAlbumCondition, "conditionWithConditionType:editingContext:", 4, self->_editingContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  -[NSMutableArray insertObject:atIndex:](self->_conditions, "insertObject:atIndex:", v6, v5 + 1);
  -[PXSmartAlbumPhotoKitQuery _updateQueryFromConditions](self, "_updateQueryFromConditions");
  return v6;
}

- (id)replaceCondition:(id)a3 withConditionOfType:(int64_t)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = -[NSMutableArray indexOfObject:](self->_conditions, "indexOfObject:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != NSNotFound"));

  }
  objc_msgSend(v7, "setDelegate:", 0);
  +[PXSmartAlbumCondition conditionWithConditionType:editingContext:](PXSmartAlbumCondition, "conditionWithConditionType:editingContext:", a4, self->_editingContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_conditions, "replaceObjectAtIndex:withObject:", v8, v9);
  -[PXSmartAlbumPhotoKitQuery _updateQueryFromConditions](self, "_updateQueryFromConditions");

  return v9;
}

- (void)removeCondition:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  -[NSMutableArray removeObject:](self->_conditions, "removeObject:", v4);

  -[PXSmartAlbumPhotoKitQuery _updateQueryFromConditions](self, "_updateQueryFromConditions");
}

- (void)setCanPersistChanges:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_canPersistChanges != a3)
  {
    v3 = a3;
    self->_canPersistChanges = a3;
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v7 = v6;
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: can persist changes set to: %@", (uint8_t *)&v9, 0xCu);

    }
    -[PXSmartAlbumPhotoKitQuery delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "canPersistChangesDidChangeForQuery:", self);

  }
}

- (void)persistChangesWithCompletion:(id)a3
{
  id v4;
  PHAssetCollection *albumToEdit;
  void *v6;
  PHAssetCollection *v7;
  NSString *title;
  PLQuery *query;
  id *v10;
  id v11;
  NSString *v12;
  PLQuery *v13;
  PHPhotoLibrary *photoLibrary;
  PHCollectionList *collectionList;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  albumToEdit = self->_albumToEdit;
  v6 = (void *)objc_opt_class();
  if (albumToEdit)
  {
    v7 = self->_albumToEdit;
    title = self->_title;
    query = self->_query;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__PXSmartAlbumPhotoKitQuery_persistChangesWithCompletion___block_invoke;
    v19[3] = &unk_1E5119098;
    v10 = &v20;
    v20 = v4;
    v11 = v4;
    objc_msgSend(v6, "_editSmartAlbum:title:query:completionHandler:", v7, title, query, v19);
  }
  else
  {
    v12 = self->_title;
    v13 = self->_query;
    collectionList = self->_collectionList;
    photoLibrary = self->_photoLibrary;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__PXSmartAlbumPhotoKitQuery_persistChangesWithCompletion___block_invoke_2;
    v17[3] = &unk_1E5119098;
    v10 = &v18;
    v18 = v4;
    v16 = v4;
    objc_msgSend(v6, "_createSmartAlbumWithTitle:inCollectionList:query:photoLibrary:completionHandler:", v12, collectionList, v13, photoLibrary, v17);
  }

}

- (void)setStatusString:(id)a3
{
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statusString"));

  }
  v7 = self->_statusString;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSString isEqualToString:](v7, "isEqualToString:", v6);

    if (!v9)
    {
      objc_storeStrong((id *)&self->_statusString, a3);
      PLUIGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: status string set to: \"%@\", buf, 0xCu);
      }

      -[PXSmartAlbumPhotoKitQuery delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "statusStringDidChangeForQuery:", self);

    }
  }

}

- (void)_updateCanPersistChanges
{
  id v3;

  -[PXSmartAlbumPhotoKitQuery title](self, "title");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSmartAlbumPhotoKitQuery setCanPersistChanges:](self, "setCanPersistChanges:", objc_msgSend(v3, "length") != 0);

}

- (void)_updateFetchResultCountObserver
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  PXFetchResultCountObserver *v7;
  PHPhotoLibrary *photoLibrary;
  id v9;
  PXFetchResultCountObserver *v10;
  PXFetchResultCountObserver *fetchResultCountObserver;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  -[PHPhotoLibrary photoLibrary](self->_photoLibrary, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0D71A30]);
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71A38], "predicateForQuery:inLibrary:changeDetectionCriteria:", self->_query, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v6);

  objc_msgSend(v5, "setIncludeHiddenAssets:", objc_msgSend(MEMORY[0x1E0D71A38], "includesHiddenAssetsKeyInQuery:", self->_query));
  v7 = [PXFetchResultCountObserver alloc];
  photoLibrary = self->_photoLibrary;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PXSmartAlbumPhotoKitQuery__updateFetchResultCountObserver__block_invoke;
  v14[3] = &unk_1E513C230;
  v9 = v5;
  v15 = v9;
  v10 = -[PXFetchResultCountObserver initWithQOSClass:photoLibrary:fetchResultBlock:](v7, "initWithQOSClass:photoLibrary:fetchResultBlock:", 25, photoLibrary, v14);
  fetchResultCountObserver = self->_fetchResultCountObserver;
  self->_fetchResultCountObserver = v10;

  -[PXFetchResultCountObserver setDelegate:](self->_fetchResultCountObserver, "setDelegate:", self);
  PLUIGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: updated asset count observer", v13, 2u);
  }

}

- (void)_updateQueryFromConditions
{
  NSMutableArray *conditions;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PLQuery clearSingleQueries](self->_query, "clearSingleQueries");
  conditions = self->_conditions;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PXSmartAlbumPhotoKitQuery__updateQueryFromConditions__block_invoke;
  v6[3] = &unk_1E5119070;
  v6[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](conditions, "enumerateObjectsUsingBlock:", v6);
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[PLQuery logDescription](self->_query, "logDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: updated query: %@", buf, 0xCu);

  }
  -[PXSmartAlbumPhotoKitQuery _updateStatusString](self, "_updateStatusString");
  -[PXSmartAlbumPhotoKitQuery _updateFetchResultCountObserver](self, "_updateFetchResultCountObserver");
}

- (void)_updateStatusString
{
  NSObject *v3;
  __CFString *v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  uint8_t buf[16];

  if (objc_msgSend(MEMORY[0x1E0D71A38], "includesHiddenAssetsKeyInQuery:", self->_query)
    && PLIsContentPrivacyEnabled())
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: Query contains hidden assets so clearing status string", buf, 2u);
    }

    v4 = &stru_1E5149688;
  }
  else
  {
    v5 = -[PXFetchResultCountObserver fetchResultCount](self->_fetchResultCountObserver, "fetchResultCount");
    PXLocalizedStringFromTable(CFSTR("PXSmartAlbumResultsCountString"), CFSTR("PXSmartAlbumStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    PXLocalizedStringWithValidatedFormat(v6, CFSTR("%ld"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[PXSmartAlbumPhotoKitQuery setStatusString:](self, "setStatusString:", v4, v7);

}

- (NSString)title
{
  return self->_title;
}

- (NSArray)conjunctionValues
{
  return self->_conjunctionValues;
}

- (NSArray)conditions
{
  return &self->_conditions->super;
}

- (void)setConditions:(id)a3
{
  objc_storeStrong((id *)&self->_conditions, a3);
}

- (BOOL)canPersistChanges
{
  return self->_canPersistChanges;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (PXSmartAlbumQueryDelegate)delegate
{
  return (PXSmartAlbumQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_conjunctionValue, 0);
  objc_storeStrong((id *)&self->_conjunctionValues, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fetchResultCountObserver, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_editingContext, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_albumToEdit, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

void __55__PXSmartAlbumPhotoKitQuery__updateQueryFromConditions__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "singleQuery");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addSingleQueries:", v3);

}

uint64_t __60__PXSmartAlbumPhotoKitQuery__updateFetchResultCountObserver__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__PXSmartAlbumPhotoKitQuery_persistChangesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__PXSmartAlbumPhotoKitQuery_persistChangesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __109__PXSmartAlbumPhotoKitQuery__initWithSmartAlbum_collectionList_photoLibrary_query_editingContext_conditions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

+ (id)queryWithSmartAlbum:(id)a3 collectionList:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PXSmartAlbumPhotoKitEditingContext *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (v11 || v12 && v13)
  {
    if (a6)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("albumToEdit || (collectionList && photoLibrary)"));

    if (a6)
    {
LABEL_5:
      if (v14)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  if (!v14)
  {
LABEL_6:
    objc_msgSend(v11, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__17665;
  v40 = __Block_byref_object_dispose__17666;
  v41 = 0;
  if (v11)
  {
    objc_msgSend(v11, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __83__PXSmartAlbumPhotoKitQuery_queryWithSmartAlbum_collectionList_photoLibrary_error___block_invoke;
    v33[3] = &unk_1E5148AA8;
    v34 = v11;
    v35 = &v36;
    v32 = 0;
    objc_msgSend(v15, "performChangesAndWait:error:", v33, &v32);
    v16 = v32;

    v17 = v34;
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D732A8]), "initWithConjunction:", 1);
    objc_msgSend(v17, "addIsFavoriteQuery:", 1);
    objc_msgSend(v17, "query");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v37[5];
    v37[5] = v18;

    v16 = 0;
  }

  if (v37[5])
  {
    v20 = -[PXSmartAlbumPhotoKitEditingContext initWithPhotoLibrary:]([PXSmartAlbumPhotoKitEditingContext alloc], "initWithPhotoLibrary:", v14);
    v21 = v37[5];
    v31 = 0;
    +[PXSmartAlbumCondition conditionsForQuery:editingContext:error:](PXSmartAlbumCondition, "conditionsForQuery:editingContext:error:", v21, v20, &v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v31;
    if (v22)
    {
      if (!objc_msgSend(v22, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conditions.count"));

      }
      v24 = objc_alloc((Class)a1);
      v25 = (void *)objc_msgSend(v24, "_initWithSmartAlbum:collectionList:photoLibrary:query:editingContext:conditions:", v11, v12, v14, v37[5], v20, v22);
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    PLUIGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v16;
      _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "PXSmartAlbums: Failed to get query from smart album: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXSmartAlbumErrorDomain"), -1001, v16, CFSTR("Failed to get query from smart album: underlying error"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
  }
  if (v23)
  {

    v25 = 0;
    *a6 = objc_retainAutorelease(v23);
  }

  _Block_object_dispose(&v36, 8);
  return v25;
}

+ (void)_createSmartAlbumWithTitle:(id)a3 inCollectionList:(id)a4 query:(id)a5 photoLibrary:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (objc_msgSend(v13, "length"))
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title.length"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionList"));

  if (v15)
  {
LABEL_4:
    if (v16)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    if (v17)
      goto LABEL_6;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_6;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  if (!v16)
    goto LABEL_10;
LABEL_5:
  if (!v17)
    goto LABEL_11;
LABEL_6:
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__17665;
  v40[4] = __Block_byref_object_dispose__17666;
  v41 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke;
  v34[3] = &unk_1E512B8A8;
  v19 = v13;
  v35 = v19;
  v36 = v15;
  v39 = v40;
  v37 = v16;
  v20 = v14;
  v38 = v20;
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke_2;
  v29[3] = &unk_1E5140508;
  v21 = v37;
  v30 = v21;
  v33 = v40;
  v22 = v36;
  v31 = v22;
  v23 = v17;
  v32 = v23;
  objc_msgSend(v21, "performChanges:completionHandler:", v34, v29);

  _Block_object_dispose(v40, 8);
}

+ (void)_editSmartAlbum:(id)a3 title:(id)a4 query:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("albumToEdit"));

  }
  if (objc_msgSend(v11, "assetCollectionType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("albumToEdit.assetCollectionType == PHAssetCollectionTypeSmartAlbum"));

  }
  if (objc_msgSend(v12, "length"))
  {
    if (v13)
      goto LABEL_7;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v14)
      goto LABEL_8;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSmartAlbumPhotoKitQuery.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title.length"));

  if (!v13)
    goto LABEL_10;
LABEL_7:
  if (!v14)
    goto LABEL_11;
LABEL_8:
  objc_msgSend(v11, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke;
  v30[3] = &unk_1E51457C8;
  v31 = v11;
  v32 = v12;
  v33 = v13;
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke_2;
  v26[3] = &unk_1E5146918;
  v27 = v31;
  v28 = v33;
  v29 = v14;
  v17 = v14;
  v18 = v33;
  v19 = v31;
  v20 = v12;
  objc_msgSend(v15, "performChanges:completionHandler:", v30, v26);

}

void __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD17B8], "changeRequestForSmartAlbum:", a1[4]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", a1[5]);
  objc_msgSend(v2, "setUserQuery:", a1[6]);

}

void __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke_2(id *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a1[4], "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setIncludeUserSmartAlbums:", 1);
    v9 = (void *)MEMORY[0x1E0CD13B8];
    v25[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchAssetCollectionsWithLocalIdentifiers:options:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: Edited existing smart album: %@, query: %@", buf, 0x16u);

    }
    v15 = 0;
  }
  else
  {
    PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "PXSmartAlbums: Failed to edit existing smart album: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXSmartAlbumErrorDomain"), -1001, v5, CFSTR("Failed to edit existing smart album: underlying error"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }
  v19 = v15;
  v20 = a1[6];
  v17 = v15;
  v18 = v12;
  px_dispatch_on_main_queue();

}

uint64_t __75__PXSmartAlbumPhotoKitQuery__editSmartAlbum_title_query_completionHandler___block_invoke_194(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD17B8], "creationRequestForSmartAlbumWithTitle:userQuery:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderForCreatedSmartAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 48), "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIncludeUserSmartAlbums:", 1);
  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", *(_QWORD *)(a1 + 56), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD14E8], "changeRequestForCollectionList:childCollections:", *(_QWORD *)(a1 + 56), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertChildCollections:atIndexes:", v10, v11);

}

void __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIncludeUserSmartAlbums:", 1);
    v7 = (void *)MEMORY[0x1E0CD13B8];
    v23[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAssetCollectionsWithLocalIdentifiers:options:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "logDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: Created new smart album: %@, query: %@", buf, 0x16u);

    }
    v13 = 0;
  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "PXSmartAlbums: Failed to create new smart album: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXSmartAlbumErrorDomain"), -1001, v5, CFSTR("Failed to create new smart album: underlying error"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
  }
  v17 = v13;
  v18 = *(id *)(a1 + 48);
  v15 = v13;
  v16 = v10;
  px_dispatch_on_main_queue();

}

uint64_t __110__PXSmartAlbumPhotoKitQuery__createSmartAlbumWithTitle_inCollectionList_query_photoLibrary_completionHandler___block_invoke_186(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __83__PXSmartAlbumPhotoKitQuery_queryWithSmartAlbum_collectionList_photoLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD17B8], "changeRequestForSmartAlbum:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userQuery");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end

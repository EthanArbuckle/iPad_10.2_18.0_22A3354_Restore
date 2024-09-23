@implementation PXSharedLibrarySharingSuggestionPromise

- (PXSharedLibrarySharingSuggestionPromise)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsDataSourceManager.m"), 449, CFSTR("%s is not available as initializer"), "-[PXSharedLibrarySharingSuggestionPromise init]");

  abort();
}

- (PXSharedLibrarySharingSuggestionPromise)initWithContainer:(id)a3 considerNewAfterDate:(id)a4 lightweightPlaceholder:(BOOL)a5
{
  id v9;
  id v10;
  PXSharedLibrarySharingSuggestionPromise *v11;
  PXSharedLibrarySharingSuggestionPromise *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibrarySharingSuggestionPromise;
  v11 = -[PXSharedLibrarySharingSuggestionPromise init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_container, a3);
    objc_storeStrong((id *)&v12->_considerNewAfterDate, a4);
    v12->_isPlaceholder = a5;
    -[PXSharedLibrarySharingSuggestionPromise _loadLightweightProperties](v12, "_loadLightweightProperties");
    if (!a5)
      -[PXSharedLibrarySharingSuggestionPromise _fulfill](v12, "_fulfill");
  }

  return v12;
}

- (PXSharedLibrarySharingSuggestionPromise)initWithPromise:(id)a3 considerNewAfterDate:(id)a4
{
  id v6;
  id v7;
  PXSharedLibrarySharingSuggestionPromise *v8;
  uint64_t v9;
  _PXSharedLibrarySharingSuggestionContainer *container;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  PXDisplayAsset *keyAsset;
  uint64_t v15;
  NSDate *suggestedDate;
  uint64_t v17;
  NSArray *locations;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PXSharedLibrarySharingSuggestionPromise;
  v8 = -[PXSharedLibrarySharingSuggestionPromise init](&v20, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "container");
    v9 = objc_claimAutoreleasedReturnValue();
    container = v8->_container;
    v8->_container = (_PXSharedLibrarySharingSuggestionContainer *)v9;

    objc_storeStrong((id *)&v8->_considerNewAfterDate, a4);
    v8->_isPlaceholder = objc_msgSend(v6, "isPlaceholder");
    objc_msgSend(v6, "title");
    v11 = objc_claimAutoreleasedReturnValue();
    title = v8->_title;
    v8->_title = (NSString *)v11;

    objc_msgSend(v6, "keyAsset");
    v13 = objc_claimAutoreleasedReturnValue();
    keyAsset = v8->_keyAsset;
    v8->_keyAsset = (PXDisplayAsset *)v13;

    objc_msgSend(v6, "suggestedDate");
    v15 = objc_claimAutoreleasedReturnValue();
    suggestedDate = v8->_suggestedDate;
    v8->_suggestedDate = (NSDate *)v15;

    objc_msgSend(v6, "locations");
    v17 = objc_claimAutoreleasedReturnValue();
    locations = v8->_locations;
    v8->_locations = (NSArray *)v17;

    -[PXSharedLibrarySharingSuggestionPromise _updateIsNew](v8, "_updateIsNew");
  }

  return v8;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[PXSharedLibrarySharingSuggestionPromise container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_sl_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_loadLightweightProperties
{
  NSString *v3;
  NSString *title;
  id v5;

  -[PXSharedLibrarySharingSuggestionPromise container](self, "container");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_sl_title");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v3;

}

- (void)_fulfill
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSArray *v11;
  NSArray *locations;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  PLSharedLibraryGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_DWORD *)buf = 134217984;
      v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXSharedLibrarySharingSuggestionPromise.fulfill", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  -[PXSharedLibrarySharingSuggestionPromise container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = 0;
  v16 = 0;
  objc_msgSend(v6, "px_sl_getKeyAsset:suggestedDate:locations:", &v18, &v17, &v16);
  v7 = v18;
  v8 = v18;
  v9 = v17;
  v10 = v17;
  v11 = (NSArray *)v16;
  objc_storeStrong((id *)&self->_keyAsset, v7);
  objc_storeStrong((id *)&self->_suggestedDate, v9);
  locations = self->_locations;
  self->_locations = v11;

  -[PXSharedLibrarySharingSuggestionPromise _updateIsNew](self, "_updateIsNew");
  PLSharedLibraryGetLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_make_with_pointer(v13, self);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 134217984;
      v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_END, v15, "PXSharedLibrarySharingSuggestionPromise.fulfill", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

}

- (void)_updateIsNew
{
  void *v3;
  id v4;

  -[PXSharedLibrarySharingSuggestionPromise suggestedDate](self, "suggestedDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibrarySharingSuggestionPromise considerNewAfterDate](self, "considerNewAfterDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isNew = +[PXSharedLibrarySharingSuggestionPromise isNewWithSuggestedDate:considerNewAfterDate:](PXSharedLibrarySharingSuggestionPromise, "isNewWithSuggestedDate:considerNewAfterDate:", v4, v3);

}

- (id)copyIfNeededWithUpdatedConsiderNewAfterDate:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  PXSharedLibrarySharingSuggestionPromise *v7;

  v4 = a3;
  -[PXSharedLibrarySharingSuggestionPromise suggestedDate](self, "suggestedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PXSharedLibrarySharingSuggestionPromise isNewWithSuggestedDate:considerNewAfterDate:](PXSharedLibrarySharingSuggestionPromise, "isNewWithSuggestedDate:considerNewAfterDate:", v5, v4);

  if (v6 == -[PXSharedLibrarySharingSuggestionPromise isNew](self, "isNew"))
    v7 = 0;
  else
    v7 = -[PXSharedLibrarySharingSuggestionPromise initWithPromise:considerNewAfterDate:]([PXSharedLibrarySharingSuggestionPromise alloc], "initWithPromise:considerNewAfterDate:", self, v4);

  return v7;
}

- (id)fetchAssetCollections
{
  void *v2;
  void *v3;

  -[PXSharedLibrarySharingSuggestionPromise container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_sl_fetchAssetCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PHAssetCollection)containerCollection
{
  void *v2;
  void *v3;

  -[PXSharedLibrarySharingSuggestionPromise container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_sl_containerCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHAssetCollection *)v3;
}

- (PXDisplayCollection)displayCollection
{
  void *v2;
  void *v3;

  -[PXSharedLibrarySharingSuggestionPromise container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_sl_containerCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayCollection *)v3;
}

- (void)markAsRead
{
  void *v2;
  void *v3;
  id v4;

  -[PXSharedLibrarySharingSuggestionPromise containerCollection](self, "containerCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "px_sharedLibrarySharingSuggestionsCountsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markAnyNotificationsAsRead");

}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)locations
{
  return self->_locations;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (NSDate)considerNewAfterDate
{
  return self->_considerNewAfterDate;
}

- (NSDate)suggestedDate
{
  return self->_suggestedDate;
}

- (_PXSharedLibrarySharingSuggestionContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_suggestedDate, 0);
  objc_storeStrong((id *)&self->_considerNewAfterDate, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
}

+ (BOOL)isNewWithSuggestedDate:(id)a3 considerNewAfterDate:(id)a4
{
  BOOL result;

  result = 0;
  if (a3)
  {
    if (a4)
      return objc_msgSend(a4, "compare:") == -1;
  }
  return result;
}

@end

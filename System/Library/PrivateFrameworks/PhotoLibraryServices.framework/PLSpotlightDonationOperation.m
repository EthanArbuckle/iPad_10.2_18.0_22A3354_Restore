@implementation PLSpotlightDonationOperation

- (PLSpotlightDonationOperation)initWithPhotoLibrary:(id)a3 spotlightSearchableIndex:(id)a4 searchableItems:(id)a5 bundleIdentifier:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  PLSpotlightDonationOperation *v16;
  PLSpotlightDonationOperation *v17;
  uint64_t v18;
  NSArray *searchableItems;
  uint64_t v20;
  NSString *bundleIdentifier;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightDonationOperation.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightDonationOperation.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItems"));

      if (v15)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightDonationOperation.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableIndex"));

  if (!v14)
    goto LABEL_10;
LABEL_4:
  if (v15)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightDonationOperation.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_5:
  v27.receiver = self;
  v27.super_class = (Class)PLSpotlightDonationOperation;
  v16 = -[PLSpotlightDonationOperation init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_searchableIndex, a4);
    objc_storeStrong((id *)&v17->_photoLibrary, a3);
    v18 = objc_msgSend(v14, "copy");
    searchableItems = v17->_searchableItems;
    v17->_searchableItems = (NSArray *)v18;

    v20 = objc_msgSend(v15, "copy");
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v20;

  }
  return v17;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PLSpotlightDonationOperation photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSpotlightDonationOperation searchableIndex](self, "searchableIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSpotlightDonationOperation bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSpotlightDonationOperation searchableItems](self, "searchableItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pl_map:", &__block_literal_global_3145);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSearchBackendDonationsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSpotlightDonationOperation searchableIndex](self, "searchableIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v22 = v5;
    v23 = 2112;
    v24 = v3;
    v25 = 2112;
    v26 = v9;
    v27 = 2114;
    v28 = v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Donation Operation: [Begin]. BundleIdentifier: %{public}@, PhotoLibrary: %@, Spotlight Index: %@, Items: %{public}@", buf, 0x2Au);

  }
  -[PLSpotlightDonationOperation signpostDelegate](self, "signpostDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginSignpostIntervalForOperationType:searchableItemCount:", 1, objc_msgSend(v6, "count"));
  objc_msgSend(v3, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[PLSpotlightProgressManager shouldPerformSpotlightOperationOfType:withSearchableItemIdentifiers:photoLibraryPathManager:](PLSpotlightProgressManager, "shouldPerformSpotlightOperationOfType:withSearchableItemIdentifiers:photoLibraryPathManager:", 1, v7, v11);

  if (v12)
  {
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__PLSpotlightDonationOperation_main__block_invoke_31;
    v14[3] = &unk_1E3660CD0;
    v15 = v7;
    v16 = v5;
    v17 = v3;
    objc_copyWeak(&v20, (id *)buf);
    v18 = v10;
    v19 = v6;
    objc_msgSend(v4, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v19, 0, 0, 0, v16, 0, v14);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    PLSearchBackendDonationsGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v7;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Donation Operation: [Cancelled]. ShouldPerformRequest is NO. Aborting request to donate to Spotlight for items: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v10, "endSignpostIntervalForOperationType:searchableItemCount:", 1, 0);
    -[PLSpotlightAsyncOperation setOperationState:](self, "setOperationState:", 2);
  }

}

- (CSSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (NSArray)searchableItems
{
  return self->_searchableItems;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (PLSpotlightDonationManagerSignpostDelegate)signpostDelegate
{
  return (PLSpotlightDonationManagerSignpostDelegate *)objc_loadWeakRetained((id *)&self->_signpostDelegate);
}

- (void)setSignpostDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_signpostDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_signpostDelegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_searchableItems, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

void __36__PLSpotlightDonationOperation_main__block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  id WeakRetained;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendDonationsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v21 = 134349826;
    v22 = v6;
    v23 = 2114;
    v24 = v7;
    v25 = 2114;
    v26 = v3;
    v27 = 2114;
    v28 = v8;
    v9 = "Donation Operation: [Failed]. Failed to donate %{public}lu searchable items to Spotlight for bundleIdentifier: "
         "%{public}@. Error: %{public}@. Items: %{public}@";
    v10 = v5;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 42;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v13 = objc_msgSend(*(id *)(a1 + 32), "count");
    v15 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v21 = 134349570;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    v25 = 2114;
    v26 = v15;
    v9 = "Donation Operation: [Success]. Successfully donated %{public}lu items to Spotlight for bundleIdentifier: %{publ"
         "ic}@, items: %{public}@";
    v10 = v5;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 32;
  }
  _os_log_impl(&dword_199541000, v10, v11, v9, (uint8_t *)&v21, v12);
LABEL_7:

  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "pathManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[PLSpotlightProgressManager spotlightOperationCompletedForOperationType:withSearchableIdentifiers:forPhotoLibraryPathManager:success:](PLSpotlightProgressManager, "spotlightOperationCompletedForOperationType:withSearchableIdentifiers:forPhotoLibraryPathManager:success:", 1, v16, v17, v3 == 0);

  if (!v18)
  {
    PLSearchBackendDonationsGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Donation Operation: [Error]. Failed to update progress for Spotlight donations. Progress may not be accurate on disk.", (uint8_t *)&v21, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "setOperationState:", 2);

  objc_msgSend(*(id *)(a1 + 56), "endSignpostIntervalForOperationType:searchableItemCount:", 1, objc_msgSend(*(id *)(a1 + 64), "count"));
}

uint64_t __36__PLSpotlightDonationOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

@end

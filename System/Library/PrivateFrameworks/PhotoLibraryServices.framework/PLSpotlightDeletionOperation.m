@implementation PLSpotlightDeletionOperation

- (PLSpotlightDeletionOperation)initWithPhotoLibrary:(id)a3 spotlightSearchableIndex:(id)a4 searchableItemIdentifiers:(id)a5
{
  id v10;
  id v11;
  id v12;
  PLSpotlightDeletionOperation *v13;
  PLSpotlightDeletionOperation *v14;
  uint64_t v15;
  NSArray *searchableItemIdentifiers;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightDeletionOperation.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableIndex"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightDeletionOperation.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightDeletionOperation.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItemIdentifiers"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)PLSpotlightDeletionOperation;
  v13 = -[PLSpotlightDeletionOperation init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_searchableIndex, a4);
    v15 = objc_msgSend(v12, "copy");
    searchableItemIdentifiers = v14->_searchableItemIdentifiers;
    v14->_searchableItemIdentifiers = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_photoLibrary, a3);
  }

  return v14;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PLSpotlightDeletionOperation photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSpotlightDeletionOperation searchableIndex](self, "searchableIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSpotlightDeletionOperation searchableItemIdentifiers](self, "searchableItemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLSearchBackendDonationsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSpotlightDeletionOperation searchableIndex](self, "searchableIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = v3;
    v18 = 2112;
    v19 = v7;
    v20 = 2114;
    v21 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Deletion Operation: [Begin]. PhotoLibrary: %@, Spotlight Index: %@, Items: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v3, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PLSpotlightProgressManager shouldPerformSpotlightOperationOfType:withSearchableItemIdentifiers:photoLibraryPathManager:](PLSpotlightProgressManager, "shouldPerformSpotlightOperationOfType:withSearchableItemIdentifiers:photoLibraryPathManager:", 2, v5, v8);

  if (v9)
  {
    +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36__PLSpotlightDeletionOperation_main__block_invoke;
    v12[3] = &unk_1E3664850;
    v13 = v5;
    v14 = v3;
    objc_copyWeak(&v15, (id *)buf);
    objc_msgSend(v4, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", 0, v13, 0, 0, v10, 0, v12);
    objc_destroyWeak(&v15);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    PLSearchBackendDonationsGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Deletion Operation: [Cancelled]. ShouldPerformRequest is NO. Aborting request to delete from Spotlight for items: %{public}@", buf, 0xCu);
    }

    -[PLSpotlightAsyncOperation setOperationState:](self, "setOperationState:", 2);
  }

}

- (CSSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (NSArray)searchableItemIdentifiers
{
  return self->_searchableItemIdentifiers;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

void __36__PLSpotlightDeletionOperation_main__block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  id WeakRetained;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendDonationsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v6 = objc_msgSend(a1[4], "count");
    v7 = a1[4];
    v19 = 134349570;
    v20 = v6;
    v21 = 2114;
    v22 = v3;
    v23 = 2114;
    v24 = v7;
    v8 = "Deletion Operation: [Failed]. Failed to delete %{public}lu searchable items from Spotlight. Error: %{public}@. "
         "Items: %{public}@";
    v9 = v5;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v12 = objc_msgSend(a1[4], "count");
    v13 = a1[4];
    v19 = 134349314;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    v8 = "Deletion Operation: [Success]. Successfully deleted %{public}ld items from Spotlight. Items: %{public}@";
    v9 = v5;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 22;
  }
  _os_log_impl(&dword_199541000, v9, v10, v8, (uint8_t *)&v19, v11);
LABEL_7:

  v14 = a1[4];
  objc_msgSend(a1[5], "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[PLSpotlightProgressManager spotlightOperationCompletedForOperationType:withSearchableIdentifiers:forPhotoLibraryPathManager:success:](PLSpotlightProgressManager, "spotlightOperationCompletedForOperationType:withSearchableIdentifiers:forPhotoLibraryPathManager:success:", 2, v14, v15, v3 == 0);

  if (!v16)
  {
    PLSearchBackendDonationsGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Deletion Operation: [Error]. Failed to update progress for Spotlight deletions. Progress may not be accurate on disk.", (uint8_t *)&v19, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "setOperationState:", 2);

}

@end

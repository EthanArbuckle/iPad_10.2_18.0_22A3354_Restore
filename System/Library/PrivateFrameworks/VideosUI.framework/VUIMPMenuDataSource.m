@implementation VUIMPMenuDataSource

- (void)setMediaLibrary:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
  -[VUIMPMenuDataSource _addMediaLibraryNotificationObservers](self, "_addMediaLibraryNotificationObservers");
  -[VUILibraryMenuDataSource validCategories](self, "validCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", &unk_1EA0B9580) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7)
  {
LABEL_5:
    -[VUIMPMenuDataSource setHomeShares:](self, "setHomeShares:", MEMORY[0x1E0C9AA60]);
    goto LABEL_6;
  }
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeShareMediaLibraries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMenuDataSource setHomeShares:](self, "setHomeShares:", v9);

LABEL_6:
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setHomeShares:(id)a3
{
  objc_storeStrong((id *)&self->_homeShares, a3);
}

- (VUIMPMenuDataSource)initWithValidCategories:(id)a3
{
  VUIMPMenuDataSource *v3;
  VUIMPMenuDataSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIMPMenuDataSource;
  v3 = -[VUILibraryMenuDataSource initWithValidCategories:](&v10, sel_initWithValidCategories_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_hasMediaEntitiesFetchCompleted = 0;
    -[VUIMPMenuDataSource _addRentalsUpdateNotificationObserver](v3, "_addRentalsUpdateNotificationObserver");
    -[VUIMPMenuDataSource _addAccountChangedNotificationObserver](v4, "_addAccountChangedNotificationObserver");
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aggregateMediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForCategoryType:withLibrary:", 8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMPMenuDataSource setDownloadDataSource:](v4, "setDownloadDataSource:", v7);

    -[VUIMPMenuDataSource downloadDataSource](v4, "downloadDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDownloadDelegate:", v4);

    -[VUIMPMenuDataSource setHasDownloadDataSourceFetchCompleted:](v4, "setHasDownloadDataSourceFetchCompleted:", 0);
  }
  return v4;
}

- (void)setHasDownloadDataSourceFetchCompleted:(BOOL)a3
{
  self->_hasDownloadDataSourceFetchCompleted = a3;
}

- (void)setDownloadDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDataSource, a3);
}

- (VUIDownloadDataSource)downloadDataSource
{
  return self->_downloadDataSource;
}

- (void)_addRentalsUpdateNotificationObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateRentalShelf, CFSTR("VUIRentalExpirationMonitorRentalDidExpireNotification"), 0);

}

- (void)_addMediaLibraryNotificationObservers
{
  void *v3;
  void *v4;

  -[VUIMPMenuDataSource _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[VUIMPMenuDataSource _addNotificationObserversWithDeviceLibrary:](self, "_addNotificationObserversWithDeviceLibrary:", v3);
    v3 = v4;
  }

}

- (id)_deviceMediaLibrary
{
  void *v2;
  id v3;

  -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)_addNotificationObserversWithDeviceLibrary:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__homeShareMediaLibrariesDidChange_, CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeNotification"), 0);
  -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__mediaLibraryContentDidChange_, CFSTR("VUIMediaLibraryContentsDidChangeNotification"), v4);

}

- (void)_addAccountChangedNotificationObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accountsChanged_, CFSTR("VUIAuthenticationManagerAccountStoreDidChangeNotification"), 0);

}

void __81__VUIMPMenuDataSource__categoryTypesWithMediaEntitiesMap_categoryTypeComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __54__VUIMPMenuDataSource__notifyDelegateFetchDidComplete__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "dataSourceDidFinishFetching:", WeakRetained);

}

void __34__VUIMPMenuDataSource__loadGenres__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t v25;
  _BYTE v26[15];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collections");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    v7 = *MEMORY[0x1E0CC1D70];
    v8 = *MEMORY[0x1E0CC1D78];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "valueForProperty:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "length"))
        {
          objc_msgSend(v20, "addObject:", v12);
          objc_msgSend(v10, "valueForProperty:", v8);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
            v15 = VUILibraryGenreFromGenreID(-[NSObject integerValue](v13, "integerValue"));
          else
            v15 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v16);

        }
        else
        {
          VUIDefaultLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            __34__VUIMPMenuDataSource__loadGenres__block_invoke_cold_1(&v25, v26, v14);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__VUIMPMenuDataSource__loadGenres__block_invoke_45;
  block[3] = &unk_1E9F99000;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  v22 = v20;
  v23 = v2;
  v17 = v2;
  v18 = v20;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v24);
}

- (void)startFetch
{
  void *v3;
  _BOOL4 v4;
  VUILibraryFamilyMembersDataSource *v5;
  void *v6;
  id v7;

  if (!-[VUILibraryDataSource hasCompletedInitialFetch](self, "hasCompletedInitialFetch"))
  {
    -[VUIMPMenuDataSource _loadInitialMediaEntityShelves](self, "_loadInitialMediaEntityShelves");
    -[VUIMPMenuDataSource downloadDataSource](self, "downloadDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadDownloadData");

    -[VUILibraryMenuDataSource validCategories](self, "validCategories");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", &unk_1EA0B9598))
    {
      v4 = +[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount");

      if (!v4)
        return;
      v5 = objc_alloc_init(VUILibraryFamilyMembersDataSource);
      -[VUIMPMenuDataSource setFamilyDataSource:](self, "setFamilyDataSource:", v5);

      -[VUIMPMenuDataSource familyDataSource](self, "familyDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDelegate:", self);

      -[VUIMPMenuDataSource familyDataSource](self, "familyDataSource");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startFetch");
    }

  }
}

- (void)setMediaEntitiesFetchController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntitiesFetchController, a3);
}

- (void)setMediaEntitiesByCategoryType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntitiesByCategoryType, a3);
}

- (void)setHasMediaEntitiesFetchCompleted:(BOOL)a3
{
  self->_hasMediaEntitiesFetchCompleted = a3;
}

- (void)setGenreTypes:(id)a3
{
  objc_storeStrong((id *)&self->_genreTypes, a3);
}

- (void)setGenreTitles:(id)a3
{
  objc_storeStrong((id *)&self->_genreTitles, a3);
}

- (void)setFamilyDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_familyDataSource, a3);
}

- (void)setCategoryTypes:(id)a3
{
  objc_storeStrong((id *)&self->_categoryTypes, a3);
}

- (void)setCategoryTypeByFetchRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_categoryTypeByFetchRequestIdentifier, a3);
}

- (VUIMediaEntitiesFetchController)mediaEntitiesFetchController
{
  return self->_mediaEntitiesFetchController;
}

- (NSArray)homeShares
{
  return self->_homeShares;
}

- (BOOL)hasMediaEntitiesFetchCompleted
{
  return self->_hasMediaEntitiesFetchCompleted;
}

- (VUILibraryFamilyMembersDataSource)familyDataSource
{
  return self->_familyDataSource;
}

- (void)downloadManager:(id)a3 downloadedFetchDidFinishWithEntities:(id)a4
{
  if (-[VUIMPMenuDataSource hasMediaEntitiesFetchCompleted](self, "hasMediaEntitiesFetchCompleted", a3, a4))
  {
    -[VUIMPMenuDataSource _addOrRemoveDownloadCategoryIfNeeded](self, "_addOrRemoveDownloadCategoryIfNeeded");
    -[VUIMPMenuDataSource setHasDownloadDataSourceFetchCompleted:](self, "setHasDownloadDataSourceFetchCompleted:", 1);
    if (-[VUIMPMenuDataSource _allFetchesHaveCompleted](self, "_allFetchesHaveCompleted"))
      -[VUIMPMenuDataSource _notifyDelegateFetchDidComplete](self, "_notifyDelegateFetchDidComplete");
  }
  else
  {
    -[VUIMPMenuDataSource setHasDownloadDataSourceFetchCompleted:](self, "setHasDownloadDataSourceFetchCompleted:", 1);
  }
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  if (-[VUIMPMenuDataSource hasMediaEntitiesFetchCompleted](self, "hasMediaEntitiesFetchCompleted", a3))
  {
    -[VUIMPMenuDataSource _addOrRemoveFamilySharingCategoryIfNeeded](self, "_addOrRemoveFamilySharingCategoryIfNeeded");
    if (-[VUIMPMenuDataSource _allFetchesHaveCompleted](self, "_allFetchesHaveCompleted"))
      -[VUIMPMenuDataSource _notifyDelegateFetchDidComplete](self, "_notifyDelegateFetchDidComplete");
  }
}

- (void)controller:(id)a3 fetchRequests:(id)a4 didCompleteWithResult:(id)a5
{
  VUIMediaEntitiesFetchController *v8;
  id v9;
  NSDictionary *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSDictionary *v26;
  void *v27;
  NSDictionary *v28;
  void *v29;
  void *v30;
  NSDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 hasDownloadDataSourceFetchCompleted;
  _BOOL4 hasMediaEntitiesFetchCompleted;
  id v38;
  VUIMediaEntitiesFetchController *v39;
  NSDictionary *v40;
  char v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  _BOOL4 v45;
  __int16 v46;
  _BOOL4 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = (VUIMediaEntitiesFetchController *)a3;
  v43 = a4;
  v9 = a5;
  v10 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "fetchResponses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (self->_rentalsUpdateFetchController == v8)
  {
    if (v12)
    {
      objc_msgSend(v12, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "mediaEntities");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = 0;
    }
    v28 = self->_mediaEntitiesByCategoryType;

    if (objc_msgSend(v30, "count"))
    {
      v31 = v28;
      v32 = v30;
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0C9AA60];
      v31 = v28;
    }
    -[NSDictionary setObject:forKey:](v31, "setObject:forKey:", v32, &unk_1EA0B95C8);

  }
  else
  {
    if (self->_mediaEntitiesFetchController != v8)
      goto LABEL_29;
    if (objc_msgSend(v12, "count"))
    {
      v39 = v8;
      v40 = v10;
      v42 = v11;
      v38 = v9;
      v41 = 0;
      v14 = 0;
      do
      {
        objc_msgSend(v43, "objectAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "options");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "vui_BOOLForKey:defaultValue:", CFSTR("CheckHasItems"), 0);
        objc_msgSend(v13, "objectAtIndex:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMPMenuDataSource categoryTypeByFetchRequestIdentifier](self, "categoryTypeByFetchRequestIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v18, "mediaEntities");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v17)
          {
            v24 = objc_msgSend(v18, "hasDataForCheckHasItemsOption");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:forKey:", v25, v21);

            v41 = 1;
          }
          else
          {
            if (v22)
            {
              v26 = v40;
              v27 = v23;
            }
            else
            {
              v26 = v40;
              v27 = (void *)MEMORY[0x1E0C9AA60];
            }
            -[NSDictionary setObject:forKey:](v26, "setObject:forKey:", v27, v21);
          }

        }
        ++v14;
      }
      while (v14 < objc_msgSend(v13, "count"));
      if ((v41 & 1) != 0)
      {
        -[VUIMPMenuDataSource _categoryTypesSortComparator](self, "_categoryTypesSortComparator");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v42;
        -[VUIMPMenuDataSource _categoryTypesWithOptimizedMenuDataMap:categoryTypeComparator:](self, "_categoryTypesWithOptimizedMenuDataMap:categoryTypeComparator:", v42, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v38;
        v8 = v39;
        v10 = v40;
        goto LABEL_24;
      }
      v8 = v39;
      v28 = v40;
      v9 = v38;
      v11 = v42;
    }
    else
    {
      v28 = v10;
    }
  }
  -[VUIMPMenuDataSource _categoryTypesSortComparator](self, "_categoryTypesSortComparator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMenuDataSource _categoryTypesWithMediaEntitiesMap:categoryTypeComparator:](self, "_categoryTypesWithMediaEntitiesMap:categoryTypeComparator:", v28, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
LABEL_24:

  -[VUIMPMenuDataSource _populateViewModelFromMeidaLibraryCategoryTypes:](self, "_populateViewModelFromMeidaLibraryCategoryTypes:", v34);
  -[VUIMPMenuDataSource setMediaEntitiesByCategoryType:](self, "setMediaEntitiesByCategoryType:", v10);
  -[VUIMPMenuDataSource setHasMediaEntitiesFetchCompleted:](self, "setHasMediaEntitiesFetchCompleted:", 1);
  VUIDefaultLogObject();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    hasDownloadDataSourceFetchCompleted = self->_hasDownloadDataSourceFetchCompleted;
    hasMediaEntitiesFetchCompleted = self->_hasMediaEntitiesFetchCompleted;
    *(_DWORD *)buf = 67109376;
    v45 = hasDownloadDataSourceFetchCompleted;
    v46 = 1024;
    v47 = hasMediaEntitiesFetchCompleted;
    _os_log_impl(&dword_1D96EE000, v35, OS_LOG_TYPE_DEFAULT, "+++ VUIMPMenuDataSource should notify up _hasMediaEntitiesFetchCompleted %d, %d", buf, 0xEu);
  }

  if (self->_hasDownloadDataSourceFetchCompleted
    && -[VUIMPMenuDataSource _allFetchesHaveCompleted](self, "_allFetchesHaveCompleted"))
  {
    -[VUIMPMenuDataSource _notifyDelegateFetchDidComplete](self, "_notifyDelegateFetchDidComplete");
  }
LABEL_29:

}

- (NSArray)categoryTypes
{
  return self->_categoryTypes;
}

- (NSDictionary)categoryTypeByFetchRequestIdentifier
{
  return self->_categoryTypeByFetchRequestIdentifier;
}

- (void)_updateFetchRequest:(id)a3 isInitialFetch:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v4 && v6 == 1)
    objc_msgSend(v7, "addHasItemsOption");

}

- (void)_populateViewModelFromMeidaLibraryCategoryTypes:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadDataSource downloadEntities](self->_downloadDataSource, "downloadEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v13, "containsObject:", &unk_1EA0B95B0);

    if ((v5 & 1) == 0)
      objc_msgSend(v13, "addObject:", &unk_1EA0B95B0);
  }
  else
  {

  }
  -[VUIMPMenuDataSource homeShares](self, "homeShares");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    objc_msgSend(v13, "addObject:", &unk_1EA0B9580);
  -[VUIMPMenuDataSource familyDataSource](self, "familyDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "familyMembers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_msgSend(v13, "containsObject:", &unk_1EA0B9598);

    if ((v10 & 1) == 0)
      objc_msgSend(v13, "addObject:", &unk_1EA0B9598);
  }
  else
  {

  }
  v11 = (void *)objc_msgSend(v13, "copy");
  -[VUIMPMenuDataSource setCategoryTypes:](self, "setCategoryTypes:", v11);

  -[VUIMPMenuDataSource _constructCategoryList](self, "_constructCategoryList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryMenuDataSource setMenuItems:](self, "setMenuItems:", v12);

}

- (void)_notifyDelegateFetchDidComplete
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  -[VUILibraryDataSource setHasCompletedInitialFetch:](self, "setHasCompletedInitialFetch:", 1);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __54__VUIMPMenuDataSource__notifyDelegateFetchDidComplete__block_invoke;
  v7 = &unk_1E9F99C98;
  objc_copyWeak(&v8, &location);
  v3 = &v4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v4, v5))
    v6((uint64_t)v3);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_loadMediaEntityShelvesWithInitialFetch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  VUIMediaEntitiesFetchController *v8;
  void *v9;
  VUIMediaEntitiesFetchController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  -[VUIMPMenuDataSource _fetchRequestsWithMediaLibrary:categoryTypeMap:isInitialFetch:](self, "_fetchRequestsWithMediaLibrary:categoryTypeMap:isInitialFetch:", v5, &v15, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  -[VUIMPMenuDataSource setCategoryTypeByFetchRequestIdentifier:](self, "setCategoryTypeByFetchRequestIdentifier:", v7);
  v8 = [VUIMediaEntitiesFetchController alloc];
  -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIMediaEntitiesFetchController initWithMediaLibrary:fetchRequests:](v8, "initWithMediaLibrary:fetchRequests:", v9, v6);
  -[VUIMPMenuDataSource setMediaEntitiesFetchController:](self, "setMediaEntitiesFetchController:", v10);

  -[VUIMPMenuDataSource mediaEntitiesFetchController](self, "mediaEntitiesFetchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[VUIMPMenuDataSource _loadGenres](self, "_loadGenres");
  -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:](VUIMediaLibraryFetchControllerQueue, "defaultQueueWithMediaLibrary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMenuDataSource mediaEntitiesFetchController](self, "mediaEntitiesFetchController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addFetchController:", v14);

}

- (void)_loadInitialMediaEntityShelves
{
  -[VUIMPMenuDataSource _loadMediaEntityShelvesWithInitialFetch:](self, "_loadMediaEntityShelvesWithInitialFetch:", 1);
}

- (void)_loadGenres
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_11(&dword_1D96EE000, a1, a3, "VUIMPMenuDataSource - no MPMediaLibrary", v3);
}

- (id)_fetchRequestsWithMediaLibrary:(id)a3 categoryTypeMap:(id *)a4 isInitialFetch:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  VUIMediaEntityFetchRequest *v16;
  void *v17;
  id v18;
  _BOOL8 v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  VUIMediaEntityFetchRequest *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[2];

  v5 = a5;
  v56[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VUILibraryMenuDataSource validCategories](self, "validCategories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", &unk_1EA0B95C8);

  if (v12 && !objc_msgSend(v8, "type"))
  {
    +[VUIMediaEntityFetchRequest movieRentalsFetchRequest](VUIMediaEntityFetchRequest, "movieRentalsFetchRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rentalExpirationDate"), 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v51, "initWithObjects:", v52, 0);

    objc_msgSend(v13, "setSortDescriptors:", v53);
    -[VUIMPMenuDataSource _updateFetchRequest:isInitialFetch:](self, "_updateFetchRequest:isInitialFetch:", v13, v5);
    objc_msgSend(v9, "addObject:", v13);
    objc_msgSend(v13, "identifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", &unk_1EA0B95C8, v54);

  }
  else
  {
    v13 = 0;
  }
  -[VUILibraryMenuDataSource validCategories](self, "validCategories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", &unk_1EA0B95E0);

  if (v15)
  {
    v16 = [VUIMediaEntityFetchRequest alloc];
    v17 = (void *)MEMORY[0x1E0C99E60];
    +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
    v55 = v9;
    v18 = v10;
    v19 = v5;
    v20 = a4;
    v21 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType show](VUIMediaEntityType, "show");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObjects:", v22, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[VUIMediaEntityFetchRequest initWithMediaEntityTypes:](v16, "initWithMediaEntityTypes:", v24);

    v8 = v21;
    a4 = v20;
    v5 = v19;
    v10 = v18;
    v9 = v55;
    VUIMediaEntityFetchRequestMinimalPropertiesSet();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityFetchRequest setProperties:](v25, "setProperties:", v26);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityFetchRequest setSortDescriptors:](v25, "setSortDescriptors:", v28);

    -[VUIMediaEntityFetchRequest addRecentlyAddedSortDescriptorWithLimit:](v25, "addRecentlyAddedSortDescriptorWithLimit:", 25);
    v29 = (void *)MEMORY[0x1E0CB3880];
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v29, "vui_predicateWithSubpredicates:type:", v30, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityFetchRequest setPredicate:](v25, "setPredicate:", v31);

    -[VUIMPMenuDataSource _updateFetchRequest:isInitialFetch:](self, "_updateFetchRequest:isInitialFetch:", v25, v5);
    objc_msgSend(v55, "addObject:", v25);
    -[VUIMediaEntityFetchRequest identifier](v25, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", &unk_1EA0B95E0, v32);

    v13 = v25;
  }
  -[VUILibraryMenuDataSource validCategories](self, "validCategories");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "containsObject:", &unk_1EA0B95F8);

  if (v34)
  {
    +[VUIMediaEntityFetchRequest homeVideosFetchRequest](VUIMediaEntityFetchRequest, "homeVideosFetchRequest");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIMPMenuDataSource _updateFetchRequest:isInitialFetch:](self, "_updateFetchRequest:isInitialFetch:", v35, v5);
    objc_msgSend(v9, "addObject:", v35);
    objc_msgSend(v35, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", &unk_1EA0B95F8, v36);

    v13 = v35;
  }
  -[VUILibraryMenuDataSource validCategories](self, "validCategories");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "containsObject:", &unk_1EA0B9610);

  if (v38)
  {
    +[VUIMediaEntityFetchRequest showsFetchRequest](VUIMediaEntityFetchRequest, "showsFetchRequest");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIMPMenuDataSource _updateFetchRequest:isInitialFetch:](self, "_updateFetchRequest:isInitialFetch:", v39, v5);
    objc_msgSend(v9, "addObject:", v39);
    objc_msgSend(v39, "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", &unk_1EA0B9610, v40);

    v13 = v39;
  }
  -[VUILibraryMenuDataSource validCategories](self, "validCategories");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "containsObject:", &unk_1EA0B9628);

  if (v42)
  {
    +[VUIMediaEntityFetchRequest moviesFetchRequest](VUIMediaEntityFetchRequest, "moviesFetchRequest");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIMPMenuDataSource _updateFetchRequest:isInitialFetch:](self, "_updateFetchRequest:isInitialFetch:", v43, v5);
    objc_msgSend(v9, "addObject:", v43);
    objc_msgSend(v43, "identifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", &unk_1EA0B9628, v44);

    v13 = v43;
  }
  -[VUILibraryMenuDataSource validCategories](self, "validCategories");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "containsObject:", &unk_1EA0B9640);

  if (v46 && SSDeviceIsHDRCapable())
  {
    +[VUIMediaEntityFetchRequest moviesFetchRequest](VUIMediaEntityFetchRequest, "moviesFetchRequest");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "addHDRColorCapabilityOr4KResolutionPredicate");
    -[VUIMPMenuDataSource _updateFetchRequest:isInitialFetch:](self, "_updateFetchRequest:isInitialFetch:", v47, v5);
    objc_msgSend(v9, "addObject:", v47);
    objc_msgSend(v47, "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", &unk_1EA0B9640, v48);

    v13 = v47;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v10);
  v49 = (void *)objc_msgSend(v9, "copy");

  return v49;
}

- (id)_constructCategoryList
{
  NSArray *v3;
  NSArray *v4;
  VUIMenuDataSource *v5;
  void *v6;
  void *v7;
  VUIMenuDataSource *v8;
  void *v9;

  v3 = self->_genreTitles;
  v4 = self->_genreTypes;
  if (!self->_genreTitles)
  {

    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  if (!self->_genreTypes)
  {

    v4 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  v5 = [VUIMenuDataSource alloc];
  -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)-[NSArray copy](v3, "copy");
  v8 = -[VUIMenuDataSource initWithMainMenuItems:genreMenuItems:](v5, "initWithMainMenuItems:genreMenuItems:", v6, v7);

  v9 = (void *)-[NSArray copy](v4, "copy");
  -[VUIMenuDataSource setGenreTypes:](v8, "setGenreTypes:", v9);

  return v8;
}

- (id)_categoryTypesWithMediaEntitiesMap:(id)a3 categoryTypeComparator:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__VUIMPMenuDataSource__categoryTypesWithMediaEntitiesMap_categoryTypeComparator___block_invoke;
  v12[3] = &unk_1E9F9DE88;
  v9 = v8;
  v13 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  if (v5)
    objc_msgSend(v9, "sortUsingComparator:", v5);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (id)_categoryTypesSortComparator
{
  return &__block_literal_global_63;
}

- (BOOL)_allFetchesHaveCompleted
{
  return self->_hasMediaEntitiesFetchCompleted && self->_hasDownloadDataSourceFetchCompleted;
}

- (BOOL)_addOrRemoveFamilySharingCategoryIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (self->_hasMediaEntitiesFetchCompleted)
  {
    -[VUIMPMenuDataSource familyDataSource](self, "familyDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "familyMembers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", &unk_1EA0B9598);

    if (v5)
    {
      if ((v7 & 1) == 0)
      {
        v8 = (void *)MEMORY[0x1E0C99DE8];
        -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrayWithArray:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "addObject:", &unk_1EA0B9598);
        -[VUIMPMenuDataSource _categoryTypesSortComparator](self, "_categoryTypesSortComparator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sortUsingComparator:", v11);

LABEL_7:
        v14 = (void *)objc_msgSend(v10, "copy");
        -[VUIMPMenuDataSource setCategoryTypes:](self, "setCategoryTypes:", v14);

        -[VUIMPMenuDataSource _constructCategoryList](self, "_constructCategoryList");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUILibraryMenuDataSource setMenuItems:](self, "setMenuItems:", v15);

        return 1;
      }
    }
    else if (v7)
    {
      v12 = (void *)MEMORY[0x1E0C99DE8];
      -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayWithArray:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "removeObject:", &unk_1EA0B9598);
      goto LABEL_7;
    }
  }
  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  -[VUIMPMenuDataSource mediaEntitiesFetchController](self, "mediaEntitiesFetchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:](VUIMediaLibraryFetchControllerQueue, "defaultQueueWithMediaLibrary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMPMenuDataSource mediaEntitiesFetchController](self, "mediaEntitiesFetchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFetchController:", v6);

    -[VUIMediaEntitiesFetchController setDelegate:](self->_mediaEntitiesFetchController, "setDelegate:", 0);
  }
  -[VUIMPMenuDataSource rentalsUpdateFetchController](self, "rentalsUpdateFetchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:](VUIMediaLibraryFetchControllerQueue, "defaultQueueWithMediaLibrary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMPMenuDataSource rentalsUpdateFetchController](self, "rentalsUpdateFetchController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFetchController:", v10);

    -[VUIMediaEntitiesFetchController setDelegate:](self->_rentalsUpdateFetchController, "setDelegate:", 0);
  }
  -[VUIMPMenuDataSource _removeMediaLibraryNotificationObservers](self, "_removeMediaLibraryNotificationObservers");
  -[VUIMPMenuDataSource _removeRentalsUpdateNotificationObserver](self, "_removeRentalsUpdateNotificationObserver");
  -[VUIMPMenuDataSource _removeAccountChangedNotificationObserver](self, "_removeAccountChangedNotificationObserver");
  -[VUIMPMenuDataSource downloadDataSource](self, "downloadDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", 0);

  v12.receiver = self;
  v12.super_class = (Class)VUIMPMenuDataSource;
  -[VUIMPMenuDataSource dealloc](&v12, sel_dealloc);
}

- (void)refetch
{
  void *v3;
  _BOOL4 v4;
  VUILibraryFamilyMembersDataSource *v5;
  void *v6;
  id v7;

  -[VUIMPMenuDataSource setHasMediaEntitiesFetchCompleted:](self, "setHasMediaEntitiesFetchCompleted:", 0);
  -[VUIMPMenuDataSource _refetchMediaEntityShelves](self, "_refetchMediaEntityShelves");
  -[VUIMPMenuDataSource downloadDataSource](self, "downloadDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadDownloadData");

  -[VUILibraryMenuDataSource validCategories](self, "validCategories");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", &unk_1EA0B9598))
  {
    v4 = +[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount");

    if (!v4)
      return;
    v5 = objc_alloc_init(VUILibraryFamilyMembersDataSource);
    -[VUIMPMenuDataSource setFamilyDataSource:](self, "setFamilyDataSource:", v5);

    -[VUIMPMenuDataSource familyDataSource](self, "familyDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    -[VUIMPMenuDataSource familyDataSource](self, "familyDataSource");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startFetch");
  }

}

- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4
{
  if (-[VUIMPMenuDataSource hasMediaEntitiesFetchCompleted](self, "hasMediaEntitiesFetchCompleted", a3, a4))
  {
    -[VUIMPMenuDataSource _addOrRemoveDownloadCategoryIfNeeded](self, "_addOrRemoveDownloadCategoryIfNeeded");
    -[VUIMPMenuDataSource setHasDownloadDataSourceFetchCompleted:](self, "setHasDownloadDataSourceFetchCompleted:", 1);
    if (-[VUIMPMenuDataSource _allFetchesHaveCompleted](self, "_allFetchesHaveCompleted"))
      -[VUIMPMenuDataSource _notifyDelegateFetchDidComplete](self, "_notifyDelegateFetchDidComplete");
  }
  else
  {
    -[VUIMPMenuDataSource setHasDownloadDataSourceFetchCompleted:](self, "setHasDownloadDataSourceFetchCompleted:", 1);
  }
}

- (BOOL)_addOrRemoveDownloadCategoryIfNeeded
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;

  if (!self->_hasMediaEntitiesFetchCompleted)
    return 0;
  -[VUIMPMenuDataSource downloadDataSource](self, "downloadDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "count");

  if (!v6)
  {
    -[VUIMPMenuDataSource mediaEntitiesByCategoryType](self, "mediaEntitiesByCategoryType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", &unk_1EA0B95B0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[VUIMPMenuDataSource mediaEntitiesByCategoryType](self, "mediaEntitiesByCategoryType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", &unk_1EA0B95B0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "count"))
      {

        v9 = 0;
LABEL_15:

        return v9;
      }
    }
    -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", &unk_1EA0B95B0);

    if (v11)
    {

      if ((v16 & 1) == 0)
        return 0;
    }
    else
    {

      if (!v16)
        return 0;
    }
    v17 = (void *)MEMORY[0x1E0C99DE8];
    -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithArray:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "removeObject:", &unk_1EA0B95B0);
LABEL_14:
    v19 = (void *)objc_msgSend(v10, "copy");
    -[VUIMPMenuDataSource setCategoryTypes:](self, "setCategoryTypes:", v19);

    -[VUIMPMenuDataSource _constructCategoryList](self, "_constructCategoryList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryMenuDataSource setMenuItems:](self, "setMenuItems:", v11);
    v9 = 1;
    goto LABEL_15;
  }
  -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", &unk_1EA0B95B0);

  if ((v8 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0C99DE8];
    -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithArray:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", &unk_1EA0B95B0);
    -[VUIMPMenuDataSource _categoryTypesSortComparator](self, "_categoryTypesSortComparator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortUsingComparator:", v14);

    goto LABEL_14;
  }
  return 0;
}

- (void)controller:(id)a3 fetchRequests:(id)a4 didFailWithError:(id)a5
{
  VUIMediaEntitiesFetchController *v8;
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v8 = (VUIMediaEntitiesFetchController *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_mediaEntitiesFetchController == v8 || self->_rentalsUpdateFetchController == v8)
  {
    -[VUIMPMenuDataSource setHasMediaEntitiesFetchCompleted:](self, "setHasMediaEntitiesFetchCompleted:", 1);
    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __65__VUIMPMenuDataSource_controller_fetchRequests_didFailWithError___block_invoke;
    v15 = &unk_1E9F99C98;
    objc_copyWeak(&v16, &location);
    v11 = &v12;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v12, v13))
      v14((uint64_t)v11);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __65__VUIMPMenuDataSource_controller_fetchRequests_didFailWithError___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "dataSourceDidFinishFetching:", WeakRetained);

}

- (void)_removeMediaLibraryNotificationObservers
{
  void *v3;
  void *v4;

  -[VUIMPMenuDataSource _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[VUIMPMenuDataSource _removeNotificationObserversWithDeviceLibrary:](self, "_removeNotificationObserversWithDeviceLibrary:", v3);
    v3 = v4;
  }

}

- (void)_removeNotificationObserversWithDeviceLibrary:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeNotification"), 0);

}

- (void)_removeRentalsUpdateNotificationObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("VUIRentalExpirationMonitorRentalDidExpireNotification"), 0);

}

- (void)_removeAccountChangedNotificationObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DAF710], 0);

}

- (void)_homeShareMediaLibrariesDidChange:(id)a3
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyMediaLibraries"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyChangeSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUIMPMenuDataSource hasMediaEntitiesFetchCompleted](self, "hasMediaEntitiesFetchCompleted"))
  {
    -[VUIMPMenuDataSource homeShares](self, "homeShares");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vui_arrayByApplyingChangeSet:destinationObjects:", v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") && !objc_msgSend(v8, "count"))
    {
      v23 = v8;
      v24 = v6;
      v14 = (void *)objc_opt_new();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v20, "intValue", v23, v24) != 9)
              objc_msgSend(v14, "addObject:", v20);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v17);
      }

      v21 = (void *)objc_msgSend(v14, "copy");
      -[VUIMPMenuDataSource setCategoryTypes:](self, "setCategoryTypes:", v21);

      -[VUIMPMenuDataSource _constructCategoryList](self, "_constructCategoryList");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMenuDataSource setMenuItems:](self, "setMenuItems:", v22);

      if (-[VUIMPMenuDataSource _allFetchesHaveCompleted](self, "_allFetchesHaveCompleted"))
        -[VUIMPMenuDataSource _notifyDelegateFetchDidComplete](self, "_notifyDelegateFetchDidComplete");

      v8 = v23;
      v6 = v24;
    }
    else if (!objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
    {
      v9 = (void *)MEMORY[0x1E0C99DE8];
      -[VUIMPMenuDataSource categoryTypes](self, "categoryTypes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addObject:", &unk_1EA0B9580);
      v12 = (void *)objc_msgSend(v11, "copy");
      -[VUIMPMenuDataSource setCategoryTypes:](self, "setCategoryTypes:", v12);

      -[VUIMPMenuDataSource _constructCategoryList](self, "_constructCategoryList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMenuDataSource setMenuItems:](self, "setMenuItems:", v13);

      if (-[VUIMPMenuDataSource _allFetchesHaveCompleted](self, "_allFetchesHaveCompleted"))
        -[VUIMPMenuDataSource _notifyDelegateFetchDidComplete](self, "_notifyDelegateFetchDidComplete");

    }
    -[VUIMPMenuDataSource setHomeShares:](self, "setHomeShares:", v8, v23, v24);

  }
  else
  {
    -[VUIMPMenuDataSource setHomeShares:](self, "setHomeShares:", v5);
  }

}

- (void)_mediaLibraryContentDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIMPMenuDataSource:: mediaLibrary %@ ContentDidChange", (uint8_t *)&v9, 0xCu);

    }
    -[VUIMPMenuDataSource _loadGenres](self, "_loadGenres");
  }
}

- (void)_refetchMediaEntityShelves
{
  -[VUIMPMenuDataSource _loadMediaEntityShelvesWithInitialFetch:](self, "_loadMediaEntityShelvesWithInitialFetch:", 0);
}

void __34__VUIMPMenuDataSource__loadGenres__block_invoke_45(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setGenreTitles:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setGenreTypes:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "_allFetchesHaveCompleted"))
  {
    objc_msgSend(WeakRetained, "_constructCategoryList");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setMenuItems:", v2);

    objc_msgSend(WeakRetained, "_notifyDelegateFetchDidComplete");
  }

}

- (id)_categoryTypesWithOptimizedMenuDataMap:(id)a3 categoryTypeComparator:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__VUIMPMenuDataSource__categoryTypesWithOptimizedMenuDataMap_categoryTypeComparator___block_invoke;
  v12[3] = &unk_1E9F9DEB0;
  v9 = v8;
  v13 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  if (v5)
    objc_msgSend(v9, "sortUsingComparator:", v5);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

void __85__VUIMPMenuDataSource__categoryTypesWithOptimizedMenuDataMap_categoryTypeComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

uint64_t __51__VUIMPMenuDataSource__categoryTypesSortComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_updateRentalShelf
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VUIMediaEntitiesFetchController *v10;
  void *v11;
  void *v12;
  VUIMediaEntitiesFetchController *v13;
  VUIMediaEntitiesFetchController *rentalsUpdateFetchController;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  +[VUIMediaEntityFetchRequest movieRentalsFetchRequest](VUIMediaEntityFetchRequest, "movieRentalsFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rentalExpirationDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, 0);

  objc_msgSend(v3, "setSortDescriptors:", v6);
  v7 = (void *)-[NSDictionary mutableCopy](self->_categoryTypeByFetchRequestIdentifier, "mutableCopy");
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", &unk_1EA0B95C8, v8);

  v9 = (void *)objc_msgSend(v7, "copy");
  -[VUIMPMenuDataSource setCategoryTypeByFetchRequestIdentifier:](self, "setCategoryTypeByFetchRequestIdentifier:", v9);

  v10 = [VUIMediaEntitiesFetchController alloc];
  -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VUIMediaEntitiesFetchController initWithMediaLibrary:fetchRequests:](v10, "initWithMediaLibrary:fetchRequests:", v11, v12);
  rentalsUpdateFetchController = self->_rentalsUpdateFetchController;
  self->_rentalsUpdateFetchController = v13;

  -[VUIMediaEntitiesFetchController setDelegate:](self->_rentalsUpdateFetchController, "setDelegate:", self);
  -[VUIMPMenuDataSource mediaLibrary](self, "mediaLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:](VUIMediaLibraryFetchControllerQueue, "defaultQueueWithMediaLibrary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addFetchController:", self->_rentalsUpdateFetchController);

}

- (void)_accountsChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  VUILibraryFamilyMembersDataSource *v7;
  void *v8;
  id v9;

  v4 = MEMORY[0x1E0C9AA60];
  -[VUIMPMenuDataSource setGenreTitles:](self, "setGenreTitles:", MEMORY[0x1E0C9AA60]);
  -[VUIMPMenuDataSource setGenreTypes:](self, "setGenreTypes:", v4);
  -[VUIMPMenuDataSource setCategoryTypes:](self, "setCategoryTypes:", v4);
  -[VUILibraryMenuDataSource validCategories](self, "validCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", &unk_1EA0B9598);

  if (v6)
  {
    if (+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
    {
      v7 = objc_alloc_init(VUILibraryFamilyMembersDataSource);
      -[VUIMPMenuDataSource setFamilyDataSource:](self, "setFamilyDataSource:", v7);

      -[VUIMPMenuDataSource familyDataSource](self, "familyDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", self);

      -[VUIMPMenuDataSource familyDataSource](self, "familyDataSource");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startFetch");

    }
    else
    {
      -[VUIMPMenuDataSource setFamilyDataSource:](self, "setFamilyDataSource:", 0);
      -[VUIMPMenuDataSource _addOrRemoveFamilySharingCategoryIfNeeded](self, "_addOrRemoveFamilySharingCategoryIfNeeded");
      if (-[VUIMPMenuDataSource _allFetchesHaveCompleted](self, "_allFetchesHaveCompleted"))
        -[VUIMPMenuDataSource _notifyDelegateFetchDidComplete](self, "_notifyDelegateFetchDidComplete");
    }
  }
}

- (NSDictionary)mediaEntitiesByCategoryType
{
  return self->_mediaEntitiesByCategoryType;
}

- (NSArray)genreTitles
{
  return self->_genreTitles;
}

- (NSArray)genreTypes
{
  return self->_genreTypes;
}

- (VUIMediaEntitiesFetchController)rentalsUpdateFetchController
{
  return self->_rentalsUpdateFetchController;
}

- (void)setRentalsUpdateFetchController:(id)a3
{
  objc_storeStrong((id *)&self->_rentalsUpdateFetchController, a3);
}

- (BOOL)hasDownloadDataSourceFetchCompleted
{
  return self->_hasDownloadDataSourceFetchCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadDataSource, 0);
  objc_storeStrong((id *)&self->_familyDataSource, 0);
  objc_storeStrong((id *)&self->_rentalsUpdateFetchController, 0);
  objc_storeStrong((id *)&self->_genreTypes, 0);
  objc_storeStrong((id *)&self->_genreTitles, 0);
  objc_storeStrong((id *)&self->_mediaEntitiesByCategoryType, 0);
  objc_storeStrong((id *)&self->_categoryTypes, 0);
  objc_storeStrong((id *)&self->_categoryTypeByFetchRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaEntitiesFetchController, 0);
  objc_storeStrong((id *)&self->_homeShares, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

void __34__VUIMPMenuDataSource__loadGenres__block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_11(&dword_1D96EE000, a3, (uint64_t)a3, "VUIMPMenuDataSource - missing genre title", a1);
}

@end

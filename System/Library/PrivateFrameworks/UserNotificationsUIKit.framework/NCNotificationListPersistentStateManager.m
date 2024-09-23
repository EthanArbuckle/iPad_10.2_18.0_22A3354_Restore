@implementation NCNotificationListPersistentStateManager

- (void)setFileWritingThrottled:(BOOL)a3
{
  self->_fileWritingThrottled = a3;
}

void __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke(id *a1)
{
  id WeakRetained;
  _QWORD v3[5];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke_2;
  v3[3] = &unk_1E8D1ECA8;
  v3[4] = WeakRetained;
  v4 = a1[4];
  v5 = a1[5];
  objc_msgSend(WeakRetained, "_readPersistentStateFromFileIfNecessaryWithCompletion:", v3);

}

- (void)_readPersistentStateFromFileIfNecessaryWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[NCNotificationListPersistentStateManager hasLoadedStoredPersistentState](self, "hasLoadedStoredPersistentState"))-[NCNotificationListPersistentStateManager _readPersistentStateFromFile](self, "_readPersistentStateFromFile");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, BOOL))v5 + 2))(v5, -[NCNotificationListPersistentStateManager hasLoadedStoredPersistentState](self, "hasLoadedStoredPersistentState"));
    v4 = v5;
  }

}

- (BOOL)hasLoadedStoredPersistentState
{
  return self->_loadedStoredPersistentState;
}

void __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke_2(uint64_t a1, int a2)
{
  int v3;
  uint64_t v4;
  id v5;
  id v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedListRepresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = UNCCatchMe();
    v4 = 48;
    if (v3)
      v4 = 40;
    v5 = *(id *)(a1 + v4);
    if ((objc_msgSend(*(id *)(a1 + 32), "_isListRepresentation:equalToListRepresentation:", v6, v5) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCachedListRepresentation:", v5);
      objc_msgSend(*(id *)(a1 + 32), "_throttledWriteFileListRepresentation:vendorListRepresentation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }

  }
}

- (void)setCachedListRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_cachedListRepresentation, a3);
}

- (BOOL)isFileWritingThrottled
{
  return self->_fileWritingThrottled;
}

- (NSDictionary)cachedListRepresentation
{
  return self->_cachedListRepresentation;
}

- (BOOL)_isListRepresentation:(id)a3 equalToListRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("3.list.sections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("3.list.sections"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationListPersistentStateManager _isRepresentationForSections:equalToRepresentationForSections:](self, "_isRepresentationForSections:equalToRepresentationForSections:", v8, v9))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("4.list.migrationTimes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("4.list.migrationTimes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NCNotificationListPersistentStateManager _isRepresentationForMigrationTimes:equalToRepresentationForMigrationTimes:](self, "_isRepresentationForMigrationTimes:equalToRepresentationForMigrationTimes:", v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isRepresentationForMigrationTimes:(id)a3 equalToRepresentationForMigrationTimes:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "objectForKey:", CFSTR("0.migrationTime.upcoming"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("0.migrationTime.upcoming"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", v10))
    goto LABEL_5;
  objc_msgSend(v7, "objectForKey:", CFSTR("1.migrationTime.summary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("1.migrationTime.summary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_5;
  objc_msgSend(v7, "objectForKey:", CFSTR("2.migrationTime.requests"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("2.migrationTime.requests"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToDictionary:", v15);

  if (v16)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("3.migrationTime.migratedTimeSensitiveNotificationRequests"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("3.migrationTime.migratedTimeSensitiveNotificationRequests"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToDictionary:", v18);

  }
  else
  {
LABEL_5:
    v19 = 0;
  }

  return v19;
}

- (void)updatePersistentStateForNotificationList:(id)a3 sectionLists:(id)a4 listCache:(id)a5 migrationScheduler:(id)a6 listInfo:(id)a7 detailed:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *queue;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id location;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  LOWORD(v24) = 1;
  -[NCNotificationListPersistentStateManager _listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:](self, "_listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:", v14, v15, v16, v17, v18, v8, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (UNCCatchMe())
  {
    LOWORD(v25) = 256;
    -[NCNotificationListPersistentStateManager _listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:](self, "_listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:", v14, v15, v16, v17, v18, v8, v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  -[NCNotificationListPersistentStateManager setCurrentStateRepresentation:](self, "setCurrentStateRepresentation:", v19);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke;
  block[3] = &unk_1E8D1CD30;
  objc_copyWeak(&v29, &location);
  v27 = v20;
  v28 = v19;
  v22 = v19;
  v23 = v20;
  dispatch_async(queue, block);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (NSMutableDictionary)storedPersistentStateRepresentation
{
  return self->_storedPersistentStateRepresentation;
}

- (NSMutableDictionary)storedPersistentMigrationTimes
{
  return self->_storedPersistentMigrationTimes;
}

- (id)_representationForMigrationScheduler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "upcomingScheduledMigrationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("0.migrationTime.upcoming"));

  }
  objc_msgSend(v4, "migrationDateForNotificationDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("1.migrationTime.summary"));

  }
  objc_msgSend(v4, "migrationDatesForNotificationRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[NCNotificationListPersistentStateManager _representationForRequestMigrationTimes:](self, "_representationForRequestMigrationTimes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("2.migrationTime.requests"));

  }
  objc_msgSend(v4, "migratedTimeSensitiveNotificationRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    -[NCNotificationListPersistentStateManager _representationForMigratedTimeSensitiveNotificationRequests:](self, "_representationForMigratedTimeSensitiveNotificationRequests:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("3.migrationTime.migratedTimeSensitiveNotificationRequests"));

  }
  return v5;
}

- (BOOL)_isRepresentationForSections:(id)a3 equalToRepresentationForSections:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = objc_msgSend(v8, "count");
  if (v10 == objc_msgSend(v9, "count"))
  {
    v11 = objc_msgSend(v8, "count");
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndex:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[NCNotificationListPersistentStateManager _isRepresentationForSection:equalToRepresentationForSection:](self, "_isRepresentationForSection:equalToRepresentationForSection:", v15, v16);

        if (!v17)
          break;
        v14 = v12 <= ++v13;
      }
      while (v12 != v13);
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_writePersistentStateToFileWithRepresentation:(id)a3
{
  NSObject *queue;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v4 = a3;
  dispatch_assert_queue_V2(queue);
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v14;
  objc_msgSend((id)objc_opt_class(), "_persistentStateFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "writeToFile:atomically:", v7, 1);

  v9 = (void *)*MEMORY[0x1E0DC5F90];
  v10 = *MEMORY[0x1E0DC5F90];
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NCNotificationListPersistentStateManager _writePersistentStateToFileWithRepresentation:].cold.2(v9);
  }
  else if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v9;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully wrote notification list persistent state to file", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[NCNotificationListPersistentStateManager _writePersistentStateToFileWithRepresentation:].cold.1(v9);
  }

}

+ (id)_persistentStateFilePath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_dataDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("NotificationListPersistentState.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_dataDirectoryPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.springboard")) & 1) == 0)
  {
    objc_msgSend(CFSTR("~/Library/UserNotificationsUI/"), "stringByExpandingTildeInPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(CFSTR("~/Library/UserNotificationsUI/"), "stringByExpandingTildeInPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NCNotificationListPersistentStateManager)initWithDelegate:(id)a3
{
  id v4;
  NCNotificationListPersistentStateManager *v5;
  NCNotificationListPersistentStateManager *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSDateFormatter *v10;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v12;
  void *v13;
  NSObject *v14;
  NCNotificationListPersistentStateManager *v15;
  NCSummaryServiceGateway *v16;
  NCSummaryServiceGateway *gateway;
  _QWORD block[4];
  NCNotificationListPersistentStateManager *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NCNotificationListPersistentStateManager;
  v5 = -[NCNotificationListPersistentStateManager init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.UserNotificationsUI.NCNotificationListPersistentStateManager", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v6->_dateFormatter;
    v6->_dateFormatter = v10;

    v12 = v6->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v12, "setLocale:", v13);

    -[NSDateFormatter setDateStyle:](v6->_dateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v6->_dateFormatter, "setTimeStyle:", 3);
    *(_WORD *)&v6->_loadedStoredPersistentState = 0;
    v6->_storedCurrentDigestMigrationTimeExpired = 0;
    v14 = v6->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__NCNotificationListPersistentStateManager_initWithDelegate___block_invoke;
    block[3] = &unk_1E8D1B568;
    v15 = v6;
    v20 = v15;
    dispatch_async(v14, block);
    if (UNCCatchMe())
    {
      v16 = objc_alloc_init(NCSummaryServiceGateway);
      gateway = v15->_gateway;
      v15->_gateway = v16;

    }
    v15->_startTime = CFAbsoluteTimeGetCurrent();

  }
  return v6;
}

uint64_t __61__NCNotificationListPersistentStateManager_initWithDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readPersistentStateFromFile");
}

- (void)updatePersistentStateWithListDictionary:(id)a3 secureListDictionary:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __105__NCNotificationListPersistentStateManager_updatePersistentStateWithListDictionary_secureListDictionary___block_invoke;
  v11[3] = &unk_1E8D1CD30;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __105__NCNotificationListPersistentStateManager_updatePersistentStateWithListDictionary_secureListDictionary___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __105__NCNotificationListPersistentStateManager_updatePersistentStateWithListDictionary_secureListDictionary___block_invoke_2;
    v4[3] = &unk_1E8D1ECA8;
    v4[4] = WeakRetained;
    v5 = a1[4];
    v6 = a1[5];
    objc_msgSend(v3, "_readPersistentStateFromFileIfNecessaryWithCompletion:", v4);

  }
}

void __105__NCNotificationListPersistentStateManager_updatePersistentStateWithListDictionary_secureListDictionary___block_invoke_2(uint64_t a1, int a2)
{
  id v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedListRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(id *)(a1 + 40);
    if ((objc_msgSend(*(id *)(a1 + 32), "_isListRepresentation:equalToListRepresentation:", v4, v3) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCachedListRepresentation:", v3);
      objc_msgSend(*(id *)(a1 + 32), "_throttledWriteFileListRepresentation:vendorListRepresentation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }

  }
}

- (id)stateRepresentationForNotificationList:(id)a3 sectionLists:(id)a4 listCache:(id)a5 migrationScheduler:(id)a6 listInfo:(id)a7 detailed:(BOOL)a8
{
  uint64_t v9;

  LOWORD(v9) = 1;
  return -[NCNotificationListPersistentStateManager _listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:](self, "_listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:", a3, a4, a5, a6, a7, a8, v9);
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_storedPersistentStateRepresentation)
  {
    -[NCNotificationListPersistentStateManager _clearStoredListRepresentationForSectionIdentifier:](self, "_clearStoredListRepresentationForSectionIdentifier:", v4);
    v4 = v5;
  }
  if (self->_storedPersistentMigrationTimes)
  {
    -[NCNotificationListPersistentStateManager _clearStoredRequestMigrationTimesForSectionIdentifier:](self, "_clearStoredRequestMigrationTimesForSectionIdentifier:", v5);
    v4 = v5;
  }
  if (self->_storedPersistentMigratedTimeSensitiveNotificationRequests)
  {
    -[NCNotificationListPersistentStateManager _clearStoredMigratedTimeSensitiveNotificationRequestsForSectionIdentifier:](self, "_clearStoredMigratedTimeSensitiveNotificationRequestsForSectionIdentifier:", v5);
    v4 = v5;
  }

}

- (BOOL)_getSectionFromPersistentStateRepresentation:(id)a3 request:(id)a4 section:(unint64_t *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a3)
  {
    objc_msgSend(a3, "objectForKey:", CFSTR("3.list.sections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NCNotificationListPersistentStateManager _getSectionTypeAndRemoveNotificationRequest:inMutableRepresentationForSections:](self, "_getSectionTypeAndRemoveNotificationRequest:inMutableRepresentationForSections:", v8, v9);
    *a5 = v10;
    if (v10 == 4
      && -[NCNotificationListPersistentStateManager hasStoredCurrentDigestMigrationTimeExpired](self, "hasStoredCurrentDigestMigrationTimeExpired"))
    {
      v11 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "notificationIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "un_logDigest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", self->_storedPersistentSummaryMigrationTime);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v14;
        v21 = 2114;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ moving request %{public}@ to read digest from current digest because the stored digest migration time [%@] has already expired!", (uint8_t *)&v19, 0x20u);

      }
      *a5 = 6;
    }

  }
  return a3 != 0;
}

- (unint64_t)sectionForStoredNotificationRequest:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  _QWORD v31[5];
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NCNotificationListPersistentStateManager _getSectionFromPersistentStateRepresentation:request:section:](self, "_getSectionFromPersistentStateRepresentation:request:section:", self->_storedPersistentStateRepresentation, v4, &v36))
  {
    v5 = v36 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = 1;
  }
  if (v5)
    -[NCNotificationListPersistentStateManager _getSectionFromPersistentStateRepresentation:request:section:](self, "_getSectionFromPersistentStateRepresentation:request:section:", self->_currentStateRepresentation, v4, &v36);
  if (self->_storedPersistentMigrationTimes)
  {
    -[NCNotificationListPersistentStateManager _getStoredMigrationTimeAndClearNotificationRequest:](self, "_getStoredMigrationTimeAndClearNotificationRequest:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (unint64_t)(v36 - 1) <= 1)
    {
      objc_msgSend(v6, "timeIntervalSinceNow");
      if (v8 <= 0.0)
      {
        if (v36 == 2)
        {
          v16 = (void *)*MEMORY[0x1E0DC5F90];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "notificationIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "un_logDigest");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v7);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v19;
            v39 = 2114;
            v40 = v21;
            v41 = 2112;
            v42 = v22;
            _os_log_impl(&dword_1CFC3D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ moving request %{public}@ to history from incoming because its stored migration time [%@] has already expired!", buf, 0x20u);

          }
          v36 = 0;
        }
        else if (v36 == 1)
        {
          v9 = (void *)*MEMORY[0x1E0DC5F90];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
          {
            v10 = v9;
            v11 = (objc_class *)objc_opt_class();
            NSStringFromClass(v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "notificationIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "un_logDigest");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v7);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v12;
            v39 = 2114;
            v40 = v14;
            v41 = 2112;
            v42 = v15;
            _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ moving request %{public}@ to incoming from prominent incoming because its stored migration time [%@] has already expired!", buf, 0x20u);

          }
          v36 = 2;
        }
      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __80__NCNotificationListPersistentStateManager_sectionForStoredNotificationRequest___block_invoke;
        block[3] = &unk_1E8D1D8C0;
        block[4] = self;
        v34 = v7;
        v35 = v4;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }

  }
  if (self->_storedPersistentMigratedTimeSensitiveNotificationRequests
    && -[NCNotificationListPersistentStateManager _isMigratedTimeSensitiveNotificationRequest:](self, "_isMigratedTimeSensitiveNotificationRequest:", v4))
  {
    v23 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "un_logDigest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v26;
      v39 = 2112;
      v40 = v28;
      _os_log_impl(&dword_1CFC3D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ found migrated time sensitive notification request for record %@.", buf, 0x16u);

    }
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __80__NCNotificationListPersistentStateManager_sectionForStoredNotificationRequest___block_invoke_5;
    v31[3] = &unk_1E8D1B3A0;
    v31[4] = self;
    v32 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v31);

  }
  v29 = v36;

  return v29;
}

void __80__NCNotificationListPersistentStateManager_sectionForStoredNotificationRequest___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStateManager:didFetchMigrationTime:forNotificationRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __80__NCNotificationListPersistentStateManager_sectionForStoredNotificationRequest___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStateManager:didMigratedTimeSensitiveForNotificationRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_ensureDataDirectoryExists
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "_dataDirectoryPath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", v3) & 1) == 0)
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

}

- (BOOL)_doesPersistentStateFileExist
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend((id)objc_opt_class(), "_persistentStateFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  return v4;
}

- (void)_throttledWriteFileListRepresentation:(id)a3 vendorListRepresentation:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__NCNotificationListPersistentStateManager__throttledWriteFileListRepresentation_vendorListRepresentation___block_invoke;
  block[3] = &unk_1E8D1D8C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __107__NCNotificationListPersistentStateManager__throttledWriteFileListRepresentation_vendorListRepresentation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCachedListRepresentationForThrottledWriteToFile:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCachedListRepresentationForThrottledSendToVendor:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleListRepresentationPersistence");
}

- (void)_scheduleListRepresentationPersistence
{
  int64_t v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  dispatch_time_t v8;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  id location;

  if (!-[NCNotificationListPersistentStateManager isFileWritingThrottled](self, "isFileWritingThrottled"))
  {
    v3 = 500000000;
    -[NCNotificationListPersistentStateManager setFileWritingThrottled:](self, "setFileWritingThrottled:", 1);
    if (UNCCatchMe())
    {
      v4 = self->_startTime + 10.0;
      v5 = v4 - CFAbsoluteTimeGetCurrent();
      v6 = v5 <= 0.5 || v5 <= 0.0;
      v7 = v5 * 1000000000.0;
      if (!v6)
        v3 = (uint64_t)v7;
    }
    objc_initWeak(&location, self);
    v8 = dispatch_time(0, v3);
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__NCNotificationListPersistentStateManager__scheduleListRepresentationPersistence__block_invoke;
    v10[3] = &unk_1E8D1B278;
    objc_copyWeak(&v11, &location);
    dispatch_after(v8, queue, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __82__NCNotificationListPersistentStateManager__scheduleListRepresentationPersistence__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFileWritingThrottled:", 0);
  objc_msgSend(WeakRetained, "_persistCachedRepresentations");

}

- (void)_persistCachedRepresentations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NCNotificationListPersistentStateManager cachedListRepresentationForThrottledWriteToFile](self, "cachedListRepresentationForThrottledWriteToFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NCNotificationListPersistentStateManager cachedListRepresentationForThrottledWriteToFile](self, "cachedListRepresentationForThrottledWriteToFile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListPersistentStateManager _writePersistentStateToFileWithRepresentation:](self, "_writePersistentStateToFileWithRepresentation:", v4);

  }
  -[NCNotificationListPersistentStateManager cachedListRepresentationForThrottledSendToVendor](self, "cachedListRepresentationForThrottledSendToVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NCNotificationListPersistentStateManager cachedListRepresentationForThrottledSendToVendor](self, "cachedListRepresentationForThrottledSendToVendor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListPersistentStateManager _sendPersistentStateToVendor:](self, "_sendPersistentStateToVendor:", v6);

  }
}

- (void)_sendPersistentStateToVendor:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSObject *v15;
  NCSummaryServiceGateway *gateway;
  void *v17;
  NSArray *v18;
  NSArray *lastSectionsSentToGateway;
  uint8_t v20[16];

  v4 = a3;
  v5 = UNCCatchMe();
  if (v4 && v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("3.list.sections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (objc_msgSend(v8, "count"))
    {
      v9 = objc_msgSend(v8, "count");
      if (v9 - 1 >= 0)
      {
        v10 = v9;
        do
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", --v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("0.section.type"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && (unint64_t)(NCNotificationListSectionTypeFromString(v12) - 4) <= 5)
            objc_msgSend(v8, "removeObjectAtIndex:", v10);

        }
        while (v10 > 0);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("3.list.sections"));
    }
    if (v8 && (v14 = self->_lastSectionsSentToGateway) != 0 && -[NSArray isEqualToArray:](v14, "isEqualToArray:", v8))
    {
      v15 = *MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1CFC3D000, v15, OS_LOG_TYPE_DEFAULT, "Not notifying the gateway because sections are the same", v20, 2u);
      }
    }
    else
    {
      gateway = self->_gateway;
      v17 = (void *)objc_msgSend(v6, "copy");
      -[NCSummaryServiceGateway donateStateDump:](gateway, "donateStateDump:", v17);

      v18 = (NSArray *)objc_msgSend(v8, "copy");
      lastSectionsSentToGateway = self->_lastSectionsSentToGateway;
      self->_lastSectionsSentToGateway = v18;

    }
  }

}

- (void)_readPersistentStateFromFile
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_4(&dword_1CFC3D000, v4, v5, "%{public}@ persistent state file does not exist! Nothing to read", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_1();
}

uint64_t __72__NCNotificationListPersistentStateManager__readPersistentStateFromFile__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishOnReadForStoredPersistentStateRepresentation:", *(_QWORD *)(a1 + 40));
}

- (void)_publishOnReadForStoredPersistentStateRepresentation:(id)a3
{
  void *v4;
  NSDate *v5;
  NSDate *storedPersistentSummaryMigrationTime;
  double v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NCNotificationListPersistentStateManager *v15;

  v12 = a3;
  -[NCNotificationListPersistentStateManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListPersistentStateManager _summaryMigrationTimeInRepresentationForList:](self, "_summaryMigrationTimeInRepresentationForList:", v12);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  storedPersistentSummaryMigrationTime = self->_storedPersistentSummaryMigrationTime;
  self->_storedPersistentSummaryMigrationTime = v5;

  if (self->_storedPersistentSummaryMigrationTime)
  {
    objc_msgSend(v4, "persistentStateManager:didFetchSummaryMigrationTime:", self);
    -[NSDate timeIntervalSinceNow](self->_storedPersistentSummaryMigrationTime, "timeIntervalSinceNow");
    self->_storedCurrentDigestMigrationTimeExpired = v7 < 0.0;
  }
  -[NCNotificationListPersistentStateManager storedPersistentStateRepresentation](self, "storedPersistentStateRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("3.list.sections"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__NCNotificationListPersistentStateManager__publishOnReadForStoredPersistentStateRepresentation___block_invoke;
  v13[3] = &unk_1E8D1ECD0;
  v10 = v4;
  v14 = v10;
  v15 = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
  objc_msgSend(v12, "objectForKey:", CFSTR("7.list.infoStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v10, "persistentStateManager:didFetchStoredListInfo:", self, v11);

}

void __97__NCNotificationListPersistentStateManager__publishOnReadForStoredPersistentStateRepresentation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("0.section.type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "persistentStateManager:hasStoredDataForSectionType:", *(_QWORD *)(a1 + 40), NCNotificationListSectionTypeFromString(v3));
    v3 = v4;
  }

}

- (id)_listRepresentationForNotificationList:(id)a3 sections:(id)a4 listCache:(id)a5 migrationScheduler:(id)a6 listInfo:(id)a7 detailed:(BOOL)a8 hashIdentifiers:(BOOL)a9 includeHistory:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  NSDateFormatter *dateFormatter;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  id v44;
  _BOOL4 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v45 = a8;
  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v44 = a5;
  v17 = a6;
  v18 = a7;
  v19 = v16;
  v20 = v19;
  if (a10)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v15, "notificationSections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    v20 = v19;
    if (v22)
    {
      v23 = v22;
      v43 = v15;
      v24 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          if (!objc_msgSend(v26, "sectionType"))
          {
            objc_msgSend(v19, "arrayByAddingObject:", v26);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v23)
          continue;
        break;
      }
      v20 = v19;
LABEL_12:
      v15 = v43;
    }

  }
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v27, "setObject:forKey:", &unk_1E8D5FAA0, CFSTR("0.list.formatVersion"));
  dateFormatter = self->_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", v30, CFSTR("0.list.stateTimestamp"));

  -[NCNotificationListPersistentStateManager _representationForSections:detailed:hashIdentifiers:](self, "_representationForSections:detailed:hashIdentifiers:", v20, v45, a9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", v31, CFSTR("3.list.sections"));

  -[NCNotificationListPersistentStateManager storedPersistentStateRepresentation](self, "storedPersistentStateRepresentation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[NCNotificationListPersistentStateManager storedPersistentStateRepresentation](self, "storedPersistentStateRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListPersistentStateManager _mutableRepresentationForStoredListRepresentation:](self, "_mutableRepresentationForStoredListRepresentation:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      objc_msgSend(v27, "setObject:forKey:", v34, CFSTR("5.list.pendingStore"));

  }
  if (v17)
  {
    -[NCNotificationListPersistentStateManager _representationForMigrationScheduler:](self, "_representationForMigrationScheduler:", v17);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35 && objc_msgSend(v35, "count"))
      objc_msgSend(v27, "setObject:forKey:", v36, CFSTR("4.list.migrationTimes"));

  }
  -[NCNotificationListPersistentStateManager storedPersistentMigrationTimes](self, "storedPersistentMigrationTimes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[NCNotificationListPersistentStateManager storedPersistentMigrationTimes](self, "storedPersistentMigrationTimes");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListPersistentStateManager _mutableRepresentationForRepresentationForRequestMigrationTimes:](self, "_mutableRepresentationForRepresentationForRequestMigrationTimes:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
      objc_msgSend(v27, "setObject:forKey:", v39, CFSTR("6.list.pendingMigrationTimes"));

  }
  if (v18 && objc_msgSend(v18, "count"))
    objc_msgSend(v27, "setObject:forKey:", v18, CFSTR("7.list.infoStore"));
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "totalNotificationCount"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v40, CFSTR("1.list.totalNotificationCount"));

    if (v44)
    {
      -[NCNotificationListPersistentStateManager _representationForListCache:](self, "_representationForListCache:", v44);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v41, CFSTR("2.list.cacheState"));

    }
  }

  return v27;
}

- (int)_formatVersionForListRepresentation:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("0.list.formatVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = -1;

  return v5;
}

- (id)_mutableRepresentationForStoredListRepresentation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  NCNotificationListPersistentStateManager *v18;
  id v19;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "objectForKey:", CFSTR("3.list.sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __94__NCNotificationListPersistentStateManager__mutableRepresentationForStoredListRepresentation___block_invoke;
  v17 = &unk_1E8D1ECF8;
  v18 = self;
  v19 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v14);
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("3.list.sections"), v14, v15, v16, v17, v18);
  objc_msgSend(v5, "objectForKey:", CFSTR("5.list.pendingStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationListPersistentStateManager _mergePendingNotificationListRepresentation:withMutableListRepresentation:](self, "_mergePendingNotificationListRepresentation:withMutableListRepresentation:", v10, v6);
  if (objc_msgSend(v9, "count"))
    v11 = v6;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

void __94__NCNotificationListPersistentStateManager__mutableRepresentationForStoredListRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_mutableRepresentationForRepresentationForSection:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (void)_mergePendingNotificationListRepresentation:(id)a3 withMutableListRepresentation:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("3.list.sections"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("3.list.sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __118__NCNotificationListPersistentStateManager__mergePendingNotificationListRepresentation_withMutableListRepresentation___block_invoke;
  v10[3] = &unk_1E8D1ECD0;
  v10[4] = self;
  v11 = v7;
  v8 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __118__NCNotificationListPersistentStateManager__mergePendingNotificationListRepresentation_withMutableListRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("0.section.type"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sectionRepresentationOfSectionType:inRepresentationForSections:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "_mergeRepresentationForSection:withMutableRepresentationForSection:", v3, v4);

  }
  else
  {
    objc_msgSend(v5, "_mutableRepresentationForRepresentationForSection:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

- (void)_clearStoredListRepresentationForSectionIdentifier:(id)a3
{
  id v4;
  NSObject **v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  NSMutableDictionary *storedPersistentStateRepresentation;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSObject **)MEMORY[0x1E0DC5F90];
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v9;
    v24 = 2114;
    v25 = v4;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing stored notifications for section %{public}@", buf, 0x16u);

  }
  -[NSMutableDictionary objectForKey:](self->_storedPersistentStateRepresentation, "objectForKey:", CFSTR("3.list.sections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95__NCNotificationListPersistentStateManager__clearStoredListRepresentationForSectionIdentifier___block_invoke;
  v19[3] = &unk_1E8D1ED20;
  v19[4] = self;
  v12 = v4;
  v20 = v12;
  v13 = v11;
  v21 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);
  objc_msgSend(v10, "removeObjectsInArray:", v13);
  if (!objc_msgSend(v10, "count"))
  {
    v14 = *v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_1CFC3D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ has no more stored notifications. Clearing persistent store representation", buf, 0xCu);

    }
    storedPersistentStateRepresentation = self->_storedPersistentStateRepresentation;
    self->_storedPersistentStateRepresentation = 0;

  }
}

void __95__NCNotificationListPersistentStateManager__clearStoredListRepresentationForSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_clearStoredSectionIdentifier:inMutableRepresentationForSection:", *(_QWORD *)(a1 + 40), v3);
  if (objc_msgSend(*(id *)(a1 + 32), "_isRepresentationForSectionEmpty:", v3))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    objc_msgSend(v3, "objectForKey:", CFSTR("0.section.type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __95__NCNotificationListPersistentStateManager__clearStoredListRepresentationForSectionIdentifier___block_invoke_2;
      v6[3] = &unk_1E8D1B3A0;
      v6[4] = *(_QWORD *)(a1 + 32);
      v7 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v6);

    }
  }

}

void __95__NCNotificationListPersistentStateManager__clearStoredListRepresentationForSectionIdentifier___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStateManager:finishedLoadingDataForSectionType:", *(_QWORD *)(a1 + 32), NCNotificationListSectionTypeFromString(*(void **)(a1 + 40)));

}

- (BOOL)_isMutableListRepresentationEmpty:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("3.list.sections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (id)_representationForListCache:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "activeNotificationCellCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("0.cache.activeViews"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v4, "currentCacheSizeCount");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("1.cache.availableViews"));

  return v5;
}

- (id)_summaryMigrationTimeInRepresentationForList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("4.list.migrationTimes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("1.migrationTime.summary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSDateFormatter dateFromString:](self->_dateFormatter, "dateFromString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_representationForRequestMigrationTimes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationListPersistentStateManager *v12;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__NCNotificationListPersistentStateManager__representationForRequestMigrationTimes___block_invoke;
  v10[3] = &unk_1E8D1DB50;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v8 = v7;
  return v8;
}

void __84__NCNotificationListPersistentStateManager__representationForRequestMigrationTimes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a2;
  objc_msgSend(v5, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "stringFromDate:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "un_logDigest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v10);

}

- (id)_mutableRepresentationForRequestMigrationTimesInRepresentationForList:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v4;
  objc_msgSend(v6, "objectForKey:", CFSTR("4.list.migrationTimes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("2.migrationTime.requests"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NCNotificationListPersistentStateManager _mutableRepresentationForRepresentationForRequestMigrationTimes:](self, "_mutableRepresentationForRepresentationForRequestMigrationTimes:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v10;
    }

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("6.list.pendingMigrationTimes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[NCNotificationListPersistentStateManager _mergePendingRequestMigrationTimesRepresentation:withMutableRepresentationForRequestMigrationTimes:](self, "_mergePendingRequestMigrationTimesRepresentation:withMutableRepresentationForRequestMigrationTimes:", v11, v5);
  if (objc_msgSend(v5, "count"))
    v12 = v5;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)_mutableRepresentationForRepresentationForRequestMigrationTimes:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __108__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForRequestMigrationTimes___block_invoke;
  v7[3] = &unk_1E8D1ED70;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __108__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForRequestMigrationTimes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __108__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForRequestMigrationTimes___block_invoke_2;
    v11[3] = &unk_1E8D1ED48;
    v12 = v6;
    v7 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
}

void __108__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForRequestMigrationTimes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v7 = (id)objc_msgSend(a3, "copy");
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "setObject:forKey:", v7, v6);
}

- (void)_mergePendingRequestMigrationTimesRepresentation:(id)a3 withMutableRepresentationForRequestMigrationTimes:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __143__NCNotificationListPersistentStateManager__mergePendingRequestMigrationTimesRepresentation_withMutableRepresentationForRequestMigrationTimes___block_invoke;
  v7[3] = &unk_1E8D1ED70;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __143__NCNotificationListPersistentStateManager__mergePendingRequestMigrationTimesRepresentation_withMutableRepresentationForRequestMigrationTimes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "addEntriesFromDictionary:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v8);
  }

}

- (void)_clearStoredRequestMigrationTimesForSectionIdentifier:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSMutableDictionary *storedPersistentMigrationTimes;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeObjectForKey:](self->_storedPersistentMigrationTimes, "removeObjectForKey:", a3);
  if (!-[NSMutableDictionary count](self->_storedPersistentMigrationTimes, "count"))
  {
    v4 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ has no more stored migration times. Clearing persistent representation.", (uint8_t *)&v9, 0xCu);

    }
    storedPersistentMigrationTimes = self->_storedPersistentMigrationTimes;
    self->_storedPersistentMigrationTimes = 0;

  }
}

- (id)_getStoredMigrationTimeAndClearNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSMutableDictionary *storedPersistentMigrationTimes;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_storedPersistentMigrationTimes, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSDateFormatter dateFromString:](self->_dateFormatter, "dateFromString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectForKey:", v8);
    }
    else
    {
      v10 = 0;
    }
    if (!objc_msgSend(v6, "count"))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_storedPersistentMigrationTimes, "removeObjectForKey:", v5);
      if (!-[NSMutableDictionary count](self->_storedPersistentMigrationTimes, "count"))
      {
        v11 = (void *)*MEMORY[0x1E0DC5F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        {
          v12 = v11;
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543362;
          v18 = v14;
          _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ has no more stored migration times. Clearing persistent representation.", (uint8_t *)&v17, 0xCu);

        }
        storedPersistentMigrationTimes = self->_storedPersistentMigrationTimes;
        self->_storedPersistentMigrationTimes = 0;

      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_representationForMigratedTimeSensitiveNotificationRequests:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __104__NCNotificationListPersistentStateManager__representationForMigratedTimeSensitiveNotificationRequests___block_invoke;
  v8[3] = &unk_1E8D1C8F0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __104__NCNotificationListPersistentStateManager__representationForMigratedTimeSensitiveNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v3);
  }
  objc_msgSend(v7, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

- (id)_mutableRepresentationForMigratedTimeSensitiveNotificationRequestsInRepresentationForList:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "objectForKey:", CFSTR("4.list.migrationTimes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("3.migrationTime.migratedTimeSensitiveNotificationRequests"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NCNotificationListPersistentStateManager _mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests:](self, "_mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v9;
    }

  }
  return v5;
}

- (id)_mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __128__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests___block_invoke;
  v7[3] = &unk_1E8D1EDC0;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __128__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __128__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests___block_invoke_2;
    v11[3] = &unk_1E8D1ED98;
    v12 = v6;
    v7 = v6;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
}

void __128__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_clearStoredMigratedTimeSensitiveNotificationRequestsForSectionIdentifier:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSMutableDictionary *storedPersistentMigratedTimeSensitiveNotificationRequests;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeObjectForKey:](self->_storedPersistentMigratedTimeSensitiveNotificationRequests, "removeObjectForKey:", a3);
  if (!-[NSMutableDictionary count](self->_storedPersistentMigratedTimeSensitiveNotificationRequests, "count"))
  {
    v4 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ has no more stored migrated time sensitive notifications. Clearing persistent representation.", (uint8_t *)&v9, 0xCu);

    }
    storedPersistentMigratedTimeSensitiveNotificationRequests = self->_storedPersistentMigratedTimeSensitiveNotificationRequests;
    self->_storedPersistentMigratedTimeSensitiveNotificationRequests = 0;

  }
}

- (BOOL)_isMigratedTimeSensitiveNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_storedPersistentMigratedTimeSensitiveNotificationRequests, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v6, "containsObject:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_representationForSections:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  BOOL v18;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__NCNotificationListPersistentStateManager__representationForSections_detailed_hashIdentifiers___block_invoke;
  v15[3] = &unk_1E8D1EDE8;
  v15[4] = self;
  v17 = a4;
  v18 = a5;
  v11 = v10;
  v16 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

  v12 = v16;
  v13 = v11;

  return v13;
}

void __96__NCNotificationListPersistentStateManager__representationForSections_detailed_hashIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "notificationCount"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_representationForSection:detailed:hashIdentifiers:", v4, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

- (id)_representationForSection:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  NCNotificationListSectionTypeString(objc_msgSend(v8, "sectionType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("0.section.type"));

  objc_msgSend(v8, "allNotificationGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v8, "allNotificationGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListPersistentStateManager _representationForGroups:detailed:hashIdentifiers:](self, "_representationForGroups:detailed:hashIdentifiers:", v13, v6, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("3.section.groups"));

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "notificationCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("1.section.notificationCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("2.section.groupCount"));

  }
  return v9;
}

- (BOOL)_isRepresentationForSection:(id)a3 equalToRepresentationForSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("0.section.type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("0.section.type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("3.section.groups"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("3.section.groups"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NCNotificationListPersistentStateManager _isRepresentationForGroups:equalToRepresentationForGroups:](self, "_isRepresentationForGroups:equalToRepresentationForGroups:", v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)_getSectionTypeAndRemoveNotificationRequest:(id)a3 inMutableRepresentationForSections:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  v8 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __123__NCNotificationListPersistentStateManager__getSectionTypeAndRemoveNotificationRequest_inMutableRepresentationForSections___block_invoke;
  v13[3] = &unk_1E8D1EE10;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v15 = &v23;
  v16 = &v17;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  if (v18[5]
    && -[NCNotificationListPersistentStateManager _isRepresentationForSectionEmpty:](self, "_isRepresentationForSectionEmpty:"))
  {
    objc_msgSend(v7, "removeObject:", v18[5]);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __123__NCNotificationListPersistentStateManager__getSectionTypeAndRemoveNotificationRequest_inMutableRepresentationForSections___block_invoke_2;
    v12[3] = &unk_1E8D1EE38;
    v12[4] = self;
    v12[5] = &v23;
    dispatch_async(MEMORY[0x1E0C80D38], v12);
  }
  v10 = v24[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __123__NCNotificationListPersistentStateManager__getSectionTypeAndRemoveNotificationRequest_inMutableRepresentationForSections___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKey:", CFSTR("0.section.type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NCNotificationListSectionTypeFromString(v7);

  if (v8 == 10
    && objc_msgSend(*(id *)(a1 + 32), "_containsNotificationRequest:inMutableRepresentationForSection:shouldRemove:", *(_QWORD *)(a1 + 40), v9, 0))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 10;
LABEL_6:
    *a4 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_containsNotificationRequest:inMutableRepresentationForSection:shouldRemove:", *(_QWORD *)(a1 + 40), v9, 1))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    goto LABEL_6;
  }
LABEL_7:

}

void __123__NCNotificationListPersistentStateManager__getSectionTypeAndRemoveNotificationRequest_inMutableRepresentationForSections___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStateManager:finishedLoadingDataForSectionType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

- (BOOL)_containsNotificationRequest:(id)a3 inMutableRepresentationForSection:(id)a4 shouldRemove:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v9 = a4;
  objc_msgSend(v9, "objectForKey:", CFSTR("3.section.groups"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__14;
  v23 = __Block_byref_object_dispose__14;
  v24 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __120__NCNotificationListPersistentStateManager__containsNotificationRequest_inMutableRepresentationForSection_shouldRemove___block_invoke;
  v14[3] = &unk_1E8D1EE60;
  v16 = &v25;
  v14[4] = self;
  v11 = v8;
  v18 = a5;
  v15 = v11;
  v17 = &v19;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  if (*((_BYTE *)v26 + 24)
    && -[NCNotificationListPersistentStateManager _isRepresentationForGroupEmpty:](self, "_isRepresentationForGroupEmpty:", v20[5]))
  {
    objc_msgSend(v10, "removeObject:", v20[5]);
  }
  v12 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __120__NCNotificationListPersistentStateManager__containsNotificationRequest_inMutableRepresentationForSection_shouldRemove___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_containsNotificationRequest:inMutableRepresentationForGroup:shouldRemove:", *(_QWORD *)(a1 + 40), v6, *(unsigned __int8 *)(a1 + 64));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;
  v9 = v6;

  LOBYTE(a1) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *a4 = a1;
}

- (id)_mutableRepresentationForRepresentationForSection:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  NCNotificationListPersistentStateManager *v18;
  id v19;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v4;
  objc_msgSend(v6, "objectForKey:", CFSTR("0.section.type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("0.section.type"));

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "objectForKey:", CFSTR("3.section.groups"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __94__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForSection___block_invoke;
  v17 = &unk_1E8D1ECF8;
  v18 = self;
  v12 = v10;
  v19 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v14);
  if (objc_msgSend(v12, "count", v14, v15, v16, v17, v18))
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("3.section.groups"));

  return v5;
}

void __94__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_mutableRepresentationForRepresentationForGroup:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)_sectionRepresentationOfSectionType:(id)a3 inRepresentationForSections:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __108__NCNotificationListPersistentStateManager__sectionRepresentationOfSectionType_inRepresentationForSections___block_invoke;
  v11[3] = &unk_1E8D1EE88;
  v7 = v5;
  v12 = v7;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v11);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __108__NCNotificationListPersistentStateManager__sectionRepresentationOfSectionType_inRepresentationForSections___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("0.section.type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_mergeRepresentationForSection:(id)a3 withMutableRepresentationForSection:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("3.section.groups"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("3.section.groups"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __111__NCNotificationListPersistentStateManager__mergeRepresentationForSection_withMutableRepresentationForSection___block_invoke;
  v10[3] = &unk_1E8D1ECD0;
  v10[4] = self;
  v11 = v7;
  v8 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __111__NCNotificationListPersistentStateManager__mergeRepresentationForSection_withMutableRepresentationForSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("1.group.sectionIdentifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("2.group.threadIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_representationForGroupWithSectionIdentifier:threadIdentifier:inRepresentationForGroups:", v7, v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "_mergeRepresentationForGroup:withMutableRepresentationForGroup:", v3, v5);

  }
  else
  {
    objc_msgSend(v6, "_mutableRepresentationForRepresentationForGroup:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

- (void)_clearStoredSectionIdentifier:(id)a3 inMutableRepresentationForSection:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("3.section.groups"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__NCNotificationListPersistentStateManager__clearStoredSectionIdentifier_inMutableRepresentationForSection___block_invoke;
  v10[3] = &unk_1E8D1ECD0;
  v11 = v5;
  v12 = v6;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v9, "removeObjectsInArray:", v8);

}

void __108__NCNotificationListPersistentStateManager__clearStoredSectionIdentifier_inMutableRepresentationForSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKey:", CFSTR("1.group.sectionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (BOOL)_isRepresentationForSectionEmpty:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("3.section.groups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (id)_representationForGroups:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  BOOL v18;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__NCNotificationListPersistentStateManager__representationForGroups_detailed_hashIdentifiers___block_invoke;
  v15[3] = &unk_1E8D1EEB0;
  v15[4] = self;
  v17 = a4;
  v18 = a5;
  v11 = v10;
  v16 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

  v12 = v16;
  v13 = v11;

  return v13;
}

void __94__NCNotificationListPersistentStateManager__representationForGroups_detailed_hashIdentifiers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_representationForGroup:atIndex:detailed:hashIdentifiers:", a2, a3, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (id)_representationForGroup:(id)a3 atIndex:(unint64_t)a4 detailed:(BOOL)a5 hashIdentifiers:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "sectionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("1.group.sectionIdentifier"));

  if (v6)
  {
    objc_msgSend(v10, "threadIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "un_logDigest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("2.group.threadIdentifier"));

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(v10, "leadingNotificationRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isUniqueThreadIdentifier");

  if (v17)
  {
    objc_msgSend(v10, "threadIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("2.group.threadIdentifier"));
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v10, "allNotificationRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListPersistentStateManager _representationForNotificationRequests:detailed:hashIdentifiers:](self, "_representationForNotificationRequests:detailed:hashIdentifiers:", v18, v7, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("5.group.notificationRequests"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v20, CFSTR("0.group.index"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v21, CFSTR("4.group.notificationCount"));

    objc_msgSend(v10, "leadingNotificationRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v10, "leadingNotificationRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timestamp");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v25, CFSTR("3.group.timestamp"));

      }
    }
  }

  return v11;
}

- (BOOL)_isRepresentationForGroups:(id)a3 equalToRepresentationForGroups:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = objc_msgSend(v8, "count");
  if (v10 == objc_msgSend(v9, "count"))
  {
    v11 = objc_msgSend(v8, "count");
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndex:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[NCNotificationListPersistentStateManager _isRepresentationForGroup:equalToRepresentationForGroup:](self, "_isRepresentationForGroup:equalToRepresentationForGroup:", v15, v16);

        if (!v17)
          break;
        v14 = v12 <= ++v13;
      }
      while (v12 != v13);
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_isRepresentationForGroup:(id)a3 equalToRepresentationForGroup:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "objectForKey:", CFSTR("1.group.sectionIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("1.group.sectionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11
    && (objc_msgSend(v7, "objectForKey:", CFSTR("2.group.threadIdentifier")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "objectForKey:", CFSTR("2.group.threadIdentifier")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "isEqualToString:", v13),
        v13,
        v12,
        v14))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("5.group.notificationRequests"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("5.group.notificationRequests"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToArray:", v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_containsNotificationRequest:(id)a3 inMutableRepresentationForGroup:(id)a4 shouldRemove:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _BOOL4 v23;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "objectForKey:", CFSTR("1.group.sectionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("2.group.threadIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("5.group.notificationRequests"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationListPersistentStateManager _representationForNotificationRequest:hashIdentifiers:](self, "_representationForNotificationRequest:hashIdentifiers:", v8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v14) & 1) == 0)
  {

    LOBYTE(v17) = 0;
    goto LABEL_16;
  }
  objc_msgSend(v8, "threadIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "isEqualToString:", v15);
  v23 = v5;
  if ((v16 & 1) == 0)
  {
    objc_msgSend(v8, "threadIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "un_logDigest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:") & 1) == 0)
    {
      v17 = 0;
      goto LABEL_12;
    }
    if ((objc_msgSend(v12, "containsObject:", v13) & 1) != 0)
    {
      v17 = 1;
      goto LABEL_12;
    }
    v21 = v18;
LABEL_11:
    objc_msgSend(v8, "notificationIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "containsObject:", v19);

    v18 = v21;
    if ((v16 & 1) != 0)
      goto LABEL_13;
LABEL_12:

    goto LABEL_13;
  }
  if ((objc_msgSend(v12, "containsObject:", v13) & 1) == 0)
    goto LABEL_11;
  v17 = 1;
LABEL_13:

  if (v17 && v23)
  {
    objc_msgSend(v12, "removeObject:", v13);
    LOBYTE(v17) = 1;
  }
LABEL_16:

  return v17;
}

- (id)_mutableRepresentationForRepresentationForGroup:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "objectForKey:", CFSTR("1.group.sectionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("1.group.sectionIdentifier"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("2.group.threadIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("2.group.threadIdentifier"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("5.group.notificationRequests"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NCNotificationListPersistentStateManager _mutableRepresentationForRepresentationForNotificationRequests:](self, "_mutableRepresentationForRepresentationForNotificationRequests:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("5.group.notificationRequests"));

  }
  return v5;
}

- (id)_representationForGroupWithSectionIdentifier:(id)a3 threadIdentifier:(id)a4 inRepresentationForGroups:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __132__NCNotificationListPersistentStateManager__representationForGroupWithSectionIdentifier_threadIdentifier_inRepresentationForGroups___block_invoke;
  v18 = &unk_1E8D1EED8;
  v19 = v7;
  v20 = v8;
  v10 = v7;
  v11 = v8;
  v12 = objc_msgSend(v9, "indexOfObjectPassingTest:", &v15);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndex:", v12, v15, v16, v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

uint64_t __132__NCNotificationListPersistentStateManager__representationForGroupWithSectionIdentifier_threadIdentifier_inRepresentationForGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("1.group.sectionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("2.group.threadIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "un_logDigest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_mergeRepresentationForGroup:(id)a3 withMutableRepresentationForGroup:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("5.group.notificationRequests"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("5.group.notificationRequests"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationListPersistentStateManager _mergeRepresentationForNotificationRequests:withMutableRepresentationForNotificationRequests:](self, "_mergeRepresentationForNotificationRequests:withMutableRepresentationForNotificationRequests:", v8, v7);
}

- (BOOL)_isRepresentationForGroupEmpty:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("5.group.notificationRequests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (id)_representationForNotificationRequests:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;

  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __108__NCNotificationListPersistentStateManager__representationForNotificationRequests_detailed_hashIdentifiers___block_invoke;
  v16[3] = &unk_1E8D1EF00;
  v19 = a5;
  v16[4] = self;
  v17 = v10;
  v11 = v9;
  v18 = v11;
  v12 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

void __108__NCNotificationListPersistentStateManager__representationForNotificationRequests_detailed_hashIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_representationForNotificationRequest:hashIdentifiers:", a2, *(unsigned __int8 *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (id)_representationForNotificationRequest:(id)a3 hashIdentifiers:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a4;
  objc_msgSend(a3, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "un_logDigest");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)_mutableRepresentationForRepresentationForNotificationRequests:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __107__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForNotificationRequests___block_invoke;
  v7[3] = &unk_1E8D1ED98;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

uint64_t __107__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForNotificationRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)_mergeRepresentationForNotificationRequests:(id)a3 withMutableRepresentationForNotificationRequests:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __137__NCNotificationListPersistentStateManager__mergeRepresentationForNotificationRequests_withMutableRepresentationForNotificationRequests___block_invoke;
  v7[3] = &unk_1E8D1ED98;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __137__NCNotificationListPersistentStateManager__mergeRepresentationForNotificationRequests_withMutableRepresentationForNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (NCNotificationListPersistentStateManagerDelegate)delegate
{
  return (NCNotificationListPersistentStateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setStoredPersistentStateRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_storedPersistentStateRepresentation, a3);
}

- (NSMutableDictionary)currentStateRepresentation
{
  return self->_currentStateRepresentation;
}

- (void)setCurrentStateRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_currentStateRepresentation, a3);
}

- (NSDate)storedPersistentSummaryMigrationTime
{
  return self->_storedPersistentSummaryMigrationTime;
}

- (void)setStoredPersistentSummaryMigrationTime:(id)a3
{
  objc_storeStrong((id *)&self->_storedPersistentSummaryMigrationTime, a3);
}

- (void)setStoredPersistentMigrationTimes:(id)a3
{
  objc_storeStrong((id *)&self->_storedPersistentMigrationTimes, a3);
}

- (NSMutableDictionary)storedPersistentMigratedTimeSensitiveNotificationRequests
{
  return self->_storedPersistentMigratedTimeSensitiveNotificationRequests;
}

- (void)setStoredPersistentMigratedTimeSensitiveNotificationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_storedPersistentMigratedTimeSensitiveNotificationRequests, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (NSDictionary)cachedListRepresentationForThrottledWriteToFile
{
  return self->_cachedListRepresentationForThrottledWriteToFile;
}

- (void)setCachedListRepresentationForThrottledWriteToFile:(id)a3
{
  objc_storeStrong((id *)&self->_cachedListRepresentationForThrottledWriteToFile, a3);
}

- (NSDictionary)cachedListRepresentationForThrottledSendToVendor
{
  return self->_cachedListRepresentationForThrottledSendToVendor;
}

- (void)setCachedListRepresentationForThrottledSendToVendor:(id)a3
{
  objc_storeStrong((id *)&self->_cachedListRepresentationForThrottledSendToVendor, a3);
}

- (NSDictionary)lastWrittenListRepresentation
{
  return self->_lastWrittenListRepresentation;
}

- (void)setLastWrittenListRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_lastWrittenListRepresentation, a3);
}

- (NCSummaryServiceGateway)gateway
{
  return self->_gateway;
}

- (void)setGateway:(id)a3
{
  objc_storeStrong((id *)&self->_gateway, a3);
}

- (NSArray)lastSectionsSentToGateway
{
  return self->_lastSectionsSentToGateway;
}

- (void)setLastSectionsSentToGateway:(id)a3
{
  objc_storeStrong((id *)&self->_lastSectionsSentToGateway, a3);
}

- (void)setLoadedStoredPersistentState:(BOOL)a3
{
  self->_loadedStoredPersistentState = a3;
}

- (BOOL)hasStoredCurrentDigestMigrationTimeExpired
{
  return self->_storedCurrentDigestMigrationTimeExpired;
}

- (void)setStoredCurrentDigestMigrationTimeExpired:(BOOL)a3
{
  self->_storedCurrentDigestMigrationTimeExpired = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSectionsSentToGateway, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_lastWrittenListRepresentation, 0);
  objc_storeStrong((id *)&self->_cachedListRepresentationForThrottledSendToVendor, 0);
  objc_storeStrong((id *)&self->_cachedListRepresentationForThrottledWriteToFile, 0);
  objc_storeStrong((id *)&self->_cachedListRepresentation, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_storedPersistentMigratedTimeSensitiveNotificationRequests, 0);
  objc_storeStrong((id *)&self->_storedPersistentMigrationTimes, 0);
  objc_storeStrong((id *)&self->_storedPersistentSummaryMigrationTime, 0);
  objc_storeStrong((id *)&self->_currentStateRepresentation, 0);
  objc_storeStrong((id *)&self->_storedPersistentStateRepresentation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_writePersistentStateToFileWithRepresentation:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_4(&dword_1CFC3D000, v4, v5, "%{public}@ encountered error writing notification list persistent state to file!", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_1();
}

- (void)_writePersistentStateToFileWithRepresentation:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1CFC3D000, v4, v5, "%{public}@ encountered error converting notification list persistent state to JSON! [err=%@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

@end

@implementation PLCloudFeedEntriesManager

- (PLCloudFeedEntriesManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PLCloudFeedEntriesManager *v6;
  PLCloudFeedEntriesManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLCloudFeedEntriesManager;
  v6 = -[PLCloudFeedEntriesManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_library, a3);

  return v7;
}

- (id)_firstEntryOnOrBeforeDate:(id)a3
{
  return -[PLCloudFeedEntriesManager _firstEntryRelativeToDate:ascending:includeSameDate:](self, "_firstEntryRelativeToDate:ascending:includeSameDate:", a3, 0, 1);
}

- (id)_firstEntryAfterDate:(id)a3
{
  return -[PLCloudFeedEntriesManager _firstEntryRelativeToDate:ascending:includeSameDate:](self, "_firstEntryRelativeToDate:ascending:includeSameDate:", a3, 1, 0);
}

- (id)_firstEntryOnOrAfterDate:(id)a3
{
  return -[PLCloudFeedEntriesManager _firstEntryRelativeToDate:ascending:includeSameDate:](self, "_firstEntryRelativeToDate:ascending:includeSameDate:", a3, 1, 1);
}

- (id)_firstEntryRelativeToDate:(id)a3 ascending:(BOOL)a4 includeSameDate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  id v31;
  _QWORD v32[2];

  v5 = a5;
  v6 = a4;
  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  -[PLCloudFeedEntriesManager library](self, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEntity:", v12);

  v13 = CFSTR("(entryDate < %@)");
  if (v5)
    v13 = CFSTR("(entryDate <= %@)");
  v14 = CFSTR("(entryDate >= %@)");
  if (!v5)
    v14 = CFSTR("(entryDate > %@)");
  if (v6)
    v13 = (__CFString *)v14;
  v15 = v13;
  -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", CFSTR(" AND (entryPriorityNumber = %d)"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v16, v8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v17);

  objc_msgSend(v9, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v19);

  v25 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v9, &v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v25;
  if (!v20)
  {
    PLCloudFeedGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v27 = v8;
      v28 = 1024;
      v29 = v6;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "error fetching relative to date %@ %i: %@", buf, 0x1Cu);
    }

  }
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "objectAtIndex:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_getEarliestDate:(id *)a3 latestDate:(id *)a4 forRangeOfContiguousCommentsEntriesAroundDate:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[PLCloudFeedEntriesManager library](self, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0x1E0CB3000uLL;
  if (a3)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEntity:", v13);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryDate <= %@) AND (entryPriorityNumber = %d) AND (entryTypeNumber != %d)"), v8, 0, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v14);

    objc_msgSend(v12, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSortDescriptors:", v16);

    v31 = 0;
    objc_msgSend(v10, "executeFetchRequest:error:", v12, &v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v31;
    if (!v17)
    {
      PLCloudFeedGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v18;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "error fetching earliest date %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v17, "objectAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "entryDate");
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v11 = 0x1E0CB3000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (a4)
      goto LABEL_12;
LABEL_9:
    v21 = v18;
    goto LABEL_20;
  }
  v18 = 0;
  if (!a4)
    goto LABEL_9;
LABEL_12:
  v22 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEntity:", v23);

  objc_msgSend(*(id *)(v11 + 2176), "predicateWithFormat:", CFSTR("(entryDate > %@) AND (entryPriorityNumber = %d) AND (entryTypeNumber != %d)"), v8, 0, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPredicate:", v24);

  objc_msgSend(v22, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSortDescriptors:", v26);

  v30 = v18;
  objc_msgSend(v10, "executeFetchRequest:error:", v22, &v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v30;

  if (!v27)
  {
    PLCloudFeedGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "error fetching latest date %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v27, "count") == 1)
  {
    objc_msgSend(v27, "objectAtIndex:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "entryDate");
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_20:
}

- (id)_invitationReceivedEntryForSharedAlbum:(id)a3
{
  return -[PLCloudFeedEntriesManager _singleEntryOfType:forSharedAlbum:](self, "_singleEntryOfType:forSharedAlbum:", 3, a3);
}

- (id)_subscriptionEntryForSharedAlbum:(id)a3
{
  void *v5;
  void *v7;

  -[PLCloudFeedEntriesManager _singleEntryOfType:forSharedAlbum:](self, "_singleEntryOfType:forSharedAlbum:", 4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 155, CFSTR("wrong class for subscription entry %@"), v5);

    }
  }
  return v5;
}

- (id)_albumCreatedEntryForSharedAlbum:(id)a3
{
  return -[PLCloudFeedEntriesManager _singleEntryOfType:forSharedAlbum:](self, "_singleEntryOfType:forSharedAlbum:", 7, a3);
}

- (id)_singleEntryOfType:(int64_t)a3 forSharedAlbum:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  int64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PLCloudFeedEntriesManager library](self, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cloudGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEntity:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryTypeNumber = %d) AND (entryAlbumGUID = %@)"), a3, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v12);

  objc_msgSend(v10, "setFetchLimit:", 2);
  v19 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v10, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;
  if (!v13)
  {
    PLCloudFeedGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v21 = a3;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "error fetching entry of type %li: %@", buf, 0x16u);
    }

  }
  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    PLCloudFeedGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v21 = a3;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "found multiple entres of type %li for album: %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_invitationAcceptedEntryForInvitationRecord:(id)a3
{
  return -[PLCloudFeedEntriesManager _singleEntryOfType:forInvitationRecord:](self, "_singleEntryOfType:forInvitationRecord:", 5, a3);
}

- (id)_invitationDeclinedEntryForInvitationRecord:(id)a3
{
  return -[PLCloudFeedEntriesManager _singleEntryOfType:forInvitationRecord:](self, "_singleEntryOfType:forInvitationRecord:", 6, a3);
}

- (id)_singleEntryOfType:(int64_t)a3 forInvitationRecord:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  int64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PLCloudFeedEntriesManager library](self, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cloudGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEntity:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryTypeNumber = %d) AND (entryInvitationRecordGUID = %@)"), a3, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v12);

  objc_msgSend(v10, "setFetchLimit:", 2);
  v19 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v10, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;
  if (!v13)
  {
    PLCloudFeedGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v21 = a3;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "error fetching entry of type %li: %@", buf, 0x16u);
    }

  }
  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    PLCloudFeedGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v21 = a3;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "found multiple entres of type %li for invitation record: %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)processAlbumUpdates:(id)a3 assetInserts:(id)a4 assetUpdates:(id)a5 commentInserts:(id)a6 invitationRecordUpdates:(id)a7 deletionEntries:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  char *v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void (**v40)(_QWORD);
  void *v41;
  SEL aSelectora;
  _QWORD v44[4];
  id v45;
  id v46;
  PLCloudFeedEntriesManager *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = (void (**)(_QWORD))a9;
  PLCloudFeedGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = v23;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "will %@", buf, 0xCu);

  }
  PLCloudFeedGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v15;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "albumUpdates=%@", buf, 0xCu);
  }

  PLCloudFeedGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v16;
    _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "assetInserts=%@", buf, 0xCu);
  }

  PLCloudFeedGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v17;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "assetUpdates=%@", buf, 0xCu);
  }

  PLCloudFeedGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v18;
    _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "commentInserts=%@", buf, 0xCu);
  }

  PLCloudFeedGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v19;
    _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "invitationRecordUpdates=%@", buf, 0xCu);
  }

  PLCloudFeedGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v20;
    _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "deletionEntries=%@", buf, 0xCu);
  }

  if (objc_msgSend(v15, "count")
    || objc_msgSend(v16, "count")
    || objc_msgSend(v17, "count")
    || objc_msgSend(v18, "count")
    || objc_msgSend(v19, "count")
    || objc_msgSend(v20, "count"))
  {
    -[PLCloudFeedEntriesManager library](self, "library");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "managedObjectContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __148__PLCloudFeedEntriesManager_processAlbumUpdates_assetInserts_assetUpdates_commentInserts_invitationRecordUpdates_deletionEntries_completionHandler___block_invoke;
    v44[3] = &unk_1E36775C0;
    v45 = v15;
    v46 = v31;
    v47 = self;
    v48 = v16;
    v49 = v17;
    v50 = v18;
    v51 = v19;
    v52 = v20;
    v32 = v31;
    objc_msgSend(v30, "performTransaction:completionHandler:", v44, v21);
    PLCloudFeedGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      aSelectora = v32;
      v34 = v15;
      v35 = v16;
      v36 = v20;
      v37 = v17;
      v38 = v19;
      v39 = v18;
      v40 = v21;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = v41;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEBUG, "did %@", buf, 0xCu);

      v21 = v40;
      v18 = v39;
      v19 = v38;
      v17 = v37;
      v20 = v36;
      v16 = v35;
      v15 = v34;
      v32 = (char *)aSelectora;
    }

  }
  else if (v21)
  {
    v21[2](v21);
  }

}

- (void)rebuildAllEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLCloudFeedEntriesManager *v10;

  v4 = a3;
  -[PLCloudFeedEntriesManager library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v5, "performTransaction:completionHandler:withPriority:", v8, v4, 1);

}

- (void)_noteDidUpdateSharedAlbum:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedAlbum"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = v7;
    v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);

  }
  -[PLCloudFeedEntriesManager library](self, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v5, "cloudRelationshipStateLocalValue");
  PLCloudFeedGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v45 = (id)v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "relationshipState=%li", buf, 0xCu);
  }

  -[PLCloudFeedEntriesManager _invitationReceivedEntryForSharedAlbum:](self, "_invitationReceivedEntryForSharedAlbum:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLCloudFeedGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v13;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "invitationReceivedEntry=%@", buf, 0xCu);
  }

  if (v11 != 1)
  {
    if (v13)
    {
      PLCloudFeedGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v13, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v21;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);

      }
      objc_msgSend(v10, "deleteObject:", v13);
    }
LABEL_27:
    -[PLCloudFeedEntriesManager _subscriptionEntryForSharedAlbum:](self, "_subscriptionEntryForSharedAlbum:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PLCloudFeedGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v16;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "subscriptionEntry=%@", buf, 0xCu);
    }

    if (v11 == 2)
    {
      if (v16)
      {
        objc_msgSend(v16, "entryDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEntryDate:", v24);

        PLCloudFeedGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "objectID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = v26;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "touched %@", buf, 0xCu);

        }
      }
      else
      {
        -[PLCloudFeedEntriesManager _subscriptionDateForSharedAlbum:](self, "_subscriptionDateForSharedAlbum:", v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v5, "cloudGUID");
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            +[PLCloudFeedAssetsEntry entityName](PLCloudFeedAssetsEntry, "entityName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v30, (uint64_t)v10, 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v31)
              goto LABEL_72;
            objc_msgSend(v31, "setEntryTypeNumber:", &unk_1E3761010);
            objc_msgSend(v31, "setEntryPriorityNumber:", &unk_1E3761028);
            objc_msgSend(v31, "setEntryDate:", v16);
            objc_msgSend(v31, "setEntryAlbumGUID:", v29);
            objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setEntryAssets:", v32);

            PLCloudFeedGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v13;
              _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
            }
          }
          else
          {
            PLCloudFeedGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v5;
              _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "no GUID for album %@", buf, 0xCu);
            }
            v31 = 0;
          }

        }
        else
        {
          v31 = 0;
        }

        v16 = v31;
      }
    }
    else if (v16)
    {
      PLCloudFeedGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v16, "objectID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v28;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);

      }
      objc_msgSend(v10, "deleteObject:", v16);
    }
    if (!objc_msgSend(v5, "isOwnedCloudSharedAlbum"))
      goto LABEL_70;
    -[PLCloudFeedEntriesManager _albumCreatedEntryForSharedAlbum:](self, "_albumCreatedEntryForSharedAlbum:", v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v5, "isEmpty") ^ 1;
    if ((v35 & 1) != 0 || v34)
    {
      if (!v34)
        v35 = 0;
      if (v35 == 1)
      {
        PLCloudFeedGetLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "objectID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = v40;
          _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "delete album created entry: %@", buf, 0xCu);

        }
        objc_msgSend(v10, "deleteObject:", v34);
      }
      goto LABEL_69;
    }
    objc_msgSend(v5, "cloudCreationDate");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      objc_msgSend(v5, "cloudLastInterestingChangeDate");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        PLCloudFeedGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v5;
          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "ignoring album with no creation date %@", buf, 0xCu);
        }
        v34 = 0;
        goto LABEL_68;
      }
    }
    objc_msgSend(v5, "cloudGUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      PLCloudFeedGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v5;
        _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "no GUID for album %@", buf, 0xCu);
      }
      v34 = 0;
      goto LABEL_67;
    }
    +[PLCloudFeedEntry entityName](PLCloudFeedEntry, "entityName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v37, (uint64_t)v10, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v34, "setEntryTypeNumber:", &unk_1E3761040);
      objc_msgSend(v34, "setEntryPriorityNumber:", &unk_1E3761028);
      objc_msgSend(v34, "setEntryDate:", v29);
      objc_msgSend(v34, "setEntryAlbumGUID:", v36);
      PLCloudFeedGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v13;
        _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
      }
LABEL_67:

LABEL_68:
LABEL_69:

LABEL_70:
      PLCloudFeedGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v45 = v41;
        v46 = 2112;
        v47 = v42;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

      }
      goto LABEL_72;
    }

LABEL_72:
    goto LABEL_73;
  }
  if (v13)
    goto LABEL_27;
  objc_msgSend(v5, "cloudLastInterestingChangeDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudGUID");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v13)
  {
    if (v15)
      goto LABEL_13;
LABEL_23:
    PLCloudFeedGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v5;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "no GUID for album %@", buf, 0xCu);
    }
    v18 = 0;
    goto LABEL_26;
  }
  PLCloudFeedGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v5;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "couldn't find invitation date for %@, using current date instead", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_23;
LABEL_13:
  +[PLCloudFeedEntry entityName](PLCloudFeedEntry, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v17, (uint64_t)v10, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "setEntryTypeNumber:", &unk_1E3760FE0);
    objc_msgSend(v18, "setEntryPriorityNumber:", &unk_1E3760FF8);
    objc_msgSend(v18, "setEntryDate:", v13);
    objc_msgSend(v18, "setEntryAlbumGUID:", v16);
    PLCloudFeedGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v18;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
    }
LABEL_26:

    v13 = v18;
    goto LABEL_27;
  }
LABEL_73:

}

- (void)_noteContentDeletionAffectingInvitationEntry:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 552, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitationReceivedEntry"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);

  }
  -[PLCloudFeedEntriesManager library](self, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PLCloudFeedGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "delete invitation received entry: %@", buf, 0xCu);

  }
  objc_msgSend(v10, "deleteObject:", v5);
  PLCloudFeedGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

  }
}

- (void)_noteContentDeletionAffectingSubscriptionEntry:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 567, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subscriptionEntry"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);

  }
  objc_msgSend(v5, "entryAlbumGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudFeedEntriesManager library](self, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLCloudFeedGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isDeleted");
    *(_DWORD *)buf = 138412546;
    v23 = v13;
    v24 = 1024;
    LODWORD(v25) = v14;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "album=%@ isDeleted=%i", buf, 0x12u);

  }
  if (!v11 || objc_msgSend(v11, "isDeleted"))
  {
    PLCloudFeedGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "delete subscription entry: %@", buf, 0xCu);

    }
    objc_msgSend(v10, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deleteObject:", v5);

  }
  PLCloudFeedGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v19;
    v24 = 2112;
    v25 = v20;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

  }
}

- (void)_noteContentDeletionAffectingInvitationResponseEntry:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 586, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitationSentEntry"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);

  }
  -[PLCloudFeedEntriesManager library](self, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PLCloudFeedGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "delete invitation response entry: %@", buf, 0xCu);

  }
  objc_msgSend(v10, "deleteObject:", v5);
  PLCloudFeedGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

  }
}

- (void)_noteContentDeletionAffectingAlbumCreatedEntry:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 600, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("albumCreatedEntry"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", buf, 0x16u);

  }
  -[PLCloudFeedEntriesManager library](self, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PLCloudFeedGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "delete album entry: %@", buf, 0xCu);

  }
  objc_msgSend(v10, "deleteObject:", v5);

}

- (void)_noteDidReceiveSharedAsset:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  const char *v45;
  void *v46;
  uint8_t buf[4];
  NSObject *v48;
  __int16 v49;
  NSObject *v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  _BOOL4 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 616, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectID](v5, "objectID");
    v8 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v48 = v7;
    v49 = 2112;
    v50 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);

  }
  -[PLCloudFeedEntriesManager _dateForAsset:](self, "_dateForAsset:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  PLCloudFeedGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v9;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "assetDate=%@", buf, 0xCu);
  }

  if (!v9)
  {
    PLCloudFeedGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v5;
      v12 = "no date for asset %@";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 12;
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (-[PLCloudFeedEntriesManager _shouldIgnoreAsset:](self, "_shouldIgnoreAsset:", v5))
  {
    PLCloudFeedGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v12 = "ignoring";
      v13 = v11;
      v14 = OS_LOG_TYPE_DEBUG;
      v15 = 2;
LABEL_13:
      _os_log_impl(&dword_199541000, v13, v14, v12, buf, v15);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (-[PLCloudFeedEntriesManager _wasAssetPublishedBeforeSubscription:](self, "_wasAssetPublishedBeforeSubscription:", v5))
  {
    PLCloudFeedGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v5;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "_wasAssetPublishedBeforeSubscription %@", buf, 0xCu);
    }

    -[PLCloudFeedEntriesManager _noteDidReceiveSharedAssetPublishedBeforeSubscription:](self, "_noteDidReceiveSharedAssetPublishedBeforeSubscription:", v5);
  }
  else
  {
    -[PLCloudFeedEntriesManager _firstEntryOnOrBeforeDate:](self, "_firstEntryOnOrBeforeDate:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudFeedEntriesManager _firstEntryAfterDate:](self, "_firstEntryAfterDate:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PLCloudFeedEntriesManager _shouldMergeAsset:intoEntry:](self, "_shouldMergeAsset:intoEntry:", v5, v17);
    v20 = -[PLCloudFeedEntriesManager _shouldMergeAsset:intoEntry:](self, "_shouldMergeAsset:intoEntry:", v5, v18);
    PLCloudFeedGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v17, "objectID");
      v45 = a2;
      v22 = v17;
      v23 = v18;
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectID");
      v25 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v48 = v24;
      v49 = 2112;
      v50 = v25;
      v51 = 1024;
      v52 = v19;
      v53 = 1024;
      v54 = v20;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "entryBefore=%@ entryAfter=%@ shouldMergeWithEntryBefore=%i shouldMergeWithEntryAfter=%i", buf, 0x22u);

      v18 = v23;
      v17 = v22;
      a2 = v45;
    }

    if (v19)
    {
      -[PLCloudFeedEntriesManager _addAsset:toEntry:](self, "_addAsset:toEntry:", v5, v17);
      PLCloudFeedGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v17, "objectID");
        v27 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v48 = v9;
        v49 = 2112;
        v50 = v27;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "set date %@ for %@", buf, 0x16u);

      }
      objc_msgSend(v17, "setEntryDate:", v9);
      if (v20)
        -[PLCloudFeedEntriesManager _mergeOlderEntry:intoMoreRecentEntry:](self, "_mergeOlderEntry:intoMoreRecentEntry:", v17, v18);
    }
    else if (v20)
    {
      -[PLCloudFeedEntriesManager _addAsset:toEntry:](self, "_addAsset:toEntry:", v5, v18);
    }
    else
    {
      v44 = v18;
      v46 = v17;
      -[PLCloudFeedEntriesManager _splitEntriesAtDate:](self, "_splitEntriesAtDate:", v9);
      -[PLCloudFeedEntriesManager library](self, "library");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "managedObjectContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject cloudShareAlbum](v5, "cloudShareAlbum");
      v30 = objc_claimAutoreleasedReturnValue();
      -[NSObject cloudGUID](v30, "cloudGUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        +[PLCloudFeedAssetsEntry entityName](PLCloudFeedAssetsEntry, "entityName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v29;
        PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v32, (uint64_t)v29, 0);
        v34 = objc_claimAutoreleasedReturnValue();

        -[NSObject setEntryTypeNumber:](v34, "setEntryTypeNumber:", &unk_1E3761058);
        -[NSObject setEntryPriorityNumber:](v34, "setEntryPriorityNumber:", &unk_1E3761028);
        -[NSObject setEntryDate:](v34, "setEntryDate:", v9);
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setEntryAssets:](v34, "setEntryAssets:", v35);

        -[NSObject setEntryAlbumGUID:](v34, "setEntryAlbumGUID:", v31);
        PLCloudFeedGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v34;
          _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
        }

        if (v34)
        {
          v29 = v33;
          if (-[NSObject cloudIsMyAsset](v5, "cloudIsMyAsset")
            && -[NSObject isOwnedCloudSharedAlbum](v30, "isOwnedCloudSharedAlbum"))
          {
            -[PLCloudFeedEntriesManager _albumCreatedEntryForSharedAlbum:](self, "_albumCreatedEntryForSharedAlbum:", v30);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              PLCloudFeedGetLog();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v37, "objectID");
                v39 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v48 = v39;
                _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);

              }
              objc_msgSend(v29, "deleteObject:", v37);
            }

          }
        }
        else
        {
          v29 = v33;
        }
      }
      else
      {
        PLCloudFeedGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v30;
          v49 = 2112;
          v50 = v5;
          _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "no GUID for album %@ of asset %@", buf, 0x16u);
        }
      }

      v18 = v44;
      v17 = v46;
    }
    PLCloudFeedGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v41 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectID](v5, "objectID");
      v42 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v41;
      v49 = 2112;
      v50 = v42;
      _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

    }
  }
LABEL_15:

}

- (void)_noteDidReceiveSharedAssetPublishedBeforeSubscription:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(v5, "cloudShareAlbum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudFeedEntriesManager _subscriptionEntryForSharedAlbum:](self, "_subscriptionEntryForSharedAlbum:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PLCloudFeedEntriesManager _addAsset:toEntry:](self, "_addAsset:toEntry:", v5, v10);
    PLCloudFeedGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "did %@ %@", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    PLCloudFeedGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "asset received with no subscription entry %@", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)_noteDidReceiveSharedComments:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x19AEC1554](v5);
        -[PLCloudFeedEntriesManager _noteDidReceiveSharedComment:](self, "_noteDidReceiveSharedComment:", v9, (_QWORD)v11);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v5;
    }
    while (v5);
  }

}

- (void)_noteDidReceiveSharedComment:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  int v25;
  char v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  PLCloudFeedEntriesManager *v57;
  _BYTE *v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  id v69;
  _BYTE buf[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v69 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 725, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("comment"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);

  }
  if (!-[PLCloudFeedEntriesManager _shouldIgnoreComment:](self, "_shouldIgnoreComment:", v69))
  {
    if (-[PLCloudFeedEntriesManager _wasCommentPublishedBeforeSubscription:](self, "_wasCommentPublishedBeforeSubscription:", v69))
    {
      PLCloudFeedGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "comment published before subscription", buf, 2u);
      }
      goto LABEL_8;
    }
    v65 = 0;
    v66 = &v65;
    v67 = 0x2020000000;
    v68 = 0;
    objc_msgSend(v69, "commentDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      PLCloudFeedGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v69;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "no date for comment %@", buf, 0xCu);
      }
      goto LABEL_59;
    }
    -[PLCloudFeedEntriesManager _splitEntriesAtDate:](self, "_splitEntriesAtDate:", v10);
    v63 = 0;
    v64 = 0;
    -[PLCloudFeedEntriesManager _getEarliestDate:latestDate:forRangeOfContiguousCommentsEntriesAroundDate:](self, "_getEarliestDate:latestDate:forRangeOfContiguousCommentsEntriesAroundDate:", &v64, &v63, v10);
    v11 = v64;
    v12 = v63;
    objc_msgSend(v69, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cloudAssetGUID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PLCloudFeedGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "objectID");
      v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v71 = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "dateRangeBegin=%@ dateRangeEnd=%@ asset=%@", buf, 0x20u);

    }
    if (!v51)
    {
      PLCloudFeedGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      v52 = v34;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v69;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "no GUID for asset %@ of comment %@", buf, 0x16u);
      }
      goto LABEL_58;
    }
    -[PLCloudFeedEntriesManager library](self, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "managedObjectContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedCommentsEntry, "entityInManagedObjectContext:", v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setEntity:", v17);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryDate > %@) AND (entryDate < %@) AND (entryCloudAssetGUID == %@)"), v11, v12, v51);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setPredicate:", v18);

    +[PLCloudFeedEntry entriesSortDescriptorsAscending:](PLCloudFeedEntry, "entriesSortDescriptorsAscending:", 1);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setSortDescriptors:", v19);
    v47 = (void *)v19;
    v62 = 0;
    objc_msgSend(v52, "executeFetchRequest:error:", v50, &v62);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v62;
    if (!v20)
    {
      PLCloudFeedGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v48;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "error fetching comments entry in date range %@", buf, 0xCu);
      }

      v20 = 0;
    }
    v49 = v20;
    v22 = objc_msgSend(v20, "count");
    if (v22 >= 1)
    {
      v44 = v13;
      v23 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v24 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v25 = objc_msgSend(v69, "isLikeBoolValue");
      v26 = v25;
      if (v25)
        v27 = v23;
      else
        v27 = v24;
      objc_msgSend(v27, "addObject:", v69);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v71 = __Block_byref_object_copy__99756;
      v72 = __Block_byref_object_dispose__99757;
      v73 = 0;
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __58__PLCloudFeedEntriesManager__noteDidReceiveSharedComment___block_invoke;
      v53[3] = &unk_1E3677610;
      v61 = v26;
      v28 = v23;
      v54 = v28;
      v58 = buf;
      v29 = v24;
      v55 = v29;
      v60 = v22;
      v56 = v52;
      v57 = self;
      v59 = &v65;
      objc_msgSend(v49, "enumerateObjectsUsingBlock:", v53);

      v13 = v44;
      _Block_object_dispose(buf, 8);

    }
    if (!*((_BYTE *)v66 + 24) && objc_msgSend(v69, "isLikeBoolValue"))
    {
      -[PLCloudFeedEntriesManager _firstEntryOnOrBeforeDate:](self, "_firstEntryOnOrBeforeDate:", v10);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudFeedEntriesManager _firstEntryAfterDate:](self, "_firstEntryAfterDate:", v10);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PLCloudFeedEntriesManager _tryMergingComment:withEntry:](self, "_tryMergingComment:withEntry:", v69, v30)
        || -[PLCloudFeedEntriesManager _tryMergingComment:withEntry:](self, "_tryMergingComment:withEntry:", v69, v31))
      {
        *((_BYTE *)v66 + 24) = 1;
      }

    }
    if (!*((_BYTE *)v66 + 24))
    {
      objc_msgSend(v13, "cloudShareAlbum");
      v32 = objc_claimAutoreleasedReturnValue();
      -[NSObject cloudGUID](v32, "cloudGUID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v45)
      {
        PLCloudFeedGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v69;
          _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "no GUID for album %@ of comment %@", buf, 0x16u);
        }

        goto LABEL_57;
      }
      if (objc_msgSend(v69, "isLikeBoolValue"))
      {
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:count:", &v69, 1);
        v33 = 0;
      }
      else
      {
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:count:", &v69, 1);
        v46 = 0;
      }
      +[PLCloudFeedCommentsEntry entityName](PLCloudFeedCommentsEntry, "entityName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v36, (uint64_t)v52, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "setEntryTypeNumber:", &unk_1E3761070);
      objc_msgSend(v37, "setEntryPriorityNumber:", &unk_1E3761028);
      objc_msgSend(v37, "setEntryDate:", v10);
      objc_msgSend(v37, "setEntryCloudAssetGUID:", v51);
      objc_msgSend(v37, "setEntryAlbumGUID:", v45);
      v38 = v46;
      if (!v46)
      {
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v37, "setEntryLikeComments:", v38);
      if (!v46)

      v39 = v33;
      if (!v33)
      {
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v37, "setEntryComments:", v39);
      if (!v33)

      PLCloudFeedGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v37;
        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
      }

    }
    PLCloudFeedGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v42;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

    }
LABEL_57:

LABEL_58:
LABEL_59:

    _Block_object_dispose(&v65, 8);
    goto LABEL_60;
  }
  PLCloudFeedGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v69;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "ignoring %@", buf, 0xCu);
  }
LABEL_8:

LABEL_60:
}

- (void)_noteDidUpdateInvitationRecord:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 874, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitationRecord"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectID](v5, "objectID");
    v8 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v7;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);

  }
  if (!-[PLCloudFeedEntriesManager _shouldIgnoreInvitationRecord:](self, "_shouldIgnoreInvitationRecord:", v5))
  {
    -[PLCloudFeedEntriesManager library](self, "library");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "managedObjectContext");
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject invitationState](v5, "invitationState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    PLCloudFeedGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "invitationState=%li", buf, 0xCu);
    }

    -[NSObject cloudGUID](v5, "cloudGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      PLCloudFeedGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "no GUID for invitation record %@", buf, 0xCu);
      }
      goto LABEL_35;
    }
    -[NSObject album](v5, "album");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject cloudGUID](v15, "cloudGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      PLCloudFeedGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v30 = v15;
        v31 = 2112;
        v32 = v5;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "no GUID for album %@ of invitation record %@", buf, 0x16u);
      }
      goto LABEL_34;
    }
    -[PLCloudFeedEntriesManager _invitationAcceptedEntryForInvitationRecord:](self, "_invitationAcceptedEntryForInvitationRecord:", v5);
    v17 = objc_claimAutoreleasedReturnValue();
    PLCloudFeedGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject objectID](v17, "objectID");
      v19 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "invitationAcceptedEntry=%@", buf, 0xCu);

    }
    if (v12 == 2)
    {
      if (!v17)
      {
        -[NSObject inviteeSubscriptionDate](v5, "inviteeSubscriptionDate");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          +[PLCloudFeedEntry entityName](PLCloudFeedEntry, "entityName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v20, (uint64_t)v9, 0);
          v21 = objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
LABEL_34:

LABEL_35:
            goto LABEL_36;
          }
          -[NSObject setEntryTypeNumber:](v21, "setEntryTypeNumber:", &unk_1E3761088);
          -[NSObject setEntryPriorityNumber:](v21, "setEntryPriorityNumber:", &unk_1E3761028);
          -[NSObject setEntryDate:](v21, "setEntryDate:", v17);
          -[NSObject setEntryAlbumGUID:](v21, "setEntryAlbumGUID:", v16);
          -[NSObject setEntryInvitationRecordGUID:](v21, "setEntryInvitationRecordGUID:", v14);
          PLCloudFeedGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v21;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
          }

        }
        else
        {
          v21 = 0;
        }

        v17 = v21;
      }
    }
    else if (v17)
    {
      PLCloudFeedGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject objectID](v17, "objectID");
        v24 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v24;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);

      }
      -[NSObject deleteObject:](v9, "deleteObject:", v17);
    }
    PLCloudFeedGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v26 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectID](v5, "objectID");
      v27 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v26;
      v31 = 2112;
      v32 = v27;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

    }
    goto LABEL_34;
  }
  PLCloudFeedGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "ignoring", buf, 2u);
  }
LABEL_36:

}

- (void)_noteContentDeletionAffectingAssetsEntry:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 934, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "will %@ %@", buf, 0x16u);

  }
  objc_msgSend(v5, "entryAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudFeedEntriesManager _dateForAsset:](self, "_dateForAsset:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && objc_msgSend(v13, "compare:", v11) == -1)
    {
      -[PLCloudFeedEntriesManager _splitEntriesAtDate:](self, "_splitEntriesAtDate:", v14);
      objc_msgSend(v5, "setEntryDate:", v14);
      PLCloudFeedGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v14;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "set date %@ for %@", buf, 0x16u);

      }
      -[PLCloudFeedEntriesManager _mergeEntriesAroundDate:](self, "_mergeEntriesAroundDate:", v11);
    }

  }
  else
  {
    PLCloudFeedGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "objectID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);

    }
    objc_msgSend(v5, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deleteObject:", v5);

    -[PLCloudFeedEntriesManager _mergeEntriesAroundDate:](self, "_mergeEntriesAroundDate:", v11);
  }
  PLCloudFeedGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v21;
    v26 = 2112;
    v27 = v22;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

  }
}

- (void)_noteContentDeletionAffectingCommentsEntry:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudFeedEntriesManager.m"), 965, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);

  }
  objc_msgSend(v5, "entryLikeComments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryComments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commentDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commentDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "laterDate:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v14;
    }
    v16 = v15;
    objc_msgSend(v5, "entryDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && objc_msgSend(v16, "compare:", v17) == -1)
    {
      objc_msgSend(v5, "setEntryDate:", v16);
      PLCloudFeedGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "objectID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v16;
        v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "set date %@ for %@", buf, 0x16u);

      }
    }

  }
  else
  {
    PLCloudFeedGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "objectID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v24;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "delete %@", buf, 0xCu);

    }
    objc_msgSend(v5, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteObject:", v5);
  }

  PLCloudFeedGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v21;
    v28 = 2112;
    v29 = v22;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

  }
}

- (id)_dateForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "cloudServerPublishDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "cloudBatchPublishDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_subscriptionDateForSharedAlbum:(id)a3
{
  return (id)objc_msgSend(a3, "cloudSubscriptionDate");
}

- (BOOL)_wasAssetPublishedBeforeSubscription:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "cloudIsMyAsset") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "cloudBatchPublishDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudShareAlbum");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudFeedEntriesManager _subscriptionDateForSharedAlbum:](self, "_subscriptionDateForSharedAlbum:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v5 = objc_msgSend(v6, "compare:", v8) == -1;
    else
      v5 = 0;

  }
  return v5;
}

- (BOOL)_wasCommentPublishedBeforeSubscription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "commentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cloudShareAlbum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLCloudFeedEntriesManager _subscriptionDateForSharedAlbum:](self, "_subscriptionDateForSharedAlbum:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = objc_msgSend(v5, "compare:", v8) == -1;
  else
    v9 = 0;

  return v9;
}

- (BOOL)_commentIsBatchCaption:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  v3 = a3;
  objc_msgSend(v3, "isBatchComment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "isCaption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      objc_msgSend(v3, "commentClientDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cloudBatchPublishDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "timeIntervalSinceDate:", v11);
      v6 = fabs(v12) < 10.0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_shouldIgnoreAsset:(id)a3
{
  return objc_msgSend(a3, "isDeleted");
}

- (BOOL)_shouldIgnoreComment:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  char v10;

  v4 = a3;
  if (-[PLCloudFeedEntriesManager _commentIsBatchCaption:](self, "_commentIsBatchCaption:", v4))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "isMyComment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cloudIsMyAsset");
    v10 = objc_msgSend(v4, "isLikeBoolValue");
    v5 = 0;
    if ((v7 & 1) == 0 && (v9 & 1) == 0)
      v5 = (v10 & 1) != 0 || (objc_msgSend(v8, "cloudHasCommentsConversation") & 1) == 0;

  }
  return v5;
}

- (BOOL)_shouldIgnoreInvitationRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "album");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOwnedCloudSharedAlbum");

  return v4 ^ 1;
}

- (BOOL)_shouldMergeAsset:(id)a3 intoEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "entryType") == 1)
  {
    objc_msgSend(v7, "entryAssets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v8, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudShareAlbum");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudShareAlbum");
    v13 = objc_claimAutoreleasedReturnValue();
    -[PLCloudFeedEntriesManager _dateForAsset:](self, "_dateForAsset:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudFeedEntriesManager _dateForAsset:](self, "_dateForAsset:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    -[PLCloudFeedEntriesManager _dateForAsset:](self, "_dateForAsset:", v11);
    v10 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v13;
    v29 = v12;
    LODWORD(v13) = objc_msgSend(v12, "isEqual:", v13);
    v16 = objc_msgSend(v6, "cloudHasSameOwnerAsAsset:", v9);
    v27 = (void *)v15;
    v17 = v15;
    v18 = (void *)v10;
    objc_msgSend(v14, "timeIntervalSinceDate:", v17);
    v20 = v19;
    objc_msgSend(v14, "timeIntervalSinceDate:", v10);
    LOBYTE(v10) = 0;
    if ((_DWORD)v13 && v16 && v20 >= -3600.0 && v21 <= 3600.0)
    {
      if ((objc_msgSend(v6, "userCloudSharedLiked") & 1) != 0 || !objc_msgSend(v8, "count"))
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v22 = v8;
        v10 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v10)
        {
          v26 = v11;
          v23 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v31 != v23)
                objc_enumerationMutation(v22);
              if (!objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "userCloudSharedLiked", v26))
              {
                LOBYTE(v10) = 1;
                goto LABEL_23;
              }
            }
            v10 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            if (v10)
              continue;
            break;
          }
LABEL_23:
          v11 = v26;
        }

      }
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)_assetSortingComparator
{
  return (id)objc_msgSend(&__block_literal_global_99715, "copy");
}

- (id)_commentSortingComparator
{
  return (id)objc_msgSend(&__block_literal_global_96_99713, "copy");
}

- (void)_addAsset:(id)a3 toEntry:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLCloudFeedGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "will %@ %@ %@", (uint8_t *)&v23, 0x20u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "mutableEntryAssets");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject count](v13, "count");
    -[PLCloudFeedEntriesManager _assetSortingComparator](self, "_assetSortingComparator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject array](v13, "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v14, 1024, v15);

    -[NSObject insertObject:atIndex:](v13, "insertObject:atIndex:", v7, v17);
    PLCloudFeedGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138412290;
      v24 = v8;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "updated entry=%@", (uint8_t *)&v23, 0xCu);
    }

  }
  else
  {
    PLCloudFeedGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = 138412290;
      v24 = v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "cannot add asset into entry %@", (uint8_t *)&v23, 0xCu);
    }
  }

  PLCloudFeedGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v20;
    v25 = 2112;
    v26 = v21;
    v27 = 2112;
    v28 = v22;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "did %@ %@ %@", (uint8_t *)&v23, 0x20u);

  }
}

- (void)_mergeOlderEntry:(id)a3 intoMoreRecentEntry:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLCloudFeedGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = (uint64_t)v9;
    v27 = 2112;
    v28 = (uint64_t)v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "will %@ %@ %@", (uint8_t *)&v25, 0x20u);

  }
  v12 = objc_msgSend(v6, "entryType");
  v13 = objc_msgSend(v7, "entryType");
  v14 = v13;
  if (v12 == 1 && v13 == 1)
  {
    objc_msgSend(v6, "entryAssets");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mutableEntryAssets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject array](v15, "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSObject count](v15, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertObjects:atIndexes:", v17, v18);

    PLCloudFeedGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "objectID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = (uint64_t)v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "delete %@", (uint8_t *)&v25, 0xCu);

    }
    objc_msgSend(v6, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deleteObject:", v6);

    PLCloudFeedGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v25 = 138412290;
      v26 = (uint64_t)v7;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "merged entry=%@", (uint8_t *)&v25, 0xCu);
    }

  }
  else
  {
    PLCloudFeedGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v25 = 134218240;
      v26 = v12;
      v27 = 2048;
      v28 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "cannot merge entry of type %li into entry of type %li", (uint8_t *)&v25, 0x16u);
    }
  }

  PLCloudFeedGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = (uint64_t)v24;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "did %@", (uint8_t *)&v25, 0xCu);

  }
}

- (void)_splitEntriesAtDate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = (uint64_t)v7;
    v38 = 2112;
    v39 = (uint64_t)v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", buf, 0x16u);

  }
  -[PLCloudFeedEntriesManager _firstEntryOnOrAfterDate:](self, "_firstEntryOnOrAfterDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "entryType") == 1)
  {
    v9 = v8;
    -[NSObject entryAssets](v9, "entryAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __49__PLCloudFeedEntriesManager__splitEntriesAtDate___block_invoke;
    v34[3] = &unk_1E36776B8;
    v34[4] = self;
    v35 = v5;
    v12 = objc_msgSend(v11, "pl_indexOfFirstObjectPassingTest:", v34);

    PLCloudFeedGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134218240;
      v37 = v12;
      v38 = 2048;
      v39 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "splitIndex=%li entryAssetsCout=%lu", buf, 0x16u);
    }

    if (v12 >= 1 && v12 < (unint64_t)objc_msgSend(v10, "count"))
    {
      v29 = a2;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v12);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(v10, "objectsAtIndexes:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "orderedSetWithArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v18;
      objc_msgSend(v18, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudFeedEntriesManager _dateForAsset:](self, "_dateForAsset:", v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cloudShareAlbum");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cloudGUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject mutableEntryAssets](v9, "mutableEntryAssets");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)v15;
      objc_msgSend(v21, "removeObjectsAtIndexes:", v15);
      +[PLCloudFeedAssetsEntry entityName](PLCloudFeedAssetsEntry, "entityName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudFeedEntriesManager library](self, "library");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "managedObjectContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v22, (uint64_t)v24, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {

        goto LABEL_17;
      }
      objc_msgSend(v25, "setEntryTypeNumber:", &unk_1E3761058);
      objc_msgSend(v25, "setEntryPriorityNumber:", &unk_1E3761028);
      objc_msgSend(v25, "setEntryDate:");
      objc_msgSend(v25, "setEntryAssets:", v33);
      objc_msgSend(v25, "setEntryAlbumGUID:");
      PLCloudFeedGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (uint64_t)v25;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "created %@", buf, 0xCu);
      }

      PLCloudFeedGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (uint64_t)v9;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "original entry=%@", buf, 0xCu);
      }

      a2 = v29;
    }

  }
  PLCloudFeedGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = (uint64_t)v28;
    v38 = 2112;
    v39 = (uint64_t)v5;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "did %@ %@", buf, 0x16u);

  }
LABEL_17:

}

- (void)_mergeEntriesAroundDate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = (uint64_t)v7;
    v23 = 2112;
    v24 = (uint64_t)v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "will %@ %@", (uint8_t *)&v21, 0x16u);

  }
  -[PLCloudFeedEntriesManager _firstEntryOnOrBeforeDate:](self, "_firstEntryOnOrBeforeDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudFeedEntriesManager _firstEntryAfterDate:](self, "_firstEntryAfterDate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "entryType");
  v11 = objc_msgSend(v9, "entryType");
  PLCloudFeedGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138413058;
    v22 = (uint64_t)v13;
    v23 = 2048;
    v24 = v10;
    v25 = 2112;
    v26 = v14;
    v27 = 2048;
    v28 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "entryBefore=%@ type=%li entryAfter=%@ type=%li", (uint8_t *)&v21, 0x2Au);

  }
  if (v10 == 1 && v11 == 1)
  {
    objc_msgSend(v9, "entryAssets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PLCloudFeedGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v15, "count");
      v21 = 134217984;
      v22 = v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "entryAfterAssetsCount=%lu", (uint8_t *)&v21, 0xCu);
    }

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PLCloudFeedEntriesManager _shouldMergeAsset:intoEntry:](self, "_shouldMergeAsset:intoEntry:", v18, v8))
        -[PLCloudFeedEntriesManager _mergeOlderEntry:intoMoreRecentEntry:](self, "_mergeOlderEntry:intoMoreRecentEntry:", v8, v9);

    }
  }
  PLCloudFeedGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = (uint64_t)v20;
    v23 = 2112;
    v24 = (uint64_t)v5;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "did %@ %@", (uint8_t *)&v21, 0x16u);

  }
}

- (BOOL)_tryMergingComment:(id)a3 withEntry:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  PLCloudFeedEntriesManager *v43;
  const char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  _BOOL4 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLCloudFeedGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v50 = (uint64_t)v10;
    v51 = 2112;
    v52 = v11;
    v53 = 2112;
    v54 = v12;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "will %@ %@ %@", buf, 0x20u);

  }
  if (objc_msgSend(v8, "entryType") == 2)
  {
    v13 = v8;
    objc_msgSend(v7, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cloudShareAlbum");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cloudGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "entryAlbumGUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    objc_msgSend(v13, "entryComments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    v21 = 0;
    if (!v20 && v18)
    {
      v43 = self;
      v44 = a2;
      objc_msgSend(v7, "commenterHashedPersonID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(v13, "entryLikeComments");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v46 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "commenterHashedPersonID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v28 != v22 && !objc_msgSend(v28, "isEqualToString:", v22))
            {
              v21 = 0;
              goto LABEL_22;
            }

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          if (v25)
            continue;
          break;
        }
      }

      objc_msgSend(v7, "commentDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_alloc(MEMORY[0x1E0C99E10]);
      objc_msgSend(v13, "entryLikeComments");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v30, "initWithOrderedSet:", v31);

      v32 = objc_msgSend(v23, "count");
      -[PLCloudFeedEntriesManager _commentSortingComparator](v43, "_commentSortingComparator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "array");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v32, 1024, v29);

      PLCloudFeedGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v50 = v34;
        _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEBUG, "insertionIndex=%lu", buf, 0xCu);
      }

      objc_msgSend(v23, "insertObject:atIndex:", v7, v34);
      objc_msgSend(v13, "setEntryDate:", v22);
      PLCloudFeedGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v13, "objectID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = (uint64_t)v22;
        v51 = 2112;
        v52 = v37;
        _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEBUG, "set date %@ for %@", buf, 0x16u);

      }
      objc_msgSend(v13, "setEntryCloudAssetGUID:", 0);
      objc_msgSend(v13, "setEntryLikeComments:", v23);
      v21 = 1;
LABEL_22:
      a2 = v44;

    }
  }
  else
  {
    v21 = 0;
  }
  PLCloudFeedGetLog();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v50 = (uint64_t)v39;
    v51 = 2112;
    v52 = v40;
    v53 = 2112;
    v54 = v41;
    v55 = 1024;
    v56 = v21;
    _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEBUG, "did %@ %@ %@ merged=%i", buf, 0x26u);

  }
  return v21;
}

- (PLPhotoLibrary)library
{
  return self->_library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
}

BOOL __49__PLCloudFeedEntriesManager__splitEntriesAtDate___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(a1 + 32), "_dateForAsset:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 40)) == 1;

  return v4;
}

uint64_t __54__PLCloudFeedEntriesManager__commentSortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "commentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __52__PLCloudFeedEntriesManager__assetSortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "cloudBatchPublishDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudBatchPublishDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend(v6, "compare:", v7);
  }
  else
  {
    v9 = v7 != 0;
    if (v6)
    {
      v9 = -1;
      goto LABEL_9;
    }
  }
  if (!v9)
  {
    objc_msgSend(v4, "dateCreated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateCreated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "compare:", v11);

    if (!v9)
    {
      objc_msgSend(v4, "cloudAssetGUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cloudAssetGUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "compare:", v13);

    }
  }
LABEL_9:

  return v9;
}

void __58__PLCloudFeedEntriesManager__noteDidReceiveSharedComment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  PLCloudFeedGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412290;
    v27 = v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "found entry %@", (uint8_t *)&v26, 0xCu);

  }
  objc_msgSend(v6, "entryLikeComments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") && *(_BYTE *)(a1 + 88))
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v9, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  }
  objc_msgSend(v6, "entryComments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") && !*(_BYTE *)(a1 + 88))
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v12, "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v14);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  }
  v15 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (*(_QWORD *)(a1 + 80) - 1 == a3 || v15 != v6)
  {
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 56), "_commentSortingComparator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sortUsingComparator:", v17);
      objc_msgSend(*(id *)(a1 + 40), "sortUsingComparator:", v17);
      objc_msgSend(*(id *)(a1 + 32), "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "commentDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "commentDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v19, "laterDate:", v21);
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = v21;
      }
      v23 = v22;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setEntryDate:", v22);
      PLCloudFeedGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412546;
        v27 = v23;
        v28 = 2112;
        v29 = v25;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "set date %@ for %@", (uint8_t *)&v26, 0x16u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setEntryLikeComments:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setEntryComments:", *(_QWORD *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

    }
  }
  else
  {
    PLCloudFeedGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v26 = 138412290;
      v27 = v6;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "delete %@", (uint8_t *)&v26, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v6);
  }

}

void __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke(uint64_t a1)
{
  double Current;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  CFAbsoluteTime v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  _BYTE v47[14];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  PLCloudFeedGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "start rebuilding entries", buf, 2u);
  }

  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLCloudFeedEntry entityName](PLCloudFeedEntry, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLCloudFeedGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v47 = v9;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "deleting %li entries", buf, 0xCu);
  }

  v10 = *(void **)(a1 + 32);
  v11 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_55;
  v44[3] = &unk_1E36775E8;
  v45 = v10;
  objc_msgSend(v45, "enumerateWithIncrementalSaveUsingObjects:shouldRefreshAfterSave:withBlock:", v7, 1, v44);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    PLCloudFeedGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v47 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "failed to delete feed entries with error: %@", buf, 0xCu);
    }

    goto LABEL_21;
  }

  v15 = (void *)MEMORY[0x1E0C97B48];
  +[PLCloudSharedAlbum entityName](PLCloudSharedAlbum, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchRequestWithEntityName:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLCloudFeedGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v47 = v18;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "rebuilding from %li shared albums", buf, 0xCu);
  }

  v43[0] = v11;
  v43[1] = 3221225472;
  v43[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_57;
  v43[3] = &unk_1E36775E8;
  v19 = *(void **)(a1 + 32);
  v43[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v19, "enumerateWithIncrementalSaveUsingObjects:shouldRefreshAfterSave:withBlock:", v7, 1, v43);
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    PLCloudFeedGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v47 = v21;
      v23 = "failed to rebuild albums with error: %@";
LABEL_19:
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
      goto LABEL_20;
    }
    goto LABEL_20;
  }

  v24 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchRequestWithEntityName:", v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v26);

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLCloudFeedGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v47 = v28;
    _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "rebuilding from %li shared assets", buf, 0xCu);
  }

  v42[0] = v11;
  v42[1] = 3221225472;
  v42[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_59;
  v42[3] = &unk_1E36775E8;
  v29 = *(void **)(a1 + 32);
  v42[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v29, "enumerateWithIncrementalSaveUsingObjects:shouldRefreshAfterSave:withBlock:", v7, 1, v42);
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v21 = (void *)v30;
    PLCloudFeedGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v47 = v21;
      v23 = "failed to rebuild assets with error: %@";
      goto LABEL_19;
    }
LABEL_20:

LABEL_21:
    v31 = 0;
    goto LABEL_22;
  }

  v34 = (void *)MEMORY[0x1E0C97B48];
  +[PLCloudSharedAlbumInvitationRecord entityName](PLCloudSharedAlbumInvitationRecord, "entityName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "fetchRequestWithEntityName:", v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLCloudFeedGetLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v47 = v37;
    _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "rebuilding from %li invitations assets", buf, 0xCu);
  }

  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_60;
  v41[3] = &unk_1E36775E8;
  v38 = *(void **)(a1 + 32);
  v41[4] = *(_QWORD *)(a1 + 40);
  v31 = 1;
  objc_msgSend(v38, "enumerateWithIncrementalSaveUsingObjects:shouldRefreshAfterSave:withBlock:", v7, 1, v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    PLCloudFeedGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v47 = v39;
      _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "failed to rebuild invitations with error: %@", buf, 0xCu);
    }

    v31 = 0;
  }

LABEL_22:
  PLCloudFeedGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v47 = v31;
    *(_WORD *)&v47[4] = 2048;
    *(double *)&v47[6] = v33 - Current;
    _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "finished rebuilding entries (success=%i, time=%fs)", buf, 0x12u);
  }

}

uint64_t __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_55(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

uint64_t __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_57(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteDidUpdateSharedAlbum:", a2);
}

void __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_59(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_noteDidReceiveSharedAsset:", v4);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "likeComments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_noteDidReceiveSharedComments:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "cloudComments");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_noteDidReceiveSharedComments:", v8);
}

uint64_t __47__PLCloudFeedEntriesManager_rebuildAllEntries___block_invoke_60(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteDidUpdateInvitationRecord:", a2);
}

void __148__PLCloudFeedEntriesManager_processAlbumUpdates_assetInserts_assetUpdates_commentInserts_invitationRecordUpdates_deletionEntries_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  void *v54;
  NSObject *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "count"))
  {
    v2 = (void *)MEMORY[0x1E0C97B48];
    +[PLCloudSharedAlbum entityName](PLCloudSharedAlbum, "entityName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), a1[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v5);

    objc_msgSend(a1[5], "executeFetchRequest:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v74 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1[6], "_noteDidUpdateSharedAlbum:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      }
      while (v8);
    }

  }
  if (objc_msgSend(a1[7], "count"))
  {
    v11 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), a1[7]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v14);

    objc_msgSend(a1[5], "executeFetchRequest:error:", v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v70 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(a1[6], "_noteDidReceiveSharedAsset:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      }
      while (v17);
    }

  }
  if (objc_msgSend(a1[8], "count"))
  {
    v20 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fetchRequestWithEntityName:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), a1[8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPredicate:", v23);

    objc_msgSend(a1[5], "executeFetchRequest:error:", v22, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v66 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
          objc_msgSend(v29, "cloudFeedAssetsEntry");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
            objc_msgSend(a1[6], "_noteDidReceiveSharedAsset:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      }
      while (v26);
    }

  }
  if (objc_msgSend(a1[9], "count"))
  {
    v31 = (void *)MEMORY[0x1E0C97B48];
    +[PLCloudSharedComment entityName](PLCloudSharedComment, "entityName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fetchRequestWithEntityName:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), a1[9]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setPredicate:", v34);

    objc_msgSend(a1[5], "executeFetchRequest:error:", v33, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "_noteDidReceiveSharedComments:", v35);

  }
  if (objc_msgSend(a1[10], "count"))
  {
    v36 = (void *)MEMORY[0x1E0C97B48];
    +[PLCloudSharedAlbumInvitationRecord entityName](PLCloudSharedAlbumInvitationRecord, "entityName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "fetchRequestWithEntityName:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), a1[10]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPredicate:", v39);

    objc_msgSend(a1[5], "executeFetchRequest:error:", v38, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v62;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v62 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(a1[6], "_noteDidUpdateInvitationRecord:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * m));
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
      }
      while (v42);
    }

  }
  if (objc_msgSend(a1[11], "count"))
  {
    v45 = (void *)MEMORY[0x1E0C97B48];
    +[PLCloudFeedEntry entityName](PLCloudFeedEntry, "entityName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "fetchRequestWithEntityName:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), a1[11]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setPredicate:", v48);

    v56 = v47;
    objc_msgSend(a1[5], "executeFetchRequest:error:", v47, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v58;
      do
      {
        for (n = 0; n != v51; ++n)
        {
          if (*(_QWORD *)v58 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * n);
          switch(objc_msgSend(v54, "entryType"))
          {
            case 0:
              PLCloudFeedGetLog();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v54;
                _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_ERROR, "invalid type for entry %@", buf, 0xCu);
              }

              break;
            case 1:
              objc_msgSend(a1[6], "_noteContentDeletionAffectingAssetsEntry:", v54);
              break;
            case 2:
              objc_msgSend(a1[6], "_noteContentDeletionAffectingCommentsEntry:", v54);
              break;
            case 3:
              objc_msgSend(a1[6], "_noteContentDeletionAffectingInvitationEntry:", v54);
              break;
            case 4:
              objc_msgSend(a1[6], "_noteContentDeletionAffectingSubscriptionEntry:", v54);
              break;
            case 5:
            case 6:
              objc_msgSend(a1[6], "_noteContentDeletionAffectingInvitationResponseEntry:", v54);
              break;
            case 7:
              objc_msgSend(a1[6], "_noteContentDeletionAffectingAlbumCreatedEntry:", v54);
              break;
            default:
              continue;
          }
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
      }
      while (v51);
    }

  }
}

@end

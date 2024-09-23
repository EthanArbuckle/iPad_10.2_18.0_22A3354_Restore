@implementation PLSpotlightReindexing

+ (id)deleteFile
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_searchDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_deleteFileInDirectoryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)recordReindexAllItemsForBundleID:(id)a3 reindexReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_searchDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_recordReindexAllItemsForBundleID:directoryURL:reindexReason:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)recordReindexIdentifiersWithIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_searchDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_recordReindexIdentifiersWithIdentifiers:bundleID:directoryURL:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)shouldReindexAllItemsForLibraryIdentifier:(int64_t)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3 == 3
    || +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:"))
  {
    return 0;
  }
  objc_msgSend(a1, "_searchDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mutableReindexingDictionaryInDirectoryURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isSuccess"))
  {
    objc_msgSend(v6, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLReindexAllEntries"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)spotlightReasonForReindexingAllItemsForLibraryIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_searchDirectoryURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mutableReindexingDictionaryInDirectoryURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isSuccess") & 1) != 0)
  {
    objc_msgSend(v5, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLReindexAllEntriesReason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLSearchBackendIndexRebuildGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Failed to read Spotlight's reason for reindexing all items: %@", (uint8_t *)&v11, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

+ (id)reindexIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "_searchDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mutableReindexingDictionaryInDirectoryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isFailure"))
  {
    v5 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failureWithError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLReindexIdentifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v8;
    else
      v9 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)eraseReindexIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_searchDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mutableReindexingDictionaryInDirectoryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isFailure"))
  {
    v5 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failureWithError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("PLReindexIdentifiers"));
    objc_msgSend(a1, "_searchDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_writeReindexingDictionary:toDirectoryURL:", v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (void)drainSpotlightReindexIdentifiersIfNeededForLibrary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier");

  if (v5 != 3
    && !+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", v5))
  {
    +[PLSpotlightReindexing reindexIdentifiers](PLSpotlightReindexing, "reindexIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isFailure"))
    {
      PLSearchBackendDonationsGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "error");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to load spotlight reindex identifiers with error: %@", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v6, "result");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __76__PLSpotlightReindexing_drainSpotlightReindexIdentifiersIfNeededForLibrary___block_invoke;
        v15 = &unk_1E3677C18;
        v16 = v6;
        v17 = v3;
        objc_msgSend(v17, "performTransactionAndWait:", &v12);
        v11 = +[PLSpotlightReindexing eraseReindexIdentifiers](PLSpotlightReindexing, "eraseReindexIdentifiers", v12, v13, v14, v15);

      }
    }

  }
}

+ (id)_searchDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryURLForIdentifier:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lookupOrCreateBundleForLibraryURL:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchIndexDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_deleteFileInDirectoryURL:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("spotlightProgress.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v11);
  v6 = v11;

  if ((v5 & 1) != 0 || PLIsErrorFileNotFound())
  {
    v7 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "successWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_recordReindexAllItemsForBundleID:(id)a3 directoryURL:(id)a4 reindexReason:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t *v10;
  const __CFString **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v18[0] = CFSTR("PLReindexAllEntries");
    v18[1] = CFSTR("PLReindexAllEntriesReason");
    v19[0] = MEMORY[0x1E0C9AAB0];
    v19[1] = v7;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = v19;
    v11 = (const __CFString **)v18;
    v12 = 2;
  }
  else
  {
    v16 = CFSTR("PLReindexAllEntries");
    v17 = MEMORY[0x1E0C9AAB0];
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = &v17;
    v11 = &v16;
    v12 = 1;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_writeReindexingDictionary:toDirectoryURL:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_recordReindexIdentifiersWithIdentifiers:(id)a3 bundleID:(id)a4 directoryURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a1, "_mutableReindexingDictionaryInDirectoryURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isFailure"))
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v9, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLReindexAllEntries"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0D732B8];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "successWithResult:", v15);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLReindexIdentifiers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v17 = v16;
      if (v15)
        objc_msgSend(v16, "addObjectsFromArray:", v15);
      objc_msgSend(v17, "addObjectsFromArray:", v7);
      objc_msgSend(v17, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("PLReindexIdentifiers"));

      objc_msgSend(a1, "_writeReindexingDictionary:toDirectoryURL:", v11, v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

+ (id)_mutableReindexingDictionaryInDirectoryURL:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v9;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("spotlightProgress.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfURL:error:", v3, &v9);
  v5 = v9;
  if (PLIsErrorFileNotFound())
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    v4 = v6;
  }
  if (v4)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v4);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_writeReindexingDictionary:(id)a3 toDirectoryURL:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  id v20;

  v5 = a4;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (v6)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("spotlightProgress.plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v10 = objc_msgSend(v9, "removeItemAtURL:error:", v8, &v19);
    v11 = v19;

    if ((v10 & 1) != 0 || (PLIsErrorFileNotFound() & 1) != 0)
    {
      v18 = 0;
      v12 = objc_msgSend(v6, "writeToURL:options:error:", v8, 1073741825, &v18);
      v13 = v18;
      v14 = (void *)MEMORY[0x1E0D732B8];
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "successWithResult:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __76__PLSpotlightReindexing_drainSpotlightReindexIdentifiersIfNeededForLibrary___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PLSearchBackendDonationsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "Adding jobs for reindexing identifiers for Spotlight reindex request: %@", buf, 0xCu);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "result", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v9, 236, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

@end

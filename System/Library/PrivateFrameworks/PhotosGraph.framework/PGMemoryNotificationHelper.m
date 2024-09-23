@implementation PGMemoryNotificationHelper

+ (id)nextPossibleNotificationDateWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_memoryFetchOptionsWithPhotoLibrary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setChunkSizeForFetch:", 100);
  objc_msgSend(v6, "setCacheSizeForFetch:", objc_msgSend(v6, "chunkSizeForFetch"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("category"), 401);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v6);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
      if (objc_msgSend(v13, "category") != 101)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v13, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_13;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("PGManagerNotificationUserDefaultsDateOfFirstTimeUsage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("PGManagerNotificationUserDefaultsDateOfFirstTimeUsage"));
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isDateInWeekend:", v16))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "Memories Notification generated over the weekend, special time interval between notification applied.", buf, 2u);
    }

    v19 = 259200.0;
  }
  else
  {
    v19 = 518400.0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("PGManagerNotificationUserDefaultsRegularTimeIntervalBeforeNotifying"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "doubleValue");
    v19 = v22;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = v8;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v24)
  {
    v25 = v24;
    v35 = v4;
    v26 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "notificationState") == 1)
        {
          objc_msgSend(v5, "objectForKey:", CFSTR("PGManagerNotificationUserDefaultsExtendedTimeIntervalBeforeNotifying"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28)
          {
            objc_msgSend(v28, "doubleValue");
            v19 = v30;
          }
          else
          {
            v19 = 2592000.0;
          }
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "loggingConnection");
          v32 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "Extending notification time interval because one or more memories are still in the state PHMemoryNotificationStateRequested", buf, 2u);
          }

          goto LABEL_35;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      if (v25)
        continue;
      break;
    }
LABEL_35:
    v4 = v35;
  }

  objc_msgSend(v14, "dateByAddingTimeInterval:", v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)lastTriggeredNotificationDateWithPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_memoryFetchOptionsWithPhotoLibrary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(v3, "setChunkSizeForFetch:", 100);
  objc_msgSend(v3, "setCacheSizeForFetch:", objc_msgSend(v3, "chunkSizeForFetch"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %d"), CFSTR("notificationState"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)memoriesOfTheDayAreWorthNotifyingWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startOfDayForDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_memoryFetchOptionsWithPhotoLibrary:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d && (%K >= %@) && (%K <= %@)"), CFSTR("category"), 401, CFSTR("creationDate"), v7, CFSTR("creationDate"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v8);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isGreat") & 1) != 0
          || (objc_msgSend(v15, "isStellar") & 1) != 0
          || (objc_msgSend(v15, "isMustSee") & 1) != 0)
        {
          v16 = 1;
          goto LABEL_14;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v16 = 0;
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_14:

  return v16;
}

+ (id)_memoryFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v6);

  objc_msgSend(v3, "setIncludePendingMemories:", 0);
  objc_msgSend(v3, "setIncludeRejectedMemories:", 1);
  return v3;
}

@end

@implementation PLLibraryScope

+ (id)predicateToExcludeExitingLibraryScopes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("exitState"), 0);
}

+ (id)predicateForActiveLibraryScope
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("scopeSyncingState"), 1, CFSTR("scopeSyncingState"), 2);
}

+ (id)predicateForPreviewLibraryScope
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("previewState"), 1);
}

+ (id)_libraryForEnumerationFromBundle:(id)a3 withName:(const char *)a4
{
  id v5;
  PLPhotoLibraryOptions *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setRequiredState:](v6, "setRequiredState:", 6);
  -[PLPhotoLibraryOptions setRefreshesAfterSave:](v6, "setRefreshesAfterSave:", 0);
  -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v6, "setAutomaticallyPinToFirstFetch:", 0);
  v11 = 0;
  v7 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", a4, v5, v6, &v11);

  v8 = v11;
  if (!v7)
  {
    PLBackendSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error creating context for library enumeration: %@", buf, 0xCu);
    }

  }
  return v7;
}

+ (id)createOwnedShareWithUUID:(id)a3 creationDate:(id)a4 title:(id)a5 unitTestMode:(BOOL)a6 inPhotoLibrary:(id)a7
{
  _BOOL8 v7;
  id v11;
  void *v12;
  objc_super v14;

  v7 = a6;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___PLLibraryScope;
  v11 = a7;
  objc_msgSendSuper2(&v14, sel_createOwnedShareWithUUID_creationDate_title_inPhotoLibrary_, a3, a4, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScopeType:", 4, v14.receiver, v14.super_class);
  objc_msgSend(v12, "setPublicPermission:", 1);
  objc_msgSend(v12, "_insertOwnedParticipantInLibrary:unitTestMode:", v11, v7);

  return v12;
}

+ (id)activeLibraryScopeInManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithShort:", objc_msgSend((id)objc_opt_class(), "activeSyncingStateToUse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("scopeSyncingState"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v8, 1, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (signed)activeSyncingStateToUse
{
  if (_os_feature_enabled_impl())
    return 2;
  else
    return 1;
}

+ (BOOL)libraryScopeScopeIdentifierWasCreatedInLocalOnlyMode:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "localOnlySharedSyncScopeIdentifierPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPrefix:", v5);

  return v6;
}

+ (signed)participationStateFromLibraryScope:(id)a3
{
  return a3 != 0;
}

+ (id)localOnlySharedSyncScopeIdentifierPrefix
{
  return CFSTR("LocalOnlySharedSync-");
}

+ (id)scopeIdentifierPrefix
{
  __CFString *v3;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(a1, "localOnlySharedSyncScopeIdentifierPrefix");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("SharedSync-");
  }
  return v3;
}

+ (id)entityName
{
  return CFSTR("LibraryScope");
}

+ (void)updateLibraryScopeActiveDefaultsWithManagedObjectContext:(id)a3
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  objc_msgSend(a1, "activeLibraryScopeInManagedObjectContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDeleted") & 1) != 0 || !objc_msgSend(v3, "libraryScopeIsActive"))
  {
    CFPreferencesSetAppValue(CFSTR("PhotosSharedLibrarySyncingIsActive"), 0, CFSTR("com.apple.mobileslideshow"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 0;
      v5 = "Removing PhotosSharedLibrarySyncingIsActive user default";
      v6 = (uint8_t *)&v7;
      goto LABEL_7;
    }
  }
  else
  {
    CFPreferencesSetAppValue(CFSTR("PhotosSharedLibrarySyncingIsActive"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.mobileslideshow"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 0;
      v5 = "Writing PhotosSharedLibrarySyncingIsActive user default";
      v6 = (uint8_t *)&v8;
LABEL_7:
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }

}

+ (BOOL)libraryScopeIsActiveWithScopeSyncingState:(signed __int16)a3
{
  return (unsigned __int16)a3 - 1 < 2;
}

+ (unint64_t)_immediateNotificationAssetThresholdToUseWithPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudPhotoLibraryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cplConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForKey:", CFSTR("feature.version.sharedlibrarytrashnotificationassetthreshold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    PLBackendSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Custom immediateNotificationAssetThresholdPreflight set: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    v8 = 50;
  }

  return v8;
}

+ (BOOL)_preflightChecksForFiringParticipantAssetTrashNotificationWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  id v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  double v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((PLIsSharedLibraryAssetTrashedByParticipantsNotificationEnabled() & 1) != 0
    || (objc_msgSend(v4, "isUnitTesting") & 1) != 0)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(v4, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeLibraryScopeInManagedObjectContext:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      PLBackendSharingGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight failed: No active LibraryScope", buf, 2u);
      }
      v17 = 0;
      goto LABEL_42;
    }
    -[NSObject currentUserParticipant](v7, "currentUserParticipant");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSObject lastParticipantAssetTrashNotificationDate](v7, "lastParticipantAssetTrashNotificationDate");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v9;
        v29 = 0;
        v30 = 0;
        v28 = 0;
        v11 = objc_msgSend(a1, "_immediateNotificationAssetThresholdToUseWithPhotoLibrary:", v4);
        v12 = (id)objc_msgSend(a1, "_computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope:outPhotoCount:outVideoCount:outItemCount:", v7, &v30, &v29, &v28);
        if (v29 + v30 + v28 >= v11)
        {
          PLBackendSharingGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          v17 = 1;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v32 = v29 + v30 + v28;
            v33 = 2048;
            v34 = v11;
            _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight passed: Based on high asset trash count: %lu, threshold: %lu", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "integerForKey:", CFSTR("PLLibraryScopeAssetTrashNotificationThreshold"));

          if (v14)
          {
            PLBackendSharingGetLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v32 = v14;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Custom PLLibraryScopeAssetTrashNotificationThreshold set: %lu seconds", buf, 0xCu);
            }

            v16 = (double)v14;
          }
          else
          {
            v16 = 604800.0;
          }
          v22 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v22, "initWithTimeInterval:sinceDate:", v23, -v16);

          if (-[NSObject compare:](v10, "compare:", v21) == 1)
          {
            PLBackendSharingGetLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v32 = (unint64_t)v10;
              _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight failed: lastNotificationDate is within threshold: %@", buf, 0xCu);
            }
            v17 = 0;
          }
          else
          {
            -[NSObject lastParticipantAssetTrashNotificationViewedDate](v7, "lastParticipantAssetTrashNotificationViewedDate");
            v25 = objc_claimAutoreleasedReturnValue();
            v24 = v25;
            if (v25
              && -[NSObject compare:](v25, "compare:", v10) != -1
              && -[NSObject compare:](v24, "compare:", v21) == 1)
            {
              PLBackendSharingGetLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v32 = (unint64_t)v24;
                _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight failed: lastNotificationViewedDate is within threshold: %@", buf, 0xCu);
              }
              v17 = 0;
            }
            else
            {
              PLBackendSharingGetLog();
              v26 = objc_claimAutoreleasedReturnValue();
              v17 = 1;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight passed: Reach end of preflight checks", buf, 2u);
              }
            }

          }
        }

        goto LABEL_41;
      }
      PLBackendSharingGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[NSObject compactDescription](v7, "compactDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = (unint64_t)v20;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "PostParticipantAssetTrashNotification: Preflight failed: Active LibraryScope has nil lastParticipantAssetTrashNotificationDate: %@", buf, 0xCu);

      }
      -[NSObject startTrackingParticipantAssetTrashStateIfNeeded](v7, "startTrackingParticipantAssetTrashStateIfNeeded");
      v10 = 0;
    }
    else
    {
      PLBackendSharingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[NSObject compactDescription](v7, "compactDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = (unint64_t)v18;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "PostParticipantAssetTrashNotification: Preflight failed: Active LibraryScope has no current user: %@", buf, 0xCu);

      }
    }
    v17 = 0;
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  PLBackendSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight failed: Setting is disabled", buf, 2u);
  }
  v17 = 0;
LABEL_43:

  return v17;
}

+ (id)_computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope:(id)a3 outPhotoCount:(unint64_t *)a4 outVideoCount:(unint64_t *)a5 outItemCount:(unint64_t *)a6
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _QWORD v47[7];

  v47[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "currentUserParticipant");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastParticipantAssetTrashNotificationDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateToIncludeOnlyContentContributedByCurrentUser](PLManagedAsset, "predicateToIncludeOnlyContentContributedByCurrentUser");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trashedState"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("trashedDate"), v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("trashedByParticipant"), v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v47[0] = v25;
  v47[1] = v7;
  v47[2] = v8;
  v47[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setPredicate:", v12);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_msgSend(v6, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __157__PLLibraryScope__computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope_outPhotoCount_outVideoCount_outItemCount___block_invoke;
  v28[3] = &unk_1E3661FE0;
  v28[4] = &v37;
  v28[5] = &v33;
  v28[6] = &v29;
  objc_msgSend(v16, "enumerateObjectsFromFetchRequest:usingDefaultBatchSizeWithBlock:", v15, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    PLBackendSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "compactDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v17;
      v43 = 2112;
      v44 = v19;
      v45 = 2112;
      v46 = v12;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "PostParticipantAssetTrashNotification: Fetch failed: %@ libraryScope %@, Predicate %@", buf, 0x20u);

    }
  }
  else
  {
    PLBackendSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "compactDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = v20;
      v43 = 2112;
      v44 = v12;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: LibraryScope %@, Predicate %@", buf, 0x16u);

    }
  }

  if (a4)
    *a4 = v38[3];
  if (a5)
    *a5 = v34[3];
  if (a6)
    *a6 = v30[3];
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v17;
}

+ (id)fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:(id)a3 forceNotification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4
    || (objc_msgSend(a1, "_preflightChecksForFiringParticipantAssetTrashNotificationWithPhotoLibrary:", v6) & 1) != 0)
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(v6, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeLibraryScopeInManagedObjectContext:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v32 = 0;
    v33 = 0;
    v31 = 0;
    objc_msgSend(a1, "_computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope:outPhotoCount:outVideoCount:outItemCount:", v9, &v33, &v32, &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "localizedDescription");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!&v33[v32 + v31])
      {
        PLBackendSharingGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          -[NSObject compactDescription](v9, "compactDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = (uint64_t)v14;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Ran fetch and there were 0 assets to notify user: %@", buf, 0xCu);

        }
        v15 = CFSTR("Ran fetch and there were 0 assets to notify user");
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerForKey:", CFSTR("PLLibraryScopeAssetTrashNotificationPostingHour"));

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerForKey:", CFSTR("PLLibraryScopeAssetTrashNotificationPostingMinute"));

        objc_msgSend(a1, "_nearestDateSetToHour:minute:", v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PLBackendSharingGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v35 = v17;
          v36 = 2048;
          v37 = v19;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Custom PLLibraryScopeAssetTrashNotificationPostingHour set: %lu hour, %lu minute", buf, 0x16u);
        }

      }
      else
      {
        objc_msgSend(a1, "_nearestDateSetToHour:minute:", 9, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v22;
      }
      +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:videoCount:itemCount:withNotificationDeliveryDate:", v33, v32, v31, v20);

      PLBackendSharingGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v26 = v32;
        v25 = (uint64_t)v33;
        v27 = v31;
        -[NSObject compactDescription](v9, "compactDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v35 = v25;
        v36 = 2048;
        v37 = v26;
        v38 = 2048;
        v39 = v27;
        v40 = 2112;
        v41 = v20;
        v42 = 2112;
        v43 = v28;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Ran fetch and posted notification about %lu photos %lu videos %lu items to notify user. Notification to be posted at %@: %@", buf, 0x34u);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLastParticipantAssetTrashNotificationDate:](v9, "setLastParticipantAssetTrashNotificationDate:", v29);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ran fetch and posted notification about %lu photos %lu videos %lu items to notify user"), v33, v32, v31);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (__CFString *)v12;
LABEL_23:

    goto LABEL_24;
  }
  PLBackendSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight checks failed", buf, 2u);
  }
  v15 = CFSTR("Preflight checks failed");
LABEL_24:

  return v15;
}

+ (id)_nearestDateSetToHour:(int64_t)a3 minute:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", -1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHour:", a3);
  objc_msgSend(v8, "setMinute:", a4);
  objc_msgSend(v8, "setSecond:", 0);
  objc_msgSend(v7, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "compare:", v9) == -1)
  {
    v11 = v9;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v10, "setDay:", 1);
    objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v10, v9, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (BOOL)supportsCPLScopeType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

+ (BOOL)shouldAllowFetchURLWithScopeChange:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  BOOL v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (_os_feature_enabled_impl())
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D11268];
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("Unable to fetch shares from URL while in GoldilocksLocalMode");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = (const __CFString **)v32;
    v13 = &v31;
LABEL_7:
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    v18 = v10;
    v19 = 33;
    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "isCloudPhotoLibraryEnabled") & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D11268];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("iCloud Photo Library is not enabled");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v30;
    v13 = &v29;
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "scopeType") == 4)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D74498];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Not allowed to url fetch owned LibraryScopes");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v18 = v15;
    v19 = 81001;
  }
  else
  {
    if (+[PLShareParticipant isCurrentUserInScopeChange:](PLShareParticipant, "isCurrentUserInScopeChange:", v7))
    {
      v21 = 1;
      goto LABEL_11;
    }
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D74498];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("Unable to fetch shares from URL while not a participant.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 81003;
    v17 = v23;
    v18 = v24;
  }
LABEL_8:
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v16);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v20 = objc_retainAutorelease(v20);
    *a5 = v20;
  }

  v21 = 0;
LABEL_11:

  return v21;
}

+ (id)insertOrUpdateShareWithCPLScopeChange:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  unint64_t v46;
  char v47;
  unsigned __int16 v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v56;
  uint64_t v57;
  _BOOL4 v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[7];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  int v70;
  uint8_t v71[4];
  _BYTE v72[14];
  __int16 v73;
  void *v74;
  _BYTE buf[24];
  int v76;
  const __CFString *v77;
  uint64_t v78;
  const __CFString *v79;
  _QWORD v80[4];

  v80[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    objc_msgSend(v6, "scopeIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:", v8, 1, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "_libraryScopeWasCreatedInLocalOnlyMode"))
    {
      PLBackendSharingGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "debugDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "+[PLLibraryScope insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:]";
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring %@ in %s since it was created in local only mode", buf, 0x16u);

      }
      v9 = 0;
    }
    else
    {
      if (!objc_msgSend(a1, "validateCPLScopeChange:", v6))
      {
        v9 = 0;
LABEL_80:

        goto LABEL_81;
      }
      if (!v11)
      {
        PLBackendSharingGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v8;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Creating library scope share with scope identifier %@", buf, 0xCu);
        }

        objc_msgSend(a1, "insertInPhotoLibrary:", v7);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setStatus:", 2);
        objc_msgSend(v11, "setScopeIdentifier:", v8);
      }
      PLBackendSharingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Updating library scope %@ with CPLlibraryScopeScopeChange %@", buf, 0x16u);

      }
      v17 = objc_msgSend(v6, "scopeType");
      switch(v17)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 6:
          PLBackendSharingGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v6;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Unexpected scopeType for library scope from scopeChange %@", buf, 0xCu);
          }

          goto LABEL_20;
        case 4:
        case 5:
          v19 = 2;
          break;
        default:
LABEL_20:
          v19 = 0;
          break;
      }
      objc_msgSend(v11, "setScopeType:", v17);
      objc_msgSend(v11, "setLocalPublishState:", v19);
      v20 = objc_msgSend(v6, "isActivated");
      v21 = objc_msgSend(v11, "scopeSyncingState");
      if (v20)
      {
        if (v21 != 1)
        {
          objc_msgSend(v11, "setScopeSyncingState:", 1);
          objc_msgSend(v11, "untrash");
          if (PLShouldLogRegisteredEvent())
          {
            v79 = CFSTR("PhotoSharingEnabled");
            v80[0] = MEMORY[0x1E0C9AAB0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
            PLLogRegisteredEvent();
          }
        }
        objc_msgSend(v11, "setPreviewState:", 0);
        objc_msgSend(v11, "startTrackingParticipantAssetTrashStateIfNeeded");
      }
      else
      {
        if (v21)
        {
          objc_msgSend(v11, "setScopeSyncingState:", 0);
          if (PLShouldLogRegisteredEvent())
          {
            v77 = CFSTR("PhotoSharingEnabled");
            v78 = MEMORY[0x1E0C9AAA0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
            PLLogRegisteredEvent();
          }
        }
        objc_msgSend(v11, "stopTrackingParticipantAssetTrashedStateIfNeeded");
      }
      objc_msgSend(v6, "assetCountPerType");
      v12 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v76 = 0;
      v67 = 0;
      v68 = &v67;
      v69 = 0x2020000000;
      v70 = 0;
      v63 = 0;
      v64 = &v63;
      v65 = 0x2020000000;
      v66 = 0;
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __71__PLLibraryScope_insertOrUpdateShareWithCPLScopeChange_inPhotoLibrary___block_invoke;
      v62[3] = &unk_1E3662058;
      v62[4] = buf;
      v62[5] = &v67;
      v62[6] = &v63;
      -[NSObject enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", v62);
      objc_msgSend(v11, "setCloudPhotoCount:", *(unsigned int *)(*(_QWORD *)&buf[8] + 24));
      objc_msgSend(v11, "setCloudVideoCount:", *((unsigned int *)v68 + 6));
      objc_msgSend(v11, "setCloudItemCount:", *((unsigned int *)v64 + 6));
      objc_msgSend(v6, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v22);

      objc_msgSend(v6, "share");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v11, "updateShareWithCPLShare:inPhotoLibrary:", v23, v7);
        objc_msgSend(v23, "creationDate");
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCreationDate:", v24);
      }
      else
      {
        PLBackendSharingGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v71 = 138412290;
          *(_QWORD *)v72 = v6;
          _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "CPLShare missing on scopeChange %@", v71, 0xCu);
        }
      }

      v25 = v6;
      if (objc_msgSend(MEMORY[0x1E0D113A8], "serverSupportsLibraryShareSettingsRecordSyncing"))
      {
        objc_msgSend(v25, "userDefinedRules");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        if (!v27)
        {
          objc_msgSend(v25, "userDefinedRules");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "updateRulesDataWithCloudSyncableRulesData:", v28);

        }
      }
      if (objc_msgSend(MEMORY[0x1E0D113A8], "serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing"))
      {
        objc_msgSend(v25, "userViewedParticipantTrashNotificationDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29 == 0;

        if (!v30)
        {
          objc_msgSend(v11, "lastParticipantAssetTrashNotificationViewedDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "userViewedParticipantTrashNotificationDate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "isEqualToDate:", v32);

          if ((v33 & 1) == 0)
          {
            objc_msgSend(v25, "userViewedParticipantTrashNotificationDate");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setLastParticipantAssetTrashNotificationViewedDate:", v34);

            objc_msgSend(v25, "userViewedParticipantTrashNotificationDate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setLastParticipantAssetTrashNotificationDate:", v35);

            objc_msgSend(v11, "lastParticipantAssetTrashNotificationViewedDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "lastParticipantAssetTrashNotificationDate");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v36, "compare:", v37) == -1;

            if (!v38)
            {
              +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "removeNotificationForSharedLibraryParticipantAssetTrash");

            }
          }
        }
      }
      if (objc_msgSend(v25, "isActivated"))
      {
        v40 = objc_msgSend(v25, "exitState");
        if (v40 == 2)
          v41 = 2;
        else
          v41 = v40 == 1;
        objc_msgSend(v11, "setExitState:", v41);
        v42 = objc_msgSend(v25, "exitSource");
        v43 = 0;
        if (v42 > 2)
        {
          if (v42 == 3)
          {
            v43 = 3;
          }
          else if (v42 == 1000)
          {
            v43 = 1000;
          }
        }
        else if (v42 == 1)
        {
          v43 = 1;
        }
        else if (v42 == 2)
        {
          v43 = 2;
        }
        objc_msgSend(v11, "setExitSource:", v43);
      }
      if (objc_msgSend(v25, "areSomeUsersExiting"))
      {
        +[PLShareParticipant participantsWithScope:inPhotoLibrary:](PLShareParticipant, "participantsWithScope:inPhotoLibrary:", v11, v7);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __71__PLLibraryScope_insertOrUpdateShareWithCPLScopeChange_inPhotoLibrary___block_invoke_171;
        v60[3] = &unk_1E3662080;
        v61 = v25;
        objc_msgSend(v44, "enumerateObjectsUsingBlock:", v60);

      }
      if (objc_msgSend(v11, "scopeType") == 5 && objc_msgSend(v11, "exitState") == 2)
      {
        PLBackendSharingGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v71 = 138412290;
          *(_QWORD *)v72 = v25;
          _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_INFO, "Exiting accepted scope with scope change: %@", v71, 0xCu);
        }

        v46 = objc_msgSend(v25, "exitType");
        v47 = v46;
        v58 = v46 > 3;
        if (v46 <= 3)
          v48 = v46;
        else
          v48 = 0;
        v49 = v48;
        v50 = (__int16)v48;
        if (v49 != (unsigned __int16)objc_msgSend(v11, "exitType")
          && objc_msgSend(v11, "exitSource") != 2)
        {
          v57 = objc_msgSend(v25, "exitRetentionPolicy");
          if (((v58 | (3u >> (v47 & 0xF))) & 1) == 0)
          {
            objc_msgSend(v11, "owner");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "shortName");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (v59)
            {
              PLBackendSharingGetLog();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v71 = 67109634;
                *(_DWORD *)v72 = v49;
                *(_WORD *)&v72[4] = 2048;
                *(_QWORD *)&v72[6] = v57;
                v73 = 2112;
                v74 = v59;
                _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_INFO, "Posting notification for non-self-initiated exit process with exit type: %d, retention policy: %ld, owner: %@", v71, 0x1Cu);
              }

              +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
              v52 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:retentionPolicy:ownerName:notificationDeliveryDate:](v52, "postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:retentionPolicy:ownerName:notificationDeliveryDate:", v50, v57, v59, v53);

            }
            else
            {
              PLBackendSharingGetLog();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v56, "uuid");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v71 = 138543362;
                *(_QWORD *)v72 = v54;
                _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_ERROR, "Owner participant does not have a short name for exit notification: %{public}@", v71, 0xCu);

              }
            }

          }
        }
        objc_msgSend(v11, "setExitType:", v50);
      }
      v11 = v11;

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(buf, 8);
      v9 = v11;
    }

    goto LABEL_80;
  }
  PLBackendSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "+[PLLibraryScope insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:]";
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring %s since we are in GoldilocksLocalMode", buf, 0xCu);
  }
  v9 = 0;
LABEL_81:

  return v9;
}

+ (id)compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D73310];
  v4 = a3;
  objc_msgSend(v3, "predicateForIncludeMask:useIndex:", objc_msgSend(v3, "maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v5;
  +[PLManagedAsset predicateToExcludeTrashedAssets](PLManagedAsset, "predicateToExcludeTrashedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  +[PLManagedAsset predicateToExcludeHiddenAssets](PLManagedAsset, "predicateToExcludeHiddenAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v14[3] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("kindSubtype"), 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("kindSubtype"), 103);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)_cleanupLocalPreviewLibraryScopesInManagedObjectContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "predicateForPreviewLibraryScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend((id)objc_opt_class(), "predicateForActiveLibraryScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notPredicateWithSubpredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v10, 0, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
    +[PLShare incrementallyDeleteAndSaveShares:logMessagePrefix:error:](PLShare, "incrementallyDeleteAndSaveShares:logMessagePrefix:error:", v11, CFSTR("preview"), 0);

}

+ (id)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithManagedObjectContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLBackendSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Removing all local only LibraryScopes", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v6, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v13 = 0;
    v8 = +[PLShare incrementallyDeleteAndSaveShares:logMessagePrefix:error:](PLShare, "incrementallyDeleteAndSaveShares:logMessagePrefix:error:", v7, CFSTR("local only"), &v13);
    v9 = v13;
    if (v8)
    {
      v10 = (id)objc_msgSend(a1, "resetLibraryScopeAssetStatesWithManagedObjectContext:", v4);
    }
    else
    {
      PLBackendSharingGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Failed to delete local only scopes: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)resetLibraryScopeAssetStatesWithManagedObjectContext:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t *v18;
  id v19;
  SEL v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  PLBackendSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Resetting libraryScopeShareState for assets...", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7922;
  v25 = __Block_byref_object_dispose__7923;
  v26 = 0;
  objc_msgSend(v5, "pl_libraryBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newShortLivedCplLibraryWithNameSuffix:", "+[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:]");

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke;
  v15[3] = &unk_1E36756C0;
  v11 = v5;
  v16 = v11;
  v18 = buf;
  v19 = a1;
  v20 = a2;
  v12 = v10;
  v17 = v12;
  objc_msgSend(v12, "performTransactionAndWait:", v15);
  v13 = *((id *)v22 + 5);

  _Block_object_dispose(buf, 8);
  return v13;
}

+ (id)_shareEverythingInternalQuery
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D732A0]);
  objc_msgSend(v2, "setConjunction:", 0);
  return v2;
}

+ (BOOL)_queryIsShareEverythingInternalQuery:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hasFirst") & 1) != 0 || (objc_msgSend(v3, "hasSecond") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "singleQueries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      v4 = 0;
    else
      v4 = objc_msgSend(v3, "conjunction") == 0;

  }
  return v4;
}

+ (void)informRapportToAddShareParticipantUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D83948]);
  v19 = v6;
  v20 = v5;
  +[PLShareParticipant participantsWithUUIDs:inPhotoLibrary:](PLShareParticipant, "participantsWithUUIDs:inPhotoLibrary:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
        objc_msgSend(v13, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "emailAddress");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15 || (objc_msgSend(v13, "phoneNumber"), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v13, "description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __71__PLLibraryScope_informRapportToAddShareParticipantUUIDs_photoLibrary___block_invoke;
          v21[3] = &unk_1E3674D50;
          v22 = v16;
          v17 = v16;
          objc_msgSend(v7, "addAppleID:completion:", v15, v21);

        }
        else
        {
          PLBackendGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v14;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to add share participant in unexpected state with nil phone/email %@ via -[RPPeopleDiscovery addAppleID:completion:]", buf, 0xCu);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      v10 = v18;
    }
    while (v18);
  }

}

+ (void)informRapportToRemoveShareParticipantUUIDs:(id)a3 photoLibraryBundle:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a3;
  v6 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "+[PLLibraryScope informRapportToRemoveShareParticipantUUIDs:photoLibraryBundle:]", a4);
  v7 = objc_alloc_init(MEMORY[0x1E0D83948]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PLLibraryScope_informRapportToRemoveShareParticipantUUIDs_photoLibraryBundle___block_invoke;
  v11[3] = &unk_1E3677530;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v9, "performBlock:", v11);

}

void __80__PLLibraryScope_informRapportToRemoveShareParticipantUUIDs_photoLibraryBundle___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[PLShareParticipant participantsWithUUIDs:inPhotoLibrary:](PLShareParticipant, "participantsWithUUIDs:inPhotoLibrary:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v17;
    *(_QWORD *)&v4 = 138412290;
    v13 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        objc_msgSend(v8, "description", v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "emailAddress");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10 || (objc_msgSend(v8, "phoneNumber"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v11 = (void *)a1[6];
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __80__PLLibraryScope_informRapportToRemoveShareParticipantUUIDs_photoLibraryBundle___block_invoke_2;
          v14[3] = &unk_1E3674D50;
          v15 = v9;
          objc_msgSend(v11, "removeAppleID:completion:", v10, v14);

        }
        else
        {
          PLBackendGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v21 = v9;
            _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to remove share participant in unexpected state with nil phone/email %@ via -[RPPeopleDiscovery addAppleID:completion:]", buf, 0xCu);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      v12 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      v5 = v12;
    }
    while (v12);
  }

}

void __80__PLLibraryScope_informRapportToRemoveShareParticipantUUIDs_photoLibraryBundle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      v7 = "Failed to remove share participant %@ via -[RPPeopleDiscovery removeAppleID:completion:]: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v11;
    v7 = "Successfully removed share participant %@ via -[RPPeopleDiscovery removeAppleID:completion:]";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_6;
  }

}

void __71__PLLibraryScope_informRapportToAddShareParticipantUUIDs_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      v7 = "Failed to add share participant %@ via -[RPPeopleDiscovery addAppleID:completion:]: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v11;
    v7 = "Successfully added share participant %@ via -[RPPeopleDiscovery addAppleID:completion:]";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_6;
  }

}

void __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLEnumerateAndSaveController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  PLEnumerateAndSaveController *v20;
  void *v21;
  PLEnumerateAndSaveController *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id obj;
  _QWORD v37[4];
  PLEnumerateAndSaveController *v38;
  _QWORD *v39;
  __int128 *p_buf;
  _QWORD v41[3];
  char v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  __int128 buf;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("PLTransactionScopeMomentGeneration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v2, v3, "+[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "transactionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v5, v2, v6, "+[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:]_block_invoke");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "completeTransaction");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithEntityName:", v8);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("libraryScopeShareState"), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v34);
    objc_msgSend(v9, "setFetchBatchSize:", 100);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x2020000000;
    v49 = 0;
    v10 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "libraryBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_libraryForEnumerationFromBundle:withName:", v12, "+[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:]_block_invoke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [PLEnumerateAndSaveController alloc];
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pathManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_2;
    v43[3] = &unk_1E36700D0;
    v19 = v14;
    v44 = v19;
    v20 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:](v15, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:", v16, v9, v19, v17, 0, 1, v43, 0, &__block_literal_global_7933);

    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v42 = 0;
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v18;
    v37[1] = 3221225472;
    v37[2] = __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_4;
    v37[3] = &unk_1E3677830;
    v39 = v41;
    v22 = v20;
    v38 = v22;
    p_buf = &buf;
    objc_msgSend(v21, "sync:identifyingBlock:library:", v37, 0, v13);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(&buf, 8);

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v23 = objc_alloc(MEMORY[0x1E0C97AB0]);
      +[PLPhotosHighlight entity](PLPhotosHighlight, "entity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithEntity:", v24);

      objc_msgSend(v25, "setResultType:", 2);
      v45[0] = CFSTR("photoAssetsSuggestedByPhotosCount");
      v45[1] = CFSTR("videoAssetsSuggestedByPhotosCount");
      v46[0] = &unk_1E375D7B8;
      v46[1] = &unk_1E375D7B8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPropertiesToUpdate:", v26);

      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v28 + 40);
      objc_msgSend(v27, "executeRequest:error:", v25, &obj);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v28 + 40), obj);

      PLBackendSharingGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v29)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v29, "result");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v32;
          _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Reset [photo/video]assetsSuggestedByPhotosCount for %@ highlights", (uint8_t *)&buf, 0xCu);

        }
      }
      else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v33;
        _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Failed to reset [photo/video]assetsSuggestedByPhotosCount for highlights: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  objc_msgSend(v35, "completeTransactionScope:", CFSTR("PLTransactionScopeMomentGeneration"));

}

id __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_4(_QWORD *a1)
{
  void *v2;
  char v3;
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v12 = 0;
  v3 = objc_msgSend(v2, "processObjectsWithError:", &v12);
  v4 = v12;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  v5 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
  PLBackendSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(*(_QWORD *)(a1[6] + 8) + 24);
      *(_DWORD *)buf = 134217984;
      v14 = v8;
      v9 = "ResetLibraryScopeAssetStates: Successfully reset %lu assets";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_199541000, v10, v11, v9, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    v9 = "ResetLibraryScopeAssetStates: Failed to reset assets %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

void __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setLibraryScopeShareState:", 0);
        objc_msgSend(v8, "removeLibraryScopeAndContributors");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __71__PLLibraryScope_insertOrUpdateShareWithCPLScopeChange_inPhotoLibrary___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  int v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC520]))
  {
    v6 = objc_msgSend(v9, "integerValue");
    v7 = a1[4];
  }
  else
  {
    v8 = objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC568]);
    v6 = objc_msgSend(v9, "integerValue");
    if (v8)
      v7 = a1[5];
    else
      v7 = a1[6];
  }
  *(_DWORD *)(*(_QWORD *)(v7 + 8) + 24) += v6;

}

void __71__PLLibraryScope_insertOrUpdateShareWithCPLScopeChange_inPhotoLibrary___block_invoke_171(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __int16 v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isUserWithIdentifierExiting:", v5);

  if ((_DWORD)v4)
  {
    if (objc_msgSend(v7, "isCurrentUser"))
      v6 = objc_msgSend(*(id *)(a1 + 32), "exitState");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v7, "setExitState:", v6);

}

void __157__PLLibraryScope__computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope_outPhotoCount_outVideoCount_outItemCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  int v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isPhoto"))
  {
    v3 = a1 + 32;
  }
  else
  {
    v4 = objc_msgSend(v5, "isVideo");
    v3 = a1 + 48;
    if (v4)
      v3 = a1 + 40;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v3 + 8) + 24);

}

- (BOOL)_libraryScopeWasCreatedInLocalOnlyMode
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[PLLibraryScope scopeIdentifier](self, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "libraryScopeScopeIdentifierWasCreatedInLocalOnlyMode:", v4);

  return (char)v3;
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  char v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PLLibraryScope;
  -[PLManagedObject willSave](&v18, sel_willSave);
  -[PLLibraryScope managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[PLLibraryScope isDeleted](self, "isDeleted"))
      self->_needsResetShareStateAfterSave = 1;
    -[PLLibraryScope changedValues](self, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("scopeSyncingState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5 != 0;
    if (v5
      && -[PLLibraryScope libraryScopeIsActive](self, "libraryScopeIsActive")
      && -[PLLibraryScope trashedState](self, "trashedState") == 1)
    {
      PLBackendSharingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        -[PLLibraryScope scopeIdentifier](self, "scopeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLLibraryScope uuid](self, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v8;
        v21 = 2114;
        v22 = v9;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_FAULT, "LibraryScope %{public}@ for asset %{public}@ is active but in trashed state, this is an invalid state. Untrashing LibraryScope", buf, 0x16u);

      }
      -[PLShare untrash](self, "untrash");
    }
    if ((-[PLLibraryScope isInserted](self, "isInserted") & 1) != 0
      || (-[PLLibraryScope isDeleted](self, "isDeleted") & 1) != 0
      || (objc_msgSend(v4, "objectForKey:", CFSTR("participants")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      objc_msgSend(v3, "delayedSaveActions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recordLibraryScopeParticipantsUpdateForLibraryScope:", self);

      -[PLLibraryScope _verifyCurrentUserParticipantExists](self, "_verifyCurrentUserParticipantExists");
      v6 = 1;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("rulesData"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = -[PLLibraryScope libraryScopeIsActive](self, "libraryScopeIsActive");

      if (v14)
      {
        objc_msgSend(v3, "delayedSaveActions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "recordLibraryScopeRulesUpdated");

      }
    }
    if (v6)
    {
      -[PLManagedObject photoLibrary](self, "photoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isUnitTesting");

      if ((v17 & 1) == 0)
        objc_msgSend((id)objc_opt_class(), "updateLibraryScopeActiveDefaultsWithManagedObjectContext:", v3);
    }

  }
}

- (void)didSave
{
  void *v3;
  id v4;
  id v5;

  if (self->_needsResetShareStateAfterSave)
  {
    self->_needsResetShareStateAfterSave = 0;
    v3 = (void *)objc_opt_class();
    -[PLLibraryScope managedObjectContext](self, "managedObjectContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "resetLibraryScopeAssetStatesWithManagedObjectContext:", v5);

  }
}

- (void)setScopeSyncingState:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  _QWORD v6[4];
  id v7;
  __int16 v8;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PLLibraryScope_setScopeSyncingState___block_invoke;
  v6[3] = &unk_1E3661FB8;
  objc_copyWeak(&v7, &location);
  v8 = v3;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v5, CFSTR("scopeSyncingState"), v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_verifyCurrentUserParticipantExists
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((-[PLLibraryScope isDeleted](self, "isDeleted") & 1) == 0)
  {
    if (MEMORY[0x19AEC04C8]())
    {
      -[PLShare currentUserParticipant](self, "currentUserParticipant");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        PLBackendSharingGetLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v8) = 0;
          _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Triggering tap to radar for LibraryScope with no current user", (uint8_t *)&v8, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TTR: Inconsistent iCloud Shared Library participant state"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shared Library does not have a current user participant. This is an inconsistent state."));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Inconsistent iCloud Shared Library participant state detected"), CFSTR("Your iCloud Shared Library has experienced an unexpected state, please file a Radar against Photos to help us diagnose the issue"), v5, v6);
        PLBackendSharingGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          v8 = 138543362;
          v9 = v6;
          _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
        }

      }
    }
  }
}

- (void)prepareForDeletion
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
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PLLibraryScope;
  -[PLShare prepareForDeletion](&v13, sel_prepareForDeletion);
  -[PLLibraryScope managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  if (MEMORY[0x19AEC04BC]() && PLIsAssetsd())
  {
    objc_msgSend(v4, "mergePolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isResolvingConflicts") & 1) == 0)
    {
      -[PLLibraryScope uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6 || self->_didPrepareAssetsForScopeDelete)
        goto LABEL_8;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryScope.m"), 567, CFSTR("Must call -[PLLibraryScope incrementallyDeleteAndSaveWithError:] prior to deleting a LibraryScope object."));
    }

  }
LABEL_8:
  if (PLShouldLogRegisteredEvent())
  {
    v14 = CFSTR("PhotoSharingEnabled");
    v15[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    PLLogRegisteredEvent();
  }
  PLResetSharedLibraryAssetTrashedByParticipantsNotificationKey();
  -[PLLibraryScope participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(v8, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "libraryBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "informRapportToRemoveShareParticipantUUIDs:photoLibraryBundle:", v10, v12);

  }
LABEL_13:

}

- (BOOL)libraryScopeIsActive
{
  return objc_msgSend((id)objc_opt_class(), "libraryScopeIsActiveWithScopeSyncingState:", -[PLLibraryScope scopeSyncingState](self, "scopeSyncingState"));
}

- (BOOL)shouldEnableRulesChangeTracker
{
  BOOL v3;
  void *v4;

  if (-[PLLibraryScope autoSharePolicy](self, "autoSharePolicy") == 1)
    return 1;
  if (-[PLLibraryScope autoSharePolicy](self, "autoSharePolicy") != 2)
    return 0;
  -[PLLibraryScope rulesData](self, "rulesData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)_insertOwnedParticipantInLibrary:(id)a3 unitTestMode:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  _QWORD v27[2];

  v4 = a4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedPrimaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLLibraryScope _libraryScopeWasCreatedInLocalOnlyMode](self, "_libraryScopeWasCreatedInLocalOnlyMode");
  if (v4)
    v10 = CFSTR("owner@unittest.com");
  else
    v10 = CFSTR("owner@localmode.com");
  if (v4 || v9)
    goto LABEL_8;
  if (!v8)
  {
    PLBackendSharingGetLog();
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      -[PLShare compactDescription](self, "compactDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v22;
      _os_log_impl(&dword_199541000, (os_log_t)v10, OS_LOG_TYPE_ERROR, "Failed to fetch account store to insert owner participant into libraryScope %@", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_13;
  }
  objc_msgSend(v8, "username");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
LABEL_8:
    +[PLShareParticipant insertInPhotoLibrary:](PLShareParticipant, "insertInPhotoLibrary:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEmailAddress:", v10);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUuid:", v13);

    objc_msgSend(v11, "setIsCurrentUser:", 1);
    objc_msgSend(v11, "setRole:", 1);
    objc_msgSend(v11, "setPermission:", 3);
    if (-[PLLibraryScope _libraryScopeWasCreatedInLocalOnlyMode](self, "_libraryScopeWasCreatedInLocalOnlyMode"))
    {
      objc_msgSend(v8, "aa_firstName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "aa_lastName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PLPersonNameComponentsWithFirstAndLastName();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNameComponents:", v16);

    }
    v17 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLLibraryScope setParticipants:](self, "setParticipants:", v19);

    PLBackendSharingGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[PLShare compactDescription](self, "compactDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Inserted owner participant %@ into libraryScope %@", (uint8_t *)&v23, 0x16u);

    }
LABEL_13:

  }
}

- (void)startTrackingParticipantAssetTrashStateIfNeeded
{
  void *v3;
  id v4;

  if (PLIsSharedLibraryAssetTrashedByParticipantsNotificationEnabled())
  {
    -[PLLibraryScope lastParticipantAssetTrashNotificationDate](self, "lastParticipantAssetTrashNotificationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[PLLibraryScope setLastParticipantAssetTrashNotificationDate:](self, "setLastParticipantAssetTrashNotificationDate:", v4);

    }
  }
}

- (void)stopTrackingParticipantAssetTrashedStateIfNeeded
{
  void *v3;

  -[PLLibraryScope lastParticipantAssetTrashNotificationDate](self, "lastParticipantAssetTrashNotificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PLLibraryScope setLastParticipantAssetTrashNotificationDate:](self, "setLastParticipantAssetTrashNotificationDate:", 0);
}

- (void)userViewedAssetTrashNotificationWithManagedObjectContext:(id)a3
{
  id v4;

  -[PLLibraryScope lastParticipantAssetTrashNotificationDate](self, "lastParticipantAssetTrashNotificationDate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLLibraryScope setLastParticipantAssetTrashNotificationViewedDate:](self, "setLastParticipantAssetTrashNotificationViewedDate:", v4);

}

- (BOOL)isSyncableChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)();
  void *v15;
  PLLibraryScope *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __34__PLLibraryScope_isSyncableChange__block_invoke;
  v15 = &unk_1E3677AA0;
  v16 = self;
  pl_dispatch_once();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[PLLibraryScope changedValues](self, "changedValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend((id)isSyncableChange_syncedProperties, "containsObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)supportsCloudUpload
{
  int v3;

  if (-[PLLibraryScope status](self, "status") != 1
    || -[PLLibraryScope localPublishState](self, "localPublishState") != 2
    || (v3 = -[PLLibraryScope scopeSyncingState](self, "scopeSyncingState"), v3 != 1))
  {
    LOBYTE(v3) = -[PLLibraryScope status](self, "status") == 3
              && -[PLLibraryScope localPublishState](self, "localPublishState") == 2
              && -[PLLibraryScope scopeSyncingState](self, "scopeSyncingState") == 1;
  }
  return v3;
}

- (id)scopedIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryScope.m"), 892, CFSTR("%@ are synchronized as scope changes and don't have a scoped identifier"), objc_opt_class());

  return 0;
}

- (id)cplScopeChange
{
  NSObject *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[PLLibraryScope _libraryScopeWasCreatedInLocalOnlyMode](self, "_libraryScopeWasCreatedInLocalOnlyMode"))
  {
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryScope debugDescription](self, "debugDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v5;
      v16 = 2080;
      v17 = "-[PLLibraryScope cplScopeChange]";
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring %@ in %s since it was created in local only mode", (uint8_t *)&v14, 0x16u);

    }
    return 0;
  }
  else
  {
    -[PLLibraryScope scopeIdentifier](self, "scopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryScope.m"), 903, CFSTR("Missing scope identifier for libraryScope share"));

    }
    v8 = (void *)objc_msgSend(MEMORY[0x1E0D113A8], "newScopeChangeWithScopeIdentifier:type:", v7, -[PLShare scopeType](self, "scopeType"));
    -[PLLibraryScope _cplShare](self, "_cplShare");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShare:", v9);
    objc_msgSend(v8, "setActivated:", -[PLLibraryScope scopeSyncingState](self, "scopeSyncingState") == 1);
    if (objc_msgSend(MEMORY[0x1E0D113A8], "serverSupportsLibraryShareSettingsRecordSyncing"))
    {
      -[PLLibraryScope cloudSyncableRulesData](self, "cloudSyncableRulesData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUserDefinedRules:", v10);

    }
    if (objc_msgSend(MEMORY[0x1E0D113A8], "serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing"))
    {
      -[PLLibraryScope lastParticipantAssetTrashNotificationViewedDate](self, "lastParticipantAssetTrashNotificationViewedDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUserViewedParticipantTrashNotificationDate:", v11);

    }
    -[PLLibraryScope title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v12);

    return v8;
  }
}

- (id)_cplShare
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D11470]);
  -[PLLibraryScope shareURL](self, "shareURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setURL:", v4);

  objc_msgSend(v3, "setPublicPermission:", -[PLShare publicPermission](self, "publicPermission"));
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[PLLibraryScope participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PLLibraryScope participants](self, "participants", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        v14 = objc_alloc(MEMORY[0x1E0D11478]);
        objc_msgSend(v13, "emailAddress");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithEmail:", v15);

        objc_msgSend(v13, "phoneNumber");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPhoneNumber:", v17);

        objc_msgSend(v16, "setPermission:", objc_msgSend(v13, "permission"));
        objc_msgSend(v16, "setRole:", objc_msgSend(v13, "role"));
        objc_msgSend(v13, "nameComponents");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setNameComponents:", v18);

        objc_msgSend(v13, "userIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setUserIdentifier:", v19);

        objc_msgSend(v16, "setAcceptanceStatus:", objc_msgSend(v13, "acceptanceStatus"));
        objc_msgSend(v16, "setIsCurrentUser:", objc_msgSend(v13, "isCurrentUser"));
        objc_msgSend(v7, "addObject:", v16);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "setParticipants:", v7);
  return v3;
}

- (void)acceptWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCloudPhotoLibraryEnabled");

  if ((v6 & 1) != 0)
  {
    PLBackendSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[PLShare compactDescription](self, "compactDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Accepting library scope %@", buf, 0xCu);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E3674E40;
    v14[4] = self;
    v15 = v4;
    v13.receiver = self;
    v13.super_class = (Class)PLLibraryScope;
    -[PLShare acceptWithCompletionHandler:](&v13, sel_acceptWithCompletionHandler_, v14);

  }
  else if (v4)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D11268];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("iCloud Photo Library is not enabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 33, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)publishWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  PLLibraryScope *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  PLLibraryScope *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  uint64_t v38;
  const __CFString *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLLibraryScope _libraryScopeWasCreatedInLocalOnlyMode](self, "_libraryScopeWasCreatedInLocalOnlyMode");
  if (v6
    || (-[PLManagedObject photoLibrary](self, "photoLibrary"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isUnitTesting"),
        v7,
        v8))
  {
    PLBackendSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryScope debugDescription](self, "debugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = "for unit testing";
      *(_DWORD *)buf = 138412802;
      v41 = v10;
      v43 = "-[PLLibraryScope publishWithCompletionHandler:]";
      v42 = 2080;
      if (v6)
        v11 = "in local only mode";
      v44 = 2080;
      v45 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created %s", buf, 0x20u);

    }
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke;
    v37[3] = &unk_1E3677AA0;
    v37[4] = self;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2;
    v35[3] = &unk_1E3675C58;
    v35[4] = self;
    v36 = v4;
    objc_msgSend(v5, "performTransaction:completionHandler:", v37, v35);

  }
  else
  {
    objc_msgSend(v5, "libraryServicesManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cloudPhotoLibraryManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = -[PLLibraryScope localPublishState](self, "localPublishState");
      PLBackendSharingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v14 == 2)
      {
        if (v16)
        {
          -[PLShare compactDescription](self, "compactDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v41 = v17;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Updating Library scope since it's already published %@", buf, 0xCu);

        }
        -[PLLibraryScope cplScopeChange](self, "cplScopeChange");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_161;
        v30[3] = &unk_1E3662030;
        v31 = v13;
        v32 = v5;
        v33 = self;
        v34 = v4;
        objc_msgSend(v31, "updateLibraryScopeWithCPLScopeChange:completionHandler:", v18, v30);

        v19 = v31;
      }
      else
      {
        if (v16)
        {
          -[PLShare compactDescription](self, "compactDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v41 = v23;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Publishing library scope %@", buf, 0xCu);

        }
        -[PLLibraryScope setLocalPublishState:](self, "setLocalPublishState:", 1);
        -[PLLibraryScope _cplShare](self, "_cplShare");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        -[PLLibraryScope title](self, "title");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_165;
        v25[3] = &unk_1E3662030;
        v26 = v13;
        v27 = v5;
        v28 = self;
        v29 = v4;
        objc_msgSend(v26, "publishLibraryScopeWithCPLShare:title:completionHandler:", v19, v24, v25);

      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D74498];
      v38 = *MEMORY[0x1E0CB2D50];
      v39 = CFSTR("PLCloudPhotoLibraryManager is not available");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 41004, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v22);

    }
  }

}

- (id)activateScopeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  PLLibraryScope *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38A8]), "initWithParent:userInfo:", 0, 0);
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLLibraryScope _libraryScopeWasCreatedInLocalOnlyMode](self, "_libraryScopeWasCreatedInLocalOnlyMode"))
  {
    PLBackendSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryScope debugDescription](self, "debugDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v8;
      v39 = 2080;
      v40 = "-[PLLibraryScope activateScopeWithCompletionHandler:]";
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created in local only mode", buf, 0x16u);

    }
    v9 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke;
    v32[3] = &unk_1E3677530;
    v32[4] = self;
    v10 = v5;
    v33 = v10;
    v34 = v6;
    v30[0] = v9;
    v30[1] = 3221225472;
    v30[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_2;
    v30[3] = &unk_1E3676CD8;
    v31 = v4;
    objc_msgSend(v34, "performTransaction:completionHandler:", v32, v30);
    v11 = v10;

  }
  else
  {
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "libraryServicesManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cloudPhotoLibraryManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[PLLibraryScope setLocalPublishState:](self, "setLocalPublishState:", 1);
      PLBackendSharingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[PLShare compactDescription](self, "compactDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v16;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Activating library scope %@", buf, 0xCu);

      }
      -[PLLibraryScope scopeIdentifier](self, "scopeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_174;
      v24[3] = &unk_1E36620A8;
      v25 = v14;
      v26 = v6;
      v27 = self;
      v18 = v5;
      v28 = v18;
      v29 = v4;
      objc_msgSend(v25, "activateScopeWithIdentifier:completionHandler:", v17, v24);

      v11 = v18;
      v19 = v25;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D74498];
      v35 = *MEMORY[0x1E0CB2D50];
      v36 = CFSTR("PLCloudPhotoLibraryManager is not available");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 41004, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v22);

      v11 = 0;
    }

  }
  return v11;
}

- (void)deactivateScopeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PLLibraryScope *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLLibraryScope _libraryScopeWasCreatedInLocalOnlyMode](self, "_libraryScopeWasCreatedInLocalOnlyMode"))
  {
    PLBackendSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryScope debugDescription](self, "debugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v7;
      v30 = 2080;
      v31 = "-[PLLibraryScope deactivateScopeWithCompletionHandler:]";
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created in local only mode", buf, 0x16u);

    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke;
    v25[3] = &unk_1E3677AA0;
    v25[4] = self;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_2;
    v23[3] = &unk_1E3675C58;
    v23[4] = self;
    v24 = v4;
    objc_msgSend(v5, "performTransaction:completionHandler:", v25, v23);

  }
  else
  {
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudPhotoLibraryManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PLLibraryScope setLocalPublishState:](self, "setLocalPublishState:", 1);
      PLBackendSharingGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[PLShare compactDescription](self, "compactDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v12;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Deactivating library scope %@", buf, 0xCu);

      }
      -[PLLibraryScope scopeIdentifier](self, "scopeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_177;
      v18[3] = &unk_1E3677858;
      v19 = v10;
      v20 = v5;
      v21 = self;
      v22 = v4;
      objc_msgSend(v19, "deactivateScopeWithIdentifier:completionHandler:", v13, v18);

      v14 = v19;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D74498];
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = CFSTR("PLCloudPhotoLibraryManager is not available");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 41004, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v17);

    }
  }

}

- (id)markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  PLEnumerateAndSaveController *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  PLEnumerateAndSaveController *v56;
  void *v57;
  PLEnumerateAndSaveController *v58;
  id v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  id v82;
  void *v83;
  void (**v84)(id, void *);
  _QWORD v85[4];
  PLEnumerateAndSaveController *v86;
  id v87;
  PLLibraryScope *v88;
  void (**v89)(id, void *);
  _QWORD *v90;
  __int128 *v91;
  _QWORD v92[3];
  char v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  __int128 *p_buf;
  id v99;
  _QWORD v100[4];
  id v101;
  id location;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 buf;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  _QWORD v113[2];
  uint64_t v114;
  void *v115;
  _BYTE v116[128];
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  _QWORD v122[4];

  v122[1] = *MEMORY[0x1E0C80C00];
  v82 = a3;
  v84 = (void (**)(id, void *))a4;
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38A8]), "initWithParent:userInfo:", 0, 0);
  if (-[PLLibraryScope autoSharePolicy](self, "autoSharePolicy") != 1)
  {
    -[PLLibraryScope rulesData](self, "rulesData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[PLLibraryScope rulesData](self, "rulesData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLQueryHandler constructQueryFromData:](PLQueryHandler, "constructQueryFromData:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[PLLibraryScope rulesData](self, "rulesData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:](PLLibraryScopeRule, "libraryScopeRulesForLibraryScopeRulesData:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v27, "count") == 0;
        PLBackendSharingGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v28)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: rule object generated from rulesData is nil", (uint8_t *)&buf, 2u);
          }

          v69 = (void *)MEMORY[0x1E0CB35C8];
          v117 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rule object generated from query is nil"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = v70;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v71);
          v72 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v27;
            _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "MarkOnboardingPreviewAssets: Rule object being used for marking onboarding preview: %@", (uint8_t *)&buf, 0xCu);
          }

          if (objc_msgSend(v82, "count"))
          {
            PLBackendSharingGetLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v82;
              _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "MarkOnboardingPreviewAssets: Exclude people for marking onboarding preview: %@", (uint8_t *)&buf, 0xCu);
            }

            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D732A8]), "initWithConjunction:", 0);
            v106 = 0u;
            v107 = 0u;
            v104 = 0u;
            v105 = 0u;
            v33 = v82;
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
            if (v34)
            {
              v35 = *(_QWORD *)v105;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v105 != v35)
                    objc_enumerationMutation(v33);
                  objc_msgSend(v32, "addPersonUUIDQuery:comparator:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * i), 22);
                }
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
              }
              while (v34);
            }

            v37 = (void *)MEMORY[0x1E0D732A8];
            objc_msgSend(v32, "query");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "notQuery:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0D732A8], "andCombineFirstQuery:secondQuery:", v25, v39);
            v40 = objc_claimAutoreleasedReturnValue();

            v25 = (void *)v40;
          }
          -[PLManagedObject photoLibrary](self, "photoLibrary");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_opt_new();
          +[PLQueryHandler predicateForQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "predicateForQuery:inLibrary:changeDetectionCriteria:", v25, v41, v42);
          v81 = objc_claimAutoreleasedReturnValue();

          if (v81)
          {

            goto LABEL_3;
          }
          PLBackendSharingGetLog();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_199541000, v73, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: predicate generated from query is nil", (uint8_t *)&buf, 2u);
          }

          v74 = (void *)MEMORY[0x1E0CB35C8];
          v114 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("predicate generated from rule object is nil"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v70;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v71);
          v72 = objc_claimAutoreleasedReturnValue();
        }
        v75 = (void *)v72;

        v84[2](v84, v75);
      }
      else
      {
        PLBackendSharingGetLog();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: query generated from rulesData is nil", (uint8_t *)&buf, 2u);
        }

        v66 = (void *)MEMORY[0x1E0CB35C8];
        v119 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("query generated from rulesData is nil"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v67;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v68);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v84[2](v84, v25);
      }
    }
    else
    {
      PLBackendSharingGetLog();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: rulesData is not set on LibraryScope", (uint8_t *)&buf, 2u);
      }

      v62 = (void *)MEMORY[0x1E0CB35C8];
      v121 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rulesData is not set on LibraryScope"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v122[0] = v63;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v64);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v84[2](v84, v25);
    }
    v22 = 0;
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v81 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v7 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithEntityName:", v8);

  objc_msgSend((id)objc_opt_class(), "compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:", v81);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setFetchBatchSize:", 100);
  v113[0] = CFSTR("additionalAttributes");
  v113[1] = CFSTR("libraryScope");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v11);

  PLBackendSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "predicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "MarkOnboardingPreviewAssets: Predicate being used for marking onboarding preview assets: %@", (uint8_t *)&buf, 0xCu);

  }
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  v16 = objc_msgSend(v15, "countForFetchRequest:error:", v9, &v103);
  v80 = v103;

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendSharingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v80;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: Count fetch failed: %@", (uint8_t *)&buf, 0xCu);
    }

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v111 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("count fetch failed: %@"), v80);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v84[2](v84, v21);
    v22 = 0;
  }
  else
  {
    objc_msgSend(v83, "setTotalUnitCount:", v16);
    v43 = (void *)objc_opt_class();
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "libraryBundle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_libraryForEnumerationFromBundle:withName:", v45, "-[PLLibraryScope markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs:completionHandler:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "managedObjectContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setChangeSource:", 1);

    if (v21)
    {
      objc_msgSend(v21, "managedObjectContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLibraryScope objectID](self, "objectID");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLShare currentUserParticipant](self, "currentUserParticipant");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v109 = 0x2020000000;
      v110 = 0;
      v50 = [PLEnumerateAndSaveController alloc];
      NSStringFromSelector(a2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "pathManager");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = MEMORY[0x1E0C809B0];
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke;
      v100[3] = &unk_1E36700D0;
      v54 = v47;
      v101 = v54;
      v94[0] = v53;
      v94[1] = 3221225472;
      v94[2] = __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke_2;
      v94[3] = &unk_1E36620D0;
      objc_copyWeak(&v99, &location);
      v77 = v78;
      v95 = v77;
      v79 = v49;
      v96 = v79;
      p_buf = &buf;
      v55 = v83;
      v97 = v55;
      v56 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:](v50, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:", v51, v9, v54, v52, 0, 1, v100, 0, v94);

      v92[0] = 0;
      v92[1] = v92;
      v92[2] = 0x2020000000;
      v93 = 0;
      +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = v53;
      v85[1] = 3221225472;
      v85[2] = __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke_207;
      v85[3] = &unk_1E36708F8;
      v90 = v92;
      v58 = v56;
      v86 = v58;
      v59 = v55;
      v87 = v59;
      v91 = &buf;
      v88 = self;
      v89 = v84;
      objc_msgSend(v54, "photoLibrary");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "async:identifyingBlock:library:", v85, 0, v60);

      v22 = v59;
      _Block_object_dispose(v92, 8);

      objc_destroyWeak(&v99);
      _Block_object_dispose(&buf, 8);
      objc_destroyWeak(&location);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 45001, 0);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v84[2](v84, v54);
      v22 = 0;
    }

  }
  v25 = (void *)v81;
LABEL_46:

  return v22;
}

- (void)_confirmAllRemainingOnboardingPreviewAssetsWithProgress:(id)a3 photoLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "databaseContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v9 = -[PLLibraryScope confirmAllRemainingOnboardingPreviewAssetsWithProgress:databaseContext:withError:](self, "confirmAllRemainingOnboardingPreviewAssetsWithProgress:databaseContext:withError:", v6, v8, &v17);

  v10 = v17;
  PLBackendSharingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Successfully confirmed remaining onboarding preview assets";
      v14 = v12;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 2;
LABEL_6:
      _os_log_impl(&dword_199541000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    v13 = "Failed to confirm remaining onboarding preview assets %@";
    v14 = v12;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 12;
    goto LABEL_6;
  }

}

- (BOOL)confirmAllRemainingOnboardingPreviewAssetsWithProgress:(id)a3 databaseContext:(id)a4 withError:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  PLLibraryScope *v18;
  uint64_t *v19;
  id *v20;
  SEL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v9 = a3;
  v10 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v11 = (void *)objc_msgSend(v10, "newShortLivedLibraryWithName:", "-[PLLibraryScope confirmAllRemainingOnboardingPreviewAssetsWithProgress:databaseContext:withError:]");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke;
  v15[3] = &unk_1E3676150;
  v12 = v11;
  v19 = &v22;
  v20 = a5;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v18 = self;
  v21 = a2;
  objc_msgSend(v12, "performTransactionAndWait:", v15);
  LOBYTE(a2) = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)a2;
}

- (void)startExitWithRetentionPolicy:(int64_t)a3 exitSource:(unsigned __int16)a4 completionHandler:(id)a5
{
  int v5;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  qos_class_t v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  char *v20;
  NSObject *v21;
  qos_class_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  PLLibraryScope *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[5];
  _QWORD block[4];
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint8_t buf[4];
  int64_t v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v5 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[PLShare compactDescription](self, "compactDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PLLibraryScope libraryScopeIsActive](self, "libraryScopeIsActive"))
  {
    v14 = qos_class_self();
    dispatch_get_global_queue(v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke;
    block[3] = &unk_1E3675C58;
    v50 = v9;
    v51 = v8;
    dispatch_async(v15, block);

    v13 = v50;
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v10, "isUnitTesting"))
  {
    PLBackendSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryScope debugDescription](self, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = (int64_t)v12;
      v56 = 2080;
      v57 = "-[PLLibraryScope startExitWithRetentionPolicy:exitSource:completionHandler:]";
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created for unit testing", buf, 0x16u);

    }
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_213;
    v48[3] = &unk_1E3677AA0;
    v48[4] = self;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_2;
    v46[3] = &unk_1E3676CD8;
    v47 = v8;
    objc_msgSend(v10, "performTransaction:completionHandler:", v48, v46);
    v13 = v47;
    goto LABEL_7;
  }
  v16 = -[PLLibraryScope _libraryScopeWasCreatedInLocalOnlyMode](self, "_libraryScopeWasCreatedInLocalOnlyMode");
  PLBackendSharingGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryScope debugDescription](self, "debugDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = (int64_t)v19;
      v56 = 2080;
      v57 = "-[PLLibraryScope startExitWithRetentionPolicy:exitSource:completionHandler:]";
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created in local only mode", buf, 0x16u);

    }
    v45 = 0;
    -[PLLibraryScope incrementallyDeleteAndSaveWithError:](self, "incrementallyDeleteAndSaveWithError:", &v45);
    v20 = (char *)v45;
    if (v20)
    {
      PLBackendSharingGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v55 = (int64_t)v9;
        v56 = 2112;
        v57 = v20;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "StartExit: Failed to start exit for local only mode library scope %@, %@", buf, 0x16u);
      }

    }
    v22 = qos_class_self();
    dispatch_get_global_queue(v22, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_214;
    v43[3] = &unk_1E3676CD8;
    v44 = v8;
    dispatch_async(v23, v43);

  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v24 = 0;
      if (v5 > 2)
      {
        if (v5 == 3)
        {
          v24 = 3;
        }
        else if (v5 == 1000)
        {
          v24 = 1000;
        }
      }
      else if (v5 == 1)
      {
        v24 = 1;
      }
      else if (v5 == 2)
      {
        v24 = 2;
      }
      *(_DWORD *)buf = 134218498;
      v55 = a3;
      v56 = 2048;
      v57 = (const char *)v24;
      v58 = 2114;
      v59 = v9;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "StartExit: Starting exit using retentionPolicy: %ld, exitSource: %ld for library scope %{public}@", buf, 0x20u);
    }

    objc_msgSend(v10, "libraryServicesManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cloudPhotoLibraryManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[PLLibraryScope scopeIdentifier](self, "scopeIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 3;
      v29 = 1000;
      if (v5 != 1000)
        v29 = 0;
      if (v5 != 3)
        v28 = v29;
      v30 = 1;
      v31 = 2;
      if (v5 != 2)
        v31 = 0;
      if (v5 != 1)
        v30 = v31;
      if (v5 <= 2)
        v32 = v30;
      else
        v32 = v28;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_215;
      v37[3] = &unk_1E36620F8;
      v38 = v9;
      v42 = v8;
      v39 = v26;
      v40 = v10;
      v41 = self;
      objc_msgSend(v39, "startExitFromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", v27, a3, v32, v37);

      v33 = v38;
    }
    else
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no CPLManager"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v36);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, void *))v8 + 2))(v8, v33);
    }

  }
LABEL_8:

}

- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(unsigned __int16)a6 completionHandler:(id)a7
{
  int v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  PLLibraryScope *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  PLLibraryScope *v48;
  uint64_t v49;
  void *v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v8 = a6;
  v59 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PLLibraryScope _libraryScopeWasCreatedInLocalOnlyMode](self, "_libraryScopeWasCreatedInLocalOnlyMode");
  if (v16 || objc_msgSend(v15, "isUnitTesting"))
  {
    PLBackendSharingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryScope debugDescription](self, "debugDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = "for unit testing";
      *(_DWORD *)buf = 138412802;
      v52 = v18;
      v54 = "-[PLLibraryScope removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitS"
            "ource:completionHandler:]";
      v53 = 2080;
      if (v16)
        v19 = "in local only mode";
      v55 = 2080;
      v56 = (uint64_t)v19;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created %s", buf, 0x20u);

    }
    v20 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
    v46[3] = &unk_1E3677C18;
    v47 = v12;
    v48 = self;
    v44[0] = v20;
    v44[1] = 3221225472;
    v44[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
    v44[3] = &unk_1E3676CD8;
    v45 = v14;
    objc_msgSend(v15, "performTransaction:completionHandler:", v46, v44);

    v21 = v47;
  }
  else
  {
    -[PLShare compactDescription](self, "compactDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendSharingGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = 0;
      if (v8 > 2)
      {
        if (v8 == 3)
        {
          v23 = 3;
        }
        else if (v8 == 1000)
        {
          v23 = 1000;
        }
      }
      else if (v8 == 1)
      {
        v23 = 1;
      }
      else if (v8 == 2)
      {
        v23 = 2;
      }
      *(_DWORD *)buf = 138544130;
      v52 = v12;
      v53 = 2048;
      v54 = (const char *)a5;
      v55 = 2048;
      v56 = v23;
      v57 = 2114;
      v58 = v21;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "RemoveParticipants: Removing participants with UUIDs %{public}@ using retentionPolicy: %ld, exitSource: %ld for library scope %{public}@", buf, 0x2Au);
    }
    v36 = v13;

    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "libraryServicesManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cloudPhotoLibraryManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = 3;
      v28 = 1000;
      if (v8 != 1000)
        v28 = 0;
      if (v8 != 3)
        v27 = v28;
      v29 = 1;
      v30 = 2;
      if (v8 != 2)
        v30 = 0;
      if (v8 != 1)
        v29 = v30;
      if (v8 <= 2)
        v31 = v29;
      else
        v31 = v27;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_223;
      v37[3] = &unk_1E3662120;
      v38 = v12;
      v39 = v21;
      v43 = v14;
      v40 = v26;
      v41 = v15;
      v42 = self;
      objc_msgSend(v40, "removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", v38, v36, a5, v31, v37);

      v32 = v38;
    }
    else
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no CPLManager"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v35);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, void *))v14 + 2))(v14, v32);
    }

    v13 = v36;
  }

}

- (BOOL)incrementallyDeleteAndSaveWithError:(id *)a3
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLEnumerateAndSaveController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  PLEnumerateAndSaveController *v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  objc_super v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t v31[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  self->_didPrepareAssetsForScopeDelete = 1;
  -[PLLibraryScope managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Preparing assets for library scope deletion...", buf, 2u);
  }

  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("libraryScope"), self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  *(_QWORD *)buf = 0;
  v28 = buf;
  v29 = 0x2020000000;
  v30 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __54__PLLibraryScope_incrementallyDeleteAndSaveWithError___block_invoke;
  v25[3] = &unk_1E36700D0;
  v16 = v6;
  v26 = v16;
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __54__PLLibraryScope_incrementallyDeleteAndSaveWithError___block_invoke_2;
  v24[3] = &unk_1E3662188;
  v24[4] = buf;
  v17 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:", v13, v10, v16, v14, 0, 0, v25, 0, v24);

  v23 = 0;
  LOBYTE(v12) = -[PLEnumerateAndSaveController processObjectsWithError:](v17, "processObjectsWithError:", &v23);
  v18 = v23;
  if ((v12 & 1) == 0)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v31 = 138412290;
      v32 = v18;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to prepare assets for share deletion: %@", v31, 0xCu);
    }

  }
  v22.receiver = self;
  v22.super_class = (Class)PLLibraryScope;
  v20 = -[PLShare incrementallyDeleteAndSaveWithError:](&v22, sel_incrementallyDeleteAndSaveWithError_, a3);

  _Block_object_dispose(buf, 8);
  return v20;
}

- (void)updateRulesDataWithCloudSyncableRulesData:(id)a3
{
  id v4;
  void *v5;
  PLLibraryScope *v6;
  id v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    +[PLQueryHandler constructQueryFromData:](PLQueryHandler, "constructQueryFromData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (+[PLLibraryScope _queryIsShareEverythingInternalQuery:](PLLibraryScope, "_queryIsShareEverythingInternalQuery:", v5))
      {
        -[PLLibraryScope setAutoSharePolicy:](self, "setAutoSharePolicy:", 1);
        v6 = self;
        v7 = 0;
      }
      else
      {
        -[PLLibraryScope setAutoSharePolicy:](self, "setAutoSharePolicy:", 2);
        v6 = self;
        v7 = v8;
      }
      -[PLLibraryScope setRulesData:](v6, "setRulesData:", v7);
    }

  }
  else
  {
    -[PLLibraryScope setAutoSharePolicy:](self, "setAutoSharePolicy:", 0);
    -[PLLibraryScope setRulesData:](self, "setRulesData:", 0);
  }

}

- (id)cloudSyncableRulesData
{
  int v3;
  void *v4;
  void *v5;

  v3 = -[PLLibraryScope autoSharePolicy](self, "autoSharePolicy");
  if (v3 == 2)
  {
    -[PLLibraryScope rulesData](self, "rulesData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    +[PLLibraryScope _shareEverythingInternalQuery](PLLibraryScope, "_shareEverythingInternalQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLQueryHandler dataFromQuery:](PLQueryHandler, "dataFromQuery:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)updatePeopleRulesForTombstonePersonUUID:(id)a3 replaceWithPersonUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  BOOL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PLLibraryScope autoSharePolicy](self, "autoSharePolicy") >= 2)
  {
    -[PLLibraryScope rulesData](self, "rulesData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:](PLLibraryScopeRule, "libraryScopeRulesForLibraryScopeRulesData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    v8 = v12 != 0;
    v13 = v11;
    if (v12)
    {
      v14 = v12;
      v23 = v12 != 0;
      v15 = 0;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v18, "personCondition");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v15 |= objc_msgSend(v20, "replaceTombstonePersonUUID:withPersonUUID:", v6, v7);

          objc_autoreleasePoolPop(v19);
        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v14);

      if ((v15 & 1) == 0)
      {
        v8 = 0;
        goto LABEL_16;
      }
      PLBackendSharingGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v6;
        v30 = 2114;
        v31 = v7;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "LibraryScope custom rules updated: tombstone person %{public}@ replaced with %{public}@", buf, 0x16u);
      }

      +[PLLibraryScopeRule dataForLibraryScopeRules:](PLLibraryScopeRule, "dataForLibraryScopeRules:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLibraryScope setRulesData:](self, "setRulesData:", v13);
      v8 = v23;
    }

LABEL_16:
    goto LABEL_17;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)updatePeopleRulesForAllTombstonedPersons
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (-[PLLibraryScope autoSharePolicy](self, "autoSharePolicy") >= 2)
  {
    -[PLLibraryScope rulesData](self, "rulesData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:](PLLibraryScopeRule, "libraryScopeRulesForLibraryScopeRulesData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v5;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    v3 = 0;
    if (v26)
    {
      v25 = *(_QWORD *)v35;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v6);
          v8 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v7, "personCondition");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "personUUIDs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v10, "count"))
          {
            v28 = v8;
            v29 = v6;
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            v27 = v10;
            v11 = v10;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v31;
              do
              {
                v15 = 0;
                do
                {
                  if (*(_QWORD *)v31 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15);
                  -[PLManagedObject photoLibrary](self, "photoLibrary");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "managedObjectContext");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v16, v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v19, "verifiedType") == -2)
                  {
                    objc_msgSend(v19, "finalMergeTargetPerson");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v20)
                    {
                      objc_msgSend(v19, "personUUID");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "personUUID");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v3 |= -[PLLibraryScope updatePeopleRulesForTombstonePersonUUID:replaceWithPersonUUID:](self, "updatePeopleRulesForTombstonePersonUUID:replaceWithPersonUUID:", v21, v22);

                    }
                  }

                  ++v15;
                }
                while (v13 != v15);
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v13);
            }

            v8 = v28;
            v6 = v29;
            v10 = v27;
          }

          objc_autoreleasePoolPop(v8);
          ++v6;
        }
        while (v6 != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v26);
    }

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3 & 1;
}

- (BOOL)removePeopleRulesForPersonUUID:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLLibraryScope autoSharePolicy](self, "autoSharePolicy") >= 2)
  {
    -[PLLibraryScope rulesData](self, "rulesData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:](PLLibraryScopeRule, "libraryScopeRulesForLibraryScopeRulesData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    v5 = v9 != 0;
    v10 = v8;
    if (v9)
    {
      v11 = v9;
      v12 = 0;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x19AEC1554](v9);
          objc_msgSend(v15, "personCondition", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v12 |= objc_msgSend(v17, "removePersonUUID:", v4);

          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v11 != v14);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        v11 = v9;
      }
      while (v9);

      if ((v12 & 1) == 0)
      {
        v5 = 0;
        goto LABEL_16;
      }
      PLBackendSharingGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v4;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "LibraryScope custom rules updated: person %{public}@ removed", buf, 0xCu);
      }

      +[PLLibraryScopeRule dataForLibraryScopeRules:](PLLibraryScopeRule, "dataForLibraryScopeRules:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLibraryScope setRulesData:](self, "setRulesData:", v10);
    }

LABEL_16:
    goto LABEL_17;
  }
  v5 = 0;
LABEL_17:

  return v5;
}

id __54__PLLibraryScope_incrementallyDeleteAndSaveWithError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __54__PLLibraryScope_incrementallyDeleteAndSaveWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "removeLibraryScopeAndContributors");
        objc_msgSend(v9, "setLibraryScopeShareState:", 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v4, "count");

}

void __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShareParticipant participantsWithUUIDs:inPhotoLibrary:](PLShareParticipant, "participantsWithUUIDs:inPhotoLibrary:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deleteObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

uint64_t __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_223(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLBackendSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "RemoveParticipants: Failed to remove participants with UUIDs %@ for library scope %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    PLBackendSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v31 = v12;
        v32 = 2112;
        v33 = v13;
        v34 = 2112;
        v35 = v5;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "RemoveParticipants: Successfully removed participants with UUIDs %@ for library scope %@, updated scope change: %@", buf, 0x20u);
      }

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_224;
      v24[3] = &unk_1E3676240;
      v14 = *(void **)(a1 + 48);
      v15 = *(id *)(a1 + 56);
      v16 = *(_QWORD *)(a1 + 64);
      v25 = v15;
      v26 = v16;
      v27 = v5;
      v17 = *(id *)(a1 + 72);
      v28 = 0;
      v29 = v17;
      objc_msgSend(v14, "performTransactionOnLibraryScopeSynchronizationQueue:", v24);

    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v31 = v18;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "RemoveParticipants: Received nil CPLLibraryShareScopeChange back from CPLLibraryManager for library scope %@", buf, 0xCu);
      }

      v19 = *(_QWORD *)(a1 + 72);
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received nil CPLLibraryShareScopeChange back from CPLLibraryManager"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v23);

    }
  }

}

void __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_224(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2_225;
  v7[3] = &unk_1E3677530;
  v3 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3;
  v4[3] = &unk_1E3675C58;
  v6 = *(id *)(a1 + 64);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v3, "performTransactionAndWait:completionHandler:", v7, v4);

}

id __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2_225(uint64_t a1)
{
  return (id)objc_msgSend((id)objc_opt_class(), "insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to start exit on a LibraryScope that's not actively syncing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "StartExit: Unable to start exit on a LibraryScope that's not actively syncing %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_213(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExitState:", 2);
}

uint64_t __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_215(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLBackendSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v30 = v8;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "StartExit: Failed to start exit for library scope %@, %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    PLBackendSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0D113A8], "descriptionForExitState:", objc_msgSend(v5, "exitState"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v11;
        v31 = 2112;
        v32 = v5;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "StartExit: Successfully started exit for library scope %@, updated scope change: %@, updated exit state: %@", buf, 0x20u);

      }
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_218;
      v23[3] = &unk_1E3676240;
      v13 = *(void **)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 56);
      v24 = v14;
      v25 = v15;
      v26 = v5;
      v16 = *(id *)(a1 + 64);
      v27 = 0;
      v28 = v16;
      objc_msgSend(v13, "performTransactionOnLibraryScopeSynchronizationQueue:", v23);

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v30 = v17;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "StartExit: Received nil CPLLibraryShareScopeChange back from CPLLibraryManager for library scope %@", buf, 0xCu);
      }

      v18 = *(_QWORD *)(a1 + 64);
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received nil CPLLibraryShareScopeChange back from CPLLibraryManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v22);

    }
  }

}

void __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_218(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_2_219;
  v7[3] = &unk_1E3677530;
  v3 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_3;
  v4[3] = &unk_1E3675C58;
  v6 = *(id *)(a1 + 64);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v3, "performTransactionAndWait:completionHandler:", v7, v4);

}

id __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_2_219(uint64_t a1)
{
  return (id)objc_msgSend((id)objc_opt_class(), "insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PLEnumerateAndSaveController *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  PLEnumerateAndSaveController *v27;
  void *v28;
  PLEnumerateAndSaveController *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  PLEnumerateAndSaveController *v34;
  uint64_t v35;
  __int128 *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  __int128 *p_buf;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 buf;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEntityName:", v3);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("activeLibraryScopeParticipationState"), 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders"), 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v49[0] = v31;
  v49[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v7);
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v9 = objc_msgSend(v8, "countForFetchRequest:error:", v4, &v43);
  v10 = v43;

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "ConfirmAllRemainingOnboardingPreviewAssets: Count fetch failed: %@", (uint8_t *)&buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("count fetch failed: %@"), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 41003, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD **)(a1 + 64);
    if (v16)
      *v16 = objc_retainAutorelease(v15);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setTotalUnitCount:", v9);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v45 = 0x2020000000;
    v46 = 0;
    v17 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "libraryBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_libraryForEnumerationFromBundle:withName:", v19, "-[PLLibraryScope confirmAllRemainingOnboardingPreviewAssetsWithProgress:databaseContext:withError:]_block_invoke");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNonCoalescing:", 1);
    v22 = [PLEnumerateAndSaveController alloc];
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pathManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_2;
    v41[3] = &unk_1E36700D0;
    v26 = v21;
    v42 = v26;
    v38[0] = v25;
    v38[1] = 3221225472;
    v38[2] = __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_3;
    v38[3] = &unk_1E36677F0;
    p_buf = &buf;
    v39 = *(id *)(a1 + 40);
    v27 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:](v22, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:", v23, v4, v26, v24, 0, 1, v41, 0, v38);

    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v25;
    v33[1] = 3221225472;
    v33[2] = __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_4;
    v33[3] = &unk_1E3675788;
    v35 = *(_QWORD *)(a1 + 56);
    v29 = v27;
    v34 = v29;
    v36 = &buf;
    v37 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v26, "photoLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sync:identifyingBlock:library:", v33, 0, v30);

    _Block_object_dispose(&buf, 8);
  }

}

id __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v11, "libraryScopeShareState") & 0x1F) == 1
          || (objc_msgSend(v11, "libraryScopeShareState") & 0x200000) != 0)
        {
          PLLibraryScopeAssetSetAddToSharedZoneState(1, v11);
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    *a4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v6, "count") + objc_msgSend(*(id *)(a1 + 32), "completedUnitCount"));

}

void __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_4(_QWORD *a1)
{
  void *v2;
  char v3;
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v10 = 0;
  v3 = objc_msgSend(v2, "processObjectsWithError:", &v10);
  v4 = v10;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  v5 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
  PLBackendSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(*(_QWORD *)(a1[6] + 8) + 24);
      *(_DWORD *)buf = 134217984;
      v12 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "ConfirmAllRemainingOnboardingPreviewAssets: Successfully confirmed %lu remaining onboarding preview assets", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "ConfirmAllRemainingOnboardingPreviewAssets: Failed to confirm remaining onboarding preview assets %@", buf, 0xCu);
    }

    v9 = (_QWORD *)a1[7];
    if (v9)
      *v9 = objc_retainAutorelease(v4);
  }

}

id __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  _BYTE *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v34 = 0;
    objc_msgSend(v7, "existingObjectWithID:error:", v10, &v34);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v34;
    v13 = *(_QWORD *)(a1 + 40);
    v33 = v12;
    objc_msgSend(v7, "existingObjectWithID:error:", v13, &v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v33;

    if (v14 && v11)
    {
      v25 = v15;
      v26 = a4;
      v27 = WeakRetained;
      v28 = v8;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = v8;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setLibraryScope:withContributors:", v11, v22);

            objc_msgSend(v21, "setLibraryScopeShareState:", 0);
            v23 = v21;
            objc_msgSend(v23, "setLibraryScopeShareState:", objc_msgSend(v23, "libraryScopeShareState") | 1);

            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v18);
      }

      v8 = v28;
      a4 = v26;
      WeakRetained = v27;
      v15 = v25;
    }
    else
    {
      PLBackendSharingGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v15;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: Failed to load current user/scope: %@", buf, 0xCu);
      }

      *a4 = 1;
    }
    if (objc_msgSend(*(id *)(a1 + 48), "isCancelled"))
      *a4 = 1;

  }
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(v8, "count") + objc_msgSend(*(id *)(a1 + 48), "completedUnitCount"));

}

void __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke_207(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v18 = 0;
  v3 = objc_msgSend(v2, "processObjectsWithError:", &v18);
  v4 = v18;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
  {
    PLBackendSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      v22 = v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "MarkOnboardingPreviewAssets: Successfully set %lu assets as onboarding preview assets", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
  {
    PLBackendSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: Failed to set onboarding preview assets %@", buf, 0xCu);
    }
LABEL_12:

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_13;
  }
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D74498];
  v19 = *MEMORY[0x1E0CB2D50];
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("MarkOnboardingPreviewAssets: Cancelled! Going to reset all asset states... progress: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 41031, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:](PLLibraryScope, "resetLibraryScopeAssetStatesWithManagedObjectContext:", v14);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_13:

}

uint64_t __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLocalPublishState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "trash");
  objc_msgSend(*(id *)(a1 + 32), "setScopeSyncingState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "stopTrackingParticipantAssetTrashedStateIfNeeded");
}

void __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudPhotoLibraryManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stopLibraryScopeRulesChangeTracker");
}

void __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_177(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_2_178;
  v7[3] = &unk_1E3671878;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v5 = *(void **)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v6 = v3;
  objc_msgSend(v4, "performTransactionOnLibraryScopeSynchronizationQueue:", v7);

}

void __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_2_178(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E3677C18;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v11 = v4;
  v12 = v5;
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_179;
  v7[3] = &unk_1E3675C58;
  v9 = v6;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performTransaction:completionHandler:withPriority:", v10, v7, 1);

}

void __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "setLocalPublishState:", 3);
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to deactivate library scope %@: %@", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v2, "setLocalPublishState:", 0);
    objc_msgSend(*(id *)(a1 + 40), "trash");
    objc_msgSend(*(id *)(a1 + 40), "setScopeSyncingState:", 0);
    objc_msgSend(*(id *)(a1 + 40), "stopTrackingParticipantAssetTrashedStateIfNeeded");
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "Deactivated library scope %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

uint64_t __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_179(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLocalPublishState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "untrash");
  objc_msgSend(*(id *)(a1 + 32), "setScopeSyncingState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setPreviewState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_confirmAllRemainingOnboardingPreviewAssetsWithProgress:photoLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "startTrackingParticipantAssetTrashStateIfNeeded");
}

uint64_t __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_174(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_2_175;
  v7[3] = &unk_1E3676D00;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v5 = *(void **)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v13 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v4, "performTransactionOnLibraryScopeSynchronizationQueue:", v7);

}

void __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_2_175(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v2 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E3677998;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v12 = v4;
  v13 = v5;
  v14 = v6;
  v15 = *(id *)(a1 + 32);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_176;
  v7[3] = &unk_1E3676290;
  v10 = *(id *)(a1 + 72);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v3, "performTransaction:completionHandler:withPriority:", v11, v7, 1);

}

void __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "setLocalPublishState:", 3);
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to activate library scope %@: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v2, "setLocalPublishState:", 2);
    objc_msgSend(*(id *)(a1 + 40), "untrash");
    objc_msgSend(*(id *)(a1 + 40), "setPreviewState:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setScopeSyncingState:", 1);
    objc_msgSend(*(id *)(a1 + 40), "startTrackingParticipantAssetTrashStateIfNeeded");
    PLBackendSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Activated library scope %@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "_confirmAllRemainingOnboardingPreviewAssetsWithProgress:photoLibrary:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

uint64_t __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_176(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "startLibraryScopeRulesChangeTracker");
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("fakeShareURL://%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setShareURL:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setLocalPublishState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setParticipantCloudUpdateState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setScopeSyncingState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setPreviewState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "currentUserParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12 = v7;
    objc_msgSend(v7, "setAcceptanceStatus:", 2);
    objc_msgSend(v12, "setRole:", 1);
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("_fakeUserID-%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserIdentifier:", v11);

    v7 = v12;
  }

}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "shareURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v1 + 16))(v1, v2, 0, 0);

}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2_162;
  v15[3] = &unk_1E3662008;
  v9 = *(void **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = v6;
  v10 = *(void **)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = v7;
  v21 = v5;
  v22 = v10;
  v20 = v8;
  v11 = v5;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v9, "performTransactionOnLibraryScopeSynchronizationQueue:", v15);

}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2_166;
  v17[3] = &unk_1E366C620;
  v10 = *(void **)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v19 = v6;
  v11 = *(void **)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 48);
  v21 = v8;
  v22 = v9;
  v23 = v7;
  v24 = v5;
  v25 = v11;
  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v8;
  v16 = v6;
  objc_msgSend(v10, "performTransactionOnLibraryScopeSynchronizationQueue:", v17);

}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2_166(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_3_167;
  v12[3] = &unk_1E3675A78;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v13 = v4;
  v14 = v5;
  v15 = v6;
  v16 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 72);
  v18 = *(id *)(a1 + 32);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_168;
  v7[3] = &unk_1E3671878;
  v11 = *(id *)(a1 + 88);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 80);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performTransactionAndWait:completionHandler:", v12, v7);

}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_3_167(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setLocalPublishState:", 3);
    PLBackendSharingGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Failed to publish library scope %@: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    if (!*(_QWORD *)(a1 + 48))
    {
      PLBackendSharingGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "compactDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Missing shareURL after publishing library scope %@", (uint8_t *)&v10, 0xCu);

      }
    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "setScopeIdentifier:");
    }
    else
    {
      PLBackendSharingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "compactDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Missing scopeIdentifier after publishing library scope %@", (uint8_t *)&v10, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "updateShareWithCPLShare:inPhotoLibrary:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 40), "setLocalPublishState:", 2);
    objc_msgSend(*(id *)(a1 + 40), "setPreviewState:", 0);
    PLBackendSharingGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "Published library scope %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

uint64_t __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_168(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2_162(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E3677998;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v13 = v4;
  v14 = v5;
  v15 = v6;
  v16 = *(id *)(a1 + 32);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_163;
  v7[3] = &unk_1E3671878;
  v11 = *(id *)(a1 + 80);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performTransactionAndWait:completionHandler:", v12, v7);

}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "setParticipantCloudUpdateState:", 3);
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to update library scope %@: %@", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v2, "updateShareWithCPLShare:inPhotoLibrary:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "setParticipantCloudUpdateState:", 2);
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "Updated library scope %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

uint64_t __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_163(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "compactDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to accept library scope %@: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "libraryServicesManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudPhotoLibraryManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_147;
    v10[3] = &unk_1E3675C58;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v8, "performTransactionOnLibraryScopeSynchronizationQueue:", v10);

  }
}

void __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_147(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E3677AA0;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_148;
  v4[3] = &unk_1E3676CD8;
  v5 = v3;
  objc_msgSend(v2, "performTransaction:completionHandler:", v6, v4);

}

uint64_t __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLBackendSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "compactDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "Accepted library scope %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", 3);
  objc_msgSend(*(id *)(a1 + 32), "setPreviewState:", 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_confirmAllRemainingOnboardingPreviewAssetsWithProgress:photoLibrary:", 0, v5);

  return objc_msgSend(*(id *)(a1 + 32), "setScopeSyncingState:", 1);
}

uint64_t __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __34__PLLibraryScope_isSyncableChange__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("rulesData"), CFSTR("localPublishState"), CFSTR("lastParticipantAssetTrashNotificationViewedDate"), 0);
  v1 = (void *)isSyncableChange_syncedProperties;
  isSyncableChange_syncedProperties = v0;

}

void __39__PLLibraryScope_setScopeSyncingState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v4 = objc_msgSend((id)objc_opt_class(), "libraryScopeIsActiveWithScopeSyncingState:", *(__int16 *)(a1 + 40));
    v3 = v8;
    if (v4)
    {
      v5 = (void *)objc_opt_class();
      objc_msgSend(v8, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_cleanupLocalPreviewLibraryScopesInManagedObjectContext:", v7);

      v3 = v8;
    }
  }

}

@end

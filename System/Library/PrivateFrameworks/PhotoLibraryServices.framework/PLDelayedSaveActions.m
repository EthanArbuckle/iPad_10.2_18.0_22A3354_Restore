@implementation PLDelayedSaveActions

- (PLDelayedSaveActions)initWithClientTransaction:(id)a3
{
  id v5;
  PLDelayedSaveActions *v6;
  PLDelayedSaveActions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLDelayedSaveActions;
  v6 = -[PLDelayedSaveActions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientTransaction, a3);

  return v7;
}

- (void)persistDelayedActionsScope:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLDelayedSaveActions clientTransaction](self, "clientTransaction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addChangeScopes:", v5);
}

- (id)popDelayedSaveActionsDetail
{
  PLDelayedSaveActionsDetail *v3;

  v3 = objc_alloc_init(PLDelayedSaveActionsDetail);
  -[PLDelayedSaveActions _popCloudFeedChangesIntoDetail:](self, "_popCloudFeedChangesIntoDetail:", v3);
  -[PLDelayedSaveActions _popMomentChangesIntoDetail:](self, "_popMomentChangesIntoDetail:", v3);
  -[PLDelayedSaveActions _popAssetsForFilesystemPersistencyChangesIntoDetail:](self, "_popAssetsForFilesystemPersistencyChangesIntoDetail:", v3);
  -[PLDelayedSaveActions _popSearchIndexChangesIntoDetail:](self, "_popSearchIndexChangesIntoDetail:", v3);
  -[PLDelayedSaveActions _popAlbumCountChangesIntoDetail:](self, "_popAlbumCountChangesIntoDetail:", v3);
  -[PLDelayedSaveActions _popAlbumKeyAssetsChangesIntoDetail:](self, "_popAlbumKeyAssetsChangesIntoDetail:", v3);
  -[PLDelayedSaveActions _popImportSessionCountChangesIntoDetail:](self, "_popImportSessionCountChangesIntoDetail:", v3);
  -[PLDelayedSaveActions _popDuetDeletedAssetsIntoDetail:](self, "_popDuetDeletedAssetsIntoDetail:", v3);
  -[PLDelayedSaveActions _popDuetDeletedMemoriesIntoDetail:](self, "_popDuetDeletedMemoriesIntoDetail:", v3);
  -[PLDelayedSaveActions _popWidgetTimelineReloadNeeded:](self, "_popWidgetTimelineReloadNeeded:", v3);
  -[PLDelayedSaveActions _popWidgetUserAlbumAssetRemovalReloadNeeded:](self, "_popWidgetUserAlbumAssetRemovalReloadNeeded:", v3);
  -[PLDelayedSaveActions _popWidgetFavoriteAlbumAssetRemovalReloadNeeded:](self, "_popWidgetFavoriteAlbumAssetRemovalReloadNeeded:", v3);
  -[PLDelayedSaveActions _popWallpaperUserAlbumAssetRemovalReloadNeeded:](self, "_popWallpaperUserAlbumAssetRemovalReloadNeeded:", v3);
  -[PLDelayedSaveActions _popWallpaperFavoriteAlbumAssetRemovalReloadNeeded:](self, "_popWallpaperFavoriteAlbumAssetRemovalReloadNeeded:", v3);
  -[PLDelayedSaveActions _popFeaturedContentUpdateNeededForPerson:](self, "_popFeaturedContentUpdateNeededForPerson:", v3);
  -[PLDelayedSaveActions _popMemoryAssetUpdateIntoDetail:](self, "_popMemoryAssetUpdateIntoDetail:", v3);
  -[PLDelayedSaveActions _popWallpaperSuggestionReloadIntoDetail:](self, "_popWallpaperSuggestionReloadIntoDetail:", v3);
  -[PLDelayedSaveActions _popLibraryScopeParticipantsUpdateIntoDetail:](self, "_popLibraryScopeParticipantsUpdateIntoDetail:", v3);
  -[PLDelayedSaveActions _popLibraryScopeRulesUpdatedIntoDetail:](self, "_popLibraryScopeRulesUpdatedIntoDetail:", v3);
  -[PLDelayedSaveActions _popMemberIDsOfGroupNeedingContainmentUpdateIntoDetail:](self, "_popMemberIDsOfGroupNeedingContainmentUpdateIntoDetail:", v3);
  -[PLDelayedSaveActions _popAssetIDsNeedingSocialGroupContainmentUpdateIntoDetail:](self, "_popAssetIDsNeedingSocialGroupContainmentUpdateIntoDetail:", v3);
  -[PLDelayedSaveActions _popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail:](self, "_popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail:", v3);
  -[PLDelayedSaveActions _popAssetIDsNeedingAssetPersonEdgeUpdateIntoDetail:](self, "_popAssetIDsNeedingAssetPersonEdgeUpdateIntoDetail:", v3);
  -[PLDelayedSaveActions _popSocialGroupNodeIDsNeedingDeduplicationIntoDetail:](self, "_popSocialGroupNodeIDsNeedingDeduplicationIntoDetail:", v3);
  -[PLDelayedSaveActions _popMembersOfGroupsNeedingDeduplicationIntoDetail:](self, "_popMembersOfGroupsNeedingDeduplicationIntoDetail:", v3);
  return v3;
}

- (void)_popCloudFeedChangesIntoDetail:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = 0;
  v19 = 0;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  v4 = a3;
  -[PLDelayedSaveActions _popDelayedCloudFeedAlbumUpdates:assetInserts:assetUpdates:commentInserts:invitationRecordUpdates:deletionEntries:](self, "_popDelayedCloudFeedAlbumUpdates:assetInserts:assetUpdates:commentInserts:invitationRecordUpdates:deletionEntries:", &v22, &v21, &v20, &v19, &v18, &v17);
  v5 = v22;
  v6 = v21;
  v7 = v20;
  v8 = v19;
  v9 = v18;
  v10 = v17;
  objc_msgSend(v4, "setCloudFeedAlbumUpdates:", v5);
  objc_msgSend(v4, "setCloudFeedAssetInserts:", v6);
  objc_msgSend(v4, "setCloudFeedAssetUpdates:", v7);
  objc_msgSend(v4, "setCloudFeedCommentInserts:", v8);
  objc_msgSend(v4, "setCloudFeedInvitationRecordUpdates:", v9);
  objc_msgSend(v4, "setCloudFeedDeletionEntries:", v10);

  PLChangeHandlingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "cloudFeedAlbumUpdates=%@", buf, 0xCu);
  }

  PLChangeHandlingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "cloudFeedAssetInserts=%@", buf, 0xCu);
  }

  PLChangeHandlingGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v7;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "cloudFeedAssetUpdates=%@", buf, 0xCu);
  }

  PLChangeHandlingGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "cloudFeedCommentInserts=%@", buf, 0xCu);
  }

  PLChangeHandlingGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "cloudFeedInvitationRecordUpdates=%@", buf, 0xCu);
  }

  PLChangeHandlingGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "cloudFeedDeletionEntries=%@", buf, 0xCu);
  }

}

- (void)_popMomentChangesIntoDetail:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v13 = 0;
  v14 = 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  v4 = a3;
  -[PLDelayedSaveActions _popDelayedMomentInsertsAndUpdates:deletes:updatedAssetIDsForHighlights:updatedMomentIDsForHighlights:sharedAssetContainerIncrementalChanges:](self, "_popDelayedMomentInsertsAndUpdates:deletes:updatedAssetIDsForHighlights:updatedMomentIDsForHighlights:sharedAssetContainerIncrementalChanges:", &v14, &v13, &v12, &v11, &v10);
  v5 = v14;
  v6 = v13;
  v7 = v12;
  v8 = v11;
  v9 = v10;
  objc_msgSend(v4, "setMomentInsertsAndUpdates:", v5);
  objc_msgSend(v4, "setMomentDeletes:", v6);
  objc_msgSend(v4, "setUpdatedAssetIDsForHighlights:", v7);
  objc_msgSend(v4, "setUpdatedMomentIDsForHighlights:", v8);
  objc_msgSend(v4, "setSharedAssetContainerIncrementalChangesByAssetID:", v9);

}

- (void)_popAssetsForFilesystemPersistencyChangesIntoDetail:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = 0;
  v4 = a3;
  -[PLDelayedSaveActions _popDelayedAssetsForFilesystemPersistencyUpdates:](self, "_popDelayedAssetsForFilesystemPersistencyUpdates:", &v6);
  v5 = v6;
  objc_msgSend(v4, "setAssetsForFilesystemPersistency:", v5);

}

- (void)_popSearchIndexChangesIntoDetail:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = 0;
  v4 = a3;
  -[PLDelayedSaveActions _popDelayedSearchIndexUpdates:](self, "_popDelayedSearchIndexUpdates:", &v6);
  v5 = v6;
  objc_msgSend(v4, "setSearchIndexUpdates:", v5);

}

- (void)_popAlbumCountChangesIntoDetail:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = 0;
  v4 = a3;
  -[PLDelayedSaveActions _popDelayedAlbumCountsAndDateRangeUpdates:](self, "_popDelayedAlbumCountsAndDateRangeUpdates:", &v6);
  v5 = v6;
  objc_msgSend(v4, "setAlbumCountsAndDateRangeUpdates:", v5);

}

- (void)_popAlbumKeyAssetsChangesIntoDetail:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = 0;
  v4 = a3;
  -[PLDelayedSaveActions _popDelayedAlbumKeyAssetsUpdates:](self, "_popDelayedAlbumKeyAssetsUpdates:", &v6);
  v5 = v6;
  objc_msgSend(v4, "setAlbumKeyAssetsUpdates:", v5);

}

- (void)_popImportSessionCountChangesIntoDetail:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = 0;
  v4 = a3;
  -[PLDelayedSaveActions _popDelayedImportSessionCountsAndDateRangeUpdates:](self, "_popDelayedImportSessionCountsAndDateRangeUpdates:", &v6);
  v5 = v6;
  objc_msgSend(v4, "setImportSessionCountsAndDateRangeUpdates:", v5);

}

- (void)_recordDelayedMomentAssetDeletionsDictionary:(id)a3 forKey:(id)a4
{
  id v6;
  NSMapTable *delayedMomentAssetDeletions;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  delayedMomentAssetDeletions = self->_delayedMomentAssetDeletions;
  if (!delayedMomentAssetDeletions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_delayedMomentAssetDeletions;
    self->_delayedMomentAssetDeletions = v8;

    delayedMomentAssetDeletions = self->_delayedMomentAssetDeletions;
  }
  -[NSMapTable setObject:forKey:](delayedMomentAssetDeletions, "setObject:forKey:", v10, v6);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeMomentGeneration"));

}

- (void)_recordDelayedMomentAssetUpdates:(id)a3
{
  id v4;
  NSMutableArray *delayedMomentAssetUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  delayedMomentAssetUpdates = self->_delayedMomentAssetUpdates;
  v8 = v4;
  if (!delayedMomentAssetUpdates)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_delayedMomentAssetUpdates;
    self->_delayedMomentAssetUpdates = v6;

    v4 = v8;
    delayedMomentAssetUpdates = self->_delayedMomentAssetUpdates;
  }
  -[NSMutableArray addObject:](delayedMomentAssetUpdates, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeMomentGeneration"));

}

- (void)_recordDelayedHighlightMomentUpdates:(id)a3
{
  id v4;
  NSMutableSet *delayedHighlightMomentUpdates;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedHighlightMomentUpdates = self->_delayedHighlightMomentUpdates;
  v8 = v4;
  if (!delayedHighlightMomentUpdates)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_delayedHighlightMomentUpdates;
    self->_delayedHighlightMomentUpdates = v6;

    v4 = v8;
    delayedHighlightMomentUpdates = self->_delayedHighlightMomentUpdates;
  }
  -[NSMutableSet addObject:](delayedHighlightMomentUpdates, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeMomentGeneration"));

}

- (id)_existingSharedAssetChangeContainerForAsset:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *delayedSharedAssetIncrementalChangeContainersByAssetUUID;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    delayedSharedAssetIncrementalChangeContainersByAssetUUID = self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID;
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](delayedSharedAssetIncrementalChangeContainersByAssetUUID, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_recordSharedAssetIncrementalChange:(id)a3 forAsset:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *delayedSharedAssetIncrementalChangeContainersByAssetUUID;
  void *v9;
  void *v10;
  void *v11;
  PLSharedAssetsContainerIncrementalChangeContainer *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v13, "hasChanges"))
  {
    if (!self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      delayedSharedAssetIncrementalChangeContainersByAssetUUID = self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID;
      self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID = v7;

    }
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[PLDelayedSaveActions _existingSharedAssetChangeContainerForAsset:](self, "_existingSharedAssetChangeContainerForAsset:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "change");
        v12 = (PLSharedAssetsContainerIncrementalChangeContainer *)objc_claimAutoreleasedReturnValue();
        -[PLSharedAssetsContainerIncrementalChangeContainer mergeChangesFrom:](v12, "mergeChangesFrom:", v13);
      }
      else
      {
        v12 = -[PLSharedAssetsContainerIncrementalChangeContainer initWithAsset:change:]([PLSharedAssetsContainerIncrementalChangeContainer alloc], "initWithAsset:change:", v6, v13);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID, "setObject:forKeyedSubscript:", v12, v9);
      }

    }
  }

}

- (void)recordAssetForMomentUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  PLSharedAssetsContainerIncrementalChange *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  PLDelayedSaveActions *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  PLDelayedSaveActions *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  BOOL v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  PLDelayedSaveActions *v75;
  int v76;
  int v77;
  _BOOL4 v78;
  _BOOL4 v79;
  int v80;
  void *v81;
  const __CFString *v82;
  const __CFString *v83;
  uint8_t buf[4];
  void *v85;
  _QWORD v86[2];
  _QWORD v87[4];

  v87[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isIncludedInMoments"))
  {
    if (objc_msgSend(v4, "isInserted"))
      v80 = objc_msgSend(v4, "isInFlight") ^ 1;
    else
      v80 = 0;
    v7 = objc_msgSend(v4, "isUpdated");
    v8 = objc_msgSend(v4, "isDeleted");
    v9 = objc_msgSend(v4, "needsMomentUpdate");
    objc_msgSend(v4, "photoLibrary");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changedValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(PLSharedAssetsContainerIncrementalChange);
    -[PLSharedAssetsContainerIncrementalChange setMediaType:](v11, "setMediaType:", objc_msgSend(v4, "kind") != 0);
    v81 = v10;
    if ((v7 & 1) == 0 && !v8)
      goto LABEL_31;
    -[NSObject libraryServicesManager](v5, "libraryServicesManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "databaseContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "momentLibrary");
    v14 = objc_claimAutoreleasedReturnValue();

    if (v5 == v14)
      goto LABEL_49;
    v10 = v81;
    objc_msgSend((id)objc_opt_class(), "_addHighlightRelationshipChangesFromChangedValues:onAsset:intoChange:forRelationshipNamed:", v81, v4, v11, CFSTR("highlightBeingAssets"));
    objc_msgSend((id)objc_opt_class(), "_addHighlightRelationshipChangesFromChangedValues:onAsset:intoChange:forRelationshipNamed:", v81, v4, v11, CFSTR("highlightBeingExtendedAssets"));
    objc_msgSend((id)objc_opt_class(), "_addHighlightRelationshipChangesFromChangedValues:onAsset:intoChange:forRelationshipNamed:", v81, v4, v11, CFSTR("highlightBeingSummaryAssets"));
    objc_msgSend((id)objc_opt_class(), "_addHighlightRelationshipChangesFromChangedValues:onAsset:intoChange:forRelationshipNamed:", v81, v4, v11, CFSTR("dayGroupHighlightBeingAssets"));
    objc_msgSend((id)objc_opt_class(), "_addHighlightRelationshipChangesFromChangedValues:onAsset:intoChange:forRelationshipNamed:", v81, v4, v11, CFSTR("dayGroupHighlightBeingExtendedAssets"));
    objc_msgSend((id)objc_opt_class(), "_addHighlightRelationshipChangesFromChangedValues:onAsset:intoChange:forRelationshipNamed:", v81, v4, v11, CFSTR("dayGroupHighlightBeingSummaryAssets"));
    -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](v11, "highlightContainerChanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
LABEL_31:
      if (!v7)
        goto LABEL_50;
      goto LABEL_32;
    }
    if (v8)
    {
      v87[0] = CFSTR("libraryScope");
      v87[1] = CFSTR("additionalAttributes");
      v87[2] = CFSTR("libraryScopeShareState");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "committedValuesForKeys:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "objectForKey:", CFSTR("libraryScope"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);
      if (v19)
        v22 = v21;
      else
        v22 = 1;
      v76 = v22;

      v74 = v18;
      objc_msgSend(v18, "objectForKey:", CFSTR("libraryScopeShareState"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isEqual:", v24) & 1) != 0)
      {
        v25 = 2;
LABEL_45:

        v9 = 1;
        if (v76)
          v36 = 2;
        else
          v36 = 1;
        -[PLSharedAssetsContainerIncrementalChange setSharingChange:](v11, "setSharingChange:", v36);
        -[PLSharedAssetsContainerIncrementalChange setSuggestionStateChange:](v11, "setSuggestionStateChange:", v25);

LABEL_49:
        v10 = v81;
        if (!v7)
        {
LABEL_50:
          v32 = 0;
          if (!v8)
            goto LABEL_51;
          goto LABEL_98;
        }
LABEL_32:
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("dateCreated"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = 1;
        }
        else
        {
          v77 = v9;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("locationData"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v32 = 1;
          }
          else
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("visibilityState"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v32 = 1;
            }
            else
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hidden"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
              {
                v32 = 1;
              }
              else
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("trashedState"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                if (v57)
                {
                  v32 = 1;
                }
                else
                {
                  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("savedAssetType"));
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = v61 != 0;

                  v57 = 0;
                }

                v35 = 0;
              }

              v34 = 0;
            }

          }
          v10 = v81;
          v9 = v77;
        }

        if (!v8)
        {
LABEL_51:
          v37 = v80;
          if ((v80 | v7 | v9) != 1)
          {
LABEL_111:
            if (-[PLSharedAssetsContainerIncrementalChange hasChanges](v11, "hasChanges"))
            {
              -[PLSharedAssetsContainerIncrementalChange setHasNoOtherAssetChangesRequiringMomentGeneration:](v11, "setHasNoOtherAssetChangesRequiringMomentGeneration:", !v32);
              -[PLDelayedSaveActions _recordSharedAssetIncrementalChange:forAsset:](self, "_recordSharedAssetIncrementalChange:forAsset:", v11, v4);
              objc_msgSend(v4, "photoLibrary");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "libraryServicesManager");
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v71, "wellKnownPhotoLibraryIdentifier") == 1)
              {
                objc_msgSend(v71, "backgroundJobService");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "libraryBundle");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "signalBackgroundProcessingNeededOnBundle:", v73);

              }
            }

            goto LABEL_116;
          }
          if (!v7)
          {
LABEL_88:
            if ((v9 | v37 | v32) == 1)
            {
              PLMomentsGetLog();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v4, "objectID");
                v59 = v32;
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v85 = v60;
                _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_DEBUG, "Adding asset %@ to be updated in moments", buf, 0xCu);

                v32 = v59;
              }

              -[PLDelayedSaveActions _recordDelayedMomentAssetUpdates:](self, "_recordDelayedMomentAssetUpdates:", v4);
            }
            goto LABEL_111;
          }
          -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](v11, "highlightContainerChanges");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v38, "count"))
          {
            v78 = v32;
            v39 = self;
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("libraryScope"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v40)
            {
              self = v39;
LABEL_62:
              -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](v11, "highlightContainerChanges");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v46, "count"))
              {
LABEL_87:

                goto LABEL_88;
              }
              v47 = v10;
              v48 = self;
              objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("libraryScopeShareState"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v49)
              {
                self = v48;
                v10 = v81;
                goto LABEL_88;
              }
              v82 = CFSTR("libraryScopeShareState");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "committedValuesForKeys:", v50);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v46, "objectForKey:", CFSTR("libraryScopeShareState"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "integerValue");
              if (v52 > 65537)
              {
                if (v52 != 65538)
                {
                  v53 = v52 == 65552;
                  goto LABEL_71;
                }
              }
              else if (v52 != 2)
              {
                v53 = v52 == 16;
LABEL_71:
                self = v48;
                v54 = v53;
                goto LABEL_73;
              }
              self = v48;
              v54 = 1;
LABEL_73:
              v55 = objc_msgSend(v4, "libraryScopeShareState");
              v10 = v81;
              if (v55 > 65537)
              {
                if (v55 != 65552 && v55 != 65538)
                {
LABEL_83:
                  if (v54)
                  {
                    v56 = 2;
                    goto LABEL_85;
                  }
                  goto LABEL_86;
                }
              }
              else if (v55 != 2 && v55 != 16)
              {
                goto LABEL_83;
              }
              if ((v54 & 1) == 0)
              {
                v56 = 1;
LABEL_85:
                -[PLSharedAssetsContainerIncrementalChange setSuggestionStateChange:](v11, "setSuggestionStateChange:", v56);
                v9 = 1;
              }
LABEL_86:

              v37 = v80;
              goto LABEL_87;
            }
            v83 = CFSTR("libraryScope");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "committedValuesForKeys:", v41);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v38, "objectForKey:", CFSTR("libraryScope"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v41) = (v42 != 0) & ~objc_msgSend(v42, "isEqual:", v43);

            v44 = objc_msgSend(v4, "hasLibraryScope");
            if ((_DWORD)v41 != v44)
            {
              v9 = 1;
              if (v44)
                v45 = 1;
              else
                v45 = 2;
              -[PLSharedAssetsContainerIncrementalChange setSharingChange:](v11, "setSharingChange:", v45);
            }

            self = v39;
            v37 = v80;
            v32 = v78;
          }

          goto LABEL_62;
        }
LABEL_98:
        objc_msgSend(v4, "managedObjectContext");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v62, "hasPreviouslyMergedDeleteForObject:", v4) & 1) == 0)
        {
          v79 = v32;
          v86[0] = CFSTR("dateCreated");
          v86[1] = CFSTR("locationData");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "committedValuesForKeys:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("dateCreated"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("locationData"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (v65)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              objc_msgSend(v67, "setObject:forKeyedSubscript:", v65, CFSTR("dateCreated"));
          }
          if (v66)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              objc_msgSend(v67, "setObject:forKeyedSubscript:", v66, CFSTR("locationData"));
          }
          if (objc_msgSend(v67, "count"))
          {
            PLMomentsGetLog();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v4, "objectID");
              v75 = self;
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v85 = v69;
              _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_DEBUG, "Removing asset %@ from moments", buf, 0xCu);

              self = v75;
            }

            -[PLSharedAssetsContainerIncrementalChange setCollectionChangeType:](v11, "setCollectionChangeType:", 2);
            -[PLDelayedSaveActions _recordDelayedMomentAssetDeletionsDictionary:forKey:](self, "_recordDelayedMomentAssetDeletionsDictionary:forKey:", v67, v4);
          }

          v10 = v81;
          v32 = v79;
        }

        goto LABEL_111;
      }
      v29 = objc_msgSend(v23, "integerValue");
      if (v29 > 65537)
      {
        if (v29 != 65538)
        {
          v30 = v29 == 65552;
LABEL_42:
          v25 = 1;
          if (!v30)
            v25 = 2;
          goto LABEL_45;
        }
      }
      else if (v29 != 2)
      {
        v30 = v29 == 16;
        goto LABEL_42;
      }
      v25 = 1;
      goto LABEL_45;
    }
    v26 = 1;
    if (objc_msgSend(v4, "hasLibraryScope"))
      v27 = 1;
    else
      v27 = 2;
    -[PLSharedAssetsContainerIncrementalChange setSharingChange:](v11, "setSharingChange:", v27);
    v28 = objc_msgSend(v4, "libraryScopeShareState");
    if (v28 > 65537)
    {
      if (v28 == 65538 || v28 == 65552)
        goto LABEL_30;
    }
    else if (v28 == 2 || v28 == 16)
    {
      goto LABEL_30;
    }
    v26 = 2;
LABEL_30:
    -[PLSharedAssetsContainerIncrementalChange setSuggestionStateChange:](v11, "setSuggestionStateChange:", v26);
    v9 = 1;
    goto LABEL_31;
  }
  PLMomentsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v85 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Ignoring update for asset %@", buf, 0xCu);

  }
LABEL_116:

  if (objc_msgSend(v4, "needsMomentUpdate"))
    objc_msgSend(v4, "setNeedsMomentUpdate:", 0);

}

- (void)recordAdditionalAssetAttributesForMomentUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "changedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeZoneOffset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeZoneName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_7;
  }
  objc_msgSend(v9, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment predicateForAssetsIncludedInMoments](PLMoment, "predicateForAssetsIncludedInMoments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "evaluateWithObject:", v7))
    -[PLDelayedSaveActions _recordDelayedMomentAssetUpdates:](self, "_recordDelayedMomentAssetUpdates:", v7);

LABEL_7:
}

- (void)recordMomentForHighlightUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLMomentsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Recording moment %@ for highlight update", (uint8_t *)&v7, 0xCu);

  }
  -[PLDelayedSaveActions _recordDelayedHighlightMomentUpdates:](self, "_recordDelayedHighlightMomentUpdates:", v4);

}

- (void)_popDelayedMomentInsertsAndUpdates:(id *)a3 deletes:(id *)a4 updatedAssetIDsForHighlights:(id *)a5 updatedMomentIDsForHighlights:(id *)a6 sharedAssetContainerIncrementalChanges:(id *)a7
{
  id v13;
  void *v14;
  NSMapTable *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSMutableDictionary *delayedSharedAssetIncrementalChangeContainersByAssetUUID;
  id v32;
  id *v33;
  id *v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSMutableArray valueForKey:](self->_delayedMomentAssetUpdates, "valueForKey:", CFSTR("objectID"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v13;

  }
  -[NSMutableArray removeAllObjects](self->_delayedMomentAssetUpdates, "removeAllObjects");
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMapTable count](self->_delayedMomentAssetDeletions, "count"))
    {
      v33 = a6;
      v34 = a7;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v15 = self->_delayedMomentAssetDeletions;
      v16 = -[NSMapTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v38 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            -[NSMapTable objectForKey:](self->_delayedMomentAssetDeletions, "objectForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v21, v22);

          }
          v17 = -[NSMapTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v17);
      }

      a6 = v33;
      a7 = v34;
    }
    v23 = objc_retainAutorelease(v14);
    *a4 = v23;

  }
  -[NSMapTable removeAllObjects](self->_delayedMomentAssetDeletions, "removeAllObjects");
  if (a5)
  {
    -[NSMutableSet allObjects](self->_delayedHighlightAssetUpdates, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueForKey:", CFSTR("objectID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_retainAutorelease(v25);
    *a5 = v26;

  }
  -[NSMutableSet removeAllObjects](self->_delayedHighlightAssetUpdates, "removeAllObjects");
  if (a6)
  {
    -[NSMutableSet allObjects](self->_delayedHighlightMomentUpdates, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "valueForKey:", CFSTR("objectID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_retainAutorelease(v28);
    *a6 = v29;

  }
  -[NSMutableSet removeAllObjects](self->_delayedHighlightMomentUpdates, "removeAllObjects");
  if (a7)
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID, "count"));
    delayedSharedAssetIncrementalChangeContainersByAssetUUID = self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __165__PLDelayedSaveActions__popDelayedMomentInsertsAndUpdates_deletes_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_sharedAssetContainerIncrementalChanges___block_invoke;
    v35[3] = &unk_1E3674848;
    v36 = v30;
    v32 = v30;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](delayedSharedAssetIncrementalChangeContainersByAssetUUID, "enumerateKeysAndObjectsUsingBlock:", v35);
    *a7 = (id)objc_msgSend(v32, "copy");

  }
  -[NSMutableDictionary removeAllObjects](self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID, "removeAllObjects");
}

- (void)_recordDelayedCloudFeedAlbumUpdate:(id)a3
{
  id v4;
  NSMutableArray *delayedCloudFeedAlbumUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  delayedCloudFeedAlbumUpdates = self->_delayedCloudFeedAlbumUpdates;
  v8 = v4;
  if (!delayedCloudFeedAlbumUpdates)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_delayedCloudFeedAlbumUpdates;
    self->_delayedCloudFeedAlbumUpdates = v6;

    v4 = v8;
    delayedCloudFeedAlbumUpdates = self->_delayedCloudFeedAlbumUpdates;
  }
  -[NSMutableArray addObject:](delayedCloudFeedAlbumUpdates, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeCloudFeed"));

}

- (void)_recordDelayedCloudFeedDeletionEntries:(id)a3
{
  id v4;
  NSMutableSet *delayedCloudFeedDeletionEntries;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedCloudFeedDeletionEntries = self->_delayedCloudFeedDeletionEntries;
  v8 = v4;
  if (!delayedCloudFeedDeletionEntries)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_delayedCloudFeedDeletionEntries;
    self->_delayedCloudFeedDeletionEntries = v6;

    v4 = v8;
    delayedCloudFeedDeletionEntries = self->_delayedCloudFeedDeletionEntries;
  }
  -[NSMutableSet addObjectsFromArray:](delayedCloudFeedDeletionEntries, "addObjectsFromArray:", v4);
  if (objc_msgSend(v8, "count"))
    -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeCloudFeed"));

}

- (void)_recordDelayedCloudFeedAssetInsert:(id)a3
{
  id v4;
  NSMutableArray *delayedCloudFeedAssetInserts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  delayedCloudFeedAssetInserts = self->_delayedCloudFeedAssetInserts;
  v8 = v4;
  if (!delayedCloudFeedAssetInserts)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_delayedCloudFeedAssetInserts;
    self->_delayedCloudFeedAssetInserts = v6;

    v4 = v8;
    delayedCloudFeedAssetInserts = self->_delayedCloudFeedAssetInserts;
  }
  -[NSMutableArray addObject:](delayedCloudFeedAssetInserts, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeCloudFeed"));

}

- (void)_recordDelayedCloudFeedAssetUpdate:(id)a3
{
  id v4;
  NSMutableArray *delayedCloudFeedAssetUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  delayedCloudFeedAssetUpdates = self->_delayedCloudFeedAssetUpdates;
  v8 = v4;
  if (!delayedCloudFeedAssetUpdates)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_delayedCloudFeedAssetUpdates;
    self->_delayedCloudFeedAssetUpdates = v6;

    v4 = v8;
    delayedCloudFeedAssetUpdates = self->_delayedCloudFeedAssetUpdates;
  }
  -[NSMutableArray addObject:](delayedCloudFeedAssetUpdates, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeCloudFeed"));

}

- (void)_recordDelayedCloudFeedCommentInsert:(id)a3
{
  id v4;
  NSMutableArray *delayedCloudFeedCommentInserts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  delayedCloudFeedCommentInserts = self->_delayedCloudFeedCommentInserts;
  v8 = v4;
  if (!delayedCloudFeedCommentInserts)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_delayedCloudFeedCommentInserts;
    self->_delayedCloudFeedCommentInserts = v6;

    v4 = v8;
    delayedCloudFeedCommentInserts = self->_delayedCloudFeedCommentInserts;
  }
  -[NSMutableArray addObject:](delayedCloudFeedCommentInserts, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeCloudFeed"));

}

- (void)_recordDelayedCloudFeedInvitationRecordUpdate:(id)a3
{
  id v4;
  NSMutableArray *delayedCloudFeedInvitationRecordUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  delayedCloudFeedInvitationRecordUpdates = self->_delayedCloudFeedInvitationRecordUpdates;
  v8 = v4;
  if (!delayedCloudFeedInvitationRecordUpdates)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_delayedCloudFeedInvitationRecordUpdates;
    self->_delayedCloudFeedInvitationRecordUpdates = v6;

    v4 = v8;
    delayedCloudFeedInvitationRecordUpdates = self->_delayedCloudFeedInvitationRecordUpdates;
  }
  -[NSMutableArray addObject:](delayedCloudFeedInvitationRecordUpdates, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeCloudFeed"));

}

- (void)recordAlbumForCloudFeedUpdate:(id)a3
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
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    v27 = 1024;
    v28 = objc_msgSend(v5, "isDeleted");
    v29 = 1024;
    v30 = objc_msgSend(v5, "isInserted");
    v31 = 1024;
    v32 = objc_msgSend(v5, "isUpdated");
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ isDeleted=%i isInserted=%i isUpdated=%i", buf, 0x28u);

  }
  if (objc_msgSend(v5, "isDeleted"))
  {
    objc_msgSend(v5, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "hasPreviouslyMergedDeleteForObject:", v5) & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0C97B48];
      +[PLCloudFeedEntry entityName](PLCloudFeedEntry, "entityName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v5, "cloudGUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateWithFormat:", CFSTR("((entryTypeNumber = %d) OR (entryTypeNumber = %d) OR (entryTypeNumber = %d)) AND (entryAlbumGUID = %@)"), 3, 4, 7, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPredicate:", v15);

      objc_msgSend(v9, "executeFetchRequest:error:", v12, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PLCloudFeedGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "cloudGUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v18;
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "albumGUID=%@ cloudFeedEntries=%@", buf, 0x16u);

      }
      if (objc_msgSend(v16, "count"))
        -[PLDelayedSaveActions _recordDelayedCloudFeedDeletionEntries:](self, "_recordDelayedCloudFeedDeletionEntries:", v16);

    }
    goto LABEL_20;
  }
  if (!objc_msgSend(v5, "isInserted"))
  {
    if (!objc_msgSend(v5, "isUpdated"))
      goto LABEL_21;
    objc_msgSend(v5, "changedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PLCloudFeedGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "changedValues=%@", buf, 0xCu);

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cloudRelationshipState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21
      || (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cloudRelationshipStateLocal")),
          (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cloudSubscriptionDate")),
          (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cloudMultipleContributorsEnabled"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_20;
    }
    -[PLDelayedSaveActions _recordDelayedCloudFeedAlbumUpdate:](self, "_recordDelayedCloudFeedAlbumUpdate:", v5);
LABEL_20:

    goto LABEL_21;
  }
  -[PLDelayedSaveActions _recordDelayedCloudFeedAlbumUpdate:](self, "_recordDelayedCloudFeedAlbumUpdate:", v5);
LABEL_21:

}

- (void)recordAssetForCloudFeedUpdate:(id)a3
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
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 1024;
    v20 = objc_msgSend(v5, "isIncludedInCloudFeeds");
    v21 = 1024;
    v22 = objc_msgSend(v5, "isDeleted");
    v23 = 1024;
    v24 = objc_msgSend(v5, "isInserted");
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ isIncludedInCloudFeeds=%i isDeleted=%i isInserted=%i", buf, 0x28u);

  }
  if (objc_msgSend(v5, "isIncludedInCloudFeeds"))
  {
    if (objc_msgSend(v5, "isDeleted"))
    {
      objc_msgSend(v5, "managedObjectContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "hasPreviouslyMergedDeleteForObject:", v5) & 1) == 0)
      {
        objc_msgSend(v5, "cloudFeedAssetsEntry");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PLCloudFeedGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "objectID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v16 = v12;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "cloudFeedEntry=%@", buf, 0xCu);

        }
        if (v10)
        {
          v14 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDelayedSaveActions _recordDelayedCloudFeedDeletionEntries:](self, "_recordDelayedCloudFeedDeletionEntries:", v13);

        }
      }

    }
    else if (objc_msgSend(v5, "isInserted"))
    {
      -[PLDelayedSaveActions _recordDelayedCloudFeedAssetInsert:](self, "_recordDelayedCloudFeedAssetInsert:", v5);
    }
  }

}

- (void)recordCommentForCloudFeedUpdate:(id)a3
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
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 1024;
    v20 = objc_msgSend(v5, "isDeleted");
    v21 = 1024;
    v22 = objc_msgSend(v5, "isInserted");
    v23 = 1024;
    v24 = objc_msgSend(v5, "isUpdated");
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ isDeleted=%i isInserted=%i isUpdated=%i", buf, 0x28u);

  }
  if (objc_msgSend(v5, "isDeleted"))
  {
    objc_msgSend(v5, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "hasPreviouslyMergedDeleteForObject:", v5) & 1) == 0)
    {
      objc_msgSend(v5, "cloudFeedEntry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PLCloudFeedGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v12;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "cloudFeedEntry=%@", buf, 0xCu);

      }
      if (v10)
      {
        v14 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDelayedSaveActions _recordDelayedCloudFeedDeletionEntries:](self, "_recordDelayedCloudFeedDeletionEntries:", v13);

      }
    }

  }
  else if (objc_msgSend(v5, "isInserted"))
  {
    -[PLDelayedSaveActions _recordDelayedCloudFeedCommentInsert:](self, "_recordDelayedCloudFeedCommentInsert:", v5);
  }
  else
  {
    objc_msgSend(v5, "isUpdated");
  }

}

- (void)recordInvitationRecordForCloudFeedUpdate:(id)a3
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
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    v27 = 1024;
    v28 = objc_msgSend(v5, "isDeleted");
    v29 = 1024;
    v30 = objc_msgSend(v5, "isInserted");
    v31 = 1024;
    v32 = objc_msgSend(v5, "isUpdated");
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ isDeleted=%i isInserted=%i isUpdated=%i", buf, 0x28u);

  }
  if (objc_msgSend(v5, "isDeleted"))
  {
    objc_msgSend(v5, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "hasPreviouslyMergedDeleteForObject:", v5) & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0C97B48];
      +[PLCloudFeedEntry entityName](PLCloudFeedEntry, "entityName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v5, "cloudGUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateWithFormat:", CFSTR("((entryTypeNumber = %d) OR (entryTypeNumber = %d)) AND (entryInvitationRecordGUID = %@)"), 5, 6, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPredicate:", v15);

      objc_msgSend(v9, "executeFetchRequest:error:", v12, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PLCloudFeedGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "cloudGUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v18;
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "invitationRecordGUID=%@ cloudFeedEntries=%@", buf, 0x16u);

      }
      if (objc_msgSend(v16, "count"))
        -[PLDelayedSaveActions _recordDelayedCloudFeedDeletionEntries:](self, "_recordDelayedCloudFeedDeletionEntries:", v16);

    }
    goto LABEL_19;
  }
  if (!objc_msgSend(v5, "isInserted"))
  {
    if (!objc_msgSend(v5, "isUpdated"))
      goto LABEL_20;
    objc_msgSend(v5, "changedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PLCloudFeedGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "changedValues=%@", buf, 0xCu);

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("invitationState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21
      || (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("invitationStateLocal")),
          (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("inviteeSubscriptionDate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_19;
    }
    -[PLDelayedSaveActions _recordDelayedCloudFeedInvitationRecordUpdate:](self, "_recordDelayedCloudFeedInvitationRecordUpdate:", v5);
LABEL_19:

    goto LABEL_20;
  }
  -[PLDelayedSaveActions _recordDelayedCloudFeedInvitationRecordUpdate:](self, "_recordDelayedCloudFeedInvitationRecordUpdate:", v5);
LABEL_20:

}

- (void)recordCloudFeedCommentsEntryForCommentUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isDeleted") & 1) == 0)
  {
    objc_msgSend(v4, "entryLikeComments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "entryComments");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
        goto LABEL_5;
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDelayedSaveActions _recordDelayedCloudFeedDeletionEntries:](self, "_recordDelayedCloudFeedDeletionEntries:", v5);
    }

  }
LABEL_5:

}

- (void)recordCloudFeedAssetsEntryForAssetUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isDeleted") & 1) == 0)
  {
    objc_msgSend(v4, "entryAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDelayedSaveActions _recordDelayedCloudFeedDeletionEntries:](self, "_recordDelayedCloudFeedDeletionEntries:", v7);

    }
  }

}

- (void)_popDelayedCloudFeedAlbumUpdates:(id *)a3 assetInserts:(id *)a4 assetUpdates:(id *)a5 commentInserts:(id *)a6 invitationRecordUpdates:(id *)a7 deletionEntries:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSMutableSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSMutableArray valueForKey:](self->_delayedCloudFeedAlbumUpdates, "valueForKey:", CFSTR("objectID"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v15;

  }
  -[NSMutableArray removeAllObjects](self->_delayedCloudFeedAlbumUpdates, "removeAllObjects");
  if (a4)
  {
    -[NSMutableArray valueForKey:](self->_delayedCloudFeedAssetInserts, "valueForKey:", CFSTR("objectID"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v16;

  }
  -[NSMutableArray removeAllObjects](self->_delayedCloudFeedAssetInserts, "removeAllObjects");
  if (a5)
  {
    -[NSMutableArray valueForKey:](self->_delayedCloudFeedAssetUpdates, "valueForKey:", CFSTR("objectID"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v17;

  }
  -[NSMutableArray removeAllObjects](self->_delayedCloudFeedAssetUpdates, "removeAllObjects");
  if (a6)
  {
    -[NSMutableArray valueForKey:](self->_delayedCloudFeedCommentInserts, "valueForKey:", CFSTR("objectID"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a6 = v18;

  }
  -[NSMutableArray removeAllObjects](self->_delayedCloudFeedCommentInserts, "removeAllObjects");
  if (a7)
  {
    -[NSMutableArray valueForKey:](self->_delayedCloudFeedInvitationRecordUpdates, "valueForKey:", CFSTR("objectID"));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a7 = v19;

  }
  -[NSMutableArray removeAllObjects](self->_delayedCloudFeedInvitationRecordUpdates, "removeAllObjects");
  if (a8 && -[NSMutableSet count](self->_delayedCloudFeedDeletionEntries, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableSet count](self->_delayedCloudFeedDeletionEntries, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v21 = self->_delayedCloudFeedDeletionEntries;
    v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v25), "objectID", (_QWORD)v28);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v23);
    }

    v27 = objc_retainAutorelease(v20);
    *a8 = v27;

  }
  -[NSMutableSet removeAllObjects](self->_delayedCloudFeedDeletionEntries, "removeAllObjects", (_QWORD)v28);
}

- (void)recordAssetForFileSystemPersistencyUpdate:(id)a3
{
  NSMutableSet *delayedAssetsForFileSystemPersistency;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "disableFileSystemPersistency") & 1) == 0)
  {
    delayedAssetsForFileSystemPersistency = self->_delayedAssetsForFileSystemPersistency;
    if (!delayedAssetsForFileSystemPersistency)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v6 = self->_delayedAssetsForFileSystemPersistency;
      self->_delayedAssetsForFileSystemPersistency = v5;

      delayedAssetsForFileSystemPersistency = self->_delayedAssetsForFileSystemPersistency;
    }
    -[NSMutableSet addObject:](delayedAssetsForFileSystemPersistency, "addObject:", v7);
    -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeFilePersistence"));
  }

}

- (void)_popDelayedAssetsForFilesystemPersistencyUpdates:(id *)a3
{
  id v5;

  if (a3)
  {
    -[NSMutableSet valueForKey:](self->_delayedAssetsForFileSystemPersistency, "valueForKey:", CFSTR("objectID"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v5;

  }
  -[NSMutableSet removeAllObjects](self->_delayedAssetsForFileSystemPersistency, "removeAllObjects");
}

- (void)_recordManagedObjectUUID:(id)a3 forSearchIndexUpdateKey:(id)a4
{
  id v6;
  NSMutableDictionary *delayedSearchIndexUpdateUUIDs;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    delayedSearchIndexUpdateUUIDs = self->_delayedSearchIndexUpdateUUIDs;
    if (delayedSearchIndexUpdateUUIDs)
      v8 = delayedSearchIndexUpdateUUIDs;
    else
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_delayedSearchIndexUpdateUUIDs;
    self->_delayedSearchIndexUpdateUUIDs = v8;

    -[NSMutableDictionary objectForKey:](self->_delayedSearchIndexUpdateUUIDs, "objectForKey:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setObject:forKey:](self->_delayedSearchIndexUpdateUUIDs, "setObject:forKey:", v10, v6);
    }
    objc_msgSend(v10, "addObject:", v11);
    -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeSearchIndex"));

  }
}

- (void)_recordAssetUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4
{
  const __CFString *v4;

  if (a4)
    v4 = CFSTR("insertAsset");
  else
    v4 = CFSTR("removeAsset");
  -[PLDelayedSaveActions _recordManagedObjectUUID:forSearchIndexUpdateKey:](self, "_recordManagedObjectUUID:forSearchIndexUpdateKey:", a3, v4);
}

- (void)_recordAlbumUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4
{
  const __CFString *v4;

  if (a4)
    v4 = CFSTR("insertAlbum");
  else
    v4 = CFSTR("removeAlbum");
  -[PLDelayedSaveActions _recordManagedObjectUUID:forSearchIndexUpdateKey:](self, "_recordManagedObjectUUID:forSearchIndexUpdateKey:", a3, v4);
}

- (void)_recordMemoryUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4
{
  const __CFString *v4;

  if (a4)
    v4 = CFSTR("insertMemory");
  else
    v4 = CFSTR("removeMemory");
  -[PLDelayedSaveActions _recordManagedObjectUUID:forSearchIndexUpdateKey:](self, "_recordManagedObjectUUID:forSearchIndexUpdateKey:", a3, v4);
}

- (void)_recordHighlightUUIDForSearchIndexUpdate:(id)a3 isInsert:(BOOL)a4
{
  const __CFString *v4;

  if (a4)
    v4 = CFSTR("insertHighlight");
  else
    v4 = CFSTR("removeHighlight");
  -[PLDelayedSaveActions _recordManagedObjectUUID:forSearchIndexUpdateKey:](self, "_recordManagedObjectUUID:forSearchIndexUpdateKey:", a3, v4);
}

- (void)_recordPersonUUIDInsertForSearchIndexUpdate:(id)a3
{
  -[PLDelayedSaveActions _recordManagedObjectUUID:forSearchIndexUpdateKey:](self, "_recordManagedObjectUUID:forSearchIndexUpdateKey:", a3, CFSTR("insertPerson"));
}

- (void)_recordPersonUUIDRenameForSearchIndexUpdate:(id)a3
{
  -[PLDelayedSaveActions _recordManagedObjectUUID:forSearchIndexUpdateKey:](self, "_recordManagedObjectUUID:forSearchIndexUpdateKey:", a3, CFSTR("renamePerson"));
}

- (void)_recordDetectedFaceUUIDInsertForSearchIndexUpdate:(id)a3
{
  -[PLDelayedSaveActions _recordManagedObjectUUID:forSearchIndexUpdateKey:](self, "_recordManagedObjectUUID:forSearchIndexUpdateKey:", a3, CFSTR("insertDetectedFace"));
}

- (void)_recordAssetForSearchIndexUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    if ((objc_msgSend(v4, "isDeleted") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v10, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "libraryServicesManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", objc_msgSend(v7, "wellKnownPhotoLibraryIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "evaluateWithObject:", v10);

    }
    objc_msgSend(v10, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDelayedSaveActions _recordAssetUUIDForSearchIndexUpdate:isInsert:](self, "_recordAssetUUIDForSearchIndexUpdate:isInsert:", v9, v5);

    v4 = v10;
  }

}

- (void)recordPersonForSearchIndexUpdate:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled");
  v5 = v10;
  if (!v4)
  {
    objc_msgSend(v10, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isDeleted") & 1) != 0 || objc_msgSend(v10, "verifiedType") != 1)
      goto LABEL_8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("detectionType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_8:

        v5 = v10;
        goto LABEL_9;
      }
    }
    objc_msgSend(v10, "personUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDelayedSaveActions _recordPersonUUIDInsertForSearchIndexUpdate:](self, "_recordPersonUUIDInsertForSearchIndexUpdate:", v9);
    -[PLDelayedSaveActions _recordPersonUUIDRenameForSearchIndexUpdate:](self, "_recordPersonUUIDRenameForSearchIndexUpdate:", v9);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)recordDetectedFaceForSearchIndexUpdate:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled");
  v5 = v15;
  if (!v4)
  {
    objc_msgSend(v15, "associatedAssetForFaceOrTorso:orTemporal:", 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (objc_msgSend(v15, "isDeleted"))
      {
        objc_msgSend(v15, "associatedPersonForFaceOrTorso:orTemporal:", 1, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "shouldIndexForSearch");

        if (v8)
          -[PLDelayedSaveActions _recordAssetForSearchIndexUpdate:](self, "_recordAssetForSearchIndexUpdate:", v6);
        goto LABEL_14;
      }
      if (!objc_msgSend(v15, "isInserted"))
      {
        objc_msgSend(v15, "changedValues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("personForFace"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12
          || (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("personForTemporalDetectedFaces")),
              (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

        }
        else
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ageType"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            goto LABEL_13;
        }
        objc_msgSend(v15, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDelayedSaveActions _recordDetectedFaceUUIDInsertForSearchIndexUpdate:](self, "_recordDetectedFaceUUIDInsertForSearchIndexUpdate:", v13);

LABEL_13:
        goto LABEL_14;
      }
      objc_msgSend(v15, "associatedPersonForFaceOrTorso:orTemporal:", 1, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "shouldIndexForSearch");

      if (v10)
      {
        objc_msgSend(v15, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDelayedSaveActions _recordDetectedFaceUUIDInsertForSearchIndexUpdate:](self, "_recordDetectedFaceUUIDInsertForSearchIndexUpdate:", v11);
        goto LABEL_13;
      }
    }
LABEL_14:

    v5 = v15;
  }

}

- (void)recordAssetDescriptionForSearchIndexUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled"))
  {
    objc_msgSend(v8, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longDescription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v8, "assetAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDelayedSaveActions _recordAssetForSearchIndexUpdate:](self, "_recordAssetForSearchIndexUpdate:", v7);

    }
  }

}

- (void)recordAdditionalAssetAttributesForSearchIndexUpdate:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled");
  v5 = v18;
  if (!v4)
  {
    objc_msgSend(v18, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reverseLocationDataIsValid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reverseLocationData"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9 != 0;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keywords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sceneClassifications"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("temporalSceneClassifications"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cameraCaptureDevice"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessibilityDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 || v10 || v11 || v12 || v13 || v14 || v15 || v16)
    {
      objc_msgSend(v18, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDelayedSaveActions _recordAssetForSearchIndexUpdate:](self, "_recordAssetForSearchIndexUpdate:", v17);

    }
    v5 = v18;
  }

}

- (void)recordMediaAnalysisAssetAttributesForSearchIndexUpdate:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled");
  v5 = v15;
  if (!v4)
  {
    objc_msgSend(v15, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characterRecognitionAttributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v15, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDelayedSaveActions _recordAssetForSearchIndexUpdate:](self, "_recordAssetForSearchIndexUpdate:", v8);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visualSearchAttributes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v15, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDelayedSaveActions _recordAssetForSearchIndexUpdate:](self, "_recordAssetForSearchIndexUpdate:", v10);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaAnalysisImageVersion"));
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaAnalysisVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v11 | v12;

    if (v13)
    {
      objc_msgSend(v15, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDelayedSaveActions _recordAssetForSearchIndexUpdate:](self, "_recordAssetForSearchIndexUpdate:", v14);

    }
    v5 = v15;
  }

}

- (void)recordAssetForSearchIndexUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  PLDelayedSaveActions *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled"))
  {
    objc_msgSend(v4, "changedValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isDeleted") & 1) == 0)
    {
      objc_msgSend(v4, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "libraryServicesManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", objc_msgSend(v7, "wellKnownPhotoLibraryIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "evaluateWithObject:", v4))
      {

        goto LABEL_5;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visibilityState"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20
        || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("savedAssetType")),
            (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hidden")),
            (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trashedState"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
LABEL_5:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateCreated"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("favorite"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kind"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kindSubtype"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("depthType"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("avalanchePickType"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("playbackVariation"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("playbackStyle"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visibilityState"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("savedAssetType"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hidden"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trashedState"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dayGroupHighlightBeingAssets"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("albums"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("memoriesBeingCuratedAssets"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v4, "isInserted");
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("libraryScope"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("libraryScopeContributors"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14
            && !v15
            && (v13 & 1) == 0
            && !v34
            && !v33
            && !v9
            && !v10
            && !v11
            && !v32
            && !v31
            && !v30
            && !v29
            && !v28
            && !v27
            && !v26
            && !v25
            && !v24
            && !v12)
          {
            goto LABEL_32;
          }
          objc_msgSend(v4, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = self;
          v18 = v16;
          v19 = 1;
LABEL_31:
          -[PLDelayedSaveActions _recordAssetUUIDForSearchIndexUpdate:isInsert:](v17, "_recordAssetUUIDForSearchIndexUpdate:isInsert:", v18, v19);

LABEL_32:
          goto LABEL_33;
        }
      }
    }
    PLSearchBackendIndexStatusGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v22;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "search: property changes to asset: %@ indicate remove from index", buf, 0xCu);

    }
    objc_msgSend(v4, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self;
    v18 = v16;
    v19 = 0;
    goto LABEL_31;
  }
LABEL_33:

}

- (void)recordAlbumForSearchIndexUpdate:(id)a3
{
  BOOL v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled");
  v5 = v15;
  if (!v4)
  {
    v6 = objc_msgSend(v15, "isCandidateForSearchIndexing");
    v5 = v15;
    if (v6)
    {
      if ((objc_msgSend(v15, "isDeleted") & 1) != 0)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v15, "photoLibrary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "libraryServicesManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLGenericAlbum isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLGenericAlbum, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", objc_msgSend(v9, "wellKnownPhotoLibraryIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v10, "evaluateWithObject:", v15);

      }
      objc_msgSend(v15, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "changedValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isDeleted") & 1) == 0 && (objc_msgSend(v15, "isInserted") & 1) == 0)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("trashedState"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          || (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("startDate")),
              (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
          || (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("endDate")),
              (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
          || (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("assets")),
              (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

        }
        else
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("title"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            goto LABEL_14;
        }
      }
      -[PLDelayedSaveActions _recordAlbumUUIDForSearchIndexUpdate:isInsert:](self, "_recordAlbumUUIDForSearchIndexUpdate:isInsert:", v11, v7);
LABEL_14:

      v5 = v15;
    }
  }

}

- (void)recordMemoryForSearchIndexUpdate:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled"))
  {
    if ((objc_msgSend(v9, "isDeleted") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v9, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "libraryServicesManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLMemory isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLMemory, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", objc_msgSend(v6, "wellKnownPhotoLibraryIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "evaluateWithObject:", v9);

    }
    objc_msgSend(v9, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDelayedSaveActions _recordMemoryUUIDForSearchIndexUpdate:isInsert:](self, "_recordMemoryUUIDForSearchIndexUpdate:isInsert:", v8, v4);

  }
}

- (void)recordHighlightForSearchIndexUpdate:(id)a3
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
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (!+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled"))
  {
    objc_msgSend(v18, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isDeleted") & 1) == 0 && (objc_msgSend(v18, "isInserted") & 1) == 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verboseSmartDescription"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_28;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_28;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_28;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startDate"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_28;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endDate"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_28;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimeZoneOffset"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_28;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endTimeZoneOffset"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
LABEL_27:

        v5 = 0;
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
LABEL_26:

        v6 = 0;
        goto LABEL_27;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_25:

        v7 = 0;
        goto LABEL_26;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dayGroupAssets"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
LABEL_24:

        v8 = 0;
        goto LABEL_25;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("childDayGroupPhotosHighlights"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
LABEL_23:

        v9 = 0;
        goto LABEL_24;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("moments"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_22:

        v10 = 0;
        goto LABEL_23;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyAssetPrivate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
LABEL_21:

        v11 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dayGroupKeyAssetPrivate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
LABEL_20:

        v12 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyAssetShared"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

        v13 = 0;
        goto LABEL_20;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dayGroupKeyAssetShared"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_33:

        goto LABEL_34;
      }
    }
LABEL_29:
    if ((objc_msgSend(v18, "isDeleted") & 1) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v18, "isEligibleForSearchIndexing");
    objc_msgSend(v18, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDelayedSaveActions _recordHighlightUUIDForSearchIndexUpdate:isInsert:](self, "_recordHighlightUUIDForSearchIndexUpdate:isInsert:", v16, v15);

    goto LABEL_33;
  }
LABEL_34:

}

- (void)_popDelayedSearchIndexUpdates:(id *)a3
{
  NSMutableDictionary *delayedSearchIndexUpdateUUIDs;

  if (a3)
    *a3 = objc_retainAutorelease(self->_delayedSearchIndexUpdateUUIDs);
  delayedSearchIndexUpdateUUIDs = self->_delayedSearchIndexUpdateUUIDs;
  self->_delayedSearchIndexUpdateUUIDs = 0;

}

- (void)_recordDelayedImportSessionCountsAndDateRangeUpdate:(id)a3
{
  id v4;
  NSMutableSet *delayedImportSessionCountsAndDateRangeUpdates;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedImportSessionCountsAndDateRangeUpdates = self->_delayedImportSessionCountsAndDateRangeUpdates;
  v8 = v4;
  if (!delayedImportSessionCountsAndDateRangeUpdates)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_delayedImportSessionCountsAndDateRangeUpdates;
    self->_delayedImportSessionCountsAndDateRangeUpdates = v6;

    v4 = v8;
    delayedImportSessionCountsAndDateRangeUpdates = self->_delayedImportSessionCountsAndDateRangeUpdates;
  }
  -[NSMutableSet addObject:](delayedImportSessionCountsAndDateRangeUpdates, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeImportSessionCounts"));

}

- (void)recordImportSessionCountsAndDateRangeUpdate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isDeleted") & 1) == 0)
  {
    objc_msgSend(v6, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[PLDelayedSaveActions _recordDelayedImportSessionCountsAndDateRangeUpdate:](self, "_recordDelayedImportSessionCountsAndDateRangeUpdate:", v6);
  }

}

- (void)_popDelayedImportSessionCountsAndDateRangeUpdates:(id *)a3
{
  id v5;

  if (a3)
  {
    -[NSMutableSet valueForKey:](self->_delayedImportSessionCountsAndDateRangeUpdates, "valueForKey:", CFSTR("objectID"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v5;

  }
  -[NSMutableSet removeAllObjects](self->_delayedImportSessionCountsAndDateRangeUpdates, "removeAllObjects");
}

- (void)_recordDelayedAlbumCountsAndDateRangeUpdate:(id)a3
{
  id v4;
  NSMutableSet *delayedAlbumCountsAndDateRangeUpdates;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedAlbumCountsAndDateRangeUpdates = self->_delayedAlbumCountsAndDateRangeUpdates;
  v8 = v4;
  if (!delayedAlbumCountsAndDateRangeUpdates)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_delayedAlbumCountsAndDateRangeUpdates;
    self->_delayedAlbumCountsAndDateRangeUpdates = v6;

    v4 = v8;
    delayedAlbumCountsAndDateRangeUpdates = self->_delayedAlbumCountsAndDateRangeUpdates;
  }
  -[NSMutableSet addObject:](delayedAlbumCountsAndDateRangeUpdates, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeAlbumCounts"));

}

- (void)_recordDelayedAlbumKeyAssetsUpdate:(id)a3
{
  id v4;
  NSMutableSet *delayedAlbumKeyAssetsUpdates;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedAlbumKeyAssetsUpdates = self->_delayedAlbumKeyAssetsUpdates;
  v8 = v4;
  if (!delayedAlbumKeyAssetsUpdates)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_delayedAlbumKeyAssetsUpdates;
    self->_delayedAlbumKeyAssetsUpdates = v6;

    v4 = v8;
    delayedAlbumKeyAssetsUpdates = self->_delayedAlbumKeyAssetsUpdates;
  }
  -[NSMutableSet addObject:](delayedAlbumKeyAssetsUpdates, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeAlbumCounts"));

}

- (void)recordAlbumForCountsAndDateRangeUpdate:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isDeleted") & 1) == 0)
    -[PLDelayedSaveActions _recordDelayedAlbumCountsAndDateRangeUpdate:](self, "_recordDelayedAlbumCountsAndDateRangeUpdate:", v4);

}

- (void)recordAlbumForKeyAssetsUpdate:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isDeleted") & 1) == 0)
    -[PLDelayedSaveActions _recordDelayedAlbumKeyAssetsUpdate:](self, "_recordDelayedAlbumKeyAssetsUpdate:", v4);

}

- (void)recordAssetForAlbumCountsDateRangeAndKeyAssetsUpdate:(id)a3
{
  void *v4;
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
  objc_msgSend(a3, "albums");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        if ((objc_msgSend(v9, "isDeleted") & 1) == 0)
        {
          -[PLDelayedSaveActions _recordDelayedAlbumCountsAndDateRangeUpdate:](self, "_recordDelayedAlbumCountsAndDateRangeUpdate:", v9);
          -[PLDelayedSaveActions _recordDelayedAlbumKeyAssetsUpdate:](self, "_recordDelayedAlbumKeyAssetsUpdate:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)recordAssetForImportSessionCountsAndDateRangeUpdate:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(a3, "importSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "isDeleted");
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      -[PLDelayedSaveActions _recordDelayedImportSessionCountsAndDateRangeUpdate:](self, "_recordDelayedImportSessionCountsAndDateRangeUpdate:", v7);
      v5 = v7;
    }
  }

}

- (void)_popDelayedAlbumCountsAndDateRangeUpdates:(id *)a3
{
  id v5;

  if (a3)
  {
    -[NSMutableSet valueForKey:](self->_delayedAlbumCountsAndDateRangeUpdates, "valueForKey:", CFSTR("objectID"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v5;

  }
  -[NSMutableSet removeAllObjects](self->_delayedAlbumCountsAndDateRangeUpdates, "removeAllObjects");
}

- (void)_popDelayedAlbumKeyAssetsUpdates:(id *)a3
{
  id v5;

  if (a3)
  {
    -[NSMutableSet valueForKey:](self->_delayedAlbumKeyAssetsUpdates, "valueForKey:", CFSTR("objectID"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v5;

  }
  -[NSMutableSet removeAllObjects](self->_delayedAlbumKeyAssetsUpdates, "removeAllObjects");
}

- (void)recordAssetForAnalysis:(id)a3 workerFlags:(int)a4 workerType:(signed __int16)a5
{
  uint64_t v5;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *delayedWorkerTypesToAnalyzeByAssetUUID;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v8 = a3;
  v18 = v8;
  if (!self->_delayedWorkerTypesToAnalyzeByAssetUUID)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    delayedWorkerTypesToAnalyzeByAssetUUID = self->_delayedWorkerTypesToAnalyzeByAssetUUID;
    self->_delayedWorkerTypesToAnalyzeByAssetUUID = v9;

    v8 = v18;
  }
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_delayedWorkerTypesToAnalyzeByAssetUUID, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_delayedWorkerTypesToAnalyzeByAssetUUID, "setObject:forKeyedSubscript:", v12, v11);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15 | a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v17);

}

- (void)_popDelayedAssetsForAnalysis:(id *)a3
{
  NSMutableDictionary *delayedWorkerTypesToAnalyzeByAssetUUID;

  if (a3)
    *a3 = objc_retainAutorelease(self->_delayedWorkerTypesToAnalyzeByAssetUUID);
  delayedWorkerTypesToAnalyzeByAssetUUID = self->_delayedWorkerTypesToAnalyzeByAssetUUID;
  self->_delayedWorkerTypesToAnalyzeByAssetUUID = 0;

}

- (void)recordAssetForDuetDelete:(id)a3
{
  id v4;
  NSMutableSet *delayedAssetsForDuetDelete;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v4 = a3;
  delayedAssetsForDuetDelete = self->_delayedAssetsForDuetDelete;
  v9 = v4;
  if (!delayedAssetsForDuetDelete)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_delayedAssetsForDuetDelete;
    self->_delayedAssetsForDuetDelete = v6;

    v4 = v9;
    delayedAssetsForDuetDelete = self->_delayedAssetsForDuetDelete;
  }
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](delayedAssetsForDuetDelete, "addObject:", v8);

}

- (void)_popDuetDeletedAssetsIntoDetail:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableSet count](self->_delayedAssetsForDuetDelete, "count"))
  {
    v4 = (void *)-[NSMutableSet copy](self->_delayedAssetsForDuetDelete, "copy");
    objc_msgSend(v5, "setAssetsForDuetDelete:", v4);

    -[NSMutableSet removeAllObjects](self->_delayedAssetsForDuetDelete, "removeAllObjects");
  }

}

- (void)recordMemoryForDuetDelete:(id)a3
{
  id v4;
  NSMutableSet *delayedMemoriesForDuetDelete;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v4 = a3;
  delayedMemoriesForDuetDelete = self->_delayedMemoriesForDuetDelete;
  v9 = v4;
  if (!delayedMemoriesForDuetDelete)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_delayedMemoriesForDuetDelete;
    self->_delayedMemoriesForDuetDelete = v6;

    v4 = v9;
    delayedMemoriesForDuetDelete = self->_delayedMemoriesForDuetDelete;
  }
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](delayedMemoriesForDuetDelete, "addObject:", v8);

}

- (void)_popDuetDeletedMemoriesIntoDetail:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableSet count](self->_delayedMemoriesForDuetDelete, "count"))
  {
    v4 = (void *)-[NSMutableSet copy](self->_delayedMemoriesForDuetDelete, "copy");
    objc_msgSend(v5, "setMemoriesForDuetDelete:", v4);

    -[NSMutableSet removeAllObjects](self->_delayedMemoriesForDuetDelete, "removeAllObjects");
  }

}

- (void)recordWidgetTimelineReloadNeededForType:(int64_t)a3
{
  NSMutableSet *delayedWidgetTimelineReloadTypesNeeded;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  delayedWidgetTimelineReloadTypesNeeded = self->_delayedWidgetTimelineReloadTypesNeeded;
  if (!delayedWidgetTimelineReloadTypesNeeded)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_delayedWidgetTimelineReloadTypesNeeded;
    self->_delayedWidgetTimelineReloadTypesNeeded = v6;

    delayedWidgetTimelineReloadTypesNeeded = self->_delayedWidgetTimelineReloadTypesNeeded;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](delayedWidgetTimelineReloadTypesNeeded, "addObject:", v8);

}

- (void)_popWidgetTimelineReloadNeeded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableSet count](self->_delayedWidgetTimelineReloadTypesNeeded, "count"))
  {
    v4 = (void *)-[NSMutableSet copy](self->_delayedWidgetTimelineReloadTypesNeeded, "copy");
    objc_msgSend(v5, "setWidgetTimelineReloadTypesNeeded:", v4);

    -[NSMutableSet removeAllObjects](self->_delayedWidgetTimelineReloadTypesNeeded, "removeAllObjects");
  }

}

- (void)recordAssetID:(id)a3 forWidgetUserAlbumRemoval:(id)a4
{
  id v6;
  NSMutableDictionary *delayedWidgetUserAlbumAssetRemovalNeeded;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  delayedWidgetUserAlbumAssetRemovalNeeded = self->_delayedWidgetUserAlbumAssetRemovalNeeded;
  if (!delayedWidgetUserAlbumAssetRemovalNeeded)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_delayedWidgetUserAlbumAssetRemovalNeeded;
    self->_delayedWidgetUserAlbumAssetRemovalNeeded = v8;

    delayedWidgetUserAlbumAssetRemovalNeeded = self->_delayedWidgetUserAlbumAssetRemovalNeeded;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](delayedWidgetUserAlbumAssetRemovalNeeded, "objectForKeyedSubscript:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_delayedWidgetUserAlbumAssetRemovalNeeded, "setObject:forKeyedSubscript:", v11, v14);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_delayedWidgetUserAlbumAssetRemovalNeeded, "objectForKeyedSubscript:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (void)_popWidgetUserAlbumAssetRemovalReloadNeeded:(id)a3
{
  NSMutableDictionary *delayedWidgetUserAlbumAssetRemovalNeeded;
  id v5;
  void *v6;

  delayedWidgetUserAlbumAssetRemovalNeeded = self->_delayedWidgetUserAlbumAssetRemovalNeeded;
  if (delayedWidgetUserAlbumAssetRemovalNeeded)
  {
    v5 = a3;
    v6 = (void *)-[NSMutableDictionary copy](delayedWidgetUserAlbumAssetRemovalNeeded, "copy");
    objc_msgSend(v5, "setAssetsForWidgetUserAlbumRemoval:", v6);

    -[NSMutableDictionary removeAllObjects](self->_delayedWidgetUserAlbumAssetRemovalNeeded, "removeAllObjects");
  }
}

- (void)recordAssetIDForWidgetFavoriteAlbumRemoval:(id)a3
{
  id v4;
  NSMutableSet *delayedWidgetFavoriteAlbumAssetRemovalNeeded;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedWidgetFavoriteAlbumAssetRemovalNeeded = self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded;
  v8 = v4;
  if (!delayedWidgetFavoriteAlbumAssetRemovalNeeded)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded;
    self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded = v6;

    v4 = v8;
    delayedWidgetFavoriteAlbumAssetRemovalNeeded = self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded;
  }
  -[NSMutableSet addObject:](delayedWidgetFavoriteAlbumAssetRemovalNeeded, "addObject:", v4);

}

- (void)_popWidgetFavoriteAlbumAssetRemovalReloadNeeded:(id)a3
{
  NSMutableSet *delayedWidgetFavoriteAlbumAssetRemovalNeeded;
  id v5;
  void *v6;

  delayedWidgetFavoriteAlbumAssetRemovalNeeded = self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded;
  if (delayedWidgetFavoriteAlbumAssetRemovalNeeded)
  {
    v5 = a3;
    v6 = (void *)-[NSMutableSet copy](delayedWidgetFavoriteAlbumAssetRemovalNeeded, "copy");
    objc_msgSend(v5, "setAssetsForWidgetFavoriteAlbumRemoval:", v6);

    -[NSMutableSet removeAllObjects](self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded, "removeAllObjects");
  }
}

- (void)recordAssetID:(id)a3 forWallpaperUserAlbumRemoval:(id)a4
{
  id v6;
  NSMutableDictionary *delayedWallpaperUserAlbumAssetRemovalNeeded;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  delayedWallpaperUserAlbumAssetRemovalNeeded = self->_delayedWallpaperUserAlbumAssetRemovalNeeded;
  if (!delayedWallpaperUserAlbumAssetRemovalNeeded)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_delayedWallpaperUserAlbumAssetRemovalNeeded;
    self->_delayedWallpaperUserAlbumAssetRemovalNeeded = v8;

    delayedWallpaperUserAlbumAssetRemovalNeeded = self->_delayedWallpaperUserAlbumAssetRemovalNeeded;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](delayedWallpaperUserAlbumAssetRemovalNeeded, "objectForKeyedSubscript:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_delayedWallpaperUserAlbumAssetRemovalNeeded, "setObject:forKeyedSubscript:", v11, v14);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_delayedWallpaperUserAlbumAssetRemovalNeeded, "objectForKeyedSubscript:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (void)_popWallpaperUserAlbumAssetRemovalReloadNeeded:(id)a3
{
  NSMutableDictionary *delayedWallpaperUserAlbumAssetRemovalNeeded;
  id v5;
  void *v6;

  delayedWallpaperUserAlbumAssetRemovalNeeded = self->_delayedWallpaperUserAlbumAssetRemovalNeeded;
  if (delayedWallpaperUserAlbumAssetRemovalNeeded)
  {
    v5 = a3;
    v6 = (void *)-[NSMutableDictionary copy](delayedWallpaperUserAlbumAssetRemovalNeeded, "copy");
    objc_msgSend(v5, "setAssetsForWallpaperUserAlbumRemoval:", v6);

    -[NSMutableDictionary removeAllObjects](self->_delayedWallpaperUserAlbumAssetRemovalNeeded, "removeAllObjects");
  }
}

- (void)recordAssetIDForWallpaperFavoriteAlbumRemoval:(id)a3
{
  id v4;
  NSMutableSet *delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedWallpaperFavoriteAlbumAssetRemovalNeeded = self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
  v8 = v4;
  if (!delayedWallpaperFavoriteAlbumAssetRemovalNeeded)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
    self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded = v6;

    v4 = v8;
    delayedWallpaperFavoriteAlbumAssetRemovalNeeded = self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
  }
  -[NSMutableSet addObject:](delayedWallpaperFavoriteAlbumAssetRemovalNeeded, "addObject:", v4);

}

- (void)_popWallpaperFavoriteAlbumAssetRemovalReloadNeeded:(id)a3
{
  NSMutableSet *delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
  id v5;
  void *v6;

  delayedWallpaperFavoriteAlbumAssetRemovalNeeded = self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded;
  if (delayedWallpaperFavoriteAlbumAssetRemovalNeeded)
  {
    v5 = a3;
    v6 = (void *)-[NSMutableSet copy](delayedWallpaperFavoriteAlbumAssetRemovalNeeded, "copy");
    objc_msgSend(v5, "setAssetsForWallpaperFavoriteAlbumRemoval:", v6);

    -[NSMutableSet removeAllObjects](self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded, "removeAllObjects");
  }
}

- (void)recordWallpaperSuggestionReloadForUUID:(id)a3
{
  id v4;
  NSMutableSet *delayedWallpaperSuggestionUUIDs;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedWallpaperSuggestionUUIDs = self->_delayedWallpaperSuggestionUUIDs;
  v8 = v4;
  if (!delayedWallpaperSuggestionUUIDs)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_delayedWallpaperSuggestionUUIDs;
    self->_delayedWallpaperSuggestionUUIDs = v6;

    v4 = v8;
    delayedWallpaperSuggestionUUIDs = self->_delayedWallpaperSuggestionUUIDs;
  }
  -[NSMutableSet addObject:](delayedWallpaperSuggestionUUIDs, "addObject:", v4);

}

- (void)_popWallpaperSuggestionReloadIntoDetail:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableSet count](self->_delayedWallpaperSuggestionUUIDs, "count"))
  {
    v4 = (void *)-[NSMutableSet copy](self->_delayedWallpaperSuggestionUUIDs, "copy");
    objc_msgSend(v5, "setWallpaperSuggestionReloadUUIDs:", v4);

    -[NSMutableSet removeAllObjects](self->_delayedWallpaperSuggestionUUIDs, "removeAllObjects");
  }

}

- (void)recordFeaturedContentUpdateNeededForPersonUUID:(id)a3
{
  id v4;
  NSMutableSet *delayedFeaturedContentUpdateNeededForPerson;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedFeaturedContentUpdateNeededForPerson = self->_delayedFeaturedContentUpdateNeededForPerson;
  v8 = v4;
  if (v4)
  {
    if (!delayedFeaturedContentUpdateNeededForPerson)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = self->_delayedFeaturedContentUpdateNeededForPerson;
      self->_delayedFeaturedContentUpdateNeededForPerson = v6;

      delayedFeaturedContentUpdateNeededForPerson = self->_delayedFeaturedContentUpdateNeededForPerson;
    }
    -[NSMutableSet addObject:](delayedFeaturedContentUpdateNeededForPerson, "addObject:", v8);
  }
  else
  {
    self->_delayedFeaturedContentUpdateNeededForPerson = 0;

  }
  self->_delayedFeaturedContentUpdateNeeded = 1;

}

- (void)_popFeaturedContentUpdateNeededForPerson:(id)a3
{
  NSMutableSet *delayedFeaturedContentUpdateNeededForPerson;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setPersonsToUpdateForFeaturedContent:", self->_delayedFeaturedContentUpdateNeededForPerson);
  delayedFeaturedContentUpdateNeededForPerson = self->_delayedFeaturedContentUpdateNeededForPerson;
  self->_delayedFeaturedContentUpdateNeededForPerson = 0;

  if (self->_delayedFeaturedContentUpdateNeeded)
  {
    objc_msgSend(v5, "setShouldUpdateFeaturedContent:", 1);
    self->_delayedFeaturedContentUpdateNeeded = 0;
  }

}

- (void)recordMemoryAssetsUpdate:(id)a3
{
  id v4;
  NSMutableSet *delayedMemoriesAssetUpdate;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v4 = a3;
  delayedMemoriesAssetUpdate = self->_delayedMemoriesAssetUpdate;
  v9 = v4;
  if (!delayedMemoriesAssetUpdate)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_delayedMemoriesAssetUpdate;
    self->_delayedMemoriesAssetUpdate = v6;

    v4 = v9;
    delayedMemoriesAssetUpdate = self->_delayedMemoriesAssetUpdate;
  }
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](delayedMemoriesAssetUpdate, "addObject:", v8);

}

- (void)_popMemoryAssetUpdateIntoDetail:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableSet count](self->_delayedMemoriesAssetUpdate, "count"))
  {
    v4 = (void *)-[NSMutableSet copy](self->_delayedMemoriesAssetUpdate, "copy");
    objc_msgSend(v5, "setMemoriesForAssetUpdate:", v4);

    -[NSMutableSet removeAllObjects](self->_delayedMemoriesAssetUpdate, "removeAllObjects");
  }

}

- (void)recordLibraryScopeParticipantsUpdateForLibraryScope:(id)a3
{
  void *v4;
  NSMutableSet *delayedLibraryScopeParticipantsUpdateUUIDs;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    delayedLibraryScopeParticipantsUpdateUUIDs = self->_delayedLibraryScopeParticipantsUpdateUUIDs;
    v8 = v4;
    if (!delayedLibraryScopeParticipantsUpdateUUIDs)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = self->_delayedLibraryScopeParticipantsUpdateUUIDs;
      self->_delayedLibraryScopeParticipantsUpdateUUIDs = v6;

      delayedLibraryScopeParticipantsUpdateUUIDs = self->_delayedLibraryScopeParticipantsUpdateUUIDs;
    }
    -[NSMutableSet addObject:](delayedLibraryScopeParticipantsUpdateUUIDs, "addObject:", v8);
    v4 = v8;
  }

}

- (void)_popLibraryScopeParticipantsUpdateIntoDetail:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableSet count](self->_delayedLibraryScopeParticipantsUpdateUUIDs, "count"))
  {
    v4 = (void *)-[NSMutableSet copy](self->_delayedLibraryScopeParticipantsUpdateUUIDs, "copy");
    objc_msgSend(v5, "setLibraryScopeParticipantsForUpdate:", v4);

    -[NSMutableSet removeAllObjects](self->_delayedLibraryScopeParticipantsUpdateUUIDs, "removeAllObjects");
  }

}

- (void)recordLibraryScopeRulesUpdated
{
  self->_delayedLibraryScopeRulesUpdated = 1;
}

- (void)_popLibraryScopeRulesUpdatedIntoDetail:(id)a3
{
  if (self->_delayedLibraryScopeRulesUpdated)
  {
    objc_msgSend(a3, "setLibraryScopeRulesUpdated:", 1);
    self->_delayedLibraryScopeRulesUpdated = 0;
  }
}

- (void)recordSocialGroupContainmentUpdateNeededForPerson:(id)a3
{
  id v4;
  NSMutableSet *delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  v8 = v4;
  if (!delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
    self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates = v6;

    v4 = v8;
    delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  }
  -[NSMutableSet addObject:](delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates, "addObject:", v4);

}

- (void)_popMemberIDsOfGroupNeedingContainmentUpdateIntoDetail:(id)a3
{
  NSMutableSet *delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;

  delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  if (delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = a3;
    -[NSMutableSet valueForKey:](delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates, "valueForKey:", CFSTR("objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMemberIDsOfSocialGroupsNeedingContainmentUpdates:", v8);

    v9 = self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates;
  }
  else
  {
    v9 = 0;
  }
  -[NSMutableSet removeAllObjects](v9, "removeAllObjects");
}

- (void)recordSocialGroupContainmentUpdateNeededForAsset:(id)a3
{
  id v4;
  NSMutableSet *delayedAssetsNeedingSocialGroupContainmentUpdates;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedAssetsNeedingSocialGroupContainmentUpdates = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
  v8 = v4;
  if (!delayedAssetsNeedingSocialGroupContainmentUpdates)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
    self->_delayedAssetsNeedingSocialGroupContainmentUpdates = v6;

    v4 = v8;
    delayedAssetsNeedingSocialGroupContainmentUpdates = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
  }
  -[NSMutableSet addObject:](delayedAssetsNeedingSocialGroupContainmentUpdates, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeSocialGroupAssetContainment"));

}

- (void)_popAssetIDsNeedingSocialGroupContainmentUpdateIntoDetail:(id)a3
{
  NSMutableSet *delayedAssetsNeedingSocialGroupContainmentUpdates;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;

  delayedAssetsNeedingSocialGroupContainmentUpdates = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
  if (delayedAssetsNeedingSocialGroupContainmentUpdates)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = a3;
    -[NSMutableSet valueForKey:](delayedAssetsNeedingSocialGroupContainmentUpdates, "valueForKey:", CFSTR("objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAssetIDsNeedingContainmentUpdates:", v8);

    v9 = self->_delayedAssetsNeedingSocialGroupContainmentUpdates;
  }
  else
  {
    v9 = 0;
  }
  -[NSMutableSet removeAllObjects](v9, "removeAllObjects");
}

- (void)recordSocialGroupContainmentUpdateNeededForPerson:(id)a3 andAsset:(id)a4
{
  id v6;
  NSMutableDictionary *delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  delayedAssetsByPersonUUIDNeedingContainmentUpdates = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  if (!delayedAssetsByPersonUUIDNeedingContainmentUpdates)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
    self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates = v8;

    delayedAssetsByPersonUUIDNeedingContainmentUpdates = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  }
  objc_msgSend(v18, "personUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](delayedAssetsByPersonUUIDNeedingContainmentUpdates, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
    objc_msgSend(v18, "personUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

  }
  v15 = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  objc_msgSend(v18, "personUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v6);

  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeSocialGroupAssetContainment"));
}

- (void)_popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSMutableDictionary *delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  id v8;
  void *v9;
  NSMutableDictionary *v10;
  _QWORD v11[4];
  id v12;

  if (self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    v5 = a3;
    objc_msgSend(v4, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    delayedAssetsByPersonUUIDNeedingContainmentUpdates = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__PLDelayedSaveActions__popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail___block_invoke;
    v11[3] = &unk_1E36748F8;
    v12 = v6;
    v8 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](delayedAssetsByPersonUUIDNeedingContainmentUpdates, "enumerateKeysAndObjectsUsingBlock:", v11);
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v5, "setAssetIDsByPersonUUIDNeedingContainmentUpdates:", v9);

    v10 = self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates;
  }
  else
  {
    v10 = 0;
  }
  -[NSMutableDictionary removeAllObjects](v10, "removeAllObjects");
}

- (void)recordDeduplicationNeededForNewGroupNode:(id)a3
{
  id v4;
  NSMutableSet *delayedSocialGroupNodesNeedingDeduplication;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedSocialGroupNodesNeedingDeduplication = self->_delayedSocialGroupNodesNeedingDeduplication;
  v8 = v4;
  if (!delayedSocialGroupNodesNeedingDeduplication)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_delayedSocialGroupNodesNeedingDeduplication;
    self->_delayedSocialGroupNodesNeedingDeduplication = v6;

    v4 = v8;
    delayedSocialGroupNodesNeedingDeduplication = self->_delayedSocialGroupNodesNeedingDeduplication;
  }
  -[NSMutableSet addObject:](delayedSocialGroupNodesNeedingDeduplication, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeSocialGroupDeduplication"));

}

- (void)_popSocialGroupNodeIDsNeedingDeduplicationIntoDetail:(id)a3
{
  NSMutableSet *delayedSocialGroupNodesNeedingDeduplication;
  id v5;
  void *v6;
  void *v7;
  NSMutableSet *v8;

  delayedSocialGroupNodesNeedingDeduplication = self->_delayedSocialGroupNodesNeedingDeduplication;
  if (delayedSocialGroupNodesNeedingDeduplication)
  {
    v5 = a3;
    -[NSMutableSet valueForKey:](delayedSocialGroupNodesNeedingDeduplication, "valueForKey:", CFSTR("objectID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "setSocialGroupNodeIDsNeedingDeduplication:", v7);

    v8 = self->_delayedSocialGroupNodesNeedingDeduplication;
  }
  else
  {
    v8 = 0;
  }
  -[NSMutableSet removeAllObjects](v8, "removeAllObjects");
}

- (void)recordDeduplicationNeededForGroupsContainingMember:(id)a3
{
  id v4;
  NSMutableSet *delayedDeduplicationNeededForSocialGroupsContainingMembers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedDeduplicationNeededForSocialGroupsContainingMembers = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
  v8 = v4;
  if (!delayedDeduplicationNeededForSocialGroupsContainingMembers)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
    self->_delayedDeduplicationNeededForSocialGroupsContainingMembers = v6;

    v4 = v8;
    delayedDeduplicationNeededForSocialGroupsContainingMembers = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
  }
  -[NSMutableSet addObject:](delayedDeduplicationNeededForSocialGroupsContainingMembers, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeSocialGroupDeduplication"));

}

- (void)_popMembersOfGroupsNeedingDeduplicationIntoDetail:(id)a3
{
  NSMutableSet *delayedDeduplicationNeededForSocialGroupsContainingMembers;
  id v5;
  void *v6;
  void *v7;
  NSMutableSet *v8;

  delayedDeduplicationNeededForSocialGroupsContainingMembers = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
  if (delayedDeduplicationNeededForSocialGroupsContainingMembers)
  {
    v5 = a3;
    -[NSMutableSet valueForKey:](delayedDeduplicationNeededForSocialGroupsContainingMembers, "valueForKey:", CFSTR("objectID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "setMemberIDsOfSocialGroupsNeedingDeduplication:", v7);

    v8 = self->_delayedDeduplicationNeededForSocialGroupsContainingMembers;
  }
  else
  {
    v8 = 0;
  }
  -[NSMutableSet removeAllObjects](v8, "removeAllObjects");
}

- (void)recordAssetPersonEdgeUpdateNeededForAsset:(id)a3
{
  id v4;
  NSMutableSet *delayedAssetPersonEdgeUpdatesNeededForAssets;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  delayedAssetPersonEdgeUpdatesNeededForAssets = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
  v8 = v4;
  if (!delayedAssetPersonEdgeUpdatesNeededForAssets)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
    self->_delayedAssetPersonEdgeUpdatesNeededForAssets = v6;

    v4 = v8;
    delayedAssetPersonEdgeUpdatesNeededForAssets = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
  }
  -[NSMutableSet addObject:](delayedAssetPersonEdgeUpdatesNeededForAssets, "addObject:", v4);
  -[PLDelayedSaveActions persistDelayedActionsScope:](self, "persistDelayedActionsScope:", CFSTR("PLTransactionScopeSocialGroupAssetPersonEdges"));

}

- (void)_popAssetIDsNeedingAssetPersonEdgeUpdateIntoDetail:(id)a3
{
  NSMutableSet *delayedAssetPersonEdgeUpdatesNeededForAssets;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;

  delayedAssetPersonEdgeUpdatesNeededForAssets = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
  if (delayedAssetPersonEdgeUpdatesNeededForAssets)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = a3;
    -[NSMutableSet valueForKey:](delayedAssetPersonEdgeUpdatesNeededForAssets, "valueForKey:", CFSTR("objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAssetIDsNeedingAssetPersonEdgeUpdates:", v8);

    v9 = self->_delayedAssetPersonEdgeUpdatesNeededForAssets;
  }
  else
  {
    v9 = 0;
  }
  -[NSMutableSet removeAllObjects](v9, "removeAllObjects");
}

- (PLClientServerTransaction)clientTransaction
{
  return self->_clientTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTransaction, 0);
  objc_storeStrong((id *)&self->_delayedAssetPersonEdgeUpdatesNeededForAssets, 0);
  objc_storeStrong((id *)&self->_delayedDeduplicationNeededForSocialGroupsContainingMembers, 0);
  objc_storeStrong((id *)&self->_delayedSocialGroupNodesNeedingDeduplication, 0);
  objc_storeStrong((id *)&self->_delayedAssetsByPersonUUIDNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_delayedAssetsNeedingSocialGroupContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_delayedSocialGroupMembersOfGroupsNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_delayedLibraryScopeParticipantsUpdateUUIDs, 0);
  objc_storeStrong((id *)&self->_delayedWallpaperSuggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_delayedWallpaperFavoriteAlbumAssetRemovalNeeded, 0);
  objc_storeStrong((id *)&self->_delayedWallpaperUserAlbumAssetRemovalNeeded, 0);
  objc_storeStrong((id *)&self->_delayedWidgetFavoriteAlbumAssetRemovalNeeded, 0);
  objc_storeStrong((id *)&self->_delayedWidgetUserAlbumAssetRemovalNeeded, 0);
  objc_storeStrong((id *)&self->_delayedFeaturedContentUpdateNeededForPerson, 0);
  objc_storeStrong((id *)&self->_delayedWidgetTimelineReloadTypesNeeded, 0);
  objc_storeStrong((id *)&self->_delayedMemoriesAssetUpdate, 0);
  objc_storeStrong((id *)&self->_delayedMemoriesForDuetDelete, 0);
  objc_storeStrong((id *)&self->_delayedAssetsForDuetDelete, 0);
  objc_storeStrong((id *)&self->_delayedWorkerTypesToAnalyzeByAssetUUID, 0);
  objc_storeStrong((id *)&self->_delayedImportSessionCountsAndDateRangeUpdates, 0);
  objc_storeStrong((id *)&self->_delayedAlbumKeyAssetsUpdates, 0);
  objc_storeStrong((id *)&self->_delayedAlbumCountsAndDateRangeUpdates, 0);
  objc_storeStrong((id *)&self->_assetBaseSearchIndexPredicate, 0);
  objc_storeStrong((id *)&self->_delayedSearchIndexUpdateUUIDs, 0);
  objc_storeStrong((id *)&self->_delayedAssetsForFileSystemPersistency, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedInvitationRecordUpdates, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedCommentInserts, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedAssetUpdates, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedAssetInserts, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedAlbumUpdates, 0);
  objc_storeStrong((id *)&self->_delayedCloudFeedDeletionEntries, 0);
  objc_storeStrong((id *)&self->_delayedHighlightMomentUpdates, 0);
  objc_storeStrong((id *)&self->_delayedSharedAssetIncrementalChangeContainersByAssetUUID, 0);
  objc_storeStrong((id *)&self->_delayedMomentAssetUpdates, 0);
  objc_storeStrong((id *)&self->_delayedHighlightAssetUpdates, 0);
  objc_storeStrong((id *)&self->_delayedMomentAssetDeletions, 0);
}

void __94__PLDelayedSaveActions__popAssetIDsByPersonUUIDNeedingSocialGroupContainmentUpdateIntoDetail___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  objc_msgSend(a3, "valueForKey:", CFSTR("objectID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __165__PLDelayedSaveActions__popDelayedMomentInsertsAndUpdates_deletes_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_sharedAssetContainerIncrementalChanges___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "change");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);

}

+ (void)_checkForHighlightChangesOnToOneRelationshipNamed:(id)a3 andAddIntoChange:(id)a4 givenOldValue:(id)a5 andNewValue:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  if ((a5 == 0) == (a6 != 0))
  {
    v9 = a6;
    v10 = a4;
    v11 = a3;
    objc_msgSend(a5, "objectID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addHighlightContainerChange:sourceHighlightID:destinationHighlightID:", v11, v13, v12);
  }
}

+ (void)_checkForHighlightChangesOnToManyRelationshipNamed:(id)a3 andAddIntoChange:(id)a4 givenOldValue:(id)a5 andNewValue:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(v11, "isEqualToSet:", v12) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minusSet:", v12);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v18), "objectID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addHighlightContainerChange:sourceHighlightID:destinationHighlightID:", v9, v19, 0);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "minusSet:", v11);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25), "objectID", (_QWORD)v27);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addHighlightContainerChange:sourceHighlightID:destinationHighlightID:", v9, 0, v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v23);
    }

  }
}

+ (void)_addHighlightRelationshipChangesFromChangedValues:(id)a3 onAsset:(id)a4 intoChange:(id)a5 forRelationshipNamed:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "committedValuesForKeys:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKey:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqual:", v17) & 1) != 0)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(v15, "objectForKey:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "valueForKey:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_checkForHighlightChangesOnToOneRelationshipNamed:andAddIntoChange:givenOldValue:andNewValue:", v12, v11, v18, v19);

  }
}

@end

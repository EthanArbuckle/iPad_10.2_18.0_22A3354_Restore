@implementation PLDelayedSaveActionsProcessor

- (PLDelayedSaveActionsProcessor)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PLDelayedSaveActionsProcessor *v6;
  PLDelayedSaveActionsProcessor *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *coreDuetCallback;
  PLDelayedSaveActionsProcessor *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLDelayedSaveActionsProcessor;
  v6 = -[PLDelayedSaveActionsProcessor init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.assetsd.coreduetcallback", v9);
    coreDuetCallback = v7->_coreDuetCallback;
    v7->_coreDuetCallback = (OS_dispatch_queue *)v10;

    v12 = v7;
  }

  return v7;
}

- (void)processDelayedDeletionsFromChangeHubEvent:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a5;
  v10 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedSaveActionsProcessor.m"), 72, CFSTR("Must be in assetsd"));

  }
  +[PLDelayedFiledSystemDeletions deletionsFromChangeHubEvent:](PLDelayedFiledSystemDeletions, "deletionsFromChangeHubEvent:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary:", v10);

  objc_msgSend(v9, "stillAlive");
}

- (void)processDelayedMomentGeneratorSaveActionsFromDetail:(id)a3
{
  PLLibraryServicesManager *libraryServicesManager;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  libraryServicesManager = self->_libraryServicesManager;
  v4 = a3;
  -[PLLibraryServicesManager momentGenerationDataManager](libraryServicesManager, "momentGenerationDataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generator");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "momentInsertsAndUpdates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentDeletes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedAssetIDsForHighlights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedMomentIDsForHighlights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedAssetContainerIncrementalChangesByAssetID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "saveChangesForAssetInsertsAndUpdates:assetDeletes:assetUpdatesForHighlights:momentUpdatesForHighlights:sharedAssetContainerIncrementalChangesByAssetID:", v6, v7, v8, v9, v10);
}

- (void)processDelayedSaveActionsDetail:(id)a3 withPhotoLibrary:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v45 = a3;
  v8 = a5;
  v9 = a4;
  if (PLPlatformCloudFeedSupported())
  {
    objc_msgSend(v45, "cloudFeedAlbumUpdates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "cloudFeedAssetInserts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "cloudFeedAssetUpdates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "cloudFeedCommentInserts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "cloudFeedInvitationRecordUpdates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "cloudFeedDeletionEntries");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDelayedSaveActionsProcessor _processDelayedCloudFeedAlbumUpdates:assetInserts:assetUpdates:commentInserts:invitationRecordUpdates:deletionEntries:transaction:](self, "_processDelayedCloudFeedAlbumUpdates:assetInserts:assetUpdates:commentInserts:invitationRecordUpdates:deletionEntries:transaction:", v10, v11, v12, v13, v14, v15, v8);

  }
  if (objc_msgSend(v45, "shouldHandleMoments"))
    -[PLDelayedSaveActionsProcessor _processDelayedMomentChangesWithTransaction:](self, "_processDelayedMomentChangesWithTransaction:", v8);
  if (PLPlatformSearchSupported())
  {
    objc_msgSend(v45, "searchIndexUpdates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDelayedSaveActionsProcessor _processDelayedSearchIndexUpdates:transaction:](self, "_processDelayedSearchIndexUpdates:transaction:", v16, v8);

  }
  objc_msgSend(v45, "albumCountsAndDateRangeUpdates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedAlbumCountsAndDateRangeUpdates:library:transaction:](self, "_processDelayedAlbumCountsAndDateRangeUpdates:library:transaction:", v17, v9, v8);

  objc_msgSend(v45, "albumKeyAssetsUpdates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedAlbumKeyAssetsUpdates:library:transaction:](self, "_processDelayedAlbumKeyAssetsUpdates:library:transaction:", v18, v9, v8);

  objc_msgSend(v45, "importSessionCountsAndDateRangeUpdates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedImportSessionCountsAndDateRangeUpdates:library:transaction:](self, "_processDelayedImportSessionCountsAndDateRangeUpdates:library:transaction:", v19, v9, v8);

  objc_msgSend(v45, "widgetTimelineReloadTypesNeeded");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", &unk_1E375F450);

  v22 = objc_msgSend(v45, "shouldUpdateFeaturedContent");
  objc_msgSend(v45, "personsToUpdateForFeaturedContent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedFeaturedContentUpdateAndWidgetTimelineReload:withPersonUUIDs:shouldReloadWidgetTimeline:library:transaction:](self, "_processDelayedFeaturedContentUpdateAndWidgetTimelineReload:withPersonUUIDs:shouldReloadWidgetTimeline:library:transaction:", v22, v23, v21, v9, v8);

  objc_msgSend(v45, "assetsForWidgetUserAlbumRemoval");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedAssetsForWidgetUserAlbumRemoval:library:transaction:](self, "_processDelayedAssetsForWidgetUserAlbumRemoval:library:transaction:", v24, v9, v8);

  objc_msgSend(v45, "assetsForWidgetFavoriteAlbumRemoval");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedAssetsForWidgetFavoriteAlbumRemoval:library:transaction:](self, "_processDelayedAssetsForWidgetFavoriteAlbumRemoval:library:transaction:", v25, v9, v8);

  objc_msgSend(v45, "widgetTimelineReloadTypesNeeded");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "containsObject:", &unk_1E375F468);

  -[PLDelayedSaveActionsProcessor _processDelayedAlbumWidgetTimelineReload:library:transaction:](self, "_processDelayedAlbumWidgetTimelineReload:library:transaction:", v27, v9, v8);
  objc_msgSend(v45, "assetsForWallpaperUserAlbumRemoval");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedAssetsForWallpaperUserAlbumRemoval:library:transaction:](self, "_processDelayedAssetsForWallpaperUserAlbumRemoval:library:transaction:", v28, v9, v8);

  objc_msgSend(v45, "assetsForWallpaperFavoriteAlbumRemoval");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedAssetsForWallpaperFavoriteAlbumRemoval:library:transaction:](self, "_processDelayedAssetsForWallpaperFavoriteAlbumRemoval:library:transaction:", v29, v9, v8);

  objc_msgSend(v45, "wallpaperSuggestionReloadUUIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedWallpaperSuggestionReload:library:transaction:](self, "_processDelayedWallpaperSuggestionReload:library:transaction:", v30, v9, v8);

  objc_msgSend(v45, "assetsForDuetDelete");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedAssetsForDuetDelete:transaction:](self, "_processDelayedAssetsForDuetDelete:transaction:", v31, v8);

  objc_msgSend(v45, "memoriesForDuetDelete");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedMemoriesForDuetDelete:transaction:](self, "_processDelayedMemoriesForDuetDelete:transaction:", v32, v8);

  objc_msgSend(v45, "memoriesForAssetUpdate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedMemoriesAssetUpdate:library:transaction:](self, "_processDelayedMemoriesAssetUpdate:library:transaction:", v33, v9, v8);

  objc_msgSend(v45, "libraryScopeParticipantsForUpdate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processDelayedLibraryScopeParticipantsUpdate:library:transaction:](self, "_processDelayedLibraryScopeParticipantsUpdate:library:transaction:", v34, v9, v8);

  -[PLDelayedSaveActionsProcessor _processDelayedLibraryScopeRulesUpdate:library:transaction:](self, "_processDelayedLibraryScopeRulesUpdate:library:transaction:", objc_msgSend(v45, "libraryScopeRulesUpdated"), v9, v8);
  objc_msgSend(v45, "socialGroupNodeIDsNeedingDeduplication");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count") != 0;

  objc_msgSend(v45, "memberIDsOfSocialGroupsNeedingDeduplication");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processMembersOfSocialGroupsNeedingDeduplication:pendingSocialGroupIDsNeedingDeduplication:library:transaction:](self, "_processMembersOfSocialGroupsNeedingDeduplication:pendingSocialGroupIDsNeedingDeduplication:library:transaction:", v37, v36, v9, v8);

  objc_msgSend(v45, "socialGroupNodeIDsNeedingDeduplication");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processSocialGroupsNeedingDeduplication:library:transaction:](self, "_processSocialGroupsNeedingDeduplication:library:transaction:", v38, v9, v8);

  objc_msgSend(v45, "assetIDsNeedingAssetPersonEdgeUpdates");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processAssetsNeedingAssetPersonEdgeUpdates:library:transaction:](self, "_processAssetsNeedingAssetPersonEdgeUpdates:library:transaction:", v39, v9, v8);

  objc_msgSend(v45, "memberIDsOfSocialGroupsNeedingContainmentUpdates");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count") != 0;

  objc_msgSend(v45, "assetIDsByPersonUUIDNeedingContainmentUpdates");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "assetIDsNeedingContainmentUpdates");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processAssetIDsByPersonUUIDNeedingContainmentUpdates:assetIDsNeedingContainmentUpdates:pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates:library:transaction:](self, "_processAssetIDsByPersonUUIDNeedingContainmentUpdates:assetIDsNeedingContainmentUpdates:pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates:library:transaction:", v42, v43, v41, v9, v8);

  objc_msgSend(v45, "memberIDsOfSocialGroupsNeedingContainmentUpdates");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDelayedSaveActionsProcessor _processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs:library:transaction:](self, "_processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs:library:transaction:", v44, v9, v8);

  objc_msgSend(v8, "completeTransactionScope:", CFSTR("PLTransactionScopeFileIngestion"));
}

- (void)_processDelayedCloudFeedAlbumUpdates:(id)a3 assetInserts:(id)a4 assetUpdates:(id)a5 commentInserts:(id)a6 invitationRecordUpdates:(id)a7 deletionEntries:(id)a8 transaction:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  PLCloudFeedEntriesManager *v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedSaveActionsProcessor.m"), 144, CFSTR("Must be in assetsd"));

  }
  if (objc_msgSend(v16, "count")
    || objc_msgSend(v17, "count")
    || objc_msgSend(v18, "count")
    || objc_msgSend(v19, "count")
    || objc_msgSend(v20, "count")
    || objc_msgSend(v21, "count"))
  {
    -[PLLibraryServicesManager databaseContext](self->_libraryServicesManager, "databaseContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "newShortLivedLibraryWithName:", "delayedSaveActions_cloudFeed_processAlbumUpdates");

    v25 = -[PLCloudFeedEntriesManager initWithPhotoLibrary:]([PLCloudFeedEntriesManager alloc], "initWithPhotoLibrary:", v24);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __163__PLDelayedSaveActionsProcessor__processDelayedCloudFeedAlbumUpdates_assetInserts_assetUpdates_commentInserts_invitationRecordUpdates_deletionEntries_transaction___block_invoke;
    v27[3] = &unk_1E3677AA0;
    v28 = v22;
    -[PLCloudFeedEntriesManager processAlbumUpdates:assetInserts:assetUpdates:commentInserts:invitationRecordUpdates:deletionEntries:completionHandler:](v25, "processAlbumUpdates:assetInserts:assetUpdates:commentInserts:invitationRecordUpdates:deletionEntries:completionHandler:", v16, v17, v18, v19, v20, v21, v27);

  }
}

- (void)_processDelayedMomentChangesWithTransaction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedSaveActionsProcessor.m"), 163, CFSTR("Must be in assetsd"));

  }
  -[PLLibraryServicesManager momentGenerationDataManager](self->_libraryServicesManager, "momentGenerationDataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PLDelayedSaveActionsProcessor__processDelayedMomentChangesWithTransaction___block_invoke;
  v10[3] = &unk_1E3677AA0;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v7, "generateWithIncrementalDataCompletionHandler:", v10);

}

- (void)_processDelayedSearchIndexUpdates:(id)a3 transaction:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedSaveActionsProcessor.m"), 175, CFSTR("Must be in assetsd"));

  }
  if (objc_msgSend(v7, "count"))
  {
    -[PLLibraryServicesManager searchIndexManager](self->_libraryServicesManager, "searchIndexManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__PLDelayedSaveActionsProcessor__processDelayedSearchIndexUpdates_transaction___block_invoke;
    v11[3] = &unk_1E3677AA0;
    v12 = v8;
    objc_msgSend(v9, "applyUpdates:completion:", v7, v11);

  }
}

- (void)_processDelayedAlbumCountsAndDateRangeUpdates:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  if (PLIsAssetsd() && objc_msgSend(v11, "count"))
  {
    objc_msgSend(v8, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedSaveActionsProcessor.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryServicesManager"));

    }
    objc_msgSend(v9, "refreshAlbumCountForAlbumIDs:", v11);

  }
}

- (void)_processDelayedAlbumKeyAssetsUpdates:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (PLIsAssetsd() && objc_msgSend(v7, "count"))
  {
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90__PLDelayedSaveActionsProcessor__processDelayedAlbumKeyAssetsUpdates_library_transaction___block_invoke;
    v13[3] = &unk_1E3677C18;
    v14 = v8;
    v15 = v7;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __90__PLDelayedSaveActionsProcessor__processDelayedAlbumKeyAssetsUpdates_library_transaction___block_invoke_2;
    v11[3] = &unk_1E3677AA0;
    v12 = v9;
    objc_msgSend(v14, "performTransaction:completionHandler:", v13, v11);

  }
}

- (void)_processDelayedImportSessionCountsAndDateRangeUpdates:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  if (PLIsAssetsd() && objc_msgSend(v11, "count"))
  {
    objc_msgSend(v8, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedSaveActionsProcessor.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryServicesManager"));

    }
    objc_msgSend(v9, "refreshImportSessionCountForImportSessionIDs:", v11);

  }
}

- (void)_processDelayedFeaturedContentUpdateAndWidgetTimelineReload:(BOOL)a3 withPersonUUIDs:(id)a4 shouldReloadWidgetTimeline:(BOOL)a5 library:(id)a6 transaction:(id)a7
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  uint8_t buf[16];

  v9 = a5;
  v10 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (PLIsAssetsd() && v10)
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Delayed save actions processor: updating featured content with photo analysis", buf, 2u);
    }

    objc_msgSend(v13, "photoAnalysisClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __156__PLDelayedSaveActionsProcessor__processDelayedFeaturedContentUpdateAndWidgetTimelineReload_withPersonUUIDs_shouldReloadWidgetTimeline_library_transaction___block_invoke;
    v17[3] = &unk_1E366C060;
    v20 = v9;
    v17[4] = self;
    v18 = v13;
    v19 = v14;
    objc_msgSend(v16, "requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:reply:", v12, v17);

  }
  else
  {
    -[PLDelayedSaveActionsProcessor _processDelayedForYouWidgetTimelineReload:library:transaction:](self, "_processDelayedForYouWidgetTimelineReload:library:transaction:", v9, v13, v14);
  }

}

- (void)_processDelayedAlbumWidgetTimelineReload:(BOOL)a3 library:(id)a4 transaction:(id)a5
{
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = a4;
  if (PLIsAssetsd() && v5)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Delayed save actions processor: Invalidating Album widget timeline with photo analysis", v9, 2u);
    }

    objc_msgSend(v6, "photoAnalysisClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadAlbumWidgetTimelineWithReply:", 0);

  }
}

- (void)_processDelayedForYouWidgetTimelineReload:(BOOL)a3 library:(id)a4 transaction:(id)a5
{
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = a4;
  if (PLIsAssetsd() && v5)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Delayed save actions processor: Invalidating ForYou widget timeline with photo analysis", v9, 2u);
    }

    objc_msgSend(v6, "photoAnalysisClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadForYouWidgetTimelineWithReply:", 0);

  }
}

- (void)_processDelayedAssetsForWidgetUserAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  PLDelayedSaveActionsProcessor *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (PLIsAssetsd() && objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __100__PLDelayedSaveActionsProcessor__processDelayedAssetsForWidgetUserAlbumRemoval_library_transaction___block_invoke;
    v11[3] = &unk_1E3677998;
    v12 = v8;
    v13 = v9;
    v14 = self;
    v15 = v10;
    objc_msgSend(v13, "performTransaction:", v11);

  }
}

- (void)_processDelayedAssetsForWidgetFavoriteAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  PLDelayedSaveActionsProcessor *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (PLIsAssetsd() && objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__PLDelayedSaveActionsProcessor__processDelayedAssetsForWidgetFavoriteAlbumRemoval_library_transaction___block_invoke;
    v11[3] = &unk_1E3677998;
    v12 = v9;
    v13 = v8;
    v14 = self;
    v15 = v10;
    objc_msgSend(v12, "performTransaction:", v11);

  }
}

- (void)_processDelayedAssetsForWallpaperUserAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  PLDelayedSaveActionsProcessor *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (PLIsAssetsd() && objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __103__PLDelayedSaveActionsProcessor__processDelayedAssetsForWallpaperUserAlbumRemoval_library_transaction___block_invoke;
    v11[3] = &unk_1E3677998;
    v12 = v9;
    v13 = v8;
    v14 = self;
    v15 = v10;
    objc_msgSend(v12, "performTransaction:", v11);

  }
}

- (void)_processDelayedAssetsForWallpaperFavoriteAlbumRemoval:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  PLDelayedSaveActionsProcessor *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (PLIsAssetsd() && objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __107__PLDelayedSaveActionsProcessor__processDelayedAssetsForWallpaperFavoriteAlbumRemoval_library_transaction___block_invoke;
    v11[3] = &unk_1E3677998;
    v12 = v9;
    v13 = v8;
    v14 = self;
    v15 = v10;
    objc_msgSend(v12, "performTransaction:", v11);

  }
}

- (void)_processDelayedWallpaperSuggestionReload:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (PLIsAssetsd() && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "photoAnalysisClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadWallpaperSuggestions:reply:", v6, 0);
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Delayed save actions processor: reloading wallpaper suggestions. suggestion count %lu", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)_processDelayedAssetsForDuetDelete:(id)a3 transaction:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v26;
  void *v27;
  void *v28;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  PLDelayedSaveActionsProcessor *v77;
  id v78;
  _QWORD v79[31];
  uint8_t buf[4];
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedSaveActionsProcessor.m"), 397, CFSTR("Must be in assetsd"));

  }
  v9 = objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    v76 = v8;
    v77 = self;
    v78 = v7;
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v81 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Going to delete %lu assets from knowledge store", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D15AB0], "sharesStream");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "name");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v74;
    objc_msgSend(MEMORY[0x1E0D15AB0], "shareExtensionStream");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "name");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v72;
    objc_msgSend(MEMORY[0x1E0D15AB0], "useAsWallpaperStream");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "name");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v70;
    objc_msgSend(MEMORY[0x1E0D15AB0], "createWatchFaceStream");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "name");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v79[3] = v68;
    objc_msgSend(MEMORY[0x1E0D15AB0], "airplayStream");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "name");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v79[4] = v66;
    objc_msgSend(MEMORY[0x1E0D15AB0], "airdropStream");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "name");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v79[5] = v64;
    objc_msgSend(MEMORY[0x1E0D15AB0], "saveToFilesStream");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "name");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v79[6] = v62;
    objc_msgSend(MEMORY[0x1E0D15AB0], "assignToContactStream");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "name");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v79[7] = v60;
    objc_msgSend(MEMORY[0x1E0D15AB0], "addToAlbumStream");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "name");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v79[8] = v58;
    objc_msgSend(MEMORY[0x1E0D15AB0], "addToSharedAlbumStream");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "name");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v79[9] = v56;
    objc_msgSend(MEMORY[0x1E0D15AB0], "hideStream");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "name");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v79[10] = v54;
    objc_msgSend(MEMORY[0x1E0D15AB0], "viewedFor1SecondStream");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "name");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v79[11] = v52;
    objc_msgSend(MEMORY[0x1E0D15AB0], "viewedFor2SecondsStream");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "name");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v79[12] = v50;
    objc_msgSend(MEMORY[0x1E0D15AB0], "viewedFor3SecondsStream");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "name");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v79[13] = v48;
    objc_msgSend(MEMORY[0x1E0D15AB0], "eyeCatchinessStream");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "name");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v79[14] = v46;
    objc_msgSend(MEMORY[0x1E0D15AB0], "zoomEngagementStream");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "name");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v79[15] = v44;
    objc_msgSend(MEMORY[0x1E0D15AB0], "otherEngagementStream");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v79[16] = v42;
    objc_msgSend(MEMORY[0x1E0D15AB0], "recentFavoritesStream");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "name");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v79[17] = v40;
    objc_msgSend(MEMORY[0x1E0D15AB0], "oldFavoritesStream");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v79[18] = v38;
    objc_msgSend(MEMORY[0x1E0D15AB0], "otherFavoritesStream");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v79[19] = v35;
    objc_msgSend(MEMORY[0x1E0D15AB0], "recentDeletionsStream");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v79[20] = v33;
    objc_msgSend(MEMORY[0x1E0D15AB0], "oldDeletionsStream");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v79[21] = v31;
    objc_msgSend(MEMORY[0x1E0D15AB0], "allDeletionsStream");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v79[22] = v29;
    objc_msgSend(MEMORY[0x1E0D15AB0], "editFilterStream");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v79[23] = v27;
    objc_msgSend(MEMORY[0x1E0D15AB0], "editLightingStream");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v79[24] = v25;
    objc_msgSend(MEMORY[0x1E0D15AB0], "editCropStream");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v79[25] = v23;
    objc_msgSend(MEMORY[0x1E0D15AB0], "editAllStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v79[26] = v13;
    objc_msgSend(MEMORY[0x1E0D15AB0], "livePhotosLoopStream");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v79[27] = v15;
    objc_msgSend(MEMORY[0x1E0D15AB0], "livePhotosBounceStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v79[28] = v17;
    objc_msgSend(MEMORY[0x1E0D15AB0], "livePhotosLongExposureStream");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v79[29] = v19;
    objc_msgSend(MEMORY[0x1E0D15AB0], "livePhotosOtherStream");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v79[30] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 31);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v78;
    v8 = v76;
    -[PLDelayedSaveActionsProcessor _deleteUUIDs:fromCoreDuetStreams:transaction:](v77, "_deleteUUIDs:fromCoreDuetStreams:transaction:", v78, v37, v76);

  }
}

- (void)_processDelayedMemoriesForDuetDelete:(id)a3 transaction:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedSaveActionsProcessor.m"), 444, CFSTR("Must be in assetsd"));

  }
  v9 = objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Going to delete %lu memories from knowledge store", (uint8_t *)&v13, 0xCu);
    }

    -[PLDelayedSaveActionsProcessor _deleteUUIDs:fromCoreDuetStreams:transaction:](self, "_deleteUUIDs:fromCoreDuetStreams:transaction:", v7, &unk_1E3763C50, v8);
  }

}

- (void)_deleteUUIDs:(id)a3 fromCoreDuetStreams:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  OS_dispatch_queue *coreDuetCallback;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;
  void *context;
  uint64_t v34;
  unint64_t v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[2];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v31 = a5;
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStreamNames:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v7;
  objc_msgSend(v7, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v28, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    do
    {
      context = (void *)MEMORY[0x19AEC1554]();
      v34 = v11;
      v35 = v10;
      if (v10 >= 0xA)
        v10 = 10;
      objc_msgSend(v28, "subarrayWithRange:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v10;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForObjectsWithMetadataKey:andStringValue:", CFSTR("_DKPhotosMetadataKey.identifier"), *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v13, "addObject:", v19);
            }
            else
            {
              PLBackendGetLog();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to create a predicate for coreduet stream info", buf, 2u);
              }

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v16);
      }

      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3528];
      v43[0] = v30;
      v43[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      coreDuetCallback = self->_coreDuetCallback;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __78__PLDelayedSaveActionsProcessor__deleteUUIDs_fromCoreDuetStreams_transaction___block_invoke;
      v36[3] = &unk_1E366C088;
      v37 = v31;
      objc_msgSend(v29, "deleteAllEventsMatchingPredicate:responseQueue:withCompletion:", v24, coreDuetCallback, v36);
      v10 = v35 - v32;
      v11 = v34 + v32;

      objc_autoreleasePoolPop(context);
    }
    while (v35 != v32);
  }

}

- (void)_processDelayedMemoriesAssetUpdate:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (PLIsAssetsd() && objc_msgSend(v6, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__PLDelayedSaveActionsProcessor__processDelayedMemoriesAssetUpdate_library_transaction___block_invoke;
    v8[3] = &unk_1E3677C18;
    v9 = v6;
    v10 = v7;
    objc_msgSend(v10, "performTransaction:", v8);

  }
}

- (void)_processDelayedLibraryScopeParticipantsUpdate:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (PLIsAssetsd() && objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          PLBackendGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v13;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Delayed save actions processor: Updating smart-sharing cache with photo analysis %@", buf, 0xCu);
          }

          objc_msgSend(v7, "photoAnalysisClient");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID:withOptions:reply:", v13, 0, 0);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v10);
    }

  }
}

- (void)_processDelayedLibraryScopeRulesUpdate:(BOOL)a3 library:(id)a4 transaction:(id)a5
{
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = a4;
  if (PLIsAssetsd() && v5)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Delayed save actions processor: Reset sharing suggestions on library scope rules update", v9, 2u);
    }

    objc_msgSend(v6, "photoAnalysisClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply:", 0);

  }
}

- (void)_runAssetContainmentForSocialGroup:(id)a3 assetIDsToUpdate:(id)a4
{
  id v5;
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "socialGroupVerifiedType") - 1 > 1)
  {
    v8 = 0;
  }
  else
  {
    v10 = 0;
    v7 = objc_msgSend(v5, "runAssetContainmentWithError:assetIDsToUpdate:", &v10, v6);
    v8 = v10;
    if ((v7 & 1) == 0)
    {
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error running containment on social group needing update: %@", buf, 0xCu);
      }

    }
  }

}

- (void)_runContainmentOnAllGroupsNeedingContainmentUpdates:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v6, "managedObjectContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        objc_msgSend(v14, "existingObjectWithID:error:", v12, &v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v21;

        if (v15)
        {
          if ((objc_msgSend(v15, "isDeleted") & 1) != 0)
            goto LABEL_13;
          v17 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v15);
          -[PLDelayedSaveActionsProcessor _runAssetContainmentForSocialGroup:assetIDsToUpdate:](self, "_runAssetContainmentForSocialGroup:assetIDsToUpdate:", v17, 0);
          if (-[NSObject keyAssetIsNeeded](v17, "keyAssetIsNeeded"))
          {
            -[NSObject uuid](v17, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v18);

          }
        }
        else
        {
          PLBackendGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v16;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error getting social group source node from ID: %@", buf, 0xCu);
          }
        }

LABEL_13:
        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

  +[PLSocialGroup updateKeyAssetOfSocialGroupsWithUUIDs:inLibrary:](PLSocialGroup, "updateKeyAssetOfSocialGroupsWithUUIDs:inLibrary:", v19, v6);
}

- (id)_socialGroupNodeIDsContainingMember:(id)a3 library:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  _QWORD v51[2];
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pl_graphCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "labelWithCode:inContext:", 1000, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v43 = v10;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C97B48];
    +[PLGraphEdge entityName](PLGraphEdge, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchRequestWithEntityName:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3528];
    v44 = v8;
    v42 = v12;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode.primaryLabel"), v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v18;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("targetPerson"), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "andPredicateWithSubpredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v21);

    objc_msgSend(v8, "managedObjectContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v22, "executeFetchRequest:error:", v16, &v49);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v49;

    if (v24)
    {
      v25 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v24);
    }
    else
    {
      v40 = v23;
      v41 = v7;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v29 = v23;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v46 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v34, "sourceNode");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v35;
            if (v35 && (objc_msgSend(v35, "isDeleted") & 1) == 0)
            {
              objc_msgSend(v34, "sourceNode");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
                objc_msgSend(v13, "addObject:", v38);

            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v31);
      }

      v25 = v13;
      v23 = v40;
      v7 = v41;
      v8 = v44;
    }

    v12 = v42;
    v10 = v43;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D74498];
    v52 = *MEMORY[0x1E0CB2938];
    v53[0] = CFSTR("error getting the social group label");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 46502, v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v28;
    if (a5)
    {
      v16 = objc_retainAutorelease(v28);
      v25 = 0;
      *a5 = v16;
    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

- (void)_processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (PLIsAssetsd() && objc_msgSend(v11, "count"))
  {
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __125__PLDelayedSaveActionsProcessor__processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs_library_transaction___block_invoke;
    v14[3] = &unk_1E3677530;
    v14[4] = self;
    v15 = v11;
    v16 = v8;
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __125__PLDelayedSaveActionsProcessor__processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs_library_transaction___block_invoke_99;
    v12[3] = &unk_1E3677AA0;
    v13 = v9;
    objc_msgSend(v16, "performTransactionAndWait:completionHandler:", v14, v12);

  }
}

- (id)_assetIDsByPersonUUIDWithAllPersonsFromAssetsNeedingContainmentUpdates:(id)a3 assetIDsNeedingContainmentUpdates:(id)a4 inContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  _QWORD v48[3];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v10 = objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  if (!v8)
  {
LABEL_16:
    v32 = v11;
    goto LABEL_20;
  }
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("sourceAsset"), v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("targetPerson"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v17);

  objc_msgSend(v12, "setResultType:", 2);
  v48[0] = CFSTR("sourceAsset");
  v48[1] = CFSTR("targetPerson.personUUID");
  v48[2] = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPropertiesToFetch:", v18);

  objc_msgSend(v12, "setFetchBatchSize:", 100);
  v44 = 0;
  v38 = v12;
  objc_msgSend(v9, "executeFetchRequest:error:", v12, &v44);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v44;
  v21 = v20;
  if (v19)
  {
    v35 = v20;
    v36 = v9;
    v37 = v7;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v19;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v27 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("targetPerson.personUUID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("sourceAsset"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v30, "mutableCopy");

          if (!v31)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v31, "addObject:", v29);
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, v28);

          objc_autoreleasePoolPop(v27);
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v23);
    }

    v7 = v37;
    v9 = v36;
    goto LABEL_16;
  }
  PLBackendGetLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v21;
    _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetching asset-person edge dictionaries: %@", buf, 0xCu);
  }

  v32 = 0;
LABEL_20:

  return v32;
}

- (id)_personUUIDsByNodeIDFromAssetPersonDictionaries:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
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
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  _QWORD v45[3];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "pl_graphCache");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "labelWithCode:inContext:", 1000, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v10 = (void *)MEMORY[0x1E0CB3880];
  v35 = v5;
  objc_msgSend(v5, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("targetPerson.personUUID"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v12;
  v32 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode.primaryLabel"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v15);

  objc_msgSend(v8, "setResultType:", 2);
  v45[0] = CFSTR("sourceNode");
  v45[1] = CFSTR("targetPerson.personUUID");
  v45[2] = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToFetch:", v16);

  objc_msgSend(v8, "setFetchBatchSize:", 100);
  v41 = 0;
  v34 = v6;
  objc_msgSend(v6, "executeFetchRequest:error:", v8, &v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v41;
  if (!v17)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v18;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetch social group member edges: %@", buf, 0xCu);
    }

  }
  v31 = v18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v17;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("targetPerson.personUUID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("sourceNode"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v29, "addObject:", v27);
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, v28);

        objc_autoreleasePoolPop(v26);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v22);
  }

  return v20;
}

- (id)_assetIDsByContainingSocialGroupIDsFromAssetIDsNeedingContainmentUpdates:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  _QWORD v44[3];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "pl_graphCache");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "labelWithCode:inContext:", 1000, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v31 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode.primaryLabel"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v10;
  v34 = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("targetAsset"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v13);

  objc_msgSend(v8, "setResultType:", 2);
  v44[0] = CFSTR("sourceNode");
  v44[1] = CFSTR("targetAsset");
  v44[2] = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToFetch:", v14);

  objc_msgSend(v8, "setFetchBatchSize:", 100);
  v40 = 0;
  v33 = v6;
  v30 = v8;
  objc_msgSend(v6, "executeFetchRequest:error:", v8, &v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v40;
  if (!v15)
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v16;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetch social group asset edges: %@", buf, 0xCu);
    }

  }
  v29 = v16;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v15;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v22);
        v24 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("targetAsset"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("sourceNode"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v27, "addObject:", v25);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, v26);

        objc_autoreleasePoolPop(v24);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v20);
  }

  return v18;
}

- (id)_assetIDsByNodeIDFromAssetPersonEdgeDictionaries:(id)a3 assetIDsNeedingContainmentUpdates:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PLDelayedSaveActionsProcessor _personUUIDsByNodeIDFromAssetPersonDictionaries:inContext:](self, "_personUUIDsByNodeIDFromAssetPersonDictionaries:inContext:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[PLDelayedSaveActionsProcessor _assetIDsByContainingSocialGroupIDsFromAssetIDsNeedingContainmentUpdates:inContext:](self, "_assetIDsByContainingSocialGroupIDsFromAssetIDsNeedingContainmentUpdates:inContext:", v9, v10);
  else
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __126__PLDelayedSaveActionsProcessor__assetIDsByNodeIDFromAssetPersonEdgeDictionaries_assetIDsNeedingContainmentUpdates_inContext___block_invoke;
  v23[3] = &unk_1E366C0B0;
  v15 = v13;
  v24 = v15;
  v25 = v8;
  v16 = v8;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v23);
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __126__PLDelayedSaveActionsProcessor__assetIDsByNodeIDFromAssetPersonEdgeDictionaries_assetIDsNeedingContainmentUpdates_inContext___block_invoke_2;
  v21[3] = &unk_1E366C0D8;
  v17 = v15;
  v22 = v17;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v21);
  v18 = v22;
  v19 = v17;

  return v19;
}

- (void)_processAssetIDsByPersonUUIDNeedingContainmentUpdates:(id)a3 assetIDsNeedingContainmentUpdates:(id)a4 pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates:(BOOL)a5 library:(id)a6 transaction:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BOOL v24;
  _QWORD v25[4];
  id v26;
  PLDelayedSaveActionsProcessor *v27;
  id v28;
  id v29;
  id v30;

  v19 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (PLIsAssetsd() && (objc_msgSend(v19, "count") || objc_msgSend(v12, "count")))
  {
    v15 = (void *)MEMORY[0x19AEC1554]();
    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke;
    v25[3] = &unk_1E3670C40;
    v26 = v13;
    v27 = self;
    v28 = v19;
    v29 = v12;
    v30 = v16;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke_2;
    v20[3] = &unk_1E36752E0;
    v21 = v30;
    v22 = v26;
    v23 = v14;
    v24 = a5;
    v18 = v30;
    objc_msgSend(v22, "performTransactionAndWait:completionHandler:", v25, v20);

    objc_autoreleasePoolPop(v15);
  }

}

- (void)_processAssetsNeedingAssetPersonEdgeUpdates:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  if (PLIsAssetsd() && objc_msgSend(v10, "count"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__PLDelayedSaveActionsProcessor__processAssetsNeedingAssetPersonEdgeUpdates_library_transaction___block_invoke;
    v13[3] = &unk_1E3677C18;
    v14 = v10;
    v15 = v7;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __97__PLDelayedSaveActionsProcessor__processAssetsNeedingAssetPersonEdgeUpdates_library_transaction___block_invoke_120;
    v11[3] = &unk_1E3677AA0;
    v12 = v8;
    objc_msgSend(v15, "performBlockAndWait:completionHandler:", v13, v11);

  }
}

- (void)_processMembersOfSocialGroupsNeedingDeduplication:(id)a3 pendingSocialGroupIDsNeedingDeduplication:(BOOL)a4 library:(id)a5 transaction:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v13 = a3;
  v10 = a5;
  v11 = a6;
  if (PLIsAssetsd() && objc_msgSend(v13, "count"))
  {
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __145__PLDelayedSaveActionsProcessor__processMembersOfSocialGroupsNeedingDeduplication_pendingSocialGroupIDsNeedingDeduplication_library_transaction___block_invoke;
    v17[3] = &unk_1E3677530;
    v17[4] = self;
    v18 = v13;
    v19 = v10;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __145__PLDelayedSaveActionsProcessor__processMembersOfSocialGroupsNeedingDeduplication_pendingSocialGroupIDsNeedingDeduplication_library_transaction___block_invoke_121;
    v14[3] = &unk_1E36762F8;
    v15 = v11;
    v16 = a4;
    objc_msgSend(v19, "performBlockAndWait:completionHandler:", v17, v14);

  }
}

- (void)_processSocialGroupsNeedingDeduplication:(id)a3 library:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  if (PLIsAssetsd() && objc_msgSend(v10, "count"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__PLDelayedSaveActionsProcessor__processSocialGroupsNeedingDeduplication_library_transaction___block_invoke;
    v13[3] = &unk_1E3677C18;
    v14 = v10;
    v15 = v7;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __94__PLDelayedSaveActionsProcessor__processSocialGroupsNeedingDeduplication_library_transaction___block_invoke_122;
    v11[3] = &unk_1E3677AA0;
    v12 = v8;
    objc_msgSend(v15, "performTransactionAndWait:completionHandler:", v13, v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDuetCallback, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

void __94__PLDelayedSaveActionsProcessor__processSocialGroupsNeedingDeduplication_library_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[PLGraphNode fetchRequest](PLGraphNode, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v20 = v2;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v26;

  if (!v5)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error getting social group source nodes from ids: %@", buf, 0xCu);
    }

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x19AEC1554]();
        if ((objc_msgSend(v13, "isDeleted") & 1) == 0)
        {
          v15 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v13);
          v21 = v6;
          v16 = +[PLSocialGroup deleteDuplicateGroupsAfterInsertionOfGroup:error:](PLSocialGroup, "deleteDuplicateGroupsAfterInsertionOfGroup:error:", v15, &v21);
          v17 = v21;

          if (!v16)
          {
            PLBackendGetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v15, "uuid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v28 = v19;
              v29 = 2112;
              v30 = v17;
              _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error deleting duplicate groups after insertion of group with UUID: %@, error: %@", buf, 0x16u);

            }
          }

          v6 = v17;
        }
        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v10);
  }

}

void *__94__PLDelayedSaveActionsProcessor__processSocialGroupsNeedingDeduplication_library_transaction___block_invoke_122(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
  {
    objc_msgSend(result, "stillAlive");
    return (void *)objc_msgSend(*(id *)(a1 + 32), "completeTransactionScope:", CFSTR("PLTransactionScopeSocialGroupDeduplication"));
  }
  return result;
}

void __145__PLDelayedSaveActionsProcessor__processMembersOfSocialGroupsNeedingDeduplication_pendingSocialGroupIDsNeedingDeduplication_library_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = 0;
  objc_msgSend(v2, "_socialGroupNodeIDsContainingMember:library:error:", v3, v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (!v5)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetching social group node IDs containing member for deduplication: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_processSocialGroupsNeedingDeduplication:library:transaction:", v5, *(_QWORD *)(a1 + 48), 0);

}

uint64_t __145__PLDelayedSaveActionsProcessor__processMembersOfSocialGroupsNeedingDeduplication_pendingSocialGroupIDsNeedingDeduplication_library_transaction___block_invoke_121(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "stillAlive");
  if (!*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "completeTransactionScope:", CFSTR("PLTransactionScopeSocialGroupDeduplication"));
  return result;
}

void __97__PLDelayedSaveActionsProcessor__processAssetsNeedingAssetPersonEdgeUpdates_library_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = +[PLSocialGroupAssetContainment updateAndSaveAssetPersonEdgesForAssetsWithIDs:inContext:error:](PLSocialGroupAssetContainment, "updateAndSaveAssetPersonEdgesForAssetsWithIDs:inContext:error:", v2, v3, &v7);
  v5 = v7;

  if (!v4)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error updating asset-person edges: %@", buf, 0xCu);
    }

  }
}

uint64_t __97__PLDelayedSaveActionsProcessor__processAssetsNeedingAssetPersonEdgeUpdates_library_transaction___block_invoke_120(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stillAlive");
  return objc_msgSend(*(id *)(a1 + 32), "completeTransactionScope:", CFSTR("PLTransactionScopeSocialGroupAssetPersonEdges"));
}

void __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_assetIDsByPersonUUIDWithAllPersonsFromAssetsNeedingContainmentUpdates:assetIDsNeedingContainmentUpdates:inContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_assetIDsByNodeIDFromAssetPersonEdgeDictionaries:assetIDsNeedingContainmentUpdates:inContext:", v3, *(_QWORD *)(a1 + 56), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphNode fetchRequest](PLGraphNode, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("self in %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  v16 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (!v9)
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetching nodes with IDs: %@", buf, 0xCu);
    }

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke_117;
  v13[3] = &unk_1E366C100;
  v13[4] = *(_QWORD *)(a1 + 40);
  v14 = v4;
  v15 = *(id *)(a1 + 64);
  v12 = v4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

}

uint64_t __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  +[PLSocialGroup updateKeyAssetOfSocialGroupsWithUUIDs:inLibrary:](PLSocialGroup, "updateKeyAssetOfSocialGroupsWithUUIDs:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 48), "stillAlive");
  if (!*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 48), "completeTransactionScope:", CFSTR("PLTransactionScopeSocialGroupAssetContainment"));
  return result;
}

void __197__PLDelayedSaveActionsProcessor__processAssetIDsByPersonUUIDNeedingContainmentUpdates_assetIDsNeedingContainmentUpdates_pendingMemberIDsOfSocialGroupsNeedingContainmentUpdates_library_transaction___block_invoke_117(_QWORD *a1, void *a2)
{
  char v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = objc_msgSend(v12, "isDeleted");
  v4 = v12;
  if ((v3 & 1) == 0)
  {
    v5 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v12);
    v6 = (void *)a1[4];
    v7 = (void *)a1[5];
    objc_msgSend(v12, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_runAssetContainmentForSocialGroup:assetIDsToUpdate:", v5, v9);

    if (objc_msgSend(v5, "keyAssetIsNeeded"))
    {
      v10 = (void *)a1[6];
      objc_msgSend(v5, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    v4 = v12;
  }

}

void __126__PLDelayedSaveActionsProcessor__assetIDsByNodeIDFromAssetPersonEdgeDictionaries_assetIDsNeedingContainmentUpdates_inContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x19AEC1554](v9);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13, (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unionSet:", v15);

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v10 = v9;
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);
}

void __126__PLDelayedSaveActionsProcessor__assetIDsByNodeIDFromAssetPersonEdgeDictionaries_assetIDsNeedingContainmentUpdates_inContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "unionSet:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __125__PLDelayedSaveActionsProcessor__processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs_library_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = 0;
  objc_msgSend(v2, "_socialGroupNodeIDsContainingMember:library:error:", v3, v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (!v5)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error fetching social group node IDs containing member for containment: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_runContainmentOnAllGroupsNeedingContainmentUpdates:inLibrary:", v5, *(_QWORD *)(a1 + 48));

}

void *__125__PLDelayedSaveActionsProcessor__processAssetContainmentUpdatesForSocialGroupsContainingMemberPersonIDs_library_transaction___block_invoke_99(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
  {
    objc_msgSend(result, "stillAlive");
    return (void *)objc_msgSend(*(id *)(a1 + 32), "completeTransactionScope:", CFSTR("PLTransactionScopeSocialGroupAssetContainment"));
  }
  return result;
}

void __88__PLDelayedSaveActionsProcessor__processDelayedMemoriesAssetUpdate_library_transaction___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "calculateSyndicatedContentState");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __78__PLDelayedSaveActionsProcessor__deleteUUIDs_fromCoreDuetStreams_transaction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to delete info from knowledge store: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "stillAlive");

}

void __107__PLDelayedSaveActionsProcessor__processDelayedAssetsForWallpaperFavoriteAlbumRemoval_library_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d && %K == %d && %K == %d && ANY %K IN %@"), CFSTR("featuredState"), 1, CFSTR("type"), 6, CFSTR("subtype"), 682, CFSTR("keyAssets"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSuggestion suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:](PLSuggestion, "suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v3, 0, 0, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v16 = v3;
    v17 = a1;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v2, "deleteObject:", v11);
          PLBackendGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "uuid");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v23 = v13;
            _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "Delayed save actions processor: Deleting suggestion due to favorite album no long being tied to key asset for suggestion %{public}@", buf, 0xCu);

          }
          objc_msgSend(v11, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(v17 + 48), "_processDelayedWallpaperSuggestionReload:library:transaction:", v5, *(_QWORD *)(v17 + 32), *(_QWORD *)(v17 + 56));
    v4 = v15;
    v3 = v16;
  }

}

void __103__PLDelayedSaveActionsProcessor__processDelayedAssetsForWallpaperUserAlbumRemoval_library_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = a1;
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(*(id *)(v22 + 40), "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0CB3880];
        v39 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %d && %K == %d && %K == %d && ANY %K IN %@ && ANY %K IN %@"), CFSTR("featuredState"), 1, CFSTR("type"), 6, CFSTR("subtype"), 681, CFSTR("suggestionContext"), v6, CFSTR("keyAssets"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLSuggestion suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:](PLSuggestion, "suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v9, 0, 0, v2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v25 = v9;
          v26 = v6;
          v27 = i;
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v24 = v10;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v29 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                objc_msgSend(v2, "deleteObject:", v16);
                PLBackendGetLog();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v16, "uuid");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v37 = v18;
                  _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "Delayed save actions processor: Deleting suggestion due to user album no long being tied to key asset for wallpaper suggestion %{public}@", buf, 0xCu);

                }
                objc_msgSend(v16, "uuid");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v19);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
            }
            while (v13);
          }

          v6 = v26;
          i = v27;
          v10 = v24;
          v9 = v25;
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v23);
  }

  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(v22 + 48), "_processDelayedWallpaperSuggestionReload:library:transaction:", v3, *(_QWORD *)(v22 + 32), *(_QWORD *)(v22 + 56));

}

void __104__PLDelayedSaveActionsProcessor__processDelayedAssetsForWidgetFavoriteAlbumRemoval_library_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d && %K == %d && %K == %d && ANY %K IN %@"), CFSTR("featuredState"), 1, CFSTR("type"), 7, CFSTR("subtype"), 702, CFSTR("keyAssets"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSuggestion suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:](PLSuggestion, "suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v3, 0, 0, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v13 = v4;
    v14 = v3;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v2, "deleteObject:", v10);
          PLBackendGetLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "uuid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v20 = v12;
            _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Delayed save actions processor: Deleting suggestion due to user album tied to suggestion being deleted %{public}@", buf, 0xCu);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 48), "_processDelayedAlbumWidgetTimelineReload:library:transaction:", 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v4 = v13;
    v3 = v14;
  }

}

void __100__PLDelayedSaveActionsProcessor__processDelayedAssetsForWidgetUserAlbumRemoval_library_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v3 = 0;
    v22 = *(_QWORD *)v32;
    obj = v2;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0CB3880];
        v38 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %d && %K == %d && %K == %d && ANY %K IN %@ && ANY %K IN %@"), CFSTR("featuredState"), 1, CFSTR("type"), 7, CFSTR("subtype"), 701, CFSTR("suggestionContext"), v6, CFSTR("keyAssets"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLSuggestion suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:](PLSuggestion, "suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v9, 0, 0, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          v25 = v9;
          v26 = v6;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v24 = v11;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v28 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "deleteObject:", v17);

                PLBackendGetLog();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v17, "uuid");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v36 = v20;
                  _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "Delayed save actions processor: Deleting suggestion due to user album tied to widget suggestion being deleted %{public}@", buf, 0xCu);

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
            }
            while (v14);
          }

          v3 = 1;
          v9 = v25;
          v6 = v26;
          v11 = v24;
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v23);

    if ((v3 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "_processDelayedAlbumWidgetTimelineReload:library:transaction:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {

  }
}

void __156__PLDelayedSaveActionsProcessor__processDelayedFeaturedContentUpdateAndWidgetTimelineReload_withPersonUUIDs_shouldReloadWidgetTimeline_library_transaction___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 && (a2 & 1) == 0)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Delayed save actions processor: error updating featured content with photo analysis: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if (*(_BYTE *)(a1 + 56))
    v7 = 1;
  else
    v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_processDelayedForYouWidgetTimelineReload:library:transaction:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "stillAlive");

}

uint64_t __90__PLDelayedSaveActionsProcessor__processDelayedAlbumKeyAssetsUpdates_library_transaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateKeyAssetsInAlbums:", *(_QWORD *)(a1 + 40));
}

uint64_t __90__PLDelayedSaveActionsProcessor__processDelayedAlbumKeyAssetsUpdates_library_transaction___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransactionScope:", CFSTR("PLTransactionScopeAlbumCounts"));
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __79__PLDelayedSaveActionsProcessor__processDelayedSearchIndexUpdates_transaction___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransactionScope:", CFSTR("PLTransactionScopeSearchIndex"));
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __77__PLDelayedSaveActionsProcessor__processDelayedMomentChangesWithTransaction___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransactionScope:", CFSTR("PLTransactionScopeMomentGeneration"));
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __163__PLDelayedSaveActionsProcessor__processDelayedCloudFeedAlbumUpdates_assetInserts_assetUpdates_commentInserts_invitationRecordUpdates_deletionEntries_transaction___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransactionScope:", CFSTR("PLTransactionScopeCloudFeed"));
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

@end

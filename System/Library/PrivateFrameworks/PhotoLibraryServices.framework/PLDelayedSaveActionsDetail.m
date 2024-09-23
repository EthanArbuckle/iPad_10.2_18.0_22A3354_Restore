@implementation PLDelayedSaveActionsDetail

- (PLDelayedSaveActionsDetail)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLDelayedSaveActionsDetail;
  return -[PLDelayedSaveActionsDetail init](&v3, sel_init);
}

- (BOOL)shouldHandleMoments
{
  int v3;

  v3 = PLPlatformMomentsSupported();
  if (v3)
    LOBYTE(v3) = -[NSArray count](self->_momentInsertsAndUpdates, "count")
              || -[NSDictionary count](self->_momentDeletes, "count")
              || -[NSArray count](self->_updatedAssetIDsForHighlights, "count")
              || -[NSArray count](self->_updatedMomentIDsForHighlights, "count") != 0;
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *cloudFeedAlbumUpdates;
  id v5;
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
  id v30;

  cloudFeedAlbumUpdates = self->_cloudFeedAlbumUpdates;
  v5 = a3;
  -[NSArray _pl_map:](cloudFeedAlbumUpdates, "_pl_map:", &__block_literal_global_101692);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("key_cloudFeedAlbumUpdates"));

  -[NSArray _pl_map:](self->_cloudFeedAssetInserts, "_pl_map:", &__block_literal_global_101692);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("key_cloudFeedAssetInserts"));

  -[NSArray _pl_map:](self->_cloudFeedAssetUpdates, "_pl_map:", &__block_literal_global_101692);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("key_cloudFeedAssetUpdates"));

  -[NSArray _pl_map:](self->_cloudFeedCommentInserts, "_pl_map:", &__block_literal_global_101692);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("key_cloudFeedCommentInserts"));

  -[NSArray _pl_map:](self->_cloudFeedInvitationRecordUpdates, "_pl_map:", &__block_literal_global_101692);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("key_cloudFeedInvitationRecordUpdates"));

  -[NSArray _pl_map:](self->_cloudFeedDeletionEntries, "_pl_map:", &__block_literal_global_101692);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("key_cloudFeedDeletionEntries"));

  -[NSArray _pl_map:](self->_momentInsertsAndUpdates, "_pl_map:", &__block_literal_global_101692);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("key_momentInsertsAndUpdates"));

  -[PLDelayedSaveActionsDetail _encodableMomentDeletes](self, "_encodableMomentDeletes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("key_momentDeletes"));

  -[NSArray _pl_map:](self->_updatedAssetIDsForHighlights, "_pl_map:", &__block_literal_global_101692);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("key_updatedAssetIDsForHighlights"));

  -[NSArray _pl_map:](self->_updatedMomentIDsForHighlights, "_pl_map:", &__block_literal_global_101692);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("key_updatedMomentIDsForHighlights"));

  -[PLDelayedSaveActionsDetail _encodableSharedAssetContainerIncrementalChanges](self, "_encodableSharedAssetContainerIncrementalChanges");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("key_sharedAssetContainerIncrementalChangesByAssetID"));

  -[NSArray _pl_map:](self->_assetsForFilesystemPersistency, "_pl_map:", &__block_literal_global_101692);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("key_assetsForFilesystemPersistency"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_searchIndexUpdates, CFSTR("key_searchIndexUpdates"));
  -[NSSet _pl_map:](self->_albumCountsAndDateRangeUpdates, "_pl_map:", &__block_literal_global_101692);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("key_albumCountsAndDateRangeUpdates"));

  -[NSSet _pl_map:](self->_albumKeyAssetsUpdates, "_pl_map:", &__block_literal_global_101692);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("key_albumKeyAssetsUpdates"));

  -[NSSet _pl_map:](self->_importSessionCountsAndDateRangeUpdates, "_pl_map:", &__block_literal_global_101692);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("key_importSessionCountsAndDateRangeUpdates"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_assetsForDuetDelete, CFSTR("key_assetsForDuetDelete"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_memoriesForDuetDelete, CFSTR("key_memoriesForDuetDelete"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_widgetTimelineReloadTypesNeeded, CFSTR("key_widgetTimelineReloadTypesNeeded"));
  -[PLDelayedSaveActionsDetail _encodableAssetsForWidgetUserAlbumRemoval](self, "_encodableAssetsForWidgetUserAlbumRemoval");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v21, CFSTR("key_assetsForWidgetUserAlbumRemoval"));

  -[NSSet _pl_map:](self->_assetsForWidgetFavoriteAlbumRemoval, "_pl_map:", &__block_literal_global_101692);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v22, CFSTR("key_assetsForWidgetFavoriteAlbumRemoval"));

  -[PLDelayedSaveActionsDetail _encodableAssetsForWallpaperUserAlbumRemoval](self, "_encodableAssetsForWallpaperUserAlbumRemoval");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v23, CFSTR("key_assetsForWallpaperUserAlbumRemoval"));

  -[NSSet _pl_map:](self->_assetsForWallpaperFavoriteAlbumRemoval, "_pl_map:", &__block_literal_global_101692);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v24, CFSTR("key_assetsForWallpaperFavoriteAlbumRemoval"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_wallpaperSuggestionReloadUUIDs, CFSTR("key_wallpaperSuggestionReloadUUIDs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldUpdateFeaturedContent, CFSTR("key_shouldUpdateFeaturedContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personsToUpdateForFeaturedContent, CFSTR("key_personsToUpdateForFeaturedContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_memoriesForAssetUpdate, CFSTR("key_memoriesForAssetUpdate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_libraryScopeParticipantsForUpdate, CFSTR("key_libraryScopeParticipantsForUpdate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_libraryScopeRulesUpdated, CFSTR("key_libraryScopeRulesUpdated"));
  -[NSSet _pl_map:](self->_memberIDsOfSocialGroupsNeedingContainmentUpdates, "_pl_map:", &__block_literal_global_101692);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v25, CFSTR("key_memberIDsOfSocialGroupsNeedingContainmentUpdates"));

  -[NSSet _pl_map:](self->_assetIDsNeedingContainmentUpdates, "_pl_map:", &__block_literal_global_101692);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v26, CFSTR("key_assetIDsNeedingContainmentUpdates"));

  -[PLDelayedSaveActionsDetail _encodableAssetIDsByPersonUUIDNeedingContainmentUpdates](self, "_encodableAssetIDsByPersonUUIDNeedingContainmentUpdates");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v27, CFSTR("key_assetIDsByPersonUUIDNeedingContainmentUpdates"));

  -[NSSet _pl_map:](self->_socialGroupNodeIDsNeedingDeduplication, "_pl_map:", &__block_literal_global_101692);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v28, CFSTR("key_socialGroupNodeIDsNeedingDeduplication"));

  -[NSSet _pl_map:](self->_memberIDsOfSocialGroupsNeedingDeduplication, "_pl_map:", &__block_literal_global_101692);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v29, CFSTR("key_memberIDsOfSocialGroupsNeedingDeduplication"));

  -[NSSet _pl_map:](self->_assetIDsNeedingAssetPersonEdgeUpdates, "_pl_map:", &__block_literal_global_101692);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v30, CFSTR("key_assetIDsNeedingAssetPersonEdgeUpdates"));

}

- (id)_encodableMomentDeletes
{
  void *v3;
  NSDictionary *momentDeletes;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  momentDeletes = self->_momentDeletes;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PLDelayedSaveActionsDetail__encodableMomentDeletes__block_invoke;
  v7[3] = &unk_1E3677E40;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](momentDeletes, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)_encodableAssetsForWidgetUserAlbumRemoval
{
  void *v3;
  NSDictionary *assetsForWidgetUserAlbumRemoval;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  assetsForWidgetUserAlbumRemoval = self->_assetsForWidgetUserAlbumRemoval;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PLDelayedSaveActionsDetail__encodableAssetsForWidgetUserAlbumRemoval__block_invoke;
  v7[3] = &unk_1E3677E68;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetsForWidgetUserAlbumRemoval, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)_encodableAssetsForWallpaperUserAlbumRemoval
{
  void *v3;
  NSDictionary *assetsForWallpaperUserAlbumRemoval;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  assetsForWallpaperUserAlbumRemoval = self->_assetsForWallpaperUserAlbumRemoval;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PLDelayedSaveActionsDetail__encodableAssetsForWallpaperUserAlbumRemoval__block_invoke;
  v7[3] = &unk_1E3677E68;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetsForWallpaperUserAlbumRemoval, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)_encodableSharedAssetContainerIncrementalChanges
{
  void *v3;
  NSDictionary *sharedAssetContainerIncrementalChangesByAssetID;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sharedAssetContainerIncrementalChangesByAssetID = self->_sharedAssetContainerIncrementalChangesByAssetID;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PLDelayedSaveActionsDetail__encodableSharedAssetContainerIncrementalChanges__block_invoke;
  v7[3] = &unk_1E3677E90;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](sharedAssetContainerIncrementalChangesByAssetID, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)_encodableAssetIDsByPersonUUIDNeedingContainmentUpdates
{
  void *v3;
  NSDictionary *assetIDsByPersonUUIDNeedingContainmentUpdates;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  assetIDsByPersonUUIDNeedingContainmentUpdates = self->_assetIDsByPersonUUIDNeedingContainmentUpdates;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PLDelayedSaveActionsDetail__encodableAssetIDsByPersonUUIDNeedingContainmentUpdates__block_invoke;
  v7[3] = &unk_1E3677EE0;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetIDsByPersonUUIDNeedingContainmentUpdates, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (PLDelayedSaveActionsDetail)initWithCoder:(id)a3
{
  id v5;
  PLDelayedSaveActionsDetail *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  NSArray *cloudFeedAlbumUpdates;
  void *v13;
  uint64_t v14;
  NSArray *cloudFeedAssetInserts;
  void *v16;
  uint64_t v17;
  NSArray *cloudFeedAssetUpdates;
  void *v19;
  uint64_t v20;
  NSArray *cloudFeedCommentInserts;
  void *v22;
  uint64_t v23;
  NSArray *cloudFeedInvitationRecordUpdates;
  void *v25;
  uint64_t v26;
  NSArray *cloudFeedDeletionEntries;
  void *v28;
  uint64_t v29;
  NSArray *momentInsertsAndUpdates;
  void *v31;
  uint64_t j;
  uint64_t v33;
  uint64_t v34;
  NSDictionary *momentDeletes;
  void *v36;
  uint64_t v37;
  NSArray *updatedAssetIDsForHighlights;
  void *v39;
  uint64_t v40;
  NSArray *updatedMomentIDsForHighlights;
  void *v42;
  uint64_t k;
  uint64_t v44;
  uint64_t v45;
  NSDictionary *sharedAssetContainerIncrementalChangesByAssetID;
  void *v47;
  uint64_t v48;
  NSArray *assetsForFilesystemPersistency;
  void *v50;
  uint64_t m;
  uint64_t v52;
  NSDictionary *searchIndexUpdates;
  void *v54;
  uint64_t n;
  void *v56;
  uint64_t v57;
  NSSet *albumCountsAndDateRangeUpdates;
  void *v59;
  uint64_t ii;
  void *v61;
  uint64_t v62;
  NSSet *albumKeyAssetsUpdates;
  void *v64;
  uint64_t jj;
  void *v66;
  uint64_t v67;
  NSSet *importSessionCountsAndDateRangeUpdates;
  void *v69;
  uint64_t kk;
  uint64_t v71;
  NSSet *assetsForDuetDelete;
  void *v73;
  uint64_t mm;
  uint64_t v75;
  NSSet *memoriesForDuetDelete;
  void *v77;
  uint64_t nn;
  uint64_t v79;
  NSSet *widgetTimelineReloadTypesNeeded;
  void *v81;
  uint64_t i1;
  uint64_t v83;
  uint64_t v84;
  NSDictionary *assetsForWidgetUserAlbumRemoval;
  void *v86;
  uint64_t i2;
  void *v88;
  uint64_t v89;
  NSSet *assetsForWidgetFavoriteAlbumRemoval;
  void *v91;
  uint64_t i3;
  uint64_t v93;
  uint64_t v94;
  NSDictionary *assetsForWallpaperUserAlbumRemoval;
  void *v96;
  uint64_t i4;
  void *v98;
  uint64_t v99;
  NSSet *assetsForWallpaperFavoriteAlbumRemoval;
  void *v101;
  uint64_t i5;
  uint64_t v103;
  NSSet *wallpaperSuggestionReloadUUIDs;
  void *v105;
  uint64_t i6;
  uint64_t v107;
  NSSet *personsToUpdateForFeaturedContent;
  void *v109;
  uint64_t i7;
  uint64_t v111;
  NSSet *memoriesForAssetUpdate;
  void *v113;
  uint64_t i8;
  uint64_t v115;
  NSSet *libraryScopeParticipantsForUpdate;
  void *v117;
  uint64_t i9;
  void *v119;
  uint64_t v120;
  NSSet *assetIDsNeedingContainmentUpdates;
  void *v122;
  uint64_t i10;
  void *v124;
  uint64_t v125;
  NSSet *memberIDsOfSocialGroupsNeedingContainmentUpdates;
  void *v127;
  uint64_t i11;
  void *v129;
  uint64_t v130;
  NSDictionary *assetIDsByPersonUUIDNeedingContainmentUpdates;
  void *v132;
  uint64_t i12;
  void *v134;
  uint64_t v135;
  NSSet *socialGroupNodeIDsNeedingDeduplication;
  void *v137;
  uint64_t i13;
  void *v139;
  uint64_t v140;
  NSSet *memberIDsOfSocialGroupsNeedingDeduplication;
  void *v142;
  uint64_t i14;
  void *v144;
  uint64_t v145;
  NSSet *assetIDsNeedingAssetPersonEdgeUpdates;
  PLDelayedSaveActionsDetail *v147;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  _QWORD v163[4];
  id v164;
  objc_super v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v165.receiver = self;
  v165.super_class = (Class)PLDelayedSaveActionsDetail;
  v6 = -[PLDelayedSaveActionsDetail init](&v165, sel_init);
  if (v6)
  {
    +[PLXPCCoder userInfoForCoder:](PLXPCCoder, "userInfoForCoder:", v5);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "persistentStoreCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PLDelayedSaveActionsDetail.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinator != nil"));

    }
    v163[0] = MEMORY[0x1E0C809B0];
    v163[1] = 3221225472;
    v163[2] = __44__PLDelayedSaveActionsDetail_initWithCoder___block_invoke;
    v163[3] = &unk_1E3677F08;
    v160 = v7;
    v164 = v160;
    v8 = (void *)MEMORY[0x19AEC174C](v163);
    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 8; i != -8; i -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_cloudFeedAlbumUpdates"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_pl_map:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    cloudFeedAlbumUpdates = v6->_cloudFeedAlbumUpdates;
    v6->_cloudFeedAlbumUpdates = (NSArray *)v11;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_cloudFeedAssetInserts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_pl_map:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    cloudFeedAssetInserts = v6->_cloudFeedAssetInserts;
    v6->_cloudFeedAssetInserts = (NSArray *)v14;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_cloudFeedAssetUpdates"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_pl_map:", v8);
    v17 = objc_claimAutoreleasedReturnValue();
    cloudFeedAssetUpdates = v6->_cloudFeedAssetUpdates;
    v6->_cloudFeedAssetUpdates = (NSArray *)v17;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_cloudFeedCommentInserts"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_pl_map:", v8);
    v20 = objc_claimAutoreleasedReturnValue();
    cloudFeedCommentInserts = v6->_cloudFeedCommentInserts;
    v6->_cloudFeedCommentInserts = (NSArray *)v20;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_cloudFeedInvitationRecordUpdates"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_pl_map:", v8);
    v23 = objc_claimAutoreleasedReturnValue();
    cloudFeedInvitationRecordUpdates = v6->_cloudFeedInvitationRecordUpdates;
    v6->_cloudFeedInvitationRecordUpdates = (NSArray *)v23;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_cloudFeedDeletionEntries"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_pl_map:", v8);
    v26 = objc_claimAutoreleasedReturnValue();
    cloudFeedDeletionEntries = v6->_cloudFeedDeletionEntries;
    v6->_cloudFeedDeletionEntries = (NSArray *)v26;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_momentInsertsAndUpdates"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_pl_map:", v8);
    v29 = objc_claimAutoreleasedReturnValue();
    momentInsertsAndUpdates = v6->_momentInsertsAndUpdates;
    v6->_momentInsertsAndUpdates = (NSArray *)v29;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v168 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v169 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v170 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 32; j != -8; j -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v31, CFSTR("key_momentDeletes"));
    v33 = objc_claimAutoreleasedReturnValue();

    v159 = (void *)v33;
    objc_msgSend((id)objc_opt_class(), "_decodeMomentDeletes:urlToObjectID:", v33, v8);
    v34 = objc_claimAutoreleasedReturnValue();
    momentDeletes = v6->_momentDeletes;
    v6->_momentDeletes = (NSDictionary *)v34;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_updatedAssetIDsForHighlights"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_pl_map:", v8);
    v37 = objc_claimAutoreleasedReturnValue();
    updatedAssetIDsForHighlights = v6->_updatedAssetIDsForHighlights;
    v6->_updatedAssetIDsForHighlights = (NSArray *)v37;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_updatedMomentIDsForHighlights"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_pl_map:", v8);
    v40 = objc_claimAutoreleasedReturnValue();
    updatedMomentIDsForHighlights = v6->_updatedMomentIDsForHighlights;
    v6->_updatedMomentIDsForHighlights = (NSArray *)v40;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v168 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v169 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    for (k = 24; k != -8; k -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v42, CFSTR("key_sharedAssetContainerIncrementalChangesByAssetID"));
    v44 = objc_claimAutoreleasedReturnValue();

    v158 = (void *)v44;
    objc_msgSend((id)objc_opt_class(), "_decodeSharedAssetContainerIncrementalChanges:urlToObjectID:", v44, v8);
    v45 = objc_claimAutoreleasedReturnValue();
    sharedAssetContainerIncrementalChangesByAssetID = v6->_sharedAssetContainerIncrementalChangesByAssetID;
    v6->_sharedAssetContainerIncrementalChangesByAssetID = (NSDictionary *)v45;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v162, CFSTR("key_assetsForFilesystemPersistency"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "_pl_map:", v8);
    v48 = objc_claimAutoreleasedReturnValue();
    assetsForFilesystemPersistency = v6->_assetsForFilesystemPersistency;
    v6->_assetsForFilesystemPersistency = (NSArray *)v48;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v168 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    for (m = 16; m != -8; m -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v50, CFSTR("key_searchIndexUpdates"));
    v52 = objc_claimAutoreleasedReturnValue();
    searchIndexUpdates = v6->_searchIndexUpdates;
    v6->_searchIndexUpdates = (NSDictionary *)v52;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    for (n = 8; n != -8; n -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v54, CFSTR("key_albumCountsAndDateRangeUpdates"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v157 = v56;
    objc_msgSend(v56, "_pl_map:", v8);
    v57 = objc_claimAutoreleasedReturnValue();
    albumCountsAndDateRangeUpdates = v6->_albumCountsAndDateRangeUpdates;
    v6->_albumCountsAndDateRangeUpdates = (NSSet *)v57;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    for (ii = 8; ii != -8; ii -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v59, CFSTR("key_albumKeyAssetsUpdates"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v156 = v61;
    objc_msgSend(v61, "_pl_map:", v8);
    v62 = objc_claimAutoreleasedReturnValue();
    albumKeyAssetsUpdates = v6->_albumKeyAssetsUpdates;
    v6->_albumKeyAssetsUpdates = (NSSet *)v62;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    for (jj = 8; jj != -8; jj -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v64, CFSTR("key_importSessionCountsAndDateRangeUpdates"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v155 = v66;
    objc_msgSend(v66, "_pl_map:", v8);
    v67 = objc_claimAutoreleasedReturnValue();
    importSessionCountsAndDateRangeUpdates = v6->_importSessionCountsAndDateRangeUpdates;
    v6->_importSessionCountsAndDateRangeUpdates = (NSSet *)v67;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    for (kk = 8; kk != -8; kk -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v69, CFSTR("key_assetsForDuetDelete"));
    v71 = objc_claimAutoreleasedReturnValue();
    assetsForDuetDelete = v6->_assetsForDuetDelete;
    v6->_assetsForDuetDelete = (NSSet *)v71;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    for (mm = 8; mm != -8; mm -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v73, CFSTR("key_memoriesForDuetDelete"));
    v75 = objc_claimAutoreleasedReturnValue();
    memoriesForDuetDelete = v6->_memoriesForDuetDelete;
    v6->_memoriesForDuetDelete = (NSSet *)v75;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    for (nn = 8; nn != -8; nn -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v77, CFSTR("key_widgetTimelineReloadTypesNeeded"));
    v79 = objc_claimAutoreleasedReturnValue();
    widgetTimelineReloadTypesNeeded = v6->_widgetTimelineReloadTypesNeeded;
    v6->_widgetTimelineReloadTypesNeeded = (NSSet *)v79;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v168 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v169 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 4);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    for (i1 = 24; i1 != -8; i1 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v81, CFSTR("key_assetsForWidgetUserAlbumRemoval"));
    v83 = objc_claimAutoreleasedReturnValue();

    v154 = (void *)v83;
    objc_msgSend((id)objc_opt_class(), "_decodeAssetsForWidgetUserAlbumRemoval:urlToObjectID:", v83, v8);
    v84 = objc_claimAutoreleasedReturnValue();
    assetsForWidgetUserAlbumRemoval = v6->_assetsForWidgetUserAlbumRemoval;
    v6->_assetsForWidgetUserAlbumRemoval = (NSDictionary *)v84;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    for (i2 = 8; i2 != -8; i2 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v86, CFSTR("key_assetsForWidgetFavoriteAlbumRemoval"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v153 = v88;
    objc_msgSend(v88, "_pl_map:", v8);
    v89 = objc_claimAutoreleasedReturnValue();
    assetsForWidgetFavoriteAlbumRemoval = v6->_assetsForWidgetFavoriteAlbumRemoval;
    v6->_assetsForWidgetFavoriteAlbumRemoval = (NSSet *)v89;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v168 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v169 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 4);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    for (i3 = 24; i3 != -8; i3 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v91, CFSTR("key_assetsForWallpaperUserAlbumRemoval"));
    v93 = objc_claimAutoreleasedReturnValue();

    v152 = (void *)v93;
    objc_msgSend((id)objc_opt_class(), "_decodeAssetsForWallpaperUserAlbumRemoval:urlToObjectID:", v93, v8);
    v94 = objc_claimAutoreleasedReturnValue();
    assetsForWallpaperUserAlbumRemoval = v6->_assetsForWallpaperUserAlbumRemoval;
    v6->_assetsForWallpaperUserAlbumRemoval = (NSDictionary *)v94;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    for (i4 = 8; i4 != -8; i4 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v96, CFSTR("key_assetsForWallpaperFavoriteAlbumRemoval"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    v151 = v98;
    objc_msgSend(v98, "_pl_map:", v8);
    v99 = objc_claimAutoreleasedReturnValue();
    assetsForWallpaperFavoriteAlbumRemoval = v6->_assetsForWallpaperFavoriteAlbumRemoval;
    v6->_assetsForWallpaperFavoriteAlbumRemoval = (NSSet *)v99;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    for (i5 = 8; i5 != -8; i5 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v101, CFSTR("key_wallpaperSuggestionReloadUUIDs"));
    v103 = objc_claimAutoreleasedReturnValue();
    wallpaperSuggestionReloadUUIDs = v6->_wallpaperSuggestionReloadUUIDs;
    v6->_wallpaperSuggestionReloadUUIDs = (NSSet *)v103;

    v6->_shouldUpdateFeaturedContent = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("key_shouldUpdateFeaturedContent"));
    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    for (i6 = 8; i6 != -8; i6 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v105, CFSTR("key_personsToUpdateForFeaturedContent"));
    v107 = objc_claimAutoreleasedReturnValue();
    personsToUpdateForFeaturedContent = v6->_personsToUpdateForFeaturedContent;
    v6->_personsToUpdateForFeaturedContent = (NSSet *)v107;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    for (i7 = 8; i7 != -8; i7 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v109, CFSTR("key_memoriesForAssetUpdate"));
    v111 = objc_claimAutoreleasedReturnValue();
    memoriesForAssetUpdate = v6->_memoriesForAssetUpdate;
    v6->_memoriesForAssetUpdate = (NSSet *)v111;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    for (i8 = 8; i8 != -8; i8 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v113, CFSTR("key_libraryScopeParticipantsForUpdate"));
    v115 = objc_claimAutoreleasedReturnValue();
    libraryScopeParticipantsForUpdate = v6->_libraryScopeParticipantsForUpdate;
    v6->_libraryScopeParticipantsForUpdate = (NSSet *)v115;

    v6->_libraryScopeRulesUpdated = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("key_libraryScopeRulesUpdated"));
    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    for (i9 = 8; i9 != -8; i9 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v117, CFSTR("key_assetIDsNeedingContainmentUpdates"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    v150 = v119;
    objc_msgSend(v119, "_pl_map:", v8);
    v120 = objc_claimAutoreleasedReturnValue();
    assetIDsNeedingContainmentUpdates = v6->_assetIDsNeedingContainmentUpdates;
    v6->_assetIDsNeedingContainmentUpdates = (NSSet *)v120;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    for (i10 = 8; i10 != -8; i10 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v122, CFSTR("key_memberIDsOfSocialGroupsNeedingContainmentUpdates"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v124, "_pl_map:", v8);
    v125 = objc_claimAutoreleasedReturnValue();
    memberIDsOfSocialGroupsNeedingContainmentUpdates = v6->_memberIDsOfSocialGroupsNeedingContainmentUpdates;
    v6->_memberIDsOfSocialGroupsNeedingContainmentUpdates = (NSSet *)v125;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v168 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v169 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 4);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    for (i11 = 24; i11 != -8; i11 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v127, CFSTR("key_assetIDsByPersonUUIDNeedingContainmentUpdates"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_decodeAssetIDsByPersonUUIDNeedingContainmentUpdates:urlToObjectID:", v129, v8);
    v130 = objc_claimAutoreleasedReturnValue();
    assetIDsByPersonUUIDNeedingContainmentUpdates = v6->_assetIDsByPersonUUIDNeedingContainmentUpdates;
    v6->_assetIDsByPersonUUIDNeedingContainmentUpdates = (NSDictionary *)v130;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    for (i12 = 8; i12 != -8; i12 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v132, CFSTR("key_socialGroupNodeIDsNeedingDeduplication"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v134, "_pl_map:", v8);
    v135 = objc_claimAutoreleasedReturnValue();
    socialGroupNodeIDsNeedingDeduplication = v6->_socialGroupNodeIDsNeedingDeduplication;
    v6->_socialGroupNodeIDsNeedingDeduplication = (NSSet *)v135;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    for (i13 = 8; i13 != -8; i13 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v137, CFSTR("key_memberIDsOfSocialGroupsNeedingDeduplication"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v139, "_pl_map:", v8);
    v140 = objc_claimAutoreleasedReturnValue();
    memberIDsOfSocialGroupsNeedingDeduplication = v6->_memberIDsOfSocialGroupsNeedingDeduplication;
    v6->_memberIDsOfSocialGroupsNeedingDeduplication = (NSSet *)v140;

    objc_opt_class();
    v166 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v166, 2);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    for (i14 = 8; i14 != -8; i14 -= 8)

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v142, CFSTR("key_assetIDsNeedingAssetPersonEdgeUpdates"));
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v144, "_pl_map:", v8);
    v145 = objc_claimAutoreleasedReturnValue();
    assetIDsNeedingAssetPersonEdgeUpdates = v6->_assetIDsNeedingAssetPersonEdgeUpdates;
    v6->_assetIDsNeedingAssetPersonEdgeUpdates = (NSSet *)v145;

    v147 = v6;
  }

  return v6;
}

- (NSArray)cloudFeedAlbumUpdates
{
  return self->_cloudFeedAlbumUpdates;
}

- (void)setCloudFeedAlbumUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)cloudFeedAssetInserts
{
  return self->_cloudFeedAssetInserts;
}

- (void)setCloudFeedAssetInserts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)cloudFeedAssetUpdates
{
  return self->_cloudFeedAssetUpdates;
}

- (void)setCloudFeedAssetUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)cloudFeedCommentInserts
{
  return self->_cloudFeedCommentInserts;
}

- (void)setCloudFeedCommentInserts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)cloudFeedInvitationRecordUpdates
{
  return self->_cloudFeedInvitationRecordUpdates;
}

- (void)setCloudFeedInvitationRecordUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)cloudFeedDeletionEntries
{
  return self->_cloudFeedDeletionEntries;
}

- (void)setCloudFeedDeletionEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)momentInsertsAndUpdates
{
  return self->_momentInsertsAndUpdates;
}

- (void)setMomentInsertsAndUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)momentDeletes
{
  return self->_momentDeletes;
}

- (void)setMomentDeletes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)updatedAssetIDsForHighlights
{
  return self->_updatedAssetIDsForHighlights;
}

- (void)setUpdatedAssetIDsForHighlights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)updatedMomentIDsForHighlights
{
  return self->_updatedMomentIDsForHighlights;
}

- (void)setUpdatedMomentIDsForHighlights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)sharedAssetContainerIncrementalChangesByAssetID
{
  return self->_sharedAssetContainerIncrementalChangesByAssetID;
}

- (void)setSharedAssetContainerIncrementalChangesByAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)assetsForFilesystemPersistency
{
  return self->_assetsForFilesystemPersistency;
}

- (void)setAssetsForFilesystemPersistency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)searchIndexUpdates
{
  return self->_searchIndexUpdates;
}

- (void)setSearchIndexUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSSet)albumCountsAndDateRangeUpdates
{
  return self->_albumCountsAndDateRangeUpdates;
}

- (void)setAlbumCountsAndDateRangeUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSSet)albumKeyAssetsUpdates
{
  return self->_albumKeyAssetsUpdates;
}

- (void)setAlbumKeyAssetsUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSSet)importSessionCountsAndDateRangeUpdates
{
  return self->_importSessionCountsAndDateRangeUpdates;
}

- (void)setImportSessionCountsAndDateRangeUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSSet)assetsForDuetDelete
{
  return self->_assetsForDuetDelete;
}

- (void)setAssetsForDuetDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSSet)memoriesForDuetDelete
{
  return self->_memoriesForDuetDelete;
}

- (void)setMemoriesForDuetDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSSet)widgetTimelineReloadTypesNeeded
{
  return self->_widgetTimelineReloadTypesNeeded;
}

- (void)setWidgetTimelineReloadTypesNeeded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDictionary)assetsForWidgetUserAlbumRemoval
{
  return self->_assetsForWidgetUserAlbumRemoval;
}

- (void)setAssetsForWidgetUserAlbumRemoval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSSet)assetsForWidgetFavoriteAlbumRemoval
{
  return self->_assetsForWidgetFavoriteAlbumRemoval;
}

- (void)setAssetsForWidgetFavoriteAlbumRemoval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDictionary)assetsForWallpaperUserAlbumRemoval
{
  return self->_assetsForWallpaperUserAlbumRemoval;
}

- (void)setAssetsForWallpaperUserAlbumRemoval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSSet)assetsForWallpaperFavoriteAlbumRemoval
{
  return self->_assetsForWallpaperFavoriteAlbumRemoval;
}

- (void)setAssetsForWallpaperFavoriteAlbumRemoval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSSet)wallpaperSuggestionReloadUUIDs
{
  return self->_wallpaperSuggestionReloadUUIDs;
}

- (void)setWallpaperSuggestionReloadUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)shouldUpdateFeaturedContent
{
  return self->_shouldUpdateFeaturedContent;
}

- (void)setShouldUpdateFeaturedContent:(BOOL)a3
{
  self->_shouldUpdateFeaturedContent = a3;
}

- (NSSet)personsToUpdateForFeaturedContent
{
  return self->_personsToUpdateForFeaturedContent;
}

- (void)setPersonsToUpdateForFeaturedContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSSet)memoriesForAssetUpdate
{
  return self->_memoriesForAssetUpdate;
}

- (void)setMemoriesForAssetUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSSet)libraryScopeParticipantsForUpdate
{
  return self->_libraryScopeParticipantsForUpdate;
}

- (void)setLibraryScopeParticipantsForUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)libraryScopeRulesUpdated
{
  return self->_libraryScopeRulesUpdated;
}

- (void)setLibraryScopeRulesUpdated:(BOOL)a3
{
  self->_libraryScopeRulesUpdated = a3;
}

- (NSSet)memberIDsOfSocialGroupsNeedingContainmentUpdates
{
  return self->_memberIDsOfSocialGroupsNeedingContainmentUpdates;
}

- (void)setMemberIDsOfSocialGroupsNeedingContainmentUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSSet)assetIDsNeedingContainmentUpdates
{
  return self->_assetIDsNeedingContainmentUpdates;
}

- (void)setAssetIDsNeedingContainmentUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSDictionary)assetIDsByPersonUUIDNeedingContainmentUpdates
{
  return self->_assetIDsByPersonUUIDNeedingContainmentUpdates;
}

- (void)setAssetIDsByPersonUUIDNeedingContainmentUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSSet)socialGroupNodeIDsNeedingDeduplication
{
  return self->_socialGroupNodeIDsNeedingDeduplication;
}

- (void)setSocialGroupNodeIDsNeedingDeduplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSSet)memberIDsOfSocialGroupsNeedingDeduplication
{
  return self->_memberIDsOfSocialGroupsNeedingDeduplication;
}

- (void)setMemberIDsOfSocialGroupsNeedingDeduplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSSet)assetIDsNeedingAssetPersonEdgeUpdates
{
  return self->_assetIDsNeedingAssetPersonEdgeUpdates;
}

- (void)setAssetIDsNeedingAssetPersonEdgeUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIDsNeedingAssetPersonEdgeUpdates, 0);
  objc_storeStrong((id *)&self->_memberIDsOfSocialGroupsNeedingDeduplication, 0);
  objc_storeStrong((id *)&self->_socialGroupNodeIDsNeedingDeduplication, 0);
  objc_storeStrong((id *)&self->_assetIDsByPersonUUIDNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_assetIDsNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_memberIDsOfSocialGroupsNeedingContainmentUpdates, 0);
  objc_storeStrong((id *)&self->_libraryScopeParticipantsForUpdate, 0);
  objc_storeStrong((id *)&self->_memoriesForAssetUpdate, 0);
  objc_storeStrong((id *)&self->_personsToUpdateForFeaturedContent, 0);
  objc_storeStrong((id *)&self->_wallpaperSuggestionReloadUUIDs, 0);
  objc_storeStrong((id *)&self->_assetsForWallpaperFavoriteAlbumRemoval, 0);
  objc_storeStrong((id *)&self->_assetsForWallpaperUserAlbumRemoval, 0);
  objc_storeStrong((id *)&self->_assetsForWidgetFavoriteAlbumRemoval, 0);
  objc_storeStrong((id *)&self->_assetsForWidgetUserAlbumRemoval, 0);
  objc_storeStrong((id *)&self->_widgetTimelineReloadTypesNeeded, 0);
  objc_storeStrong((id *)&self->_memoriesForDuetDelete, 0);
  objc_storeStrong((id *)&self->_assetsForDuetDelete, 0);
  objc_storeStrong((id *)&self->_importSessionCountsAndDateRangeUpdates, 0);
  objc_storeStrong((id *)&self->_albumKeyAssetsUpdates, 0);
  objc_storeStrong((id *)&self->_albumCountsAndDateRangeUpdates, 0);
  objc_storeStrong((id *)&self->_searchIndexUpdates, 0);
  objc_storeStrong((id *)&self->_assetsForFilesystemPersistency, 0);
  objc_storeStrong((id *)&self->_sharedAssetContainerIncrementalChangesByAssetID, 0);
  objc_storeStrong((id *)&self->_updatedMomentIDsForHighlights, 0);
  objc_storeStrong((id *)&self->_updatedAssetIDsForHighlights, 0);
  objc_storeStrong((id *)&self->_momentDeletes, 0);
  objc_storeStrong((id *)&self->_momentInsertsAndUpdates, 0);
  objc_storeStrong((id *)&self->_cloudFeedDeletionEntries, 0);
  objc_storeStrong((id *)&self->_cloudFeedInvitationRecordUpdates, 0);
  objc_storeStrong((id *)&self->_cloudFeedCommentInserts, 0);
  objc_storeStrong((id *)&self->_cloudFeedAssetUpdates, 0);
  objc_storeStrong((id *)&self->_cloudFeedAssetInserts, 0);
  objc_storeStrong((id *)&self->_cloudFeedAlbumUpdates, 0);
}

uint64_t __44__PLDelayedSaveActionsDetail_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "managedObjectIDForURIRepresentation:", a2);
}

void __85__PLDelayedSaveActionsDetail__encodableAssetIDsByPersonUUIDNeedingContainmentUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PLDelayedSaveActionsDetail__encodableAssetIDsByPersonUUIDNeedingContainmentUpdates__block_invoke_2;
  v10[3] = &unk_1E3677EB8;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

void __85__PLDelayedSaveActionsDetail__encodableAssetIDsByPersonUUIDNeedingContainmentUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "URIRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __78__PLDelayedSaveActionsDetail__encodableSharedAssetContainerIncrementalChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "URIRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __74__PLDelayedSaveActionsDetail__encodableAssetsForWallpaperUserAlbumRemoval__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "URIRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __71__PLDelayedSaveActionsDetail__encodableAssetsForWidgetUserAlbumRemoval__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "URIRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __53__PLDelayedSaveActionsDetail__encodableMomentDeletes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "URIRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

uint64_t __46__PLDelayedSaveActionsDetail_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "URIRepresentation");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_decodeMomentDeletes:(id)a3 urlToObjectID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PLDelayedSaveActionsDetail__decodeMomentDeletes_urlToObjectID___block_invoke;
  v14[3] = &unk_1E3677F30;
  v16 = v5;
  v9 = v8;
  v15 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = v9;

  return v12;
}

+ (id)_decodeAssetsForWidgetUserAlbumRemoval:(id)a3 urlToObjectID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PLDelayedSaveActionsDetail__decodeAssetsForWidgetUserAlbumRemoval_urlToObjectID___block_invoke;
  v14[3] = &unk_1E3677F58;
  v16 = v5;
  v9 = v8;
  v15 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = v9;

  return v12;
}

+ (id)_decodeAssetsForWallpaperUserAlbumRemoval:(id)a3 urlToObjectID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__PLDelayedSaveActionsDetail__decodeAssetsForWallpaperUserAlbumRemoval_urlToObjectID___block_invoke;
  v14[3] = &unk_1E3677F58;
  v16 = v5;
  v9 = v8;
  v15 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = v9;

  return v12;
}

+ (id)_decodeSharedAssetContainerIncrementalChanges:(id)a3 urlToObjectID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__PLDelayedSaveActionsDetail__decodeSharedAssetContainerIncrementalChanges_urlToObjectID___block_invoke;
  v14[3] = &unk_1E3677F80;
  v16 = v5;
  v9 = v8;
  v15 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = v9;

  return v12;
}

+ (id)_decodeAssetIDsByPersonUUIDNeedingContainmentUpdates:(id)a3 urlToObjectID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__PLDelayedSaveActionsDetail__decodeAssetIDsByPersonUUIDNeedingContainmentUpdates_urlToObjectID___block_invoke;
  v14[3] = &unk_1E3677FD0;
  v16 = v5;
  v9 = v8;
  v15 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = v9;

  return v12;
}

void __97__PLDelayedSaveActionsDetail__decodeAssetIDsByPersonUUIDNeedingContainmentUpdates_urlToObjectID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__PLDelayedSaveActionsDetail__decodeAssetIDsByPersonUUIDNeedingContainmentUpdates_urlToObjectID___block_invoke_2;
  v10[3] = &unk_1E3677FA8;
  v11 = v8;
  v12 = *(id *)(a1 + 40);
  v9 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

void __97__PLDelayedSaveActionsDetail__decodeAssetIDsByPersonUUIDNeedingContainmentUpdates_urlToObjectID___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __90__PLDelayedSaveActionsDetail__decodeSharedAssetContainerIncrementalChanges_urlToObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

}

void __86__PLDelayedSaveActionsDetail__decodeAssetsForWallpaperUserAlbumRemoval_urlToObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

}

void __83__PLDelayedSaveActionsDetail__decodeAssetsForWidgetUserAlbumRemoval_urlToObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

}

void __65__PLDelayedSaveActionsDetail__decodeMomentDeletes_urlToObjectID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

}

@end

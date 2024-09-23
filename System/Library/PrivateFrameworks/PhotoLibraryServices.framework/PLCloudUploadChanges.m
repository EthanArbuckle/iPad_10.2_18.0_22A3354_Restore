@implementation PLCloudUploadChanges

- (PLCloudUploadChanges)init
{
  PLCloudUploadChanges *v2;
  NSMutableArray *v3;
  NSMutableArray *insertedAssets;
  NSMutableArray *v5;
  NSMutableArray *updatedAssets;
  NSMutableArray *v7;
  NSMutableArray *deferredAssets;
  NSMutableArray *v9;
  NSMutableArray *updatedMasters;
  NSMutableArray *v11;
  NSMutableArray *insertedResources;
  NSMutableArray *v13;
  NSMutableArray *updatedResources;
  NSMutableSet *v15;
  NSMutableSet *propertyChangedAssetUuids;
  NSMutableSet *v17;
  NSMutableSet *sharingPropertyChangedAssetUuids;
  NSMutableSet *v19;
  NSMutableSet *computeSyncChangedAssets;
  NSMutableSet *v21;
  NSMutableSet *adjustedAssetUuids;
  NSMutableSet *v23;
  NSMutableSet *faceChangedAssetUuids;
  NSMutableArray *v25;
  NSMutableArray *albumInserts;
  NSMutableArray *v27;
  NSMutableArray *albumChanges;
  NSMutableArray *v29;
  NSMutableArray *memoryChanges;
  NSMutableArray *v31;
  NSMutableArray *personChanges;
  NSMutableArray *v33;
  NSMutableArray *faceCropChanges;
  NSMutableArray *v35;
  NSMutableArray *suggestionChanges;
  NSMutableArray *v37;
  NSMutableArray *userFeedbackChanges;
  NSMutableArray *v39;
  NSMutableArray *libraryScopeChanges;
  NSMutableArray *v41;
  NSMutableArray *socialGroupChanges;
  NSMutableSet *v43;
  NSMutableSet *updatedRelationship;
  NSMutableArray *v45;
  NSMutableArray *deletedRecords;
  PLCloudUploadChanges *v47;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)PLCloudUploadChanges;
  v2 = -[PLCloudUploadChanges init](&v49, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    insertedAssets = v2->_insertedAssets;
    v2->_insertedAssets = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedAssets = v2->_updatedAssets;
    v2->_updatedAssets = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deferredAssets = v2->_deferredAssets;
    v2->_deferredAssets = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedMasters = v2->_updatedMasters;
    v2->_updatedMasters = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    insertedResources = v2->_insertedResources;
    v2->_insertedResources = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedResources = v2->_updatedResources;
    v2->_updatedResources = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    propertyChangedAssetUuids = v2->_propertyChangedAssetUuids;
    v2->_propertyChangedAssetUuids = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sharingPropertyChangedAssetUuids = v2->_sharingPropertyChangedAssetUuids;
    v2->_sharingPropertyChangedAssetUuids = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    computeSyncChangedAssets = v2->_computeSyncChangedAssets;
    v2->_computeSyncChangedAssets = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    adjustedAssetUuids = v2->_adjustedAssetUuids;
    v2->_adjustedAssetUuids = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    faceChangedAssetUuids = v2->_faceChangedAssetUuids;
    v2->_faceChangedAssetUuids = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    albumInserts = v2->_albumInserts;
    v2->_albumInserts = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    albumChanges = v2->_albumChanges;
    v2->_albumChanges = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memoryChanges = v2->_memoryChanges;
    v2->_memoryChanges = v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    personChanges = v2->_personChanges;
    v2->_personChanges = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    faceCropChanges = v2->_faceCropChanges;
    v2->_faceCropChanges = v33;

    v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    suggestionChanges = v2->_suggestionChanges;
    v2->_suggestionChanges = v35;

    v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    userFeedbackChanges = v2->_userFeedbackChanges;
    v2->_userFeedbackChanges = v37;

    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    libraryScopeChanges = v2->_libraryScopeChanges;
    v2->_libraryScopeChanges = v39;

    v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    socialGroupChanges = v2->_socialGroupChanges;
    v2->_socialGroupChanges = v41;

    v43 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    updatedRelationship = v2->_updatedRelationship;
    v2->_updatedRelationship = v43;

    v45 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedRecords = v2->_deletedRecords;
    v2->_deletedRecords = v45;

    v47 = v2;
  }

  return v2;
}

- (BOOL)isEmpty
{
  return !-[NSMutableArray count](self->_insertedAssets, "count")
      && !-[NSMutableArray count](self->_updatedAssets, "count")
      && !-[NSMutableArray count](self->_updatedMasters, "count")
      && !-[NSMutableArray count](self->_insertedResources, "count")
      && !-[NSMutableArray count](self->_updatedResources, "count")
      && !-[NSMutableSet count](self->_propertyChangedAssetUuids, "count")
      && !-[NSMutableSet count](self->_sharingPropertyChangedAssetUuids, "count")
      && !-[NSMutableSet count](self->_computeSyncChangedAssets, "count")
      && !-[NSMutableSet count](self->_adjustedAssetUuids, "count")
      && !-[NSMutableSet count](self->_faceChangedAssetUuids, "count")
      && !-[NSMutableArray count](self->_albumInserts, "count")
      && !-[NSMutableArray count](self->_albumChanges, "count")
      && !-[NSMutableArray count](self->_memoryChanges, "count")
      && !-[NSMutableArray count](self->_personChanges, "count")
      && !-[NSMutableArray count](self->_suggestionChanges, "count")
      && !-[NSMutableArray count](self->_userFeedbackChanges, "count")
      && !-[NSMutableArray count](self->_libraryScopeChanges, "count")
      && !-[NSMutableArray count](self->_socialGroupChanges, "count")
      && !-[NSMutableSet count](self->_updatedRelationship, "count")
      && -[NSMutableArray count](self->_deletedRecords, "count") == 0;
}

- (id)summaryCounts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inserted = %zu, insertedResources = %zu, deferredAssets = %zu, updated = %zu, updatedMasters = %zu, updatedResources = %zu, albumInsert = %zu, albumChange = %zu, memoryChange = %zu, personChange = %zu, faceCropChange = %zu, suggestionChange = %zu, userFeedbackChange = %zu, libraryScopeChanges = %zu, socialGroupChanges = %zu, deletedRecords = %zu"), -[NSMutableArray count](self->_insertedAssets, "count"), -[NSMutableArray count](self->_insertedResources, "count"), -[NSMutableArray count](self->_deferredAssets, "count"), -[NSMutableArray count](self->_updatedAssets, "count"), -[NSMutableArray count](self->_updatedMasters, "count"), -[NSMutableArray count](self->_updatedResources, "count"), -[NSMutableArray count](self->_albumInserts, "count"), -[NSMutableArray count](self->_albumChanges, "count"), -[NSMutableArray count](self->_memoryChanges, "count"), -[NSMutableArray count](self->_personChanges, "count"), -[NSMutableArray count](self->_faceCropChanges, "count"), -[NSMutableArray count](self->_suggestionChanges, "count"), -[NSMutableArray count](self->_userFeedbackChanges, "count"), -[NSMutableArray count](self->_libraryScopeChanges, "count"), -[NSMutableArray count](self->_socialGroupChanges, "count"), -[NSMutableArray count](self->_deletedRecords, "count"));
}

- (NSMutableArray)insertedAssets
{
  return self->_insertedAssets;
}

- (void)setInsertedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_insertedAssets, a3);
}

- (NSMutableArray)updatedAssets
{
  return self->_updatedAssets;
}

- (void)setUpdatedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_updatedAssets, a3);
}

- (NSMutableArray)deferredAssets
{
  return self->_deferredAssets;
}

- (void)setDeferredAssets:(id)a3
{
  objc_storeStrong((id *)&self->_deferredAssets, a3);
}

- (NSMutableSet)adjustedAssetUuids
{
  return self->_adjustedAssetUuids;
}

- (void)setAdjustedAssetUuids:(id)a3
{
  objc_storeStrong((id *)&self->_adjustedAssetUuids, a3);
}

- (NSMutableSet)propertyChangedAssetUuids
{
  return self->_propertyChangedAssetUuids;
}

- (void)setPropertyChangedAssetUuids:(id)a3
{
  objc_storeStrong((id *)&self->_propertyChangedAssetUuids, a3);
}

- (NSMutableSet)sharingPropertyChangedAssetUuids
{
  return self->_sharingPropertyChangedAssetUuids;
}

- (void)setSharingPropertyChangedAssetUuids:(id)a3
{
  objc_storeStrong((id *)&self->_sharingPropertyChangedAssetUuids, a3);
}

- (NSMutableSet)faceChangedAssetUuids
{
  return self->_faceChangedAssetUuids;
}

- (void)setFaceChangedAssetUuids:(id)a3
{
  objc_storeStrong((id *)&self->_faceChangedAssetUuids, a3);
}

- (NSMutableSet)computeSyncChangedAssets
{
  return self->_computeSyncChangedAssets;
}

- (void)setComputeSyncChangedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_computeSyncChangedAssets, a3);
}

- (NSMutableArray)updatedMasters
{
  return self->_updatedMasters;
}

- (void)setUpdatedMasters:(id)a3
{
  objc_storeStrong((id *)&self->_updatedMasters, a3);
}

- (NSMutableArray)insertedResources
{
  return self->_insertedResources;
}

- (void)setInsertedResources:(id)a3
{
  objc_storeStrong((id *)&self->_insertedResources, a3);
}

- (NSMutableArray)updatedResources
{
  return self->_updatedResources;
}

- (void)setUpdatedResources:(id)a3
{
  objc_storeStrong((id *)&self->_updatedResources, a3);
}

- (NSMutableArray)albumInserts
{
  return self->_albumInserts;
}

- (void)setAlbumInserts:(id)a3
{
  objc_storeStrong((id *)&self->_albumInserts, a3);
}

- (NSMutableArray)albumChanges
{
  return self->_albumChanges;
}

- (void)setAlbumChanges:(id)a3
{
  objc_storeStrong((id *)&self->_albumChanges, a3);
}

- (NSMutableArray)memoryChanges
{
  return self->_memoryChanges;
}

- (void)setMemoryChanges:(id)a3
{
  objc_storeStrong((id *)&self->_memoryChanges, a3);
}

- (NSMutableArray)personChanges
{
  return self->_personChanges;
}

- (void)setPersonChanges:(id)a3
{
  objc_storeStrong((id *)&self->_personChanges, a3);
}

- (NSMutableArray)faceCropChanges
{
  return self->_faceCropChanges;
}

- (void)setFaceCropChanges:(id)a3
{
  objc_storeStrong((id *)&self->_faceCropChanges, a3);
}

- (NSMutableArray)suggestionChanges
{
  return self->_suggestionChanges;
}

- (void)setSuggestionChanges:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionChanges, a3);
}

- (NSMutableArray)userFeedbackChanges
{
  return self->_userFeedbackChanges;
}

- (void)setUserFeedbackChanges:(id)a3
{
  objc_storeStrong((id *)&self->_userFeedbackChanges, a3);
}

- (NSMutableArray)libraryScopeChanges
{
  return self->_libraryScopeChanges;
}

- (void)setLibraryScopeChanges:(id)a3
{
  objc_storeStrong((id *)&self->_libraryScopeChanges, a3);
}

- (NSMutableArray)socialGroupChanges
{
  return self->_socialGroupChanges;
}

- (void)setSocialGroupChanges:(id)a3
{
  objc_storeStrong((id *)&self->_socialGroupChanges, a3);
}

- (NSMutableSet)updatedRelationship
{
  return self->_updatedRelationship;
}

- (void)setUpdatedRelationship:(id)a3
{
  objc_storeStrong((id *)&self->_updatedRelationship, a3);
}

- (NSMutableArray)deletedRecords
{
  return self->_deletedRecords;
}

- (void)setDeletedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_deletedRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecords, 0);
  objc_storeStrong((id *)&self->_updatedRelationship, 0);
  objc_storeStrong((id *)&self->_socialGroupChanges, 0);
  objc_storeStrong((id *)&self->_libraryScopeChanges, 0);
  objc_storeStrong((id *)&self->_userFeedbackChanges, 0);
  objc_storeStrong((id *)&self->_suggestionChanges, 0);
  objc_storeStrong((id *)&self->_faceCropChanges, 0);
  objc_storeStrong((id *)&self->_personChanges, 0);
  objc_storeStrong((id *)&self->_memoryChanges, 0);
  objc_storeStrong((id *)&self->_albumChanges, 0);
  objc_storeStrong((id *)&self->_albumInserts, 0);
  objc_storeStrong((id *)&self->_updatedResources, 0);
  objc_storeStrong((id *)&self->_insertedResources, 0);
  objc_storeStrong((id *)&self->_updatedMasters, 0);
  objc_storeStrong((id *)&self->_computeSyncChangedAssets, 0);
  objc_storeStrong((id *)&self->_faceChangedAssetUuids, 0);
  objc_storeStrong((id *)&self->_sharingPropertyChangedAssetUuids, 0);
  objc_storeStrong((id *)&self->_propertyChangedAssetUuids, 0);
  objc_storeStrong((id *)&self->_adjustedAssetUuids, 0);
  objc_storeStrong((id *)&self->_deferredAssets, 0);
  objc_storeStrong((id *)&self->_updatedAssets, 0);
  objc_storeStrong((id *)&self->_insertedAssets, 0);
}

@end

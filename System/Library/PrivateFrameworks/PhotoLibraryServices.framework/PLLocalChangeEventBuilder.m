@implementation PLLocalChangeEventBuilder

- (PLLocalChangeEventBuilder)init
{
  PLLocalChangeEventBuilder *v2;
  NSMutableSet *v3;
  NSMutableSet *insertedObjectIDs;
  NSMutableSet *v5;
  NSMutableSet *updatedObjectIDs;
  NSMutableSet *v7;
  NSMutableSet *deletedObjectIDs;
  NSMutableArray *v9;
  NSMutableArray *deletedAssetCloudGUIDs;
  NSMutableArray *v11;
  NSMutableArray *deletedAlbumCloudGUIDs;
  NSMutableArray *v13;
  NSMutableArray *deletedMemoryCloudGUIDs;
  NSMutableArray *v15;
  NSMutableArray *deletedPersonCloudGUIDs;
  NSMutableArray *v17;
  NSMutableArray *deletedFaceCropCloudGUIDs;
  NSMutableArray *v19;
  NSMutableArray *deletedOwnedMomentShareCloudGUIDs;
  NSMutableArray *v21;
  NSMutableArray *deletedSubscribedMomentShareCloudGUIDs;
  NSMutableArray *v23;
  NSMutableArray *deletedSuggestionCloudGUIDs;
  NSMutableArray *v25;
  NSMutableArray *deletedUserFeedbackCloudGUIDs;
  NSMutableArray *v27;
  NSMutableArray *deletedInternalResourceUUIDToResourceTypeMappings;
  NSMutableArray *v29;
  NSMutableArray *deletedOwnedLibraryScopeCloudGUIDs;
  NSMutableArray *v31;
  NSMutableArray *deletedSubscribedLibraryScopeCloudGUIDs;
  NSMutableArray *v33;
  NSMutableArray *deletedSocialGroupCloudGUIDs;
  NSMutableDictionary *v35;
  NSMutableDictionary *attributesByOID;
  NSMutableDictionary *v37;
  NSMutableDictionary *relationshipsByOID;
  PLLocalChangeEventBuilder *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)PLLocalChangeEventBuilder;
  v2 = -[PLLocalChangeEventBuilder init](&v41, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    insertedObjectIDs = v2->_insertedObjectIDs;
    v2->_insertedObjectIDs = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    updatedObjectIDs = v2->_updatedObjectIDs;
    v2->_updatedObjectIDs = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deletedObjectIDs = v2->_deletedObjectIDs;
    v2->_deletedObjectIDs = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedAssetCloudGUIDs = v2->_deletedAssetCloudGUIDs;
    v2->_deletedAssetCloudGUIDs = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedAlbumCloudGUIDs = v2->_deletedAlbumCloudGUIDs;
    v2->_deletedAlbumCloudGUIDs = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedMemoryCloudGUIDs = v2->_deletedMemoryCloudGUIDs;
    v2->_deletedMemoryCloudGUIDs = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedPersonCloudGUIDs = v2->_deletedPersonCloudGUIDs;
    v2->_deletedPersonCloudGUIDs = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedFaceCropCloudGUIDs = v2->_deletedFaceCropCloudGUIDs;
    v2->_deletedFaceCropCloudGUIDs = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedOwnedMomentShareCloudGUIDs = v2->_deletedOwnedMomentShareCloudGUIDs;
    v2->_deletedOwnedMomentShareCloudGUIDs = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedSubscribedMomentShareCloudGUIDs = v2->_deletedSubscribedMomentShareCloudGUIDs;
    v2->_deletedSubscribedMomentShareCloudGUIDs = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedSuggestionCloudGUIDs = v2->_deletedSuggestionCloudGUIDs;
    v2->_deletedSuggestionCloudGUIDs = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedUserFeedbackCloudGUIDs = v2->_deletedUserFeedbackCloudGUIDs;
    v2->_deletedUserFeedbackCloudGUIDs = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedInternalResourceUUIDToResourceTypeMappings = v2->_deletedInternalResourceUUIDToResourceTypeMappings;
    v2->_deletedInternalResourceUUIDToResourceTypeMappings = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedOwnedLibraryScopeCloudGUIDs = v2->_deletedOwnedLibraryScopeCloudGUIDs;
    v2->_deletedOwnedLibraryScopeCloudGUIDs = v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedSubscribedLibraryScopeCloudGUIDs = v2->_deletedSubscribedLibraryScopeCloudGUIDs;
    v2->_deletedSubscribedLibraryScopeCloudGUIDs = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedSocialGroupCloudGUIDs = v2->_deletedSocialGroupCloudGUIDs;
    v2->_deletedSocialGroupCloudGUIDs = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributesByOID = v2->_attributesByOID;
    v2->_attributesByOID = v35;

    v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    relationshipsByOID = v2->_relationshipsByOID;
    v2->_relationshipsByOID = v37;

    v39 = v2;
  }

  return v2;
}

- (void)recordInsertedObjectID:(id)a3
{
  -[NSMutableSet addObject:](self->_insertedObjectIDs, "addObject:", a3);
}

- (void)recordUpdatedObjectID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[NSMutableSet addObject:](self->_updatedObjectIDs, "addObject:", v15);
  objc_msgSend(v15, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLimitedLibraryFetchFilter entityName](PLLimitedLibraryFetchFilter, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "photosAccessAllowedWithScope:", 7);

    if (v9 == 4)
    {
      self->_unknownMergeEvent = 1;
      objc_msgSend(v15, "persistentStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D73288], "libraryURLFromDatabaseURL:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleForLibraryURL:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "resetClientSandboxExtensionCache");
    }
  }

}

- (void)recordDeletedObjectID:(id)a3
{
  -[NSMutableSet addObject:](self->_deletedObjectIDs, "addObject:", a3);
}

- (void)recordDeletedCloudGUID:(id)a3 forType:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if ((unint64_t)(a4 - 1) <= 0xC)
  {
    v7 = v6;
    -[NSMutableDictionary addObject:]((&self->_relationshipsByOID)[a4], "addObject:", v6);
    v6 = v7;
  }

}

- (void)recordUpdatedAttributes:(unint64_t)a3 andRelationships:(unint64_t)a4 forObjectID:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  objc_msgSend(v8, "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attributesByOID, "setObject:forKeyedSubscript:", v10, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_relationshipsByOID, "setObject:forKeyedSubscript:", v11, v9);

}

- (void)recordAllTransactionsFromIterator:(id)a3
{
  -[PLLocalChangeEventBuilder recordTransactionsFromIterator:untilTest:](self, "recordTransactionsFromIterator:untilTest:", a3, &__block_literal_global_12);
}

- (void)recordTransactionsFromIterator:(id)a3 untilTest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSNumber *v15;
  NSNumber *lastTransactionNumber;
  _QWORD v17[4];
  id v18;
  PLLocalChangeEventBuilder *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPersistentHistoryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(v6, "count");
    v10 = (void *)MEMORY[0x19AEC174C](v7);
    *(_DWORD *)buf = 134218242;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Record transactions from iterator with count: %lu, test: %@", buf, 0x16u);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__PLLocalChangeEventBuilder_recordTransactionsFromIterator_untilTest___block_invoke;
  v17[3] = &unk_1E3662938;
  v11 = v6;
  v18 = v11;
  v19 = self;
  v20 = v7;
  v12 = v7;
  objc_msgSend(v11, "enumerateRemainingTransactionsWithBlock:", v17);
  objc_msgSend(v11, "lastIteratedToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLPersistentHistoryGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = (uint64_t)v13;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Last iterated token: %@", buf, 0xCu);
  }

  +[PLPersistentHistoryUtilities transactionNumberFromToken:](PLPersistentHistoryUtilities, "transactionNumberFromToken:", v13);
  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastTransactionNumber = self->_lastTransactionNumber;
  self->_lastTransactionNumber = v15;

}

- (void)recordTransaction:(id)a3
{
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v4 = -[PLLocalChangeEventBuilder _shouldRecordTransaction:](self, "_shouldRecordTransaction:");
  PLPersistentHistoryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v19, "_pl_prettyDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Record transaction: %@", buf, 0xCu);

    }
    ++self->_transactionCount;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v19, "changes");
    v5 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v12, "changedObjectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[PLLocalChangeEventBuilder recordChange:](self, "recordChange:", v12);
          }
          else
          {
            PLBackendGetLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v12, "_pl_prettyDescription");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "_pl_prettyDescriptionWithIndent:", 1);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v25 = v16;
              v26 = 2112;
              v27 = v17;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_FAULT, "PLLocalChangeEventBuilder: changedObjectID is nil\n%@%@", buf, 0x16u);

            }
          }

          objc_autoreleasePoolPop(v13);
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v9);
    }
  }
  else if (v6)
  {
    objc_msgSend(v19, "_pl_prettyDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v18;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Not recording transaction due to filter: %@", buf, 0xCu);

  }
}

- (BOOL)_shouldRecordTransaction:(id)a3
{
  uint64_t (**transactionFilter)(id, id);

  transactionFilter = (uint64_t (**)(id, id))self->_transactionFilter;
  if (transactionFilter)
    return transactionFilter[2](transactionFilter, a3);
  else
    return 1;
}

- (void)recordChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPersistentHistoryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "_pl_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Record change: %@", (uint8_t *)&v8, 0xCu);

  }
  ++self->_changeCount;
  v7 = objc_msgSend(v4, "changeType");
  switch(v7)
  {
    case 2:
      -[PLLocalChangeEventBuilder _recordDeleteChange:](self, "_recordDeleteChange:", v4);
      break;
    case 1:
      -[PLLocalChangeEventBuilder _recordUpdateChange:](self, "_recordUpdateChange:", v4);
      break;
    case 0:
      -[PLLocalChangeEventBuilder _recordInsertChange:](self, "_recordInsertChange:", v4);
      break;
  }

}

- (void)_recordInsertChange:(id)a3
{
  id v4;

  objc_msgSend(a3, "changedObjectID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLLocalChangeEventBuilder recordInsertedObjectID:](self, "recordInsertedObjectID:", v4);

}

- (void)_recordUpdateChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "changedObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_insertedObjectIDs, "containsObject:", v5))
  {
    PLPersistentHistoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "_pl_prettyDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Not recording update change because it was recorded as an insert: %@", (uint8_t *)&v10, 0xCu);
LABEL_8:

    }
  }
  else
  {
    -[PLLocalChangeEventBuilder _filteredUpdatedPropertiesFromChange:](self, "_filteredUpdatedPropertiesFromChange:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject count](v6, "count"))
    {
      PLPersistentHistoryGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "_pl_prettyDescription");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Not recording update change because all properties were filtered out: %@", (uint8_t *)&v10, 0xCu);

      }
      goto LABEL_8;
    }
    -[PLLocalChangeEventBuilder recordUpdatedObjectID:](self, "recordUpdatedObjectID:", v5);
    objc_msgSend(v4, "updatedProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPropertyIndexMapping recordChangedProperties:forObjectID:inAttributesByOID:relationshipsByOID:](PLPropertyIndexMapping, "recordChangedProperties:forObjectID:inAttributesByOID:relationshipsByOID:", v8, v5, self->_attributesByOID, self->_relationshipsByOID);

  }
}

- (id)_filteredUpdatedPropertiesFromChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "updatedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_updatedPropertyFilter)
  {
    objc_msgSend(v4, "_pl_filter:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    PLPersistentHistoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      PLDescriptionForUpdateProperties(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Filtered updated properties: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    v6 = v4;
  }
  return v6;
}

- (void)_recordDeleteChange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "changedObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableSet containsObject:](self->_insertedObjectIDs, "containsObject:", v5);
  -[NSMutableSet removeObject:](self->_insertedObjectIDs, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_updatedObjectIDs, "removeObject:", v5);
  if ((v6 & 1) != 0)
  {
    PLPersistentHistoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "_pl_prettyDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Not recording delete change because it was recorded as an insert: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    -[PLLocalChangeEventBuilder recordDeletedObjectID:](self, "recordDeletedObjectID:", v5);
  }
  -[PLLocalChangeEventBuilder _recordCloudDeleteForChange:](self, "_recordCloudDeleteForChange:", v4);

}

- (void)_recordCloudDeleteForChange:(id)a3
{
  id v4;
  objc_class *v5;
  objc_class *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PLLocalChangeEventBuilder _cloudDeletableEntityFromChange:](self, "_cloudDeletableEntityFromChange:", v4);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "tombstone");
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[PLLocalChangeEventBuilder _isCloudStateDeletedOnTombstone:](self, "_isCloudStateDeletedOnTombstone:", v7))
    {
      -[objc_class cloudUUIDKeyForDeletion](v6, "cloudUUIDKeyForDeletion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = -[objc_class cloudDeletionTypeForTombstone:](v6, "cloudDeletionTypeForTombstone:", v7);
        PLPersistentHistoryGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "_pl_prettyDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543874;
          v17 = v9;
          v18 = 2050;
          v19 = v10;
          v20 = 2114;
          v21 = v12;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Recording cloud GUID for deletion %{public}@ [type: %{public}ld, %{public}@]", (uint8_t *)&v16, 0x20u);

        }
        -[PLLocalChangeEventBuilder recordDeletedCloudGUID:forType:](self, "recordDeletedCloudGUID:forType:", v9, v10);
      }
      else
      {
        PLPersistentHistoryGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "_pl_prettyDescription");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = 138543362;
          v17 = v15;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Not recording cloud delete change because cloud GUID is nil: %{public}@", (uint8_t *)&v16, 0xCu);

        }
        v9 = 0;
      }
    }
    else
    {
      PLPersistentHistoryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "_pl_prettyDescription");
        v13 = objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Not recording cloud delete change because its state is not deleted: %{public}@", (uint8_t *)&v16, 0xCu);

      }
    }
    goto LABEL_14;
  }
  PLPersistentHistoryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "_pl_prettyDescription");
    v9 = objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v9;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Not recording cloud delete change because entity is not cloud deletable: %{public}@", (uint8_t *)&v16, 0xCu);
LABEL_14:

  }
}

- (Class)_cloudDeletableEntityFromChange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSString *v6;
  Class v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "changedObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectClassName");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  v7 = NSClassFromString(v6);
  if (-[objc_class conformsToProtocol:](v7, "conformsToProtocol:", &unk_1EE37FEC0))
  {
    v8 = v7;
  }
  else if (-[objc_class isEqual:](v7, "isEqual:", objc_opt_class()))
  {
    objc_msgSend(v3, "tombstone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("primaryLabelCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "intValue") == 1000)
    {
      objc_opt_class();
      v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isCloudStateDeletedOnTombstone:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("cloudDeleteState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unsigned __int16)objc_msgSend(v3, "intValue") == 1;

  return v4;
}

- (id)recordChangedObjectIDBlockForChangeKey:(id)a3
{
  id v4;
  NSMutableSet *insertedObjectIDs;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  _QWORD v12[4];
  NSMutableSet *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C97870]))
  {
    insertedObjectIDs = self->_insertedObjectIDs;
LABEL_7:
    v6 = insertedObjectIDs;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C97A18]))
  {
    insertedObjectIDs = self->_updatedObjectIDs;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C97838]))
  {
    insertedObjectIDs = self->_deletedObjectIDs;
    goto LABEL_7;
  }
  PLPersistentHistoryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to find objectID array for change key: %@", buf, 0xCu);
  }

  v6 = 0;
LABEL_8:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PLLocalChangeEventBuilder_recordChangedObjectIDBlockForChangeKey___block_invoke;
  v12[3] = &unk_1E3670DE8;
  v13 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x19AEC174C](v12);
  v9 = (void *)MEMORY[0x19AEC174C]();

  return v9;
}

- (id)recordDeletedCloudGUIDBlockForChangeKey:(id)a3
{
  id v4;
  NSMutableArray *deletedAssetCloudGUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  _QWORD v12[4];
  NSMutableArray *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudAssetDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedAssetCloudGUIDs;
LABEL_27:
    v6 = deletedAssetCloudGUIDs;
    goto LABEL_28;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudAlbumDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedAlbumCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudMemoryDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedMemoryCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudPersonDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedPersonCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudFaceCropDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedFaceCropCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudOwnedCMMDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedOwnedMomentShareCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudSubscribedCMMDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedSubscribedMomentShareCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudOwnedLibraryScopeDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedOwnedLibraryScopeCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudSubscribedLibraryScopeDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedSubscribedLibraryScopeCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudSuggestionDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedSuggestionCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudUserFeedbackDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedUserFeedbackCloudGUIDs;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudInternalResourceUUIDToResourceTypeMappings")))
  {
    deletedAssetCloudGUIDs = self->_deletedInternalResourceUUIDToResourceTypeMappings;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cloudSocialGroupDeleteGUIDs")))
  {
    deletedAssetCloudGUIDs = self->_deletedSocialGroupCloudGUIDs;
    goto LABEL_27;
  }
  PLPersistentHistoryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to find cloud GUID array for change key: %@", buf, 0xCu);
  }

  v6 = 0;
LABEL_28:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PLLocalChangeEventBuilder_recordDeletedCloudGUIDBlockForChangeKey___block_invoke;
  v12[3] = &unk_1E3670DE8;
  v13 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x19AEC174C](v12);
  v9 = (void *)MEMORY[0x19AEC174C]();

  return v9;
}

- (BOOL)isEmpty
{
  return !-[NSMutableSet count](self->_insertedObjectIDs, "count")
      && !-[NSMutableSet count](self->_updatedObjectIDs, "count")
      && !-[NSMutableSet count](self->_deletedObjectIDs, "count")
      && !-[NSMutableDictionary count](self->_attributesByOID, "count")
      && !-[NSMutableDictionary count](self->_relationshipsByOID, "count")
      && !-[NSMutableArray count](self->_deletedAssetCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedAlbumCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedMemoryCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedPersonCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedFaceCropCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedOwnedMomentShareCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedSubscribedMomentShareCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedOwnedLibraryScopeCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedSubscribedLibraryScopeCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedSuggestionCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedUserFeedbackCloudGUIDs, "count")
      && !-[NSMutableArray count](self->_deletedInternalResourceUUIDToResourceTypeMappings, "count")
      && !-[NSMutableArray count](self->_deletedSocialGroupCloudGUIDs, "count");
}

- (id)buildLocalEvent
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

  if (-[PLLocalChangeEventBuilder isEmpty](self, "isEmpty"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet allObjects](self->_insertedObjectIDs, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C97870]);

    -[NSMutableSet allObjects](self->_updatedObjectIDs, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0C97A18]);

    -[NSMutableSet allObjects](self->_deletedObjectIDs, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C97838]);

    v8 = (void *)-[NSMutableDictionary copy](self->_attributesByOID, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("PLUpdatedAttributesByObjectIDKey"));

    v9 = (void *)-[NSMutableDictionary copy](self->_relationshipsByOID, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("PLUpdatedRelationshipsByObjectIDKey"));

    v10 = (void *)-[NSMutableArray copy](self->_deletedAssetCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("cloudAssetDeleteGUIDs"));

    v11 = (void *)-[NSMutableArray copy](self->_deletedAlbumCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("cloudAlbumDeleteGUIDs"));

    v12 = (void *)-[NSMutableArray copy](self->_deletedMemoryCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("cloudMemoryDeleteGUIDs"));

    v13 = (void *)-[NSMutableArray copy](self->_deletedPersonCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("cloudPersonDeleteGUIDs"));

    v14 = (void *)-[NSMutableArray copy](self->_deletedFaceCropCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("cloudFaceCropDeleteGUIDs"));

    v15 = (void *)-[NSMutableArray copy](self->_deletedOwnedMomentShareCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("cloudOwnedCMMDeleteGUIDs"));

    v16 = (void *)-[NSMutableArray copy](self->_deletedSubscribedMomentShareCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("cloudSubscribedCMMDeleteGUIDs"));

    v17 = (void *)-[NSMutableArray copy](self->_deletedOwnedLibraryScopeCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("cloudOwnedLibraryScopeDeleteGUIDs"));

    v18 = (void *)-[NSMutableArray copy](self->_deletedSubscribedLibraryScopeCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("cloudSubscribedLibraryScopeDeleteGUIDs"));

    v19 = (void *)-[NSMutableArray copy](self->_deletedSuggestionCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("cloudSuggestionDeleteGUIDs"));

    v20 = (void *)-[NSMutableArray copy](self->_deletedUserFeedbackCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("cloudUserFeedbackDeleteGUIDs"));

    v21 = (void *)-[NSMutableArray copy](self->_deletedInternalResourceUUIDToResourceTypeMappings, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("cloudInternalResourceUUIDToResourceTypeMappings"));

    v22 = (void *)-[NSMutableArray copy](self->_deletedSocialGroupCloudGUIDs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("cloudSocialGroupDeleteGUIDs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_coalescedEvent);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("coalescedEvent"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_syncChange);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("PLSyncChangeMarker"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_unknownMergeEvent);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("PLUnknownMergeEvent"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_lastTransactionNumber, CFSTR("lastTransactionNumber"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_transactionCount);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("transactionCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_changeCount);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("changeCount"));

    v3 = (void *)objc_msgSend(v4, "copy");
  }
  return v3;
}

- (BOOL)isCoalescedEvent
{
  return self->_coalescedEvent;
}

- (void)setCoalescedEvent:(BOOL)a3
{
  self->_coalescedEvent = a3;
}

- (BOOL)isSyncChange
{
  return self->_syncChange;
}

- (void)setSyncChange:(BOOL)a3
{
  self->_syncChange = a3;
}

- (BOOL)isUnknownMergeEvent
{
  return self->_unknownMergeEvent;
}

- (void)setUnknownMergeEvent:(BOOL)a3
{
  self->_unknownMergeEvent = a3;
}

- (id)transactionFilter
{
  return self->_transactionFilter;
}

- (void)setTransactionFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)updatedPropertyFilter
{
  return self->_updatedPropertyFilter;
}

- (void)setUpdatedPropertyFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedPropertyFilter, 0);
  objc_storeStrong(&self->_transactionFilter, 0);
  objc_storeStrong((id *)&self->_lastTransactionNumber, 0);
  objc_storeStrong((id *)&self->_deletedSocialGroupCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedSubscribedLibraryScopeCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedOwnedLibraryScopeCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedInternalResourceUUIDToResourceTypeMappings, 0);
  objc_storeStrong((id *)&self->_deletedUserFeedbackCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedSuggestionCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedSubscribedMomentShareCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedOwnedMomentShareCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedFaceCropCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedPersonCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedMemoryCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedAlbumCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_deletedAssetCloudGUIDs, 0);
  objc_storeStrong((id *)&self->_relationshipsByOID, 0);
  objc_storeStrong((id *)&self->_attributesByOID, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_updatedObjectIDs, 0);
  objc_storeStrong((id *)&self->_insertedObjectIDs, 0);
}

uint64_t __69__PLLocalChangeEventBuilder_recordDeletedCloudGUIDBlockForChangeKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __68__PLLocalChangeEventBuilder_recordChangedObjectIDBlockForChangeKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __70__PLLocalChangeEventBuilder_recordTransactionsFromIterator_untilTest___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PLLocalChangeEventBuilder_recordTransactionsFromIterator_untilTest___block_invoke_2;
  v8[3] = &unk_1E3677C18;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v8);

  *a3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __70__PLLocalChangeEventBuilder_recordTransactionsFromIterator_untilTest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recordTransaction:", *(_QWORD *)(a1 + 40));
}

uint64_t __63__PLLocalChangeEventBuilder_recordAllTransactionsFromIterator___block_invoke()
{
  return 0;
}

+ (id)localEventWithBuilderBlock:(id)a3
{
  id v3;
  void *v4;
  id v6;

  v6 = a3;
  v3 = v6;
  pl_result_with_autoreleasepool();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)localEventFromTransaction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PLLocalChangeEventBuilder_localEventFromTransaction___block_invoke;
  v8[3] = &unk_1E366D710;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "localEventWithBuilderBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __55__PLLocalChangeEventBuilder_localEventFromTransaction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordTransaction:", *(_QWORD *)(a1 + 32));
}

id __56__PLLocalChangeEventBuilder_localEventWithBuilderBlock___block_invoke(uint64_t a1)
{
  PLLocalChangeEventBuilder *v2;
  void *v3;

  v2 = objc_alloc_init(PLLocalChangeEventBuilder);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  -[PLLocalChangeEventBuilder buildLocalEvent](v2, "buildLocalEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

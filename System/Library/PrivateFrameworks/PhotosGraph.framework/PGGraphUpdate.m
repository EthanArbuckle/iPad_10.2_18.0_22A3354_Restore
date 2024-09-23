@implementation PGGraphUpdate

- (PGGraphUpdate)initWithPhotoLibrary:(id)a3 updateType:(int64_t)a4 changeStreamToken:(id)a5
{
  id v9;
  id v10;
  PGGraphUpdate *v11;
  PGGraphUpdate *v12;
  NSMutableArray *v13;
  NSMutableArray *inputChanges;
  NSMutableDictionary *v15;
  NSMutableDictionary *momentByMomentUUID;
  NSMutableDictionary *v17;
  NSMutableDictionary *updateMomentNodesByUpdateType;
  NSMutableDictionary *v19;
  NSMutableDictionary *updateHighlightNodesByUpdateType;
  NSMutableSet *v21;
  NSMutableSet *deletedMomentUUIDsForValidityCheck;
  NSMutableSet *v23;
  NSMutableSet *deletedHighlightUUIDsForValidityCheck;
  NSMutableDictionary *v25;
  NSMutableDictionary *registeredLocationOfInterestVisitsToResolveByMomentUUID;
  NSMutableDictionary *v27;
  NSMutableDictionary *registeredResolvableItemsByBusinessItemMuid;
  NSSet *v29;
  NSSet *localIdentifiersOfPersonsToUpdate;
  NSSet *v31;
  NSSet *localIdentifiersOfPersonsToDelete;
  NSSet *v33;
  NSSet *localIdentifiersOfPersonsToInsert;
  NSSet *v35;
  NSSet *contactIdentifiersOfPersonsToUpdate;
  PGGraphUpdateRelatedDetails *v37;
  PGGraphUpdateRelatedDetails *relatedDetails;
  NSMutableDictionary *v39;
  NSMutableDictionary *highlightByHighlightUUID;
  NSMutableDictionary *v41;
  NSMutableDictionary *highlightsToInsertByHighlightKind;
  NSMutableSet *v43;
  NSMutableSet *uuidsOfDeletedHighlights;
  objc_super v46;

  v9 = a3;
  v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)PGGraphUpdate;
  v11 = -[PGGraphUpdate init](&v46, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    v12->_updateType = a4;
    objc_storeStrong((id *)&v12->_changeStreamToken, a5);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    inputChanges = v12->_inputChanges;
    v12->_inputChanges = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    momentByMomentUUID = v12->_momentByMomentUUID;
    v12->_momentByMomentUUID = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    updateMomentNodesByUpdateType = v12->_updateMomentNodesByUpdateType;
    v12->_updateMomentNodesByUpdateType = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    updateHighlightNodesByUpdateType = v12->_updateHighlightNodesByUpdateType;
    v12->_updateHighlightNodesByUpdateType = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deletedMomentUUIDsForValidityCheck = v12->_deletedMomentUUIDsForValidityCheck;
    v12->_deletedMomentUUIDsForValidityCheck = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deletedHighlightUUIDsForValidityCheck = v12->_deletedHighlightUUIDsForValidityCheck;
    v12->_deletedHighlightUUIDsForValidityCheck = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registeredLocationOfInterestVisitsToResolveByMomentUUID = v12->_registeredLocationOfInterestVisitsToResolveByMomentUUID;
    v12->_registeredLocationOfInterestVisitsToResolveByMomentUUID = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registeredResolvableItemsByBusinessItemMuid = v12->_registeredResolvableItemsByBusinessItemMuid;
    v12->_registeredResolvableItemsByBusinessItemMuid = v27;

    v29 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    localIdentifiersOfPersonsToUpdate = v12->_localIdentifiersOfPersonsToUpdate;
    v12->_localIdentifiersOfPersonsToUpdate = v29;

    v31 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    localIdentifiersOfPersonsToDelete = v12->_localIdentifiersOfPersonsToDelete;
    v12->_localIdentifiersOfPersonsToDelete = v31;

    v33 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    localIdentifiersOfPersonsToInsert = v12->_localIdentifiersOfPersonsToInsert;
    v12->_localIdentifiersOfPersonsToInsert = v33;

    v35 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    contactIdentifiersOfPersonsToUpdate = v12->_contactIdentifiersOfPersonsToUpdate;
    v12->_contactIdentifiersOfPersonsToUpdate = v35;

    v37 = objc_alloc_init(PGGraphUpdateRelatedDetails);
    relatedDetails = v12->_relatedDetails;
    v12->_relatedDetails = v37;

    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    highlightByHighlightUUID = v12->_highlightByHighlightUUID;
    v12->_highlightByHighlightUUID = v39;

    v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    highlightsToInsertByHighlightKind = v12->_highlightsToInsertByHighlightKind;
    v12->_highlightsToInsertByHighlightKind = v41;

    v43 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    uuidsOfDeletedHighlights = v12->_uuidsOfDeletedHighlights;
    v12->_uuidsOfDeletedHighlights = v43;

    v12->_hasIncrementalChanges = 1;
    if (a4 == 3)
      *(_WORD *)&v12->_hasIncrementalChanges = 256;
  }

  return v12;
}

- (id)initForChangeStreamResetInPhotoLibrary:(id)a3 updateType:(int64_t)a4
{
  id result;

  result = -[PGGraphUpdate initWithPhotoLibrary:updateType:changeStreamToken:](self, "initWithPhotoLibrary:updateType:changeStreamToken:", a3, a4, 0);
  if (result)
    *((_BYTE *)result + 32) = 0;
  return result;
}

- (PGGraphUpdate)initWithPhotoLibrary:(id)a3
{
  return -[PGGraphUpdate initWithPhotoLibrary:updateType:](self, "initWithPhotoLibrary:updateType:", a3, 0);
}

- (PGGraphUpdate)initWithPhotoLibrary:(id)a3 updateType:(int64_t)a4
{
  return -[PGGraphUpdate initWithPhotoLibrary:updateType:changeStreamToken:](self, "initWithPhotoLibrary:updateType:changeStreamToken:", a3, a4, 0);
}

- (id)cachedDataModelObjectForGraphChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 9)
  {
    objc_msgSend(v4, "highlightUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 192;
  }
  else
  {
    if (v5 != 3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "momentUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 120;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (BOOL)hasAnythingToDo
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  BOOL v6;

  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  v3 = -[PGGraphUpdate hasMomentsToInsert](self, "hasMomentsToInsert")
    || -[PGGraphUpdate hasMomentsToDelete](self, "hasMomentsToDelete")
    || -[PGGraphUpdate hasMomentsToUpdate](self, "hasMomentsToUpdate");
  v4 = -[PGGraphUpdate hasHighlightsToInsert](self, "hasHighlightsToInsert")
    || -[PGGraphUpdate hasHighlightsToDelete](self, "hasHighlightsToDelete")
    || -[PGGraphUpdate hasHighlightsToUpdate](self, "hasHighlightsToUpdate");
  v5 = -[PGGraphUpdate hasPersonsToDelete](self, "hasPersonsToDelete")
    || -[PGGraphUpdate hasPersonsToInsert](self, "hasPersonsToInsert")
    || -[PGGraphUpdate hasPersonsToUpdate](self, "hasPersonsToUpdate");
  v6 = -[PGGraphUpdate hasSocialGroupsToDelete](self, "hasSocialGroupsToDelete")
    || -[PGGraphUpdate hasSocialGroupsToInsert](self, "hasSocialGroupsToInsert")
    || -[PGGraphUpdate hasSocialGroupsToUpdate](self, "hasSocialGroupsToUpdate");
  return v4 || v3 || v5 || v6;
}

- (BOOL)isSignificant
{
  return 1;
}

- (NSSet)uuidsOfMomentsToInsert
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_uuidsOfMomentsToInsert);
}

- (NSSet)uuidsOfMomentsToDelete
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_uuidsOfMomentsToDelete);
}

- (NSSet)uuidsOfMomentsToUpdate
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_uuidsOfMomentsToUpdate);
}

- (NSSet)localIdentifiersOfPersonsToInsert
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_localIdentifiersOfPersonsToInsert);
}

- (NSSet)localIdentifiersOfPersonsToDelete
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_localIdentifiersOfPersonsToDelete);
}

- (NSSet)localIdentifiersOfPersonsToUpdate
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_localIdentifiersOfPersonsToUpdate);
}

- (NSSet)contactIdentifiersOfPersonsToUpdate
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_contactIdentifiersOfPersonsToUpdate);
}

- (BOOL)hasMomentsToInsert
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_uuidsOfMomentsToInsert, "count") != 0;
}

- (BOOL)hasMomentsToDelete
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_uuidsOfMomentsToDelete, "count") != 0;
}

- (BOOL)hasMomentsToUpdate
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_uuidsOfMomentsToUpdate, "count") != 0;
}

- (BOOL)hasPersonsToInsert
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_localIdentifiersOfPersonsToInsert, "count") != 0;
}

- (BOOL)hasPersonsToDelete
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_localIdentifiersOfPersonsToDelete, "count") != 0;
}

- (BOOL)hasPersonsToUpdate
{
  NSUInteger v3;

  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  v3 = -[NSSet count](self->_localIdentifiersOfPersonsToUpdate, "count");
  return v3 + -[NSSet count](self->_contactIdentifiersOfPersonsToUpdate, "count") != 0;
}

- (BOOL)hasUpdatedPersonNodes
{
  void *v2;
  BOOL v3;

  -[PGGraphUpdate insertedAndUpdatedPersonNodes](self, "insertedAndUpdatedPersonNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasUpdatedPersonNodesUnrelatedToMomentChange
{
  void *v2;
  BOOL v3;

  -[PGGraphUpdate updatedPersonNodesUnrelatedToMomentChange](self, "updatedPersonNodesUnrelatedToMomentChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasSocialGroupsToInsert
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_uuidsOfSocialGroupsToInsert, "count") != 0;
}

- (BOOL)hasSocialGroupsToDelete
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_uuidsOfSocialGroupsToDelete, "count") != 0;
}

- (BOOL)hasSocialGroupsToUpdate
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_uuidsOfSocialGroupsToUpdate, "count") != 0;
}

- (unint64_t)momentUpdateTypes
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return self->_momentUpdateTypes;
}

- (NSSet)momentsToIngest
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return self->_momentsToIngest;
}

- (BOOL)didProcessNodes
{
  BOOL v3;
  BOOL v4;
  BOOL v5;

  v3 = -[PGGraphUpdate hasDeletedMomentNodes](self, "hasDeletedMomentNodes")
    || -[PGGraphUpdate hasInsertedMomentNodes](self, "hasInsertedMomentNodes")
    || -[PGGraphUpdate hasUpdatedMomentNodes](self, "hasUpdatedMomentNodes");
  v4 = -[PGGraphUpdate hasDeletedHighlightNodes](self, "hasDeletedHighlightNodes")
    || -[PGGraphUpdate hasInsertedHighlightNodes](self, "hasInsertedHighlightNodes")
    || -[PGGraphUpdate hasUpdatedHighlightNodes](self, "hasUpdatedHighlightNodes");
  v5 = -[PGGraphUpdate hasDeletedPersonNodes](self, "hasDeletedPersonNodes")
    || -[PGGraphUpdate hasUpdatedPersonNodes](self, "hasUpdatedPersonNodes");
  return v3 || v5 || v4;
}

- (BOOL)hasInsertedMomentNodes
{
  return -[NSSet count](self->_insertedMomentNodes, "count") != 0;
}

- (BOOL)hasUpdatedMomentNodes
{
  return -[NSMutableDictionary count](self->_updateMomentNodesByUpdateType, "count") != 0;
}

- (BOOL)hasInsertedHighlightNodes
{
  return -[NSSet count](self->_insertedHighlightNodes, "count") != 0;
}

- (BOOL)hasUpdatedHighlightNodes
{
  return -[NSMutableDictionary count](self->_updateHighlightNodesByUpdateType, "count") != 0;
}

- (BOOL)didSocialGroupsChanges
{
  return -[PGGraphUpdate hasSocialGroupsToDelete](self, "hasSocialGroupsToDelete")
      || -[PGGraphUpdate hasSocialGroupsToInsert](self, "hasSocialGroupsToInsert")
      || -[PGGraphUpdate hasSocialGroupsToUpdate](self, "hasSocialGroupsToUpdate");
}

- (void)addChange:(id)a3
{
  NSSet *consolidatedChanges;

  -[NSMutableArray addObject:](self->_inputChanges, "addObject:", a3);
  consolidatedChanges = self->_consolidatedChanges;
  self->_consolidatedChanges = 0;

}

- (void)addChanges:(id)a3
{
  NSSet *consolidatedChanges;

  -[NSMutableArray addObjectsFromArray:](self->_inputChanges, "addObjectsFromArray:", a3);
  consolidatedChanges = self->_consolidatedChanges;
  self->_consolidatedChanges = 0;

}

- (void)prepareForPostProcessingWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSSet *v19;
  NSSet *momentsToIngest;
  NSSet *v21;
  NSSet *v22;
  NSSet *uuidsOfMomentsToInsert;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PGGraphUpdate isResumingFullAnalysis](self, "isResumingFullAnalysis"))
  {
    v5 = (void *)MEMORY[0x1CAA4EB2C]();
    -[PGGraphUpdate momentsToIngest](self, "momentsToIngest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuids");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "count");
    if (v10 != objc_msgSend(v9, "count"))
    {
      v24 = v5;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15), "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "removeObject:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
      }

      v5 = v24;
      if (objc_msgSend(v9, "count"))
      {
        v17 = (void *)MEMORY[0x1E0C99E20];
        -[PGGraphUpdate _fetchMomentsWithUUIDs:](self, "_fetchMomentsWithUUIDs:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setWithSet:", v18);
        v19 = (NSSet *)objc_claimAutoreleasedReturnValue();

        -[NSSet unionSet:](v19, "unionSet:", v11);
        momentsToIngest = self->_momentsToIngest;
        self->_momentsToIngest = v19;
        v21 = v19;

        objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_uuidsOfMomentsToInsert);
        v22 = (NSSet *)objc_claimAutoreleasedReturnValue();
        -[NSSet unionSet:](v22, "unionSet:", v9);
        uuidsOfMomentsToInsert = self->_uuidsOfMomentsToInsert;
        self->_uuidsOfMomentsToInsert = v22;

      }
    }

    objc_autoreleasePoolPop(v5);
  }

}

- (void)_registerMoments:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_momentByMomentUUID, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_unregisterMomentsForMomentUUIDs:(id)a3
{
  NSMutableDictionary *momentByMomentUUID;
  void *v5;
  id v6;

  momentByMomentUUID = self->_momentByMomentUUID;
  v6 = a3;
  objc_msgSend(v6, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](momentByMomentUUID, "removeObjectsForKeys:", v5);

  -[NSMutableSet unionSet:](self->_deletedMomentUUIDsForValidityCheck, "unionSet:", v6);
}

- (void)_consolidate
{
  id v3;
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSSet *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSSet *v42;
  NSSet *consolidatedChanges;
  void *v44;
  id v45;
  NSSet *v46;
  NSSet *momentsToIngest;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  NSMutableDictionary *highlightsToInsertByHighlightKind;
  void *v57;
  void *v58;
  NSMutableDictionary *v59;
  void *v60;
  id v61;
  NSSet *uuidsOfSocialGroupsToInsert;
  NSSet *v63;
  NSSet *uuidsOfSocialGroupsToDelete;
  NSSet *v65;
  NSSet *uuidsOfSocialGroupsToUpdate;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id obj;
  id v73;
  unint64_t v74;
  id v75;
  NSSet *v76;
  NSSet *v77;
  NSSet *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[16];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v80 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v70 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v68 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v83 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  obj = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v71 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v85 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v82 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v69 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v76 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v77 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v78 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v73 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v5 = self->_inputChanges;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
  v79 = v4;
  if (v6)
  {
    v7 = v6;
    v74 = 0;
    v8 = *(_QWORD *)v92;
LABEL_3:
    v9 = 0;
    while (2)
    {
      if (*(_QWORD *)v92 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v9);
      switch(objc_msgSend(v10, "type"))
      {
        case 0:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown change type in graph update", buf, 2u);
          }
          goto LABEL_38;
        case 1:
          v23 = v10;
          objc_msgSend(v23, "momentUUIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "allObjects");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeObjectsForKeys:", v24);

          objc_msgSend(v3, "unionSet:", v12);
          objc_msgSend(v23, "moments");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          -[PGGraphUpdate _registerMoments:](self, "_registerMoments:", v25);
          goto LABEL_24;
        case 2:
          objc_msgSend(v10, "momentUUIDs");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "unionSet:", v14);
          objc_msgSend(v14, "allObjects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeObjectsForKeys:", v15);

          -[PGGraphUpdate _unregisterMomentsForMomentUUIDs:](self, "_unregisterMomentsForMomentUUIDs:", v14);
          goto LABEL_33;
        case 3:
          v14 = v10;
          objc_msgSend(v14, "momentUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v3, "containsObject:", v26) & 1) != 0
            || (objc_msgSend(v80, "containsObject:", v26) & 1) != 0)
          {
            goto LABEL_32;
          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v26);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            v27 = v14;
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v26);
            objc_msgSend(v70, "addObject:", v26);
          }
          objc_msgSend(v27, "mergeChange:", v14);
          v74 |= objc_msgSend(v14, "updateTypes");
          goto LABEL_31;
        case 5:
          objc_msgSend(v10, "personLocalIdentifiers");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "unionSet:", v14);
          objc_msgSend(v14, "allObjects");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeObjectsForKeys:", v26);
          goto LABEL_32;
        case 6:
          v16 = v3;
          v17 = v10;
          objc_msgSend(v17, "personLocalIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "contactIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "length"))
          {
            if ((objc_msgSend(v83, "containsObject:", v18) & 1) != 0)
              goto LABEL_45;
            objc_msgSend(v79, "objectForKeyedSubscript:", v18);
            v20 = (id)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {
              v20 = v17;
              objc_msgSend(v79, "setObject:forKeyedSubscript:", v20, v18);
              v21 = obj;
              v22 = v18;
LABEL_43:
              objc_msgSend(v21, "addObject:", v22);
            }
          }
          else
          {
            if (!objc_msgSend(v19, "length"))
              goto LABEL_45;
            objc_msgSend(v73, "objectForKeyedSubscript:", v19);
            v20 = (id)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {
              v20 = v17;
              objc_msgSend(v73, "setObject:forKeyedSubscript:", v20, v19);
              v21 = v71;
              v22 = v19;
              goto LABEL_43;
            }
          }
          objc_msgSend(v20, "mergeChange:", v17);

LABEL_45:
          v3 = v16;
          v4 = v79;
LABEL_38:
          if (v7 != ++v9)
            continue;
          v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
          v7 = v31;
          if (!v31)
            goto LABEL_49;
          goto LABEL_3;
        case 7:
          v28 = v10;
          objc_msgSend(v28, "highlightUUIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "allObjects");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeObjectsForKeys:", v29);

          objc_msgSend(v85, "unionSet:", v12);
          objc_msgSend(v28, "highlights");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          -[PGGraphUpdate _registerHighlights:](self, "_registerHighlights:", v25);
LABEL_24:

          goto LABEL_37;
        case 8:
          objc_msgSend(v10, "highlightUUIDs");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "unionSet:", v14);
          objc_msgSend(v14, "allObjects");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeObjectsForKeys:", v30);

          -[PGGraphUpdate _unregisterHighlightsForHighlightUUIDs:](self, "_unregisterHighlightsForHighlightUUIDs:", v14);
          goto LABEL_33;
        case 9:
          v14 = v10;
          objc_msgSend(v14, "highlightUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v85, "containsObject:", v26) & 1) != 0
            || (objc_msgSend(v82, "containsObject:", v26) & 1) != 0)
          {
            goto LABEL_32;
          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v26);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            v27 = v14;
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v26);
            objc_msgSend(v69, "addObject:", v26);
          }
          objc_msgSend(v27, "mergeChange:", v14);
LABEL_31:

LABEL_32:
LABEL_33:

          goto LABEL_38;
        case 10:
          v11 = v10;
          objc_msgSend(v11, "socialGroupUUIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v76;
          goto LABEL_35;
        case 11:
          v11 = v10;
          objc_msgSend(v11, "socialGroupUUIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v77;
LABEL_35:
          -[NSSet unionSet:](v13, "unionSet:", v12);
          goto LABEL_36;
        case 12:
          v11 = v10;
          objc_msgSend(v11, "socialGroupUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v78, "addObject:", v12);
LABEL_36:

LABEL_37:
          goto LABEL_38;
        default:
          goto LABEL_38;
      }
    }
  }
  v74 = 0;
LABEL_49:

  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "count"))
  {
    v33 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v4, "allValues");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "arrayWithArray:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObjectsFromArray:", v35);

  }
  v36 = v73;
  v38 = v69;
  v37 = v70;
  if (objc_msgSend(v73, "count"))
  {
    v39 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v73, "allValues");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "arrayWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObjectsFromArray:", v41);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v32);
  v42 = (NSSet *)objc_claimAutoreleasedReturnValue();
  consolidatedChanges = self->_consolidatedChanges;
  self->_consolidatedChanges = v42;

  v44 = (void *)objc_msgSend(v80, "mutableCopy");
  objc_msgSend(v44, "minusSet:", v3);
  objc_msgSend(v3, "minusSet:", v80);
  v45 = v44;

  objc_storeStrong((id *)&self->_uuidsOfMomentsToInsert, v3);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToDelete, v44);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToUpdate, v70);
  self->_momentUpdateTypes = v74;
  if (objc_msgSend(v3, "count"))
    -[PGGraphUpdate _fetchMomentsWithUUIDs:](self, "_fetchMomentsWithUUIDs:", v3);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v46 = (NSSet *)objc_claimAutoreleasedReturnValue();
  momentsToIngest = self->_momentsToIngest;
  self->_momentsToIngest = v46;

  if (v70 && objc_msgSend(v70, "count"))
    v48 = -[PGGraphUpdate _fetchMomentsWithUUIDs:](self, "_fetchMomentsWithUUIDs:", v70);
  v49 = (void *)objc_msgSend(v83, "mutableCopy");
  objc_msgSend(v49, "minusSet:", v68);
  objc_msgSend(v68, "minusSet:", v83);
  v81 = v49;

  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToInsert, v68);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToDelete, v49);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToUpdate, obj);
  objc_storeStrong((id *)&self->_contactIdentifiersOfPersonsToUpdate, v71);
  -[PGGraphUpdate clearInsertedAndUpdatedPersonNodes](self, "clearInsertedAndUpdatedPersonNodes");
  -[PGGraphUpdate clearUpdatedPersonNodesUnrelatedToMomentChange](self, "clearUpdatedPersonNodesUnrelatedToMomentChange");
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToInsert, v85);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToDelete, v82);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToUpdate, v69);
  if (objc_msgSend(v85, "count"))
  {
    v67 = v45;
    v75 = v32;
    v84 = v3;
    -[PGGraphUpdate _fetchedHighlightsWithHighlightUUIDs:](self, "_fetchedHighlightsWithHighlightUUIDs:", v85);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v87 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
          highlightsToInsertByHighlightKind = self->_highlightsToInsertByHighlightKind;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v55, "kind"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](highlightsToInsertByHighlightKind, "objectForKeyedSubscript:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v58)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = self->_highlightsToInsertByHighlightKind;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v55, "kind"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v58, v60);

          }
          objc_msgSend(v58, "addObject:", v55);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      }
      while (v52);
    }

    v3 = v84;
    v38 = v69;
    v37 = v70;
    v36 = v73;
    v32 = v75;
    v45 = v67;
  }
  if (v38 && objc_msgSend(v38, "count"))
    v61 = -[PGGraphUpdate _fetchedHighlightsWithHighlightUUIDs:](self, "_fetchedHighlightsWithHighlightUUIDs:", v38);
  uuidsOfSocialGroupsToInsert = self->_uuidsOfSocialGroupsToInsert;
  self->_uuidsOfSocialGroupsToInsert = v76;
  v63 = v76;

  uuidsOfSocialGroupsToDelete = self->_uuidsOfSocialGroupsToDelete;
  self->_uuidsOfSocialGroupsToDelete = v77;
  v65 = v77;

  uuidsOfSocialGroupsToUpdate = self->_uuidsOfSocialGroupsToUpdate;
  self->_uuidsOfSocialGroupsToUpdate = v78;

}

- (id)_fetchMomentsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_momentByMomentUUID, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = v5;
          v16 = v14;
        }
        else
        {
          v15 = v7;
          v16 = v13;
        }
        objc_msgSend(v15, "addObject:", v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid in %@"), v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInternalPredicate:", v18);

    objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentsWithOptions:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphUpdate _registerMoments:](self, "_registerMoments:", v19);
    objc_msgSend(v19, "fetchedObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v20);

  }
  objc_autoreleasePoolPop(v6);

  return v5;
}

- (void)_consolidateIfNeeded
{
  PGGraphUpdate *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_consolidatedChanges)
    -[PGGraphUpdate _consolidate](obj, "_consolidate");
  objc_sync_exit(obj);

}

- (unint64_t)numberOfConsolidatedChanges
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_consolidatedChanges, "count");
}

- (void)enumerateConsolidatedChanges:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_consolidatedChanges;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)updatedMomentNode:(id)a3 forUpdateChangeType:(unint64_t)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *updateMomentNodesByUpdateType;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = self->_updateMomentNodesByUpdateType;
  objc_sync_enter(v6);
  updateMomentNodesByUpdateType = self->_updateMomentNodesByUpdateType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](updateMomentNodesByUpdateType, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_updateMomentNodesByUpdateType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  objc_msgSend(v9, "addObject:", v12);

  objc_sync_exit(v6);
}

- (void)updatedHighlightNode:(id)a3 forUpdateChangeType:(unint64_t)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *updateHighlightNodesByUpdateType;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = self->_updateHighlightNodesByUpdateType;
  objc_sync_enter(v6);
  updateHighlightNodesByUpdateType = self->_updateHighlightNodesByUpdateType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](updateHighlightNodesByUpdateType, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_updateHighlightNodesByUpdateType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  objc_msgSend(v9, "addObject:", v12);

  objc_sync_exit(v6);
}

- (NSString)description
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  void *v38;
  objc_super v40;
  _QWORD v41[4];
  id v42;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __28__PGGraphUpdate_description__block_invoke;
  v41[3] = &unk_1E842F4E8;
  v4 = v3;
  v42 = v4;
  -[PGGraphUpdate enumerateConsolidatedChanges:](self, "enumerateConsolidatedChanges:", v41);
  if (-[NSSet count](self->_consolidatedChanges, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%@]"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  -[PGGraphUpdate localIdentifiersOfPersonsToDelete](self, "localIdentifiersOfPersonsToDelete");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[PGGraphUpdate localIdentifiersOfPersonsToDelete](self, "localIdentifiersOfPersonsToDelete");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\nPersons to delete:\n%@"), v8);

  }
  -[PGGraphUpdate localIdentifiersOfPersonsToInsert](self, "localIdentifiersOfPersonsToInsert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[PGGraphUpdate localIdentifiersOfPersonsToInsert](self, "localIdentifiersOfPersonsToInsert");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\nPersons to insert:\n%@"), v11);

  }
  -[PGGraphUpdate uuidsOfHighlightsToDelete](self, "uuidsOfHighlightsToDelete");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    -[PGGraphUpdate uuidsOfHighlightsToDelete](self, "uuidsOfHighlightsToDelete");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\nHighlights to delete:\n%@"), v14);

  }
  -[PGGraphUpdate uuidsOfHighlightsToInsert](self, "uuidsOfHighlightsToInsert");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[PGGraphUpdate uuidsOfHighlightsToInsert](self, "uuidsOfHighlightsToInsert");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\nHighlights to insert:\n%@"), v17);

  }
  -[PGGraphUpdate uuidsOfMomentsToDelete](self, "uuidsOfMomentsToDelete");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[PGGraphUpdate uuidsOfMomentsToDelete](self, "uuidsOfMomentsToDelete");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\nMoments to delete:\n%@"), v20);

  }
  -[PGGraphUpdate uuidsOfMomentsToInsert](self, "uuidsOfMomentsToInsert");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    -[PGGraphUpdate uuidsOfMomentsToInsert](self, "uuidsOfMomentsToInsert");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\nMoments to insert:\n%@"), v23);

  }
  if (-[PGGraphUpdate hasAnythingToDo](self, "hasAnythingToDo"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("- [Moment]\tinserts: %ld\tdeletes: %ld\tupdates: %ld\n"), -[NSSet count](self->_momentsToIngest, "count"), -[NSSet count](self->_uuidsOfMomentsToDelete, "count"), -[NSSet count](self->_uuidsOfMomentsToUpdate, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB3940];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_highlightsToInsertByHighlightKind, "objectForKeyedSubscript:", &unk_1E84E45C8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("- [Highlight]\tinserts: %ld\tdeletes: %ld\tupdates: %ld\n"), objc_msgSend(v26, "count"), -[NSSet count](self->_uuidsOfHighlightsToDelete, "count"), -[NSSet count](self->_uuidsOfHighlightsToUpdate, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("- [Person]\tinserts: %ld\tdeletes: %ld\tupdates: %ld\n"), -[NSSet count](self->_localIdentifiersOfPersonsToInsert, "count"), -[NSSet count](self->_localIdentifiersOfPersonsToDelete, "count"), -[NSSet count](self->_contactIdentifiersOfPersonsToUpdate, "count")+ -[NSSet count](self->_localIdentifiersOfPersonsToUpdate, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("- [SocialGroup]\tinserts: %ld\tdeletes: %ld\tupdates: %ld\n"), -[NSSet count](self->_uuidsOfSocialGroupsToInsert, "count"), -[NSSet count](self->_uuidsOfSocialGroupsToDelete, "count"), -[NSSet count](self->_uuidsOfSocialGroupsToUpdate, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@"), v24, v27, v28, v29);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = &stru_1E8436F28;
  }
  -[PGGraphUpdate consolidatedChanges](self, "consolidatedChanges");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Consolidate changes: %ld\n"), -[NSSet count](self->_consolidatedChanges, "count"));
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = &stru_1E8436F28;
  }
  v34 = (void *)MEMORY[0x1E0CB3940];
  v40.receiver = self;
  v40.super_class = (Class)PGGraphUpdate;
  -[PGGraphUpdate description](&v40, sel_description);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGGraphUpdate isResumingFullAnalysis](self, "isResumingFullAnalysis"))
    v36 = CFSTR("YES");
  else
    v36 = CFSTR("NO");
  if (-[PGGraphUpdate hasAnythingToDo](self, "hasAnythingToDo"))
    v37 = CFSTR("YES");
  else
    v37 = CFSTR("NO");
  objc_msgSend(v34, "stringWithFormat:", CFSTR("%@\nResuming full analysis: %@\nHas anything to do: %@\n%@%@%@"), v35, v36, v37, v33, v30, v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v38;
}

- (id)momentsToProcessForMomentUpdateTypes:(unint64_t)a3 includeMomentsToIngest:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  PGGraphUpdate *v24;
  id v25;
  id v26;
  unint64_t v27;
  uint8_t buf[16];

  v4 = a4;
  if (!self->_consolidatedChanges && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - expected GraphUpdate instance to be consolidated before this method is called.", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PGGraphUpdate momentsToIngest](self, "momentsToIngest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v8);

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __77__PGGraphUpdate_momentsToProcessForMomentUpdateTypes_includeMomentsToIngest___block_invoke;
  v23 = &unk_1E842F510;
  v27 = a3;
  v24 = self;
  v10 = v7;
  v25 = v10;
  v11 = v9;
  v26 = v11;
  -[PGGraphUpdate enumerateConsolidatedChanges:](self, "enumerateConsolidatedChanges:", &v20);
  if (objc_msgSend(v11, "count", v20, v21, v22, v23, v24))
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CD1670];
    objc_msgSend(v11, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchAssetCollectionsWithLocalIdentifiers:options:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    -[PGGraphUpdate _registerMoments:](self, "_registerMoments:", v15);
    objc_msgSend(v15, "fetchedObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v16);

    goto LABEL_12;
  }
  if (-[PGGraphUpdate isResumingFullAnalysis](self, "isResumingFullAnalysis")
    && -[PGGraphUpdate updateType](self, "updateType") == 4)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentsWithOptions:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_12:
  v17 = v26;
  v18 = v10;

  return v18;
}

- (id)momentNodesToProcessInGraph:(id)a3 forMomentUpdateTypes:(unint64_t)a4 includeInsertedNodes:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  PGGraphMomentNodeCollection *v9;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (-[PGGraphUpdate isResumingFullAnalysis](self, "isResumingFullAnalysis"))
  {
    objc_msgSend(v8, "momentNodes");
    v9 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = v10;
    if (v5)
      objc_msgSend(v10, "unionSet:", self->_insertedMomentNodes);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = self->_updateMomentNodesByUpdateType;
    v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((objc_msgSend(v17, "unsignedIntegerValue", (_QWORD)v20) & a4) != 0)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_updateMomentNodesByUpdateType, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObjectsFromArray:", v18);

          }
        }
        v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    v9 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v11, v8);
  }

  return v9;
}

- (void)registerLocationOfInterestVisitToResolve:(id)a3 forMomentUUID:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredLocationOfInterestVisitsToResolveByMomentUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredLocationOfInterestVisitsToResolveByMomentUUID, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (void)registerPublicEventNode:(id)a3 withConsolidatedAddress:(id)a4 toResolveBusinessItemMuid:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  PGResolvablePublicEventBusinessItem *v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithUnsignedLongLong:", a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = -[PGResolvablePublicEventBusinessItem initWithPublicEventNode:consolidatedAddress:businessItemMuid:]([PGResolvablePublicEventBusinessItem alloc], "initWithPublicEventNode:consolidatedAddress:businessItemMuid:", v10, v9, a5);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredResolvableItemsByBusinessItemMuid, "objectForKeyedSubscript:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredResolvableItemsByBusinessItemMuid, "setObject:forKeyedSubscript:", v12, v13);
  }
  objc_msgSend(v12, "addObject:", v11);

}

- (void)registerInsertedAndUpdatedPersonNodes:(id)a3
{
  NSSet *insertedAndUpdatedPersonNodes;
  NSSet *v5;
  NSSet *v6;

  insertedAndUpdatedPersonNodes = self->_insertedAndUpdatedPersonNodes;
  if (insertedAndUpdatedPersonNodes)
  {
    -[NSSet setByAddingObjectsFromSet:](insertedAndUpdatedPersonNodes, "setByAddingObjectsFromSet:", a3);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (NSSet *)objc_msgSend(a3, "copy");
  }
  v6 = self->_insertedAndUpdatedPersonNodes;
  self->_insertedAndUpdatedPersonNodes = v5;

}

- (void)registerUpdatedPersonNodesUnrelatedToMomentChange:(id)a3
{
  NSSet *updatedPersonNodesUnrelatedToMomentChange;
  NSSet *v5;
  NSSet *v6;

  updatedPersonNodesUnrelatedToMomentChange = self->_updatedPersonNodesUnrelatedToMomentChange;
  if (updatedPersonNodesUnrelatedToMomentChange)
  {
    -[NSSet setByAddingObjectsFromSet:](updatedPersonNodesUnrelatedToMomentChange, "setByAddingObjectsFromSet:", a3);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (NSSet *)objc_msgSend(a3, "copy");
  }
  v6 = self->_updatedPersonNodesUnrelatedToMomentChange;
  self->_updatedPersonNodesUnrelatedToMomentChange = v5;

}

- (void)clearInsertedAndUpdatedPersonNodes
{
  NSSet *v3;
  NSSet *insertedAndUpdatedPersonNodes;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  insertedAndUpdatedPersonNodes = self->_insertedAndUpdatedPersonNodes;
  self->_insertedAndUpdatedPersonNodes = v3;

}

- (void)clearUpdatedPersonNodesUnrelatedToMomentChange
{
  NSSet *v3;
  NSSet *updatedPersonNodesUnrelatedToMomentChange;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  updatedPersonNodesUnrelatedToMomentChange = self->_updatedPersonNodesUnrelatedToMomentChange;
  self->_updatedPersonNodesUnrelatedToMomentChange = v3;

}

- (NSSet)uuidsOfHighlightsToInsert
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return self->_uuidsOfHighlightsToInsert;
}

- (NSSet)uuidsOfHighlightsToDelete
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return self->_uuidsOfHighlightsToDelete;
}

- (BOOL)hasHighlightsToInsert
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_uuidsOfHighlightsToInsert, "count") != 0;
}

- (BOOL)hasHighlightsToDelete
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_uuidsOfHighlightsToDelete, "count") != 0;
}

- (BOOL)hasHighlightsToUpdate
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return -[NSSet count](self->_uuidsOfHighlightsToUpdate, "count") != 0;
}

- (NSSet)highlightDaysToIngest
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return (NSSet *)-[NSMutableDictionary objectForKeyedSubscript:](self->_highlightsToInsertByHighlightKind, "objectForKeyedSubscript:", &unk_1E84E45C8);
}

- (NSSet)highlightDayGroupsToIngest
{
  -[PGGraphUpdate _consolidateIfNeeded](self, "_consolidateIfNeeded");
  return (NSSet *)-[NSMutableDictionary objectForKeyedSubscript:](self->_highlightsToInsertByHighlightKind, "objectForKeyedSubscript:", &unk_1E84E45E0);
}

- (BOOL)hasHighlightDayGroupsToInsert
{
  void *v2;
  BOOL v3;

  -[PGGraphUpdate highlightDayGroupsToIngest](self, "highlightDayGroupsToIngest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_registerHighlights:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_highlightByHighlightUUID, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_unregisterHighlightsForHighlightUUIDs:(id)a3
{
  NSMutableDictionary *highlightByHighlightUUID;
  void *v5;
  id v6;

  highlightByHighlightUUID = self->_highlightByHighlightUUID;
  v6 = a3;
  objc_msgSend(v6, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](highlightByHighlightUUID, "removeObjectsForKeys:", v5);

  -[NSMutableSet unionSet:](self->_deletedHighlightUUIDsForValidityCheck, "unionSet:", v6);
}

- (id)highlightForHighlightUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_highlightByHighlightUUID, "objectForKeyedSubscript:", a3);
}

- (id)_fetchedHighlightsWithHighlightUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_highlightByHighlightUUID, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = v5;
          v16 = v14;
        }
        else
        {
          v15 = v7;
          v16 = v13;
        }
        objc_msgSend(v15, "addObject:", v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid in %@"), v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInternalPredicate:", v18);

    objc_msgSend(MEMORY[0x1E0CD1708], "fetchHighlightsWithOptions:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphUpdate _registerHighlights:](self, "_registerHighlights:", v19);
    objc_msgSend(v19, "fetchedObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v20);

  }
  objc_autoreleasePoolPop(v6);

  return v5;
}

- (id)highlightsToProcessForKind:(unsigned __int16)a3 withHighlightUpdateTypes:(unint64_t)a4 includeHighlightsToIngest:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  void *v9;
  id v10;
  NSMutableDictionary *highlightsToInsertByHighlightKind;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  PGGraphUpdate *v25;
  id v26;
  unint64_t v27;
  __int16 v28;

  v5 = a5;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __95__PGGraphUpdate_highlightsToProcessForKind_withHighlightUpdateTypes_includeHighlightsToIngest___block_invoke;
  v24 = &unk_1E842F538;
  v27 = a4;
  v25 = self;
  v28 = v7;
  v10 = v9;
  v26 = v10;
  -[PGGraphUpdate enumerateConsolidatedChanges:](self, "enumerateConsolidatedChanges:", &v21);
  if (v5)
  {
    highlightsToInsertByHighlightKind = self->_highlightsToInsertByHighlightKind;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7, v21, v22, v23, v24, v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](highlightsToInsertByHighlightKind, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
      objc_msgSend(v10, "unionSet:", v13);

  }
  if (-[PGGraphUpdate isResumingFullAnalysis](self, "isResumingFullAnalysis", v21, v22, v23, v24, v25)
    && -[PGGraphUpdate updateType](self, "updateType") == 4)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v7)
      v15 = 1000000304;
    else
      v15 = 1000000301;
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphUpdate _registerHighlights:](self, "_registerHighlights:", v16);
    objc_msgSend(v16, "fetchedObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v17);

  }
  v18 = v26;
  v19 = v10;

  return v19;
}

- (NSSet)identifiersForMomentRelatedToUpdatedPersons
{
  void *v2;
  void *v3;

  -[PGGraphUpdate relatedDetails](self, "relatedDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiersForMomentRelatedToUpdatedPersons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)identifiersForMomentRelatedToDeletedPersons
{
  void *v2;
  void *v3;

  -[PGGraphUpdate relatedDetails](self, "relatedDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiersForMomentRelatedToDeletedPersons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)identifiersForMemoriesRelatedToDeletedMoments
{
  void *v2;
  void *v3;

  -[PGGraphUpdate relatedDetails](self, "relatedDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiersForMemoriesRelatedToDeletedMoments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (BOOL)hasIncrementalChanges
{
  return self->_hasIncrementalChanges;
}

- (PHPersistentChangeToken)changeStreamToken
{
  return self->_changeStreamToken;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(int64_t)a3
{
  self->_updateType = a3;
}

- (NSMutableArray)inputChanges
{
  return self->_inputChanges;
}

- (NSSet)consolidatedChanges
{
  return self->_consolidatedChanges;
}

- (NSMutableDictionary)updateMomentNodesByUpdateType
{
  return self->_updateMomentNodesByUpdateType;
}

- (NSMutableDictionary)updateHighlightNodesByUpdateType
{
  return self->_updateHighlightNodesByUpdateType;
}

- (NSDictionary)registeredLocationOfInterestVisitsToResolveByMomentUUID
{
  return &self->_registeredLocationOfInterestVisitsToResolveByMomentUUID->super;
}

- (NSDictionary)registeredResolvableItemsByBusinessItemMuid
{
  return &self->_registeredResolvableItemsByBusinessItemMuid->super;
}

- (BOOL)isResumingFullAnalysis
{
  return self->_isResumingFullAnalysis;
}

- (void)setIsResumingFullAnalysis:(BOOL)a3
{
  self->_isResumingFullAnalysis = a3;
}

- (NSMutableDictionary)momentByMomentUUID
{
  return self->_momentByMomentUUID;
}

- (NSMutableSet)deletedMomentUUIDsForValidityCheck
{
  return self->_deletedMomentUUIDsForValidityCheck;
}

- (NSMutableSet)deletedHighlightUUIDsForValidityCheck
{
  return self->_deletedHighlightUUIDsForValidityCheck;
}

- (BOOL)hasDeletedMomentNodes
{
  return self->_hasDeletedMomentNodes;
}

- (void)setHasDeletedMomentNodes:(BOOL)a3
{
  self->_hasDeletedMomentNodes = a3;
}

- (BOOL)hasDeletedHighlightNodes
{
  return self->_hasDeletedHighlightNodes;
}

- (void)setHasDeletedHighlightNodes:(BOOL)a3
{
  self->_hasDeletedHighlightNodes = a3;
}

- (void)setHasUpdatedPersonNodes:(BOOL)a3
{
  self->_hasUpdatedPersonNodes = a3;
}

- (NSSet)insertedMomentNodes
{
  return self->_insertedMomentNodes;
}

- (void)setInsertedMomentNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSSet)additionalLocationsToPrefetch
{
  return self->_additionalLocationsToPrefetch;
}

- (void)setAdditionalLocationsToPrefetch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSSet)insertedAndUpdatedPersonNodes
{
  return self->_insertedAndUpdatedPersonNodes;
}

- (NSSet)updatedPersonNodesUnrelatedToMomentChange
{
  return self->_updatedPersonNodesUnrelatedToMomentChange;
}

- (NSMutableDictionary)highlightByHighlightUUID
{
  return self->_highlightByHighlightUUID;
}

- (NSMutableDictionary)highlightsToInsertByHighlightKind
{
  return self->_highlightsToInsertByHighlightKind;
}

- (NSMutableSet)uuidsOfDeletedHighlights
{
  return self->_uuidsOfDeletedHighlights;
}

- (NSSet)uuidsOfSocialGroupsToInsert
{
  return self->_uuidsOfSocialGroupsToInsert;
}

- (NSSet)uuidsOfSocialGroupsToDelete
{
  return self->_uuidsOfSocialGroupsToDelete;
}

- (NSSet)uuidsOfSocialGroupsToUpdate
{
  return self->_uuidsOfSocialGroupsToUpdate;
}

- (PGGraphUpdateRelatedDetails)relatedDetails
{
  return self->_relatedDetails;
}

- (BOOL)hasDeletedPersonNodes
{
  return self->_hasDeletedPersonNodes;
}

- (void)setHasDeletedPersonNodes:(BOOL)a3
{
  self->_hasDeletedPersonNodes = a3;
}

- (BOOL)hasInsertedSocialGroupNodes
{
  return self->_hasInsertedSocialGroupNodes;
}

- (BOOL)hasDeletedSocialGroupNodes
{
  return self->_hasDeletedSocialGroupNodes;
}

- (BOOL)hasUpdatedSocialGroupNodes
{
  return self->_hasUpdatedSocialGroupNodes;
}

- (NSSet)uuidsOfHighlightsToUpdate
{
  return self->_uuidsOfHighlightsToUpdate;
}

- (NSSet)insertedHighlightNodes
{
  return self->_insertedHighlightNodes;
}

- (void)setInsertedHighlightNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSSet)insertedHighlightDayGroupNodes
{
  return self->_insertedHighlightDayGroupNodes;
}

- (void)setInsertedHighlightDayGroupNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedHighlightDayGroupNodes, 0);
  objc_storeStrong((id *)&self->_insertedHighlightNodes, 0);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToUpdate, 0);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToDelete, 0);
  objc_storeStrong((id *)&self->_uuidsOfHighlightsToInsert, 0);
  objc_storeStrong((id *)&self->_relatedDetails, 0);
  objc_storeStrong((id *)&self->_uuidsOfSocialGroupsToUpdate, 0);
  objc_storeStrong((id *)&self->_uuidsOfSocialGroupsToDelete, 0);
  objc_storeStrong((id *)&self->_uuidsOfSocialGroupsToInsert, 0);
  objc_storeStrong((id *)&self->_contactIdentifiersOfPersonsToUpdate, 0);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToUpdate, 0);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToDelete, 0);
  objc_storeStrong((id *)&self->_localIdentifiersOfPersonsToInsert, 0);
  objc_storeStrong((id *)&self->_uuidsOfDeletedHighlights, 0);
  objc_storeStrong((id *)&self->_highlightsToInsertByHighlightKind, 0);
  objc_storeStrong((id *)&self->_highlightByHighlightUUID, 0);
  objc_storeStrong((id *)&self->_updatedPersonNodesUnrelatedToMomentChange, 0);
  objc_storeStrong((id *)&self->_insertedAndUpdatedPersonNodes, 0);
  objc_storeStrong((id *)&self->_additionalLocationsToPrefetch, 0);
  objc_storeStrong((id *)&self->_insertedMomentNodes, 0);
  objc_storeStrong((id *)&self->_momentsToIngest, 0);
  objc_storeStrong((id *)&self->_deletedHighlightUUIDsForValidityCheck, 0);
  objc_storeStrong((id *)&self->_deletedMomentUUIDsForValidityCheck, 0);
  objc_storeStrong((id *)&self->_momentByMomentUUID, 0);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToUpdate, 0);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToDelete, 0);
  objc_storeStrong((id *)&self->_uuidsOfMomentsToInsert, 0);
  objc_storeStrong((id *)&self->_updateHighlightNodesByUpdateType, 0);
  objc_storeStrong((id *)&self->_updateMomentNodesByUpdateType, 0);
  objc_storeStrong((id *)&self->_consolidatedChanges, 0);
  objc_storeStrong((id *)&self->_inputChanges, 0);
  objc_storeStrong((id *)&self->_changeStreamToken, 0);
  objc_storeStrong((id *)&self->_registeredResolvableItemsByBusinessItemMuid, 0);
  objc_storeStrong((id *)&self->_registeredLocationOfInterestVisitsToResolveByMomentUUID, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __95__PGGraphUpdate_highlightsToProcessForKind_withHighlightUpdateTypes_includeHighlightsToIngest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "type") == 9)
  {
    v4 = v3;
    if ((*(_QWORD *)(a1 + 48) & objc_msgSend(v4, "updateTypes")) != 0)
    {
      objc_msgSend(v4, "highlightUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "highlightForHighlightUUID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        if (objc_msgSend(v6, "kind") == *(unsigned __int16 *)(a1 + 56))
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v8 = 138412546;
        v9 = v5;
        v10 = 2112;
        v11 = v4;
        _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Consolidate can't find highlight UUID (%@) for change %@", (uint8_t *)&v8, 0x16u);
      }

    }
  }

}

void __77__PGGraphUpdate_momentsToProcessForMomentUpdateTypes_includeMomentsToIngest___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "type") == 3;
  v4 = v11;
  if (v3)
  {
    v5 = v11;
    if ((*(_QWORD *)(a1 + 56) & objc_msgSend(v5, "updateTypes")) != 0)
    {
      objc_msgSend(v5, "momentUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "momentByMomentUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
      }
      else
      {
        v9 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CD1670], "localIdentifierWithUUID:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

      }
    }

    v4 = v11;
  }

}

uint64_t __28__PGGraphUpdate_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\t[%@]"), a2);
}

@end

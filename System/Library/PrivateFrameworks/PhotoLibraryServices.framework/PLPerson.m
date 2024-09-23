@implementation PLPerson

- (BOOL)shouldIndexForSearch
{
  int v3;

  v3 = -[PLPerson verifiedType](self, "verifiedType");
  if (v3 != 1)
    LOBYTE(v3) = -[PLPerson verifiedType](self, "verifiedType") == 2;
  return v3;
}

+ (id)isEligibleForSearchIndexingPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d OR %K == %d"), CFSTR("verifiedType"), 1, CFSTR("verifiedType"), 2);
}

+ (void)enumerateAssetUUIDsForSearchIndexingWithPersonUUID:(id)a3 managedObjectContext:(id)a4 libraryIdentifier:(int64_t)a5 assetUUIDHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
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
  id v41;
  id v42;
  int64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint8_t v61[128];
  uint8_t buf[4];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(v9, "length");
  if (v11 && v10 && v12)
  {
    +[PLPerson fetchRequest](PLPerson, "fetchRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResultType:", 1);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("personUUID"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v14);

    v58 = 0;
    objc_msgSend(v10, "executeFetchRequest:error:", v13, &v58);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v58;
    objc_msgSend(v15, "firstObject");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
    {
      v43 = a5;
      v44 = (void *)v17;
      v45 = v16;
      v46 = v15;
      v47 = v13;
      v48 = v11;
      v49 = v10;
      objc_msgSend(v10, "deletedObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v20 = v19;
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v55 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v25, "entity");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLManagedAsset entityName](PLManagedAsset, "entityName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v27, "isEqualToString:", v28);

            if (v29)
            {
              v30 = v25;
              objc_msgSend(v30, "uuid");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
                objc_msgSend(v50, "addObject:", v31);

            }
          }
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
        }
        while (v22);
      }

      v18 = v44;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K.%K == %@ OR ANY %K.%K == %@"), CFSTR("detectedFaces"), CFSTR("personForFace"), v44, CFSTR("temporalDetectedFaces"), CFSTR("personForTemporalDetectedFaces"), v44);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", v43);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0C97B48];
      +[PLManagedAsset entityName](PLManagedAsset, "entityName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "fetchRequestWithEntityName:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "setResultType:", 2);
      v60[0] = CFSTR("objectID");
      v60[1] = CFSTR("uuid");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPropertiesToFetch:", v37);

      v38 = (void *)MEMORY[0x1E0CB3528];
      v59[0] = v32;
      v59[1] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "andPredicateWithSubpredicates:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPredicate:", v40);

      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __132__PLPerson_SearchIndex__enumerateAssetUUIDsForSearchIndexingWithPersonUUID_managedObjectContext_libraryIdentifier_assetUUIDHandler___block_invoke;
      v51[3] = &unk_1E366E728;
      v52 = v50;
      v11 = v48;
      v53 = v48;
      v41 = v50;
      v10 = v49;
      v42 = (id)objc_msgSend(v49, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v36, 0, v51);

      v15 = v46;
      v13 = v47;
      v16 = v45;
    }
    else
    {
      PLPhotosSearchGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v63 = v9;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Cannot find person with uuid: %{public}@", buf, 0xCu);
      }
    }

  }
}

+ (void)enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs:(id)a3 managedObjectContext:(id)a4 assetUUIDHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C97B48];
  v10 = a3;
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = CFSTR("assetForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", v13);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPredicate:", v14);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __121__PLPerson_SearchIndex__enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs_managedObjectContext_assetUUIDHandler___block_invoke;
  v17[3] = &unk_1E366E750;
  v18 = v8;
  v15 = v8;
  v16 = (id)objc_msgSend(v7, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v12, 0, v17);

}

void __121__PLPerson_SearchIndex__enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs_managedObjectContext_assetUUIDHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "assetForFace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, uint64_t, uint64_t))(v9 + 16))(v9, v10, v11, a3, a4);

  }
}

void __132__PLPerson_SearchIndex__enumerateAssetUUIDsForSearchIndexingWithPersonUUID_managedObjectContext_libraryIdentifier_assetUUIDHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKey:", CFSTR("uuid"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)payloadID
{
  void *v2;
  void *v3;

  -[PLPerson personUUID](self, "personUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLPersonJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLPerson isValidForPersistence](self, "isValidForPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLPersonJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("personUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return objc_msgSend(a3, "containsObject:", CFSTR("verifiedType"));
}

- (NSSet)allDetectedFaces
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLPerson detectedFaces](self, "detectedFaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PLPerson temporalDetectedFaces](self, "temporalDetectedFaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  v6 = (void *)objc_msgSend(v4, "copy");
  return (NSSet *)v6;
}

- (void)prepareForDeletion
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PLPerson;
  -[PLManagedObject prepareForDeletion](&v13, sel_prepareForDeletion);
  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19AEC0720]())
    +[PLGraphEdge registerDeletedObjectForDanglingReferenceCleanup:](PLGraphEdge, "registerDeletedObjectForDanglingReferenceCleanup:", self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "mergingChanges") & 1) == 0)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[PLPerson personUUID](self, "personUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "prepareForDeletion of person %{public}@", buf, 0xCu);

    }
    objc_msgSend(v3, "mergePolicy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v6, "isResolvingConflicts") & 1) == 0)
      && !-[PLPerson _personResetIsInProgress](self, "_personResetIsInProgress")
      && -[PLPerson verifiedType](self, "verifiedType") == 2
      && !self->_deleteReason)
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[PLPerson personUUID](self, "personUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v8;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Deleting graph person %{public}@ with unspecified reason in context %@", buf, 0x16u);

      }
    }
    -[PLPerson personUUID](self, "personUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PLManagedObject photoLibrary](self, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPerson removePersistedFileSystemDataWithPathManager:](self, "removePersistedFileSystemDataWithPathManager:", v12);

    }
    objc_msgSend(v3, "recordCloudDeletionForObject:", self);

  }
}

- (void)_removeSharedLibraryPeopleRulesForPerson
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("autoSharePolicy"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare sharesWithPredicate:fetchLimit:inManagedObjectContext:](PLLibraryScope, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[PLPerson personUUID](self, "personUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removePeopleRulesForPersonUUID:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (int64_t)cloudDeletionType
{
  return 4;
}

- (void)disconnectFaceGroup
{
  id v3;

  -[PLPerson associatedFaceGroup](self, "associatedFaceGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PLPerson verifiedType](self, "verifiedType") && v3)
  {
    -[PLPerson setAssociatedFaceGroup:](self, "setAssociatedFaceGroup:", 0);
    objc_msgSend((id)objc_opt_class(), "createAssociatedPersonForFaceGroup:", v3);
  }

}

- (void)createUnverifiedPersonForRejectedFaceUUIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "createUnverifiedPersonInManagedObjectContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C97B48];
    +[PLDetectedFace entityName](PLDetectedFace, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __78__PLPerson_createUnverifiedPersonForRejectedFaceUUIDs_inManagedObjectContext___block_invoke;
    v37[3] = &unk_1E36761A0;
    v37[4] = self;
    v14 = v8;
    v38 = v14;
    v15 = v13;
    v39 = v15;
    v16 = (id)objc_msgSend(v7, "enumerateObjectsFromFetchRequest:usingDefaultBatchSizeWithBlock:", v11, v37);
    if (objc_msgSend(v15, "count"))
    {
      v29 = v14;
      v30 = v11;
      v31 = v7;
      v32 = v6;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = 0;
        v22 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v17);
            v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "unsignedIntegerValue");

            if (v26 > v20)
            {
              v21 = objc_msgSend(v24, "shortValue");
              v20 = v26;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        }
        while (v19);
      }
      else
      {
        v21 = 0;
      }

      v14 = v29;
      objc_msgSend(v29, "setDetectionType:", v21);
      v7 = v31;
      v6 = v32;
      v11 = v30;
    }
    PLPhotoKitGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v14, "personUUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v28;
      v42 = 2114;
      v43 = v6;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_INFO, "Created unverified person %{public}@ for rejected face UUIDs %{public}@", buf, 0x16u);

    }
  }

}

- (void)_moveAllFacesToFinalMergeTarget
{
  PLPerson *v3;
  PLPerson *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PLPerson *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PLPerson finalMergeTargetPerson](self, "finalMergeTargetPerson");
  v3 = (PLPerson *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && v3 != self)
  {
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PLPerson personUUID](self, "personUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPerson detectedFaces](self, "detectedFaces");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      -[PLPerson personUUID](v4, "personUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v6;
      v14 = 2048;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Tombstone Person %{public}@ has %tu faces. Moving them to final merge target %{public}@", buf, 0x20u);

    }
    v11 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPerson _basicMergePersons:](v4, "_basicMergePersons:", v10);

  }
}

- (void)willSave
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  uint64_t v52;
  void *v53;
  void *v54;
  BOOL v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _BOOL4 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;
  _BYTE v76[128];
  _QWORD v77[2];
  uint8_t buf[4];
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)PLPerson;
  -[PLManagedObject willSave](&v75, sel_willSave);
  -[PLPerson changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("verifiedType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  if ((-[PLPerson isDeleted](self, "isDeleted") & 1) == 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("mergeTargetPerson"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLPerson isEqual:](self, "isEqual:", v6))
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[PLPerson personUUID](self, "personUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v79 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Attempted to set merge target to self (person uuid: %@), merge target reset to nil", buf, 0xCu);

      }
      -[PLPerson setMergeTargetPerson:](self, "setMergeTargetPerson:", 0);

      v6 = 0;
      goto LABEL_19;
    }
    if (!v6)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v6;
    if (v6 != (void *)v9)
    {
      v11 = (void *)v9;
      v12 = _os_feature_enabled_impl();

      if (!v12)
      {
LABEL_16:
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", v6);

        if ((v18 & 1) == 0 && -[PLPerson verifiedType](self, "verifiedType") != -2)
        {
          -[PLPerson setEffectiveVerifiedType:](self, "setEffectiveVerifiedType:", 4294967294);
          -[PLPerson _updateSharedLibraryPeopleRulesForTombstone](self, "_updateSharedLibraryPeopleRulesForTombstone");
          v5 = 1;
        }
LABEL_19:
        if (-[PLPerson verifiedType](self, "verifiedType") == -2)
        {
          -[PLPerson mergeCandidates](self, "mergeCandidates");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (v20)
          {
            -[PLPerson mutableMergeCandidates](self, "mutableMergeCandidates");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "removeAllObjects");

          }
          -[PLPerson mergeCandidatesWithConfidence](self, "mergeCandidatesWithConfidence");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          if (v23)
          {
            -[PLPerson mutableMergeCandidatesWithConfidence](self, "mutableMergeCandidatesWithConfidence");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "removeAllObjects");

          }
          -[PLPerson invalidMergeCandidates](self, "invalidMergeCandidates");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v26)
          {
            -[PLPerson mutableInvalidMergeCandidates](self, "mutableInvalidMergeCandidates");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "removeAllObjects");

          }
          -[PLPerson detectedFaces](self, "detectedFaces");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          if (v29)
            -[PLPerson _moveAllFacesToFinalMergeTarget](self, "_moveAllFacesToFinalMergeTarget");
        }
        -[PLPerson disconnectFaceGroup](self, "disconnectFaceGroup");
        objc_msgSend(v3, "objectForKey:", CFSTR("mergeCandidatesWithConfidence"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          if (!objc_msgSend(v30, "count"))
          {
            -[PLPerson mergeCandidateConfidence](self, "mergeCandidateConfidence");
            if (v32 != 0.0)
              -[PLPerson setMergeCandidateConfidence:](self, "setMergeCandidateConfidence:", 0.0);
          }
        }
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33 && -[PLPerson type](self, "type") == -1)
        {
          -[PLPerson _removeSharedLibraryPeopleRulesForPerson](self, "_removeSharedLibraryPeopleRulesForPerson");
          +[PLSocialGroup rejectSocialGroupsHavingMember:](PLSocialGroup, "rejectSocialGroupsHavingMember:", self);
        }
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("verifiedType"));
        v34 = objc_claimAutoreleasedReturnValue();
        if (!v34)
          goto LABEL_50;
        v35 = (void *)v34;
        v36 = -[PLPerson verifiedType](self, "verifiedType");

        if (v36 != 1)
          goto LABEL_50;
        v77[0] = CFSTR("verifiedType");
        v77[1] = CFSTR("type");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPerson committedValuesForKeys:](self, "committedValuesForKeys:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("type"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "intValue") == -1)
        {
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("verifiedType"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "intValue");

          if (v41 != 2 || -[PLPerson type](self, "type") == -1)
            goto LABEL_49;
          v70 = v5;
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          -[PLPerson faceCrops](self, "faceCrops");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
          if (v42)
          {
            v43 = v42;
            v66 = v38;
            v67 = v33;
            v68 = v31;
            v69 = v6;
            v44 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v43; ++i)
              {
                if (*(_QWORD *)v72 != v44)
                  objc_enumerationMutation(v39);
                v46 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                v47 = (void *)MEMORY[0x19AEC1554]();
                objc_msgSend(v46, "pl_safeSetValue:forKey:valueDidChangeHandler:", &unk_1E3760EA8, CFSTR("state"), 0);
                objc_autoreleasePoolPop(v47);
              }
              v43 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
            }
            while (v43);
            v5 = v70;
            v31 = v68;
            v6 = v69;
            v38 = v66;
            v33 = v67;
          }
        }

LABEL_49:
LABEL_50:

        goto LABEL_51;
      }
      objc_opt_class();
      -[PLPerson managedObjectContext](self, "managedObjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      objc_msgSend(v15, "delayedSaveActions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordDeduplicationNeededForGroupsContainingMember:", v6);

      objc_msgSend(v15, "delayedSaveActions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "recordSocialGroupContainmentUpdateNeededForPerson:", v6);
    }

    goto LABEL_16;
  }
  if (-[PLPerson isDeleted](self, "isDeleted"))
  {
    -[PLPerson resetAllFacesToDefault](self, "resetAllFacesToDefault");
    v5 = 1;
  }
LABEL_51:
  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLPerson isDeleted](self, "isDeleted")
    && ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19AEC0720]()))
  {
    +[PLGraphEdge cleanupDanglingReferencesInManagedObjectContext:](PLGraphEdge, "cleanupDanglingReferencesInManagedObjectContext:", v48);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (PLPlatformSearchSupported())
    {
      objc_msgSend(v48, "delayedSaveActions");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "recordPersonForSearchIndexUpdate:", self);

    }
    +[PLDelayedSearchIndexUpdates recordPersonIfNeeded:](PLDelayedSearchIndexUpdates, "recordPersonIfNeeded:", self);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cloudLocalState"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
      v51 = objc_msgSend(v3, "count") != 1;
    else
      v51 = 1;

    if ((-[PLPerson isDeleted](self, "isDeleted") & 1) == 0
      && -[PLPerson isValidForPersistence](self, "isValidForPersistence")
      && (-[PLPerson isInserted](self, "isInserted") | v51) == 1)
    {
      v52 = 66;
    }
    else
    {
      if (-[PLPerson isValidForPersistence](self, "isValidForPersistence"))
        goto LABEL_74;
      -[PLPerson personUUID](self, "personUUID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (v53)
        v55 = v51;
      else
        v55 = 0;
      if (!v55)
      {

LABEL_74:
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("userFeedbacks"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v58;
        if (v57 || objc_msgSend(v58, "integerValue") == -1)
        {
          PLBackendGetLog();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            -[PLPerson personUUID](self, "personUUID");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v79 = v61;
            _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_INFO, "Updating featured content due to changes on user feedback for person %{public}@", buf, 0xCu);

          }
          objc_msgSend(v48, "delayedSaveActions");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLPerson personUUID](self, "personUUID");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "recordFeaturedContentUpdateNeededForPersonUUID:", v63);

        }
        goto LABEL_80;
      }
      v56 = -[PLPerson isDeleted](self, "isDeleted");

      if ((v56 & 1) != 0)
        goto LABEL_74;
      v52 = 67;
    }
    *((_BYTE *)&self->super.super.super.isa + v52) = 1;
    goto LABEL_74;
  }
LABEL_80:
  if (v5)
  {
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "libraryServicesManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v65, "wellKnownPhotoLibraryIdentifier") == 1)
      -[PLPerson _triggerPersonSyncUpdateWithLibraryServicesManager:](self, "_triggerPersonSyncUpdateWithLibraryServicesManager:", v65);

  }
}

- (void)didSave
{
  BOOL *p_shouldPersistMetadata;
  void *v4;
  void *v5;

  p_shouldPersistMetadata = &self->_shouldPersistMetadata;
  if (self->_shouldPersistMetadata)
  {
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPerson persistMetadataToFileSystemWithPathManager:](self, "persistMetadataToFileSystemWithPathManager:", v5);
  }
  else
  {
    p_shouldPersistMetadata = &self->_shouldRemoveMetadata;
    if (!self->_shouldRemoveMetadata)
      return;
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPerson removePersistedFileSystemDataWithPathManager:](self, "removePersistedFileSystemDataWithPathManager:", v5);
  }

  *p_shouldPersistMetadata = 0;
}

- (void)updateDetectionTypeIfNeeded
{
  int v3;

  v3 = -[PLPerson verifiedType](self, "verifiedType");
  if ((v3 + 2) > 5 || ((1 << (v3 + 2)) & 0x27) == 0)
  {
    -[PLPerson assignDetectionTypeFromFaces](self, "assignDetectionTypeFromFaces");
    if (!-[PLPerson cloudDetectionType](self, "cloudDetectionType"))
    {
      if (-[PLPerson detectionType](self, "detectionType"))
        -[PLPerson setCloudDetectionType:](self, "setCloudDetectionType:", -[PLPerson detectionType](self, "detectionType"));
    }
  }
}

- (void)_triggerPersonSyncUpdateWithLibraryServicesManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  PLSyndicationGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Triggering person sync update", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLPerson _triggerPersonSyncUpdateWithLibraryServicesManager:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PLPerson__triggerPersonSyncUpdateWithLibraryServicesManager___block_invoke;
  v10[3] = &unk_1E3677C18;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  objc_msgSend(v7, "performBlock:", v10);

}

- (id)mutableFaces
{
  return (id)-[PLPerson mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("detectedFaces"));
}

- (id)mutableTemporalFaces
{
  return (id)-[PLPerson mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("temporalDetectedFaces"));
}

- (id)mutableRejectedFaces
{
  return (id)-[PLPerson mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("rejectedFaces"));
}

- (id)mutableRejectedFacesNeedingFaceCrops
{
  return (id)-[PLPerson mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("rejectedFacesNeedingFaceCrops"));
}

- (id)mutableFaceCrops
{
  return (id)-[PLPerson mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("faceCrops"));
}

- (id)mutableMergeCandidates
{
  return (id)-[PLPerson mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("mergeCandidates"));
}

- (id)mutableMergeCandidatesWithConfidence
{
  return (id)-[PLPerson mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("mergeCandidatesWithConfidence"));
}

- (id)mutableInvalidMergeCandidates
{
  return (id)-[PLPerson mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("invalidMergeCandidates"));
}

- (void)setKeyFace:(id)a3 pickSource:(signed __int16)a4
{
  uint64_t v5;
  id v6;

  if (a3)
    v5 = a4;
  else
    v5 = 0;
  v6 = a3;
  -[PLPerson setKeyFacePickSource:](self, "setKeyFacePickSource:", v5);
  -[PLPerson setKeyFace:](self, "setKeyFace:", v6);

}

- (id)debugLogDescription
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  -[PLPerson fullName](self, "fullName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("<No Name>");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  -[PLPerson displayName](self, "displayName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("<No Display Name>");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[PLPerson personUUID](self, "personUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (%@) [%@]"), v6, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)faceGroupDescription
{
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("personUUID");
  v6[1] = CFSTR("associatedFaceGroup");
  v6[2] = CFSTR("detectedFaces");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject truncatedDescriptionWithPropertyKeys:](self, "truncatedDescriptionWithPropertyKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)resetAllFacesToDefault
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PLPerson allDetectedFaces](self, "allDetectedFaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "setClusterSequenceNumber:", 0);
        objc_msgSend(v8, "setVuObservationID:", 0);
        objc_msgSend(v8, "setAssociatedPerson:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  -[PLPerson rejectedFaces](self, "rejectedFaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[PLPerson mutableRejectedFaces](self, "mutableRejectedFaces");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    -[PLPerson mutableRejectedFacesNeedingFaceCrops](self, "mutableRejectedFacesNeedingFaceCrops");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

  }
}

- (void)resetFacesProcessing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[PLPerson entity](self, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C97B20];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v3;
  v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v3, "relationshipsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v14, "destinationEntity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v7);

        if (v17)
        {
          objc_msgSend(v14, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLPerson valueForKey:](self, "valueForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            if (objc_msgSend(v14, "isToMany"))
              objc_msgSend(v28, "unionSet:", v19);
            else
              objc_msgSend(v28, "addObject:", v19);
          }

        }
        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v28;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v24);
        v26 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v25, "setEffectiveNameSource:", 0);
        objc_msgSend(v25, "fixPersonRelationshipsForFaceTorsoOrTemporal");
        objc_autoreleasePoolPop(v26);
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v22);
  }

}

- (void)assignDetectionTypeFromFaces
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  int v15;
  unsigned __int16 v17;
  NSObject *v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[7];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _OWORD v58[2];
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v59 = 0;
  memset(v58, 0, sizeof(v58));
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __40__PLPerson_assignDetectionTypeFromFaces__block_invoke;
  v33[3] = &unk_1E36761C8;
  v33[4] = &v38;
  v33[5] = &v34;
  v33[6] = &v42;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v33);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PLPerson detectedFaces](self, "detectedFaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v57, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v5);
        ((void (**)(_QWORD, _QWORD, _OWORD *))v4)[2](v4, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v58);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v57, 16);
    }
    while (v6);
  }

  -[PLPerson temporalDetectedFaces](self, "temporalDetectedFaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v39[3];
  if (v10 < objc_msgSend(v9, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v56, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          ((void (**)(_QWORD, _QWORD, _OWORD *))v4)[2](v4, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), v58);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v56, 16);
      }
      while (v12);
    }

  }
  v15 = *((__int16 *)v35 + 12);
  if ((v15 - 3) < 2 || v15 == 1)
  {
    v17 = -[PLPerson detectionType](self, "detectionType");
    if (*((unsigned __int16 *)v35 + 12) != v17)
    {
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[PLPerson detectionType](self, "detectionType");
        v20 = *((__int16 *)v35 + 12);
        -[PLPerson personUUID](self, "personUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v39[3];
        v23 = v43[3];
        *(_DWORD *)buf = 67110146;
        v47 = v19;
        v48 = 1024;
        v49 = v20;
        v50 = 2114;
        v51 = v21;
        v52 = 2048;
        v53 = v22;
        v54 = 2048;
        v55 = v23;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Changing detectionType from %d to %d on person %{public}@ for %tu of %tu detected faces", buf, 0x2Cu);

      }
      -[PLPerson setDetectionType:](self, "setDetectionType:", *((__int16 *)v35 + 12));
    }
  }
  else if (v15 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPerson.m"), 713, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("majorityDetectionType != PLDetectionTypePet"));

  }
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
}

- (void)rejectFaceIfPossible:(id)a3 shouldCreateFaceCrop:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = -[PLPerson verifiedType](self, "verifiedType");
  v7 = v9;
  if (v9)
  {
    if (v6)
    {
      -[PLPerson mutableRejectedFaces](self, "mutableRejectedFaces");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      v7 = v9;
      if (v4)
      {
        objc_msgSend(v9, "addRejectedPersonNeedingFaceCrops:", self);
        v7 = v9;
      }
    }
  }

}

- (void)setEffectiveVerifiedType:(int)a3
{
  uint64_t v3;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = *(_QWORD *)&a3;
  v5 = -[PLPerson cloudVerifiedType](self, "cloudVerifiedType");
  if ((_DWORD)v3 == 2 && v5 == 1)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Setting effectiveVerifiedType ignored, PLPersonVerifiedTypeUser cannot be overwritten by PLPersonVerifiedTypeGraph", v7, 2u);
    }

  }
  else
  {
    -[PLPerson setVerifiedType:](self, "setVerifiedType:", v3);
    -[PLPerson setCloudVerifiedType:](self, "setCloudVerifiedType:", v3);
    if ((_DWORD)v3 == -2)
    {
      -[PLPerson setContactMatchingDictionary:](self, "setContactMatchingDictionary:", 0);
      -[PLPerson setPersonUri:](self, "setPersonUri:", 0);
    }
  }
}

- (void)_updateSharedLibraryPeopleRulesForTombstone
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("autoSharePolicy"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare sharesWithPredicate:fetchLimit:inManagedObjectContext:](PLLibraryScope, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[PLPerson personUUID](self, "personUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPerson mergeTargetPerson](self, "mergeTargetPerson");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "personUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updatePeopleRulesForTombstonePersonUUID:replaceWithPersonUUID:", v12, v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (BOOL)isValidForPersistence
{
  void *v3;
  BOOL v4;

  if (!-[PLPerson verifiedType](self, "verifiedType"))
    return 0;
  -[PLPerson personUUID](self, "personUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5;
  PLPersistedPersonMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPerson.m"), 1093, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedPersonMetadata initWithPLPerson:pathManager:]([PLPersistedPersonMetadata alloc], "initWithPLPerson:pathManager:", self, v8);
    -[PLPersistedPersonMetadata writePersistedData](v6, "writePersistedData");

  }
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5;
  PLPersistedPersonMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPerson.m"), 1101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedPersonMetadata initWithPLPerson:pathManager:]([PLPersistedPersonMetadata alloc], "initWithPLPerson:pathManager:", self, v8);
    -[PLPersistedPersonMetadata removePersistedData](v6, "removePersistedData");

  }
}

- (BOOL)_personResetIsInProgress
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLPersonReset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", MEMORY[0x1E0C9AAB0]);

  return v5;
}

- (id)_nameRelatedMetadataKeys
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("fullName");
  v3[1] = CFSTR("displayName");
  v3[2] = CFSTR("contactMatchingDictionary");
  v3[3] = CFSTR("personUri");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pickOptimalStateForUserInitiatedMergeWithPersons:(id)a3 nominalTarget:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v49[9];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "arrayByAddingObject:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_237_96265);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v7)
  {
    v11 = v7;
  }
  else
  {
    objc_msgSend(v9, "lastObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "manualOrder"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("manualOrder"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v14, CFSTR("type"));

  objc_msgSend(v7, "keyFace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v7, "keyFace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("keyFace"));

  }
  objc_msgSend(v7, "fullName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    objc_msgSend(v7, "fullName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v19, CFSTR("fullName"));

    objc_msgSend(v7, "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v10, "setObject:forKey:", v20, CFSTR("displayName"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v21, CFSTR("displayName"));

    }
  }
  objc_msgSend(v7, "contactMatchingDictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {

    goto LABEL_14;
  }
  objc_msgSend(v7, "personUri");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
LABEL_14:
    objc_msgSend(v7, "contactMatchingDictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v10, "setObject:forKey:", v24, CFSTR("contactMatchingDictionary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v25, CFSTR("contactMatchingDictionary"));

    }
    objc_msgSend(v7, "personUri");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v10, "setObject:forKey:", v26, CFSTR("personUri"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v27, CFSTR("personUri"));

    }
    if (v15 && v18)
      goto LABEL_38;
  }
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__96273;
  v78 = __Block_byref_object_dispose__96274;
  v79 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__96273;
  v72 = __Block_byref_object_dispose__96274;
  v73 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__96273;
  v66 = __Block_byref_object_dispose__96274;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__96273;
  v60 = __Block_byref_object_dispose__96274;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__96273;
  v54 = __Block_byref_object_dispose__96274;
  v55 = 0;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __75__PLPerson_pickOptimalStateForUserInitiatedMergeWithPersons_nominalTarget___block_invoke_2;
  v49[3] = &unk_1E36764C0;
  v49[4] = &v50;
  v49[5] = &v68;
  v49[6] = &v62;
  v49[7] = &v74;
  v49[8] = &v56;
  objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v49);
  v28 = (id)v75[5];
  v29 = v10;
  v30 = v29;
  if (v28)
  {
    objc_msgSend(v29, "objectForKey:", CFSTR("keyFace"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
      objc_msgSend(v30, "setObject:forKey:", v28, CFSTR("keyFace"));
  }

  v32 = (id)v69[5];
  v33 = v30;
  v34 = v33;
  if (v32)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("fullName"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      objc_msgSend(v34, "setObject:forKey:", v32, CFSTR("fullName"));
  }

  v36 = (id)v63[5];
  v37 = v34;
  v38 = v37;
  if (v36)
  {
    objc_msgSend(v37, "objectForKey:", CFSTR("displayName"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
      objc_msgSend(v38, "setObject:forKey:", v36, CFSTR("displayName"));
  }

  v40 = (id)v57[5];
  v41 = v38;
  v42 = v41;
  if (v40)
  {
    objc_msgSend(v41, "objectForKey:", CFSTR("contactMatchingDictionary"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
      objc_msgSend(v42, "setObject:forKey:", v40, CFSTR("contactMatchingDictionary"));
  }

  v44 = (id)v51[5];
  v45 = v42;
  v46 = v45;
  if (v44)
  {
    objc_msgSend(v45, "objectForKey:", CFSTR("personUri"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
      objc_msgSend(v46, "setObject:forKey:", v44, CFSTR("personUri"));
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
LABEL_38:

  return v10;
}

- (id)reverseOrderedMergeTargetPersons
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  PLPerson *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PLPerson mergeTargetPerson](self, "mergeTargetPerson");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    while (!objc_msgSend(v4, "containsObject:", v6))
    {
      objc_msgSend(v4, "addObject:", v6);
      objc_msgSend(v3, "insertObject:atIndex:", v6, 0);
      objc_msgSend(v6, "mergeTargetPerson");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
      if (!v7)
        goto LABEL_9;
    }
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Found a looping merge target person for %@: %@", (uint8_t *)&v10, 0x16u);
    }

  }
LABEL_9:

  return v3;
}

- (void)prepareForUserInitiatedMergeWithPersons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  PLPerson *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = self;
  v48 = v4;
  objc_msgSend(v4, "arrayByAddingObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("verifiedType"), 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v6;
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLFaceCrop entityName](PLFaceCrop, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("person"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  v63 = 0;
  v46 = v11;
  objc_msgSend(v5, "executeFetchRequest:error:", v11, &v63);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v63;
  v49 = (void *)v8;
  v45 = v13;
  if (v13)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v15 = v13;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v60 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v20, "setPerson:", 0);
          objc_msgSend(v5, "deleteObject:", v20);
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v17);
      v8 = (uint64_t)v49;
    }
  }
  else
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[PLPerson prepareForUserInitiatedMergeWithPersons:]";
      v68 = 2112;
      v69 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "%s error fetching face crops to delete: %@", buf, 0x16u);
    }
  }

  v21 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchRequestWithEntityName:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ AND %K != %d"), CFSTR("personForFace"), v8, CFSTR("nameSource"), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPredicate:", v24);

  v58 = v14;
  objc_msgSend(v5, "executeFetchRequest:error:", v23, &v58);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v58;

  v43 = v26;
  if (v25)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v27 = v25;
    v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v55 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          objc_msgSend(v32, "setEffectiveNameSource:", 0);
          objc_msgSend(v32, "setConfirmedFaceCropGenerationState:", 0);
        }
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v29);
    }
  }
  else
  {
    PLBackendGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[PLPerson prepareForUserInitiatedMergeWithPersons:]";
      v68 = 2112;
      v69 = v26;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "%s error fetching faces to reset: %@", buf, 0x16u);
    }
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v33 = v44;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v51 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
        objc_msgSend(v38, "keyFace");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "nameSource");

        if (v40 != 1)
        {
          objc_msgSend(v38, "keyFace");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setEffectiveNameSource:", 1);

          objc_msgSend(v38, "keyFace");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setConfirmedFaceCropGenerationState:", 1);

        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v35);
  }

  if (-[PLPerson keyFacePickSource](v47, "keyFacePickSource") != 1)
    -[PLPerson setKeyFacePickSource:](v47, "setKeyFacePickSource:", 1);

}

- (id)pickKeyFaceOptimalStateForContactDedupeWithPersons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "arrayByAddingObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_246);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "keyFace", (_QWORD)v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        if (!v10)
          v10 = v13;
        if (objc_msgSend(v14, "nameSource") == 3 || objc_msgSend(v14, "nameSource") == 1)
          break;
      }

      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
  }
  else
  {
    v10 = 0;
LABEL_15:
    v14 = 0;
  }

  if (v14)
    v15 = v14;
  else
    v15 = v10;
  v16 = v15;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v14 != 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("keyFacePickSource"));

  if (v16)
    objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("keyFace"));

  return v17;
}

- (id)finalMergeTargetPerson
{
  PLPerson *v2;
  void *v3;
  void *v4;
  PLPerson *v5;
  PLPerson *v6;
  PLPerson *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  PLPerson *v11;
  int v13;
  PLPerson *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  -[PLPerson mergeTargetPerson](v2, "mergeTargetPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPerson mergeTargetPerson](v2, "mergeTargetPerson");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeTargetPerson");
  v5 = (PLPerson *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = v2;
    while (v6 != v5)
    {
      v7 = v3;

      -[PLPerson mergeTargetPerson](v7, "mergeTargetPerson");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPerson mergeTargetPerson](v5, "mergeTargetPerson");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mergeTargetPerson");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = v7;
      v5 = (PLPerson *)v9;
      if (!v3)
      {
        v6 = (PLPerson *)v9;
        v2 = v7;
        goto LABEL_12;
      }
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v2;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Looping merge target person %@", (uint8_t *)&v13, 0xCu);
      }

    }
    v2 = v6;
  }
  else
  {
    v6 = v5;
  }
LABEL_12:
  v11 = v2;

  return v11;
}

- (void)_basicMergePersons:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  PLPerson *v15;
  PLPerson *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t n;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t ii;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  PLPerson *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t jj;
  PLPerson *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t kk;
  void *v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  void *v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  PLPerson *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t mm;
  PLPerson *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *context;
  void *v106;
  void *v107;
  id v108;
  id v109;
  PLPerson *obj;
  void *v111;
  void *v112;
  char v113;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint8_t v157[128];
  uint8_t buf[4];
  PLPerson *v159;
  __int16 v160;
  PLPerson *v161;
  __int16 v162;
  uint64_t v163;
  __int16 v164;
  uint64_t v165;
  __int16 v166;
  PLPerson *v167;
  _BYTE v168[128];
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x19AEC1554]();
  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
  if (v6)
  {
    v7 = v6;
    v113 = 0;
    v8 = *(_QWORD *)v148;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v148 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * i);
        -[PLPerson personUUID](self, "personUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "personUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              -[PLPerson personUUID](self, "personUUID");
              v15 = (PLPerson *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v159 = v15;
              _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Person to merge should never be the same as the target person, aborting merge, personUUID = %@", buf, 0xCu);

            }
          }
        }
        else if (-[PLPerson validateDetectionTypesForMergingWithPersons:error:](self, "validateDetectionTypesForMergingWithPersons:error:", v5, 0))
        {
          if ((v113 & 1) != 0)
          {
            v113 = 1;
          }
          else if (objc_msgSend(v10, "verifiedType") == 1)
          {
            v113 = 1;
            -[PLPerson setVerifiedType:](self, "setVerifiedType:", 1);
          }
          else
          {
            v113 = 0;
          }
          objc_msgSend(v111, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
    }
    while (v7);
  }

  v16 = v111;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v159 = v16;
      v160 = 2112;
      v161 = self;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Merging %@ to %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  obj = v16;
  v19 = -[PLPerson countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v143, v168, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v144;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v144 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * j);
        objc_msgSend(v23, "rejectedFaces");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "valueForKey:", CFSTR("objectID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v114, "unionSet:", v25);
        objc_msgSend(v23, "allDetectedFaces");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "valueForKey:", CFSTR("objectID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "unionSet:", v27);
        objc_msgSend(v23, "rejectedFacesNeedingFaceCrops");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "valueForKey:", CFSTR("objectID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v112, "unionSet:", v29);
      }
      v20 = -[PLPerson countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v143, v168, 16);
    }
    while (v20);
  }

  -[PLPerson allDetectedFaces](self, "allDetectedFaces");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "valueForKey:", CFSTR("objectID"));
  v31 = objc_claimAutoreleasedReturnValue();

  -[PLPerson rejectedFaces](self, "rejectedFaces");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForKey:", CFSTR("objectID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPerson rejectedFacesNeedingFaceCrops](self, "rejectedFacesNeedingFaceCrops");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "valueForKey:", CFSTR("objectID"));
  v35 = objc_claimAutoreleasedReturnValue();

  v36 = (void *)objc_msgSend(v33, "mutableCopy");
  objc_msgSend(v36, "intersectSet:", v18);
  v37 = (void *)objc_msgSend(v114, "mutableCopy");
  objc_msgSend(v37, "minusSet:", v18);
  v103 = v33;
  objc_msgSend(v37, "minusSet:", v33);
  objc_msgSend(v37, "minusSet:", v31);
  v38 = (void *)objc_msgSend(v112, "mutableCopy");
  objc_msgSend(v38, "minusSet:", v18);
  v106 = (void *)v35;
  objc_msgSend(v38, "minusSet:", v35);
  v108 = v38;
  v104 = (void *)v31;
  objc_msgSend(v38, "minusSet:", v31);
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend(v18, "count");
      v41 = objc_msgSend(v36, "count");
      v42 = objc_msgSend(v37, "count");
      v43 = objc_msgSend(v106, "count");
      *(_DWORD *)buf = 134219010;
      v159 = (PLPerson *)v40;
      v160 = 2048;
      v161 = (PLPerson *)v41;
      v162 = 2048;
      v163 = v42;
      v164 = 2048;
      v165 = v43;
      v166 = 2112;
      v167 = self;
      _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "Adding %lu faces, unreject %lu faces, adding %lu rejectedFaces, %lu rejectedFacesNeedingFaceCrops to %@", buf, 0x34u);
    }

  }
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v44 = v18;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v139, v157, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v140;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v140 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend(v107, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * k));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPerson mutableFaces](self, "mutableFaces");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v49);

        objc_msgSend(v49, "fixPersonRelationshipsForFaceTorsoOrTemporal");
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v139, v157, 16);
    }
    while (v46);
  }

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v51 = v36;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v135, v156, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v136;
    do
    {
      for (m = 0; m != v53; ++m)
      {
        if (*(_QWORD *)v136 != v54)
          objc_enumerationMutation(v51);
        objc_msgSend(v107, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * m));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPerson mutableRejectedFaces](self, "mutableRejectedFaces");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "removeObject:", v56);

      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v135, v156, 16);
    }
    while (v53);
  }

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v58 = v37;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v131, v155, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v132;
    do
    {
      for (n = 0; n != v60; ++n)
      {
        if (*(_QWORD *)v132 != v61)
          objc_enumerationMutation(v58);
        objc_msgSend(v107, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * n));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPerson mutableRejectedFaces](self, "mutableRejectedFaces");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addObject:", v63);

      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v131, v155, 16);
    }
    while (v60);
  }

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v109 = v108;
  v65 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v127, v154, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v128;
    do
    {
      for (ii = 0; ii != v66; ++ii)
      {
        if (*(_QWORD *)v128 != v67)
          objc_enumerationMutation(v109);
        objc_msgSend(v107, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * ii));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPerson mutableRejectedFacesNeedingFaceCrops](self, "mutableRejectedFacesNeedingFaceCrops");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v69);

      }
      v66 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v127, v154, 16);
    }
    while (v66);
  }

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      -[PLPerson faceCrops](self, "faceCrops");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "count");
      *(_DWORD *)buf = 138412546;
      v159 = self;
      v160 = 2048;
      v161 = (PLPerson *)v73;
      _os_log_impl(&dword_199541000, v71, OS_LOG_TYPE_DEFAULT, "%@ has %lu faceCrops before merging", buf, 0x16u);

    }
  }
  v100 = v58;
  v101 = v51;
  v102 = v44;
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v74 = obj;
  v75 = -[PLPerson countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v123, v153, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v124;
    do
    {
      for (jj = 0; jj != v76; ++jj)
      {
        if (*(_QWORD *)v124 != v77)
          objc_enumerationMutation(v74);
        v79 = *(PLPerson **)(*((_QWORD *)&v123 + 1) + 8 * jj);
        -[PLPerson faceCrops](v79, "faceCrops");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        v122 = 0u;
        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v119, v152, 16);
        if (v81)
        {
          v82 = v81;
          v83 = *(_QWORD *)v120;
          do
          {
            for (kk = 0; kk != v82; ++kk)
            {
              if (*(_QWORD *)v120 != v83)
                objc_enumerationMutation(v80);
              objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * kk), "setState:", 0);
            }
            v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v119, v152, 16);
          }
          while (v82);
        }
        -[PLPerson faceCrops](v79, "faceCrops");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "allObjects");
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            v88 = objc_msgSend(v86, "count");
            *(_DWORD *)buf = 134218242;
            v159 = (PLPerson *)v88;
            v160 = 2112;
            v161 = v79;
            _os_log_impl(&dword_199541000, v87, OS_LOG_TYPE_DEFAULT, "Adding %lu faceCrops from %@", buf, 0x16u);
          }

        }
        -[PLPerson mutableFaceCrops](self, "mutableFaceCrops");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "addObjectsFromArray:", v86);

      }
      v76 = -[PLPerson countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v123, v153, 16);
    }
    while (v76);
  }

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      -[PLPerson faceCrops](self, "faceCrops");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v91, "count");
      *(_DWORD *)buf = 138412546;
      v159 = self;
      v160 = 2048;
      v161 = (PLPerson *)v92;
      _os_log_impl(&dword_199541000, v90, OS_LOG_TYPE_DEFAULT, "%@ has %lu faceCrops after merging", buf, 0x16u);

    }
  }
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v93 = v74;
  v94 = -[PLPerson countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v115, v151, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v116;
    do
    {
      for (mm = 0; mm != v95; ++mm)
      {
        if (*(_QWORD *)v116 != v96)
          objc_enumerationMutation(v93);
        v98 = *(PLPerson **)(*((_QWORD *)&v115 + 1) + 8 * mm);
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v159 = v98;
            v160 = 2112;
            v161 = self;
            _os_log_impl(&dword_199541000, v99, OS_LOG_TYPE_DEFAULT, "Updating targetPerson for %@ to %@ after merging", buf, 0x16u);
          }

        }
        -[PLPerson setMergeTargetPerson:](v98, "setMergeTargetPerson:", self);
      }
      v95 = -[PLPerson countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v115, v151, 16);
    }
    while (v95);
  }

  objc_autoreleasePoolPop(context);
}

- (BOOL)_updateGroupMembershipFromEdges:(id)a3 mergeTarget:(id)a4 error:(id *)a5
{
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
  id v17;
  void *v18;
  int v19;
  id v20;
  int v21;
  void *v22;
  unint64_t v23;
  void *v24;
  BOOL v25;
  id v26;
  void *v27;
  id *v29;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v32 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v9)
  {
    v10 = v9;
    v29 = a5;
    v33 = 0;
    v11 = *(_QWORD *)v37;
    v31 = v8;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v13, "sourceNode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15 && (objc_msgSend(v15, "isDeleted") & 1) == 0)
        {
          v17 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v16);
          objc_msgSend(v13, "targetPerson");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v33;
          v19 = objc_msgSend(v17, "removeMember:error:", v18, &v35);
          v20 = v35;

          if (!v19)
            goto LABEL_18;
          v34 = v20;
          v21 = objc_msgSend(v17, "addMember:error:", v32, &v34);
          v33 = v34;

          if (!v21)
          {
            v20 = v33;
LABEL_18:

            objc_autoreleasePoolPop(v14);
            v8 = v31;

            v26 = v20;
            if (v29)
            {
              v26 = objc_retainAutorelease(v26);
              v25 = 0;
              *v29 = v26;
            }
            else
            {
              v25 = 0;
            }
            v27 = v26;
            goto LABEL_22;
          }
          objc_msgSend(v17, "members");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          if (v23 <= 1)
          {
            -[PLPerson managedObjectContext](self, "managedObjectContext");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "deleteObject:", v16);

          }
          v8 = v31;
        }

        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v10)
        continue;
      break;
    }
    v25 = 1;
    v26 = v8;
    v27 = v33;
LABEL_22:

  }
  else
  {
    v25 = 1;
    v27 = v8;
  }

  return v25;
}

- (BOOL)_updateSocialGroupMembershipWithPersonsToMerge:(id)a3 mergeTarget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  BOOL v24;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pl_graphCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPerson managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labelWithCode:inContext:", 1000, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K = %@) AND (%K in %@)"), CFSTR("sourceNode.primaryLabel"), v11, CFSTR("targetPerson"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v13);

    objc_msgSend(v12, "setResultType:", 0);
    v30[0] = CFSTR("sourceNode");
    v14 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", v15);

    -[PLPerson managedObjectContext](self, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v16, "executeFetchRequest:error:", v12, &v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v27;

    if (!v17)
    {
      PLBackendGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v18;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error fetching social group edges during person merge: %@", buf, 0xCu);
      }

      v14 = 0;
    }
    if (objc_msgSend(v17, "count"))
    {
      v26 = v18;
      v20 = -[PLPerson _updateGroupMembershipFromEdges:mergeTarget:error:](self, "_updateGroupMembershipFromEdges:mergeTarget:error:", v17, v7, &v26);
      v21 = v26;

      if (!v20)
      {
        PLBackendGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v21;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Error adding/ removing members during person merge: %@", buf, 0xCu);
        }

        v14 = 0;
      }
    }
    else
    {
      v21 = v18;
    }

    v24 = v14 != 0;
  }
  else
  {
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Error getting social group label during person merge", buf, 2u);
    }

    v24 = 0;
  }

  return v24;
}

- (void)basicMergePersons:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PLPerson finalMergeTargetPerson](self, "finalMergeTargetPerson");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    -[PLPerson _updateSocialGroupMembershipWithPersonsToMerge:mergeTarget:](self, "_updateSocialGroupMembershipWithPersonsToMerge:mergeTarget:", v5, v4);
  objc_msgSend(v4, "_basicMergePersons:", v5);

}

- (void)mergePersons:(id)a3 withOptimalState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *context;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  context = (void *)MEMORY[0x19AEC1554]();
  -[PLPerson basicMergePersons:](self, "basicMergePersons:", v6);
  -[PLPerson finalMergeTargetPerson](self, "finalMergeTargetPerson");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPerson mergeCandidates](self, "mergeCandidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[PLPerson mergeCandidatesWithConfidence](self, "mergeCandidatesWithConfidence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  -[PLPerson invalidMergeCandidates](self, "invalidMergeCandidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v18, "mergeCandidates");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v20);

        objc_msgSend(v18, "mergeCandidatesWithConfidence");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v22);

        objc_msgSend(v18, "invalidMergeCandidates");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "allObjects");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v24);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v15);
  }

  objc_msgSend(v8, "removeObject:", v31);
  objc_msgSend(v10, "removeObject:", v31);
  objc_msgSend(v12, "removeObject:", v31);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = v12;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v8, "removeObject:", v30);
        objc_msgSend(v10, "removeObject:", v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v27);
  }

  objc_msgSend(v31, "setMergeCandidates:", v8);
  objc_msgSend(v31, "setMergeCandidatesWithConfidence:", v10);
  objc_msgSend(v31, "setInvalidMergeCandidates:", v25);
  objc_msgSend(v31, "setValuesForKeysWithDictionary:", v33);

  objc_autoreleasePoolPop(context);
}

- (BOOL)validateDetectionTypesForMergingWithPersons:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  _BYTE *v11;
  uint64_t i;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  int v17;
  _UNKNOWN **v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;
  uint64_t v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v7)
  {
    v8 = v7;
    v36 = a4;
    v9 = *(_QWORD *)v39;
    v10 = &off_1E3659000;
    v11 = (_BYTE *)MEMORY[0x1E0D115D0];
    v37 = v6;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v14 = -[PLPerson detectionType](self, "detectionType");
        if (v14 != objc_msgSend(v13, "detectionType"))
        {
          if (-[PLPerson detectionType](self, "detectionType") == 1
            && (objc_msgSend(v10[295], "isPetDetectionType:", objc_msgSend(v13, "detectionType")) & 1) != 0
            || objc_msgSend(v10[295], "isPetDetectionType:", -[PLPerson detectionType](self, "detectionType"))&& objc_msgSend(v13, "detectionType") == 1)
          {
            v24 = (void *)MEMORY[0x1E0CB3940];
            -[PLPerson personUUID](self, "personUUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[PLPerson detectionType](self, "detectionType");
            objc_msgSend(v13, "personUUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringWithFormat:", CFSTR("Preventing merge persons of different detection types: %@ (%hd) - %@ (%hd)"), v25, v26, v27, (int)objc_msgSend(v13, "detectionType"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (!*v11)
            {
              __CPLAssetsdOSLogDomain();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v43 = v28;
                _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
              }

            }
            v30 = (void *)MEMORY[0x1E0CB35C8];
            v31 = *MEMORY[0x1E0D74498];
            v50 = *MEMORY[0x1E0CB2938];
            v51 = v28;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 41005, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v36)
              *v36 = objc_retainAutorelease(v33);

            v23 = 0;
            goto LABEL_25;
          }
          if (!*v11)
          {
            __CPLAssetsdOSLogDomain();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              -[PLPerson personUUID](self, "personUUID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[PLPerson detectionType](self, "detectionType");
              objc_msgSend(v13, "personUUID");
              v18 = v10;
              v19 = v8;
              v20 = v9;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v13, "detectionType");
              *(_DWORD *)buf = 138544130;
              v43 = v16;
              v44 = 1024;
              v45 = v17;
              v46 = 2114;
              v47 = v21;
              v48 = 1024;
              v49 = v22;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Merging persons of different detection types: %{public}@ (%hd) - %{public}@ (%hd)", buf, 0x22u);

              v9 = v20;
              v8 = v19;
              v10 = v18;

              v6 = v37;
              v11 = (_BYTE *)MEMORY[0x1E0D115D0];
            }

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      if (v8)
        continue;
      break;
    }
  }
  v23 = 1;
LABEL_25:

  return v23;
}

- (BOOL)dedupeGraphPersons:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  NSObject *v49;
  _BYTE v50[128];
  uint64_t v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v11, "verifiedType") != 2)
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "personUUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("Attempting to dedupe non-graph person (uuid = %@), caller should refetch persons and respond appropriately"), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = *MEMORY[0x1E0D74498];
          v51 = *MEMORY[0x1E0CB2D50];
          v52 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 0, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = 0;
          goto LABEL_39;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (-[PLPerson keyFacePickSource](self, "keyFacePickSource") != 1)
  {
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_266_96204);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v40;
LABEL_12:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v16);
        if (objc_msgSend(v17, "keyFacePickSource") == 1)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
          if (v14)
            goto LABEL_12;
          goto LABEL_18;
        }
      }
      objc_msgSend(v17, "keyFace");
      v26 = objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_26;
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v26;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Dedupe target does not have a picked key face, assigning new picked key face %@", buf, 0xCu);
        }

      }
      -[PLPerson setKeyFace:pickSource:](self, "setKeyFace:pickSource:", v26, 1);
      -[PLPerson mutableFaces](self, "mutableFaces");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v26);

      -[NSObject fixPersonRelationshipsForFaceTorsoOrTemporal](v26, "fixPersonRelationshipsForFaceTorsoOrTemporal");
    }
    else
    {
LABEL_18:

LABEL_26:
      if (*MEMORY[0x1E0D115D0])
        goto LABEL_30;
      __CPLAssetsdOSLogDomain();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Unable to find picked key face from dedupe persons", buf, 2u);
      }
    }

LABEL_30:
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v29 = v6;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "deletePersonWithReason:", 5);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v31);
  }
  v24 = 0;
  v25 = 1;
LABEL_39:

  if (a4)
    *a4 = objc_retainAutorelease(v24);

  return v25;
}

- (void)enumerateAssetSearchEntityPersonRelationsWithBlock:(id)a3
{
  +[PLSearchEntity enumerateAssetSearchEntityPersonRelationsForPerson:withBlock:](PLSearchEntity, "enumerateAssetSearchEntityPersonRelationsForPerson:withBlock:", self, a3);
}

- (BOOL)deletePersonWithReason:(signed __int16)a3
{
  int v3;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  uint8_t buf[4];
  _DWORD v13[7];

  v3 = a3;
  *(_QWORD *)&v13[5] = *MEMORY[0x1E0C80C00];
  if (a3 != 6)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PLPerson personUUID](self, "personUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v13[0] = v3;
      LOWORD(v13[1]) = 2114;
      *(_QWORD *)((char *)&v13[1] + 2) = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Delete person with reason %d: %{public}@", buf, 0x12u);

    }
  }
  if (!-[PLPerson isDeleted](self, "isDeleted"))
  {
    self->_deleteReason = v3;
    if (_os_feature_enabled_impl())
      v10 = +[PLSocialGroup deleteSocialGroupsHavingMember:](PLSocialGroup, "deleteSocialGroupsHavingMember:", self);
    else
      v10 = 1;
    switch(v3)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = objc_claimAutoreleasedReturnValue();
        -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPerson.m"), 2059, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason != PLPersonDeleteReasonNone"));
        goto LABEL_8;
      case 1:
      case 2:
      case 3:
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_13;
      case 5:
        if (-[PLPerson _hideGraphPersonInsteadOfDelete](self, "_hideGraphPersonInsteadOfDelete"))
          return v10;
LABEL_13:
        -[PLPerson managedObjectContext](self, "managedObjectContext");
        v8 = objc_claimAutoreleasedReturnValue();
        -[NSObject deleteObject:](v8, "deleteObject:", self);
        goto LABEL_14;
      default:
        return 0;
    }
  }
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPerson personUUID](self, "personUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v13 = v9;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Person already deleted: %{public}@", buf, 0xCu);

  }
LABEL_8:
  v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)_hideGraphPersonInsteadOfDelete
{
  int v3;
  NSObject *v4;
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
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = -[PLPerson verifiedType](self, "verifiedType");
  if (v3 == 2)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PLPerson personUUID](self, "personUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Hiding graph person instead of delete: %{public}@", buf, 0xCu);

    }
    -[PLPerson setType:](self, "setType:", 0xFFFFFFFFLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PLPerson faceCrops](self, "faceCrops", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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
          objc_msgSend(v11, "face");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "managedObjectContext");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "deleteObject:", v13);

          }
          if (!objc_msgSend(v11, "state"))
            objc_msgSend(v11, "setState:", 1);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPerson setDetectedFaces:](self, "setDetectedFaces:", v15);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPerson setTemporalDetectedFaces:](self, "setTemporalDetectedFaces:", v16);

  }
  return v3 == 2;
}

- (BOOL)isHiddenGraphPerson
{
  return -[PLPerson verifiedType](self, "verifiedType") == 2
      && -[PLPerson type](self, "type") == -1;
}

- (id)edgesIn
{
  return +[PLGraphEdge edgesInToObject:](PLGraphEdge, "edgesInToObject:", self);
}

- (id)edgesOut
{
  return +[PLGraphEdge edgesOutFromObject:](PLGraphEdge, "edgesOutFromObject:", self);
}

- (void)implementsPLGraphEdgeReferenceObjectRecipient
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();

}

uint64_t __37__PLPerson_dedupeGraphPersons_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __63__PLPerson_pickKeyFaceOptimalStateForContactDedupeWithPersons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __75__PLPerson_pickOptimalStateForUserInitiatedMergeWithPersons_nominalTarget___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;

  v3 = a2;
  v34 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
  {
    objc_msgSend(v3, "personUri");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v34;
    if (v4)
    {
      objc_msgSend(v34, "personUri");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1[4] + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      objc_msgSend(v34, "fullName");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[5] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      objc_msgSend(v34, "displayName");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1[6] + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      objc_msgSend(v34, "keyFace");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1[7] + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      objc_msgSend(v34, "contactMatchingDictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1[8] + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      v3 = v34;
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(v34, "fullName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v34;
    if (v20)
    {
      objc_msgSend(v34, "fullName");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1[5] + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      objc_msgSend(v34, "displayName");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1[6] + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      objc_msgSend(v34, "keyFace");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(a1[7] + 8);
      v29 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v27;

      v3 = v34;
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    objc_msgSend(v34, "keyFace");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v34;
    if (v30)
    {
      objc_msgSend(v34, "keyFace");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(a1[7] + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v31;

      v3 = v34;
    }
  }

}

uint64_t __75__PLPerson_pickOptimalStateForUserInitiatedMergeWithPersons_nominalTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "type");
  if (v6 == objc_msgSend(v5, "type"))
  {
    objc_msgSend(v4, "fullName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v5, "fullName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (!v9)
        goto LABEL_22;
    }
    else
    {

    }
    objc_msgSend(v4, "fullName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {

    }
    else
    {
      objc_msgSend(v5, "fullName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (v19)
        goto LABEL_26;
    }
    v17 = objc_msgSend(v4, "faceCount");
    if (v17 > (int)objc_msgSend(v5, "faceCount"))
    {
LABEL_22:
      v15 = 1;
      goto LABEL_28;
    }
    v20 = objc_msgSend(v4, "faceCount");
    if (v20 >= (int)objc_msgSend(v5, "faceCount"))
    {
      objc_msgSend(v5, "personUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "personUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v21, "compare:", v22);

      goto LABEL_28;
    }
LABEL_26:
    v15 = -1;
    goto LABEL_28;
  }
  v10 = objc_msgSend(v4, "type");
  v11 = objc_msgSend(v5, "type");
  v12 = 1;
  if (v10 <= v11)
    v12 = -1;
  v13 = 1;
  if (v10 != 1)
    v13 = -1;
  if (v11 == -1)
    v12 = v13;
  v14 = -1;
  if (v11 != 1)
    v14 = 1;
  if (v10 == -1)
    v12 = v14;
  if (v10 == v11)
    v15 = 0;
  else
    v15 = v12;
LABEL_28:

  return v15;
}

void __40__PLPerson_assignDetectionTypeFromFaces__block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  int v5;
  unint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "manual") & 1) == 0)
  {
    v5 = objc_msgSend(v8, "detectionType");
    if (v5 <= 4)
    {
      v6 = *(_QWORD *)(a3 + 8 * v5) + 1;
      v7 = *(_QWORD *)(a1[4] + 8);
      if (v6 > *(_QWORD *)(v7 + 24))
      {
        *(_QWORD *)(v7 + 24) = v6;
        *(_WORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
      }
      *(_QWORD *)(a3 + 8 * v5) = v6;
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    }
  }

}

void __63__PLPerson__triggerPersonSyncUpdateWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "libraryBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryURLForIdentifier:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openBundleAtLibraryURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLSyndicationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Signaling background job service about person sync update on syndication library bundle %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "backgroundJobService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalBackgroundProcessingNeededOnBundle:", v5);

  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __78__PLPerson_createUnverifiedPersonForRejectedFaceUUIDs_inManagedObjectContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "associatedPersonForFaceOrTorso:orTemporal:", 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isEqual:", a1[4]))
  {
    PLPhotoKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Skipping unverified person assignment for face %{public}@ is already associated with person %{public}@", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v3, "setAssociatedPerson:", a1[5]);
    v6 = (void *)a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v3, "detectionType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v3, "detectionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  }
}

+ (id)fetchDuplicatePersonUUIDsInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__96273;
  v26 = __Block_byref_object_dispose__96274;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__96273;
  v20 = __Block_byref_object_dispose__96274;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PLPerson_fetchDuplicatePersonUUIDsInManagedObjectContext_error___block_invoke;
  v12[3] = &unk_1E3677830;
  v6 = v5;
  v13 = v6;
  v14 = &v16;
  v15 = &v22;
  objc_msgSend(v6, "performBlockAndWait:", v12);
  v7 = v17[5];
  v8 = (id)v23[5];
  v9 = v8;
  if (!v7 && a4)
    *a4 = objc_retainAutorelease(v8);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

+ (id)insertIntoPhotoLibrary:(id)a3 withPersonUUID:(id)a4 fullName:(id)a5 verifiedType:(int)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;

  v6 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPerson.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v11, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:", v14, v12, v13, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)insertIntoManagedObjectContext:(id)a3 withPersonUUID:(id)a4 fullName:(id)a5 verifiedType:(int)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;

  v6 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    objc_msgSend(a1, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", v14, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPerson.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moc"));

    objc_msgSend(a1, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v14, 0, 0);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setPersonUUID:", v12);
  objc_msgSend(v15, "setFullName:", v13);
  objc_msgSend(v15, "setType:", 0);
  objc_msgSend(v15, "setEffectiveVerifiedType:", v6);

  return v15;
}

+ (id)personsMatchingPredicate:(id)a3 fetchLimit:(unint64_t)a4 sortDescriptors:(id)a5 relationshipKeyPathsForPrefetching:(id)a6 inManagedObjectContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__96273;
  v34 = __Block_byref_object_dispose__96274;
  v35 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __122__PLPerson_personsMatchingPredicate_fetchLimit_sortDescriptors_relationshipKeyPathsForPrefetching_inManagedObjectContext___block_invoke;
  v22[3] = &unk_1E3676178;
  v28 = a1;
  v16 = v12;
  v23 = v16;
  v29 = a4;
  v17 = v13;
  v24 = v17;
  v18 = v14;
  v25 = v18;
  v27 = &v30;
  v19 = v15;
  v26 = v19;
  objc_msgSend(v19, "performBlockAndWait:", v22);
  v20 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v20;
}

+ (PLPerson)personWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUUID == %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "personsMatchingPredicate:fetchLimit:sortDescriptors:relationshipKeyPathsForPrefetching:inManagedObjectContext:", v9, 1, 0, 0, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v11 = 0;
  }

  return (PLPerson *)v11;
}

+ (id)allPersonsInManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "personsMatchingPredicate:fetchLimit:sortDescriptors:relationshipKeyPathsForPrefetching:inManagedObjectContext:", 0, 0, 0, 0, a3);
}

+ (id)personsWithPersonUri:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "personsWithPersonUris:inManagedObjectContext:", v9, v7, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)personsWithPersonUris:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("personUri"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "personsMatchingPredicate:fetchLimit:sortDescriptors:relationshipKeyPathsForPrefetching:inManagedObjectContext:", v9, 0, 0, 0, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)personsWithUUIDs:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("personUUID IN %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "personsMatchingPredicate:fetchLimit:sortDescriptors:relationshipKeyPathsForPrefetching:inManagedObjectContext:", v8, 0, 0, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 4;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("personUUID");
}

+ (void)createAssociatedPersonForFaceGroup:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "managedObjectContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createAssociatedPersonForFaceGroup:inManagedObjectContext:", v4, v5);

  }
}

+ (id)createUnverifiedPersonInManagedObjectContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:](PLPerson, "insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:", v4, v6, &stru_1E36789C0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entityName
{
  return CFSTR("Person");
}

+ (id)_batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 inManagedObjectContext:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v49[4];
  const __CFString *v50;
  __CFString *v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  id v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[4];

  v61[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0C99E08];
  v14 = a3;
  objc_msgSend(v13, "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchRequestWithEntityName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPredicate:", v18);
  objc_msgSend(v17, "setResultType:", 1);
  v54 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v17, &v54);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v54;
  if (v19)
  {
    v46 = v12;
    v43 = v19;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetForFace"), v19);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v45 = v10;
    if (v10)
    {
      v23 = (void *)MEMORY[0x1E0CB3528];
      v61[0] = v21;
      v61[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v22 = v25;
    }
    v44 = v11;
    if (v11)
    {
      +[PLDetectedFace predicateForIncludedDetectionTypes:](PLDetectedFace, "predicateForIncludedDetectionTypes:", v11);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26)
      {
        v28 = (void *)MEMORY[0x1E0CB3528];
        v60[0] = v22;
        v60[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "andPredicateWithSubpredicates:", v29);
        v30 = objc_claimAutoreleasedReturnValue();

        v22 = v30;
      }

    }
    +[PLDetectedFace fetchRequest](PLDetectedFace, "fetchRequest");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v34, "setName:", CFSTR("assetUUID"));
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("assetForFace.uuid"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setExpression:", v35);

    objc_msgSend(v34, "setExpressionResultType:", 700);
    v36 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v36, "setName:", CFSTR("personUUID"));
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("personForFace.personUUID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setExpression:", v37);

    objc_msgSend(v36, "setExpressionResultType:", 700);
    v59[0] = v34;
    v59[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setPropertiesToFetch:", v38);

    objc_msgSend(v33, "setPredicate:", v22);
    objc_msgSend(v33, "setResultType:", 2);
    v53 = v20;
    objc_msgSend(v46, "executeFetchRequest:error:", v33, &v53);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v53;

    if (v39)
    {
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __122__PLPerson__batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_inManagedObjectContext_error___block_invoke;
      v49[3] = &unk_1E36761F0;
      v50 = CFSTR("assetUUID");
      v51 = CFSTR("personUUID");
      v32 = v47;
      v52 = v47;
      objc_msgSend(v39, "enumerateObjectsUsingBlock:", v49);

      v40 = v50;
    }
    else
    {
      PLPhotoKitGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "+[PLPerson _batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:predicate:includedDetectionTypes:inManagedObjec"
              "tContext:error:]";
        v57 = 2112;
        v58 = v31;
        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "%s error fetching face data: %@", buf, 0x16u);
      }
      v32 = v47;
    }

    v11 = v44;
    v10 = v45;
    v12 = v46;
    v19 = v43;
  }
  else
  {
    PLPhotoKitGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v56 = "+[PLPerson _batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:predicate:includedDetectionTypes:inManagedObjectContext:error:]";
      v57 = 2112;
      v58 = v20;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "%s error fetching assets: %@", buf, 0x16u);
    }
    v31 = v20;
    v32 = v47;
  }

  if (a7)
    *a7 = objc_retainAutorelease(v31);
  v41 = v32;

  return v41;
}

+ (void)batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 inManagedObjectContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __126__PLPerson_batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_inManagedObjectContext_completion___block_invoke;
  v22[3] = &unk_1E3676218;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v28 = a1;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  objc_msgSend(v18, "performBlockAndWait:", v22);

}

+ (void)batchFetchPersonsByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 library:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __107__PLPerson_batchFetchPersonsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_library_completion___block_invoke;
  v21[3] = &unk_1E3676240;
  v22 = v14;
  v23 = v11;
  v24 = v13;
  v25 = v12;
  v26 = v15;
  v16 = v11;
  v17 = v13;
  v18 = v12;
  v19 = v15;
  v20 = v14;
  objc_msgSend(v20, "performBlockAndWait:", v21);

}

+ (id)fetchPersonCountByAssetUUIDForAssetUUIDs:(id)a3 predicate:(id)a4 includedDetectionTypes:(id)a5 library:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__96273;
  v39 = __Block_byref_object_dispose__96274;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__96273;
  v33 = __Block_byref_object_dispose__96274;
  v34 = 0;
  v14 = a6;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __100__PLPerson_fetchPersonCountByAssetUUIDForAssetUUIDs_predicate_includedDetectionTypes_library_error___block_invoke;
  v22[3] = &unk_1E3676268;
  v15 = v14;
  v23 = v15;
  v16 = v12;
  v24 = v16;
  v17 = v11;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v27 = &v29;
  v28 = &v35;
  objc_msgSend(v15, "performBlockAndWait:", v22);
  if (a7)
  {
    v19 = (void *)v30[5];
    if (v19)
      *a7 = objc_retainAutorelease(v19);
  }
  v20 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

+ (void)batchFetchAssociatedPersonByFaceGroupUUIDWithFaceGroupUUIDs:(id)a3 predicate:(id)a4 library:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__PLPerson_batchFetchAssociatedPersonByFaceGroupUUIDWithFaceGroupUUIDs_predicate_library_completion___block_invoke;
  v14[3] = &unk_1E3676290;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v13, "performBlockAndWait:", v14);

}

+ (id)predicateForMePerson
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0.0"), CFSTR("isMeConfidence"));
}

+ (id)fetchMePersonInManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97B48];
  v5 = a3;
  +[PLPerson entityName](PLPerson, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForMePerson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setFetchLimit:", 1);
  v14 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v7, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v14;
  if (v9)
  {
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Fetch for me person failed: %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

+ (id)fullNameFromContact:(id)a3
{
  return (id)objc_msgSend(a1, "_stringFromContact:preferGivenName:", a3, 0);
}

+ (id)displayNameFromContact:(id)a3
{
  return (id)objc_msgSend(a1, "_stringFromContact:preferGivenName:", a3, 1);
}

+ (id)_stringFromContact:(id)a3 preferGivenName:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 && objc_msgSend(v6, "length"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (id)predicateForPersonsNeedingFaceCropGenerationForFaceObjectID:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
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
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("verifiedType"), 1);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $f, $f == %@ AND $f.%K == %d AND ($f.%K == %d OR $f.%K == %d)).@count > 0"), CFSTR("detectedFaces"), v4, CFSTR("confirmedFaceCropGenerationState"), 1, CFSTR("nameSource"), 3, CFSTR("nameSource"), 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("verifiedType"), 2);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $f, $f == %@ AND $f.%K == %d AND $f.%K == %d).@count > 0"), CFSTR("detectedFaces"), v4, CFSTR("confirmedFaceCropGenerationState"), 1, CFSTR("nameSource"), 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %@ IN %K"), v4, CFSTR("rejectedFaces"), v4, CFSTR("rejectedFacesNeedingFaceCrops"));
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3528];
  v28 = (void *)v5;
  v33[0] = v5;
  v33[1] = v6;
  v26 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  v32[0] = v5;
  v32[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3528];
  v31[0] = v6;
  v31[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3528];
  v30[0] = v11;
  v30[1] = v8;
  v19 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0CB3528];
  v29[0] = v14;
  v29[1] = v17;
  v29[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "orPredicateWithSubpredicates:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)predicateForVisibleKeyFace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset predicateToExcludeNonvisibleBurstAssetsWithAvalanchePickTypeKeyPath:](PLManagedAsset, "predicateToExcludeNonvisibleBurstAssetsWithAvalanchePickTypeKeyPath:", CFSTR("keyFace.assetForFace.avalanchePickType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateToExcludeHiddenAssetsWithHiddenKeyPath:](PLManagedAsset, "predicateToExcludeHiddenAssetsWithHiddenKeyPath:", CFSTR("keyFace.assetForFace.hidden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateToExcludeTrashedAssetsWithTrashedStateKeyPath:](PLManagedAsset, "predicateToExcludeTrashedAssetsWithTrashedStateKeyPath:", CFSTR("keyFace.assetForFace.trashedState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("keyFace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateToExcludeVideosWithVideoKeyFrameSetWithKeyPathToAsset:](PLManagedAsset, "predicateToExcludeVideosWithVideoKeyFrameSetWithKeyPathToAsset:", CFSTR("keyFace.assetForFace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v5;
  v11[1] = v2;
  v11[2] = v3;
  v11[3] = v4;
  v11[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForPersistence
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d AND %K != %d"), CFSTR("verifiedType"), 0, CFSTR("verifiedType"), 0xFFFFFFFFLL);
}

+ (id)predicateForIncludedDetectionTypes:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "containsObject:", &unk_1E3760ED8))
  {
    v4 = objc_msgSend(v3, "containsObject:", &unk_1E3760EF0);

    if ((v4 & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("detectionType"), &unk_1E3760ED8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("detectionType"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)predicateToExcludeTorsoOnlyPerson
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0"), CFSTR("faceCount"));
}

+ (BOOL)resetAllInLibrary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v5 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__96273;
  v23 = __Block_byref_object_dispose__96274;
  v24 = 0;
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __36__PLPerson_resetAllInLibrary_error___block_invoke;
  v15[3] = &unk_1E3677830;
  v8 = v6;
  v16 = v8;
  v17 = &v25;
  v18 = &v19;
  objc_msgSend(v5, "performTransactionAndWait:", v15);
  if (*((_BYTE *)v26 + 24))
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __36__PLPerson_resetAllInLibrary_error___block_invoke_207;
    v11[3] = &unk_1E3677830;
    v12 = v8;
    v13 = &v25;
    v14 = &v19;
    objc_msgSend(v5, "performBlockAndWait:", v11);

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v9 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v9;
}

+ (void)_setPersonResetInProgress:(BOOL)a3 context:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PLPerson__setPersonResetInProgress_context___block_invoke;
  v7[3] = &unk_1E36762F8;
  v9 = a3;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

+ (id)resetAllInLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void (**v28)(_QWORD, _QWORD);
  _QWORD *v29;
  uint64_t *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[3];
  char v60;

  v6 = a3;
  v7 = a4;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__96273;
  v57 = __Block_byref_object_dispose__96274;
  v58 = 0;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setPersonResetInProgress:context:", 1, v8);
  v9 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __41__PLPerson_resetAllInLibrary_completion___block_invoke;
  v49[3] = &unk_1E3676320;
  v52 = a1;
  v10 = v8;
  v50 = v10;
  v11 = v7;
  v51 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v49);
  +[PLPerson fetchRequest](PLPerson, "fetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("verifiedType"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);

  objc_msgSend(v13, "setFetchBatchSize:", 100);
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v40[0] = v9;
  v40[1] = 3221225472;
  v40[2] = __41__PLPerson_resetAllInLibrary_completion___block_invoke_2;
  v40[3] = &unk_1E3676348;
  v43 = &v45;
  v15 = v10;
  v41 = v15;
  v16 = v13;
  v42 = v16;
  v44 = &v53;
  objc_msgSend(v6, "performBlockAndWait:", v40);
  if (v54[5])
  {
    v12[2](v12, 0);
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v46[3]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v11;
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "+[PLPerson resetAllInLibrary:completion:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v9;
    v32[1] = 3221225472;
    v32[2] = __41__PLPerson_resetAllInLibrary_completion___block_invoke_3;
    v32[3] = &unk_1E3676370;
    v36 = &v45;
    v37 = v59;
    v39 = a1;
    v33 = v16;
    v34 = v15;
    v20 = v18;
    v35 = v20;
    v38 = &v53;
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __41__PLPerson_resetAllInLibrary_completion___block_invoke_213;
    v25[3] = &unk_1E36763C0;
    v26 = v6;
    v29 = v59;
    v31 = a1;
    v28 = v12;
    v30 = &v53;
    v21 = v19;
    v27 = v21;
    objc_msgSend(v26, "performTransaction:completionHandler:", v32, v25);
    v22 = v27;
    v17 = v20;

    v11 = v24;
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(v59, 8);
  return v17;
}

+ (void)_resetMediaAnalysisAfterPersonResetInLibraryURL:(id)a3 resetPersons:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;

  v6 = a4;
  v8 = a3;
  v7 = a5;
  if (v6)
    +[PLMediaAnalysisServiceRequestAdapter requestResetPersons:photoLibraryURL:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestResetPersons:photoLibraryURL:completionHandler:", 0, v8, v7);
  +[PLMediaAnalysisServiceRequestAdapter requestResetFaceClassificationModelForPhotoLibraryURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestResetFaceClassificationModelForPhotoLibraryURL:progressHandler:completionHandler:", v8, &__block_literal_global_218, v7);

}

+ (BOOL)_deleteObjectsWithFetchRequest:(id)a3 reason:(signed __int16)a4 moc:(id)a5 progress:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t (*v18)(uint64_t, uint64_t);
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  id *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _BYTE *v38;
  id v39;
  signed __int16 v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  id v47;
  uint64_t v48;
  const __CFString *v49;
  _BYTE v50[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v12, "setFetchBatchSize:", 100);
  v41 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v12, &v41);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (uint64_t (*)(uint64_t, uint64_t))v41;
  v17 = v16;
  if (v15)
  {
    v33 = a7;
    v18 = v16;
    *(_QWORD *)v50 = 0;
    *(_QWORD *)&v50[8] = v50;
    *(_QWORD *)&v50[16] = 0x3032000000;
    v51 = __Block_byref_object_copy__96273;
    v52 = __Block_byref_object_dispose__96274;
    v53 = 0;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __69__PLPerson__deleteObjectsWithFetchRequest_reason_moc_progress_error___block_invoke;
    v34[3] = &unk_1E3676408;
    v19 = v14;
    v35 = v19;
    v38 = v50;
    v39 = a1;
    v40 = a4;
    v31 = v12;
    v36 = v31;
    v37 = v13;
    objc_msgSend(v37, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v15, v34);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(*(_QWORD *)&v50[8] + 40);
    v32 = (void *)v20;
    if (!v21)
      v21 = (void *)v20;
    v22 = v21;
    v17 = v18;
    if (v22)
      goto LABEL_5;
    if (!objc_msgSend(v19, "isCancelled"))
      goto LABEL_16;
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v48 = *MEMORY[0x1E0CB2938];
    v49 = CFSTR("Person reset cancelled during person delete");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41031, v29);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
LABEL_5:
      PLBackendGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v31, "entityName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v24;
        v44 = 2082;
        v45 = "+[PLPerson _deleteObjectsWithFetchRequest:reason:moc:progress:error:]";
        v46 = 2112;
        v47 = v22;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@ in %{public}s %@", buf, 0x20u);

      }
      if (v33)
        *v33 = objc_retainAutorelease(v22);

      v25 = 0;
    }
    else
    {
LABEL_16:
      v25 = 1;
    }

    _Block_object_dispose(v50, 8);
  }
  else
  {
    PLBackendGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "entityName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v50 = 138543874;
      *(_QWORD *)&v50[4] = v27;
      *(_WORD *)&v50[12] = 2082;
      *(_QWORD *)&v50[14] = "+[PLPerson _deleteObjectsWithFetchRequest:reason:moc:progress:error:]";
      *(_WORD *)&v50[22] = 2112;
      v51 = v17;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Failed to fetch %{public}@ in %{public}s %@", v50, 0x20u);

    }
    v25 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v17);
  }

  return v25;
}

+ (BOOL)_detachFacesForPerson:(id)a3 reason:(signed __int16)a4 error:(id *)a5
{
  int v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[3];

  v6 = a4;
  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allDetectedFaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v34 = a5;
  if (v6 == 6 && v13)
  {
    objc_msgSend(a1, "createUnverifiedPersonInManagedObjectContext:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDetectionType:", objc_msgSend(v8, "detectionType"));
    objc_msgSend(v8, "mdID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMdID:", v16);

  }
  v17 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __47__PLPerson__detachFacesForPerson_reason_error___block_invoke;
  v37[3] = &unk_1E3676430;
  v18 = v14;
  v38 = v18;
  v19 = v9;
  v39 = v19;
  v20 = v15;
  v40 = v20;
  objc_msgSend(v10, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v12, v37);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isCancelled") && !v21)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D74498];
    v43 = *MEMORY[0x1E0CB2938];
    v44[0] = CFSTR("Person reset cancelled while deleting unnamed faces");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 41031, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v21)
  {
    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __47__PLPerson__detachFacesForPerson_reason_error___block_invoke_2;
    v35[3] = &unk_1E3676458;
    v36 = v18;
    objc_msgSend(v10, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v19, v35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v20)
  {
    +[PLKeyFaceManager sharedInstance](PLKeyFaceManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "personUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "photoLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "markPersonAsNeedingKeyFace:photoLibrary:", v26, v27);

  }
  if (objc_msgSend(v18, "isCancelled") && !v21)
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0D74498];
    v41 = *MEMORY[0x1E0CB2938];
    v42 = CFSTR("Person reset cancelled while deleting verified faces");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 41031, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v31 = v21;
  v32 = v31;
  if (v21 && v34)
    *v34 = objc_retainAutorelease(v31);

  return v21 == 0;
}

+ (id)fetchFinalMergeTargetPersonForPersonWithUUID:(id)a3 context:(id)a4 predicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(a1, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("mergeTargetPerson.mergeTargetPerson.mergeTargetPerson.mergeTargetPerson.mergeTargetPerson");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRelationshipKeyPathsForPrefetching:", v12);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUUID == %@"), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
  {
    v15 = (void *)MEMORY[0x1E0CB3528];
    v29[0] = v9;
    v29[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v13;
  }
  objc_msgSend(v11, "setPredicate:", v17);
  objc_msgSend(v11, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v11, "setFetchLimit:", 1);
  v24 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v11, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v24;
  if (!v18)
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch final merge target person with UUID %@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v18, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "finalMergeTargetPerson");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __47__PLPerson__detachFacesForPerson_reason_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    *a4 = 1;
  }
  else
  {
    if (objc_msgSend(v6, "nameSource") && objc_msgSend(v6, "nameSource") != 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    }
    else
    {
      objc_msgSend(v6, "removeAllPersonRelationships");
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    }
    objc_msgSend(v6, "setAssociatedPerson:", *(_QWORD *)(a1 + 48));
  }

}

void __47__PLPerson__detachFacesForPerson_reason_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "removeAllPersonRelationships");
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  }

}

void __69__PLPerson__deleteObjectsWithFetchRequest_reason_moc_progress_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  id obj;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", 1);
    objc_msgSend(*(id *)(a1 + 40), "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPerson entityName](PLPerson, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9
      && (v10 = *(__int16 *)(a1 + 72),
          v11 = *(void **)(a1 + 64),
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
          obj = *(id *)(v12 + 40),
          v13 = objc_msgSend(v11, "_detachFacesForPerson:reason:error:", v6, v10, &obj),
          objc_storeStrong((id *)(v12 + 40), obj),
          (v13 & 1) == 0))
    {
      *a4 = 1;
    }
    else if (!*a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "deletePersonWithReason:", *(__int16 *)(a1 + 72));
      else
        objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v6);
    }
    objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
  }

}

void __41__PLPerson_resetAllInLibrary_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)a1[6];
  v5 = a1[4];
  v6 = a3;
  objc_msgSend(v4, "_setPersonResetInProgress:context:", 0, v5);
  (*(void (**)(void))(a1[5] + 16))();

}

void __41__PLPerson_resetAllInLibrary_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "countForFetchRequest:error:", v3, &v7);
  v5 = v7;
  v6 = v7;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);

}

void __41__PLPerson_resetAllInLibrary_completion___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    *(_DWORD *)buf = 134217984;
    v22 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Person reset deleting %tu persons", buf, 0xCu);
  }

  v4 = (void *)a1[10];
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v20 = 0;
  v8 = objc_msgSend(v4, "_deleteObjectsWithFetchRequest:reason:moc:progress:error:", v5, 6, v6, v7, &v20);
  v9 = v20;
  v10 = v9;
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v8;
  if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Person reset deleting face crops, if any are still remaining", buf, 2u);
    }

    +[PLFaceCrop fetchRequest](PLFaceCrop, "fetchRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)a1[10];
    v14 = a1[5];
    v19 = v10;
    v15 = objc_msgSend(v13, "_deleteObjectsWithFetchRequest:reason:moc:progress:error:", v12, 6, v14, 0, &v19);
    v16 = v19;
    v17 = v19;

    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v15;
    if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
      objc_storeStrong((id *)(*(_QWORD *)(a1[9] + 8) + 40), v16);
  }
  else
  {
    v18 = *(_QWORD *)(a1[9] + 8);
    v17 = v9;
    v12 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;
  }

}

uint64_t __41__PLPerson_resetAllInLibrary_completion___block_invoke_213(uint64_t a1)
{
  void *v2;
  char v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "libraryCreateOptions");

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v4 = (v3 & 0x10) == 0;
  else
    v4 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "Person Reset XPC to MAD");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "libraryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __41__PLPerson_resetAllInLibrary_completion___block_invoke_2_215;
    v15 = &unk_1E3676398;
    v9 = *(id *)(a1 + 48);
    v16 = v5;
    v17 = v9;
    v10 = v5;
    objc_msgSend(v6, "_resetMediaAnalysisAfterPersonResetInLibraryURL:resetPersons:completion:", v8, 1, &v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive", v12, v13, v14, v15);
}

uint64_t __41__PLPerson_resetAllInLibrary_completion___block_invoke_2_215(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __46__PLPerson__setPersonResetInProgress_context___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;
  id v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PLPersonReset"));
  else
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("PLPersonReset"));

}

void __36__PLPerson_resetAllInLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[PLPerson fetchRequest](PLPerson, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("verifiedType"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setFetchBatchSize:", 100);
  v4 = *(void **)(a1 + 32);
  v15 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (!v5)
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = (uint64_t)v6;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Person reset failed to fetch verified persons with error: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = v6;
LABEL_12:
    v6 = v12;
    v14 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;

    goto LABEL_13;
  }
  if (objc_msgSend(v5, "count"))
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v17 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Person reset deleting %lu verified persons", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "enumerateWithIncrementalSaveUsingObjects:withBlock:", v5, &__block_literal_global_96439);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v6 = 0;
      goto LABEL_13;
    }
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = (uint64_t)v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Person reset failed to save with error: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = v9;
    goto LABEL_12;
  }
LABEL_13:

}

void __36__PLPerson_resetAllInLibrary_error___block_invoke_207(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[PLFaceCrop fetchRequest](PLFaceCrop, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchBatchSize:", 100);
  v3 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (!v4)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = (uint64_t)v5;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Person reset failed to fetch face crops with error: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v5;
LABEL_12:
    v5 = v11;
    v13 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;

    goto LABEL_13;
  }
  if (objc_msgSend(v4, "count"))
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 134217984;
      v16 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Person reset found %lu face crops to delete, these are probably orphaned", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "deleteObjectsWithIncrementalSave:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v5 = 0;
      goto LABEL_13;
    }
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = (uint64_t)v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Person reset failed to save with error: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v8;
    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __36__PLPerson_resetAllInLibrary_error___block_invoke_205(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deletePersonWithReason:", 6);
}

void __101__PLPerson_batchFetchAssociatedPersonByFaceGroupUUIDWithFaceGroupUUIDs_predicate_library_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v1 = a1;
  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLPerson entityName](PLPerson, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", &unk_1E3764178);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("associatedFaceGroup.uuid IN %@"), *(_QWORD *)(v1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);
  v27 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  v9 = v8;
  if (v7)
  {
    v19 = v8;
    v20 = v6;
    v21 = v1;
    v22 = v2;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "associatedFaceGroup");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v13);
    }

    v1 = v21;
    v2 = v22;
    v9 = v19;
    v6 = v20;
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(v1 + 48) + 16))();

}

void __100__PLPerson_fetchPersonCountByAssetUUIDForAssetUUIDs_predicate_includedDetectionTypes_library_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id obj;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  _BYTE v121[128];
  _QWORD v122[2];
  void *v123;
  _QWORD v124[2];
  _BYTE v125[128];
  _BYTE v126[128];
  _QWORD v127[2];
  const __CFString *v128;
  _BYTE v129[128];
  _QWORD v130[2];
  _QWORD v131[4];

  v131[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  if (!*(_QWORD *)(a1 + 40))
  {
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchRequestWithEntityName:", v54);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K.%K != nil"), CFSTR("detectedFaces"), CFSTR("personForFace"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)MEMORY[0x1E0CB3528];
    v124[0] = v7;
    v124[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "andPredicateWithSubpredicates:", v56);
    v57 = objc_claimAutoreleasedReturnValue();

    v84 = (void *)v57;
    objc_msgSend(v5, "setPredicate:", v57);
    objc_msgSend(v5, "setResultType:", 2);
    v58 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    v59 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "expressionForFunction:arguments:", CFSTR("count:"), v61);
    v62 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "setName:", CFSTR("count"));
    v100 = (void *)v62;
    objc_msgSend(v58, "setExpression:", v62);
    objc_msgSend(v58, "setExpressionResultType:", 200);
    v122[0] = CFSTR("uuid");
    obj = v58;
    v122[1] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPropertiesToFetch:", v63);

    objc_msgSend(v5, "setPropertiesToGroupBy:", &unk_1E3764160);
    v106 = 0;
    objc_msgSend(v2, "executeFetchRequest:error:", v5, &v106);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v106;
    v66 = v106;
    v67 = v66;
    if (v64)
    {
      v97 = v66;
      v86 = v9;
      v88 = v7;
      v91 = v2;
      v68 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v69 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v70 = *(void **)(v69 + 40);
      *(_QWORD *)(v69 + 40) = v68;

      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v99 = v64;
      v71 = v64;
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
      if (v72)
      {
        v73 = v72;
        v74 = *(_QWORD *)v103;
        do
        {
          for (i = 0; i != v73; ++i)
          {
            if (*(_QWORD *)v103 != v74)
              objc_enumerationMutation(v71);
            v76 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
            objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("count"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
            objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("uuid"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setObject:forKeyedSubscript:", v77, v79);

          }
          v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
        }
        while (v73);
      }

      v2 = v91;
      v9 = v86;
      v7 = v88;
      v67 = v97;
      v64 = v99;
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v65);
    }

    v40 = v84;
    goto LABEL_54;
  }
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v131[0] = CFSTR("personForFace");
  v131[1] = CFSTR("assetForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", v6);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetForFace.uuid"), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 56)
    && (+[PLDetectedFace predicateForIncludedDetectionTypes:](PLDetectedFace, "predicateForIncludedDetectionTypes:"), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0CB3528];
    v130[0] = v7;
    v130[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setPredicate:", v12);
  }
  else
  {
    objc_msgSend(v5, "setPredicate:", v7);
    v9 = 0;
  }
  v120 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &v120);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v120;
  v15 = v14;
  if (v13)
  {
    v85 = v9;
    v87 = v7;
    v89 = v5;
    v90 = v2;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v117;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v117 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * j);
          objc_msgSend(v20, "assetForFace");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "personUUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            v25 = v24 == 0;
          else
            v25 = 1;
          if (!v25)
          {
            objc_msgSend(v100, "objectForKeyedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v26)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "setObject:forKeyedSubscript:", v26, v24);
            }
            objc_msgSend(v26, "addObject:", v22);

          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
      }
      while (v17);
    }

    v27 = (void *)MEMORY[0x1E0C97B48];
    +[PLPerson entityName](PLPerson, "entityName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fetchRequestWithEntityName:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v128 = CFSTR("personUUID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v128, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPropertiesToFetch:", v30);

    objc_msgSend(v29, "setResultType:", 2);
    v31 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v100, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "predicateWithFormat:", CFSTR("personUUID IN %@"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0CB3528];
    v35 = *(_QWORD *)(a1 + 40);
    v127[0] = v33;
    v127[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "andPredicateWithSubpredicates:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPredicate:", v37);

    v115 = v15;
    v2 = v90;
    objc_msgSend(v90, "executeFetchRequest:error:", v29, &v115);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v115;
    v40 = v115;

    if (v38)
    {
      v81 = v33;
      v82 = v29;
      v83 = v40;
      v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v42 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v43 = *(void **)(v42 + 40);
      *(_QWORD *)(v42 + 40) = v41;

      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v92 = v38;
      v95 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
      if (v95)
      {
        v94 = *(_QWORD *)v112;
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v112 != v94)
              objc_enumerationMutation(v92);
            v98 = v44;
            objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * v44), "objectForKeyedSubscript:", CFSTR("personUUID"));
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "objectForKeyedSubscript:");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = 0u;
            v108 = 0u;
            v109 = 0u;
            v110 = 0u;
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
            if (v46)
            {
              v47 = v46;
              v48 = *(_QWORD *)v108;
              do
              {
                for (k = 0; k != v47; ++k)
                {
                  if (*(_QWORD *)v108 != v48)
                    objc_enumerationMutation(v45);
                  v50 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * k);
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectForKeyedSubscript:", v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v51)
                  {
                    v52 = v51;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v51, "integerValue") + 1);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v53 = &unk_1E3760EC0;
                  }
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v53, v50);

                }
                v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
              }
              while (v47);
            }

            v44 = v98 + 1;
          }
          while (v98 + 1 != v95);
          v95 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
        }
        while (v95);
      }

      v2 = v90;
      v29 = v82;
      v40 = v83;
      v33 = v81;
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v39);
    }

    v7 = v87;
    v5 = v89;
    v9 = v85;
LABEL_54:

    goto LABEL_55;
  }
  v80 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v40 = v14;
  obj = 0;
  v101 = *(void **)(v80 + 40);
  *(_QWORD *)(v80 + 40) = v40;

LABEL_55:
}

void __107__PLPerson_batchFetchPersonsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_library_completion___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
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
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  uint64_t j;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD *v57;
  void *v58;
  void *v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _QWORD v81[2];
  _BYTE v82[128];
  _QWORD v83[2];
  _QWORD v84[4];

  v1 = (_QWORD *)a1;
  v84[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v84[0] = CFSTR("personForFace");
  v84[1] = CFSTR("assetForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", v6);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetForFace.uuid"), v1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1[6]
    && (+[PLDetectedFace predicateForIncludedDetectionTypes:](PLDetectedFace, "predicateForIncludedDetectionTypes:"), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0CB3528];
    v83[0] = v7;
    v83[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setPredicate:", v12);
  }
  else
  {
    objc_msgSend(v5, "setPredicate:", v7);
    v9 = 0;
  }
  v78 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &v78);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v78;
  if (v13)
  {
    v55 = v9;
    v56 = v5;
    v57 = v1;
    v58 = v2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v54 = v13;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v75 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v20, "assetForFace");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v22)
            v25 = v23 == 0;
          else
            v25 = 1;
          if (!v25)
          {
            objc_msgSend(v23, "personUUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v27)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "personUUID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "setObject:forKeyedSubscript:", v27, v28);

              objc_msgSend(v59, "addObject:", v24);
            }
            objc_msgSend(v27, "addObject:", v22);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      }
      while (v17);
    }

    v1 = v57;
    if (v57[7])
    {
      v29 = (void *)MEMORY[0x1E0C97B48];
      +[PLPerson entityName](PLPerson, "entityName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fetchRequestWithEntityName:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v64, "allKeys");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "predicateWithFormat:", CFSTR("personUUID IN %@"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x1E0CB3528];
      v36 = v57[7];
      v81[0] = v34;
      v81[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "andPredicateWithSubpredicates:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setPredicate:", v38);

      v73 = v14;
      v2 = v58;
      objc_msgSend(v58, "executeFetchRequest:error:", v31, &v73);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v73;

      if (v39)
        v41 = v39;

      v14 = v40;
      if (v39)
        goto LABEL_24;
    }
    else
    {
      v39 = v59;
      v2 = v58;
      if (v39)
      {
LABEL_24:
        v53 = v14;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v52 = v39;
        obj = v39;
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
        if (v62)
        {
          v61 = *(_QWORD *)v70;
          do
          {
            for (j = 0; j != v62; ++j)
            {
              if (*(_QWORD *)v70 != v61)
                objc_enumerationMutation(obj);
              v44 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
              objc_msgSend(v44, "personUUID");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = 0u;
              v66 = 0u;
              v67 = 0u;
              v68 = 0u;
              v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
              if (v46)
              {
                v47 = v46;
                v48 = *(_QWORD *)v66;
                do
                {
                  for (k = 0; k != v47; ++k)
                  {
                    if (*(_QWORD *)v66 != v48)
                      objc_enumerationMutation(v45);
                    v50 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k);
                    objc_msgSend(v42, "objectForKeyedSubscript:", v50);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v51)
                    {
                      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "setObject:forKeyedSubscript:", v51, v50);
                    }
                    objc_msgSend(v51, "addObject:", v44);

                  }
                  v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
                }
                while (v47);
              }

            }
            v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
          }
          while (v62);
        }

        v1 = v57;
        v2 = v58;
        v39 = v52;
        v14 = v53;
        goto LABEL_44;
      }
    }
    v42 = 0;
LABEL_44:

    v5 = v56;
    v13 = v54;
    v9 = v55;
    goto LABEL_45;
  }
  v42 = 0;
LABEL_45:
  (*(void (**)(void))(v1[8] + 16))();

}

void __126__PLPerson_batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_inManagedObjectContext_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = (void *)a1[9];
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v9 = 0;
  objc_msgSend(v2, "_batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:predicate:includedDetectionTypes:inManagedObjectContext:error:", v3, v4, v5, v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  (*(void (**)(void))(a1[8] + 16))();

}

void __122__PLPerson__batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs_predicate_includedDetectionTypes_inManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v9 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      if ((objc_msgSend(v7, "containsObject:", v5) & 1) == 0)
        objc_msgSend(v8, "addObject:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, v9);
    }

  }
}

void __122__PLPerson_personsMatchingPredicate_fetchLimit_sortDescriptors_relationshipKeyPathsForPrefetching_inManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 72), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v4, "setPredicate:");
  if (*(_QWORD *)(a1 + 80))
    objc_msgSend(v4, "setFetchLimit:");
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v4, "setSortDescriptors:");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:");
  v5 = *(void **)(a1 + 56);
  v13 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &v13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    v10 = 0;
  else
    v10 = *MEMORY[0x1E0D115D0] == 0;
  if (v10)
  {
    __CPLAssetsdOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to find person matching predicate %@: %@", buf, 0x16u);
    }

  }
}

void __66__PLPerson_fetchDuplicatePersonUUIDsInManagedObjectContext_error___block_invoke(_QWORD *a1)
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLPerson entityName](PLPerson, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToGroupBy:", v5);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("count(SELF) > 1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHavingPredicate:", v6);

  objc_msgSend(v4, "setResultType:", 2);
  v18 = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v7);

  v8 = (void *)a1[4];
  v17 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v4, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("personUUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[5] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }
  else
  {
    v15 = *(_QWORD *)(a1[6] + 8);
    v16 = v10;
    v14 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
  }

}

- (BOOL)supportsCloudUpload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision"))
    return 0;
  if (!objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsGraphPeopleHome"))
    return -[PLPerson verifiedType](self, "verifiedType") == 1;
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend((id)objc_opt_class(), "_predicateForSupportedVerifiedTypesForUpload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_predicateForSupportedDetectionTypesForUpload", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend((id)objc_opt_class(), "_predicateToBlockHiddenGraphTypesForUpload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "evaluateWithObject:", self);
  return v9;
}

- (BOOL)isSyncableChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PLPerson changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)objc_opt_class(), "listOfSyncedProperties", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && -[PLPerson _allowSyncOfChangeWithKey:](self, "_allowSyncOfChangeWithKey:", v9))
        {
          v11 = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)_allowSyncOfChangeWithKey:(id)a3
{
  int v4;
  int v5;
  unsigned int v6;

  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("manualOrder")))
    return 1;
  v4 = -[PLPerson cloudLocalState](self, "cloudLocalState");
  v5 = -[PLPerson verifiedType](self, "verifiedType");
  v6 = -[PLPerson manualOrder](self, "manualOrder");
  return v4 != 1 || v5 != 2 || v6 < 0x400;
}

- (void)applyCPLChangeForContactMatchingDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPerson setContactMatchingDictionary:](self, "setContactMatchingDictionary:", v4);
  if (v4 || objc_msgSend(0, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v23[0] = *MEMORY[0x1E0C966E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLContactStoreUtilitiesWorkaround contactWithMatchingDictionary:keysToFetch:contactStore:](PLContactStoreUtilitiesWorkaround, "contactWithMatchingDictionary:keysToFetch:contactStore:", v4, v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[NSManagedObject pointerDescription](self, "pointerDescription");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLPerson personUri](self, "personUri");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412802;
          v18 = v9;
          v19 = 2112;
          v20 = v10;
          v21 = 2112;
          v22 = v11;
          _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Setting contact ID of person %@ to %@ (was %@)", (uint8_t *)&v17, 0x20u);

        }
      }
      objc_msgSend(v7, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPerson setPersonUri:](self, "setPersonUri:", v12);

    }
    else
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[PLPerson personUUID](self, "personUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412290;
          v18 = v14;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Reset contact ID of person %@ to nil since we can't find the contact", (uint8_t *)&v17, 0xCu);

        }
      }
      -[PLPerson setPersonUri:](self, "setPersonUri:", 0);
    }

  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[NSManagedObject pointerDescription](self, "pointerDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v16;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Setting contact ID of person %@ to nil since contactsMatchingDictionary on cloud record was nil", (uint8_t *)&v17, 0xCu);

      }
    }
    -[PLPerson setPersonUri:](self, "setPersonUri:", 0);
  }

}

- (id)scopeIdentifier
{
  void *v2;
  void *v3;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainScopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)scopedIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D11468]);
  -[PLPerson scopeIdentifier](self, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPerson personUUID](self, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithScopeIdentifier:identifier:", v4, v5);

  return v6;
}

- (id)cplPersonChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  PLPerson *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PLPerson personUUID](self, "personUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLPerson scopedIdentifier](self, "scopedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(MEMORY[0x1E0D113F0], "newChangeWithScopedIdentifier:changeType:", v4, 0);
    -[PLPerson fullName](self, "fullName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFullName:", v6);

    -[PLPerson displayName](self, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayName:", v7);

    objc_msgSend(v5, "setPersonType:", (int)-[PLPerson type](self, "type"));
    objc_msgSend(v5, "setManualSortOrder:", -[PLPerson manualOrder](self, "manualOrder"));
    if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsAssetSortOrder"))
      objc_msgSend(v5, "setAssetSortOrder:", (int)-[PLPerson assetSortOrder](self, "assetSortOrder"));
    -[PLPerson contactMatchingDictionary](self, "contactMatchingDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContactMatchingDictionary:", v8);

    if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsGraphPeopleHome"))
    {
      v9 = -[PLPerson cloudVerifiedType](self, "cloudVerifiedType");
      v10 = -[PLPerson cloudDetectionType](self, "cloudDetectionType");
      if (v9 == -2)
      {
        v12 = -2;
      }
      else
      {
        v11 = v10;
        if (v9 == 2)
        {
          if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsDetectionType")
            && +[PLDetectionTrait isPetDetectionType:](PLDetectionTrait, "isPetDetectionType:", v11))
          {
            v12 = 4;
          }
          else
          {
            v12 = 2;
          }
        }
        else if (v9 == 1)
        {
          if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsDetectionType")
            && +[PLDetectionTrait isPetDetectionType:](PLDetectionTrait, "isPetDetectionType:", v11))
          {
            v12 = 3;
          }
          else
          {
            v12 = 1;
          }
        }
        else
        {
          v12 = 0;
        }
      }
      objc_msgSend(v5, "setVerifiedType:", v12);
    }
    if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsMergeTargetRef"))
    {
      -[PLPerson mergeTargetPerson](self, "mergeTargetPerson");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "personUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setMergeTargetPersonIdentifier:", v18);

      }
    }
    if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsDetectionType"))
      objc_msgSend(v5, "setDetectionType:", -[PLPerson cloudDetectionType](self, "cloudDetectionType"));

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing personUUID for person %@, Please file a Radar to Photos Backend iCloud with 'cplctl diagnose' logs and relate to 32789330"), self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PLSimulateCrash();

    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = self;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Trying to upload a person %@ without a personUUID, skipping", buf, 0xCu);
      }

    }
    return 0;
  }
}

- (void)setCPLSyncedMergeTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  PLPerson *v15;
  void *v16;
  void *v17;
  int v18;
  PLPerson *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "finalMergeTargetPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPerson mergeTargetPerson](self, "mergeTargetPerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PLPerson personUUID](self, "personUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      -[PLPerson keyFace](self, "keyFace");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[PLPerson keyFacePickSource](self, "keyFacePickSource");
      v24[0] = self;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "basicMergePersons:", v12);

      objc_msgSend(v5, "keyFace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13 && v10 && v11 == 1)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "personUUID");
            v15 = (PLPerson *)objc_claimAutoreleasedReturnValue();
            -[NSObject uuid](v10, "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPerson personUUID](self, "personUUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 138543874;
            v19 = v15;
            v20 = 2114;
            v21 = v16;
            v22 = 2114;
            v23 = v17;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Final merge target person %{public}@ missing key face, updating to key face %{public}@ from %{public}@", (uint8_t *)&v18, 0x20u);

          }
        }
        objc_msgSend(v5, "setKeyFace:pickSource:", v10, 1);
      }
      goto LABEL_14;
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412546;
        v19 = self;
        v20 = 2112;
        v21 = v4;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to merge %@ to %@, final merge target personUUID is the same", (uint8_t *)&v18, 0x16u);
      }
LABEL_14:

    }
  }

}

- (BOOL)keyFaceIsPicked
{
  return -[PLPerson keyFacePickSource](self, "keyFacePickSource") == 1;
}

- (void)setKeyFaceToPicked
{
  -[PLPerson setKeyFacePickSource:](self, "setKeyFacePickSource:", 1);
}

- (BOOL)userVerified
{
  return -[PLPerson verifiedType](self, "verifiedType") == 1;
}

- (BOOL)graphVerified
{
  return -[PLPerson verifiedType](self, "verifiedType") == 2;
}

- (BOOL)isTombstone
{
  return -[PLPerson verifiedType](self, "verifiedType") == -2;
}

- (id)syncDescription
{
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("personUUID");
  v6[1] = CFSTR("verifiedType");
  v6[2] = CFSTR("fullName");
  v6[3] = CFSTR("cloudLocalState");
  v6[4] = CFSTR("cloudVerifiedType");
  v6[5] = CFSTR("mergeTargetPerson");
  v6[6] = CFSTR("faceCount");
  v6[7] = CFSTR("personUri");
  v6[8] = CFSTR("contactMatchingDictionary");
  v6[9] = CFSTR("type");
  v6[10] = CFSTR("manualOrder");
  v6[11] = CFSTR("detectionType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject truncatedDescriptionWithPropertyKeys:](self, "truncatedDescriptionWithPropertyKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)listOfSyncedProperties
{
  uint64_t *v2;

  if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsGraphPeopleHome"))
  {
    if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsMergeTargetRef"))
    {
      pl_dispatch_once();
      v2 = &listOfSyncedProperties_pl_once_object_1;
    }
    else
    {
      pl_dispatch_once();
      v2 = &listOfSyncedProperties_pl_once_object_2;
    }
  }
  else
  {
    pl_dispatch_once();
    v2 = &listOfSyncedProperties_pl_once_object_3;
  }
  return (id)*v2;
}

+ (id)_predicateForSupportedVerifiedTypesForUpload
{
  pl_dispatch_once();
  return (id)_predicateForSupportedVerifiedTypesForUpload_predicate;
}

+ (id)_predicateForSupportedDetectionTypesForUpload
{
  pl_dispatch_once();
  return (id)_predicateForSupportedDetectionTypesForUpload_predicate;
}

+ (id)_predicateToBlockHiddenGraphTypesForUpload
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K == %d"), CFSTR("type"), 0xFFFFFFFFLL, CFSTR("verifiedType"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notPredicateWithSubpredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)personsToUploadInManagedObjectContext:(id)a3 limit:(int64_t)a4
{
  void *v6;
  id v7;
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
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("cloudLocalState"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v20[0] = v8;
  objc_msgSend(a1, "_predicateForSupportedVerifiedTypesForUpload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v10;
  objc_msgSend(a1, "_predicateForSupportedDetectionTypesForUpload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v11;
  objc_msgSend(a1, "_predicateToBlockHiddenGraphTypesForUpload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("manualOrder"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "personsMatchingPredicate:fetchLimit:sortDescriptors:relationshipKeyPathsForPrefetching:inManagedObjectContext:", v14, a4, v16, 0, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)personsToPrefetchInManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K = %d AND %K != %d AND %K != NULL"), CFSTR("verifiedType"), 1, CFSTR("type"), 0xFFFFFFFFLL, CFSTR("keyFace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("type"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CFSTR("keyFace.assetForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "personsMatchingPredicate:fetchLimit:sortDescriptors:relationshipKeyPathsForPrefetching:inManagedObjectContext:", v6, 100, v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)resetCloudStateInPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = objc_alloc(MEMORY[0x1E0C97AB0]);
  objc_msgSend(a1, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEntityName:", v7);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("cloudLocalState"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultType:", 2);
  objc_msgSend(v8, "setPropertiesToUpdate:", &unk_1E3764710);
  objc_msgSend(v8, "setPredicate:", v9);
  objc_msgSend(v4, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "executeRequest:error:", v8, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  if (v11)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "result");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Batch updated %@ people", buf, 0xCu);

      }
LABEL_8:

    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to batch update people: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v5);
}

+ (BOOL)person:(id)a3 isBetterMergeTargetThanPerson:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "compare:", v7) == -1;
  return (char)v5;
}

void __62__PLPerson_CPL___predicateForSupportedDetectionTypesForUpload__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsDetectionType"))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d OR %K > %d"), CFSTR("detectionType"), 1, CFSTR("detectionType"), 2);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("detectionType"), 1, v2, v3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_predicateForSupportedDetectionTypesForUpload_predicate;
  _predicateForSupportedDetectionTypesForUpload_predicate = v0;

}

void __61__PLPerson_CPL___predicateForSupportedVerifiedTypesForUpload__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d AND %K != %d AND %K != nil"), CFSTR("verifiedType"), 0, CFSTR("verifiedType"), 0xFFFFFFFFLL, CFSTR("personUUID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_predicateForSupportedVerifiedTypesForUpload_predicate;
  _predicateForSupportedVerifiedTypesForUpload_predicate = v0;

}

void __39__PLPerson_CPL__listOfSyncedProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("personUUID");
  v3[1] = CFSTR("fullName");
  v3[2] = CFSTR("displayName");
  v3[3] = CFSTR("type");
  v3[4] = CFSTR("manualOrder");
  v3[5] = CFSTR("contactMatchingDictionary");
  v3[6] = CFSTR("verifiedType");
  v3[7] = CFSTR("mergeTargetPerson");
  v3[8] = CFSTR("assetSortOrder");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)listOfSyncedProperties_pl_once_object_1;
  listOfSyncedProperties_pl_once_object_1 = v1;

}

void __39__PLPerson_CPL__listOfSyncedProperties__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("personUUID");
  v3[1] = CFSTR("fullName");
  v3[2] = CFSTR("displayName");
  v3[3] = CFSTR("type");
  v3[4] = CFSTR("manualOrder");
  v3[5] = CFSTR("contactMatchingDictionary");
  v3[6] = CFSTR("verifiedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)listOfSyncedProperties_pl_once_object_2;
  listOfSyncedProperties_pl_once_object_2 = v1;

}

void __39__PLPerson_CPL__listOfSyncedProperties__block_invoke_3()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("personUUID");
  v3[1] = CFSTR("fullName");
  v3[2] = CFSTR("displayName");
  v3[3] = CFSTR("type");
  v3[4] = CFSTR("manualOrder");
  v3[5] = CFSTR("contactMatchingDictionary");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)listOfSyncedProperties_pl_once_object_3;
  listOfSyncedProperties_pl_once_object_3 = v1;

}

@end

@implementation PLDetectedFaceJournalEntryPayload

- (id)_insertDeferredRebuildFaceForPersonUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  +[PLManagedObject insertInManagedObjectContext:](PLDeferredRebuildFace, "insertInManagedObjectContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payloadIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFaceUUID:", v9);

  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUuid:", v10);

  -[PLDetectedFaceJournalEntryPayload centerX](self, "centerX");
  objc_msgSend(v7, "setCenterX:");
  -[PLDetectedFaceJournalEntryPayload centerY](self, "centerY");
  objc_msgSend(v7, "setCenterY:");
  -[PLDetectedFaceJournalEntryPayload size](self, "size");
  objc_msgSend(v7, "setSize:");
  objc_msgSend(v7, "setManual:", -[PLDetectedFaceJournalEntryPayload isManual](self, "isManual"));
  objc_msgSend(v7, "setHidden:", -[PLDetectedFaceJournalEntryPayload isHidden](self, "isHidden"));
  objc_msgSend(v7, "setNameSource:", -[PLDetectedFaceJournalEntryPayload nameSource](self, "nameSource"));
  objc_msgSend(v7, "setCloudNameSource:", -[PLDetectedFaceJournalEntryPayload cloudNameSource](self, "cloudNameSource"));
  -[PLDetectedFaceJournalEntryPayload assetUUID](self, "assetUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetCloudGUID:", v11);

  -[PLDetectedFaceJournalEntryPayload assetUUID](self, "assetUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetUUID:", v12);

  objc_msgSend(v7, "setPersonUUID:", v6);
  if (-[PLDetectedFaceJournalEntryPayload faceAlgorithmVersion](self, "faceAlgorithmVersion"))
    v13 = -[PLDetectedFaceJournalEntryPayload faceAlgorithmVersion](self, "faceAlgorithmVersion");
  else
    v13 = 1;
  objc_msgSend(v7, "setFaceAlgorithmVersion:", v13);
  return v7;
}

- (id)_insertDetectedFaceWithAsset:(id)a3 inManagedObjectContext:(id)a4 checkExisting:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PLFaceRebuildHelper *v10;
  PLFaceRebuildHelper *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __objc2_class **v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  PLDetectedFaceJournalEntryPayload *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSObject *v32;
  void *v33;
  PLDetectedFaceJournalEntryPayload *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  PLDetectedFaceJournalEntryPayload *v44;
  void *v46;
  PLFaceRebuildHelper *v47;
  id v48;
  void *v49;
  id v50;
  PLDetectedFaceJournalEntryPayload *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  PLDetectedFaceJournalEntryPayload *v65;
  __int16 v66;
  PLDetectedFaceJournalEntryPayload *v67;
  uint64_t v68;

  v5 = a5;
  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[PLFaceRebuildHelper initWithContext:]([PLFaceRebuildHelper alloc], "initWithContext:", v9);
  v11 = v10;
  if (v5)
  {
    -[PLFaceRebuildHelper findExistingDetectedFaceForRebuildFace:onAsset:](v10, "findExistingDetectedFaceForRebuildFace:onAsset:", self, v8);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      PLMigrationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v13, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v15;
        v64 = 2112;
        v65 = self;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Found existing DetectedFace (%{public}@) for payload: %@", buf, 0x16u);

      }
LABEL_46:

      goto LABEL_47;
    }
  }
  -[PLFaceRebuildHelper insertDetectedFaceForRebuildFace:onAsset:](v11, "insertDetectedFaceForRebuildFace:onAsset:", self, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v47 = v11;
    -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "payloadIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUuid:", v17);

    -[PLDetectedFaceJournalEntryPayload personUUID](self, "personUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = off_1E365A000;
    if (v18)
    {
      -[PLDetectedFaceJournalEntryPayload personUUID](self, "personUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v20, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v13, "setAssociatedPerson:", v21);
        if (-[PLDetectedFaceJournalEntryPayload isKeyFace](self, "isKeyFace"))
        {
          objc_msgSend(v21, "keyFace");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
            objc_msgSend(v21, "setKeyFace:pickSource:", v13, objc_msgSend(v21, "keyFacePickSource"));
        }
        if (!PLIsCloudPhotoLibraryEnabledForCurrentUser()
          && (-[PLDetectedFaceJournalEntryPayload nameSource](self, "nameSource") == 1
           || -[PLDetectedFaceJournalEntryPayload nameSource](self, "nameSource") == 5))
        {
          objc_msgSend(v13, "setConfirmedFaceCropGenerationState:", 1);
        }
      }
      else
      {
        PLMigrationGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          -[PLDetectedFaceJournalEntryPayload personUUID](self, "personUUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
          v25 = (PLDetectedFaceJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v63 = v24;
          v64 = 2114;
          v65 = v25;
          v66 = 2112;
          v67 = self;
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Person with %{public}@ not found for face %{public}@ with payload: %@", buf, 0x20u);

        }
      }

    }
    v48 = v8;
    -[PLDetectedFaceJournalEntryPayload rejectedPersonsUUIDs](self, "rejectedPersonsUUIDs");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = self;
    -[PLDetectedFaceJournalEntryPayload clusterRejectedPersonsUUIDs](self, "clusterRejectedPersonsUUIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    v50 = v9;
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v57 != v29)
            objc_enumerationMutation(v26);
          +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i), v9);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend(v13, "addRejectedPerson:", v31);
            objc_msgSend(v13, "addClusterRejectedPerson:", v31);
            objc_msgSend(v13, "addRejectedPersonNeedingFaceCrops:", v31);
          }
          else
          {
            PLMigrationGetLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              -[PLDetectedFaceJournalEntryPayload personUUID](v51, "personUUID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLManagedObjectJournalEntryPayload payloadID](v51, "payloadID");
              v34 = (PLDetectedFaceJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v63 = v33;
              v64 = 2114;
              v65 = v34;
              v66 = 2112;
              v67 = v51;
              v9 = v50;
              _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Cluster rejected person with %{public}@ not found for face %{public}@ with payload: %@", buf, 0x20u);

              v19 = off_1E365A000;
            }

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v28);
    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v14 = v46;
    v35 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v53;
      v49 = v13;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v53 != v37)
            objc_enumerationMutation(v14);
          v39 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
          if ((objc_msgSend(v26, "containsObject:", v39) & 1) == 0)
          {
            -[__objc2_class personWithUUID:inManagedObjectContext:](v19[200], "personWithUUID:inManagedObjectContext:", v39, v9);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              objc_msgSend(v13, "addRejectedPerson:", v40);
            }
            else
            {
              PLMigrationGetLog();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                -[PLDetectedFaceJournalEntryPayload personUUID](v51, "personUUID");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLManagedObjectJournalEntryPayload payloadID](v51, "payloadID");
                v43 = v14;
                v44 = (PLDetectedFaceJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v63 = v42;
                v64 = 2114;
                v65 = v44;
                v66 = 2112;
                v67 = v51;
                v9 = v50;
                _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "Rejected person with %{public}@ not found for face %{public}@ with payload: %@", buf, 0x20u);

                v14 = v43;
                v13 = v49;

                v19 = off_1E365A000;
              }

            }
          }
        }
        v36 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v36);
    }

    v11 = v47;
    v8 = v48;
    goto LABEL_46;
  }
LABEL_47:

  return v13;
}

- (id)_insertDeferredRebuildFacesFromDataInManagedObjectContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLDetectedFaceJournalEntryPayload isDeferrable](self, "isDeferrable"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[PLDetectedFaceJournalEntryPayload assetIdentifierType](self, "assetIdentifierType") == 1)
    {
      -[PLDetectedFaceJournalEntryPayload personUUID](self, "personUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[PLDetectedFaceJournalEntryPayload personUUID](self, "personUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDetectedFaceJournalEntryPayload _insertDeferredRebuildFaceForPersonUUID:inManagedObjectContext:](self, "_insertDeferredRebuildFaceForPersonUUID:inManagedObjectContext:", v7, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          if (-[PLDetectedFaceJournalEntryPayload isKeyFace](self, "isKeyFace"))
            objc_msgSend(v8, "setRepresentative:", 1);
          objc_msgSend(v5, "addObject:", v8);
        }

      }
      -[PLDetectedFaceJournalEntryPayload rejectedPersonsUUIDs](self, "rejectedPersonsUUIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDetectedFaceJournalEntryPayload clusterRejectedPersonsUUIDs](self, "clusterRejectedPersonsUUIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v31 != v13)
              objc_enumerationMutation(v10);
            -[PLDetectedFaceJournalEntryPayload _insertDeferredRebuildFaceForPersonUUID:inManagedObjectContext:](self, "_insertDeferredRebuildFaceForPersonUUID:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              objc_msgSend(v15, "setRejected:", 1);
              objc_msgSend(v16, "setClusterRejected:", 1);
              objc_msgSend(v5, "addObject:", v16);
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v12);
      }
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v17 = v9;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v27;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v27 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
            if ((objc_msgSend(v10, "containsObject:", v22, (_QWORD)v26) & 1) == 0)
            {
              -[PLDetectedFaceJournalEntryPayload _insertDeferredRebuildFaceForPersonUUID:inManagedObjectContext:](self, "_insertDeferredRebuildFaceForPersonUUID:inManagedObjectContext:", v22, v4);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (v23)
              {
                objc_msgSend(v23, "setRejected:", 1);
                objc_msgSend(v5, "addObject:", v24);
              }

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v19);
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)insertFaceFromDataInManagedObjectContext:(id)a3 allowDeferred:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  +[PLCloudAssetPayloadRestore assetForPayload:inManagedObjectContext:](PLCloudAssetPayloadRestore, "assetForPayload:inManagedObjectContext:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PLDetectedFaceJournalEntryPayload _insertDetectedFaceWithAsset:inManagedObjectContext:checkExisting:](self, "_insertDetectedFaceWithAsset:inManagedObjectContext:checkExisting:", v7, v6, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
  }
  else
  {
    if (a4)
    {
      if (*a4)
      {
        -[PLDetectedFaceJournalEntryPayload _insertDeferredRebuildFacesFromDataInManagedObjectContext:](self, "_insertDeferredRebuildFacesFromDataInManagedObjectContext:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      *a4 = objc_msgSend(v9, "count") != 0;
    }
    else
    {
      v9 = 0;
    }
    v8 = objc_msgSend(v9, "count");
  }
  v10 = v8 != 0;

  return v10;
}

- (BOOL)insertWithAssets:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDetectedFaceJournalEntryPayload _insertDetectedFaceWithAsset:inManagedObjectContext:checkExisting:](self, "_insertDetectedFaceWithAsset:inManagedObjectContext:checkExisting:", v7, v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (NSSet)assetIdentifiers
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PLDetectedFaceJournalEntryPayload assetUUID](self, "assetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  return (NSSet *)v3;
}

- (unint64_t)assetIdentifierCount
{
  void *v2;
  unint64_t v3;

  -[PLDetectedFaceJournalEntryPayload assetUUID](self, "assetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setLocalAssetIdentifierForCloudIdentifiers:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDetectedFaceJournalEntryPayload setAssetUUID:](self, "setAssetUUID:", v4);

}

- (int64_t)assetIdentifierType
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("assetIDType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)personUUID
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("person"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isKeyFace
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("personBeingKeyFace"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)assetUUID
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setAssetUUID:(id)a3
{
  id v4;

  -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v4, CFSTR("asset"));

}

- (double)centerX
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("centerX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)centerY
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("centerY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)size
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("size"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)bodyCenterX
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("bodyCenterX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)bodyCenterY
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("bodyCenterY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)bodyWidth
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("bodyWidth"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)bodyHeight
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("bodyHeight"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (id)detectionType
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("detectionType"));
}

- (BOOL)isHidden
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("hidden"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isManual
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("manual"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isRepresentative
{
  PLDetectedFaceJournalEntryPayload *v2;
  SEL v3;

  v2 = (PLDetectedFaceJournalEntryPayload *)_PFAssertFailHandler();
  return -[PLDetectedFaceJournalEntryPayload nameSource](v2, v3);
}

- (int)nameSource
{
  void *v2;
  int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("nameSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)cloudNameSource
{
  void *v2;
  int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("cloudNameSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (BOOL)isClusterRejected
{
  PLDetectedFaceJournalEntryPayload *v2;
  SEL v3;

  v2 = (PLDetectedFaceJournalEntryPayload *)_PFAssertFailHandler();
  return -[PLDetectedFaceJournalEntryPayload rejectedPersonsUUIDs](v2, v3);
}

- (id)rejectedPersonsUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("rejectedPersons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)clusterRejectedPersonsUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("clusterRejectedPersons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDeferrable
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PLDetectedFaceJournalEntryPayload centerX](self, "centerX");
  if (v3 == 0.0)
    return 0;
  -[PLDetectedFaceJournalEntryPayload bodyCenterX](self, "bodyCenterX");
  if (v4 != 0.0)
    return 0;
  -[PLDetectedFaceJournalEntryPayload detectionType](self, "detectionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLDetectedFaceJournalEntryPayload detectionType](self, "detectionType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue") == 1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (int)faceAlgorithmVersion
{
  void *v2;
  int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("faceAlgorithmVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
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
  BOOL v26;
  BOOL result;
  void *v28;
  void *v29;
  void *v30;
  PLDetectedFaceJournalEntryPayload *v31;
  SEL v32;
  id v33;
  id v34;
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  if (!objc_msgSend(v13, "isEqualToKey:", CFSTR("asset")))
  {
    if ((objc_msgSend(v13, "isEqualToKey:", CFSTR("rejectedPersons")) & 1) != 0
      || objc_msgSend(v13, "isEqualToKey:", CFSTR("clusterRejectedPersons")))
    {
      if ((objc_msgSend(v13, "isEqualToKey:", CFSTR("clusterRejectedPersons")) & 1) != 0)
        objc_msgSend(v14, "clusterRejectedPersons");
      else
        objc_msgSend(v14, "rejectedPersons");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "relatedEntityPropertyNames");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anyObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringSet:](self, "encodedDataForUUIDStringSet:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectJournalEntryPayload updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:](self, "updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:", v10, v11, v13, v21);

    }
    else
    {
      if (objc_msgSend(v13, "isEqualToKey:", CFSTR("person")))
      {
        objc_msgSend(v14, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "personUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "key");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, v29);

      }
      else
      {
        if (!objc_msgSend(v13, "isEqualToKey:", CFSTR("personBeingKeyFace")))
        {
          v26 = 0;
          goto LABEL_17;
        }
        v30 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v14, "personBeingKeyFace");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "numberWithInt:", v16 != 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "key");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v28);
      }

    }
LABEL_16:

    v26 = 1;
LABEL_17:

    return v26;
  }
  objc_msgSend(v14, "associatedAssetForFaceOrTorso:orTemporal:", 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, "cloudAssetGUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v16, "cloudAssetGUID");
    else
      objc_msgSend(v16, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "key");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, v24);

    objc_msgSend(v16, "cloudAssetGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v25 = &unk_1E375FA98;
    else
      v25 = &unk_1E375FAB0;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CFSTR("assetIDType"));
    goto LABEL_16;
  }
  v31 = (PLDetectedFaceJournalEntryPayload *)_PFAssertFailHandler();
  -[PLDetectedFaceJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](v31, v32, v33, v34, v35);
  return result;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("asset")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("person")))
  {
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)PLDetectedFaceJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v14, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v10);
  }
  else
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("rejectedPersons")) & 1) == 0
      && !objc_msgSend(v8, "isEqualToString:", CFSTR("clusterRejectedPersons")))
    {
      v12.receiver = self;
      v12.super_class = (Class)PLDetectedFaceJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v12, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v9, v10);
      goto LABEL_8;
    }
    -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PLDetectedFaceJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v13, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v10);
  }

LABEL_8:
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToKey:", CFSTR("asset")) & 1) != 0
    || objc_msgSend(v7, "isEqualToKey:", CFSTR("person")))
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v7, "isEqualToKey:", CFSTR("rejectedPersons")) & 1) == 0
      && !objc_msgSend(v7, "isEqualToKey:", CFSTR("clusterRejectedPersons")))
    {
      v13.receiver = self;
      v13.super_class = (Class)PLDetectedFaceJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v13, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

LABEL_8:
  return v11;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  unint64_t v8;
  id v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  unsigned __int8 v18;
  objc_super v19;

  v8 = (unint64_t)a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isEqualToKey:", CFSTR("asset")))
  {
    if (-[PLDetectedFaceJournalEntryPayload assetIdentifierType](self, "assetIdentifierType"))
    {
      if (-[PLDetectedFaceJournalEntryPayload assetIdentifierType](self, "assetIdentifierType") != 1)
      {
        v12 = 0;
        goto LABEL_11;
      }
      v11 = CFSTR("cloudAssetGUID");
    }
    else
    {
      v11 = CFSTR("uuid");
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    if (!(v8 | v12))
    {
      v14 = 1;
LABEL_16:

      goto LABEL_17;
    }
    v15 = (void *)v12;
    v16 = v8;
    goto LABEL_14;
  }
  if ((objc_msgSend(v10, "isEqualToKey:", CFSTR("rejectedPersons")) & 1) != 0
    || objc_msgSend(v10, "isEqualToKey:", CFSTR("clusterRejectedPersons")))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend((id)v12, "isEqualToSet:", v8);
LABEL_15:
    v14 = v13;
    goto LABEL_16;
  }
  if (objc_msgSend(v10, "isEqualToKey:", CFSTR("personBeingKeyFace")))
  {
    if (!objc_msgSend((id)v8, "BOOLValue"))
    {
      v14 = 0;
      goto LABEL_17;
    }
    -[PLDetectedFaceJournalEntryPayload personUUID](self, "personUUID");
    v12 = objc_claimAutoreleasedReturnValue();
    v15 = v9;
    v16 = v12;
LABEL_14:
    v13 = objc_msgSend(v15, "isEqualToString:", v16);
    goto LABEL_15;
  }
  if (objc_msgSend(v10, "isEqualToKey:", CFSTR("person")))
  {
    v18 = objc_msgSend(v9, "isEqualToString:", v8);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PLDetectedFaceJournalEntryPayload;
    v18 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v19, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10);
  }
  v14 = v18;
LABEL_17:

  return v14;
}

+ (id)modelPropertiesDescription
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
  void *v12;
  void *v13;
  void *v14;
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
  _QWORD v29[2];
  _QWORD v30[19];
  _QWORD v31[21];

  v31[19] = *MEMORY[0x1E0C80C00];
  v30[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  v30[1] = CFSTR("centerX");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v27;
  v30[2] = CFSTR("centerY");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v26;
  v30[3] = CFSTR("size");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v25;
  v30[4] = CFSTR("bodyCenterX");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v24;
  v30[5] = CFSTR("bodyCenterY");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v23;
  v30[6] = CFSTR("bodyWidth");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v22;
  v30[7] = CFSTR("bodyHeight");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v21;
  v30[8] = CFSTR("detectionType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v20;
  v30[9] = CFSTR("nameSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v19;
  v30[10] = CFSTR("cloudNameSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v18;
  v30[11] = CFSTR("hidden");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[11] = v17;
  v30[12] = CFSTR("manual");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[12] = v16;
  v30[13] = CFSTR("faceAlgorithmVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31[13] = v2;
  v30[14] = CFSTR("assetForFace");
  v29[0] = CFSTR("uuid");
  v29[1] = CFSTR("cloudAssetGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("asset"), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v31[14] = v5;
  v30[15] = CFSTR("rejectedPersons");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("personUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("rejectedPersons"), v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v31[15] = v7;
  v30[16] = CFSTR("clusterRejectedPersons");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("personUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("clusterRejectedPersons"), v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v31[16] = v9;
  v30[17] = CFSTR("personForFace");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("personUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("person"), v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v31[17] = v11;
  v30[18] = CFSTR("personBeingKeyFace");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("personUUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("personBeingKeyFace"), v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v31[18] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)nonPersistedModelPropertiesDescription
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
  id v13;
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
  _QWORD v59[55];
  _QWORD v60[57];

  v60[55] = *MEMORY[0x1E0C80C00];
  v59[0] = CFSTR("adjustmentVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v58;
  v59[1] = CFSTR("ageType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v57;
  v59[2] = CFSTR("assetVisible");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v56;
  v59[3] = CFSTR("blurScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v55;
  v59[4] = CFSTR("clusterSequenceNumber");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v54;
  v59[5] = CFSTR("vuObservationID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v53;
  v59[6] = CFSTR("confirmedFaceCropGenerationState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v52;
  v59[7] = CFSTR("eyeMakeupType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v60[7] = v51;
  v59[8] = CFSTR("duration");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v60[8] = v50;
  v59[9] = CFSTR("eyesState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v60[9] = v49;
  v59[10] = CFSTR("facialHairType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v60[10] = v48;
  v59[11] = CFSTR("genderType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60[11] = v47;
  v59[12] = CFSTR("glassesType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60[12] = v46;
  v59[13] = CFSTR("groupingIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v60[13] = v45;
  v59[14] = CFSTR("hairColorType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v60[14] = v44;
  v59[15] = CFSTR("hasSmile");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v60[15] = v43;
  v59[16] = CFSTR("isLeftEyeClosed");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60[16] = v42;
  v59[17] = CFSTR("isRightEyeClosed");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v60[17] = v41;
  v59[18] = CFSTR("lipMakeupType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60[18] = v40;
  v59[19] = CFSTR("faceExpressionType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v60[19] = v39;
  v59[20] = CFSTR("headgearType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[20] = v38;
  v59[21] = CFSTR("hairType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v60[21] = v37;
  v59[22] = CFSTR("poseType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v60[22] = v36;
  v59[23] = CFSTR("skintoneType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v60[23] = v35;
  v59[24] = CFSTR("ethnicityType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v60[24] = v34;
  v59[25] = CFSTR("hasFaceMask");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v60[25] = v33;
  v59[26] = CFSTR("gazeType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[26] = v32;
  v59[27] = CFSTR("gazeCenterX");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v60[27] = v31;
  v59[28] = CFSTR("gazeCenterY");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v60[28] = v30;
  v59[29] = CFSTR("gazeRectString");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v60[29] = v29;
  v59[30] = CFSTR("gazeAngle");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v60[30] = v28;
  v59[31] = CFSTR("gazeConfidence");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60[31] = v27;
  v59[32] = CFSTR("masterIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v60[32] = v26;
  v59[33] = CFSTR("roll");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v60[33] = v25;
  v59[34] = CFSTR("poseYaw");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v60[34] = v24;
  v59[35] = CFSTR("qualityMeasure");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v60[35] = v23;
  v59[36] = CFSTR("quality");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v60[36] = v22;
  v59[37] = CFSTR("smileType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v60[37] = v21;
  v59[38] = CFSTR("sourceHeight");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60[38] = v20;
  v59[39] = CFSTR("sourceWidth");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v60[39] = v19;
  v59[40] = CFSTR("startTime");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60[40] = v18;
  v59[41] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60[41] = v17;
  v59[42] = CFSTR("isInTrash");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[42] = v16;
  v59[43] = CFSTR("trainingType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v60[43] = v15;
  v59[44] = CFSTR("vipModelType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v60[44] = v14;
  v59[45] = CFSTR("assetForTorso");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v60[45] = v2;
  v59[46] = CFSTR("personForTorso");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v60[46] = v3;
  v59[47] = CFSTR("assetForTemporalDetectedFaces");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v60[47] = v4;
  v59[48] = CFSTR("personForTemporalDetectedFaces");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v60[48] = v5;
  v59[49] = CFSTR("faceCrop");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v60[49] = v6;
  v59[50] = CFSTR("faceGroup");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v60[50] = v7;
  v59[51] = CFSTR("faceGroupBeingKeyFace");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60[51] = v8;
  v59[52] = CFSTR("faceprint");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v60[52] = v9;
  v59[53] = CFSTR("rejectedPersonsNeedingFaceCrops");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60[53] = v10;
  v59[54] = CFSTR("detectionTraits");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60[54] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 55);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PLDetectedFaceJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_62295 != -1)
    dispatch_once(&modelProperties_onceToken_62295, block);
  return (id)modelProperties_modelProperties_62296;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PLDetectedFaceJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_62293 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_62293, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_62294;
}

+ (id)payloadClassID
{
  return +[PLDetectedFace entityName](PLDetectedFace, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  unsigned int v10;
  void *v11;
  char v12;
  void *v13;

  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nameSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("manual"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");
    if ((v12 & 1) != 0 || (v8 = 0, v10 <= 5) && ((1 << v10) & 0x2A) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("assetForFace.uuid"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v8 = 1;
        if ((v12 & 1) != 0)
          goto LABEL_12;
      }
      else
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("assetForFace.cloudAssetGUID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v13 != 0;

        if ((v12 & 1) != 0)
        {
LABEL_12:

LABEL_13:
          goto LABEL_14;
        }
      }
    }
    if (v10 > 5 || ((1 << v10) & 0x2A) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v8 = 1;
LABEL_14:

  return v8;
}

void __73__PLDetectedFaceJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_62294;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_62294 = v1;

}

uint64_t __52__PLDetectedFaceJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_62296;
  modelProperties_modelProperties_62296 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_62296, 0);
}

@end

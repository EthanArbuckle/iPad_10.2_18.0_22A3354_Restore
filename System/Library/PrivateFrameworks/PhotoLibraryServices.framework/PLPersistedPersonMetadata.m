@implementation PLPersistedPersonMetadata

- (PLPersistedPersonMetadata)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersistedPersonMetadata.m"), 558, CFSTR("Can't initialize a PLPersistedPersonMetadata object using -init."));

  return 0;
}

- (PLPersistedPersonMetadata)initWithPLPerson:(id)a3 pathManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PLPersistedPersonMetadata *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v7, "personUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_metadataFileURLForPersonUUID:pathManager:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PLPersistedPersonMetadata initWithPLPerson:metadataURL:](self, "initWithPLPerson:metadataURL:", v7, v10);
  return v11;
}

- (PLPersistedPersonMetadata)initWithPLPerson:(id)a3 metadataURL:(id)a4
{
  id v7;
  id v8;
  PLPersistedPersonMetadata *v9;
  PLPersistedPersonMetadata *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLPersistedPersonMetadata;
  v9 = -[PLPersistedPersonMetadata init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    objc_storeStrong((id *)&v10->_metadataURL, a4);
    objc_msgSend(v7, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_cplEnabled = objc_msgSend(v11, "isCloudPhotoLibraryEnabled");

  }
  return v10;
}

- (PLPersistedPersonMetadata)initWithPersistedDataAtURL:(id)a3 cplEnabled:(BOOL)a4
{
  return -[PLPersistedPersonMetadata initWithPersistedDataAtURL:deferUnarchiving:cplEnabled:](self, "initWithPersistedDataAtURL:deferUnarchiving:cplEnabled:", a3, 0, a4);
}

- (PLPersistedPersonMetadata)initWithPersistedDataAtURL:(id)a3 deferUnarchiving:(BOOL)a4 cplEnabled:(BOOL)a5
{
  _BOOL4 v6;
  id v9;
  PLPersistedPersonMetadata *v10;
  PLPersistedPersonMetadata *v11;
  PLPersistedPersonMetadata *v12;
  objc_super v14;

  v6 = a4;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLPersistedPersonMetadata;
  v10 = -[PLPersistedPersonMetadata init](&v14, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_6;
  objc_storeStrong((id *)&v10->_metadataURL, a3);
  v11->_cplEnabled = a5;
  if (!v6)
  {
    if (!-[PLPersistedPersonMetadata readMetadata](v11, "readMetadata"))
      goto LABEL_4;
LABEL_6:
    v12 = v11;
    goto LABEL_7;
  }
  if (-[PLPersistedPersonMetadata _readUUID](v11, "_readUUID"))
    goto LABEL_6;
LABEL_4:
  v12 = 0;
LABEL_7:

  return v12;
}

- (id)detectedFaceIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[PLPersistedPersonMetadata detectedFaces](self, "detectedFaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PLPersistedPersonMetadata detectedFaces](self, "detectedFaces", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "_identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)removePersistedData
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class();
  -[PLPersistedPersonMetadata metadataURL](self, "metadataURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_deleteMetadataFileWithMetadataURL:", v4);

}

- (id)insertPersonFromDataInManagedObjectContext:(id)a3
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
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPersistedPersonMetadata personUUID](self, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonMetadata fullName](self, "fullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:](PLPerson, "insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:", v4, v5, v6, -[PLPersistedPersonMetadata verifiedType](self, "verifiedType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPersistedPersonMetadata detectionType](self, "detectionType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLPersistedPersonMetadata detectionType](self, "detectionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDetectionType:", (__int16)objc_msgSend(v9, "intValue"));

  }
  objc_msgSend(v7, "setCloudVerifiedType:", -[PLPersistedPersonMetadata cloudVerifiedType](self, "cloudVerifiedType"));
  -[PLPersistedPersonMetadata displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayName:", v10);

  objc_msgSend(v7, "setManualOrder:", -[PLPersistedPersonMetadata manualOrder](self, "manualOrder"));
  objc_msgSend(v7, "setType:", -[PLPersistedPersonMetadata type](self, "type"));
  if (-[PLPersistedPersonMetadata verifiedType](self, "verifiedType") != -2)
  {
    -[PLPersistedPersonMetadata personUri](self, "personUri");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPersonUri:", v11);

    -[PLPersistedPersonMetadata contactMatchingDictionary](self, "contactMatchingDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContactMatchingDictionary:", v12);

  }
  objc_msgSend(v7, "setKeyFacePickSource:", -[PLPersistedPersonMetadata keyFacePickSource](self, "keyFacePickSource"));
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PLPersistedPersonMetadata userFeedbacksDictionaryArray](self, "userFeedbacksDictionaryArray", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        +[PLUserFeedback insertIntoManagedObjectContext:withDictionaryRepresentation:](PLUserFeedback, "insertIntoManagedObjectContext:withDictionaryRepresentation:", v4, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  objc_msgSend(v7, "setUserFeedbacks:", v13);
  objc_msgSend(v7, "setAssetSortOrder:", -[PLPersistedPersonMetadata assetSortOrder](self, "assetSortOrder"));

  return v7;
}

- (BOOL)updateFacesInPerson:(id)a3 fromDataInManagedObjectContext:(id)a4 deferUnmatched:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  BOOL v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PLPersistedPersonMetadata _insertDetectedFacesOnPerson:fromDataInManagedObjectContext:deferUnmatched:](self, "_insertDetectedFacesOnPerson:fromDataInManagedObjectContext:deferUnmatched:", v9, v8, v5);
  LOBYTE(v5) = -[PLPersistedPersonMetadata _insertRejectedFacesOnPerson:fromDataInManagedObjectContext:deferUnmatched:](self, "_insertRejectedFacesOnPerson:fromDataInManagedObjectContext:deferUnmatched:", v9, v8, v5);

  return v5 && v10;
}

- (void)_addAssetUUIDsFromFaces:(id)a3 toMutableSet:(id)a4
{
  id v5;
  id v6;
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
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "assetUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (BOOL)hasAllAssetsAvailableInManagedObjectContext:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  id v17;
  uint8_t buf[4];
  PLPersistedPersonMetadata *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonMetadata detectedFaces](self, "detectedFaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonMetadata _addAssetUUIDsFromFaces:toMutableSet:](self, "_addAssetUUIDsFromFaces:toMutableSet:", v9, v8);

  -[PLPersistedPersonMetadata rejectedFaces](self, "rejectedFaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonMetadata _addAssetUUIDsFromFaces:toMutableSet:](self, "_addAssetUUIDsFromFaces:toMutableSet:", v10, v8);

  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = +[PLManagedAsset countForAssetsWithUUIDs:includePendingChanges:inManagedObjectContext:error:](PLManagedAsset, "countForAssetsWithUUIDs:includePendingChanges:inManagedObjectContext:error:", v11, v4, v7, &v17);

  v13 = v17;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch count for assets in person metadata %@, %@", buf, 0x16u);
    }

  }
  v15 = v12 == objc_msgSend(v8, "count");

  return v15;
}

- (BOOL)_insertDetectedFacesOnPerson:(id)a3 fromDataInManagedObjectContext:(id)a4 deferUnmatched:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  PLFaceRebuildHelper *v11;
  PLFaceRebuildHelper *v12;
  id v13;
  id v14;
  NSObject *v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  PLFaceRebuildHelper *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
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
  -[PLPersistedPersonMetadata detectedFaces](self, "detectedFaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLFaceRebuildHelper initWithContext:]([PLFaceRebuildHelper alloc], "initWithContext:", v9);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __104__PLPersistedPersonMetadata__insertDetectedFacesOnPerson_fromDataInManagedObjectContext_deferUnmatched___block_invoke;
  v25 = &unk_1E366F848;
  v12 = v11;
  v26 = v12;
  v13 = v8;
  v27 = v13;
  v29 = &v42;
  v33 = a5;
  v14 = v9;
  v28 = v14;
  v30 = &v38;
  v31 = &v34;
  v32 = &v46;
  +[PLPersistedPersonFaceMetadata enumerateMatchedAssetsWithMetadata:inContext:withBlock:](PLPersistedPersonFaceMetadata, "enumerateMatchedAssetsWithMetadata:inContext:withBlock:", v10, v14, &v22);
  PLMigrationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *((_DWORD *)v43 + 6);
    v17 = *((_DWORD *)v39 + 6);
    v18 = *((_DWORD *)v35 + 6);
    objc_msgSend(v13, "personUUID", v22, v23, v24, v25, v26, v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v51 = v16;
    v52 = 1024;
    v53 = v17;
    v54 = 1024;
    v55 = v18;
    v56 = 2112;
    v57 = v19;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Rebuilt %d detected faces, deferred %d, dropped %d for person %@", buf, 0x1Eu);

  }
  v20 = *((_DWORD *)v47 + 6) == *((_DWORD *)v43 + 6);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v20;
}

- (BOOL)_insertRejectedFacesOnPerson:(id)a3 fromDataInManagedObjectContext:(id)a4 deferUnmatched:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  PLFaceRebuildHelper *v11;
  PLFaceRebuildHelper *v12;
  id v13;
  id v14;
  NSObject *v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  PLFaceRebuildHelper *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
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
  -[PLPersistedPersonMetadata rejectedFaces](self, "rejectedFaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLFaceRebuildHelper initWithContext:]([PLFaceRebuildHelper alloc], "initWithContext:", v9);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __104__PLPersistedPersonMetadata__insertRejectedFacesOnPerson_fromDataInManagedObjectContext_deferUnmatched___block_invoke;
  v25 = &unk_1E366F848;
  v12 = v11;
  v26 = v12;
  v13 = v8;
  v27 = v13;
  v29 = &v42;
  v33 = a5;
  v14 = v9;
  v28 = v14;
  v30 = &v38;
  v31 = &v34;
  v32 = &v46;
  +[PLPersistedPersonFaceMetadata enumerateMatchedAssetsWithMetadata:inContext:withBlock:](PLPersistedPersonFaceMetadata, "enumerateMatchedAssetsWithMetadata:inContext:withBlock:", v10, v14, &v22);
  PLMigrationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *((_DWORD *)v43 + 6);
    v17 = *((_DWORD *)v39 + 6);
    v18 = *((_DWORD *)v35 + 6);
    objc_msgSend(v13, "personUUID", v22, v23, v24, v25, v26, v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v51 = v16;
    v52 = 1024;
    v53 = v17;
    v54 = 1024;
    v55 = v18;
    v56 = 2112;
    v57 = v19;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Rebuilt %d rejected faces, deferred %d, dropped %d for %@", buf, 0x1Eu);

  }
  v20 = *((_DWORD *)v47 + 6) == *((_DWORD *)v43 + 6);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v20;
}

- (id)description
{
  void *person;
  void *v4;
  PLPerson *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  if (self->_person)
    person = self->_person;
  else
    person = self;
  +[PLDescriptionBuilder prettyMultiLineDescriptionBuilderWithObject:indent:](PLDescriptionBuilder, "prettyMultiLineDescriptionBuilderWithObject:indent:", person, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_person;
  if (v5)
  {
    -[PLPerson objectID](v5, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
  }
  else
  {
    -[PLPersistedPersonMetadata metadataURL](self, "metadataURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendName:object:", CFSTR("source"), v7);
  objc_msgSend(v4, "appendName:integerValue:", CFSTR("version"), -[PLPersistedPersonMetadata fromVersion](self, "fromVersion"));
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("personUUID"), "@", &self->_personUUID);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("detectionType"), "@", &self->_detectionType);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("verifiedType"), "i", &self->_verifiedType);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("fullName"), "@", &self->_fullName);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("displayName"), "@", &self->_displayName);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("manualOrder"), "I", &self->_manualOrder);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("type"), "i", &self->_type);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("cloudVerifiedType"), "i", &self->_cloudVerifiedType);
  if (self->_person)
    v8 = self->_person;
  else
    v8 = self;
  objc_msgSend(v8, "detectedFaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (self->_person)
    v11 = self->_person;
  else
    v11 = self;
  objc_msgSend(v11, "rejectedFaces");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(v4, "appendName:integerValue:", CFSTR("faces"), v10);
  objc_msgSend(v4, "appendName:integerValue:", CFSTR("rejected"), v13);
  objc_msgSend(v4, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)_readUUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D50];
  -[PLPersistedPersonMetadata metadataURL](self, "metadataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "pl_safeInitForReadingFromData:", v5);
    v7 = v6 != 0;
    if (v6)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personUUID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedPersonMetadata setPersonUUID:](self, "setPersonUUID:", v8);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)readDetectedFaces
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)MEMORY[0x1E0C99D50];
  -[PLPersistedPersonMetadata metadataURL](self, "metadataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "pl_safeInitForReadingFromData:", v5);
    v7 = -[PLPersistedPersonMetadata readDetectedFacesFromKeyedUnarchiver:](self, "readDetectedFacesFromKeyedUnarchiver:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)readDetectedFacesFromKeyedUnarchiver:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    if (v6 >= 2)
    {
      v7 = v6;
      +[PLPersistedPersonFaceMetadata _persistedFacesWithUnarchiver:key:](PLPersistedPersonFaceMetadata, "_persistedFacesWithUnarchiver:key:", v5, CFSTR("detectedFaces"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PLMigrationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v8, "count");
        -[PLPersistedPersonMetadata personUUID](self, "personUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 134218242;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Found %ld detected faces (pre-migration) for person %@", (uint8_t *)&v14, 0x16u);

      }
      +[PLPersistedPersonFaceMetadata _migrateDetectedFaces:forPersonMetadata:fromVersion:](PLPersistedPersonFaceMetadata, "_migrateDetectedFaces:forPersonMetadata:fromVersion:", v8, self, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPersistedPersonMetadata setDetectedFaces:](self, "setDetectedFaces:", v12);
    }
  }

  return v5 != 0;
}

- (BOOL)readMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  PLPersistedPersonMetadata *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v54;
  int v55;
  int v56;
  __CFString *v57;
  __CFString *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  -[PLPersistedPersonMetadata metadataURL](self, "metadataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "pl_safeInitForReadingFromData:", v5);
    v7 = v6;
    v8 = v6 != 0;
    if (!v6)
    {
LABEL_57:

      goto LABEL_58;
    }
    v9 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("version"));
    -[PLPersistedPersonMetadata setFromVersion:](self, "setFromVersion:", v9);
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedPersonMetadata setPersonUUID:](self, "setPersonUUID:", v10);

    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("detectionType")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)objc_msgSend(v7, "decodeIntForKey:", CFSTR("detectionType")));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedPersonMetadata setDetectionType:](self, "setDetectionType:", v11);

    }
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mergeTargetPersonUUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedPersonMetadata setMergeTargetPersonUUID:](self, "setMergeTargetPersonUUID:", v12);

    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullName"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_1E36789C0;
    v16 = v15;

    v58 = v16;
    -[PLPersistedPersonMetadata setFullName:](self, "setFullName:", v16);
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = &stru_1E36789C0;
    v20 = v19;

    v57 = v20;
    -[PLPersistedPersonMetadata setDisplayName:](self, "setDisplayName:", v20);
    -[PLPersistedPersonMetadata setManualOrder:](self, "setManualOrder:", objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("manualOrder")));
    -[PLPersistedPersonMetadata setType:](self, "setType:", objc_msgSend(v7, "decodeInt32ForKey:", CFSTR("personType")));
    v56 = objc_msgSend(v7, "containsValueForKey:", CFSTR("keyFacePickSource"));
    if (v56)
      -[PLPersistedPersonMetadata setKeyFacePickSource:](self, "setKeyFacePickSource:", (__int16)objc_msgSend(v7, "decodeInt32ForKey:", CFSTR("keyFacePickSource")));
    v21 = objc_msgSend(v7, "containsValueForKey:", CFSTR("verifiedType"));
    v22 = v21;
    if (v21)
    {
      v23 = objc_msgSend(v7, "decodeInt32ForKey:", CFSTR("verifiedType"));
      -[PLPersistedPersonMetadata setVerifiedType:](self, "setVerifiedType:", v23);
      if (objc_msgSend(v7, "containsValueForKey:", CFSTR("cloudVerifiedType")))
      {
        v24 = objc_msgSend(v7, "decodeInt32ForKey:", CFSTR("cloudVerifiedType"));
        v25 = self;
      }
      else
      {
        PLMigrationGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Person metatdata contains verifiedType but not cloudVerifiedType", buf, 2u);
        }

        v25 = self;
        v24 = v23;
      }
      -[PLPersistedPersonMetadata setCloudVerifiedType:](v25, "setCloudVerifiedType:", v24);
    }
    else
    {
      PLMigrationGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[PLPersistedPersonMetadata personUUID](self, "personUUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v65 = (uint64_t)v27;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Person metadata for %@ does not contain verifiedType, needs fixup later", buf, 0xCu);

      }
    }
    if (-[PLPersistedPersonMetadata verifiedType](self, "verifiedType") != -2)
    {
      objc_msgSend(v7, "decodePropertyListForKey:", CFSTR("contactMatchingDictionary"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedPersonMetadata setContactMatchingDictionary:](self, "setContactMatchingDictionary:", v29);

      objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personUri"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedPersonMetadata setPersonUri:](self, "setPersonUri:", v30);

    }
    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, v34, v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v36, CFSTR("userFeedbacks"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedPersonMetadata setUserFeedbacksDictionaryArray:](self, "setUserFeedbacksDictionaryArray:", v37);

    -[PLPersistedPersonMetadata setAssetSortOrder:](self, "setAssetSortOrder:", (__int16)objc_msgSend(v7, "decodeIntForKey:", CFSTR("assetSortOrder")));
    if (v9 >= 2)
    {
      -[PLPersistedPersonMetadata readDetectedFacesFromKeyedUnarchiver:](self, "readDetectedFacesFromKeyedUnarchiver:", v7);
      -[PLPersistedPersonMetadata detectedFaces](self, "detectedFaces");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v39, "count") != 0;

      if (v9 < 5)
      {
        PLMigrationGetLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          -[PLPersistedPersonMetadata personUUID](self, "personUUID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v65 = (uint64_t)v44;
          _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "Dropping all rejected faces for person %@", buf, 0xCu);

        }
      }
      else
      {
        +[PLPersistedPersonFaceMetadata _persistedFacesWithUnarchiver:key:](PLPersistedPersonFaceMetadata, "_persistedFacesWithUnarchiver:key:", v7, CFSTR("rejectedFaces"));
        v40 = objc_claimAutoreleasedReturnValue();
        PLMigrationGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = -[NSObject count](v40, "count");
          -[PLPersistedPersonMetadata personUUID](self, "personUUID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v65 = v42;
          v66 = 2112;
          v67 = v43;
          _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEFAULT, "Found %ld rejected faces for person %@", buf, 0x16u);

        }
        -[PLPersistedPersonMetadata setRejectedFaces:](self, "setRejectedFaces:", v40);
      }

      if ((v22 & 1) != 0)
        goto LABEL_42;
    }
    else
    {
      v38 = 0;
      if ((v22 & 1) != 0)
        goto LABEL_42;
    }
    if (self->_cplEnabled)
    {
      -[PLPersistedPersonMetadata fullName](self, "fullName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "length") || -[PLPersistedPersonMetadata type](self, "type"))
      {

      }
      else
      {
        -[PLPersistedPersonMetadata contactMatchingDictionary](self, "contactMatchingDictionary");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
          v55 = 1;
        else
          v55 = v38;

        if (v55 != 1)
        {
          v46 = 0xFFFFFFFFLL;
          goto LABEL_41;
        }
      }
    }
    v46 = 1;
LABEL_41:
    -[PLPersistedPersonMetadata setVerifiedType:](self, "setVerifiedType:", v46);
    -[PLPersistedPersonMetadata setCloudVerifiedType:](self, "setCloudVerifiedType:", v46);
LABEL_42:
    if ((v56 & 1) == 0)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      -[PLPersistedPersonMetadata detectedFaces](self, "detectedFaces");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v60;
        while (2)
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v60 != v50)
              objc_enumerationMutation(v47);
            v52 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            if (objc_msgSend(v52, "isRepresentative"))
            {
              if (objc_msgSend(v52, "nameSource") == 1
                || objc_msgSend(v52, "nameSource") == 3)
              {
                -[PLPersistedPersonMetadata setKeyFacePickSource:](self, "setKeyFacePickSource:", 1);
              }
              goto LABEL_55;
            }
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          if (v49)
            continue;
          break;
        }
      }
LABEL_55:

    }
    v8 = 1;
    goto LABEL_57;
  }
  v8 = 0;
LABEL_58:

  return v8;
}

- (id)_metadataData
{
  void *v3;
  void *person;
  void *v5;
  void *v6;
  PLPerson *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  int v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  int v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeInteger:forKey:", 10, CFSTR("version"));
  if (self->_person)
    person = self->_person;
  else
    person = self;
  objc_msgSend(person, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "personUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v5, v6);

  }
  v7 = self->_person;
  if (v7)
    goto LABEL_7;
  -[PLPersistedPersonMetadata detectionType](self, "detectionType");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v7 = self->_person;
    if (!v7)
    {
      -[PLPersistedPersonMetadata detectionType](self, "detectionType");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v63, "intValue");

      goto LABEL_8;
    }
LABEL_7:
    v8 = -[PLPerson detectionType](v7, "detectionType");
LABEL_8:
    objc_msgSend(v3, "encodeInt:forKey:", v8, CFSTR("detectionType"));
  }
  if (self->_person)
    v9 = self->_person;
  else
    v9 = self;
  objc_msgSend(v9, "fullName");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fullName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v10, v11);

  }
  if (self->_person)
    v12 = self->_person;
  else
    v12 = self;
  objc_msgSend(v12, "displayName");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v13, v14);

  }
  if (self->_person)
    v15 = self->_person;
  else
    v15 = self;
  v16 = objc_msgSend(v15, "manualOrder");
  if (v16)
    objc_msgSend(v3, "encodeInteger:forKey:", v16, CFSTR("manualOrder"));
  if (self->_person)
    v17 = self->_person;
  else
    v17 = self;
  v18 = objc_msgSend(v17, "type");
  if ((_DWORD)v18)
    objc_msgSend(v3, "encodeInt32:forKey:", v18, CFSTR("personType"));
  if (self->_person)
    v19 = self->_person;
  else
    v19 = self;
  v20 = objc_msgSend(v19, "keyFacePickSource");
  if ((_DWORD)v20)
    objc_msgSend(v3, "encodeInt32:forKey:", v20, CFSTR("keyFacePickSource"));
  if (self->_person)
    v21 = self->_person;
  else
    v21 = self;
  v22 = objc_msgSend(v21, "verifiedType");
  if (!(_DWORD)v22 || (v23 = v22, objc_msgSend(v3, "encodeInt32:forKey:", v22, CFSTR("verifiedType")), v23 != -2))
  {
    if (self->_person)
      v24 = self->_person;
    else
      v24 = self;
    objc_msgSend(v24, "personUri");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "personUri");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "encodeObject:forKey:", v25, v26);

    }
    if (self->_person)
      v27 = self->_person;
    else
      v27 = self;
    objc_msgSend(v27, "contactMatchingDictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v3, "encodeObject:forKey:", v28, CFSTR("contactMatchingDictionary"));

  }
  v67 = (void *)v13;
  v68 = (void *)v10;
  if (self->_person)
    v29 = self->_person;
  else
    v29 = self;
  v30 = objc_msgSend(v29, "cloudVerifiedType");
  if ((_DWORD)v30)
    objc_msgSend(v3, "encodeInt32:forKey:", v30, CFSTR("cloudVerifiedType"));
  if (self->_person)
    v31 = self->_person;
  else
    v31 = self;
  objc_msgSend(v31, "userFeedbacks");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v34 = v32;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v70 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "dictionaryRepresentation");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v39);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v36);
  }

  if (objc_msgSend(v33, "count"))
    objc_msgSend(v3, "encodeObject:forKey:", v33, CFSTR("userFeedbacks"));
  if (self->_person)
    v40 = self->_person;
  else
    v40 = self;
  v41 = objc_msgSend(v40, "assetSortOrder");
  if ((_DWORD)v41)
    objc_msgSend(v3, "encodeInt32:forKey:", v41, CFSTR("assetSortOrder"));
  if (self->_person)
  {
    objc_msgSend((id)objc_opt_class(), "_detectedFacesToArchiveWithPerson:", self->_person);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "count"))
    {
      -[PLPerson keyFace](self->_person, "keyFace");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_persistedFaceMetadataWithFaces:keyFace:clusterRejectedFaceIDs:", v42, v43, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v42, "count");
      if (v45 != objc_msgSend(v44, "count"))
      {
        v46 = v5;
        PLMigrationGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = objc_msgSend(v42, "count");
          v49 = objc_msgSend(v44, "count");
          *(_DWORD *)buf = 138412546;
          v74 = v46;
          v75 = 1024;
          v76 = v48 - v49;
          _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_ERROR, "Failed to encode some detected faces as metadata for %@ (%d failed)", buf, 0x12u);
        }

        v5 = v46;
      }
      objc_msgSend(v3, "encodeObject:forKey:", v44, CFSTR("detectedFaces"));

    }
    v50 = v5;
    objc_msgSend((id)objc_opt_class(), "_rejectedFacesToArchiveWithPerson:", self->_person);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_clusterRejectedFaceIDsWithPerson:", self->_person);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "count"))
    {
      v53 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "_persistedFaceMetadataWithFaces:keyFace:clusterRejectedFaceIDs:", v51, 0, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = objc_msgSend(v51, "count");
      if (v56 != objc_msgSend(v55, "count"))
      {
        PLMigrationGetLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v66 = objc_msgSend(v51, "count");
          v58 = objc_msgSend(v55, "count");
          *(_DWORD *)buf = 138412546;
          v74 = v50;
          v75 = 1024;
          v76 = v66 - v58;
          _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "Failed to encode some rejected faces as metadata for %@ (%d failed)", buf, 0x12u);
        }

      }
      objc_msgSend(v3, "encodeObject:forKey:", v55, CFSTR("rejectedFaces"));

    }
    -[PLPerson mergeTargetPerson](self->_person, "mergeTargetPerson");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "personUUID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mergeTargetPersonUUID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "encodeObject:forKey:", v60, v61);

    }
    v5 = v50;
  }
  else
  {
    -[PLPersistedPersonMetadata detectedFaces](self, "detectedFaces");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "count"))
      objc_msgSend(v3, "encodeObject:forKey:", v42, CFSTR("detectedFaces"));
    -[PLPersistedPersonMetadata rejectedFaces](self, "rejectedFaces");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "count"))
      objc_msgSend(v3, "encodeObject:forKey:", v51, CFSTR("rejectedFaces"));
  }

  objc_msgSend(v3, "encodedData");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (void)_saveMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLPersistedPersonMetadata _metadataData](self, "_metadataData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D73200];
  -[PLPersistedPersonMetadata metadataURL](self, "metadataURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistMetadata:fileURL:", v4, v6);

  v7 = (void *)MEMORY[0x1E0D73208];
  -[PLPersistedPersonMetadata metadataURL](self, "metadataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeFileOwnerToMobileAtPath:error:", v9, 0);

  objc_autoreleasePoolPop(v3);
}

- (BOOL)matchesEntityInLibraryBackedByManagedObjectContext:(id)a3 diff:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char IsEqual;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  _QWORD v53[2];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLPersistedPersonMetadata personUUID](self, "personUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedPersonMetadata fullName](self, "fullName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fullName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IsEqual = PLObjectIsEqual();

    if ((IsEqual & 1) == 0)
    {
      -[PLPersistedPersonMetadata fullName](self, "fullName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_pl_setNonNilObject:forKey:", v14, CFSTR("fullName"));

      objc_msgSend(v8, "fullName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v15, CFSTR("fullName"));

    }
    -[PLPersistedPersonMetadata displayName](self, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = PLObjectIsEqual();

    if ((v18 & 1) == 0)
    {
      -[PLPersistedPersonMetadata displayName](self, "displayName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_pl_setNonNilObject:forKey:", v19, CFSTR("displayName"));

      objc_msgSend(v8, "displayName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v20, CFSTR("displayName"));

    }
    v21 = -[PLPersistedPersonMetadata verifiedType](self, "verifiedType");
    if (v21 != objc_msgSend(v8, "verifiedType"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPersistedPersonMetadata verifiedType](self, "verifiedType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v22, CFSTR("verifiedType"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "verifiedType"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v23, CFSTR("verifiedType"));

    }
    if (-[PLPersistedPersonMetadata verifiedType](self, "verifiedType") != -2)
    {
      -[PLPersistedPersonMetadata personUri](self, "personUri");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "personUri");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = PLObjectIsEqual();

      if ((v26 & 1) == 0)
      {
        -[PLPersistedPersonMetadata personUri](self, "personUri");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_pl_setNonNilObject:forKey:", v27, CFSTR("personUri"));

        objc_msgSend(v8, "personUri");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v28, CFSTR("personUri"));

      }
      -[PLPersistedPersonMetadata contactMatchingDictionary](self, "contactMatchingDictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contactMatchingDictionary");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = PLObjectIsEqual();

      if ((v31 & 1) == 0)
      {
        -[PLPersistedPersonMetadata contactMatchingDictionary](self, "contactMatchingDictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_pl_setNonNilObject:forKey:", v32, CFSTR("contactMatchingDictionary"));

        objc_msgSend(v8, "contactMatchingDictionary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v33, CFSTR("contactMatchingDictionary"));

      }
    }
    v34 = -[PLPersistedPersonMetadata manualOrder](self, "manualOrder");
    if (v34 != objc_msgSend(v8, "manualOrder"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLPersistedPersonMetadata manualOrder](self, "manualOrder"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v35, CFSTR("manualOrder"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v8, "manualOrder"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v36, CFSTR("manualOrder"));

    }
    v37 = -[PLPersistedPersonMetadata type](self, "type");
    if (v37 != objc_msgSend(v8, "type"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPersistedPersonMetadata type](self, "type"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v38, CFSTR("personType"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "type"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v39, CFSTR("personType"));

    }
    v40 = -[PLPersistedPersonMetadata keyFacePickSource](self, "keyFacePickSource");
    if (v40 != objc_msgSend(v8, "keyFacePickSource"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLPersistedPersonMetadata keyFacePickSource](self, "keyFacePickSource"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v41, CFSTR("keyFacePickSource"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v8, "keyFacePickSource"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v42, CFSTR("keyFacePickSource"));

    }
    -[PLPersistedPersonMetadata detectionType](self, "detectionType");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[PLPersistedPersonMetadata detectionType](self, "detectionType");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "intValue");
      v46 = objc_msgSend(v8, "detectionType");

      if (v45 != v46)
      {
        v47 = (void *)MEMORY[0x1E0CB37E8];
        -[PLPersistedPersonMetadata detectionType](self, "detectionType");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "numberWithInt:", objc_msgSend(v48, "intValue"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v49, CFSTR("detectionType"));

LABEL_26:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v8, "detectionType"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v51, CFSTR("detectionType"));

      }
    }
    else if (objc_msgSend(v8, "detectionType") != 1)
    {
      objc_msgSend(v9, "setObject:forKey:", &unk_1E375FCD8, CFSTR("detectionType"));
      goto LABEL_26;
    }
    if (a4)
    {
      v53[0] = CFSTR("metadata");
      v53[1] = CFSTR("library");
      v54[0] = v9;
      v54[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v9, "count"))
      v50 = 0;
    else
      v50 = objc_msgSend(v10, "count") == 0;

    goto LABEL_33;
  }
  v50 = 0;
  if (a4)
    *a4 = 0;
LABEL_33:

  return v50;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
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
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[13];
  _QWORD v33[15];

  v33[13] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("personUUID");
  -[PLPersistedPersonMetadata personUUID](self, "personUUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v31;
  v32[1] = CFSTR("detectionType");
  -[PLPersistedPersonMetadata detectionType](self, "detectionType");
  v3 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v3;
  v4 = &unk_1E375FCD8;
  if (v3)
    v4 = (void *)v3;
  v33[1] = v4;
  v32[2] = CFSTR("fromVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLPersistedPersonMetadata fromVersion](self, "fromVersion"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v29;
  v32[3] = CFSTR("verifiedType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPersistedPersonMetadata verifiedType](self, "verifiedType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v28;
  v32[4] = CFSTR("fullName");
  -[PLPersistedPersonMetadata fullName](self, "fullName");
  v5 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = &stru_1E36789C0;
  v33[4] = v6;
  v32[5] = CFSTR("displayName");
  -[PLPersistedPersonMetadata displayName](self, "displayName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (const __CFString *)v7;
  else
    v8 = &stru_1E36789C0;
  v33[5] = v8;
  v32[6] = CFSTR("personUri");
  -[PLPersistedPersonMetadata personUri](self, "personUri", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E36789C0;
  v33[6] = v11;
  v32[7] = CFSTR("contactMatchingDictionary");
  -[PLPersistedPersonMetadata contactMatchingDictionary](self, "contactMatchingDictionary");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E36789C0;
  v33[7] = v14;
  v32[8] = CFSTR("manualOrder");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLPersistedPersonMetadata manualOrder](self, "manualOrder"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v15;
  v32[9] = CFSTR("personType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPersistedPersonMetadata type](self, "type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v16;
  v32[10] = CFSTR("keyFacePickSource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLPersistedPersonMetadata keyFacePickSource](self, "keyFacePickSource"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v17;
  v32[11] = CFSTR("detectedFacesCount");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPersistedPersonMetadata detectedFaces](self, "detectedFaces");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v20;
  v32[12] = CFSTR("rejectedFacesCount");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPersistedPersonMetadata rejectedFaces](self, "rejectedFaces");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[12] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSString)personUUID
{
  return self->_personUUID;
}

- (void)setPersonUUID:(id)a3
{
  objc_storeStrong((id *)&self->_personUUID, a3);
}

- (NSNumber)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(id)a3
{
  self->_detectionType = (NSNumber *)a3;
}

- (NSString)mergeTargetPersonUUID
{
  return self->_mergeTargetPersonUUID;
}

- (void)setMergeTargetPersonUUID:(id)a3
{
  objc_storeStrong((id *)&self->_mergeTargetPersonUUID, a3);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)personUri
{
  return self->_personUri;
}

- (void)setPersonUri:(id)a3
{
  objc_storeStrong((id *)&self->_personUri, a3);
}

- (unsigned)manualOrder
{
  return self->_manualOrder;
}

- (void)setManualOrder:(unsigned int)a3
{
  self->_manualOrder = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)verifiedType
{
  return self->_verifiedType;
}

- (void)setVerifiedType:(int)a3
{
  self->_verifiedType = a3;
}

- (int)cloudVerifiedType
{
  return self->_cloudVerifiedType;
}

- (void)setCloudVerifiedType:(int)a3
{
  self->_cloudVerifiedType = a3;
}

- (NSArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
  objc_storeStrong((id *)&self->_detectedFaces, a3);
}

- (NSArray)rejectedFaces
{
  return self->_rejectedFaces;
}

- (void)setRejectedFaces:(id)a3
{
  objc_storeStrong((id *)&self->_rejectedFaces, a3);
}

- (NSDictionary)contactMatchingDictionary
{
  return self->_contactMatchingDictionary;
}

- (void)setContactMatchingDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (signed)keyFacePickSource
{
  return self->_keyFacePickSource;
}

- (void)setKeyFacePickSource:(signed __int16)a3
{
  self->_keyFacePickSource = a3;
}

- (NSString)userFeedbackUUID
{
  return self->_userFeedbackUUID;
}

- (signed)userFeedbackType
{
  return self->_userFeedbackType;
}

- (signed)userFeedbackFeature
{
  return self->_userFeedbackFeature;
}

- (NSString)userFeedbackContext
{
  return self->_userFeedbackContext;
}

- (NSDate)userFeedbackLastModifiedDate
{
  return self->_userFeedbackLastModifiedDate;
}

- (NSSet)userFeedbacks
{
  return self->_userFeedbacks;
}

- (void)setUserFeedbacks:(id)a3
{
  objc_storeStrong((id *)&self->_userFeedbacks, a3);
}

- (NSArray)userFeedbacksDictionaryArray
{
  return self->_userFeedbacksDictionaryArray;
}

- (void)setUserFeedbacksDictionaryArray:(id)a3
{
  objc_storeStrong((id *)&self->_userFeedbacksDictionaryArray, a3);
}

- (signed)assetSortOrder
{
  return self->_assetSortOrder;
}

- (void)setAssetSortOrder:(signed __int16)a3
{
  self->_assetSortOrder = a3;
}

- (int64_t)fromVersion
{
  return self->_fromVersion;
}

- (void)setFromVersion:(int64_t)a3
{
  self->_fromVersion = a3;
}

- (PLPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (void)setMetadataURL:(id)a3
{
  objc_storeStrong((id *)&self->_metadataURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_userFeedbacksDictionaryArray, 0);
  objc_storeStrong((id *)&self->_userFeedbacks, 0);
  objc_storeStrong((id *)&self->_userFeedbackLastModifiedDate, 0);
  objc_storeStrong((id *)&self->_userFeedbackContext, 0);
  objc_storeStrong((id *)&self->_userFeedbackUUID, 0);
  objc_storeStrong((id *)&self->_contactMatchingDictionary, 0);
  objc_storeStrong((id *)&self->_rejectedFaces, 0);
  objc_storeStrong((id *)&self->_detectedFaces, 0);
  objc_storeStrong((id *)&self->_personUri, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_mergeTargetPersonUUID, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
}

void __104__PLPersistedPersonMetadata__insertRejectedFacesOnPerson_fromDataInManagedObjectContext_deferUnmatched___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "rebuildRejectedFace:onAsset:person:", v5, v6, *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 56);
LABEL_11:
    ++*(_DWORD *)(*(_QWORD *)(v7 + 8) + 24);
    goto LABEL_12;
  }
  if (!*(_BYTE *)(a1 + 88)
    || (objc_msgSend(v5, "assetCloudGUID"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    PLMigrationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Dropping unmatched face: %@", (uint8_t *)&v13, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 72);
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "personUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_insertDeferredRebuildFaceFromDataInManagedObjectContext:personUUID:isRejected:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

LABEL_12:
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);

}

void __104__PLPersistedPersonMetadata__insertDetectedFacesOnPerson_fromDataInManagedObjectContext_deferUnmatched___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "rebuildDetectedFace:onAsset:person:", v5, v6, *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 56);
LABEL_13:
    ++*(_DWORD *)(*(_QWORD *)(v7 + 8) + 24);
    goto LABEL_14;
  }
  if (!*(_BYTE *)(a1 + 88)
    || (objc_msgSend(v5, "assetCloudGUID"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    PLMigrationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Dropping unmatched face: %@", (uint8_t *)&v13, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 72);
    goto LABEL_13;
  }
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "personUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_insertDeferredRebuildFaceFromDataInManagedObjectContext:personUUID:isRejected:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v5, "isRepresentative"))
      objc_msgSend(v11, "setRepresentative:", 1);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }

LABEL_14:
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);

}

+ (BOOL)isValidPath:(id)a3
{
  return objc_msgSend(a1, "isValidPath:outPersonUUID:", a3, 0);
}

+ (BOOL)isValidPath:(id)a3 outPersonUUID:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", PLFaceMetadataExtension);
  v8 = v7;
  if (a4 && v7)
  {
    objc_msgSend(v5, "pathComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByDeletingPathExtension");
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)_metadataFileURLForPersonUUID:(id)a3 pathManager:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a3;
  objc_msgSend(a4, "privateDirectoryWithSubType:createIfNeeded:error:", 5, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, PLFaceMetadataExtension);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)urlsForPersistedPersonsInMetadataDirectoryOfLibrary:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "urlsForPersistedPersonsInMetadataDirectoryWithPathManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)urlsForPersistedPersonsInMetadataDirectoryWithPathManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "privateDirectoryWithSubType:createIfNeeded:error:", 5, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__PLPersistedPersonMetadata_urlsForPersistedPersonsInMetadataDirectoryWithPathManager___block_invoke;
  v11[3] = &__block_descriptor_40_e15_B16__0__NSURL_8l;
  v11[4] = a1;
  objc_msgSend(v8, "_pl_filter:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)deleteMetadataFileForPersonUUID:(id)a3 pathManager:(id)a4
{
  id v4;
  void *v5;

  v4 = a1;
  objc_msgSend(a1, "_metadataFileURLForPersonUUID:pathManager:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "_deleteMetadataFileWithMetadataURL:", v5);

  return (char)v4;
}

+ (BOOL)_deleteMetadataFileWithMetadataURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v8 = objc_msgSend(v7, "removeItemAtURL:error:", v3, &v17);
    v9 = v17;

    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v8 & 1) != 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v3;
        v12 = "Removed person persistence data at URL %@";
        v13 = v11;
        v14 = OS_LOG_TYPE_INFO;
        v15 = 12;
LABEL_10:
        _os_log_impl(&dword_199541000, v13, v14, v12, buf, v15);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v3;
      v20 = 2112;
      v21 = v9;
      v12 = "Failed to remove person persistence data at URL (%@) with error: %@";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  PLMigrationGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Attempting to remove person persistence data that does not exist at URL %@", buf, 0xCu);
  }
  v8 = 0;
LABEL_12:

  return v8;
}

+ (id)_fetchFacesWithPredicate:(id)a3 resultType:(unint64_t)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;

  v9 = a5;
  v10 = a3;
  +[PLDetectedFace fetchRequest](PLDetectedFace, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v10);

  objc_msgSend(v11, "setFetchBatchSize:", 100);
  objc_msgSend(v11, "setResultType:", a4);
  if (a4 != 1)
  {
    +[PLPersistedPersonFaceMetadata _detectedFaceRelationshipKeyPathsToPrefetch](PLPersistedPersonFaceMetadata, "_detectedFaceRelationshipKeyPathsToPrefetch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRelationshipKeyPathsForPrefetching:", v12);

  }
  v17 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v11, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;
  v15 = v14;
  if (a6 && !v13)
    *a6 = objc_retainAutorelease(v14);

  return v13;
}

+ (id)_detectedFacesToArchiveWithPerson:(id)a3
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
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("personForFace"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDetectedFace predicateForArchival](PLDetectedFace, "predicateForArchival");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v23[0] = v7;
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(a1, "_fetchFacesWithPredicate:resultType:managedObjectContext:error:", v11, 0, v12, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;

  if (!v13)
  {
    PLMigrationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "personUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch detectedFacesToArchiveFromPerson %@: %@", buf, 0x16u);

    }
  }

  return v13;
}

+ (id)_rejectedFacesToArchiveWithPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("rejectedPersons"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(a1, "_fetchFacesWithPredicate:resultType:managedObjectContext:error:", v5, 0, v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (!v7)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "personUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch rejectedFacesToArchiveWithPerson %@: %@", buf, 0x16u);

    }
  }

  return v7;
}

+ (id)_clusterRejectedFaceIDsWithPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("clusterRejectedPersons"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(a1, "_fetchFacesWithPredicate:resultType:managedObjectContext:error:", v5, 1, v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (!v7)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "personUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch clusterRejectedFaceIDsWithPerson %@: %@", buf, 0x16u);

    }
  }

  return v7;
}

+ (id)_persistedFaceMetadataWithFaces:(id)a3 keyFace:(id)a4 clusterRejectedFaceIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v10, "isEqual:", v16);

        objc_msgSend(v15, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v9, "containsObject:", v18);

        +[PLPersistedPersonFaceMetadata _persistedFaceMetadataWithDetectedFace:isKeyFace:isClusterRejected:](PLPersistedPersonFaceMetadata, "_persistedFaceMetadataWithDetectedFace:isKeyFace:isClusterRejected:", v15, v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v24, "addObject:", v20);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  return v24;
}

+ (id)personUUIDsToDedupeWithMetadataURLs:(id)a3 cplEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  PLPersistedPersonMetadata *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v30;
  void *context;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  context = (void *)MEMORY[0x19AEC1554]();
  PLMigrationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Deduping person metadata archives based on their sets of faces", buf, 2u);
  }

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v13 = -[PLPersistedPersonMetadata initWithPersistedDataAtURL:deferUnarchiving:cplEnabled:]([PLPersistedPersonMetadata alloc], "initWithPersistedDataAtURL:deferUnarchiving:cplEnabled:", v12, 1, v4);
        -[PLPersistedPersonMetadata personUUID](v13, "personUUID");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = -[PLPersistedPersonMetadata readDetectedFaces](v13, "readDetectedFaces");

          if (v16)
          {
            -[PLPersistedPersonMetadata detectedFaceIdentifiers](v13, "detectedFaceIdentifiers");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

            if (!v18)
              goto LABEL_16;
            -[PLPersistedPersonMetadata personUUID](v13, "personUUID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v19);

            -[PLPersistedPersonMetadata detectedFaceIdentifiers](v13, "detectedFaceIdentifiers");
            v20 = objc_claimAutoreleasedReturnValue();
            -[PLPersistedPersonMetadata personUUID](v13, "personUUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKey:", v20, v21);
            goto LABEL_14;
          }
        }
        PLMigrationGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = (uint64_t)v21;
          _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to read invalid or missing metadata at %@, this person will not be deduped", buf, 0xCu);
LABEL_14:

        }
LABEL_16:

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v9);
  }

  v22 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __76__PLPersistedPersonMetadata_personUUIDsToDedupeWithMetadataURLs_cplEnabled___block_invoke;
  v38[3] = &unk_1E366F870;
  v23 = v32;
  v39 = v23;
  objc_msgSend(v33, "sortUsingComparator:", v38);
  v34[0] = v22;
  v34[1] = 3221225472;
  v34[2] = __76__PLPersistedPersonMetadata_personUUIDsToDedupeWithMetadataURLs_cplEnabled___block_invoke_2;
  v34[3] = &unk_1E366F898;
  v35 = v23;
  v36 = v33;
  v24 = v30;
  v37 = v24;
  v25 = v33;
  v26 = v23;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v34);
  PLMigrationGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 134217984;
    v45 = v28;
    _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Found %ld person duplicates, these will be skipped while rebuilding persons", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
  return v24;
}

+ (void)updateMergeTargetPersonWithPersonUUIDMapping:(id)a3 fromDataInManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  BOOL v18;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v7)
  {
    v9 = v7;
    v21 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 138412546;
    v20 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v21)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v11, v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v11, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v12, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "finalMergeTargetPerson");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13)
          v18 = v15 == 0;
        else
          v18 = 1;
        if (v18)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v27 = v12;
            v28 = 2112;
            v29 = v11;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to find merge target person with UUID %@ for person with UUID %@", buf, 0x16u);
          }

        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            v27 = v15;
            v28 = 2112;
            v29 = v13;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Setting merge target person %@ for %@", buf, 0x16u);
          }

          objc_msgSend(v13, "setMergeTargetPerson:", v15);
        }

      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

}

+ (void)performPostImportMigrationFromVersion:(unint64_t)a3 fromDataInManagedObjectContext:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PLMigrationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = a3;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Post-import migration of persons from metadata version %lu", (uint8_t *)&v11, 0xCu);
  }

  if (a3 <= 9)
  {
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Resetting manual order on persons", (uint8_t *)&v11, 2u);
    }

    objc_msgSend(v5, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelMigrator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetManualOrderForNonFavoritePeopleInManagedObjectContext:", v5);

  }
}

uint64_t __76__PLPersistedPersonMetadata_personUUIDsToDedupeWithMetadataURLs_cplEnabled___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  if (v8 < v10)
    return -1;
  else
    return v8 > v10;
}

void __76__PLPersistedPersonMetadata_personUUIDsToDedupeWithMetadataURLs_cplEnabled___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a1[4], "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (++a3 < (unint64_t)objc_msgSend(a1[5], "count"))
  {
    objc_msgSend(a1[5], "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isSubsetOfSet:", v7))
    {
      objc_msgSend(a1[6], "addObject:", v8);

      break;
    }

  }
}

uint64_t __87__PLPersistedPersonMetadata_urlsForPersistedPersonsInMetadataDirectoryWithPathManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isValidPath:", v3);

  return v4;
}

@end

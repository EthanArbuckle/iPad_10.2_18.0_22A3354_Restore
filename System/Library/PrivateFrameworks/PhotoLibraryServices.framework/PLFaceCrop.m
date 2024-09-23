@implementation PLFaceCrop

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v22[16];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PLFaceCrop;
  -[PLManagedObject willSave](&v23, sel_willSave);
  -[PLFaceCrop changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("person"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PLFaceCrop face](self, "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 == v6)
        v7 = 0;
      else
        v7 = v4;
      v8 = v7;

      if (-[PLFaceCrop type](self, "type") == 4 || -[PLFaceCrop type](self, "type") == 2)
      {
        -[PLFaceCrop face](self, "face");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "rejectedPersons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "anyObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if ((objc_msgSend(v11, "isEqual:", v8) & 1) != 0)
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          if (v4 == v6)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v12 = objc_claimAutoreleasedReturnValue();
LABEL_14:
            v13 = (void *)v12;
            -[PLFaceCrop face](self, "face");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setRejectedPersons:", v13);

LABEL_23:
            goto LABEL_25;
          }
LABEL_13:
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        if (v4 != v6)
          goto LABEL_13;
LABEL_24:
        v11 = 0;
        goto LABEL_25;
      }
      if (-[PLFaceCrop type](self, "type") != 3
        && -[PLFaceCrop type](self, "type") != 1
        && -[PLFaceCrop type](self, "type") != 5)
      {
        goto LABEL_26;
      }
      -[PLFaceCrop face](self, "face");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if ((objc_msgSend(v11, "isEqual:", v8) & 1) != 0)
          goto LABEL_25;
      }
      else if (v4 == v6)
      {
        goto LABEL_24;
      }
      -[PLFaceCrop face](self, "face");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAssociatedPerson:", v8);
      goto LABEL_23;
    }
  }
LABEL_27:
  -[PLFaceCrop managedObjectContext](self, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLFaceCrop setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
    if ((-[PLFaceCrop isDeleted](self, "isDeleted") & 1) == 0
      && (-[PLFaceCrop isSyncableChange](self, "isSyncableChange")
       || -[PLFaceCrop isInserted](self, "isInserted")))
    {
      -[PLFaceCrop setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 1);
    }
  }
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "libraryServicesManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (objc_msgSend(v18, "wellKnownPhotoLibraryIdentifier") == 3)
    {
      -[PLManagedObject photoLibrary](self, "photoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "managedObjectContext");
      v20 = objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[NSObject recordNeedsBackgroundJobProcessing](v20, "recordNeedsBackgroundJobProcessing");
      }
      else
      {
        PLSyndicationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "PersonSync: MOC is nil, unable to register for background job processing", v22, 2u);
        }

        v20 = 0;
      }
LABEL_42:

    }
  }
  else if ((MEMORY[0x19AEC0720]() & 1) == 0)
  {
    PLSyndicationGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "PLFaceCrop willSave: LSM is nil, not registering for background job processing", v22, 2u);
    }
    goto LABEL_42;
  }

}

- (void)prepareForDeletion
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLFaceCrop;
  -[PLManagedObject prepareForDeletion](&v4, sel_prepareForDeletion);
  -[PLFaceCrop managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "mergingChanges") & 1) == 0)
    objc_msgSend(v3, "recordCloudDeletionForObject:", self);

}

- (int64_t)cloudDeletionType
{
  return 5;
}

- (void)applyPropertiesToTrainingFace
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PLFaceCrop person](self, "person");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLFaceCrop face](self, "face");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLFaceCrop type](self, "type") == 2 || -[PLFaceCrop type](self, "type") == 4)
  {
    objc_msgSend(v6, "mutableRejectedFaces");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
  else
  {
    objc_msgSend(v6, "mutableFaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v3);

    objc_msgSend(v3, "fixPersonRelationshipsForFaceTorsoOrTemporal");
  }
  objc_msgSend(v3, "setEffectiveNameSource:", objc_msgSend((id)objc_opt_class(), "_nameSourceForFaceFromFaceCrop:", self));
  objc_msgSend(v3, "setTrainingType:", objc_msgSend((id)objc_opt_class(), "_trainingFaceTypeForFaceFromFaceCrop:", self));

}

- (BOOL)supportsCloudUpload
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  NSObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision");
  if (v3)
  {
    -[PLFaceCrop person](self, "person");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if (-[NSObject verifiedType](v4, "verifiedType"))
      {

        if (objc_msgSend((id)objc_opt_class(), "_cloudTypeToPushFromLocalType:cachedCloudType:", -[PLFaceCrop type](self, "type"), -[PLFaceCrop cloudType](self, "cloudType")))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FaceCrop %@ with unknown cloud type is an error"), self);
        v5 = objc_claimAutoreleasedReturnValue();
        if (*MEMORY[0x1E0D115D0])
        {
LABEL_15:

          LOBYTE(v3) = 0;
          return v3;
        }
        __CPLAssetsdOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v10 = v5;
          _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FaceCrop %@ linked to unverified person %@"), self, v5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x1E0D115D0])
        goto LABEL_14;
      __CPLAssetsdOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      v10 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing person for faceCrop %@"), self);
      v6 = objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x1E0D115D0])
      {
        v5 = 0;
        goto LABEL_14;
      }
      __CPLAssetsdOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_DWORD *)buf = 138412290;
      v10 = v6;
    }
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    goto LABEL_13;
  }
  return v3;
}

- (BOOL)isSyncableChange
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PLFaceCrop changedValues](self, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)objc_opt_class(), "listOfSyncedProperties", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
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
  -[PLFaceCrop scopeIdentifier](self, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFaceCrop uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithScopeIdentifier:identifier:", v4, v5);

  return v6;
}

- (id)cplFaceCropChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLFaceCrop scopedIdentifier](self, "scopedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D11388], "newRecordWithScopedIdentifier:", v3);
  -[PLFaceCrop person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonIdentifier:", v6);

  objc_msgSend(v4, "setFaceCropType:", objc_msgSend((id)objc_opt_class(), "_cloudTypeToPushFromLocalType:cachedCloudType:", -[PLFaceCrop type](self, "type"), -[PLFaceCrop cloudType](self, "cloudType")));
  -[PLFaceCrop resourceData](self, "resourceData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceData:", v7);

  if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsGraphPeopleHome"))
  {
    -[PLFaceCrop invalidMergeCandidatePersonUUID](self, "invalidMergeCandidatePersonUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRejectedPersonIdentifier:", v8);

  }
  return v4;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  int v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLFaceCrop uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFaceCrop resourceData](self, "resourceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = -[PLFaceCrop type](self, "type") - 1;
  if (v7 > 4)
    v8 = CFSTR("none");
  else
    v8 = off_1E3670278[v7];
  -[PLFaceCrop person](self, "person");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLFaceCrop state](self, "state");
  if (v11 > 2)
    v12 = CFSTR("unknown");
  else
    v12 = off_1E36702A0[(unsigned __int16)v11];
  v13 = -[PLFaceCrop cloudLocalState](self, "cloudLocalState");
  -[PLFaceCrop invalidMergeCandidatePersonUUID](self, "invalidMergeCandidatePersonUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FaceCrop: UUID: %@ ResourceData: %lu bytes Type: %@ Person: %@ State: %@ Cloud State: %d Invalid merge candidate UUID: %@"), v4, v6, v8, v10, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (BOOL)needsPersistenceUpdate
{
  return self->_needsPersistenceUpdate;
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  self->_needsPersistenceUpdate = a3;
}

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4 resourceData:(id)a5 type:(signed __int16)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFaceCrop.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v11, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "insertIntoManagedObjectContext:withUUID:resourceData:type:", v14, v12, v13, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)insertIntoManagedObjectContext:(id)a3 withUUID:(id)a4 resourceData:(id)a5 type:(signed __int16)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;

  v6 = a6;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFaceCrop.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moc"));

    objc_msgSend(a1, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v14, 0, 0);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "setUuid:", v12);
    objc_msgSend(v15, "setResourceData:", v13);
    objc_msgSend(v15, "setType:", v6);
  }

  return v15;
}

+ (id)entityName
{
  return CFSTR("FaceCrop");
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 5;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("uuid");
}

+ (id)_faceCropsMatchingPredicate:(id)a3 limit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x19AEC1554]();
  v11 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v13, "setPredicate:", v8);
  if (!a4 || (objc_msgSend(v13, "setFetchLimit:", a4), a4 - 101 <= 0xFFFFFFFFFFFFFF9BLL))
    objc_msgSend(v13, "setFetchBatchSize:", 100);
  v18 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v13, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  if (!v14 && !*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch faceCrops: %@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v10);

  return v14;
}

+ (id)allFaceCropsInPhotoLibrary:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_faceCropsMatchingPredicate:limit:inManagedObjectContext:", 0, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceCropsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "faceCropsWithUUIDs:inManagedObjectContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)faceCropsWithUUIDs:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("uuid IN %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_faceCropsMatchingPredicate:limit:inManagedObjectContext:", v8, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)faceCropsToUploadInPhotoLibrary:(id)a3 limit:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("cloudLocalState == %d"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_faceCropsMatchingPredicate:limit:inManagedObjectContext:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFaceCrop.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__69595;
  v23 = __Block_byref_object_dispose__69596;
  v24 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PLFaceCrop_batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs_library___block_invoke;
  v14[3] = &unk_1E3674DF8;
  v9 = v8;
  v15 = v9;
  v18 = a1;
  v10 = v7;
  v16 = v10;
  v17 = &v19;
  objc_msgSend(v9, "performBlockAndWait:", v14);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

+ (int)_trainingFaceTypeForFaceFromFaceCrop:(id)a3
{
  int result;

  result = objc_msgSend(a3, "type");
  if (result >= 6)
    return 2;
  return result;
}

+ (int)_nameSourceForFaceFromFaceCrop:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "type") - 1;
  if (v3 > 4)
    return 0;
  else
    return dword_199B9F77C[v3];
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  return (id)listOfSyncedProperties_result_69586;
}

+ (int64_t)_cloudTypeToPushFromLocalType:(signed __int16)a3 cachedCloudType:(unsigned __int16)a4
{
  uint64_t v5;

  switch(a3)
  {
    case 0:
      return a4;
    case 1:
      v5 = 5;
      return v5 | a4 & 0xFFF0;
    case 2:
      v5 = 6;
      return v5 | a4 & 0xFFF0;
    case 3:
      v5 = 1;
      return v5 | a4 & 0xFFF0;
    case 4:
      v5 = 2;
      return v5 | a4 & 0xFFF0;
    case 5:
      v5 = 12;
      return v5 | a4 & 0xFFF0;
    default:
      v5 = 0;
      return v5 | a4 & 0xFFF0;
  }
}

+ (signed)_localTypeFromCloudType:(int64_t)a3
{
  signed __int16 v3;
  __int16 v4;
  signed __int16 v5;

  if ((~(_BYTE)a3 & 0xC) != 0)
    v3 = 0;
  else
    v3 = 5;
  if ((a3 & 4) != 0)
    v4 = 2;
  else
    v4 = 4;
  if ((a3 & 2) != 0)
    v3 = v4;
  if ((a3 & 4) != 0)
    v5 = 1;
  else
    v5 = 3;
  if ((a3 & 1) != 0)
    return v5;
  else
    return v3;
}

+ (id)insertOrUpdateWithCPLFaceCrop:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "personIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "finalMergeTargetPerson");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_msgSend(a1, "_localTypeFromCloudType:", objc_msgSend(v6, "faceCropType"));
    v40[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "faceCropsWithUUIDs:inPhotoLibrary:", v15, v7);
    v16 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v16, "count"))
    {
      -[NSObject firstObject](v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resourceData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setResourceData:", v18);

      objc_msgSend(v17, "setType:", v14);
      if (v17)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(v6, "resourceData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "insertIntoPhotoLibrary:withUUID:resourceData:type:", v7, v9, v21, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
LABEL_4:
        objc_msgSend(v17, "person");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setCloudLocalState:", 1);
        objc_msgSend(v17, "setPerson:", v13);
        objc_msgSend(v17, "setCloudType:", (unsigned __int16)objc_msgSend(v6, "faceCropType"));
        if (-[NSObject verifiedType](v19, "verifiedType") == -2)
        {
          -[NSObject mergeTargetPerson](v19, "mergeTargetPerson");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {

          }
          else if (objc_msgSend(v13, "verifiedType") == 1)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v35 = v6;
                v36 = 2112;
                v37 = v19;
                v38 = 2112;
                v39 = v13;
                _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Setting inferred merge target due to cplFaceCropChange %@ moving from tombstone person %@ to user-verified person %@", buf, 0x20u);
              }

            }
            -[NSObject setCPLSyncedMergeTarget:](v19, "setCPLSyncedMergeTarget:", v13);
          }
        }
        if (!objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsGraphPeopleHome"))
          goto LABEL_32;
        objc_msgSend(v6, "rejectedPersonIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v23, "length"))
        {
          objc_msgSend(v17, "setInvalidMergeCandidatePersonUUID:", 0);
LABEL_31:

LABEL_32:
          goto LABEL_33;
        }
        v32 = v9;
        objc_msgSend(v7, "managedObjectContext");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v23;
        +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "finalMergeTargetPerson");
        v26 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v26;
        if (v26)
        {
          objc_msgSend(v13, "mutableInvalidMergeCandidates");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v26);

          v27 = (void *)v26;
          objc_msgSend(v13, "mutableMergeCandidates");
          v29 = objc_claimAutoreleasedReturnValue();
          -[NSObject removeObject:](v29, "removeObject:", v26);
        }
        else
        {
          if (*MEMORY[0x1E0D115D0])
          {
LABEL_30:
            v23 = v33;
            objc_msgSend(v17, "setInvalidMergeCandidatePersonUUID:", v33);

            v9 = v32;
            goto LABEL_31;
          }
          __CPLAssetsdOSLogDomain();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "scopedIdentifier");
            v30 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v35 = v33;
            v36 = 2112;
            v37 = v30;
            _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "Did not find invalid merge candidate with person UUID %@ for cplFaceCropChange %@", buf, 0x16u);

            v27 = 0;
          }
        }

        goto LABEL_30;
      }
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v6;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error, unable to find face crop to update or insert new face crop for %@", buf, 0xCu);
      }
      goto LABEL_32;
    }
  }
  else
  {
    if (*MEMORY[0x1E0D115D0])
    {
      v17 = 0;
      goto LABEL_34;
    }
    __CPLAssetsdOSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v6;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Unable to find person for cplFaceCropChange %@, skipping", buf, 0xCu);
    }
  }
  v17 = 0;
LABEL_33:

LABEL_34:
  return v17;
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

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudLocalState != %d"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultType:", 2);
  objc_msgSend(v8, "setPropertiesToUpdate:", &unk_1E3764670);
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
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Batch updated %@ faceCrop", buf, 0xCu);

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
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to batch update faceCrop: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v5);
}

void __36__PLFaceCrop_listOfSyncedProperties__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("type"), CFSTR("person"), CFSTR("resourceData"), 0);
  v1 = (void *)listOfSyncedProperties_result_69586;
  listOfSyncedProperties_result_69586 = v0;

}

void __72__PLFaceCrop_batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs_library___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("face"), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_faceCropsMatchingPredicate:limit:inManagedObjectContext:", v2, 0, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PLFaceCrop_batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs_library___block_invoke_2;
  v8[3] = &__block_descriptor_40_e39___NSManagedObjectID_16__0__PLFaceCrop_8l;
  v8[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "_pl_indexBy:", v8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __72__PLFaceCrop_batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs_library___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectIDsForRelationshipNamed:", CFSTR("face"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

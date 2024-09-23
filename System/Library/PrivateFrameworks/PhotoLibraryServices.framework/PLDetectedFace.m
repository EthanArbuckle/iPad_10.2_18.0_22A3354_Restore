@implementation PLDetectedFace

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLDetectedFace;
  -[PLDetectedFace awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDetectedFace setUuid:](self, "setUuid:", v3);

}

- (void)delete
{
  id v3;

  -[PLDetectedFace managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLDetectedFace;
  v5 = -[PLDetectedFace validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
    LOBYTE(v5) = -[PLDetectedFace _validateForOperation:error:](self, "_validateForOperation:error:", CFSTR("insert"), a3);
  return v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLDetectedFace;
  v5 = -[PLDetectedFace validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5)
    LOBYTE(v5) = -[PLDetectedFace _validateForOperation:error:](self, "_validateForOperation:error:", CFSTR("update"), a3);
  return v5;
}

- (BOOL)_validateForOperation:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PLDetectedFace _startTimeAndDurationAreValid](self, "_startTimeAndDurationAreValid");
  if (!v7)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[NSManagedObject pl_shortDescription](self, "pl_shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDetectedFace startTime](self, "startTime");
      v11 = v10;
      -[PLDetectedFace duration](self, "duration");
      *(_DWORD *)buf = 138544130;
      v27 = v9;
      v28 = 2114;
      v29 = v6;
      v30 = 2048;
      v31 = v11;
      v32 = 2048;
      v33 = v12;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "PLDetectedFace %{public}@ failed validation for %{public}@, startTime: %g, duration: %g", buf, 0x2Au);

    }
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D74498];
      v24 = *MEMORY[0x1E0CB2938];
      v15 = (void *)MEMORY[0x1E0CB3940];
      -[PLDetectedFace startTime](self, "startTime");
      v17 = v16;
      -[PLDetectedFace duration](self, "duration");
      objc_msgSend(v15, "stringWithFormat:", CFSTR("There was a validation issue when attempting to %@ PLDetectedFace (startTime: %g, duration: %g)"), v6, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 46502, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_retainAutorelease(v21);
      *a4 = v22;

    }
  }

  return v7;
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLDetectedFace;
  -[PLManagedObject prepareForDeletion](&v5, sel_prepareForDeletion);
  objc_opt_class();
  -[PLDetectedFace managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
    +[PLDelayedSearchIndexUpdates recordDetectedFaceIfNeeded:](PLDelayedSearchIndexUpdates, "recordDetectedFaceIfNeeded:", self);
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
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
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  objc_super v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)PLDetectedFace;
  -[PLManagedObject willSave](&v43, sel_willSave);
  -[PLDetectedFace _fixUpTemporalRelationships](self, "_fixUpTemporalRelationships");
  -[PLDetectedFace _verifyTorsoRelationships](self, "_verifyTorsoRelationships");
  -[PLDetectedFace changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("centerX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("personForFace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0
    || (-[PLManagedObject photoLibrary](self, "photoLibrary"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isUnitTesting"),
        v6,
        v7))
  {
    -[PLDetectedFace _recordAssetPersonEdgeUpdatesAndSocialGroupUpdatesIfNeededWithChangedValues:](self, "_recordAssetPersonEdgeUpdatesAndSocialGroupUpdatesIfNeededWithChangedValues:", v3);
  }
  -[PLDetectedFace _updatePersonForFaceDetectionTypeIfNeededWithPossibleNewPerson:](self, "_updatePersonForFaceDetectionTypeIfNeededWithPossibleNewPerson:", v5);
  if (!v5)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v8)
  {

  }
  else
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(v5, "verifiedType");

    if (v10)
    {
LABEL_7:
      v11 = -[PLDetectedFace trainingType](self, "trainingType");
      v12 = 0;
      goto LABEL_14;
    }
  }
  if (-[PLDetectedFace nameSource](self, "nameSource"))
    -[PLDetectedFace setNameSource:](self, "setNameSource:", 0);
  if (-[PLDetectedFace confirmedFaceCropGenerationState](self, "confirmedFaceCropGenerationState"))
    -[PLDetectedFace setConfirmedFaceCropGenerationState:](self, "setConfirmedFaceCropGenerationState:", 0);
  v11 = -[PLDetectedFace trainingType](self, "trainingType");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "isEqual:", v13) ^ 1;

LABEL_14:
  if (v11)
    v14 = v5 == 0;
  else
    v14 = 1;
  if (!v14 || v12)
  {
    -[PLDetectedFace faceGroup](self, "faceGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && objc_msgSend(v15, "personBuilderState") != 1)
      objc_msgSend(v16, "setPersonBuilderState:", 1);

  }
  if (v5)
  {
    -[PLDetectedFace personBeingKeyFace](self, "personBeingKeyFace");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[PLDetectedFace personBeingKeyFace](self, "personBeingKeyFace");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v5);

      if ((v20 & 1) == 0)
        -[PLDetectedFace setPersonBeingKeyFace:](self, "setPersonBeingKeyFace:", 0);
    }
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("rejectedPersons"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[PLDetectedFace rejectedPersons](self, "rejectedPersons");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDetectedFace clusterRejectedPersons](self, "clusterRejectedPersons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    objc_msgSend(v24, "intersectSet:", v22);
    if ((v23 != 0) != (v24 != 0)
      || !objc_msgSend(v23, "isEqualToSet:", v24)
      || (objc_msgSend(v24, "isEqualToSet:", v23) & 1) == 0)
    {
      -[PLDetectedFace setClusterRejectedPersons:](self, "setClusterRejectedPersons:", v24);
    }

  }
  if (-[PLDetectedFace isSyncableChange](self, "isSyncableChange"))
  {
    -[PLDetectedFace associatedAssetForFaceOrTorso:orTemporal:](self, "associatedAssetForFaceOrTorso:orTemporal:", 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[PLDetectedFace associatedAssetForFaceOrTorso:orTemporal:](self, "associatedAssetForFaceOrTorso:orTemporal:", 1, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "changedValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("modificationDate"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setModificationDate:", v29);

      }
    }
  }
  if (!v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("centerY"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("size"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        goto LABEL_44;
    }
  }
  -[PLDetectedFace associatedAssetForFaceOrTorso:orTemporal:](self, "associatedAssetForFaceOrTorso:orTemporal:", 1, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "revalidateFaceAreaPoints");

LABEL_44:
  -[PLDetectedFace managedObjectContext](self, "managedObjectContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (PLPlatformSearchSupported())
    {
      objc_msgSend(v33, "delayedSaveActions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "recordDetectedFaceForSearchIndexUpdate:", self);

    }
    v42 = v4;
    if ((-[PLDetectedFace isDeleted](self, "isDeleted") & 1) == 0)
      +[PLDelayedSearchIndexUpdates recordDetectedFaceIfNeeded:](PLDelayedSearchIndexUpdates, "recordDetectedFaceIfNeeded:", self);
    -[PLDetectedFace _updateFaceGroupIfNeeded](self, "_updateFaceGroupIfNeeded");
    -[PLDetectedFace _verifyAssetRelationship](self, "_verifyAssetRelationship");
    objc_msgSend(v3, "objectForKey:", CFSTR("nameSource"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = objc_msgSend(v35, "integerValue");
      v44[0] = CFSTR("nameSource");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDetectedFace committedValuesForKeys:](self, "committedValuesForKeys:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKey:", CFSTR("nameSource"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "integerValue");

      if (v37 == 5 || (v37 & 0xFFFFFFFFFFFFFFFDLL) == 1 || v41 == 3 || v41 == 1 || v41 == 5)
        -[PLDetectedFace _touchPersonForPersistenceIfNeeded](self, "_touchPersonForPersistenceIfNeeded");
    }

    v4 = v42;
  }

}

- (void)_touchPersonForPersistenceIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[PLManagedObject pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDCIM");

  if (v4)
  {
    -[PLDetectedFace associatedPersonForFaceOrTorso:orTemporal:](self, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isInserted") & 1) == 0 && (objc_msgSend(v5, "isUpdated") & 1) == 0)
      objc_msgSend(v5, "setEffectiveVerifiedType:", objc_msgSend(v5, "verifiedType"));

  }
}

- (void)_updateFaceGroupIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PLDetectedFace associatedPersonForFaceOrTorso:orTemporal:](self, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PLDetectedFace faceGroup](self, "faceGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6)
      {
        -[NSManagedObject pl_shortDescription](self, "pl_shortDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v4;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Moving face %@ to algorithmic face group: %@", (uint8_t *)&v10, 0x16u);

      }
      objc_msgSend(v4, "associatedPerson");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject mutableFaces](v5, "mutableFaces");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsObject:", self) & 1) == 0)
        objc_msgSend(v8, "addObject:", self);

    }
    else if (v6)
    {
      -[NSManagedObject pl_shortDescription](self, "pl_shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Unable to find algorithmic face group for face: %@", (uint8_t *)&v10, 0xCu);

    }
  }
}

- (void)removeAllPersonRelationships
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PLDetectedFace entity](self, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson entity](PLPerson, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "relationshipsByName", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "destinationEntity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          objc_msgSend(v11, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDetectedFace setValue:forKey:](self, "setValue:forKey:", 0, v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)fixPersonRelationshipsForFaceTorsoOrTemporal
{
  void *v3;
  void *v4;

  -[PLDetectedFace associatedPersonForFaceOrTorso:orTemporal:](self, "associatedPersonForFaceOrTorso:orTemporal:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PLDetectedFace setAssociatedPerson:](self, "setAssociatedPerson:", v3);
    v3 = v4;
  }

}

- (void)fixAssetRelationshipsForFaceTorsoOrTemporal
{
  void *v3;
  void *v4;

  -[PLDetectedFace associatedAssetForFaceOrTorso:orTemporal:](self, "associatedAssetForFaceOrTorso:orTemporal:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PLDetectedFace setAssociatedAsset:](self, "setAssociatedAsset:", v3);
    v3 = v4;
  }

}

- (void)_verifyAssetRelationship
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  PLDetectedFace *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((-[PLDetectedFace isDeleted](self, "isDeleted") & 1) == 0
    && !-[PLDetectedFace isTrainingFace](self, "isTrainingFace"))
  {
    -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetForFace"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetForTemporalDetectedFaces"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (!v6)
        return;
    }
    else
    {

    }
    -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetForFace"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {

    }
    else
    {
      -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetForTemporalDetectedFaces"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
        return;
    }
    if ((PLIsSuppressingLogsForUnitTesting() & 1) == 0)
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = self;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Face unexpectedly has no asset: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("EnableFaceAssertions"));

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDetectedFace.m"), 445, CFSTR("Face unexpectedly has no asset: %@"), self);

    }
  }
}

- (void)_fixUpTemporalRelationships
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetForFace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();

  -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetForTemporalDetectedFaces"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();

  -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("personForFace"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();

  -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("personForTemporalDetectedFaces"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();

  if (-[PLDetectedFace _isTemporalFace](self, "_isTemporalFace"))
  {
    if (v4 | v8)
    {
      if (!v6 && v4)
      {
        -[PLDetectedFace assetForFace](self, "assetForFace");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PLBackendGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          -[PLDetectedFace uuid](self, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543618;
          v27 = v13;
          v28 = 2114;
          v29 = v14;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "PLDetectedFace validation fixing up temporal face %{public}@, moving asset %{public}@ to temporal", (uint8_t *)&v26, 0x16u);

        }
        -[PLDetectedFace setAssetForTemporalDetectedFaces:](self, "setAssetForTemporalDetectedFaces:", v11);
        -[PLDetectedFace setAssetForFace:](self, "setAssetForFace:", 0);

      }
      if (!v10 && v8)
      {
        -[PLDetectedFace personForFace](self, "personForFace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        PLBackendGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          -[PLDetectedFace uuid](self, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "personUUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543618;
          v27 = v17;
          v28 = 2114;
          v29 = v18;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "PLDetectedFace validation fixing up temporal face %{public}@, moving person %{public}@ to temporal", (uint8_t *)&v26, 0x16u);

        }
        -[PLDetectedFace setPersonForTemporalDetectedFaces:](self, "setPersonForTemporalDetectedFaces:", v15);
        -[PLDetectedFace setPersonForFace:](self, "setPersonForFace:", 0);
LABEL_24:

      }
    }
  }
  else if (v6 | v10)
  {
    if (!v4 && v6)
    {
      -[PLDetectedFace assetForTemporalDetectedFaces](self, "assetForTemporalDetectedFaces");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PLBackendGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[PLDetectedFace uuid](self, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v21;
        v28 = 2114;
        v29 = v22;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "PLDetectedFace validation fixing up still face %{public}@, moving asset %{public}@ from temporal", (uint8_t *)&v26, 0x16u);

      }
      -[PLDetectedFace setAssetForFace:](self, "setAssetForFace:", v19);
      -[PLDetectedFace setAssetForTemporalDetectedFaces:](self, "setAssetForTemporalDetectedFaces:", 0);

    }
    if (!v8 && v10)
    {
      -[PLDetectedFace personForTemporalDetectedFaces](self, "personForTemporalDetectedFaces");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PLBackendGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[PLDetectedFace uuid](self, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "personUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v24;
        v28 = 2114;
        v29 = v25;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "PLDetectedFace validation fixing up still face %{public}@, moving person %{public}@ from temporal", (uint8_t *)&v26, 0x16u);

      }
      -[PLDetectedFace setPersonForFace:](self, "setPersonForFace:", v15);
      -[PLDetectedFace setPersonForTemporalDetectedFaces:](self, "setPersonForTemporalDetectedFaces:", 0);
      goto LABEL_24;
    }
  }

}

- (void)_verifyTorsoRelationships
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetForTorso"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDetectedFace objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("personForTorso"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLDetectedFace assetForTorso](self, "assetForTorso");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      -[PLDetectedFace uuid](self, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_FAULT, "assetForTorso is unexpected set on face %{public}@ to %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }
  if (v6)
  {
    -[PLDetectedFace personForTorso](self, "personForTorso");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      -[PLDetectedFace uuid](self, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "personUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_FAULT, "personForTorso is unexpected set on face %{public}@ to %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (BOOL)_faceIsDeletedBecauseAssetForFaceIsDeleted
{
  void *v3;
  void *v4;
  int v5;

  if (-[PLDetectedFace isDeleted](self, "isDeleted"))
  {
    -[PLManagedObject pl_committedValueForKey:](self, "pl_committedValueForKey:", CFSTR("assetForFace"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v5 = (int)(objc_msgSend(v3, "isDeleted") << 31) >> 31;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (BOOL)_isInsertedWithAssociatedAssetAndPerson
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[PLDetectedFace isInserted](self, "isInserted"))
    return 0;
  -[PLDetectedFace personForFace](self, "personForFace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLDetectedFace assetForFace](self, "assetForFace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasPersonForFaceChangeWithoutCommittedPersonForFace:(id)a3 oldAssociatedPerson:(id)a4
{
  int v7;
  BOOL v8;
  void *v9;

  v7 = -[PLDetectedFace isUpdated](self, "isUpdated");
  v8 = 0;
  if (!a4 && a3 && v7)
  {
    -[PLDetectedFace assetForFace](self, "assetForFace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 != 0;

  }
  return v8;
}

- (BOOL)_hasSizeOrTorsoDimensionChangeWithAssociatedAssetAndPerson
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[PLDetectedFace isUpdated](self, "isUpdated"))
    return 0;
  -[PLDetectedFace personForFace](self, "personForFace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLDetectedFace assetForFace](self, "assetForFace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = -[PLDetectedFace _hasSizeChange](self, "_hasSizeChange")
        || -[PLDetectedFace _hasBodyWidthChange](self, "_hasBodyWidthChange")
        || -[PLDetectedFace _hasBodyHeightChange](self, "_hasBodyHeightChange");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasSizeChange
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PLDetectedFace changedValues](self, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("size"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLNullToNil();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)_hasBodyWidthChange
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PLDetectedFace changedValues](self, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("bodyWidth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLNullToNil();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)_hasBodyHeightChange
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PLDetectedFace changedValues](self, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("bodyHeight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLNullToNil();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_recordAssetPersonEdgeAndContainmentUpdateForAsset:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "delayedSaveActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordAssetPersonEdgeUpdateNeededForAsset:", v6);

  objc_msgSend(v5, "delayedSaveActions");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "recordSocialGroupContainmentUpdateNeededForAsset:", v6);
}

- (void)_updatePersonForFaceDetectionTypeIfNeededWithPossibleNewPerson:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  PLNullToNil();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        v6 = objc_msgSend(v14, "detectionType"),
        v7 = -[PLDetectedFace detectionType](self, "detectionType"),
        v5,
        v6 != v7))
  {
    objc_msgSend(v14, "updateDetectionTypeIfNeeded");
  }
  else if (-[PLDetectedFace isInserted](self, "isInserted"))
  {
    -[PLDetectedFace personForFace](self, "personForFace");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[PLDetectedFace personForFace](self, "personForFace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "detectionType");
      v12 = -[PLDetectedFace detectionType](self, "detectionType");

      if (v11 != v12)
      {
        -[PLDetectedFace personForFace](self, "personForFace");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateDetectionTypeIfNeeded");

      }
    }
  }

}

- (void)_recordAssetPersonEdgeUpdatesAndSocialGroupUpdatesIfNeededWithChangedValues:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v4 = (void *)MEMORY[0x19AEC1554]();
  if (!-[PLDetectedFace _faceIsDeletedBecauseAssetForFaceIsDeleted](self, "_faceIsDeletedBecauseAssetForFaceIsDeleted"))
  {
    -[PLDetectedFace managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && !MEMORY[0x19AEC0720]())
      goto LABEL_9;
    -[PLDetectedFace assetForFace](self, "assetForFace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("personForFace"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject pl_committedValueForKey:](self, "pl_committedValueForKey:", CFSTR("personForFace"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("assetForFace"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLDetectedFace _isInsertedWithAssociatedAssetAndPerson](self, "_isInsertedWithAssociatedAssetAndPerson")
      || -[PLDetectedFace _hasSizeOrTorsoDimensionChangeWithAssociatedAssetAndPerson](self, "_hasSizeOrTorsoDimensionChangeWithAssociatedAssetAndPerson")|| -[PLDetectedFace _hasPersonForFaceChangeWithoutCommittedPersonForFace:oldAssociatedPerson:](self, "_hasPersonForFaceChangeWithoutCommittedPersonForFace:oldAssociatedPerson:", v7, v8))
    {
      -[PLDetectedFace _recordAssetPersonEdgeAndContainmentUpdateForAsset:inContext:](self, "_recordAssetPersonEdgeAndContainmentUpdateForAsset:inContext:", v6, v5);
      goto LABEL_8;
    }
    if (-[PLDetectedFace isUpdated](self, "isUpdated")
      && v9
      && (-[PLDetectedFace personForFace](self, "personForFace"),
          v10 = objc_claimAutoreleasedReturnValue(),
          v11 = v10 | v8,
          (id)v10,
          v11))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v12)
      {

      }
      else
      {
        v13 = (void *)v12;
        -[PLDetectedFace personForFace](self, "personForFace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          -[PLDetectedFace _recordAssetPersonEdgeAndContainmentUpdateForAsset:inContext:](self, "_recordAssetPersonEdgeAndContainmentUpdateForAsset:inContext:", v9, v5);
      }
      -[PLManagedObject pl_committedValueForKey:](self, "pl_committedValueForKey:", CFSTR("assetForFace"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PLNullToNil();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        -[PLDetectedFace _recordAssetPersonEdgeAndContainmentUpdateForAsset:inContext:](self, "_recordAssetPersonEdgeAndContainmentUpdateForAsset:inContext:", v21, v5);
    }
    else
    {
      if (-[PLDetectedFace isUpdated](self, "isUpdated") && v7 && v6 && v8)
      {
        objc_msgSend(v5, "delayedSaveActions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "recordAssetPersonEdgeUpdateNeededForAsset:", v6);

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 != v16)
        {
          objc_msgSend(v5, "delayedSaveActions");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "recordSocialGroupContainmentUpdateNeededForPerson:andAsset:", v7, v6);

        }
        objc_msgSend((id)v8, "mergeTargetPerson");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PLNullToNil();
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          objc_msgSend(v5, "delayedSaveActions");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "recordSocialGroupContainmentUpdateNeededForPerson:andAsset:", v8, v6);

        }
        goto LABEL_8;
      }
      if (!-[PLDetectedFace isDeleted](self, "isDeleted"))
      {
LABEL_8:

LABEL_9:
        goto LABEL_10;
      }
      -[PLManagedObject pl_committedValueForKey:](self, "pl_committedValueForKey:", CFSTR("assetForFace"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObject pl_committedValueForKey:](self, "pl_committedValueForKey:", CFSTR("personForFace"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v21 && v22)
        -[PLDetectedFace _recordAssetPersonEdgeAndContainmentUpdateForAsset:inContext:](self, "_recordAssetPersonEdgeAndContainmentUpdateForAsset:inContext:", v21, v5);

    }
    goto LABEL_8;
  }
LABEL_10:
  objc_autoreleasePoolPop(v4);

}

- (BOOL)isTrainingFace
{
  return -[PLDetectedFace trainingType](self, "trainingType") != 0;
}

- (BOOL)isTorsoOnly
{
  double v3;
  double v4;

  -[PLDetectedFace centerX](self, "centerX");
  if (v3 != 0.0)
    return 0;
  -[PLDetectedFace bodyCenterX](self, "bodyCenterX");
  return v4 != 0.0;
}

- (BOOL)_isFaceOnly
{
  double v3;
  double v4;

  -[PLDetectedFace centerX](self, "centerX");
  if (v3 == 0.0)
    return 0;
  -[PLDetectedFace bodyCenterX](self, "bodyCenterX");
  return v4 == 0.0;
}

- (BOOL)_isFaceAndTorso
{
  double v3;
  double v4;

  -[PLDetectedFace centerX](self, "centerX");
  if (v3 == 0.0)
    return 0;
  -[PLDetectedFace bodyCenterX](self, "bodyCenterX");
  return v4 != 0.0;
}

- (BOOL)_isNeitherFaceNorTorso
{
  double v3;
  double v4;

  -[PLDetectedFace centerX](self, "centerX");
  if (v3 != 0.0)
    return 0;
  -[PLDetectedFace bodyCenterX](self, "bodyCenterX");
  return v4 == 0.0;
}

- (BOOL)_isTemporalFace
{
  double v2;

  -[PLDetectedFace duration](self, "duration");
  return v2 != 0.0;
}

- (BOOL)_startTimeAndDurationAreValid
{
  double v3;
  double v4;
  double v6;
  double v7;

  -[PLDetectedFace startTime](self, "startTime");
  if (v3 >= 0.0)
  {
    -[PLDetectedFace duration](self, "duration");
    if (v4 > 0.0)
      return 1;
  }
  -[PLDetectedFace startTime](self, "startTime");
  if (v6 != 0.0)
    return 0;
  -[PLDetectedFace duration](self, "duration");
  return v7 == 0.0;
}

- (void)removeFaceprint
{
  void *v2;
  id v3;

  -[PLDetectedFace faceprint](self, "faceprint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFace:", 0);
  objc_msgSend(v3, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteObject:", v3);

}

- (id)debugLogDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  +[PLDescriptionBuilder plainDescriptionBuilder](PLDescriptionBuilder, "plainDescriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDetectedFace uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("uuid"), v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PLDetectedFace centerX](self, "centerX");
  v7 = v6;
  -[PLDetectedFace centerY](self, "centerY");
  v9 = v8;
  -[PLDetectedFace size](self, "size");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("{{%f, %f}, %f, %lldx%lld}"), v7, v9, v10, -[PLDetectedFace sourceWidth](self, "sourceWidth"), -[PLDetectedFace sourceHeight](self, "sourceHeight"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("circle"), v11);
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[PLDetectedFace bodyCenterX](self, "bodyCenterX");
  v14 = v13;
  -[PLDetectedFace bodyCenterY](self, "bodyCenterY");
  v16 = v15;
  -[PLDetectedFace bodyWidth](self, "bodyWidth");
  v18 = v17;
  -[PLDetectedFace bodyHeight](self, "bodyHeight");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("{{%f, %f}, %fx%f}"), v14, v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("body"), v20);
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("detectionType"), (int)-[PLDetectedFace detectionType](self, "detectionType"));
  objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("hidden"), -[PLDetectedFace hidden](self, "hidden"));
  objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("trashed"), -[PLDetectedFace isInTrash](self, "isInTrash"));
  objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("manual"), -[PLDetectedFace manual](self, "manual"));
  -[PLDetectedFace associatedPersonForFaceOrTorso:orTemporal:](self, "associatedPersonForFaceOrTorso:orTemporal:", 1, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "debugLogDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("person"), v22);

  -[PLDetectedFace personBeingKeyFace](self, "personBeingKeyFace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "debugLogDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("personBeingKeyFace"), v24);

  objc_msgSend(v3, "appendName:integerValue:", CFSTR("nameSource"), (int)-[PLDetectedFace nameSource](self, "nameSource"));
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("cloudLocalState"), (int)-[PLDetectedFace cloudLocalState](self, "cloudLocalState"));
  -[PLDetectedFace associatedAssetForFaceOrTorso:orTemporal:](self, "associatedAssetForFaceOrTorso:orTemporal:", 1, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "uuid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("asset"), v26);

  objc_msgSend(v3, "appendName:integerValue:", CFSTR("confirmedFaceCropGenerationState"), (int)-[PLDetectedFace confirmedFaceCropGenerationState](self, "confirmedFaceCropGenerationState"));
  -[PLDetectedFace quality](self, "quality");
  objc_msgSend(v3, "appendName:doubleValue:", CFSTR("quality"));
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("faceExpressionType"), -[PLDetectedFace faceExpressionType](self, "faceExpressionType"));
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("headgearType"), -[PLDetectedFace headgearType](self, "headgearType"));
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("hairType"), -[PLDetectedFace hairType](self, "hairType"));
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("poseType"), -[PLDetectedFace poseType](self, "poseType"));
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("skintoneType"), -[PLDetectedFace skintoneType](self, "skintoneType"));
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("ethnicityType"), -[PLDetectedFace ethnicityType](self, "ethnicityType"));
  objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("hasFaceMask"), -[PLDetectedFace hasFaceMask](self, "hasFaceMask"));
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("gazeType"), -[PLDetectedFace gazeType](self, "gazeType"));
  -[PLDetectedFace gazeCenterX](self, "gazeCenterX");
  objc_msgSend(v3, "appendName:doubleValue:", CFSTR("gazeCenterX"));
  -[PLDetectedFace gazeCenterY](self, "gazeCenterY");
  objc_msgSend(v3, "appendName:doubleValue:", CFSTR("gazeCenterY"));
  -[PLDetectedFace gazeRectString](self, "gazeRectString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("gazeRect"), v27);

  -[PLDetectedFace gazeAngle](self, "gazeAngle");
  objc_msgSend(v3, "appendName:doubleValue:", CFSTR("gazeAngle"), v28);
  -[PLDetectedFace gazeConfidence](self, "gazeConfidence");
  objc_msgSend(v3, "appendName:doubleValue:", CFSTR("gazeConfidence"), v29);
  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[PLDetectedFace startTime](self, "startTime");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("startTime"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[PLDetectedFace duration](self, "duration");
  objc_msgSend(v32, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("duration"), v33);

  -[PLDetectedFace rejectedPersons](self, "rejectedPersons");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_pl_map:", &__block_literal_global_26041);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendName:object:", CFSTR("rejectedPersons"), v35);
  -[PLDetectedFace detectionTraits](self, "detectionTraits");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_pl_map:", &__block_literal_global_174);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendName:object:", CFSTR("detectionTraits"), v37);
  objc_msgSend(v3, "build");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)namingDescription
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("uuid");
  v6[1] = CFSTR("nameSource");
  v6[2] = CFSTR("personForFace");
  v6[3] = CFSTR("assetForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject truncatedDescriptionWithPropertyKeys:](self, "truncatedDescriptionWithPropertyKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addRejectedPerson:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLDetectedFace rejectedPersons](self, "rejectedPersons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObject:", v4);
  -[PLDetectedFace setRejectedPersons:](self, "setRejectedPersons:", v6);

}

- (void)addRejectedPersonNeedingFaceCrops:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (objc_msgSend(v4, "verifiedType"))
  {
    -[PLDetectedFace mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("rejectedPersonsNeedingFaceCrops"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v5, "addObject:", v4);
  }
  else
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Scheduling a rejected face crop for an unverified Person is an error, returning quietly", v6, 2u);
    }
  }

}

- (void)addClusterRejectedPerson:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLDetectedFace mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("clusterRejectedPersons"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)setEffectiveNameSource:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[PLDetectedFace setNameSource:](self, "setNameSource:");
  if ((_DWORD)v3 != 2)
    -[PLDetectedFace setCloudNameSource:](self, "setCloudNameSource:", v3);
}

- (CGRect)gazeRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = (void *)objc_opt_class();
  -[PLDetectedFace gazeRectString](self, "gazeRectString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cgRectFromGazeRectString:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setGazeRect:(CGRect)a3
{
  id v4;

  objc_msgSend((id)objc_opt_class(), "stringFromGazeRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLDetectedFace setGazeRectString:](self, "setGazeRectString:", v4);

}

- (id)associatedPersonForFaceOrTorso:(BOOL)a3 orTemporal:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;

  v4 = a4;
  -[PLDetectedFace personForFace](self, "personForFace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3 && -[PLDetectedFace isTorsoOnly](self, "isTorsoOnly"))
  {

    v7 = 0;
  }
  if (v4 && !v7)
  {
    -[PLDetectedFace personForTemporalDetectedFaces](self, "personForTemporalDetectedFaces");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)setAssociatedPerson:(id)a3
{
  BOOL v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = !-[PLDetectedFace _isTemporalFace](self, "_isTemporalFace");
  if (v4)
    v5 = v7;
  else
    v5 = 0;
  if (v4)
    v6 = 0;
  else
    v6 = v7;
  -[PLDetectedFace setPersonForFace:](self, "setPersonForFace:", v5);
  -[PLDetectedFace setPersonForTemporalDetectedFaces:](self, "setPersonForTemporalDetectedFaces:", v6);

}

- (id)associatedAssetForFaceOrTorso:(BOOL)a3 orTemporal:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;

  v4 = a4;
  -[PLDetectedFace assetForFace](self, "assetForFace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3 && -[PLDetectedFace isTorsoOnly](self, "isTorsoOnly"))
  {

    v7 = 0;
  }
  if (v4 && !v7)
  {
    -[PLDetectedFace assetForTemporalDetectedFaces](self, "assetForTemporalDetectedFaces");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)setAssociatedAsset:(id)a3
{
  BOOL v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = !-[PLDetectedFace _isTemporalFace](self, "_isTemporalFace");
  if (v4)
    v5 = v7;
  else
    v5 = 0;
  if (v4)
    v6 = 0;
  else
    v6 = v7;
  -[PLDetectedFace setAssetForFace:](self, "setAssetForFace:", v5);
  -[PLDetectedFace setAssetForTemporalDetectedFaces:](self, "setAssetForTemporalDetectedFaces:", v6);

}

- (void)migration_setAssetForTorso:(id)a3
{
  id v4;

  v4 = a3;
  -[PLDetectedFace willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assetForTorso"));
  -[PLDetectedFace setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("assetForTorso"));

  -[PLDetectedFace didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assetForFace"));
}

- (void)migration_setPersonForTorso:(id)a3
{
  id v4;

  v4 = a3;
  -[PLDetectedFace willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("personForTorso"));
  -[PLDetectedFace setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("personForTorso"));

  -[PLDetectedFace didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("personForTorso"));
}

uint64_t __37__PLDetectedFace_debugLogDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugLogDescription");
}

uint64_t __37__PLDetectedFace_debugLogDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugLogDescription");
}

+ (id)entityName
{
  return CFSTR("DetectedFace");
}

+ (PLDetectedFace)detectedFaceWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x19AEC1554]();
    v9 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(a1, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v12);
    objc_msgSend(v11, "setFetchLimit:", 1);
    v16 = 0;
    objc_msgSend(v7, "executeFetchRequest:error:", v11, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v14 = 0;
  }

  return (PLDetectedFace *)v14;
}

+ (CGRect)cgRectFromGazeRectString:(id)a3
{
  CGRect result;

  if (a3)
  {
    return NSRectFromString((NSString *)a3);
  }
  else
  {
    result.origin.x = -1.0;
    result.origin.y = -1.0;
    result.size.width = -1.0;
    result.size.height = -1.0;
  }
  return result;
}

+ (id)stringFromGazeRect:(CGRect)a3
{
  void *v10;

  __asm { FMOV            V4.2D, #-1.0 }
  if (*(_QWORD *)&a3.origin.x == (_QWORD)_Q4
    && *(_QWORD *)&a3.origin.y == *((_QWORD *)&_Q4 + 1)
    && *(_QWORD *)&a3.size.width == (_QWORD)_Q4
    && *(_QWORD *)&a3.size.height == *((_QWORD *)&_Q4 + 1))
  {
    v10 = 0;
  }
  else
  {
    DCIM_NSStringFromCGRect();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

+ (void)batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs:(id)a3 predicate:(id)a4 fetchType:(int64_t)a5 library:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDetectedFace.m"), 824, CFSTR("Completion handler is mandatory"));

    if (v15)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDetectedFace.m"), 825, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

    goto LABEL_3;
  }
  if (!v15)
    goto LABEL_5;
LABEL_3:
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __106__PLDetectedFace_batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs_predicate_fetchType_library_completion___block_invoke;
  v23[3] = &unk_1E366DEB0;
  v24 = v15;
  v25 = v13;
  v28 = a1;
  v29 = a5;
  v26 = v14;
  v27 = v16;
  v17 = v16;
  v18 = v14;
  v19 = v13;
  v22 = v15;
  objc_msgSend(v22, "performBlockAndWait:", v23);

}

+ (void)batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs:(id)a3 library:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDetectedFace.m"), 861, CFSTR("Completion handler is mandatory"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDetectedFace.m"), 862, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__PLDetectedFace_batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs_library_completion___block_invoke;
  v17[3] = &unk_1E3674E68;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v21 = a1;
  v12 = v11;
  v13 = v9;
  v16 = v10;
  objc_msgSend(v16, "performBlockAndWait:", v17);

}

+ (id)predicatesToExcludeNonVisibleFaces
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset predicateToExcludeHiddenAssetsWithHiddenKeyPath:](PLManagedAsset, "predicateToExcludeHiddenAssetsWithHiddenKeyPath:", CFSTR("assetForFace.hidden"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  +[PLManagedAsset predicateToExcludeTrashedAssetsWithTrashedStateKeyPath:](PLManagedAsset, "predicateToExcludeTrashedAssetsWithTrashedStateKeyPath:", CFSTR("assetForFace.trashedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  +[PLManagedAsset predicateToExcludeNonvisibleBurstAssetsWithAvalanchePickTypeKeyPath:](PLManagedAsset, "predicateToExcludeNonvisibleBurstAssetsWithAvalanchePickTypeKeyPath:", CFSTR("assetForFace.avalanchePickType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  +[PLManagedAsset predicateToExcludeVideosWithVideoKeyFrameSetWithKeyPathToAsset:](PLManagedAsset, "predicateToExcludeVideosWithVideoKeyFrameSetWithKeyPathToAsset:", CFSTR("assetForFace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO"), CFSTR("hidden"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("assetForFace"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicatesForFacesNeedingFaceCropGeneration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("confirmedFaceCropGenerationState == %d"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rejectedPersonsNeedingFaceCrops.@count > 0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v2;
  v12[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("faceCrop == NULL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("manual == NO"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = v7;
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForArchival
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
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("manual"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("nameSource"), &unk_1E3763908);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trainingType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForFaceCountTrigger
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO && %K == YES && %K != 0"), CFSTR("hidden"), CFSTR("assetVisible"), CFSTR("centerX"));
}

+ (id)predicateForIncludedDetectionTypes:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "containsObject:", &unk_1E375E6D0))
  {
    v4 = objc_msgSend(v3, "containsObject:", &unk_1E375E6E8);

    if ((v4 & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("detectionType"), &unk_1E375E6D0);
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

+ (id)predicateToExcludeBodyOnlyDetection
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0 OR (%K == 0 AND %K == 0)"), CFSTR("centerX"), CFSTR("centerX"), CFSTR("bodyCenterX"));
}

+ (id)predicateToExcludeFaceDetection
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 0 AND (%K > 0)"), CFSTR("centerX"), CFSTR("bodyCenterX"));
}

+ (id)predicateForFetchType:(int64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    +[PLDetectedFace predicateToExcludeFaceDetection](PLDetectedFace, "predicateToExcludeFaceDetection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    +[PLDetectedFace predicateToExcludeBodyOnlyDetection](PLDetectedFace, "predicateToExcludeBodyOnlyDetection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)personIDsByAssetForPersonsVisibleWithPersonIDs:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  id v25;
  id v27;
  id v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = CFSTR("assetForFace");
  v41[1] = CFSTR("personForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v10);

  objc_msgSend(v9, "setResultType:", 2);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("personForFace"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v11);

  v37 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &v37);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v37;
  v14 = v13;
  if (v12)
  {
    v28 = v13;
    v30 = v5;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v12, "count"));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __75__PLDetectedFace_personIDsByAssetForPersonsVisibleWithPersonIDs_inContext___block_invoke;
    v35[3] = &unk_1E36671A8;
    v27 = v16;
    v36 = v27;
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v35);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v12;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((-[NSObject isCancelled](v15, "isCancelled") & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v25 = (id)objc_claimAutoreleasedReturnValue();

            v24 = v27;
            goto LABEL_12;
          }
          -[NSObject becomeCurrentWithPendingUnitCount:](v15, "becomeCurrentWithPendingUnitCount:", 1);
          ((void (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v17)[2](v17, CFSTR("assetForFace"), CFSTR("personForFace"), v23);
          -[NSObject resignCurrent](v15, "resignCurrent");
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        if (v20)
          continue;
        break;
      }
    }

    v24 = v27;
    v25 = v27;
LABEL_12:

    v5 = v30;
    v14 = v28;
    v12 = v29;
  }
  else
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Unable to fetch: %@", buf, 0xCu);
    }
    v25 = 0;
  }

  return v25;
}

+ (id)assetIDsWithAllPersonsFromPersonIDs:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, _BYTE *);
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(a1, "personIDsByAssetForPersonsVisibleWithPersonIDs:inContext:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resignCurrent");
  objc_msgSend(v9, "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __64__PLDetectedFace_assetIDsWithAllPersonsFromPersonIDs_inContext___block_invoke;
  v21 = &unk_1E36671D0;
  v12 = v11;
  v22 = v12;
  v25 = &v26;
  v13 = v6;
  v23 = v13;
  v14 = v8;
  v24 = v14;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &v18);
  objc_msgSend(v9, "resignCurrent", v18, v19, v20, v21);
  if (*((_BYTE *)v27 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v14;
  }
  v16 = v15;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __64__PLDetectedFace_assetIDsWithAllPersonsFromPersonIDs_inContext___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = a3;
  if (objc_msgSend(v7, "isCancelled"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", 1);
  v9 = objc_msgSend(v8, "count");

  if (v9 == objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
  objc_msgSend(*(id *)(a1 + 32), "resignCurrent");

}

uint64_t __75__PLDetectedFace_personIDsByAssetForPersonsVisibleWithPersonIDs_inContext___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v9);
    }
    objc_msgSend(v13, "addObject:", v10);

  }
  return v12;
}

void __90__PLDetectedFace_batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs_library_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("personBeingKeyFace"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = CFSTR("personBeingKeyFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v7);

  objc_msgSend(v6, "setPredicate:", v3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__PLDetectedFace_batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs_library_completion___block_invoke_2;
  v12[3] = &unk_1E3667180;
  v14 = *(_QWORD *)(a1 + 56);
  v9 = v8;
  v13 = v9;
  objc_msgSend(v2, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v6, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __90__PLDetectedFace_batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectIDsForRelationshipNamed:", CFSTR("personBeingKeyFace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

void __106__PLDetectedFace_batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs_predicate_fetchType_library_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = CFSTR("assetForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K IN %@"), CFSTR("assetForFace"), CFSTR("uuid"), *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  +[PLDetectedFace predicateForFetchType:](PLDetectedFace, "predicateForFetchType:", *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pl_addNonNilObject:", v9);

  objc_msgSend(v7, "_pl_addNonNilObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v10);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__PLDetectedFace_batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs_predicate_fetchType_library_completion___block_invoke_2;
  v16[3] = &unk_1E3676458;
  v12 = v11;
  v17 = v12;
  objc_msgSend(v2, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v5, 0, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = 0;
    v15 = v13;
  }
  else
  {
    v14 = v12;
    v15 = 0;
  }
  (*(void (**)(_QWORD, id, void *))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v14, v15);

}

void __106__PLDetectedFace_batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs_predicate_fetchType_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "assetForFace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);
    }
    objc_msgSend(v6, "addObject:", v3);

  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "assetUUID is nil for face %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

+ (id)fetchDetectedFacesForAssetObjectID:(id)a3 managedObjectContext:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  _QWORD v18[2];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a4;
  v7 = a3;
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ OR %K == %@"), CFSTR("assetForFace"), v7, CFSTR("assetForTemporalDetectedFaces"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  v19[0] = CFSTR("personForFace");
  v19[1] = CFSTR("personForTemporalDetectedFaces");
  v19[2] = CFSTR("detectionTraits");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v11);

  v18[0] = CFSTR("detectionType");
  v18[1] = CFSTR("ageType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v12);

  v17 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v17;
  if (v13)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v13);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isValidForJournalPersistence
{
  void *v3;
  BOOL v4;

  if ((-[PLDetectedFace manual](self, "manual") & 1) == 0
    && -[PLDetectedFace nameSource](self, "nameSource") != 3
    && -[PLDetectedFace nameSource](self, "nameSource") != 1
    && -[PLDetectedFace nameSource](self, "nameSource") != 5)
  {
    return 0;
  }
  -[PLDetectedFace assetForFace](self, "assetForFace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)payloadID
{
  void *v2;
  void *v3;

  -[PLDetectedFace uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLDetectedFaceJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLDetectedFace isValidForJournalPersistence](self, "isValidForJournalPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLDetectedFaceJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", CFSTR("manual")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "containsObject:", CFSTR("nameSource"));

  return v4;
}

- (BOOL)supportsCloudUpload
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision");
  if (v3)
    LOBYTE(v3) = !-[PLDetectedFace isTrainingFace](self, "isTrainingFace");
  return v3;
}

- (BOOL)isSyncableChange
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _BOOL4 v15;
  char v16;
  char v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[PLDetectedFace changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("nameSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v19[0] = CFSTR("nameSource");
    v5 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDetectedFace committedValuesForKeys:](self, "committedValuesForKeys:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("nameSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    v10 = -[PLDetectedFace nameSource](self, "nameSource");
    if (v10 > 5 || ((1 << v10) & 0x2A) == 0)
      v5 = (v9 < 6) & v9;

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("rejectedPersons"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("personBeingKeyFace"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12 == v13 || objc_msgSend(v12, "keyFacePickSource") == 1;

  }
  else
  {
    v14 = 0;
  }
  v15 = -[PLDetectedFace isTrainingFace](self, "isTrainingFace");
  if (v11)
    v16 = 1;
  else
    v16 = v14;
  if (v5 | v15)
    v17 = !v15;
  else
    v17 = v16;

  return v17;
}

- (id)scopeIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDetectedFace+CPL.m"), 176, CFSTR("Faces don't produce a change record, they are appended to assets if they are synced at all"));

  return 0;
}

- (id)scopedIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDetectedFace+CPL.m"), 181, CFSTR("Faces don't produce a change record, they are appended to assets if they are synced at all"));

  return 0;
}

- (id)cplFullRecord
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDetectedFace+CPL.m"), 186, CFSTR("Faces don't produce a change record, they are appended to assets if they are synced at all"));

  return 0;
}

- (id)syncDescription
{
  void *v3;
  void *v4;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("uuid");
  v6[1] = CFSTR("nameSource");
  v6[2] = CFSTR("manual");
  v6[3] = CFSTR("assetForFace");
  v6[4] = CFSTR("personForFace");
  v6[5] = CFSTR("personBeingKeyFace");
  v6[6] = CFSTR("cloudLocalState");
  v6[7] = CFSTR("cloudNameSource");
  v6[8] = CFSTR("centerX");
  v6[9] = CFSTR("centerY");
  v6[10] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject truncatedDescriptionWithPropertyKeys:](self, "truncatedDescriptionWithPropertyKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)photosFaceRepresentationQualityMeasure
{
  return (int)-[PLDetectedFace qualityMeasure](self, "qualityMeasure");
}

- (int64_t)photosFaceRepresentationClusterSequenceNumber
{
  return (int)-[PLDetectedFace clusterSequenceNumber](self, "clusterSequenceNumber");
}

- (id)photosFaceRepresentationLocalIdentifier
{
  Class v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = NSClassFromString(CFSTR("PHFace"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDetectedFace+CPL.m"), 286, CFSTR("photosFaceLocalIdentifier: cannot load PHFace class."));

  }
  -[PLDetectedFace uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class localIdentifierWithUUID:](v4, "localIdentifierWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)findExistingFaceMatchingDimension:(id)a3 inFaces:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0D751E8], "sortedViableMergeCandidateFacesFor:from:ignoreSourceAssetDimensions:matchScores:", v7, v8, v5, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    if (!objc_msgSend(v9, "count"))
    {
      v16 = v10;
      objc_msgSend(MEMORY[0x1E0D751E8], "sortedViableMergeCandidateTorsosFor:from:ignoreSourceAssetDimensions:matchScores:", v7, v8, v5, &v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;

      if ((unint64_t)objc_msgSend(v12, "count") < 2 || *MEMORY[0x1E0D115D0])
      {
        v9 = v12;
        v10 = v13;
        goto LABEL_12;
      }
      __CPLAssetsdOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v19 = v7;
        v20 = 2112;
        v21 = v13;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "More than 1 viable torso matches query face %@, matching scores: %@ for faces: %@", buf, 0x20u);
      }
      v9 = v12;
      v10 = v13;
      goto LABEL_11;
    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v7;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "More than 1 viable face matches query face %@, matching scores: %@ for faces: %@", buf, 0x20u);
    }
LABEL_11:

  }
LABEL_12:
  objc_msgSend(v9, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_facesMatchingPredicate:(id)a3 limit:(unint64_t)a4 inPhotoLibrary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x19AEC1554]();
  v12 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v14, "setPredicate:", v8);
  objc_msgSend(v14, "setFetchBatchSize:", 100);
  if (a4)
    objc_msgSend(v14, "setFetchLimit:", a4);
  v19 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v14, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;
  if (!v15 && !*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch faces: %@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v11);

  return v15;
}

+ (id)syncableFacesPredicate
{
  pl_dispatch_once();
  return (id)syncableFacesPredicate_predicate;
}

+ (id)_syncableFacesToUploadInitiallyPredicate
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
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("cloudLocalState"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("assetForFace.cloudLocalState"), &unk_1E3764040);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v7;
  objc_msgSend(a1, "syncableFacesPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)syncableFacesToUploadInitiallyInLibrary:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "_syncableFacesToUploadInitiallyPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_facesMatchingPredicate:limit:inPhotoLibrary:", v7, a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (int64_t)resetAssetForAllSyncableFacesInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  int64_t v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("cloudLocalState"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_facesMatchingPredicate:limit:inPhotoLibrary:", v7, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PLDetectedFace_CPL__resetAssetForAllSyncableFacesInManagedObjectContext_error___block_invoke;
  v15[3] = &unk_1E3673F78;
  v15[4] = &v16;
  objc_msgSend(v6, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v9, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v17;
  if (v10)
  {
    v17[3] = 0x7FFFFFFFFFFFFFFFLL;
    if (a4)
    {
      *a4 = objc_retainAutorelease(v10);
      v12 = v17;
    }
  }
  v13 = v12[3];

  _Block_object_dispose(&v16, 8);
  return v13;
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
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = objc_alloc(MEMORY[0x1E0C97AB0]);
  objc_msgSend(a1, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEntityName:", v7);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("cloudLocalState"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultType:", 2);
  v19 = CFSTR("cloudLocalState");
  v20[0] = &unk_1E3760B78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToUpdate:", v10);

  objc_msgSend(v8, "setPredicate:", v9);
  objc_msgSend(v4, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v11, "executeRequest:error:", v8, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  if (v12)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "result");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Batch updated %@ detectedFaces", buf, 0xCu);

      }
LABEL_8:

    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to batch update detectedFaces: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v5);
}

void __81__PLDetectedFace_CPL__resetAssetForAllSyncableFacesInManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "assetForFace");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "cloudLocalState") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setModificationDate:", v3);

    objc_msgSend(v4, "setCloudLocalState:", 0);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

void __45__PLDetectedFace_CPL__syncableFacesPredicate__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d AND %K != %d"), CFSTR("nameSource"), 2, CFSTR("nameSource"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 1 OR %K.@count > 0"), CFSTR("manual"), CFSTR("rejectedPersons"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3528];
  v15[0] = v0;
  v15[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trainingType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsDetectionType"))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d OR %K > %d"), CFSTR("detectionType"), 1, CFSTR("detectionType"), 2);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("detectionType"), 1, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 0"), CFSTR("duration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v4;
  v14[1] = v5;
  v14[2] = v6;
  v14[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)syncableFacesPredicate_predicate;
  syncableFacesPredicate_predicate = v10;

}

@end

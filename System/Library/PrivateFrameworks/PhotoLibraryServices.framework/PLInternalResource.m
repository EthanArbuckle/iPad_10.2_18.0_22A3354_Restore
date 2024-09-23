@implementation PLInternalResource

- (id)_libraryID
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[PLInternalResource managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInternalResource.m"), 140, CFSTR("Unexpected nil pathManager on managed object context."));

  }
  PLLibraryIDFromPathManager();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_colorSpaceIsNativeForDisplay
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PLInternalResource isDerivative](self, "isDerivative");
  if (v3)
  {
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", -[PLInternalResource recipeID](self, "recipeID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "colorSpaceIsNativeForDisplay");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_avAssetProxyIfTypeIsFullSizeOrOriginal
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;

  v3 = -[PLInternalResource cplType](self, "cplType");
  if (v3 == 16)
  {
    -[PLInternalResource asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasAdjustments");

    if (v7)
    {
      -[PLInternalResource asset](self, "asset");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "avAssetProxyForFullSizeAllowReadFromFile:", 0);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v8 = 0;
    return v8;
  }
  if (v3 != 1)
    goto LABEL_7;
  -[PLInternalResource asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avAssetProxyForOriginalAllowReadFromFile:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = (void *)v5;

  return v8;
}

- (BOOL)supportsCloudUpload
{
  return 1;
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
  -[PLInternalResource changedValues](self, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[PLInternalResource listOfSyncedProperties](PLInternalResource, "listOfSyncedProperties", 0);
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

- (BOOL)supportsTrashedState
{
  return objc_msgSend((id)objc_opt_class(), "supportsTrashedStateForResourceIdentity:", self);
}

- (BOOL)isTrashedOrExpunged
{
  return -[PLInternalResource trashedState](self, "trashedState") != 0;
}

- (void)applyTrashedState:(signed __int16)a3
{
  uint64_t v3;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2592000.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource applyTrashedState:trashedDate:](self, "applyTrashedState:trashedDate:", v3, v5);

}

- (void)applyTrashedState:(signed __int16)a3 trashedDate:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  char v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  NSObject *v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!-[PLInternalResource supportsTrashedState](self, "supportsTrashedState"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInternalResource.m"), 234, CFSTR("expect trashable resource"));

  }
  -[PLInternalResource asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4 == 2)
  {
    if (-[PLInternalResource trashedState](self, "trashedState") == 1)
    {
      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[PLInternalResource objectID](self, "objectID");
        v15 = objc_claimAutoreleasedReturnValue();
        -[PLInternalResource asset](self, "asset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uuid");
        v17 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2114;
        v31 = v17;
        v18 = "Expunging already trashed resource %{public}@ on asset %{public}@";
LABEL_19:
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);

      }
    }
    else
    {
      if (-[PLInternalResource trashedState](self, "trashedState"))
        goto LABEL_21;
      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[PLInternalResource objectID](self, "objectID");
        v15 = objc_claimAutoreleasedReturnValue();
        -[PLInternalResource asset](self, "asset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uuid");
        v17 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2114;
        v31 = v17;
        v18 = "Expunging resource, skipping trash state on resource %{public}@ on asset %{public}@";
        goto LABEL_19;
      }
    }

LABEL_21:
    -[PLInternalResource setTrashedState:](self, "setTrashedState:", v4);
    -[PLInternalResource fileURL](self, "fileURL");
    v9 = objc_claimAutoreleasedReturnValue();
    -[PLInternalResource deleteResource](self, "deleteResource");
    if (!v9)
    {
      PLBackendGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[PLInternalResource objectID](self, "objectID");
        v22 = objc_claimAutoreleasedReturnValue();
        -[PLInternalResource asset](self, "asset");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "uuid");
        v24 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v22;
        v30 = 2114;
        v31 = v24;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Cannot delete resource file for resource: %{public}@ on asset: %{public}@ because fileURL is nil.", buf, 0x16u);

      }
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v20 = -[NSObject removeItemAtURL:error:](v19, "removeItemAtURL:error:", v9, &v27);
    v21 = v27;
    if ((v20 & 1) == 0)
    {
      v25 = PLIsErrorFileNotFound();

      if ((v25 & 1) != 0)
        goto LABEL_27;
      PLBackendGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v9;
        v30 = 2112;
        v31 = v21;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Cannot delete resource file: %@, %@", buf, 0x16u);
      }
    }

LABEL_27:
    objc_msgSend(v8, "reevaluateCameraProcessingAdjustmentState");
    goto LABEL_28;
  }
  if ((_DWORD)v4 == 1)
  {
    if (!-[PLInternalResource trashedState](self, "trashedState"))
    {
      -[PLInternalResource setTrashedState:](self, "setTrashedState:", v4);
      -[PLInternalResource setTrashedDate:](self, "setTrashedDate:", v7);
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[PLInternalResource objectID](self, "objectID");
        v10 = objc_claimAutoreleasedReturnValue();
        -[PLInternalResource asset](self, "asset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v10;
        v30 = 2114;
        v31 = v12;
        v13 = "Trashed resource %{public}@ on asset %{public}@";
        goto LABEL_15;
      }
LABEL_28:

    }
  }
  else if (!(_DWORD)v4 && -[PLInternalResource trashedState](self, "trashedState") == 1)
  {
    -[PLInternalResource setTrashedState:](self, "setTrashedState:", v4);
    -[PLInternalResource setTrashedDate:](self, "setTrashedDate:", 0);
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PLInternalResource objectID](self, "objectID");
      v10 = objc_claimAutoreleasedReturnValue();
      -[PLInternalResource asset](self, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v10;
      v30 = 2114;
      v31 = v12;
      v13 = "Untrashed resource %{public}@ on asset %{public}@";
LABEL_15:
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);

      goto LABEL_28;
    }
    goto LABEL_28;
  }

}

- (BOOL)shouldPersistTrashedState
{
  void *v3;
  BOOL v4;

  if (!-[PLInternalResource supportsTrashedState](self, "supportsTrashedState"))
    return 0;
  -[PLInternalResource fileSystemBookmark](self, "fileSystemBookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)persistTrashedStateToFilesystem
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[PLInternalResource shouldPersistTrashedState](self, "shouldPersistTrashedState"))
  {
    -[PLInternalResource fileURL](self, "fileURL");
    v6 = objc_claimAutoreleasedReturnValue();
    v3 = -[PLInternalResource isTrashedOrExpunged](self, "isTrashedOrExpunged");
    v4 = (void *)v6;
    if (v6)
    {
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0D73200], "filesystemPersistenceBatchItemForFileAtURL:", v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setUInt16:forKey:", 1, *MEMORY[0x1E0D74000]);
        objc_msgSend(v5, "persist");

        v4 = (void *)v6;
      }
    }

  }
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLInternalResource;
  -[PLManagedObject prepareForDeletion](&v6, sel_prepareForDeletion);
  -[PLInternalResource asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLInternalResource markAsNotLocallyAvailable](self, "markAsNotLocallyAvailable");
    -[PLInternalResource cloudUUIDForDeletion](self, "cloudUUIDForDeletion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setCloudDeleteAssetUUIDWithResourceType:](self, "setCloudDeleteAssetUUIDWithResourceType:", v4);

  }
  -[PLInternalResource managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "mergingChanges") & 1) == 0
    && -[PLInternalResource supportsTrashedState](self, "supportsTrashedState"))
  {
    objc_msgSend(v5, "recordCloudDeletionForObject:", self);
  }

}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLInternalResource;
  -[PLManagedObject willSave](&v10, sel_willSave);
  -[PLInternalResource managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (-[PLInternalResource isDeleted](self, "isDeleted") & 1) == 0)
  {
    if (-[PLInternalResource isInserted](self, "isInserted"))
    {
      -[PLInternalResource persistTrashedStateToFilesystem](self, "persistTrashedStateToFilesystem");
    }
    else if (-[PLInternalResource shouldPersistTrashedState](self, "shouldPersistTrashedState"))
    {
      -[PLInternalResource fileURL](self, "fileURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        -[PLInternalResource changedValues](self, "changedValues");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trashedState"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0D73200], "filesystemPersistenceBatchItemForFileAtURL:", v4);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[PLInternalResource isTrashedOrExpunged](self, "isTrashedOrExpunged");
          v9 = *MEMORY[0x1E0D74000];
          if (v8)
            objc_msgSend(v7, "setUInt16:forKey:", 1, v9);
          else
            objc_msgSend(v7, "setData:forKey:", 0, v9);
          objc_msgSend(v7, "persist");

        }
      }

    }
  }

}

- (int64_t)cloudDeletionType
{
  return 10;
}

- (NSString)cloudUUIDForDeletion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLInternalResource cloudDeleteAssetUUIDWithResourceType](self, "cloudDeleteAssetUUIDWithResourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[PLInternalResource asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%s%tu"), v6, "-@-", -[PLInternalResource cplType](self, "cplType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLInternalResource setCloudDeleteAssetUUIDWithResourceType:](self, "setCloudDeleteAssetUUIDWithResourceType:", v7);
  }
  return (NSString *)-[PLInternalResource cloudDeleteAssetUUIDWithResourceType](self, "cloudDeleteAssetUUIDWithResourceType");
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  -[PLInternalResource dataStoreKeyData](self, "dataStoreKeyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PLInternalResource isLocallyAvailable](self, "isLocallyAvailable") && !v6
    || (v7 = -[PLInternalResource localAvailability](self, "localAvailability"), v8 = (void *)MEMORY[0x1E0C9AA60],
                                                                                 v7 < 0)
    && v6)
  {
    +[PLResourceModelValidationError localAvailabilityInconsistencyErrorForResource:](PLResourceModelValidationError, "localAvailabilityInconsistencyErrorForResource:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!-[PLInternalResource dataStoreClassID](self, "dataStoreClassID")
    && !-[PLInternalResource isCPLResource](self, "isCPLResource")
    && !-[PLInternalResource isDerivative](self, "isDerivative")
    && (-[PLInternalResource localAvailability](self, "localAvailability") & 0x80000000) != 0)
  {
    +[PLResourceModelValidationError unexpectedLocalResourceError:](PLResourceModelValidationError, "unexpectedLocalResourceError:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  -[PLInternalResource dataStoreKey](self, "dataStoreKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "validateForAssetID:resourceIdentity:", v5, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isVirtual
{
  return 0;
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PLInternalResource compactUTI](self, "compactUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLInternalResource compactUTI](self, "compactUTI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUniformTypeIdentifier utiWithCompactRepresentation:conformanceHint:](PLUniformTypeIdentifier, "utiWithCompactRepresentation:conformanceHint:", v4, -[PLInternalResource utiConformanceHint](self, "utiConformanceHint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (PLUniformTypeIdentifier *)v5;
}

- (void)setUniformTypeIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToUniformTypeIdentifier:", v9);

  v6 = v9;
  if ((v5 & 1) == 0)
  {
    if (v9)
    {
      objc_msgSend(v9, "compactRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLInternalResource setCompactUTI:](self, "setCompactUTI:", v7);

      v8 = objc_msgSend(v9, "conformanceHint");
    }
    else
    {
      -[PLInternalResource setCompactUTI:](self, "setCompactUTI:", 0);
      v8 = 0;
    }
    -[PLInternalResource setUtiConformanceHint:](self, "setUtiConformanceHint:", v8);
    v6 = v9;
  }

}

- (void)setFingerprint:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLInternalResource willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("fingerprint"));
  -[PLInternalResource primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("fingerprint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("fingerprint"));
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    if (!v4 && v5)
    {
      PLImageManagerGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[PLInternalResource objectID](self, "objectID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Erasing existing fingerprint on resource: %@", (uint8_t *)&v8, 0xCu);

      }
    }
    -[PLInternalResource willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("fingerprint"));
    -[PLInternalResource setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("fingerprint"));
    -[PLInternalResource didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("fingerprint"));
  }

}

- (BOOL)isOriginalResource
{
  PLInternalResource *v2;
  BOOL v3;

  v2 = self;
  if (-[PLInternalResource version](v2, "version"))
    v3 = 0;
  else
    v3 = (-[PLInternalResource recipeID](v2, "recipeID") & 1) == 0;

  return v3;
}

- (BOOL)isDerivative
{
  return -[PLInternalResource recipeID](self, "recipeID") & 1;
}

- (PLResourceDataStore)dataStore
{
  unsigned __int16 v3;
  void *v4;
  void *v5;

  v3 = -[PLInternalResource dataStoreClassID](self, "dataStoreClassID");
  -[PLInternalResource _libraryID](self, "_libraryID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLResourceDataStore *)v5;
}

- (PLResourceDataStoreKey)dataStoreKey
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[PLInternalResource dataStoreKeyData](self, "dataStoreKeyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "bytes");
    -[PLInternalResource dataStore](self, "dataStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyFromKeyStruct:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (PLResourceDataStoreKey *)v7;
}

- (PLAssetID)assetID
{
  void *v2;
  void *v3;

  -[PLInternalResource asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLAssetID *)v3;
}

- (unsigned)orientation
{
  int v3;
  uint64_t v4;
  int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;

  v3 = -[PLInternalResource resourceType](self, "resourceType");
  v4 = -[PLInternalResource recipeID](self, "recipeID");
  v5 = -[PLInternalResource version](self, "version");
  -[PLInternalResource asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "orientation");
  -[PLInternalResource asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "originalOrientation");
  -[PLInternalResource asset](self, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PLResourceOrientationFromResourceInfo(v3, v4, v5, v7, v9, objc_msgSend(v10, "hasAdjustments"));

  return v11;
}

- (int64_t)orientedWidth
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[PLInternalResource unorientedWidth](self, "unorientedWidth");
  v4 = -[PLInternalResource unorientedHeight](self, "unorientedHeight");
  if ((unint64_t)-[PLInternalResource orientation](self, "orientation") - 5 >= 4)
    v5 = v3;
  else
    v5 = v4;
  return (uint64_t)(double)v5;
}

- (int64_t)orientedHeight
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[PLInternalResource unorientedWidth](self, "unorientedWidth");
  v4 = -[PLInternalResource unorientedHeight](self, "unorientedHeight");
  if ((unint64_t)-[PLInternalResource orientation](self, "orientation") - 5 >= 4)
    v5 = v4;
  else
    v5 = v3;
  return (uint64_t)(double)v5;
}

- (float)scale
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  float v12;

  -[PLInternalResource asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unorientedSize");
  v5 = v4;
  v7 = v6;

  v8 = v5 * v7;
  LODWORD(v9) = 0;
  if (v8 > 0.0)
  {
    v10 = -[PLInternalResource unorientedWidth](self, "unorientedWidth", v9);
    v11 = -[PLInternalResource unorientedHeight](self, "unorientedHeight");
    v12 = v8;
    *(float *)&v9 = (float)(v11 * v10) / v12;
  }
  return *(float *)&v9;
}

- (BOOL)isPlayableVideo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;

  if (!-[PLInternalResource isLocallyAvailable](self, "isLocallyAvailable"))
    goto LABEL_13;
  v3 = objc_alloc(MEMORY[0x1E0D75140]);
  -[PLInternalResource fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAVURL:options:timeZoneLookup:", v4, 12, 0);

  if (!v5
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isPlayable")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
LABEL_13:
    if (-[PLInternalResource resourceType](self, "resourceType") != 1)
      goto LABEL_7;
    v7 = objc_alloc(MEMORY[0x1E0D75140]);
    -[PLInternalResource _avAssetProxyIfTypeIsFullSizeOrOriginal](self, "_avAssetProxyIfTypeIsFullSizeOrOriginal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithAVAsset:options:timeZoneLookup:", v8, 12, 0);

    if (!v9
      || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isPlayable")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v6))
    {
LABEL_7:
      -[PLInternalResource codecFourCharCodeName](self, "codecFourCharCodeName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10
        || (v11 = (void *)MEMORY[0x1E0CB37E8],
            -[PLInternalResource codecFourCharCodeName](self, "codecFourCharCodeName"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "numberWithBool:", +[PLCodec isPlayableFourCharCodecName:](PLCodec, "isPlayableFourCharCodecName:", v12)), v6 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v6))
      {
        -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isPlayableVideo");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v15 = objc_msgSend(v6, "BOOLValue");

  return v15;
}

- (void)setLocalAvailability:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[PLInternalResource willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("localAvailability"));
  -[PLInternalResource primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("localAvailability"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shortValue");

  -[PLInternalResource didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("localAvailability"));
  if (v6 != (_DWORD)v3)
  {
    -[PLInternalResource willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("localAvailability"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("localAvailability"));

    -[PLInternalResource didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("localAvailability"));
    if ((-[PLInternalResource isDeleted](self, "isDeleted") & 1) == 0)
    {
      -[PLInternalResource asset](self, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if ((int)v3 >= 1 && v6 < 0)
        {
          -[PLInternalResource asset](self, "asset");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "reconsiderLocalAvailabilityTargetsForResourceGeneratableByAvailabilityWorker");

        }
      }
    }
  }
}

- (BOOL)isInCloud
{
  int v3;
  void *v4;
  char v5;
  void *v6;

  v3 = (unsigned __int16)-[PLInternalResource dataStoreClassID](self, "dataStoreClassID");
  if ((v3 - 2) < 2)
  {
    -[PLInternalResource dataStore](self, "dataStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "dataStoreSubtypeIsDownloadable:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"));
LABEL_8:

    return v5;
  }
  if (!v3)
  {
    -[PLInternalResource dataStore](self, "dataStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "dataStoreSubtypeIsDownloadable:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype")))
    {
      -[PLInternalResource fingerprint](self, "fingerprint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

    }
    else
    {
      v5 = 0;
    }
    goto LABEL_8;
  }
  return 0;
}

- (PLInternalResourceSidecarRepresentation)sidecarRepresentation
{
  PLInternalResourceSidecarRepresentation *sidecarRepresentation;
  PLInternalResourceSidecarRepresentation *v4;
  PLInternalResourceSidecarRepresentation *v5;

  sidecarRepresentation = self->_sidecarRepresentation;
  if (!sidecarRepresentation)
  {
    v4 = -[PLInternalResourceSidecarRepresentation initWithResource:]([PLInternalResourceSidecarRepresentation alloc], "initWithResource:", self);
    v5 = self->_sidecarRepresentation;
    self->_sidecarRepresentation = v4;

    sidecarRepresentation = self->_sidecarRepresentation;
  }
  return sidecarRepresentation;
}

- (id)validatedExternalResourceRepresentationUsingFileURL:(id)a3
{
  id v4;
  PLValidatedExternalCloudResource *v5;
  PLValidatedExternalCloudResource *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLValidatedExternalCloudResource *v11;

  v4 = a3;
  if (-[PLInternalResource isCPLResource](self, "isCPLResource"))
    v5 = -[PLValidatedExternalCloudResource initWithInternalResource:]([PLValidatedExternalCloudResource alloc], "initWithInternalResource:", self);
  else
    v5 = objc_alloc_init(PLValidatedExternalResource);
  v6 = v5;
  -[PLValidatedExternalResource setVersion:](v5, "setVersion:", -[PLInternalResource version](self, "version"));
  -[PLValidatedExternalResource setResourceType:](v6, "setResourceType:", -[PLInternalResource resourceType](self, "resourceType"));
  -[PLValidatedExternalResource setRecipeID:](v6, "setRecipeID:", -[PLInternalResource recipeID](self, "recipeID"));
  -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setUniformTypeIdentifier:](v6, "setUniformTypeIdentifier:", v7);

  -[PLValidatedExternalResource setFileURL:](v6, "setFileURL:", v4);
  -[PLValidatedExternalResource setDataLength:](v6, "setDataLength:", -[PLInternalResource dataLength](self, "dataLength"));
  -[PLValidatedExternalResource setUnorientedWidth:](v6, "setUnorientedWidth:", -[PLInternalResource unorientedWidth](self, "unorientedWidth"));
  -[PLValidatedExternalResource setUnorientedHeight:](v6, "setUnorientedHeight:", -[PLInternalResource unorientedHeight](self, "unorientedHeight"));
  -[PLInternalResource codecFourCharCodeName](self, "codecFourCharCodeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setCodecFourCharCode:](v6, "setCodecFourCharCode:", v8);

  -[PLValidatedExternalResource setPtpTrashedState:](v6, "setPtpTrashedState:", -[PLInternalResource ptpTrashedState](self, "ptpTrashedState"));
  -[PLInternalResource sidecarIndex](self, "sidecarIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setSidecarIndex:](v6, "setSidecarIndex:", v9);

  -[PLValidatedExternalResource setTrashedState:](v6, "setTrashedState:", -[PLInternalResource trashedState](self, "trashedState"));
  -[PLInternalResource trashedDate](self, "trashedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setTrashedDate:](v6, "setTrashedDate:", v10);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v6;
    -[PLValidatedExternalCloudResource setCplType:](v11, "setCplType:", -[PLInternalResource cplType](self, "cplType"));
    -[PLValidatedExternalCloudResource setRemoteAvailability:](v11, "setRemoteAvailability:", -[PLInternalResource remoteAvailability](self, "remoteAvailability"));

  }
  return v6;
}

- (BOOL)repairResourceValidationErrors:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void **v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  PLInternalResource *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  const char *v59;
  int v60;
  NSObject *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  id v67;
  id v68;
  void *v69;
  NSObject *v70;
  void *v71;
  PLInternalResource *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  BOOL v76;
  __int128 v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  char v83;
  id v84;
  char v85;
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  PLInternalResource *v97;
  void *v98;
  _QWORD v99[3];

  v99[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PLResourceModelValidationError allPossibleErrorCodes](PLResourceModelValidationError, "allPossibleErrorCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v7 = v6;

    v5 = v7;
  }
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  if (!objc_msgSend(v8, "count"))
  {
    v76 = 0;
    goto LABEL_73;
  }
  v80 = v6;
  v81 = v5;
  v83 = 0;
  *(_QWORD *)&v9 = 138543618;
  v78 = v9;
  do
  {
    objc_msgSend(v8, "anyObject", v78);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    if (v11 == 1 || v11 == 3)
    {
      -[PLInternalResource asset](self, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        PLImageManagerGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          -[PLInternalResource objectID](self, "objectID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v91 = v24;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "[RM]: Repair: Unable to repair resource with objectID: %{public}@, no asset is set.", buf, 0xCu);

        }
        goto LABEL_66;
      }
      -[PLInternalResource fileURL](self, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLInternalResource validatedExternalResourceRepresentationUsingFileURL:](self, "validatedExternalResourceRepresentationUsingFileURL:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLInternalResource asset](self, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "master");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = -[PLInternalResource isCPLResource](self, "isCPLResource");
        v19 = MEMORY[0x1E0C9AA60];
        if (!v18)
          goto LABEL_33;
        -[PLInternalResource asset](self, "asset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "pathForCPLResourceType:adjusted:", -[PLInternalResource cplType](self, "cplType"), -[PLInternalResource isAdjustedResource](self, "isAdjustedResource"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setFileURL:", v22);

        }
        else
        {
          objc_msgSend(v15, "setFileURL:", 0);
        }
        v99[0] = v15;
        v31 = (void *)MEMORY[0x1E0C99D20];
        v32 = (void **)v99;
      }
      else
      {
        if (-[PLInternalResource dataStoreClassID](self, "dataStoreClassID") != 3)
        {
          -[PLInternalResource asset](self, "asset");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLResourceInstaller externalResourcesForExistingAsset:referencedResourceURLs:](PLResourceInstaller, "externalResourcesForExistingAsset:referencedResourceURLs:", v21, 0);
          v34 = objc_claimAutoreleasedReturnValue();
LABEL_32:
          v19 = v34;

LABEL_33:
          v35 = (void *)MEMORY[0x1E0CB3880];
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = __74__PLInternalResource_repairResourceValidationErrors_managedObjectContext___block_invoke;
          v88[3] = &unk_1E3660E98;
          v36 = v15;
          v89 = v36;
          objc_msgSend(v35, "predicateWithBlock:", v88);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject filteredArrayUsingPredicate:](v19, "filteredArrayUsingPredicate:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "firstObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            v84 = v36;
            v40 = objc_msgSend(v36, "isEqualToValidatedExternalResource:", v39);
            if (-[PLInternalResource isLocallyAvailable](self, "isLocallyAvailable"))
            {
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              buf[0] = 0;
              objc_msgSend(v39, "fileURL");
              v42 = self;
              v43 = v19;
              v44 = v39;
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "path");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v41, "fileExistsAtPath:isDirectory:", v46, buf);
              v48 = (buf[0] == 0) & ~v47;

              v39 = v44;
              v19 = v43;
              self = v42;

            }
            else
            {
              v48 = 0;
            }
            v60 = v40 ^ 1 | v48;
            PLImageManagerGetLog();
            v61 = objc_claimAutoreleasedReturnValue();
            v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
            if (v60 == 1)
            {
              v36 = v84;
              if (v62)
              {
                -[PLInternalResource objectID](self, "objectID");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v91 = v63;
                v92 = 2114;
                v93 = v81;
                v94 = 2112;
                v95 = (uint64_t)v39;
                v96 = 2112;
                v97 = self;
                _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_DEFAULT, "[RM]: Repair: Storing corrections to objectID: %{public}@ for error codes: %{public}@, using external resource: %@, on target resource: %@.", buf, 0x2Au);

              }
              -[PLInternalResource dataStore](self, "dataStore");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLInternalResource asset](self, "asset");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = 0;
              v87 = 0;
              v82 = v39;
              v66 = objc_msgSend(v64, "storeExternalResource:forAsset:options:error:resultingResource:", v39, v65, 0, &v87, &v86);
              v67 = v87;
              v68 = v86;

              if ((v66 & 1) != 0)
              {
                v83 = 1;
              }
              else
              {
                PLImageManagerGetLog();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  -[PLInternalResource objectID](self, "objectID");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = objc_msgSend(v67, "code");
                  objc_msgSend(v67, "domain");
                  v72 = (PLInternalResource *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v91 = v71;
                  v92 = 2112;
                  v93 = v67;
                  v94 = 2048;
                  v95 = v79;
                  v96 = 2114;
                  v97 = v72;
                  _os_log_impl(&dword_199541000, v70, OS_LOG_TYPE_ERROR, "[RM]: Repair: Unable to repair resource with objectID: %{public}@, cannot store changes. error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);

                }
              }

              v39 = v82;
            }
            else
            {
              v36 = v84;
              if (v62)
              {
                -[PLInternalResource objectID](self, "objectID");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v91 = v69;
                _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_DEFAULT, "[RM]: Repair: Unable to repair resource with objectID: %{public}@, could not produce any changes vs stored resource.", buf, 0xCu);

              }
            }
            goto LABEL_65;
          }
          -[PLInternalResource fileURL](self, "fileURL");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            v85 = 0;
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLInternalResource fileURL](self, "fileURL");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "path");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v50, "fileExistsAtPath:isDirectory:", v52, &v85);

            if (!v53)
            {
              PLImageManagerGetLog();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                -[PLInternalResource fileURL](self, "fileURL");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "path");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLInternalResource objectID](self, "objectID");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v91 = v56;
                v92 = 2114;
                v93 = v57;
                v94 = 2114;
                v95 = (uint64_t)v81;
                v58 = v54;
                v59 = "[RM]: Repair: File not locally available at path: '%@' for resource objectID: %{public}@ for error"
                      " codes: %{public}@, marking as not locally available.";
                goto LABEL_58;
              }
LABEL_59:
              v39 = 0;

              -[PLInternalResource markAsNotLocallyAvailable](self, "markAsNotLocallyAvailable");
              goto LABEL_60;
            }
            if (v85)
            {
              PLImageManagerGetLog();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                -[PLInternalResource fileURL](self, "fileURL");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "path");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLInternalResource objectID](self, "objectID");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v91 = v56;
                v92 = 2114;
                v93 = v57;
                v94 = 2114;
                v95 = (uint64_t)v81;
                v58 = v54;
                v59 = "[RM]: Repair: Unexpectedly found directory at resource path: '%@' for resource objectID: %{public}"
                      "@ for error codes: %{public}@, marking as not locally available.";
LABEL_58:
                _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_DEFAULT, v59, buf, 0x20u);

                goto LABEL_59;
              }
              goto LABEL_59;
            }
            v39 = 0;
            if ((v83 & 1) != 0)
              goto LABEL_60;
          }
          else if ((v83 & 1) != 0)
          {
LABEL_60:
            v83 = 1;
LABEL_65:

LABEL_66:
            objc_msgSend(v8, "removeObject:", &unk_1E375D518);
            objc_msgSend(v8, "removeObject:", &unk_1E375D530);
            goto LABEL_67;
          }
          PLImageManagerGetLog();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            -[PLInternalResource objectID](self, "objectID");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v78;
            v91 = v74;
            v92 = 2114;
            v93 = v81;
            _os_log_impl(&dword_199541000, v73, OS_LOG_TYPE_DEFAULT, "[RM]: Repair: Cannot find external resource match to correct for resource objectID: %{public}@ for error codes: %{public}@, no corrections made.", buf, 0x16u);

          }
          v83 = 0;
          goto LABEL_65;
        }
        -[PLInternalResource asset](self, "asset");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[PLInternalResource resourceType](self, "resourceType");
        v27 = -[PLInternalResource version](self, "version");
        v28 = -[PLInternalResource recipeID](self, "recipeID");
        -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "syndicationResourceURLForResourceType:version:recipeID:utiString:error:", v26, v27, v28, v30, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          objc_msgSend(v15, "setFileURL:", v21);
        v98 = v15;
        v31 = (void *)MEMORY[0x1E0C99D20];
        v32 = &v98;
      }
      objc_msgSend(v31, "arrayWithObjects:count:", v32, 1);
      v34 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    if (v11 == 5)
    {
      if ((-[PLInternalResource localAvailability](self, "localAvailability") & 0x80000000) != 0
        && (-[PLInternalResource dataStoreKeyData](self, "dataStoreKeyData"),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            v33,
            v33))
      {
        v83 = 1;
        -[PLInternalResource setLocalAvailability:](self, "setLocalAvailability:", 1);
      }
      else if (-[PLInternalResource isLocallyAvailable](self, "isLocallyAvailable"))
      {
        -[PLInternalResource dataStoreKeyData](self, "dataStoreKeyData");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          -[PLInternalResource setLocalAvailability:](self, "setLocalAvailability:", 0xFFFFFFFFLL);
          v83 = 1;
        }
      }
    }
LABEL_67:
    objc_msgSend(v8, "removeObject:", v10);

  }
  while (objc_msgSend(v8, "count"));
  if ((v83 & 1) != 0)
  {
    -[PLInternalResource asset](self, "asset");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "recalculateImageRequestHints");

    v76 = 1;
  }
  else
  {
    v76 = 0;
  }
  v5 = v81;
  v6 = v80;
LABEL_73:

  return v76;
}

- (void)setResourceIdentity:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PLInternalResource setResourceType:](self, "setResourceType:", objc_msgSend(v5, "resourceType"));
  -[PLInternalResource setVersion:](self, "setVersion:", objc_msgSend(v5, "version"));
  -[PLInternalResource setRecipeID:](self, "setRecipeID:", objc_msgSend(v5, "recipeID"));
  objc_msgSend(v5, "uniformTypeIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PLInternalResource setUniformTypeIdentifier:](self, "setUniformTypeIdentifier:", v6);
}

- (id)fileURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLInternalResource asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLInternalResource dataStoreKey](self, "dataStoreKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLForAssetID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)expectedFileURL
{
  void *v3;
  void *v4;
  void *v5;

  -[PLInternalResource dataStore](self, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expectedFileURLForResource:asset:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isDefaultOrientation
{
  return -[PLInternalResource orientation](self, "orientation") == 1;
}

- (BOOL)isAdjustedResource
{
  return -[PLInternalResource version](self, "version") == 3
      || -[PLInternalResource version](self, "version") == 2
      || -[PLInternalResource version](self, "version") == 1;
}

- (BOOL)isAdjustedFullSizeRenderResource
{
  if (-[PLInternalResource version](self, "version") != 2)
    return 0;
  if (-[PLInternalResource cplType](self, "cplType") == 2 || -[PLInternalResource cplType](self, "cplType") == 16)
    return 1;
  return -[PLInternalResource cplType](self, "cplType") == 19;
}

- (void)markAsNotLocallyAvailable
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v3 = -[PLInternalResource localAvailability](self, "localAvailability");
  -[PLInternalResource dataStoreKey](self, "dataStoreKey");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PLInternalResource dataStoreClassID](self, "dataStoreClassID") == 3)
    -[PLInternalResource setSyndicationLocalAvailabilityWithAvailable:](self, "setSyndicationLocalAvailabilityWithAvailable:", 0);
  else
    -[PLInternalResource setLocalAvailability:](self, "setLocalAvailability:", 0xFFFFFFFFLL);
  -[PLInternalResource setDataStoreKeyData:](self, "setDataStoreKeyData:", 0);
  -[PLInternalResource setFileID:](self, "setFileID:", -1);
  if ((v3 & 0x80000000) == 0)
  {
    -[PLInternalResource asset](self, "asset");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[PLInternalResource asset](self, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isDeleted");

      if ((v7 & 1) == 0)
      {
        -[PLInternalResource asset](self, "asset");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recalculateImageRequestHintsForResource:afterLocalAvailabilityChangeFrom:previousDataStoreKey:", self, v3, v9);

      }
    }
  }

}

- (void)markAsNotLocallyAvailableAfterPurge
{
  id v3;

  -[PLInternalResource markAsNotLocallyAvailable](self, "markAsNotLocallyAvailable");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource setCloudPrunedAt:](self, "setCloudPrunedAt:", v3);

}

- (void)deleteResource
{
  void *v4;
  void *v5;
  void *v6;

  -[PLInternalResource managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInternalResource.m"), 878, CFSTR("deleteResource requires a managedObjectContext."));

  }
  -[PLInternalResource managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteObject:", self);

  -[PLInternalResource setAsset:](self, "setAsset:", 0);
  -[PLInternalResource setTransientCloudMaster:](self, "setTransientCloudMaster:", 0);
}

- (BOOL)isLocallyAvailable
{
  return (int)-[PLInternalResource localAvailability](self, "localAvailability") > 0;
}

- (BOOL)isRemotelyAvailable
{
  return (int)-[PLInternalResource remoteAvailability](self, "remoteAvailability") > 0;
}

- (id)purgeIfPossibleReturningError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString **v19;
  uint64_t *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  -[PLInternalResource fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D74498];
    v35 = *MEMORY[0x1E0CB2938];
    v36 = CFSTR("Resource has no file URL (unavailable)");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v36;
    v20 = &v35;
    goto LABEL_27;
  }
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v8 = +[PLCacheDeleteSupport isPurgeableFile:outIsPhotoType:outUrgencyLevel:error:](PLCacheDeleteSupport, "isPurgeableFile:outIsPhotoType:outUrgencyLevel:error:", v7, 0, 0, &v34);
  v9 = v34;

  if (!v8)
  {
    if (v9)
    {
      if ((PLIsErrorFileNotFound() & 1) == 0)
      {
        PLResourceCachingGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          PLResourceIdentityShortDescription(self);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v22;
          v39 = 2112;
          v40 = v6;
          v41 = 2112;
          v42 = v9;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Unable check purgeable flags requesting make unavailable on resource: %{public}@ with URL: %@, error: %@", buf, 0x20u);

        }
      }
LABEL_28:
      v15 = 0;
      if (!a3)
        goto LABEL_30;
      goto LABEL_29;
    }
    PLResourceCachingGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      PLResourceIdentityShortDescription(self);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v28;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Non-derivative resource is not marked as purgeable on purgeability check, resource: %{public}@, URL: %@", buf, 0x16u);

    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D74498];
    v43 = *MEMORY[0x1E0CB2938];
    v44[0] = CFSTR("Purgeable flags not set on resource");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = (const __CFString **)v44;
    v20 = &v43;
LABEL_27:
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 47019, v29);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v9;
  v11 = objc_msgSend(v10, "removeItemAtURL:error:", v6, &v33);
  v12 = v33;

  if ((v11 & 1) != 0)
  {
    PLResourceCachingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      PLResourceIdentityShortDescription(self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v14;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Resource purged via explicit purge request: %{public}@, URL %@", buf, 0x16u);

    }
    -[PLInternalResource markAsNotLocallyAvailableAfterPurge](self, "markAsNotLocallyAvailableAfterPurge");
    v15 = 1;
  }
  else
  {
    if ((PLIsErrorFileNotFound() & 1) == 0)
    {
      PLResourceCachingGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        PLResourceIdentityShortDescription(self);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v24;
        v39 = 2112;
        v40 = v6;
        v41 = 2112;
        v42 = v12;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Unable to remove file for resource: %{public}@, URL: %@, error: %@", buf, 0x20u);

      }
    }
    if (PLIsErrorFileNotFound())
    {
      PLResourceCachingGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        PLResourceIdentityShortDescription(self);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v26;
        v39 = 2112;
        v40 = v6;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Resource was marked as locally available but file missing from disk, marking as not locally available, resource: %{public}@, URL: %@", buf, 0x16u);

      }
      -[PLInternalResource markAsNotLocallyAvailable](self, "markAsNotLocallyAvailable");
    }
    v15 = 0;
  }
  v9 = v12;
  if (a3)
LABEL_29:
    *a3 = objc_retainAutorelease(v9);
LABEL_30:
  if (v15)
    v30 = v6;
  else
    v30 = 0;
  v31 = v30;

  return v31;
}

- (BOOL)hasInvalidFileID
{
  return !-[PLInternalResource fileID](self, "fileID") || -[PLInternalResource fileID](self, "fileID") == -1;
}

- (void)makeResourceLocallyAvailableWithCompletion:(id)a3
{
  id v5;
  PLResourceLocalAvailabilityRequestOptions *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
  -[PLResourceLocalAvailabilityRequestOptions setNetworkAccessAllowed:](v6, "setNetworkAccessAllowed:", 1);
  -[PLInternalResource dataStore](self, "dataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLInternalResource.m"), 1017, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.dataStore"));

  }
  -[PLInternalResource dataStore](self, "dataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PLInternalResource_makeResourceLocallyAvailableWithCompletion___block_invoke;
  v12[3] = &unk_1E3660EE0;
  v13 = v5;
  v14 = a2;
  v12[4] = self;
  v9 = v5;
  v10 = (id)objc_msgSend(v8, "requestLocalAvailabilityChange:forResource:options:completion:", 1, self, v6, v12);

}

- (int)qualitySortValue
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  double v15;
  double v16;
  int v17;

  -[PLInternalResource asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unorientedSize");
  v5 = v4;
  v7 = v6;

  -[PLInternalResource compactUTI](self, "compactUTI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifier utiWithCompactRepresentation:conformanceHint:](PLUniformTypeIdentifier, "utiWithCompactRepresentation:conformanceHint:", v8, -[PLInternalResource utiConformanceHint](self, "utiConformanceHint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isLosslessEncoding");
  v11 = PLIsResourceMarkedFullSizeFromRecipeID(-[PLInternalResource recipeID](self, "recipeID"));
  v12 = -[PLInternalResource unorientedWidth](self, "unorientedWidth");
  v13 = -[PLInternalResource unorientedHeight](self, "unorientedHeight");
  v14 = v10 | 2;
  if (!v11)
    v14 = v10;
  v15 = sqrt((double)(v13 * v12)) / sqrt((double)((uint64_t)v7 * (uint64_t)v5));
  if (v15 >= 1.0)
    v16 = 32767.0;
  else
    v16 = v15 * 32767.0;
  v17 = v14 | ((int)v16 << 16);

  return v17;
}

- (id)photosCTLDescription
{
  void *v3;
  int v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  unsigned int v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  __CFString *v25;
  void *v26;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;

  -[PLInternalResource asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[PLInternalResource localAvailability](self, "localAvailability");
  v5 = CFSTR("NO");
  if (v4 >= 0)
    v5 = CFSTR("YES");
  v28 = v5;
  v6 = -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype");
  v7 = -[PLInternalResource orientation](self, "orientation");
  v8 = -[PLInternalResource unorientedWidth](self, "unorientedWidth");
  v9 = -[PLInternalResource unorientedHeight](self, "unorientedHeight");
  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", -[PLInternalResource recipeID](self, "recipeID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "description");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("none");
  }
  -[PLInternalResource codecFourCharCodeName](self, "codecFourCharCodeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PLInternalResource codecFourCharCodeName](self, "codecFourCharCodeName");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("none");
  }
  -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v15;
  if (v15)
  {
    objc_msgSend(v15, "identifier");
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = CFSTR("none");
  }
  -[PLInternalResource dataStoreKey](self, "dataStoreKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource assetID](self, "assetID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "descriptionForAssetID:", v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = -[PLInternalResource dataStoreClassID](self, "dataStoreClassID");
  v20 = -[PLInternalResource version](self, "version");
  if (v20 > 2)
    v21 = CFSTR("cur");
  else
    v21 = off_1E3662340[v20];
  v22 = v8;
  v23 = v19;
  v24 = (double)v22;
  v25 = v21;
  objc_msgSend(v18, "stringWithFormat:", CFSTR("asset: %@, store: %ld, subtype: %ld, version: %@, recipe: %@, uti: %@, codec: %@, orient: %d, size: (%ld, %ld), l-avail: %@, qual: %ld, key: %@"), v32, v23, v6, v25, v12, v30, v14, v7, (uint64_t)v24, (uint64_t)(double)v9, v28, -[PLInternalResource qualitySortValue](self, "qualitySortValue"), v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)photosCTLJSONDict
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLInternalResource codecFourCharCodeName](self, "codecFourCharCodeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLInternalResource codecFourCharCodeName](self, "codecFourCharCodeName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("none");
  }
  -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("none");
  }
  -[PLInternalResource objectID](self, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("objectID"));

  -[PLInternalResource asset](self, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PLInternalResource asset](self, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("asset"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("uti"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLInternalResource dataStoreClassID](self, "dataStoreClassID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("store"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("subtype"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLInternalResource version](self, "version"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLInternalResource recipeID](self, "recipeID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("recipe"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("codec"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLInternalResource orientation](self, "orientation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("orientation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLInternalResource unorientedWidth](self, "unorientedWidth"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("unorientedWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLInternalResource unorientedHeight](self, "unorientedHeight"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("unorientedHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLInternalResource localAvailability](self, "localAvailability"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("localAvailability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLInternalResource remoteAvailability](self, "remoteAvailability"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("remoteAvailability"));

  -[PLInternalResource dataStoreKey](self, "dataStoreKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource asset](self, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "assetID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "descriptionForAssetID:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("dataStoreKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLInternalResource ptpTrashedState](self, "ptpTrashedState"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("ptpTrashedState"));

  -[PLInternalResource sidecarIndex](self, "sidecarIndex");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[PLInternalResource sidecarIndex](self, "sidecarIndex");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("sidecarIndex"));

  }
  return v3;
}

- (id)singleLineDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLInternalResource asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" assetUUID: %@"), v8);

  v9 = -[PLInternalResource resourceType](self, "resourceType");
  if (v9 > 0x1F)
    v10 = CFSTR("invalid");
  else
    v10 = off_1E3662240[v9];
  v11 = v10;
  objc_msgSend(v6, "appendFormat:", CFSTR(" type: %@"), v11);

  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", -[PLInternalResource recipeID](self, "recipeID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" recipeID: %@"), v13);

  v14 = -[PLInternalResource version](self, "version");
  if (v14 > 2)
    v15 = CFSTR("cur");
  else
    v15 = off_1E3662340[v14];
  v16 = v15;
  objc_msgSend(v6, "appendFormat:", CFSTR(" ver: %@"), v16);

  -[PLInternalResource dataStore](self, "dataStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "descriptionForSubtype:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" subtype: %@"), v18);

  objc_msgSend(v6, "appendFormat:", CFSTR(" size: (%ld, %ld)"), -[PLInternalResource unorientedWidth](self, "unorientedWidth"), -[PLInternalResource unorientedHeight](self, "unorientedHeight"));
  -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" uti: %@"), v20);

  v21 = -[PLInternalResource localAvailability](self, "localAvailability");
  v22 = CFSTR("N");
  if (v21 == 1)
    v22 = CFSTR("Y");
  objc_msgSend(v6, "appendFormat:", CFSTR(" local: %@"), v22);
  -[PLInternalResource dataStoreKey](self, "dataStoreKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource asset](self, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "assetID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fileURLForAssetID:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    objc_msgSend(v6, "appendFormat:", CFSTR(" url: %@"), v26);

  return v6;
}

- (id)redactedDescription
{
  void *v2;
  void *v3;

  -[PLInternalResource objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)debugDescription
{
  PLDescriptionBuilder *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  __CFString *v13;
  unsigned int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  int v32;
  void *v33;
  void *v34;
  int v35;
  __CFString *v36;
  __CFString *v37;
  int v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  __CFString *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  char v62;
  const __CFString *v63;
  void *v64;
  char v65;
  void *v66;
  char v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;

  v3 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", self, 3, 0);
  -[PLInternalResource asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLInternalResource asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("assetUUID"), v6);

  }
  -[PLInternalResource transientCloudMaster](self, "transientCloudMaster");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLInternalResource transientCloudMaster](self, "transientCloudMaster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scopedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("cloudMasterScopedID"), v9);

  }
  -[PLInternalResource objectID](self, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("objectID"), v10);

  v11 = -[PLInternalResource resourceType](self, "resourceType");
  if (v11 > 0x1F)
    v12 = CFSTR("invalid");
  else
    v12 = off_1E3662240[v11];
  v13 = v12;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("resourceType"), v13);

  v14 = -[PLInternalResource version](self, "version");
  if (v14 > 2)
    v15 = CFSTR("cur");
  else
    v15 = off_1E3662340[v14];
  v16 = v15;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("version"), v16);

  -[PLInternalResource dataStore](self, "dataStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" (%ld)"), (int)-[PLInternalResource dataStoreClassID](self, "dataStoreClassID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("dataStore"), v19);
  v20 = -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype");
  objc_msgSend(v17, "descriptionForSubtype:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAppendingFormat:", CFSTR(" (%ld)"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("dataStoreSubtype"), v22);
  if (-[PLInternalResource recipeID](self, "recipeID"))
  {
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", -[PLInternalResource recipeID](self, "recipeID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("recipeID"), v24);

  }
  -[PLInternalResource dataStoreKey](self, "dataStoreKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[PLInternalResource dataStoreKey](self, "dataStoreKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource asset](self, "asset");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "assetID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptionForAssetID:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("dataStoreKey"), v29);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLInternalResource dataLength](self, "dataLength"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("dataLength"), v30);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLInternalResource fileID](self, "fileID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("fileID"), v31);

  LODWORD(v31) = -[PLInternalResource dataStoreClassID](self, "dataStoreClassID");
  v32 = -[PLInternalResource localAvailability](self, "localAvailability");
  if ((_DWORD)v31 == 3)
    PLSyndicationResourceLocalAvailabilityDescription(v32);
  else
    PLResourceLocalAvailabilityName(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("localAvailability"), v33);

  PLResourceLocalAvailabilityTargetName(-[PLInternalResource localAvailabilityTarget](self, "localAvailabilityTarget"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("localAvailabilityTarget"), v34);

  v35 = -[PLInternalResource remoteAvailability](self, "remoteAvailability");
  if (v35 == 1)
    v36 = CFSTR("available");
  else
    v36 = CFSTR("missing");
  if (!v35)
    v36 = CFSTR("unavailable");
  v37 = v36;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("remoteAvailability"), v37);

  v38 = -[PLInternalResource remoteAvailabilityTarget](self, "remoteAvailabilityTarget");
  if (v38 == 1)
    v39 = CFSTR("available");
  else
    v39 = CFSTR("missing");
  if (!v38)
    v39 = CFSTR("unavailable");
  v40 = v39;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("remoteAvailabilityTarget"), v40);

  -[PLDescriptionBuilder appendName:BOOLValue:](v3, "appendName:BOOLValue:", CFSTR("isDerivative"), -[PLInternalResource isDerivative](self, "isDerivative"));
  -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("unorientedWidth"), -[PLInternalResource unorientedWidth](self, "unorientedWidth"));
  -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("unorientedHeight"), -[PLInternalResource unorientedHeight](self, "unorientedHeight"));
  -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("orientation"), -[PLInternalResource orientation](self, "orientation"));
  -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("qualitySortValue"), -[PLInternalResource qualitySortValue](self, "qualitySortValue"));
  -[PLInternalResource fingerprint](self, "fingerprint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("fingerprint"), v41);

  -[PLInternalResource stableHash](self, "stableHash");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("stableHash"), v42);

  -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("uniformTypeIdentifier"), v44);

  -[PLInternalResource codecFourCharCodeName](self, "codecFourCharCodeName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("codecFourCharCodeName"), v45);

  -[PLInternalResource sidecarIndex](self, "sidecarIndex");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("sidecarIndex"), v46);

  v47 = -[PLInternalResource ptpTrashedState](self, "ptpTrashedState");
  v48 = CFSTR("trashed");
  if ((v47 & 1) == 0)
    v48 = CFSTR("untrashed");
  v49 = v48;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("ptpTrashedState"), v49);

  objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", -[PLInternalResource cplType](self, "cplType"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("cplType"), v50);

  if (-[PLInternalResource cloudLocalState](self, "cloudLocalState"))
    -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("cloudLocalState"), (int)-[PLInternalResource cloudLocalState](self, "cloudLocalState"));
  -[PLInternalResource cloudMasterDateCreated](self, "cloudMasterDateCreated");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[PLInternalResource cloudMasterDateCreated](self, "cloudMasterDateCreated");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("cloudMasterDateCreated"), v52);

  }
  -[PLInternalResource cloudLastPrefetchDate](self, "cloudLastPrefetchDate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "timeIntervalSinceReferenceDate");
  v55 = v54;

  if (v55 > 0.0)
  {
    -[PLInternalResource cloudLastPrefetchDate](self, "cloudLastPrefetchDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("cloudLastPrefetchDate"), v56);

  }
  -[PLInternalResource cloudLastOnDemandDownloadDate](self, "cloudLastOnDemandDownloadDate");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    -[PLInternalResource cloudLastOnDemandDownloadDate](self, "cloudLastOnDemandDownloadDate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("cloudLastOnDemandDownloadDate"), v58);

  }
  -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "conformsToMovie");

  if (v60)
  {
    -[PLInternalResource dataStore](self, "dataStore");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "videoResource:matchesOrExceedsQualityLevel:", self, 0);

    if ((v62 & 1) != 0)
    {
      v63 = CFSTR("high");
    }
    else
    {
      -[PLInternalResource dataStore](self, "dataStore");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "videoResource:matchesOrExceedsQualityLevel:", self, 1);

      if ((v65 & 1) != 0)
      {
        v63 = CFSTR("large");
      }
      else
      {
        -[PLInternalResource dataStore](self, "dataStore");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "videoResource:matchesOrExceedsQualityLevel:", self, 2);

        if ((v67 & 1) != 0)
        {
          v63 = CFSTR("med");
        }
        else
        {
          -[PLInternalResource dataStore](self, "dataStore");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "videoResource:matchesOrExceedsQualityLevel:", self, 3);

          if (v69)
            v63 = CFSTR("low");
          else
            v63 = CFSTR("none");
        }
      }
    }
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("video-quality-level"), v63);
  }
  if (-[PLInternalResource trashedState](self, "trashedState"))
  {
    -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("trashedState"), (int)-[PLInternalResource trashedState](self, "trashedState"));
    -[PLInternalResource trashedDate](self, "trashedDate");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("trashedDate"), v70);

  }
  -[PLDescriptionBuilder build](v3, "build");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v71;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidecarRepresentation, 0);
}

void __65__PLInternalResource_makeResourceLocallyAvailableWithCompletion___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  id v10;

  v10 = a2;
  v6 = a4;
  v7 = v6;
  if (v10)
  {
    v8 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PLInternalResource.m"), 1020, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL != nil"));

    }
    v8 = *(void (**)(void))(a1[5] + 16);
  }
  v8();

}

uint64_t __74__PLInternalResource_repairResourceValidationErrors_managedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  return PLResourceIdentityIsEqual(a2, *(void **)(a1 + 32));
}

+ (id)entityName
{
  return CFSTR("InternalResource");
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  return (id)listOfSyncedProperties_result;
}

+ (BOOL)supportsTrashedStateForResourceIdentity:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "resourceType") & 0xFFFFFFFE) == 0xA && objc_msgSend(v3, "version") == 0;

  return v4;
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 10;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("cloudDeleteAssetUUIDWithResourceType");
}

+ (id)insertResourceForAssetObjectID:(id)a3 resourceIdentity:(id)a4 inManagedObjectContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLInternalResource.m"), 589, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetObjectID"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLInternalResource.m"), 590, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a1, "insertInManagedObjectContext:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectWithID:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAsset:", v13);
  objc_msgSend(v12, "setResourceIdentity:managedObjectContext:", v10, v11);

  return v12;
}

+ (id)_obsoleteResourceRecipesWithCPLOff
{
  if (_obsoleteResourceRecipesWithCPLOff_onceToken != -1)
    dispatch_once(&_obsoleteResourceRecipesWithCPLOff_onceToken, &__block_literal_global_3690);
  return (id)_obsoleteResourceRecipesWithCPLOff_recipes;
}

+ (BOOL)deleteObsoleteResourcesInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "_obsoleteResourceRecipesWithCPLOff");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K in %@ AND %K == %d"), CFSTR("recipeID"), v9, CFSTR("dataStoreClassID"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v10);
  v20 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  PLBackendGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v11, "count");
      objc_msgSend(a1, "_obsoleteResourceRecipesWithCPLOff");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v22 = (const char *)v15;
      v23 = 2112;
      v24 = (uint64_t)v16;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Deleting obsolete resources, deleting %ld resources with the following recipe IDs: %@", buf, 0x16u);

    }
    v17 = 1;
    objc_msgSend(v6, "enumerateWithIncrementalSaveUsingObjects:shouldRefreshAfterSave:withBlock:", v11, 1, &__block_literal_global_83);
    v18 = objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v12 = 0;
      if (!a4)
        goto LABEL_12;
      goto LABEL_11;
    }
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "+[PLInternalResource deleteObsoleteResourcesInManagedObjectContext:error:]";
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "%s: Error saving resource deletes: %@", buf, 0x16u);
    }
    v12 = (id)v18;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "+[PLInternalResource deleteObsoleteResourcesInManagedObjectContext:error:]";
    v23 = 2112;
    v24 = (uint64_t)v12;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "%s: Error fetching resources: %@", buf, 0x16u);
  }

  v17 = 0;
  if (a4)
LABEL_11:
    *a4 = objc_retainAutorelease(v12);
LABEL_12:

  return v17;
}

+ (BOOL)batchResetFileIDInManagedObjectContext:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
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
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C97AB0];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(a1, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntityName:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %lld"), CFSTR("fileID"), -1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);
  objc_msgSend(v10, "setResultType:", 2);
  v21 = CFSTR("fileID");
  v22[0] = &unk_1E375D5A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToUpdate:", v12);

  v18 = 0;
  objc_msgSend(v7, "executeRequest:error:", v10, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v18;
  if (v14)
  {
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_9;
    __CPLAssetsdOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to batch reset fileID for internal resources: %@", buf, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_9;
    __CPLAssetsdOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "result");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Batch reset fileID for %@ internal resources", buf, 0xCu);

    }
  }

LABEL_9:
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

void __74__PLInternalResource_deleteObsoleteResourcesInManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  char v5;
  id v6;
  char v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v5 = -[NSObject removeItemAtURL:error:](v4, "removeItemAtURL:error:", v3, &v8);
    v6 = v8;
    if ((v5 & 1) == 0)
    {
      v7 = PLIsErrorFileNotFound();

      if ((v7 & 1) != 0)
        goto LABEL_6;
      PLBackendGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v3;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Could not delete obsolete resource at URL: %@", buf, 0xCu);
      }
    }

LABEL_6:
    objc_msgSend(v2, "deleteResource");

    goto LABEL_7;
  }
  objc_msgSend(v2, "deleteResource");
LABEL_7:

}

void __56__PLInternalResource__obsoleteResourceRecipesWithCPLOff__block_invoke()
{
  void *v0;

  v0 = (void *)_obsoleteResourceRecipesWithCPLOff_recipes;
  _obsoleteResourceRecipesWithCPLOff_recipes = (uint64_t)&unk_1E3763260;

}

void __44__PLInternalResource_listOfSyncedProperties__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("trashedDate"), CFSTR("trashedState"), 0);
  v1 = (void *)listOfSyncedProperties_result;
  listOfSyncedProperties_result = v0;

}

- (void)ensureInitialValuesForSyndication
{
  int v3;
  int v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;

  -[PLInternalResource setDataStoreClassID:](self, "setDataStoreClassID:", 3);
  v3 = -[PLInternalResource resourceType](self, "resourceType");
  v4 = -[PLInternalResource recipeID](self, "recipeID");
  v5 = 18;
  if (v4)
    v5 = 0;
  v6 = v4 == 0;
  v7 = 4 * (v4 == 65741);
  if (!v4)
    v7 = 1;
  if (v3)
    v7 = 0;
  if (v3 != 1)
    v6 = v7;
  if (v3 == 3)
    v8 = v5;
  else
    v8 = v6;
  -[PLInternalResource setDataStoreSubtype:](self, "setDataStoreSubtype:", v8);
  -[PLInternalResource setLocalAvailability:](self, "setLocalAvailability:", 4294934528);
}

- (void)setSyndicationLocalAvailabilityWithAvailable:(BOOL)a3 additionalFlags:(unsigned __int16)a4
{
  _BOOL4 v5;
  int v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = -[PLInternalResource localAvailability](self, "localAvailability");
  if (v5)
    v8 = ((unsigned __int16)v7 | a4) & 0x7FF8 | 1;
  else
    v8 = ((unsigned __int16)v7 | a4) & 0x7FFE | 0xFFFF8000;
  if (v7 != v8)
  {
    -[PLInternalResource setLocalAvailability:](self, "setLocalAvailability:", (__int16)v8);
    PLSyndicationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      PLSyndicationResourceLocalAvailabilityDescription(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "[resource] setting syndication local availability to %@", (uint8_t *)&v11, 0xCu);

    }
  }
}

- (void)setSyndicationLocalAvailabilityWithAvailable:(BOOL)a3
{
  -[PLInternalResource setSyndicationLocalAvailabilityWithAvailable:additionalFlags:](self, "setSyndicationLocalAvailabilityWithAvailable:additionalFlags:", a3, 0);
}

- (void)clearRequiresSanitizationFlag
{
  -[PLInternalResource setLocalAvailability:](self, "setLocalAvailability:", -[PLInternalResource localAvailability](self, "localAvailability") & 0xFFFFFFFDLL);
}

+ (id)predicateForSyndicationResourcesRequiringSanitization
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("dataStoreClassID"), 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("localAvailability"), 4294934530);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForSyndicationResourcesRequiringBackgroundDownload
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
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("dataStoreClassID"), 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("dataStoreSubtype"), 4, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %d"), CFSTR("localAvailability"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("cloudPrunedAt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("cloudLastPrefetchDate"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)referenceMediaFileURL
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLInternalResource dataStoreKey](self, "dataStoreKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
    -[PLInternalResource asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLForAssetID:inContext:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canRepresentAsSidecar
{
  return !-[PLInternalResource version](self, "version")
      && !-[PLInternalResource isDerivative](self, "isDerivative")
      && -[PLInternalResource resourceType](self, "resourceType") - 2 < 4;
}

- (void)updateResourceForMasterExternalCPLResource:(id)a3 inManagedObjectContext:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PLInternalResource setResourceType:](self, "setResourceType:", objc_msgSend(v9, "resourceType"));
  -[PLInternalResource setVersion:](self, "setVersion:", objc_msgSend(v9, "version"));
  -[PLInternalResource setRecipeID:](self, "setRecipeID:", objc_msgSend(v9, "recipeID"));
  -[PLInternalResource setUnorientedWidth:](self, "setUnorientedWidth:", objc_msgSend(v9, "unorientedWidth"));
  -[PLInternalResource setUnorientedHeight:](self, "setUnorientedHeight:", objc_msgSend(v9, "unorientedHeight"));
  -[PLInternalResource setDataStoreSubtype:](self, "setDataStoreSubtype:", objc_msgSend(v9, "cplType"));
  objc_msgSend(v9, "uniformTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v9, "uniformTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setUniformTypeIdentifier:](self, "setUniformTypeIdentifier:", v6);

  }
  objc_msgSend(v9, "codecFourCharCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v9, "codecFourCharCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setCodecFourCharCodeName:](self, "setCodecFourCharCodeName:", v8);

  }
  -[PLInternalResource setRemoteAvailability:](self, "setRemoteAvailability:", objc_msgSend(v9, "remoteAvailability"));
  -[PLInternalResource setDataLength:](self, "setDataLength:", objc_msgSend(v9, "dataLength"));
  -[PLInternalResource setCloudAttributesWithExternalResource:](self, "setCloudAttributesWithExternalResource:", v9);

}

- (void)setCloudAttributesWithExternalResource:(id)a3
{
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
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "cloudLocalState"))
    -[PLInternalResource setCloudLocalState:](self, "setCloudLocalState:", objc_msgSend(v16, "cloudLocalState"));
  objc_msgSend(v16, "masterDateCreated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v16, "masterDateCreated");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setCloudMasterDateCreated:](self, "setCloudMasterDateCreated:", v5);

  }
  if ((int)objc_msgSend(v16, "prefetchCount") >= 1)
    -[PLInternalResource setCloudPrefetchCount:](self, "setCloudPrefetchCount:", objc_msgSend(v16, "prefetchCount"));
  objc_msgSend(v16, "prunedAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v16, "prunedAt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setCloudPrunedAt:](self, "setCloudPrunedAt:", v7);

  }
  objc_msgSend(v16, "lastOnDemandDownloadDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v16, "lastOnDemandDownloadDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setCloudLastOnDemandDownloadDate:](self, "setCloudLastOnDemandDownloadDate:", v9);

  }
  objc_msgSend(v16, "lastPrefetchDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v16, "lastPrefetchDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setCloudLastPrefetchDate:](self, "setCloudLastPrefetchDate:", v11);

  }
  if (objc_msgSend(v16, "sourceCplType"))
    -[PLInternalResource setCloudSourceType:](self, "setCloudSourceType:", objc_msgSend(v16, "sourceCplType"));
  objc_msgSend(v16, "fingerprint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v16, "fingerprint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setFingerprint:](self, "setFingerprint:", v13);

  }
  objc_msgSend(v16, "stableHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v16, "stableHash");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLInternalResource setStableHash:](self, "setStableHash:", v15);

  }
}

- (unint64_t)cplType
{
  if (-[PLInternalResource dataStoreClassID](self, "dataStoreClassID"))
    return 0;
  else
    return -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype");
}

- (BOOL)isCPLResource
{
  return -[PLInternalResource cplType](self, "cplType") != 0;
}

- (BOOL)isCPLMasterResource
{
  return !-[PLInternalResource version](self, "version")
      && -[PLInternalResource isCPLResource](self, "isCPLResource");
}

- (BOOL)isCPLAssetResource
{
  _BOOL4 v3;

  v3 = -[PLInternalResource isAdjustedResource](self, "isAdjustedResource");
  if (v3)
    LOBYTE(v3) = -[PLInternalResource isCPLResource](self, "isCPLResource");
  return v3;
}

- (BOOL)isCPLJPEGThumbnail
{
  return -[PLInternalResource cplType](self, "cplType") == 5;
}

- (BOOL)isCPLOriginalResource
{
  return -[PLInternalResource isCPLOriginalResourceAssetHasAdjustments:](self, "isCPLOriginalResourceAssetHasAdjustments:", 1);
}

- (BOOL)isCPLOriginalResourceAssetHasAdjustments:(BOOL)a3
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v7;
  char v8;
  void *v9;
  void *v10;
  BOOL result;

  v5 = a3;
  v7 = -[PLInternalResource isCPLMasterResource](self, "isCPLMasterResource");
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "originalCPLResourceTypesForMaster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLInternalResource cplType](self, "cplType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "containsObject:", v4) & 1) != 0)
    {
      v8 = 1;
      goto LABEL_9;
    }
  }
  if (!v5 || !-[PLInternalResource isCPLAssetResource](self, "isCPLAssetResource"))
  {
    v8 = 0;
    result = 0;
    if (!v7)
      return result;
    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "originalCPLResourceTypesForAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLInternalResource cplType](self, "cplType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "containsObject:", v10);

  result = v8;
  if (v7)
  {
LABEL_9:

    return v8;
  }
  return result;
}

- (id)expungeableResourceStateRepresentation
{
  id v3;
  void *v4;

  if (-[PLInternalResource supportsTrashedState](self, "supportsTrashedState"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D11378]);
    objc_msgSend(v3, "setResourceType:", -[PLInternalResource cplType](self, "cplType"));
    objc_msgSend(v3, "setExpungedState:", +[PLInternalResource cplExpungedStateForTrashedState:](PLInternalResource, "cplExpungedStateForTrashedState:", -[PLInternalResource trashedState](self, "trashedState")));
    -[PLInternalResource trashedDate](self, "trashedDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExpungedDate:", v4);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)cplResourceForTimeRange:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  void *v11;
  _OWORD v13[3];

  -[PLManagedObject pathManager](self, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource fingerprint](self, "fingerprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v9;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v5, "URLForPartialVideoWithResourceFingerprint:assetUUID:timeRange:", v6, v8, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLInternalResource cplResourceForFileURL:createDirectoryIfNeeded:](self, "cplResourceForFileURL:createDirectoryIfNeeded:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)cplResourceIncludeFile:(BOOL)a3
{
  return -[PLInternalResource cplResourceIncludeFile:createDirectoryIfNeeded:](self, "cplResourceIncludeFile:createDirectoryIfNeeded:", a3, 1);
}

- (id)cplResourceIncludeFile:(BOOL)a3 createDirectoryIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  if (a3)
  {
    -[PLInternalResource cplFileURL](self, "cplFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[PLInternalResource cplResourceForFileURL:createDirectoryIfNeeded:](self, "cplResourceForFileURL:createDirectoryIfNeeded:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cplResourceForFileURL:(id)a3 createDirectoryIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[PLInternalResource isCPLResource](self, "isCPLResource"))
    goto LABEL_17;
  -[PLInternalResource fingerprint](self, "fingerprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[PLInternalResource singleLineDescription](self, "singleLineDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v22;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Resource %@ has no fingerprint", buf, 0xCu);

      }
      v21 = 0;
      goto LABEL_16;
    }
LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  if (v6 && v4)
  {
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v11 = objc_msgSend(v10, "createDirectoryIfNeededAtPath:error:", v9, &v24);
    v12 = v24;

    if ((v11 & 1) == 0 && !*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[PLInternalResource singleLineDescription](self, "singleLineDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v14;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Unable to create directory for resource %@: %@.", buf, 0x16u);

      }
    }

  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D11448]), "initWithFileURL:", v6);
  -[NSObject setFileSize:](v15, "setFileSize:", -[PLInternalResource dataLength](self, "dataLength"));
  -[NSObject setImageDimensions:](v15, "setImageDimensions:", (double)-[PLInternalResource unorientedWidth](self, "unorientedWidth"), (double)-[PLInternalResource unorientedHeight](self, "unorientedHeight"));
  -[NSObject setAvailable:](v15, "setAvailable:", -[PLInternalResource remoteAvailability](self, "remoteAvailability") == 1);
  -[PLInternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setFileUTI:](v15, "setFileUTI:", v17);

  -[PLInternalResource fingerprint](self, "fingerprint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setFingerPrint:](v15, "setFingerPrint:", v18);

  -[PLInternalResource stableHash](self, "stableHash");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setStableHash:](v15, "setStableHash:", v19);

  -[PLInternalResource scopedIdentifier](self, "scopedIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11440]), "initWithResourceIdentity:itemScopedIdentifier:resourceType:", v15, v20, -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"));

LABEL_16:
LABEL_18:

  return v21;
}

- (void)transitional_reconsiderLocalAvailabilityBasedOnExistingLocationOfCPLResourceAtFilePath:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!-[PLInternalResource dataStoreClassID](self, "dataStoreClassID"))
  {
    -[PLInternalResource asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = -[PLInternalResource localAvailability](self, "localAvailability");
      -[PLInternalResource dataStoreKey](self, "dataStoreKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLInternalResource dataStore](self, "dataStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transitional_reconsiderLocalAvailabilityBasedOnExistingLocationOfCPLResource:givenFilePath:", self, v10);
      v8 = -[PLInternalResource localAvailability](self, "localAvailability");
      if ((v5 & 0x80000000) != 0)
      {
        if (v8 < 0)
          goto LABEL_9;
      }
      else if ((v8 & 0x80000000) == 0)
      {
        goto LABEL_8;
      }
      -[PLInternalResource asset](self, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recalculateImageRequestHintsForResource:afterLocalAvailabilityChangeFrom:previousDataStoreKey:", self, v5, v6);

LABEL_8:
      if ((int)v5 > 0)
      {
LABEL_11:

        goto LABEL_12;
      }
LABEL_9:
      if (-[PLInternalResource isLocallyAvailable](self, "isLocallyAvailable"))
        -[PLInternalResource persistTrashedStateToFilesystem](self, "persistTrashedStateToFilesystem");
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (id)cplFileURL
{
  void *v3;
  void *v4;
  void *v5;

  -[PLInternalResource fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[PLInternalResource isCPLResource](self, "isCPLResource"))
    {
      -[PLInternalResource asset](self, "asset");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pathForCPLResourceType:adjusted:", -[PLInternalResource dataStoreSubtype](self, "dataStoreSubtype"), -[PLInternalResource isAdjustedResource](self, "isAdjustedResource"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)resetPrefetchState
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  if (-[PLInternalResource cloudPrefetchCount](self, "cloudPrefetchCount"))
    -[PLInternalResource setCloudPrefetchCount:](self, "setCloudPrefetchCount:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource cloudLastPrefetchDate](self, "cloudLastPrefetchDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToDate:", v6);

  if ((v4 & 1) == 0)
    -[PLInternalResource setCloudLastPrefetchDate:](self, "setCloudLastPrefetchDate:", v6);
  -[PLInternalResource cloudPrunedAt](self, "cloudPrunedAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PLInternalResource setCloudPrunedAt:](self, "setCloudPrunedAt:", 0);

}

- (BOOL)copyPurgeabilityFromFileURL:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  _BYTE *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  _BYTE v19[18];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = -1;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PLCacheDeleteSupport isPurgeableFile:outIsPhotoType:outUrgencyLevel:error:](PLCacheDeleteSupport, "isPurgeableFile:outIsPhotoType:outUrgencyLevel:error:", v5, 0, &v17, 0);

  v7 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v19 = v6;
      *(_WORD *)&v19[4] = 2112;
      *(_QWORD *)&v19[6] = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "source file purgeable:%d at %@", buf, 0x12u);

    }
  }
  if (v6)
  {
    v16 = 0;
    -[PLInternalResource cplFileURL](self, "cplFileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[PLCacheDeleteSupport markPurgeableForFileAtURL:withUrgency:outInode:](PLCacheDeleteSupport, "markPurgeableForFileAtURL:withUrgency:outInode:", v10, v17, &v16);

    if (v11)
    {
      -[PLInternalResource setFileID:](self, "setFileID:", v16);
      if (!*v7)
      {
        __CPLAssetsdOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          -[PLInternalResource fileURL](self, "fileURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v19 = v14;
          *(_WORD *)&v19[8] = 2048;
          *(_QWORD *)&v19[10] = v16;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "updated purgeable file at %@ to inode %lld", buf, 0x16u);

        }
      }
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (void)setDataLength:(int64_t)a3
{
  if (a3)
    -[PLInternalResource managedObjectOriginal_setDataLength:](self, "managedObjectOriginal_setDataLength:");
}

- (id)scopedIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PLInternalResource asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLInternalResource isCPLMasterResource](self, "isCPLMasterResource"))
  {
    objc_msgSend(v3, "master");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v3)
  {
    objc_msgSend(v3, "scopedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)insertResourceForMasterObjectID:(id)a3 withExternalCPLResource:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "insertInManagedObjectContext:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectWithID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "updateResourceForMasterExternalCPLResource:inManagedObjectContext:", v9, v8);
  objc_msgSend(v11, "setDataStoreClassID:", 0);
  objc_msgSend(v11, "setTransientCloudMaster:", v12);

  return v11;
}

+ (BOOL)isCPLJPEGThumbnailResource:(id)a3
{
  return objc_msgSend(a3, "cplType") == 5;
}

+ (id)originalCPLResourceTypesForMaster
{
  if (originalCPLResourceTypesForMaster_onceToken != -1)
    dispatch_once(&originalCPLResourceTypesForMaster_onceToken, &__block_literal_global_55377);
  return (id)originalCPLResourceTypesForMaster_resourceTypes;
}

+ (id)originalCPLResourceTypesForAsset
{
  if (originalCPLResourceTypesForAsset_onceToken != -1)
    dispatch_once(&originalCPLResourceTypesForAsset_onceToken, &__block_literal_global_24_55368);
  return (id)originalCPLResourceTypesForAsset_resourceTypes;
}

+ (id)originalCPLResourceTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PLInternalResource_CPL__originalCPLResourceTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (originalCPLResourceTypes_onceToken != -1)
    dispatch_once(&originalCPLResourceTypes_onceToken, block);
  return (id)originalCPLResourceTypes_resourceTypes;
}

+ (id)nonOriginalCPLResourceTypes
{
  if (nonOriginalCPLResourceTypes_onceToken != -1)
    dispatch_once(&nonOriginalCPLResourceTypes_onceToken, &__block_literal_global_36);
  return (id)nonOriginalCPLResourceTypes_resourceTypes;
}

+ (unint64_t)cplExpungedStateForTrashedState:(signed __int16)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (signed)plTrashedStateForCPLExpungedState:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (void)resetCloudResourcesStateForCloudInManagedObjectContext:(id)a3 hardReset:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  __CFString *v30;
  NSObject *v31;
  __CFString *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  __CFString *v42;
  __CFString *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  __CFString *v49;
  id v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[8];
  _QWORD v54[8];
  uint8_t buf[4];
  const __CFString *v56;
  uint64_t v57;

  v4 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x19AEC1554]();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("soft");
      if (v4)
        v9 = CFSTR("hard");
      *(_DWORD *)buf = 138412290;
      v56 = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Resetting (%@) all cpl resources", buf, 0xCu);
    }

  }
  v47 = v7;
  if (v4)
  {
    v10 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(a1, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K != %d AND %K <= %d AND %K == nil AND %K == %d"), CFSTR("dataStoreClassID"), 0, CFSTR("dataStoreSubtype"), 0, CFSTR("localAvailability"), 0xFFFFFFFFLL, CFSTR("fileSystemBookmark"), CFSTR("cloudLocalState"), 3);
    v44 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:");
    v45 = v12;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v12);
    objc_msgSend(v13, "setResultType:", 2);
    v50 = 0;
    v46 = v6;
    objc_msgSend(v6, "executeRequest:error:", v13, &v50);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = (__CFString *)v50;
    if (v15)
    {
      if (*MEMORY[0x1E0D115D0])
        goto LABEL_20;
      __CPLAssetsdOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v15;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to batch delete non-local Resources: Error: %@", buf, 0xCu);
      }
    }
    else
    {
      if (*MEMORY[0x1E0D115D0])
        goto LABEL_20;
      __CPLAssetsdOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[__CFString result](v14, "result");
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v32;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Batch deleted %@ non-local Resources", buf, 0xCu);

      }
    }

LABEL_20:
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K != %d"), CFSTR("dataStoreClassID"), 0, CFSTR("dataStoreSubtype"), 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc(MEMORY[0x1E0C97AB0]);
    objc_msgSend(a1, "entityName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithEntityName:", v34);

    objc_msgSend(v35, "setResultType:", 2);
    objc_msgSend(v35, "setPredicate:", v31);
    v53[0] = CFSTR("remoteAvailability");
    v53[1] = CFSTR("cloudLocalState");
    v54[0] = &unk_1E375F6C0;
    v54[1] = &unk_1E375F6C0;
    v53[2] = CFSTR("cloudPrefetchCount");
    v53[3] = CFSTR("cloudLastPrefetchDate");
    v54[2] = &unk_1E375F6D8;
    v54[3] = v29;
    v53[4] = CFSTR("cloudMasterDateCreated");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v54[4] = v36;
    v53[5] = CFSTR("cloudPrunedAt");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v54[5] = v37;
    v53[6] = CFSTR("cloudLastOnDemandDownloadDate");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v53[7] = CFSTR("cloudSourceType");
    v54[6] = v38;
    v54[7] = &unk_1E375F6F0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPropertiesToUpdate:", v39);

    v49 = v15;
    objc_msgSend(v46, "executeRequest:error:", v35, &v49);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v49;

    if (v22)
    {
      v26 = (void *)v44;
      v21 = v45;
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v22;
          _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "Failed to batch update cpl resources: Error: %@", buf, 0xCu);
        }
LABEL_31:

      }
    }
    else
    {
      v26 = (void *)v44;
      v21 = v45;
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v40, "result");
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v43;
          _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEFAULT, "Batch updated %@ cpl resources", buf, 0xCu);

          v22 = 0;
        }
        goto LABEL_31;
      }
    }

    v23 = v46;
LABEL_33:

    v7 = v47;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0C99E08]);
  v51[0] = CFSTR("cloudPrefetchCount");
  v51[1] = CFSTR("cloudLastPrefetchDate");
  v52[0] = &unk_1E375F6D8;
  v52[1] = v17;
  v51[2] = CFSTR("cloudPrunedAt");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithDictionary:", v20);

  v22 = (__CFString *)v17;
  v23 = v6;

  v24 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "predicateWithFormat:", CFSTR("%K == %d AND %K != %d AND (%K != 0 OR %K != %@ OR %K != %@)"), CFSTR("dataStoreClassID"), 0, CFSTR("dataStoreSubtype"), 0, CFSTR("cloudPrefetchCount"), CFSTR("cloudLastPrefetchDate"), v22, CFSTR("cloudPrunedAt"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v27, "initWithEntityName:", v28);

  objc_msgSend(v13, "setResultType:", 2);
  objc_msgSend(v13, "setPredicate:", v26);
  objc_msgSend(v13, "setPropertiesToUpdate:", v21);
  v48 = 0;
  objc_msgSend(v6, "executeRequest:error:", v13, &v48);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (__CFString *)v48;
  if (!v30)
  {
    if (*MEMORY[0x1E0D115D0])
    {
      v14 = 0;
      goto LABEL_34;
    }
    __CPLAssetsdOSLogDomain();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v29, "result");
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v42;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Batch updated %@ cpl attributes", buf, 0xCu);

    }
    v14 = 0;
    goto LABEL_33;
  }
  v14 = v30;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v14;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Failed to batch update cpl attributes: Error: %@", buf, 0xCu);
    }
    goto LABEL_33;
  }
LABEL_34:

  objc_autoreleasePoolPop(v7);
}

+ (void)resetPrefetchStateForResourcesWithVersion:(unsigned int)a3 cplType:(unint64_t)a4 assetUuids:(id)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  unsigned int v19;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__PLInternalResource_CPL__resetPrefetchStateForResourcesWithVersion_cplType_assetUuids_inLibrary___block_invoke;
  v14[3] = &unk_1E366CA88;
  v17 = a1;
  v18 = a4;
  v19 = a3;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  objc_msgSend(v12, "performTransactionAndWait:", v14);

}

+ (unint64_t)bytesForAllResourcesInLibrary:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  SEL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PLInternalResource_CPL__bytesForAllResourcesInLibrary___block_invoke;
  v9[3] = &unk_1E3675558;
  v12 = a1;
  v6 = v5;
  v10 = v6;
  v11 = &v14;
  v13 = a2;
  objc_msgSend(v6, "performTransactionAndWait:", v9);
  v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

+ (unint64_t)bytesNeededToDownloadOriginalResourcesInLibrary:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PLInternalResource_CPL__bytesNeededToDownloadOriginalResourcesInLibrary___block_invoke;
  v8[3] = &unk_1E3675800;
  v11 = a1;
  v5 = v4;
  v9 = v5;
  v10 = &v12;
  objc_msgSend(v5, "performTransactionAndWait:", v8);
  v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

+ (id)predicateForAllOriginalResourcesLocallyAvailable
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "originalCPLResourceTypesForMaster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("(SUBQUERY(modernResources, $r, $r.dataStoreClassID == %d AND ($r.dataStoreSubtype IN %@) AND $r.localAvailability == %d AND $r.version == %d).@count == 0)"), 0, v3, 0xFFFFFFFFLL, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForAllFullSizeResourcesLocallyAvailable
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "originalCPLResourceTypesForAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("(SUBQUERY(modernResources, $r, $r.dataStoreClassID == %d AND ($r.dataStoreSubtype IN %@) AND $r.localAvailability == %d AND ($r.version == %d OR $r.version == %d)).@count == 0)"), 0, v3, 0xFFFFFFFFLL, 2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)prefetchResourcePredicateForCPLResourceType:(unint64_t)a3 isAssetResource:(BOOL)a4 maxRetry:(unint64_t)a5 excludeDynamicResources:(BOOL)a6 additionalResourcePredicates:(id)a7
{
  _BOOL4 v7;
  id v11;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v7 = a6;
  v33[2] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", -86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dataStoreClassID == %d AND dataStoreSubtype == %d AND localAvailability == %d AND remoteAvailability == %d AND cloudPrefetchCount <= %d AND cloudLastPrefetchDate <= %@ AND fingerprint != NULL"), 0, a3, 0xFFFFFFFFLL, 1, a5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(version == %d OR version == %d)"), 2, 1);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("version == %d"), 0, v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3528];
  v33[0] = v14;
  v33[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v19 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0D11440], "predicateMatchingDynamicFingerprintForKey:", CFSTR("fingerprint"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "notPredicateWithSubpredicate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3528];
    v32[0] = v18;
    v32[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v24;
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3528];
    v31[0] = v18;
    v31[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "andPredicateWithSubpredicates:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v28;
  }

  return v18;
}

+ (id)predicateForImageResourcePixelsLessOrEqual:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C8A2C8];
  v11[0] = v4;
  v11[1] = v5;
  v6 = *MEMORY[0x1E0C8A2A0];
  v11[2] = *MEMORY[0x1E0C8A2D0];
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifierIntegratedLookup compactRepresentationsForIdentifiers:](PLUniformTypeIdentifierIntegratedLookup, "compactRepresentationsForIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("unorientedWidth * unorientedHeight <= %d AND compactUTI IN %@"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForResourceCreatedAfterDate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudMasterDateCreated >= %@"), a3);
}

+ (id)predicateForMaxFilesize:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dataLength <= %llu"), a3);
}

+ (id)predicateForResourceIsNotLocallyAvailableWithCPLResourceType:(unint64_t)a3 version:(unsigned int)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(SUBQUERY(asset.modernResources, $r, $r.dataStoreClassID == %d AND ($r.dataStoreSubtype == %lu) AND $r.localAvailability == %d AND $r.version == %d).@count == 0)"), 0, a3, 1, *(_QWORD *)&a4);
}

+ (id)prunePredicateForCPLResourceTypes:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dataStoreClassID == %d AND dataStoreSubtype IN %@ AND localAvailability > %d AND remoteAvailability >= %d AND (noindex:(cloudLocalState) == %d OR noindex:(cloudLocalState) == %d) AND dataStoreKeyData != NULL AND fingerprint != NULL"), 0, a3, 0xFFFFFFFFLL, 1, 1, 3);
}

+ (id)predicateForOriginalsToDownload
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K == %ul AND %K <= %d AND %K >= %d AND %K == %d"), CFSTR("dataStoreClassID"), 0, CFSTR("dataStoreSubtype"), 1, CFSTR("localAvailability"), 0xFFFFFFFFLL, CFSTR("remoteAvailability"), 1, CFSTR("asset.trashedState"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:keyPathPrefix:", objc_msgSend(MEMORY[0x1E0D73310], "maskForMomentSharedAsset"), 1, CFSTR("asset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForAvailableResources
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dataStoreClassID == %d AND dataStoreSubtype != %d AND localAvailability == %d AND remoteAvailability == %d"), 0, 0, 1, 1);
}

+ (id)predicateForPurgeableOriginalResources
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "originalCPLResourceTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("dataStoreClassID == %d AND dataStoreSubtype IN %@ AND localAvailability == %d AND remoteAvailability == %d"), 0, v3, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)purgeablePushedPredicateForCPLResourceTypes:(id)a3 urgency:(int64_t)a4
{
  void *v5;
  id v6;
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
  _QWORD v19[2];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K > %@ AND %K >= %@ AND fingerprint != NULL"), CFSTR("localAvailability"), &unk_1E375F708, CFSTR("remoteAvailability"), &unk_1E375F720);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K in %@"), CFSTR("dataStoreClassID"), 0, CFSTR("dataStoreSubtype"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v9 = (void *)MEMORY[0x1E0CB3528];
    v19[0] = v7;
    v19[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingTimeInterval:", -86400.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateByAddingTimeInterval:", -259200.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated <= %@ AND cloudLastOnDemandDownloadDate <= %@"), v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3528];
    v20[0] = v7;
    v20[1] = v8;
    v20[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (void)triggerBackgroundDownloadFailureForResources:(id)a3 cloudPhotoLibraryManager:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    v11 = (_BYTE *)MEMORY[0x1E0D115D0];
    *(_QWORD *)&v8 = 138412290;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (!*v11)
        {
          __CPLAssetsdOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "singleLineDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v23 = v15;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Triggering failure for resource %@ download, detecting change/delete", buf, 0xCu);

          }
        }
        objc_msgSend(v13, "cplResourceIncludeFile:", 0, v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "libraryManager:backgroundDownloadDidFailForResource:", 0, v16);

      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }

}

void __75__PLInternalResource_CPL__bytesNeededToDownloadOriginalResourcesInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 48), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dataStoreClassID == %d AND dataStoreSubtype == %d AND localAvailability <= %d"), 0, 1, 0xFFFFFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  if (v7)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (!v10)
      goto LABEL_20;
    v11 = v10;
    v20 = v8;
    v21 = v6;
    v22 = v5;
    v12 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x19AEC1554]();
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v14, "dataLength");
        objc_msgSend(v14, "asset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "hasAdjustments"))
        {
          if ((objc_msgSend(v16, "isPhoto") & 1) != 0)
          {
            v17 = 2;
          }
          else
          {
            if ((objc_msgSend(v16, "isDefaultAdjustedSlomo") & 1) != 0)
              goto LABEL_14;
            v17 = 16;
          }
          objc_msgSend(v16, "assetResourceForCPLType:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = v18;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v18, "dataLength");

          }
        }
LABEL_14:

        objc_autoreleasePoolPop(v15);
      }
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (!v11)
      {
        v6 = v21;
        v5 = v22;
        v8 = v20;
        goto LABEL_20;
      }
    }
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error fetching Cloud Resources for non-local original size estimate: %@", buf, 0xCu);
    }
LABEL_20:

  }
}

void __57__PLInternalResource_CPL__bytesForAllResourcesInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 48), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dataStoreClassID == %d"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v6, "setName:", CFSTR("totalResourceSize"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("@sum.dataLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpression:", v7);

  objc_msgSend(v6, "setExpressionResultType:", 300);
  v31[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v8);

  objc_msgSend(v4, "setResultType:", 2);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v4, &v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v25;
  if (v10)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v10;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v13)
    {
      v14 = v13;
      v19 = v9;
      v20 = v5;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("totalResourceSize"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v17, "longLongValue");

        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      }
      while (v14);
      v9 = v19;
      v5 = v20;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v18;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "%@ failed to calculate totalResourceSize %@", buf, 0x16u);

    }
    goto LABEL_13;
  }
LABEL_14:

}

void __98__PLInternalResource_CPL__resetPrefetchStateForResourcesWithVersion_cplType_assetUuids_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 48), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(dataStoreClassID) == %d AND noindex:(version) == %d AND noindex:(dataStoreSubtype) == %d AND asset.uuid IN %@"), 0, *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;
  if (v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v19 = v8;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v14, "resetPrefetchState");
          objc_autoreleasePoolPop(v15);
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
      v8 = v19;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_DWORD *)(a1 + 64);
      v18 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      v27 = v16;
      v28 = 1024;
      v29 = v17;
      v30 = 2048;
      v31 = v18;
      v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error fetching Cloud Resources for %@-%d-%ld: %@", buf, 0x26u);
    }
    goto LABEL_13;
  }
LABEL_14:

}

uint64_t __54__PLInternalResource_CPL__nonOriginalCPLResourceTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nonOriginalCPLResourceTypes_resourceTypes;
  nonOriginalCPLResourceTypes_resourceTypes = v0;

  return objc_msgSend(MEMORY[0x1E0D11440], "enumerateResourceTypesWithBlock:", &__block_literal_global_39_55366);
}

void __54__PLInternalResource_CPL__nonOriginalCPLResourceTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  +[PLInternalResource originalCPLResourceTypes](PLInternalResource, "originalCPLResourceTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)nonOriginalCPLResourceTypes_resourceTypes;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __51__PLInternalResource_CPL__originalCPLResourceTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "originalCPLResourceTypesForMaster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend(*(id *)(a1 + 32), "originalCPLResourceTypesForAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  v5 = (void *)originalCPLResourceTypes_resourceTypes;
  originalCPLResourceTypes_resourceTypes = (uint64_t)v2;

}

void __59__PLInternalResource_CPL__originalCPLResourceTypesForAsset__block_invoke()
{
  void *v0;

  v0 = (void *)originalCPLResourceTypesForAsset_resourceTypes;
  originalCPLResourceTypesForAsset_resourceTypes = (uint64_t)&unk_1E3763CC8;

}

void __60__PLInternalResource_CPL__originalCPLResourceTypesForMaster__block_invoke()
{
  void *v0;

  v0 = (void *)originalCPLResourceTypesForMaster_resourceTypes;
  originalCPLResourceTypesForMaster_resourceTypes = (uint64_t)&unk_1E3763CB0;

}

- (BOOL)isValidForJournalPersistence
{
  return +[PLAssetJournalEntryPayloadResource isValidForPersistenceWithRecipeID:](PLAssetJournalEntryPayloadResource, "isValidForPersistenceWithRecipeID:", -[PLInternalResource recipeID](self, "recipeID"));
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;

  -[PLInternalResource asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  PLAssetJournalEntryPayload *v6;

  v4 = a3;
  if (-[PLInternalResource isValidForJournalPersistence](self, "isValidForJournalPersistence"))
  {
    -[PLInternalResource asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isValidForJournalPersistence"))
      v6 = -[PLAssetJournalEntryPayload initWithInternalResource:filesystemBookmark:changedKeys:]([PLAssetJournalEntryPayload alloc], "initWithInternalResource:filesystemBookmark:changedKeys:", self, 0, v4);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)resourceForManagedAsset:(id)a3 sharedStreamsType:(unsigned int)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  uint64_t v7;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = *(_QWORD *)&a4;
  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = a5;
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K == %@ AND %K == %d"), CFSTR("asset"), a3, CFSTR("dataStoreSubtype"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v11);
  objc_msgSend(v10, "executeFetchRequest:error:", v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end

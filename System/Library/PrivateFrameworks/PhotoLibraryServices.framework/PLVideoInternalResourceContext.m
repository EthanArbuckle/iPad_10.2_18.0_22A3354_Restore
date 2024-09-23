@implementation PLVideoInternalResourceContext

- (PLVideoInternalResourceContext)initWithManagedObjectContext:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  PLVideoInternalResourceContext *v9;
  PLVideoInternalResourceContext *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLVideoInternalResourceContext;
  v9 = -[PLVideoInternalResourceContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_moc, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
    objc_msgSend(v8, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isWalrusEnabled = objc_msgSend(v11, "isWalrusEnabled");

  }
  return v10;
}

- (id)backingResourceForVideoResource:(id)a3
{
  return (id)objc_msgSend(a3, "backingResource");
}

- (id)uuid
{
  return (id)-[PLManagedAsset uuid](self->_asset, "uuid");
}

- (BOOL)hasAdjustments
{
  return -[PLManagedAsset hasAdjustments](self->_asset, "hasAdjustments");
}

- (BOOL)isPhotoIris
{
  return -[PLManagedAsset kindSubtype](self->_asset, "kindSubtype") == 2;
}

- (BOOL)shouldUseNonAdjustedVersion
{
  return -[PLManagedAsset shouldUseNonAdjustedVideo](self->_asset, "shouldUseNonAdjustedVideo");
}

- (BOOL)isOriginalSlomo
{
  return -[PLManagedAsset highFrameRateState](self->_asset, "highFrameRateState") & 1;
}

- (double)sizeThresholdForHighQuality
{
  return 1600.0;
}

- (id)videoResourcesMatchingVersions:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL8 isWalrusEnabled;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  BOOL v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  PLVideoInternalResource *v22;
  void *v23;
  NSObject *v24;
  PLVideoInternalResource *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  PLVideoInternalResource *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("utiConformanceHint == %d AND resourceType IN %@"), 3, &unk_1E3763EC0);
  v5 = objc_claimAutoreleasedReturnValue();
  isWalrusEnabled = self->_isWalrusEnabled;
  -[PLManagedAsset objectID](self->_asset, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAsset managedObjectContext](self->_asset, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v5;
  v31 = v4;
  +[PLManagedAsset fetchResourcesForAssetWithObjectID:inContext:versions:includeVirtualResources:allowDerivatives:excludeDynamicCPLResources:additionalPredicate:relationshipKeyPathsForPrefetching:error:](PLManagedAsset, "fetchResourcesForAssetWithObjectID:inContext:versions:includeVirtualResources:allowDerivatives:excludeDynamicCPLResources:additionalPredicate:relationshipKeyPathsForPrefetching:error:", v7, v8, v4, 1, 1, isWalrusEnabled, v5, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (!objc_msgSend(v16, "isVirtual"))
        {
          v24 = v16;
          goto LABEL_17;
        }
        v17 = objc_msgSend(v16, "recipeID");
        v18 = v17 == 65938 || v17 == 131272;
        if (v18 || v17 == 0x20000)
        {
          v19 = -[PLManagedAsset hasAdjustments](self->_asset, "hasAdjustments");
          PLImageManagerGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              PLResourceRecipeIDDescription(objc_msgSend(v16, "recipeID"), 0);
              v22 = (PLVideoInternalResource *)objc_claimAutoreleasedReturnValue();
              -[PLManagedAsset uuid](self->_asset, "uuid");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v37 = v22;
              v38 = 2114;
              v39 = v23;
              _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "[RM] installing full size render %{public}@ video resource because a persisted resource was not found for adjusted asset: %{public}@", buf, 0x16u);

            }
            +[PLResourceInstaller onDemand_installResourceWithResourceIdentity:forAsset:](PLResourceInstaller, "onDemand_installResourceWithResourceIdentity:forAsset:", v16, self->_asset);
            v24 = objc_claimAutoreleasedReturnValue();
LABEL_17:
            v21 = v24;
            if (!v24)
              continue;
            v25 = -[PLVideoInternalResource initWithBackingResource:]([PLVideoInternalResource alloc], "initWithBackingResource:", v24);
            objc_msgSend(v10, "addObject:", v25);
            goto LABEL_24;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            PLResourceRecipeIDDescription(objc_msgSend(v16, "recipeID"), 0);
            v25 = (PLVideoInternalResource *)objc_claimAutoreleasedReturnValue();
            -[PLManagedAsset uuid](self->_asset, "uuid");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v25;
            v38 = 2114;
            v39 = v26;
            v27 = v21;
            v28 = "[RM] found virtual full size render %{public}@ video resource on unadjusted asset: %{public}@";
            goto LABEL_23;
          }
        }
        else
        {
          PLImageManagerGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            PLResourceRecipeIDDescription(objc_msgSend(v16, "recipeID"), 0);
            v25 = (PLVideoInternalResource *)objc_claimAutoreleasedReturnValue();
            -[PLManagedAsset uuid](self->_asset, "uuid");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v25;
            v38 = 2114;
            v39 = v26;
            v27 = v21;
            v28 = "[RM] invalid virtual %{public}@ video resource found on asset: %{public}@";
LABEL_23:
            _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);

LABEL_24:
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v13);
  }

  return v10;
}

- (id)onDemandInstallAdjustedFullSizeVideoComplementResourceIfPresent
{
  void *v2;
  PLVideoInternalResource *v3;

  +[PLResourceInstaller onDemand_installAdjustedFullSizeVideoComplementResourceIfPresentForAsset:](PLResourceInstaller, "onDemand_installAdjustedFullSizeVideoComplementResourceIfPresentForAsset:", self->_asset);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[PLVideoInternalResource initWithBackingResource:]([PLVideoInternalResource alloc], "initWithBackingResource:", v2);
  else
    v3 = 0;

  return v3;
}

- (void)repairResource:(id)a3
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "backingResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "backingResource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileSystemBookmark");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(v6, "markAsNotLocallyAvailable");

    v5 = v8;
  }

}

- (BOOL)validateResource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isLocallyAvailable"))
    {
      objc_msgSend(v4, "fileURLIfLocal");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_moc, 0);
}

@end

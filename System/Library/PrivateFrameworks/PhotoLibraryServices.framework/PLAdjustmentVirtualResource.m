@implementation PLAdjustmentVirtualResource

- (PLAdjustmentVirtualResource)initWithAdjustmentFilePath:(id)a3 forAsset:(id)a4
{
  id v7;
  id v8;
  PLAdjustmentVirtualResource *v9;
  void *v10;
  PLValidatedExternalResource *v11;
  void *v12;
  id v13;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLAdjustmentVirtualResource;
  v9 = -[PLVirtualResource initWithAsset:resourceType:version:recipeID:](&v16, sel_initWithAsset_resourceType_version_recipeID_, v8, 8, 2, 0);
  if (v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PLAdjustmentVirtualResource.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathForAdjustmentFile"));

    }
    v9->_lock._os_unfair_lock_opaque = 0;
    +[PLUniformTypeIdentifier plistUniformTypeIdentifier](PLUniformTypeIdentifier, "plistUniformTypeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLVirtualResource setUniformTypeIdentifier:](v9, "setUniformTypeIdentifier:", v10);

    v11 = objc_alloc_init(PLValidatedExternalResource);
    -[PLValidatedExternalResource setResourceType:](v11, "setResourceType:", -[PLVirtualResource resourceType](v9, "resourceType"));
    -[PLValidatedExternalResource setVersion:](v11, "setVersion:", -[PLVirtualResource version](v9, "version"));
    -[PLValidatedExternalResource setRecipeID:](v11, "setRecipeID:", -[PLVirtualResource recipeID](v9, "recipeID"));
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalResource setFileURL:](v11, "setFileURL:", v12);

    v13 = -[PLPrimaryResourceDataStoreKey initFromExistingLocationOfExternalResource:asset:]([PLPrimaryResourceDataStoreKey alloc], "initFromExistingLocationOfExternalResource:asset:", v11, v8);
    -[PLVirtualResource setDataStoreKey:](v9, "setDataStoreKey:", v13);

  }
  return v9;
}

- (int64_t)dataLength
{
  os_unfair_lock_s *p_lock;
  NSNumber **p_cachedDataLength;
  NSNumber *cachedDataLength;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_cachedDataLength = &self->_cachedDataLength;
  cachedDataLength = self->_cachedDataLength;
  if (!cachedDataLength)
  {
    -[PLVirtualResource dataStoreKey](self, "dataStoreKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLVirtualResource assetID](self, "assetID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLForAssetID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributesOfItemAtPath:error:", v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_storeStrong((id *)p_cachedDataLength, v12);

    cachedDataLength = *p_cachedDataLength;
  }
  v13 = -[NSNumber unsignedLongLongValue](cachedDataLength, "unsignedLongLongValue");
  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (int64_t)estimatedDataLength
{
  os_unfair_lock_s *p_lock;
  NSNumber *cachedDataLength;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedDataLength = self->_cachedDataLength;
  if (cachedDataLength)
  {
    v5 = -[NSNumber unsignedLongLongValue](cachedDataLength, "unsignedLongLongValue");
    os_unfair_lock_unlock(p_lock);
    if (v5)
      return v5;
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  v6 = objc_msgSend(MEMORY[0x1E0D11410], "maxInlineDataSize");
  if (v6 >= 0)
    v7 = v6;
  else
    v7 = v6 + 1;
  return v7 >> 1;
}

- (id)adjustmentDictionary
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  NSObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PLVirtualResource fileURL](self, "fileURL");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8;
      if (v5)
      {
        PLBackendGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v10 = v5;
          _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Error when parsing adjustment data: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      PLBackendGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v2;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "adjustmentFileData is nil for file URL: %@", buf, 0xCu);
      }
      v4 = 0;
    }

  }
  else
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "adjustmentFileURL is nil for self", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSNumber)cachedDataLength
{
  return self->_cachedDataLength;
}

- (void)setCachedDataLength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDataLength, 0);
}

@end

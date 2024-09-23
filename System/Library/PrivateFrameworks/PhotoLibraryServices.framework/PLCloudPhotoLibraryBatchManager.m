@implementation PLCloudPhotoLibraryBatchManager

- (PLCloudPhotoLibraryBatchManager)init
{
  PLCloudPhotoLibraryBatchManager *v2;
  PLCloudPhotoLibraryBatchManager *v3;
  NSMutableArray *batches;
  PLCloudPhotoLibraryBatchContainer *currentBatch;
  NSMutableSet *v6;
  NSMutableSet *masterHistory;
  PLCloudPhotoLibraryBatchManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLCloudPhotoLibraryBatchManager;
  v2 = -[PLCloudPhotoLibraryBatchManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    batches = v2->_batches;
    v2->_batches = 0;

    currentBatch = v3->_currentBatch;
    v3->_currentBatch = 0;

    v3->_wasDrained = 0;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    masterHistory = v3->_masterHistory;
    v3->_masterHistory = v6;

    v3->_resourceBudget = 0;
    v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  NSMutableArray *batches;
  PLCloudPhotoLibraryBatchContainer *currentBatch;
  NSMutableSet *masterHistory;
  objc_super v6;

  batches = self->_batches;
  self->_batches = 0;

  currentBatch = self->_currentBatch;
  self->_currentBatch = 0;

  masterHistory = self->_masterHistory;
  self->_masterHistory = 0;

  v6.receiver = self;
  v6.super_class = (Class)PLCloudPhotoLibraryBatchManager;
  -[PLCloudPhotoLibraryBatchManager dealloc](&v6, sel_dealloc);
}

- (void)addRecord:(id)a3
{
  -[PLCloudPhotoLibraryBatchManager addRecord:ignoreBatchSize:](self, "addRecord:ignoreBatchSize:", a3, 0);
}

- (void)addRecord:(id)a3 ignoreBatchSize:(BOOL)a4
{
  _BOOL4 v4;
  PLCloudPhotoLibraryBatchContainer *v6;
  void *v7;
  NSMutableSet *masterHistory;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSMutableSet *v12;
  void *v13;
  NSObject *v14;
  PLCloudPhotoLibraryBatchContainer *v15;
  NSObject *p_super;
  PLCloudPhotoLibraryBatchContainer *v17;
  NSObject *v18;
  PLCloudPhotoLibraryBatchContainer *v19;
  const char *v20;
  PLCloudPhotoLibraryBatchContainer *v21;
  PLCloudPhotoLibraryBatchContainer *v22;
  PLCloudPhotoLibraryBatchContainer *v23;
  NSObject *v24;
  PLCloudPhotoLibraryBatchContainer *v25;
  NSMutableArray *v26;
  NSMutableArray *batches;
  PLCloudPhotoLibraryBatchContainer *v28;
  PLCloudPhotoLibraryBatchContainer *currentBatch;
  uint8_t buf[4];
  PLCloudPhotoLibraryBatchContainer *v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = (PLCloudPhotoLibraryBatchContainer *)a3;
  -[PLCloudPhotoLibraryBatchContainer scopedIdentifier](v6, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempted to add a CPLRecordChange with nil scopedIdentifier: %@"), v6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v31 = (PLCloudPhotoLibraryBatchContainer *)v10;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

    }
    +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: Attemping to add a cloud record with nil scopedIdentifier to the upload batch"), v10);
    goto LABEL_14;
  }
  if (self->_wasDrained)
  {
    -[PLCloudPhotoLibraryBatchManager reset](self, "reset");
    self->_wasDrained = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    if (v4 && -[PLCloudPhotoLibraryBatchContainer count](self->_currentBatch, "count") <= 0xC8)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Skip splitting batch, ignoreBatchSize = YES", buf, 2u);
        }
        goto LABEL_51;
      }
LABEL_52:
      if (!self->_batches)
      {
        v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        batches = self->_batches;
        self->_batches = v26;

      }
      if (!self->_currentBatch)
      {
        v28 = objc_alloc_init(PLCloudPhotoLibraryBatchContainer);
        currentBatch = self->_currentBatch;
        self->_currentBatch = v28;

        -[NSMutableArray addObject:](self->_batches, "addObject:", self->_currentBatch);
      }
      if (-[PLCloudPhotoLibraryBatchContainer supportsResources](v6, "supportsResources"))
        self->_resourceBudget += -[PLCloudPhotoLibraryBatchContainer realResourceSize](v6, "realResourceSize");
      -[PLCloudPhotoLibraryBatchContainer addRecord:](self->_currentBatch, "addRecord:", v6);
      goto LABEL_59;
    }
    v15 = self->_currentBatch;
    if (!v15)
      goto LABEL_52;
    if (-[PLCloudPhotoLibraryBatchContainer count](v15, "count") >= 0x32)
    {
      -[PLCloudPhotoLibraryBatchContainer lastAddedRecord](self->_currentBatch, "lastAddedRecord");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (*MEMORY[0x1E0D115D0])
        {
LABEL_51:

          goto LABEL_52;
        }
        __CPLAssetsdOSLogDomain();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          v17 = self->_currentBatch;
          *(_DWORD *)buf = 138412290;
          v31 = v17;
          _os_log_impl(&dword_199541000, p_super, OS_LOG_TYPE_DEBUG, "Skip splitting batch %@, the last record is a CPLMasterChange", buf, 0xCu);
        }
      }
      else
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            v25 = self->_currentBatch;
            *(_DWORD *)buf = 138412290;
            v31 = v25;
            _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "Splitting batch %@.", buf, 0xCu);
          }

        }
        p_super = &self->_currentBatch->super;
        self->_currentBatch = 0;
      }

      goto LABEL_51;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[PLCloudPhotoLibraryBatchContainer count](self->_currentBatch, "count") >= 5)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = self->_currentBatch;
          *(_DWORD *)buf = 138412290;
          v31 = v19;
          v20 = "Splitting batch for memories %@.";
LABEL_42:
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
          goto LABEL_43;
        }
        goto LABEL_43;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && -[PLCloudPhotoLibraryBatchContainer count](self->_currentBatch, "count") >= 5)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v21 = self->_currentBatch;
            *(_DWORD *)buf = 138412290;
            v31 = v21;
            v20 = "Splitting batch for social group %@.";
            goto LABEL_42;
          }
LABEL_43:

        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || -[PLCloudPhotoLibraryBatchContainer count](self->_currentBatch, "count") < 0xA)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || -[PLCloudPhotoLibraryBatchContainer albumType](v6, "albumType") != 7
            || !-[PLCloudPhotoLibraryBatchContainer count](self->_currentBatch, "count"))
          {
            goto LABEL_52;
          }
          goto LABEL_44;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v22 = self->_currentBatch;
            *(_DWORD *)buf = 138412290;
            v31 = v22;
            v20 = "Splitting batch for sugggestions %@.";
            goto LABEL_42;
          }
          goto LABEL_43;
        }
      }
    }
LABEL_44:
    v23 = self->_currentBatch;
    self->_currentBatch = 0;

    goto LABEL_52;
  }
  masterHistory = self->_masterHistory;
  -[PLCloudPhotoLibraryBatchContainer scopedIdentifier](v6, "scopedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(masterHistory) = -[NSMutableSet containsObject:](masterHistory, "containsObject:", v9);

  if ((masterHistory & 1) == 0)
  {
    v12 = self->_masterHistory;
    -[PLCloudPhotoLibraryBatchContainer scopedIdentifier](v6, "scopedIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v12, "addObject:", v13);

    goto LABEL_16;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Duplicate master detected, dropping this second master record %@", buf, 0xCu);
    }
LABEL_14:

  }
LABEL_59:

}

- (void)addComputeSyncRelevantAsset:(id)a3
{
  PLCloudPhotoLibraryBatchContainer *currentBatch;
  id v4;
  id v5;

  if (a3)
  {
    currentBatch = self->_currentBatch;
    if (currentBatch)
    {
      v4 = a3;
      -[PLCloudPhotoLibraryBatchContainer computeSyncRelevantAssetsInBatch](currentBatch, "computeSyncRelevantAssetsInBatch");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v4);

    }
  }
}

- (void)reset
{
  NSMutableArray *batches;
  PLCloudPhotoLibraryBatchContainer *currentBatch;

  batches = self->_batches;
  self->_batches = 0;

  currentBatch = self->_currentBatch;
  self->_currentBatch = 0;

  -[NSMutableSet removeAllObjects](self->_masterHistory, "removeAllObjects");
  self->_resourceBudget = 0;
}

- (id)drainBatches
{
  NSMutableArray *batches;

  batches = self->_batches;
  if (batches)
    self->_wasDrained = 1;
  return batches;
}

- (int64_t)currentBatchCount
{
  return -[PLCloudPhotoLibraryBatchContainer count](self->_currentBatch, "count");
}

- (BOOL)isAboveMaximumResourceBudget
{
  return self->_resourceBudget > 0xFA00000;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Batch Manager consists of: %@"), self->_batches);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterHistory, 0);
  objc_storeStrong((id *)&self->_currentBatch, 0);
  objc_storeStrong((id *)&self->_batches, 0);
}

@end

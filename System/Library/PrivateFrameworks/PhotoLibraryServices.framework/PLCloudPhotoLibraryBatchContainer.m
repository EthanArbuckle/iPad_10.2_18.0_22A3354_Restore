@implementation PLCloudPhotoLibraryBatchContainer

- (PLCloudPhotoLibraryBatchContainer)init
{
  PLCloudPhotoLibraryBatchContainer *v2;
  CPLChangeBatch *v3;
  CPLChangeBatch *batch;
  NSMutableSet *v5;
  NSMutableSet *computeSyncRelevantAssetsInBatch;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLCloudPhotoLibraryBatchContainer;
  v2 = -[PLCloudPhotoLibraryBatchContainer init](&v8, sel_init);
  if (v2)
  {
    v3 = (CPLChangeBatch *)objc_alloc_init(MEMORY[0x1E0D11350]);
    batch = v2->_batch;
    v2->_batch = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    computeSyncRelevantAssetsInBatch = v2->_computeSyncRelevantAssetsInBatch;
    v2->_computeSyncRelevantAssetsInBatch = v5;

  }
  return v2;
}

- (unint64_t)count
{
  return -[CPLChangeBatch count](self->_batch, "count");
}

- (void)addRecord:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    -[CPLChangeBatch addRecord:](self->_batch, "addRecord:", v4);
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Trying to add empty record to the batch, skipping.", v6, 2u);
    }

  }
}

- (void)incrementRetryCount
{
  ++self->_retryCount;
}

- (id)lastAddedRecord
{
  void *v2;
  void *v3;

  -[CPLChangeBatch records](self->_batch, "records");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)batchesSplitForError
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  char v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (-[PLCloudPhotoLibraryBatchContainer reachedMinSplit](self, "reachedMinSplit")
    || -[PLCloudPhotoLibraryBatchContainer count](self, "count") <= 1)
  {
    -[PLCloudPhotoLibraryBatchContainer setWasSplit:](self, "setWasSplit:", 1);
    -[PLCloudPhotoLibraryBatchContainer incrementRetryCount](self, "incrementRetryCount");
    v31[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[PLCloudPhotoLibraryBatchContainer count](self, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[CPLChangeBatch records](self->_batch, "records");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v4)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    goto LABEL_30;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v27;
  v10 = &off_1E3659000;
  do
  {
    v11 = 0;
    v12 = v7;
    do
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
      if (!v12)
        goto LABEL_18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v8 != 0;
      }
      else
      {
        v15 = v9;
        v16 = v3;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v13, "masterScopedIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "scopedIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v17, "isEqual:", v18);

          if ((v23 & 1) != 0)
            goto LABEL_17;

          v8 = 0;
          v14 = 1;
        }
        else
        {
          v19 = objc_msgSend(v6, "count");
          v20 = -[PLCloudPhotoLibraryBatchContainer count](self, "count");

          v8 = 0;
          if (v19 < v20 >> 1)
          {
LABEL_17:
            v3 = v16;
            v9 = v15;
            v10 = &off_1E3659000;
LABEL_18:
            if (v6)
              goto LABEL_24;
            goto LABEL_23;
          }
          v14 = 0;
        }
        v3 = v16;
        v9 = v15;
        v10 = &off_1E3659000;
      }
      objc_msgSend(v6, "setReachedMinSplit:", v14);

LABEL_23:
      v6 = objc_alloc_init((Class)v10[210]);
      objc_msgSend(v6, "setRetryCount:", -[PLCloudPhotoLibraryBatchContainer retryCount](self, "retryCount") + 1);
      objc_msgSend(v6, "setWasSplit:", 1);
      objc_msgSend(v3, "addObject:", v6);
LABEL_24:
      objc_msgSend(v6, "addRecord:", v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v13;

        v8 = v21;
      }
      v7 = v13;

      ++v11;
      v12 = v7;
    }
    while (v5 != v11);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v5);
LABEL_30:

  v22 = v3;
  return v22;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CPLChangeBatch records](self->_batch, "records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@\r"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (CPLChangeBatch)batch
{
  return self->_batch;
}

- (void)setBatch:(id)a3
{
  objc_storeStrong((id *)&self->_batch, a3);
}

- (NSMutableSet)computeSyncRelevantAssetsInBatch
{
  return self->_computeSyncRelevantAssetsInBatch;
}

- (void)setComputeSyncRelevantAssetsInBatch:(id)a3
{
  objc_storeStrong((id *)&self->_computeSyncRelevantAssetsInBatch, a3);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)wasSplit
{
  return self->_wasSplit;
}

- (void)setWasSplit:(BOOL)a3
{
  self->_wasSplit = a3;
}

- (BOOL)reachedMinSplit
{
  return self->_reachedMinSplit;
}

- (void)setReachedMinSplit:(BOOL)a3
{
  self->_reachedMinSplit = a3;
}

- (BOOL)wasFixed
{
  return self->_wasFixed;
}

- (void)setWasFixed:(BOOL)a3
{
  self->_wasFixed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeSyncRelevantAssetsInBatch, 0);
  objc_storeStrong((id *)&self->_batch, 0);
}

@end

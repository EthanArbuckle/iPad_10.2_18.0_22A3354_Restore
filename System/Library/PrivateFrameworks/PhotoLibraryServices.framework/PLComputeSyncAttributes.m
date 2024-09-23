@implementation PLComputeSyncAttributes

- (BOOL)supportsCloudUpload
{
  void *v3;
  void *v4;
  char v5;

  -[PLComputeSyncAttributes asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsCloudUpload"))
  {
    -[PLComputeSyncAttributes asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldPushComputeSync");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isSyncableChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PLComputeSyncAttributes changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16[0] = CFSTR("localAnalysisMajorVersion");
  v16[1] = CFSTR("localAnalysisStage");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 && -[PLComputeSyncAttributes hasValidLocalProperties](self, "hasValidLocalProperties"))
        {
          v10 = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)hasValidLocalProperties
{
  return (int)-[PLComputeSyncAttributes localAnalysisMajorVersion](self, "localAnalysisMajorVersion") >= 1
      && (int)-[PLComputeSyncAttributes localAnalysisStage](self, "localAnalysisStage") > 0;
}

- (void)_updateLocalAnalysisStageHistoryWithStage:(signed __int16)a3 changeSource:(signed __int16)a4
{
  int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a4;
  v5 = a3;
  v7 = -[PLComputeSyncAttributes localAnalysisStageHistory](self, "localAnalysisStageHistory");
  if (v5 > 199)
  {
    v12 = v7 | 0x20;
    v13 = v7 | 0x10;
    v14 = v7 | 8;
    if (v4)
      v14 = v7;
    if (v4 != 1)
      v13 = v14;
    if (v4 != 2)
      v12 = v13;
    v15 = v7 | 0x100;
    v16 = v7 | 0x80;
    v17 = v7 | 0x40;
    if (v4)
      v17 = v7;
    if (v4 != 1)
      v16 = v17;
    if (v4 != 2)
      v15 = v16;
    if (v5 != 900)
      v15 = v7;
    if (v5 == 200)
      v11 = v12;
    else
      v11 = v15;
  }
  else
  {
    if (!v5)
      return;
    v8 = v7 | 4;
    v9 = v7 | 2;
    v10 = v7 | 1;
    if (v4)
      v10 = v7;
    if (v4 != 1)
      v9 = v10;
    if (v4 != 2)
      v8 = v9;
    if (v5 == 100)
      v11 = v8;
    else
      v11 = v7;
  }
  -[PLComputeSyncAttributes setLocalAnalysisStageHistory:](self, "setLocalAnalysisStageHistory:", v11);
}

+ (id)entityName
{
  return CFSTR("ComputeSyncAttributes");
}

+ (id)_computeSyncAttributesForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "computeSyncAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLComputeSyncAttributes entityName](PLComputeSyncAttributes, "entityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v6, (uint64_t)v5, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setAsset:", v3);
  }

  return v4;
}

+ (void)updateLocalComputeSyncStageAfterProcessingForAsset:(id)a3 stage:(signed __int16)a4
{
  uint64_t v4;
  int v5;
  id v6;

  v4 = a4;
  objc_msgSend(a1, "_computeSyncAttributesForAsset:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "localAnalysisStage");
  objc_msgSend(v6, "setLocalAnalysisMajorVersion:", 1);
  objc_msgSend(v6, "setLocalAnalysisStage:", v4);
  if (v5 != objc_msgSend(v6, "localAnalysisStage"))
    objc_msgSend(v6, "_updateLocalAnalysisStageHistoryWithStage:changeSource:", objc_msgSend(v6, "localAnalysisStage"), 2);

}

+ (BOOL)updateCloudComputeSyncAttributesForAsset:(id)a3 cloudVersion:(id)a4 cloudAdjustmentFingerprint:(id)a5 cloudLastUpdatedDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a1, "_computeSyncAttributesForAsset:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11428]), "initWithString:", v10);
  v15 = objc_msgSend(v14, "majorVersion");
  if (v15)
  {
    objc_msgSend(v13, "setCloudComputeStateVersion:", v10);
    objc_msgSend(v13, "setCloudComputeStateAdjustmentFingerprint:", v11);
    objc_msgSend(v13, "setCloudComputeStateLastUpdatedDate:", v12);
  }

  return v15 != 0;
}

+ (BOOL)updateLocalComputeSyncAttributesForAsset:(id)a3 cloudRecordComputeState:(id)a4 originatedFromPrefetch:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adjustmentFingerprint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastUpdatedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "updateCloudComputeSyncAttributesForAsset:cloudVersion:cloudAdjustmentFingerprint:cloudLastUpdatedDate:", v8, v10, v11, v12);

  if (v13)
  {
    objc_msgSend(a1, "_computeSyncAttributesForAsset:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0D11428]);
    objc_msgSend(v9, "version");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithString:", v16);

    LODWORD(v16) = objc_msgSend(v14, "localAnalysisStage");
    objc_msgSend(v14, "setLocalAnalysisMajorVersion:", (__int16)objc_msgSend(v17, "majorVersion"));
    objc_msgSend(v14, "setLocalAnalysisStage:", (__int16)objc_msgSend(v17, "stage"));
    if ((_DWORD)v16 != objc_msgSend(v14, "localAnalysisStage"))
      objc_msgSend(v14, "_updateLocalAnalysisStageHistoryWithStage:changeSource:", objc_msgSend(v14, "localAnalysisStage"), !v5);

  }
  return v13;
}

+ (BOOL)resetLocalComputeSyncAttributesForAsset:(id)a3
{
  void *v3;

  objc_msgSend(a1, "_computeSyncAttributesForAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalAnalysisMajorVersion:", 0);
  objc_msgSend(v3, "setLocalAnalysisStage:", 0);
  objc_msgSend(v3, "setLocalAnalysisStageHistory:", 0);

  return 1;
}

@end

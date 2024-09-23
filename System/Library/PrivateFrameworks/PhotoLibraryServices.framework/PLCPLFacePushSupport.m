@implementation PLCPLFacePushSupport

+ (void)applyFaceChangesFromAsset:(id)a3 toAssetChange:(id)a4 inPhotoLibrary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  PLLibrarySyncContext *v10;
  PLCPLFacePushSupport *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x19AEC1554]();
  v10 = -[PLLibrarySyncContext initWithPhotoLibrary:]([PLLibrarySyncContext alloc], "initWithPhotoLibrary:", v8);
  v11 = -[PLCPLFacePushSupport initWithSyncContext:]([PLCPLFacePushSupport alloc], "initWithSyncContext:", v10);
  -[PLCPLFacePushSupport applyFaceChangesFromAsset:toAssetChange:](v11, "applyFaceChangesFromAsset:toAssetChange:", v12, v7);

  objc_autoreleasePoolPop(v9);
}

- (PLCPLFacePushSupport)initWithSyncContext:(id)a3
{
  id v5;
  PLCPLFacePushSupport *v6;
  PLCPLFacePushSupport *v7;
  PLCPLFacePushSupport *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLCPLFacePushSupport;
  v6 = -[PLCPLFacePushSupport init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_syncContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)applyFaceChangesFromAsset:(id)a3 toAssetChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PLSyncContext serverSupportsVision](self->_syncContext, "serverSupportsVision"))
  {
    v14 = 0;
    -[PLCPLFacePushSupport cplFaceAnalysisRefFromAsset:algorithmVersion:](self, "cplFaceAnalysisRefFromAsset:algorithmVersion:", v6, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFaces:", v8);
    objc_msgSend(v8, "faces");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(v7, "setFacesVersion:", v14);
      -[PLCPLFacePushSupport _facesAdjustmentsFingerprintFromAsset:assetChange:](self, "_facesAdjustmentsFingerprintFromAsset:assetChange:", v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "syncDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v16 = v11;
          v17 = 2112;
          v18 = v13;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Pushing faces adjustment fingerprint (%@) for asset: %@", buf, 0x16u);

        }
      }
      objc_msgSend(v7, "setFacesAdjustmentsFingerprint:", v11);

    }
  }

}

- (id)cplFaceAnalysisRefFromAsset:(id)a3 algorithmVersion:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(a3, "detectedFaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLCPLFacePushSupport cplFaceRefsFromFaces:algorithmVersion:](self, "cplFaceRefsFromFaces:algorithmVersion:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0D11380]);
  if (objc_msgSend(v8, "count"))
    v10 = v8;
  else
    v10 = 0;
  objc_msgSend(v9, "setFaces:", v10);

  return v9;
}

- (BOOL)_faceAnalysisWasPerformedOnLatestAdjustmentOfAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "dateForComparingAdjustmentVersions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceAdjustmentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToDate:", v5);
  return (char)v3;
}

- (id)_facesAdjustmentsFingerprintFromAsset:(id)a3 assetChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[PLCPLFacePushSupport _faceAnalysisWasPerformedOnLatestAdjustmentOfAsset:](self, "_faceAnalysisWasPerformedOnLatestAdjustmentOfAsset:", v6)&& objc_msgSend(v6, "faceDetectionComplete"))
  {
    if (!objc_msgSend(v6, "hasAdjustments"))
    {
      v10 = (id)*MEMORY[0x1E0D11218];
      goto LABEL_9;
    }
    objc_msgSend(v7, "adjustments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "otherAdjustmentsFingerprint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v6, "syncedAdjustmentFingerprint");
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = v10;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)cplFaceRefsFromFaces:(id)a3 algorithmVersion:(int64_t *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!v11)
          v11 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "faceAlgorithmVersion", (_QWORD)v17);
        if (objc_msgSend((id)objc_opt_class(), "isFaceSyncable:", v14))
        {
          -[PLCPLFacePushSupport cplFaceRefFromFace:](self, "cplFaceRefFromFace:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  if (a4)
    *a4 = v11;

  return v7;
}

- (id)cplFaceRefFromFace:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D11390]);
  objc_msgSend(v4, "centerX");
  objc_msgSend(v5, "setCenterX:");
  objc_msgSend(v4, "centerY");
  objc_msgSend(v5, "setCenterY:");
  objc_msgSend(v4, "size");
  objc_msgSend(v5, "setSize:");
  objc_msgSend(v4, "bodyCenterX");
  objc_msgSend(v5, "setBodyCenterX:");
  objc_msgSend(v4, "bodyCenterY");
  objc_msgSend(v5, "setBodyCenterY:");
  objc_msgSend(v4, "bodyWidth");
  objc_msgSend(v5, "setBodyWidth:");
  objc_msgSend(v4, "bodyHeight");
  objc_msgSend(v5, "setBodyHeight:");
  objc_msgSend(v5, "setManual:", objc_msgSend(v4, "manual"));
  objc_msgSend(v5, "setKeyFace:", objc_msgSend((id)objc_opt_class(), "_shouldPushBeingKeyFace:", v4));
  objc_msgSend(v5, "setNameSource:", objc_msgSend(v4, "cloudNameSource"));
  if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsDetectionType"))
    objc_msgSend(v5, "setDetectionType:", objc_msgSend(v4, "detectionType"));
  objc_msgSend(v4, "personForFace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "graphVerified") & 1) != 0 || (objc_msgSend(v6, "userVerified") & 1) != 0)
  {
    objc_msgSend(v6, "personUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersonIdentifier:", v7);

  }
  else
  {
    objc_msgSend(v5, "setPersonIdentifier:", 0);
  }
  -[PLCPLFacePushSupport rejectedPersonIdentifiersForFace:](self, "rejectedPersonIdentifiersForFace:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRejectedPersonIdentifiers:", v8);

  return v5;
}

- (id)rejectedPersonIdentifiersForFace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  objc_msgSend(v3, "rejectedPersons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    v11 = (_BYTE *)MEMORY[0x1E0D115D0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "personUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v4, "addObject:", v14);
        }
        else if (!*v11)
        {
          __CPLAssetsdOSLogDomain();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "pl_shortDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v24 = v16;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Unexpected person with nil personUUID: %@", buf, 0xCu);

          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_67780);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncContext, 0);
}

uint64_t __57__PLCPLFacePushSupport_rejectedPersonIdentifiersForFace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (BOOL)isFaceSyncable:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[PLDetectedFace syncableFacesPredicate](PLDetectedFace, "syncableFacesPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "evaluateWithObject:", v3);

  return v5;
}

+ (BOOL)_shouldPushBeingKeyFace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  objc_msgSend(v3, "personForFace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "personBeingKeyFace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "isEqualToString:", v7))
  {
    objc_msgSend(v3, "personBeingKeyFace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "keyFaceIsPicked");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)markSyncableFacesAsPushedInAsset:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "detectedFaces", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (+[PLCPLFacePushSupport isFaceSyncable:](PLCPLFacePushSupport, "isFaceSyncable:", v8)
          && objc_msgSend(v8, "cloudLocalState") != 1)
        {
          objc_msgSend(v8, "setCloudLocalState:", 1);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

@end

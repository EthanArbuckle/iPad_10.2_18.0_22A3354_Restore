@implementation PLSlalomUtilities

+ (id)synchronouslyFetchVideoAdjustmentsFromManagedAsset:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__64336;
  v20 = __Block_byref_object_dispose__64337;
  v21 = 0;
  if (objc_msgSend(v3, "isDefaultAdjustedSlomo"))
  {
    if (PLIsAssetsd())
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __72__PLSlalomUtilities_synchronouslyFetchVideoAdjustmentsFromManagedAsset___block_invoke;
      v15[3] = &unk_1E366F028;
      v15[4] = &v16;
      objc_msgSend(v3, "synchronouslyFetchAdjustmentDataWithCompletionHandler:", v15);
    }
    else
    {
      v4 = dispatch_semaphore_create(0);
      objc_msgSend(v3, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetsdClient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "resourceClient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __72__PLSlalomUtilities_synchronouslyFetchVideoAdjustmentsFromManagedAsset___block_invoke_2;
      v12[3] = &unk_1E366F050;
      v14 = &v16;
      v9 = v4;
      v13 = v9;
      objc_msgSend(v7, "adjustmentDataForAsset:networkAccessAllowed:trackCPLDownload:completionHandler:", v8, 0, 0, v12);

      dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)videoAVObjectBuilderForManagedAsset:(id)a3 applyVideoAdjustments:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForFullsizeRenderVideoFile");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v4 || !v8 || !objc_msgSend(v7, "fileExistsAtPath:", v8))
  {
    objc_msgSend(v6, "pathForOriginalFile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "fileExistsAtPath:", v12)
      && (objc_msgSend(v6, "isPlayableVideo:", 0) & 1) != 0)
    {
      v13 = v12;
      if (v4)
      {
        objc_msgSend(a1, "synchronouslyFetchVideoAdjustmentsFromManagedAsset:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
LABEL_9:
          v10 = 0;
LABEL_13:

          goto LABEL_14;
        }
LABEL_12:
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(v6, "pathForMediumVideoFile");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = 0;
    if (!v13)
      goto LABEL_9;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v14, v11);

  return v15;
}

+ (double)durationForManagedAsset:(id)a3 applyVideoAdjustments:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "duration");
  v8 = v7;
  if (v4 && objc_msgSend(v6, "isDefaultAdjustedSlomo"))
  {
    objc_msgSend(a1, "synchronouslyFetchVideoAdjustmentsFromManagedAsset:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "durationForBaseDuration:videoAdjustments:", v9, v8);
    v8 = v10;

  }
  return v8;
}

+ (double)durationForBaseDuration:(double)a3 videoAdjustments:(id)a4
{
  void *v5;
  id v6;
  int v7;
  int v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  float v13;
  uint64_t v15;

  if (a4)
  {
    v5 = (void *)MEMORY[0x1E0D75298];
    v6 = a4;
    objc_msgSend(v6, "slowMotionRate");
    v8 = v7;
    objc_msgSend(v6, "slowMotionTimeRange");

    LODWORD(v9) = v8;
    objc_msgSend(v5, "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", &v15, 1, a3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    if (v10)
    {
      *(float *)&v11 = a3;
      objc_msgSend(v10, "scaledTimeForOriginalTime:", v11);
      a3 = v13;
    }

  }
  return a3;
}

void __72__PLSlalomUtilities_synchronouslyFetchVideoAdjustmentsFromManagedAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a6, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75308]), "initWithURL:", v10);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

intptr_t __72__PLSlalomUtilities_synchronouslyFetchVideoAdjustmentsFromManagedAsset___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v10 = a6;
  v11 = a3;
  v12 = a2;
  v13 = +[PLManagedAsset pfAdjustmentsBaseVersionFromAdjustmentBaseVersion:](PLManagedAsset, "pfAdjustmentsBaseVersionFromAdjustmentBaseVersion:", a5);
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75308]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v12, v11, v10, v13, 0, 0);

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end

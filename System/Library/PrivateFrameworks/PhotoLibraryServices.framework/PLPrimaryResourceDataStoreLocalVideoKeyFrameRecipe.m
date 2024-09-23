@implementation PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe

- (PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe)initWithRecipeID:(unsigned int)a3
{
  PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe *v3;
  PLLocalVideoKeyFrameJobQueue *v4;
  PLLocalVideoKeyFrameJobQueue *jobQueue;
  objc_super v7;

  if (a3 == 65749)
  {
    v7.receiver = self;
    v7.super_class = (Class)PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe;
    v3 = -[PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe init](&v7, sel_init);
    if (v3)
    {
      v4 = objc_alloc_init(PLLocalVideoKeyFrameJobQueue);
      jobQueue = v3->_jobQueue;
      v3->_jobQueue = v4;

    }
  }
  else
  {

    return 0;
  }
  return v3;
}

- (unsigned)recipeID
{
  return 65749;
}

- (id)codecFourCharCodeName
{
  return 0;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return 0;
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  id v6;
  PLVideoInternalResourceContext *v7;
  void *v8;
  PLVideoInternalResourceContext *v9;
  PLLocalVideoKeyFrameVideoChoosingOptions *v10;
  PLVideoChoosingAndAvailabilitySupport *v11;
  PLVideoChoosingAndAvailabilitySupport *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = [PLVideoInternalResourceContext alloc];
  objc_msgSend(v5, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLVideoInternalResourceContext initWithManagedObjectContext:asset:](v7, "initWithManagedObjectContext:asset:", v8, v5);

  v10 = -[PLLocalVideoKeyFrameVideoChoosingOptions initWithStreamingAllowed:]([PLLocalVideoKeyFrameVideoChoosingOptions alloc], "initWithStreamingAllowed:", -[PLVideoInternalResourceContext isWalrusEnabled](v9, "isWalrusEnabled") ^ 1);
  v11 = [PLVideoChoosingAndAvailabilitySupport alloc];
  v12 = -[PLVideoChoosingAndAvailabilitySupport initWithContext:assetInformation:options:size:](v11, "initWithContext:assetInformation:options:size:", v9, v9, v10, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v23 = 0;
  -[PLVideoChoosingAndAvailabilitySupport chooseResourceWithLoadingMode:needsAdjustmentData:error:](v12, "chooseResourceWithLoadingMode:needsAdjustmentData:error:", &v23, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 == 3)
  {
    PLImageManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      PLVideoResourceDescription(v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "[key frame] streaming video selected as ingredient for local video key frame : %{public}@", buf, 0xCu);

    }
    -[PLVideoInternalResourceContext backingResourceForVideoResource:](v9, "backingResourceForVideoResource:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("streamingVideo");
    goto LABEL_9;
  }
  if (v23 == 5)
  {
    PLImageManagerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      PLVideoResourceDescription(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "[key frame] local video selected as ingredient for local video key frame : %{public}@", buf, 0xCu);

    }
    -[PLVideoInternalResourceContext backingResourceForVideoResource:](v9, "backingResourceForVideoResource:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("localVideo");
LABEL_9:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v17);
    goto LABEL_10;
  }
  PLImageManagerGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "[key frame] no video result found for local key frame", buf, 2u);
  }
LABEL_10:

  if (objc_msgSend(v6, "count"))
    v20 = v6;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  -[PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe generateAndStoreForAsset:networkAccessAllowed:clientBundleID:progress:completion:](self, "generateAndStoreForAsset:networkAccessAllowed:clientBundleID:progress:completion:", a3, 0, 0, a9, a11, a8);
}

- (void)generateAndStoreForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 clientBundleID:(id)a5 progress:(id *)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v11;
  PLLocalVideoKeyFrameJobQueue *jobQueue;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v8 = a4;
  v11 = a7;
  jobQueue = self->_jobQueue;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v14, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "libraryID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  LODWORD(v8) = -[PLLocalVideoKeyFrameJobQueue addJobWithAssetObjectID:networkAccessAllowed:clientBundleID:libraryID:error:completionHandler:](jobQueue, "addJobWithAssetObjectID:networkAccessAllowed:clientBundleID:libraryID:error:completionHandler:", v15, v8, v13, v17, &v21, v11);

  v18 = v21;
  if (v8)
  {
    -[PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe _runNextJob](self, "_runNextJob");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id, void *, void *, _QWORD))v11 + 2))(v11, 0, v18, v19, v20, 0);

  }
}

- (void)_handleKeyFrameGeneratedWithAsset:(id)a3 destinationURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __114__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__handleKeyFrameGeneratedWithAsset_destinationURL_completion___block_invoke;
  v18[3] = &unk_1E3676240;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v22 = v11;
  v23 = v10;
  v14 = v10;
  v15 = v11;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v12, "asyncPerformOnContext:identifyingBlock:block:", v13, 0, v18);

}

- (void)_generateAndStoreForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 clientBundleID:(id)a5 progress:(id *)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v11;
  void *v12;
  _OWORD *v13;
  CMTimeValue v14;
  CMTimeScale v15;
  CMTimeEpoch v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v32;
  NSObject *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  CMTimeValue v54;
  CMTimeScale v55;
  CMTimeFlags v56;
  CMTimeEpoch v57;
  CMTime duration;
  CMTimeRange v59;
  _QWORD v60[5];
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  CMTime buf;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v73;

  v9 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v49 = a5;
  v48 = a7;
  -[PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe chooseIngredientsFrom:version:](self, "chooseIngredientsFrom:version:", v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_OWORD *)MEMORY[0x1E0CA2E68];
  v14 = *MEMORY[0x1E0CA2E68];
  value = *MEMORY[0x1E0CA2E68];
  v15 = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
  timescale = v15;
  v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  epoch = v16;
  objc_msgSend(v11, "mediaAnalysisAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v11
      && (objc_msgSend(v11, "videoKeyFrameTime"), value = buf.value, timescale = buf.timescale, (buf.flags & 1) != 0))
    {
      epoch = buf.epoch;
      flags = buf.flags;
    }
    else
    {
      value = v14;
      timescale = v15;
    }
  }
  v18 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v11, "pathForLocalVideoKeyFrame");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fileURLWithPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    v21 = 0;
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D74498];
    v68 = *MEMORY[0x1E0CB2938];
    v69 = CFSTR("failed to find ingredients to generate local video key frame");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 47001, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("localVideo"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "dataStoreKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fileURLForAssetID:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)objc_opt_class();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke;
      v60[3] = &unk_1E366D498;
      v60[4] = self;
      v61 = v11;
      v62 = v20;
      v31 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v48;
      v63 = v48;
      buf.value = value;
      buf.timescale = timescale;
      buf.flags = flags;
      buf.epoch = epoch;
      objc_msgSend(v30, "generateKeyFrameFromVideoURL:destinationURL:time:completion:", v29, v62, &buf, v60);

      v32 = v61;
LABEL_17:

      v34 = 1;
      goto LABEL_23;
    }
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0D74498];
    v66 = *MEMORY[0x1E0CB2938];
    v67 = CFSTR("data store key failed to resolve video url");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 47001, v37);
    v38 = objc_claimAutoreleasedReturnValue();

    v29 = 0;
LABEL_21:
    v34 = 0;
    v21 = (void *)v38;
    goto LABEL_22;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("streamingVideo"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (v9)
    {
      PLImageManagerGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v49;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEBUG, "[key frame] Making streaming video request to generate local video key frame, clientBundleID: %@", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(v29, "dataStore");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      buf.value = value;
      buf.timescale = timescale;
      buf.flags = flags;
      buf.epoch = epoch;
      *(_OWORD *)&duration.value = *v13;
      duration.epoch = v16;
      CMTimeRangeMake(&v59, &buf, &duration);
      objc_msgSend(v11, "managedObjectContext");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke_175;
      v50[3] = &unk_1E366B438;
      v50[4] = self;
      v51 = v20;
      v54 = value;
      v55 = timescale;
      v56 = flags;
      v57 = epoch;
      v52 = v11;
      v31 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v48;
      v53 = v48;
      objc_msgSend(v45, "requestStreamingURLForResource:asset:intent:timeRange:streamingHints:inContext:clientBundleID:completion:", v29, v52, 5, &v59, 0, v44, v49, v50);

      v32 = v51;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74600], 6, 0);
    v38 = objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  v34 = 0;
LABEL_22:
  v31 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v48;
LABEL_23:

  if (!v21)
  {
    v41 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0D74600];
    v64 = *MEMORY[0x1E0CB2938];
    v65 = CFSTR("failed to generate local video key frame, unknown error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "errorWithDomain:code:userInfo:", v42, 4, v43);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v34 & 1) != 0)
      goto LABEL_26;
    goto LABEL_25;
  }
  if ((v34 & 1) == 0)
  {
LABEL_25:
    v39 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v40 = objc_alloc_init(MEMORY[0x1E0C99E40]);
    ((void (**)(_QWORD, _QWORD, void *, id, id))v31)[2](v31, 0, v21, v39, v40);

  }
LABEL_26:

}

- (void)_handleJobFinished:(id)a3 withMutatedMoc:(id)a4 error:(id)a5 storedRecipes:(id)a6 affectedRecipes:(id)a7 sourceMetadata:(id)a8
{
  PLLocalVideoKeyFrameJobQueue *jobQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  jobQueue = self->_jobQueue;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[PLLocalVideoKeyFrameJobQueue removeJob:](jobQueue, "removeJob:", v20);
  objc_msgSend(v20, "callCompletionHandlersWithMutatedMoc:error:storedRecipes:affectedRecipes:sourceMetadata:", v19, v18, v17, v16, v15);

  -[PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe _runNextJob](self, "_runNextJob");
}

- (void)_runNextJob
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PLLocalVideoKeyFrameJobQueue popNextJobToRun](self->_jobQueue, "popNextJobToRun");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryBundles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        objc_msgSend(v11, "pathManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PLLibraryIDFromPathManager();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "libraryID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) != 0)
          break;

        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v11, "libraryServicesManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "databaseContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "newShortLivedLibraryWithName:", "-[PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe _runNextJob]");

      if (!v18)
        goto LABEL_13;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __65__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__runNextJob__block_invoke;
      v26[3] = &unk_1E3677530;
      v27 = v3;
      v28 = v18;
      v29 = self;
      v19 = v18;
      objc_msgSend(v19, "performBlock:", v26);

      v20 = v27;
    }
    else
    {
LABEL_10:

LABEL_13:
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0D74498];
      v34 = *MEMORY[0x1E0CB2938];
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "libraryID");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Could not find photo library bundle for libraryID: %@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 47001, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe _handleJobFinished:withMutatedMoc:error:storedRecipes:affectedRecipes:sourceMetadata:](self, "_handleJobFinished:withMutatedMoc:error:storedRecipes:affectedRecipes:sourceMetadata:", v3, 0, v25, 0, 0, 0);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobQueue, 0);
}

void __65__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__runNextJob__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1[4], "assetObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("self == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  objc_msgSend(a1[5], "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v4, &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v29;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PLImageManagerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "[key frame] generating key frame for dequeued job for asset: %@", buf, 0xCu);

    }
    v15 = a1[6];
    v16 = objc_msgSend(a1[4], "networkAccessAllowed");
    objc_msgSend(a1[4], "clientBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__runNextJob__block_invoke_188;
    v25[3] = &unk_1E366B460;
    v18 = a1[5];
    v19 = a1[6];
    v26 = v18;
    v27 = v19;
    v28 = a1[4];
    objc_msgSend(v15, "_generateAndStoreForAsset:networkAccessAllowed:clientBundleID:progress:completion:", v11, v16, v17, 0, v25);

    v20 = v26;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[4], "assetObjectID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      v32 = 2112;
      v33 = v10;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "[key frame] Could not find asset object ID: %{public}@, error: %@", buf, 0x16u);

    }
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1[4], "assetObjectID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Could not find asset objectID: %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)PLErrorCreate();

    objc_msgSend(a1[6], "_handleJobFinished:withMutatedMoc:error:storedRecipes:affectedRecipes:sourceMetadata:", a1[4], 0, v20, 0, 0, 0);
  }

}

void __65__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__runNextJob__block_invoke_188(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v16 = a2;
  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "managedObjectContext");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v16;
  }
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 40), "_handleJobFinished:withMutatedMoc:error:storedRecipes:affectedRecipes:sourceMetadata:", *(_QWORD *)(a1 + 48), v15, v12, v11, v10, 0);
}

void __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleKeyFrameGeneratedWithAsset:destinationURL:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E40]);
    (*(void (**)(uint64_t, _QWORD, id, id, id))(v5 + 16))(v5, 0, v8, v6, v7);

  }
}

void __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke_175(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a6;
  PLImageManagerGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "[key frame] attempting to generate local video key frame from streaming url: %@", buf, 0xCu);
    }

    v12 = (void *)objc_opt_class();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke_176;
    v18[3] = &unk_1E366D498;
    v13 = *(_QWORD *)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 40);
    v21 = *(id *)(a1 + 56);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 64);
    v23 = *(_QWORD *)(a1 + 80);
    objc_msgSend(v12, "generateKeyFrameFromVideoURL:destinationURL:time:completion:", v8, v13, buf, v18);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "debugDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "[key frame] streaming request failed with error: %{public}@", buf, 0xCu);

    }
    v15 = *(_QWORD *)(a1 + 56);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v17 = objc_alloc_init(MEMORY[0x1E0C99E40]);
    (*(void (**)(uint64_t, _QWORD, id, id, id))(v15 + 16))(v15, 0, v9, v16, v17);

  }
}

void __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke_176(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleKeyFrameGeneratedWithAsset:destinationURL:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E40]);
    (*(void (**)(uint64_t, _QWORD, id, id, id))(v5 + 16))(v5, 0, v8, v6, v7);

  }
}

void __114__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__handleKeyFrameGeneratedWithAsset_destinationURL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  _BOOL4 v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  id v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  const __CFString *v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistedResourcesWithRecipeID:andVersion:", 65749, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isLocallyAvailable");
  objc_msgSend(*(id *)(a1 + 40), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "width");
  v7 = objc_msgSend(*(id *)(a1 + 32), "height");
  v8 = *(_QWORD *)(a1 + 48);
  v9 = objc_msgSend(*(id *)(a1 + 32), "kind");
  v53 = 0;
  LOWORD(v48) = v9;
  +[PLResourceInstaller generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:](PLResourceInstaller, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v5, 1, 3, v6, v7, v8, v48, &v53);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v53;

  if (!v10)
  {
    v18 = PLIsErrorFileNotFound();
    PLImageManagerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v19)
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v20;
        v21 = "[key frame] unable to create external resource for asset: %{public}@ because file not found";
        v22 = v14;
        v23 = 12;
LABEL_12:
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);

      }
    }
    else if (v19)
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v20;
      v59 = 2112;
      v60 = v11;
      v21 = "[key frame] unable to create external resource for asset: %{public}@, error: %@";
      v22 = v14;
      v23 = 22;
      goto LABEL_12;
    }
    v16 = 0;
    v17 = 0;
    v15 = v11;
    goto LABEL_14;
  }
  v56 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v52 = v11;
  +[PLResourceDataStoreManager storeExternalResources:forAsset:forLifecycleEvent:error:](PLResourceDataStoreManager, "storeExternalResources:forAsset:forLifecycleEvent:error:", v12, v13, 2, &v52);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v52;

  if (-[NSObject count](v14, "count"))
  {
    -[NSObject anyObject](v14, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 1;
  }
  else
  {
    PLImageManagerGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v25;
      v59 = 2112;
      v60 = v15;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "[key frame] failed to store resource for asset: %{public}@, error: %@", buf, 0x16u);

    }
    v16 = 0;
    v17 = 0;
  }
LABEL_14:

  v50 = 0;
  v51 = 0;
  v26 = +[PLCacheDeleteSupport markPurgeableForFileAtURL:withUrgency:outInode:error:](PLCacheDeleteSupport, "markPurgeableForFileAtURL:withUrgency:outInode:error:", *(_QWORD *)(a1 + 40), 2, &v51, &v50);
  v27 = v50;
  if (v26)
  {
    if (!v17)
      goto LABEL_23;
    objc_msgSend(v16, "setFileID:", v51);
  }
  else if ((PLIsErrorFileNotFound() & 1) == 0)
  {
    PLImageManagerGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v29;
      v59 = 2112;
      v60 = v27;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "[key frame] mark purgeable file failed, may not be purgeable, for asset: %{public}@, error: %@", buf, 0x16u);

    }
  }
  if (((v17 ^ 1 | v4) & 1) == 0)
  {
    v30 = *(void **)(a1 + 32);
    objc_msgSend(v16, "dataStoreKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "recalculateImageRequestHintsForResource:afterLocalAvailabilityChangeFrom:previousDataStoreKey:", v16, 0xFFFFFFFFLL, v31);

  }
LABEL_23:
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "hasChanges");

  if (!v33)
  {
    v36 = v15;
LABEL_30:
    if ((v17 & 1) != 0)
      goto LABEL_37;
    goto LABEL_35;
  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v15;
  v35 = objc_msgSend(v34, "save:", &v49);
  v36 = v49;

  if (v35)
  {
    if (v17)
    {
      PLImageManagerGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v38;
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_INFO, "[key frame] successfully generated key frame for asset: %{public}@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 48));
      goto LABEL_37;
    }
    goto LABEL_30;
  }
  PLImageManagerGetLog();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v40;
    v59 = 2112;
    v60 = v36;
    _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "[key frame] failed to save key frame resource changes for asset: %{public}@, error: %@", buf, 0x16u);

  }
LABEL_35:
  if (!v36)
  {
    v41 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0D74600];
    v54 = *MEMORY[0x1E0CB2938];
    v55 = CFSTR("unknown error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "errorWithDomain:code:userInfo:", v42, 1, v43);
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_37:
  v46 = a1 + 56;
  v44 = *(_QWORD *)(a1 + 56);
  v45 = *(_QWORD *)(v46 + 8);
  v47 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  (*(void (**)(uint64_t, _QWORD, id, uint64_t, id))(v45 + 16))(v45, 0, v36, v44, v47);

}

+ (void)generateKeyFrameFromVideoURL:(id)a3 time:(id *)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", v8);
  objc_msgSend(v9, "setAppliesPreferredTrackTransform:", 1);
  v20 = *MEMORY[0x1E0CA2E68];
  v14 = v20;
  v21 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v10 = v21;
  objc_msgSend(v9, "setRequestedTimeToleranceAfter:", &v20);
  v18 = v14;
  v19 = v10;
  objc_msgSend(v9, "setRequestedTimeToleranceBefore:", &v18);
  v17 = *a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe_generateKeyFrameFromVideoURL_time_completion___block_invoke;
  v15[3] = &unk_1E366B3E8;
  v16 = v7;
  v13 = v7;
  objc_msgSend(v9, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v12, v15);

}

+ (void)generateKeyFrameFromVideoURL:(id)a3 destinationURL:(id)a4 time:(id *)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CMTime time;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  PLImageManagerGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    time = (CMTime)*a5;
    v14 = (__CFString *)CMTimeCopyDescription(0, &time);
    LODWORD(time.value) = 138543618;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v14;
    LOWORD(time.flags) = 2112;
    *(_QWORD *)((char *)&time.flags + 2) = v10;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "[key frame] Image generator copying image at time: %{public}@ to destination: %@", (uint8_t *)&time, 0x16u);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __114__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe_generateKeyFrameFromVideoURL_destinationURL_time_completion___block_invoke;
  v17[3] = &unk_1E366B410;
  v18 = v10;
  v19 = v11;
  time = (CMTime)*a5;
  v15 = v11;
  v16 = v10;
  objc_msgSend(a1, "generateKeyFrameFromVideoURL:time:completion:", v12, &time, v17);

}

void __114__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe_generateKeyFrameFromVideoURL_destinationURL_time_completion___block_invoke(uint64_t a1, CGImage *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  const __CFURL *v11;
  __CFString *v12;
  CGImageDestination *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v9 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v25);
    v10 = v25;

    if (v9)
    {
      v11 = *(const __CFURL **)(a1 + 32);
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v13 = CGImageDestinationCreateWithURL(v11, v12, 1uLL, 0);

      if (v13)
      {
        CGImageDestinationAddImage(v13, a2, 0);
        if (CGImageDestinationFinalize(v13))
        {
          PLImageManagerGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "[key frame] wrote image to local video key frame", buf, 2u);
          }

          CFRelease(v13);
          goto LABEL_14;
        }
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v20 = *MEMORY[0x1E0D74498];
        v30 = *MEMORY[0x1E0CB2938];
        v31[0] = CFSTR("Failed to generate local video key frame, destination finalization failed");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 47001, v21);
        v22 = objc_claimAutoreleasedReturnValue();

        CFRelease(v13);
        v10 = (id)v22;
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *MEMORY[0x1E0D74498];
        v28 = *MEMORY[0x1E0CB2938];
        v29 = CFSTR("Failed to generate local video key frame, failed to create image destination");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 47001, v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v18;
      }
    }
  }
  else
  {
    v10 = v5;
  }
  PLImageManagerGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v10, "debugDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v24;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "[key frame] failed with error: %{public}@", buf, 0xCu);

  }
LABEL_14:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __99__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe_generateKeyFrameFromVideoURL_time_completion___block_invoke(uint64_t a1, uint64_t a2, CGImage *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = v9;
  if (a5 == 1)
  {
    if (!v9)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D74498];
      v21 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image generator failed to generate image"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 47001, v19);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!a5)
  {
    if (a3)
    {
      CGImageRetain(a3);
      PFCGImageApplyTemporaryAVAssetImageGeneratorColorSpaceWorkaround();
      goto LABEL_5;
    }
    if (!v9)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D74498];
      v23 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image generator returned success but image is NULL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 47001, v15);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
LABEL_11:
    v11 = v9;
    goto LABEL_12;
  }
LABEL_5:
  v11 = 0;
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CGImageRelease(a3);

}

@end

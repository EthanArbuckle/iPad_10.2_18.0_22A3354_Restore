@implementation PUCompositeVideoGenerator

- (PUCompositeVideoGenerator)initWithAssets:(id)a3 outputType:(int64_t)a4 onlyAllowOverlappingAssets:(BOOL)a5
{
  return -[PUCompositeVideoGenerator initWithAssets:outputType:onlyAllowOverlappingAssets:dataCache:](self, "initWithAssets:outputType:onlyAllowOverlappingAssets:dataCache:", a3, a4, a5, 0);
}

- (PUCompositeVideoGenerator)initWithAssets:(id)a3 outputType:(int64_t)a4 onlyAllowOverlappingAssets:(BOOL)a5 dataCache:(id)a6
{
  id v10;
  id v11;
  PUCompositeVideoGenerator *v12;
  PUCompositeVideoGenerator *v13;
  uint64_t v14;
  NSArray *assets;
  dispatch_group_t v16;
  OS_dispatch_group *videoAssetsByAssetGroup;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *stateQueue;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *workQueue;
  objc_super v25;

  v10 = a3;
  v11 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PUCompositeVideoGenerator;
  v12 = -[PUCompositeVideoGenerator init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataCache, a6);
    v13->_outputType = a4;
    v13->_onlyAllowOverlappingAssets = a5;
    v14 = objc_msgSend(v10, "copy");
    assets = v13->_assets;
    v13->_assets = (NSArray *)v14;

    v16 = dispatch_group_create();
    videoAssetsByAssetGroup = v13->_videoAssetsByAssetGroup;
    v13->_videoAssetsByAssetGroup = (OS_dispatch_group *)v16;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.photos.composite-video-generator.state", v18);
    stateQueue = v13->_stateQueue;
    v13->_stateQueue = (OS_dispatch_queue *)v19;

    dispatch_queue_attr_make_with_autorelease_frequency(v18, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.photos.composite-video-generator.work", v21);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v22;

  }
  return v13;
}

- (PUCompositeVideoGenerator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCompositeVideoGenerator.m"), 73, CFSTR("%s is not available as initializer"), "-[PUCompositeVideoGenerator init]");

  abort();
}

- (int64_t)state
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PUCompositeVideoGenerator_state__block_invoke;
  v5[3] = &unk_1E58AAE48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (PUMergedLivePhotosVideo)playbackVideo
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__95016;
  v10 = __Block_byref_object_dispose__95017;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PUCompositeVideoGenerator_playbackVideo__block_invoke;
  v5[3] = &unk_1E58AAE48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PUMergedLivePhotosVideo *)v3;
}

- (AVAssetExportSession)exportSession
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__95016;
  v10 = __Block_byref_object_dispose__95017;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PUCompositeVideoGenerator_exportSession__block_invoke;
  v5[3] = &unk_1E58AAE48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVAssetExportSession *)v3;
}

- (NSError)error
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__95016;
  v10 = __Block_byref_object_dispose__95017;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PUCompositeVideoGenerator_error__block_invoke;
  v5[3] = &unk_1E58AAE48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (void)start
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__PUCompositeVideoGenerator_start__block_invoke;
  v4[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setState:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__PUCompositeVideoGenerator_setState___block_invoke;
  v3[3] = &unk_1E58A9288;
  v3[4] = self;
  v3[5] = a3;
  -[PUCompositeVideoGenerator performChanges:](self, "performChanges:", v3);
}

- (void)setPlaybackVideo:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PUCompositeVideoGenerator_setPlaybackVideo___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

- (void)setExportSession:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PUCompositeVideoGenerator_setExportSession___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

- (void)setError:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PUCompositeVideoGenerator_setError___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

- (void)_workQueue_start
{
  NSObject *v3;
  char *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  NSObject *workQueue;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *spid;
  NSObject *v36;
  void *ptr;
  id obj;
  PUCompositeVideoGenerator *v39;
  id v40;
  OS_dispatch_group *group;
  _QWORD block[4];
  NSObject *v43;
  PUCompositeVideoGenerator *v44;
  id v45;
  id v46;
  id v47;
  id v48[2];
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  id v52;
  OS_dispatch_group *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  NSObject *v59;
  id v60[2];
  _QWORD v61[5];
  NSObject *v62;
  id v63[2];
  uint8_t buf[8];
  id location;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (!-[PUCompositeVideoGenerator state](self, "state"))
  {
    -[PUCompositeVideoGenerator setState:](self, "setState:", 1);
    v39 = self;
    objc_initWeak(&location, self);
    group = self->_videoAssetsByAssetGroup;
    -[PUCompositeVideoGenerator assets](self, "assets");
    ptr = (void *)objc_claimAutoreleasedReturnValue();
    PLLivePhotoPlaybackGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (char *)os_signpost_id_make_with_pointer(v3, ptr);
    v5 = v3;
    v6 = v5;
    spid = v4;
    v36 = v5;
    if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
    {

      v7 = v36;
      v9 = v36;
    }
    else
    {
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "CompositeVideoGenerationProcessing", ", buf, 2u);
      }

      v7 = v36;
      v8 = v36;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "CompositeVideoFetches", ", buf, 2u);
      }
    }

    v40 = objc_alloc_init(MEMORY[0x1E0CD1808]);
    objc_msgSend(v40, "setVideoComplementAllowed:", 1);
    objc_msgSend(v40, "setStreamingAllowed:", 0);
    objc_msgSend(v40, "setNetworkAccessAllowed:", 1);
    if (objc_msgSend(ptr, "count") == 1)
    {
      v10 = -[PUCompositeVideoGenerator outputType](v39, "outputType");
      if (v10)
      {
        if (v10 == 1)
        {
          objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(ptr, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_147;
          v58[3] = &unk_1E58A9300;
          v58[4] = v39;
          v59 = v36;
          v60[1] = v4;
          objc_copyWeak(v60, &location);
          objc_msgSend(v11, "requestExportSessionForVideo:options:exportPreset:resultHandler:", v12, v40, *MEMORY[0x1E0C89E98], v58);

          objc_destroyWeak(v60);
        }
      }
      else
      {
        objc_msgSend(v40, "setDownloadIntent:", 3);
        objc_msgSend(v40, "setDownloadPriority:", 0);
        objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(ptr, "objectAtIndexedSubscript:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke;
        v61[3] = &unk_1E58A92D8;
        v61[4] = v39;
        v62 = v36;
        v63[1] = v4;
        objc_copyWeak(v63, &location);
        objc_msgSend(v30, "requestPlayerItemForVideo:options:resultHandler:", v31, v40, v61);

        objc_destroyWeak(v63);
      }
    }
    else if ((unint64_t)objc_msgSend(ptr, "count") < 2)
    {
      v27 = v36;
      v28 = v27;
      if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
      {

        v32 = v28;
      }
      else
      {
        if (os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AAB61000, v28, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v4, "CompositeVideoFetches", ", buf, 2u);
        }

        v29 = v28;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AAB61000, v29, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v4, "CompositeVideoGenerationProcessing", ", buf, 2u);
        }
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0D7CED0], -1, CFSTR("Unable to generate merged live photo video because self.assets.count == 0"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_loadWeakRetained(&location);
      objc_msgSend(v34, "_workQueue_finishWithError:", v33);

    }
    else
    {
      if (-[PUCompositeVideoGenerator outputType](v39, "outputType") == 1)
        objc_msgSend(v40, "setDeliveryMode:", 1);
      v13 = objc_alloc(MEMORY[0x1E0C99E08]);
      -[PUCompositeVideoGenerator assets](v39, "assets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

      v16 = objc_alloc(MEMORY[0x1E0C99E08]);
      -[PUCompositeVideoGenerator assets](v39, "assets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = ptr;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v55 != v20)
              objc_enumerationMutation(obj);
            v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            dispatch_group_enter((dispatch_group_t)group);
            objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_151;
            v49[3] = &unk_1E58A9350;
            v49[4] = v39;
            v50 = v15;
            v51 = v22;
            v52 = v18;
            v53 = group;
            objc_msgSend(v23, "requestAVAssetForVideo:options:resultHandler:", v22, v40, v49);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        }
        while (v19);
      }

      workQueue = v39->_workQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_3;
      block[3] = &unk_1E58A9378;
      v43 = v36;
      v44 = v39;
      v48[1] = spid;
      v45 = v15;
      v46 = obj;
      v25 = v15;
      objc_copyWeak(v48, &location);
      v47 = v18;
      v26 = v18;
      dispatch_group_notify((dispatch_group_t)group, workQueue, block);

      objc_destroyWeak(v48);
    }

    objc_destroyWeak(&location);
  }
}

- (void)_workQueue_generateVideoWithSingleAssetPlayerItem:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PUMergedLivePhotosVideo *v21;
  void *v22;
  void *v23;
  void *v24;
  PUMergedLivePhotosVideo *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  os_signpost_id_t spid;
  unint64_t v30;
  PUCompositeVideoGenerator *v31;
  _QWORD v32[3];
  uint8_t buf[16];
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCompositeVideoGenerator.m"), 326, CFSTR("%s must NOT be called on the main thread"), "-[PUCompositeVideoGenerator _workQueue_generateVideoWithSingleAssetPlayerItem:]");

  }
  PLLivePhotoPlaybackGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  -[PUCompositeVideoGenerator assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v6, v7);

  v9 = v6;
  v10 = v9;
  v30 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CompositeVideoGeneration", ", buf, 2u);
  }
  spid = v8;

  v31 = self;
  -[PUCompositeVideoGenerator assets](self, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
  v34 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", buf);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3B18];
  if (v12)
    objc_msgSend(v12, "photoIrisStillDisplayTime");
  else
    memset(v32, 0, sizeof(v32));
  objc_msgSend(v15, "valueWithCMTime:", v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "asset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = objc_msgSend(v18, "pu_supportsVitality") ^ 1;
  else
    v20 = 0;

  v21 = [PUMergedLivePhotosVideo alloc];
  v35 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoComposition");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "aspectRatio");
  v25 = -[PUMergedLivePhotosVideo initWithAssets:startTimes:keyTimes:videoAsset:videoComposition:videoAspectRatio:options:](v21, "initWithAssets:startTimes:keyTimes:videoAsset:videoComposition:videoAspectRatio:options:", v22, v14, v17, v23, v24, v20);

  -[PUCompositeVideoGenerator _workQueue_finishWithPlaybackVideo:error:](v31, "_workQueue_finishWithPlaybackVideo:error:", v25, 0);
  v26 = v10;
  v27 = v26;
  if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v27, OS_SIGNPOST_INTERVAL_END, spid, "CompositeVideoGeneration", ", buf, 2u);
  }

}

- (void)_workQueue_generateVideoWithSingleAssetExportSession:(id)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  if (objc_msgSend(v5, "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCompositeVideoGenerator.m"), 343, CFSTR("%s must NOT be called on the main thread"), "-[PUCompositeVideoGenerator _workQueue_generateVideoWithSingleAssetExportSession:]");

  }
  PLLivePhotoPlaybackGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  -[PUCompositeVideoGenerator assets](self, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v7, v8);

  v10 = v7;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CompositeVideoGeneration", ", buf, 2u);
  }

  objc_msgSend(v6, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXFilter();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetadata:", v14);

  -[PUCompositeVideoGenerator _workQueue_finishWithExportSession:error:](self, "_workQueue_finishWithExportSession:error:", v6, 0);
  v15 = v11;
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v16, OS_SIGNPOST_INTERVAL_END, v9, "CompositeVideoGeneration", ", v18, 2u);
  }

}

- (void)_workQueue_generateVideoWithAVAssets:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  id v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  CGFloat c;
  CMTimeFlags b_high;
  NSCache *dataCache;
  void *v46;
  NSObject *v47;
  int v48;
  int v49;
  id v50;
  int v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  CGFloat v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  _BOOL4 v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  NSObject *v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  unint64_t v84;
  CGFloat v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v98;
  int64_t v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  PUMergedLivePhotosVideo *v111;
  NSObject *v112;
  NSObject *v113;
  void *v114;
  os_signpost_id_t spid;
  NSObject *v116;
  unint64_t v117;
  CMTimeFlags v118;
  void *v119;
  void *v120;
  void *v121;
  id obj;
  PUCompositeVideoGenerator *v123;
  PUCompositeVideoGenerator *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  CGFloat v132;
  __int128 v133;
  id v134;
  __int128 v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  __int128 v142;
  id v143;
  id v144;
  CMTime v145;
  CMTime v146;
  CMTimeRange v147;
  CMTimeRange v148;
  _OWORD v149[3];
  __int128 v150;
  __int128 v151;
  __int128 v152;
  CGAffineTransform t2;
  id v154;
  CGAffineTransform end;
  CGAffineTransform v156;
  id v157;
  CGAffineTransform duration;
  CGAffineTransform start;
  CMTime rhs;
  CMTime lhs;
  CMTime v162;
  CMTime v163;
  __int128 v164;
  CGFloat v165;
  __int128 v166;
  CGFloat v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  void *v172;
  __int128 v173;
  CGFloat v174;
  CMTimeValue v175;
  CMTimeScale b_low;
  _QWORD v177[3];
  CGAffineTransform buf;
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCompositeVideoGenerator.m"), 362, CFSTR("%s must NOT be called on the main thread"), "-[PUCompositeVideoGenerator _workQueue_generateVideoWithAVAssets:]");

  }
  PLLivePhotoPlaybackGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  -[PUCompositeVideoGenerator assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v6, v7);

  v9 = v6;
  v10 = v9;
  spid = v8;
  v117 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CompositeVideoGeneration", ", (uint8_t *)&buf, 2u);
  }
  v116 = v10;

  -[PUCompositeVideoGenerator assets](self, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
  v138 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v121 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v14 = objc_alloc_init(MEMORY[0x1E0C8B268]);
  v129 = *MEMORY[0x1E0C8A808];
  objc_msgSend(v14, "addMutableTrackWithMediaType:preferredTrackID:");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v14;
  v127 = *MEMORY[0x1E0C8A7A0];
  objc_msgSend(v14, "addMutableTrackWithMediaType:preferredTrackID:");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0C9D820];
  v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  -[PUCompositeVideoGenerator assets](self, "assets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v130 = v13;
  v126 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, v179, 16);
  if (!v126)
  {
    v131 = 0;
    v17 = 0;
    goto LABEL_70;
  }
  v131 = 0;
  v17 = 0;
  v128 = *(_QWORD *)v169;
  v118 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  v132 = *(double *)(MEMORY[0x1E0CA2E18] + 16);
  v18 = 0x1E0D75000uLL;
  v123 = self;
  while (2)
  {
    v139 = v17;
    v19 = 0;
    v20 = v15;
    v21 = v16;
    v22 = v125;
    do
    {
      if (*(_QWORD *)v169 != v128)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v19);
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v15 = v20;
        v16 = v21;
LABEL_66:
        self = v123;
        v17 = v139;
        goto LABEL_70;
      }
      v25 = (void *)v24;
      objc_msgSend(*(id *)(v18 + 304), "tracksWithMediaType:forAsset:", v129, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        PLLivePhotoPlaybackGetLog();
        v59 = objc_claimAutoreleasedReturnValue();
        self = v123;
        v17 = v139;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.a) = 138412290;
          *(_QWORD *)((char *)&buf.a + 4) = v25;
          _os_log_impl(&dword_1AAB61000, v59, OS_LOG_TYPE_ERROR, "Encountered an asset with no video track: %@", (uint8_t *)&buf, 0xCu);
        }

        v15 = v20;
        v16 = v21;
        goto LABEL_70;
      }
      objc_msgSend(*(id *)(v18 + 304), "tracksWithMediaType:forAsset:", v127, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v141 = (void *)objc_claimAutoreleasedReturnValue();

      v166 = 0uLL;
      v167 = 0.0;
      objc_msgSend(v25, "duration");
      v164 = 0uLL;
      v165 = 0.0;
      objc_msgSend(v13, "lastObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUCompositeVideoGenerator _overlapDurationBetweenAsset:andAsset:](PUCompositeVideoGenerator, "_overlapDurationBetweenAsset:andAsset:", v29, v23);

      memset(&v163, 0, sizeof(v163));
      if (v22)
        objc_msgSend(v22, "duration");
      else
        memset(&lhs, 0, sizeof(lhs));
      *(_OWORD *)&buf.a = v164;
      buf.c = v165;
      CMTimeSubtract(&v162, &lhs, (CMTime *)&buf);
      if (v23)
        objc_msgSend(v23, "photoIrisStillDisplayTime");
      else
        memset(&rhs, 0, sizeof(rhs));
      CMTimeAdd(&v163, &v162, &rhs);
      objc_msgSend(v27, "px_transformedNaturalSize");
      v31 = v30;
      v33 = v32;
      memset(&buf, 0, sizeof(buf));
      v133 = *MEMORY[0x1E0CA2E68];
      *(_OWORD *)&start.a = *MEMORY[0x1E0CA2E68];
      v34 = *(double *)(MEMORY[0x1E0CA2E68] + 16);
      start.c = v34;
      *(_OWORD *)&duration.a = v166;
      duration.c = v167;
      CMTimeRangeMake((CMTimeRange *)&buf, (CMTime *)&start, (CMTime *)&duration);
      v15 = v33;
      v16 = v31;
      if (objc_msgSend(v13, "count"))
      {
        *(_OWORD *)&start.a = v164;
        start.c = v165;
        *(_OWORD *)&duration.a = v133;
        duration.c = v34;
        if (CMTimeCompare((CMTime *)&start, (CMTime *)&duration) < 1)
        {
          if (-[PUCompositeVideoGenerator onlyAllowOverlappingAssets](v123, "onlyAllowOverlappingAssets")
            && objc_msgSend(v13, "count"))
          {
            goto LABEL_43;
          }
LABEL_49:
          v15 = v20;
          v16 = v21;
          goto LABEL_50;
        }
        memset(&duration, 0, 24);
        if (v131)
          objc_msgSend(v131, "duration");
        *(_QWORD *)&v173 = *MEMORY[0x1E0CA2E18];
        DWORD2(v173) = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v134 = v5;
          v35 = objc_alloc(MEMORY[0x1E0D7CD90]);
          *(_OWORD *)&start.a = *(_OWORD *)&duration.a;
          start.c = duration.c;
          v36 = (__CFString *)CMTimeCopyDescription(0, (CMTime *)&start);
          v177[0] = v36;
          objc_msgSend(v131, "URL");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v177[1] = v37;
          objc_msgSend(v25, "URL");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v177[2] = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v35, "initWithObjects:", v39);

          -[NSCache objectForKey:](v123->_dataCache, "objectForKey:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          c = v132;
          b_high = v118;
          if (v41)
          {
            objc_msgSend(v41, "CMTimeValue");
            *(CGFloat *)&v173 = start.a;
            b_high = HIDWORD(start.b);
            DWORD2(v173) = LODWORD(start.b);
            c = start.c;
          }

          v5 = v134;
          if ((b_high & 1) != 0)
            goto LABEL_32;
        }
        else
        {
          v40 = 0;
          c = v132;
          b_high = v118;
          if ((v118 & 1) != 0)
          {
LABEL_32:
            if ((b_high & 1) != 0)
            {
              *(_QWORD *)&v156.a = v173;
              *(_QWORD *)&v156.b = __PAIR64__(b_high, DWORD2(v173));
              v156.c = c;
            }
            else
            {
              *(_OWORD *)&v156.a = v164;
              v156.c = v165;
            }
            *(_OWORD *)&end.a = v166;
            end.c = v167;
            CMTimeRangeFromTimeToTime((CMTimeRange *)&start, (CMTime *)&v156, (CMTime *)&end);
            v175 = *(_QWORD *)&start.a;
            b_low = LODWORD(start.b);
            v13 = v130;
            v22 = v125;
            if ((BYTE4(start.b) & 1) == 0
              || (BYTE4(start.tx) & 1) == 0
              || *(_QWORD *)&start.ty
              || (*(_QWORD *)&start.d & 0x8000000000000000) != 0)
            {
              if (-[PUCompositeVideoGenerator onlyAllowOverlappingAssets](v123, "onlyAllowOverlappingAssets"))
              {
                PLLivePhotoPlaybackGetLog();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(start.a) = 0;
                  _os_log_impl(&dword_1AAB61000, v47, OS_LOG_TYPE_DEBUG, "Adjusted time range is invalid. Overlapping LP generation will stop.", (uint8_t *)&start, 2u);
                }

LABEL_43:
                v48 = 6;
                v15 = v20;
                v16 = v21;
                goto LABEL_60;
              }
            }
            else
            {
              *(_QWORD *)&buf.a = v175;
              LODWORD(buf.b) = b_low;
              HIDWORD(buf.b) = HIDWORD(start.b);
              *(_OWORD *)&buf.c = *(_OWORD *)&start.c;
              *(_OWORD *)&buf.tx = *(unint64_t *)&start.tx;
            }

            goto LABEL_49;
          }
        }
        *(_OWORD *)&v156.a = *(_OWORD *)&duration.a;
        v156.c = duration.c;
        objc_msgSend(MEMORY[0x1E0D75318], "convertTime:fromAsset:toAsset:", &v156, v131, v25);
        *(CGFloat *)&v173 = start.a;
        b_high = HIDWORD(start.b);
        DWORD2(v173) = LODWORD(start.b);
        c = start.c;
        if (v40)
        {
          dataCache = v123->_dataCache;
          *(_QWORD *)&start.a = v173;
          LODWORD(start.b) = DWORD2(v173);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &start);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache setObject:forKey:](dataCache, "setObject:forKey:", v46, v40);

        }
        goto LABEL_32;
      }
LABEL_50:
      v173 = 0uLL;
      v174 = 0.0;
      if (v22)
        objc_msgSend(v22, "duration");
      memset(&start, 0, sizeof(start));
      objc_msgSend(v27, "timeRange");
      duration = buf;
      PXConformCMTimeRangeWithinRange();
      v157 = v139;
      duration = start;
      v135 = *MEMORY[0x1E0CA2E18];
      *(_OWORD *)&v156.a = *MEMORY[0x1E0CA2E18];
      v156.c = v132;
      v49 = objc_msgSend(v140, "insertTimeRange:ofTrack:atTime:error:", &duration, v27, &v156, &v157);
      v50 = v157;

      if (v49)
      {
        if (v141)
        {
          memset(&duration, 0, sizeof(duration));
          objc_msgSend(v141, "timeRange");
          v156 = buf;
          PXConformCMTimeRangeWithinRange();
          objc_msgSend(v27, "timeRange");
          end = duration;
          PXConformCMTimeRangeWithinRange();
          duration = v156;
          v154 = v50;
          *(_OWORD *)&end.a = v135;
          end.c = v132;
          v51 = objc_msgSend(v119, "insertTimeRange:ofTrack:atTime:error:", &v156, v141, &end, &v154);
          v52 = v154;

          if (!v51)
          {
            v48 = 6;
            v50 = v52;
            goto LABEL_59;
          }
          v50 = v52;
        }
        objc_msgSend(v13, "addObject:", v23);
        v53 = v25;

        *(_OWORD *)&duration.a = v173;
        duration.c = v174;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &duration);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setObject:forKeyedSubscript:", v54, v23);

        *(_OWORD *)&duration.a = *(_OWORD *)&v163.value;
        *(_QWORD *)&duration.c = v163.epoch;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &duration);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "setObject:forKeyedSubscript:", v55, v23);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v31, v33);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "setObject:forKeyedSubscript:", v56, v23);

        memset(&duration, 0, sizeof(duration));
        objc_msgSend(v27, "px_preferredTransformBasedOnNaturalSize");
        v57 = fmax(v16 / v31, v15 / v33);
        CGAffineTransformMakeScale(&t2, v57, v57);
        end = duration;
        CGAffineTransformConcat(&v156, &end, &t2);
        duration = v156;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", &v156);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "setObject:forKeyedSubscript:", v58, v23);

        v48 = 0;
        v131 = v53;
        v22 = v125;
      }
      else
      {
        v48 = 6;
      }
LABEL_59:
      v139 = v50;
LABEL_60:

      if (v48)
        goto LABEL_66;
      ++v19;
      v20 = v15;
      v21 = v16;
      v18 = 0x1E0D75000;
    }
    while (v126 != v19);
    self = v123;
    v17 = v139;
    v126 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, v179, 16);
    if (v126)
      continue;
    break;
  }
LABEL_70:

  if (!objc_msgSend(v13, "count") || v17)
  {
    PLLivePhotoPlaybackGetLog();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.a) = 138412290;
      *(_QWORD *)((char *)&buf.a + 4) = v17;
      _os_log_impl(&dword_1AAB61000, v63, OS_LOG_TYPE_ERROR, "Unable to generate merged live photo video with error: %@", (uint8_t *)&buf, 0xCu);
    }

    -[PUCompositeVideoGenerator _workQueue_finishWithError:](self, "_workQueue_finishWithError:", v17);
  }
  else
  {
    if ((unint64_t)objc_msgSend(v13, "count") < 2)
    {
      v64 = 1;
    }
    else
    {
      objc_msgSend(v13, "lastObject");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&buf, 0, sizeof(buf));
      objc_msgSend(v137, "objectForKeyedSubscript:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (v61)
        objc_msgSend(v61, "CGAffineTransformValue");
      else
        memset(&buf, 0, sizeof(buf));

      objc_msgSend(v121, "objectForKeyedSubscript:", v60);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "CGSizeValue");
      v67 = v66;
      v69 = v68;

      if (objc_msgSend(v13, "count") == 1)
      {
LABEL_91:
        v64 = 1;
      }
      else
      {
        v70 = 0;
        while (1)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&start, 0, sizeof(start));
          objc_msgSend(v137, "objectForKeyedSubscript:", v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v72;
          if (v72)
            objc_msgSend(v72, "CGAffineTransformValue");
          else
            memset(&start, 0, sizeof(start));

          objc_msgSend(v121, "objectForKeyedSubscript:", v71);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "CGSizeValue");
          v76 = v75;
          v78 = v77;

          duration = start;
          v156 = buf;
          if (!CGAffineTransformEqualToTransform(&duration, &v156))
            break;
          v64 = v78 == v69 && v76 == v67;

          if (!v64)
            goto LABEL_93;
          if (++v70 >= (unint64_t)(objc_msgSend(v13, "count") - 1))
            goto LABEL_91;
        }

        v64 = 0;
      }
LABEL_93:

    }
    PLLivePhotoPlaybackGetLog();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      v80 = CFSTR("false");
      if (v64)
        v80 = CFSTR("true");
      LODWORD(buf.a) = 138412290;
      *(_QWORD *)((char *)&buf.a + 4) = v80;
      _os_log_impl(&dword_1AAB61000, v79, OS_LOG_TYPE_DEBUG, "Assets have same size and transform: %@", (uint8_t *)&buf, 0xCu);
    }

    if (v64)
    {
      objc_msgSend(v13, "firstObject");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "objectForKeyedSubscript:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v82;
      if (v82)
      {
        objc_msgSend(v82, "CGAffineTransformValue");
      }
      else
      {
        v151 = 0u;
        v152 = 0u;
        v150 = 0u;
      }
      v149[0] = v150;
      v149[1] = v151;
      v149[2] = v152;
      objc_msgSend(v140, "setPreferredTransform:", v149);
      v98 = 0;
    }
    else
    {
      v124 = self;
      v136 = v5;
      v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
      if (objc_msgSend(v13, "count"))
      {
        v84 = 1;
        v142 = *MEMORY[0x1E0CA2E68];
        v85 = *(double *)(MEMORY[0x1E0CA2E68] + 16);
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v84 - 1);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (v84 >= objc_msgSend(v13, "count"))
          {
            v87 = 0;
          }
          else
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v84);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(MEMORY[0x1E0C8B298], "videoCompositionLayerInstructionWithAssetTrack:", v140);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&buf, 0, sizeof(buf));
          objc_msgSend(v137, "objectForKeyedSubscript:", v86);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v89;
          if (v89)
            objc_msgSend(v89, "CGAffineTransformValue");
          else
            memset(&buf, 0, sizeof(buf));

          start = buf;
          *(_OWORD *)&duration.a = v142;
          duration.c = v85;
          objc_msgSend(v88, "setTransform:atTime:", &start, &duration);
          memset(&start, 0, 24);
          objc_msgSend(v138, "objectForKeyedSubscript:", v86);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = v91;
          if (v91)
            objc_msgSend(v91, "CMTimeValue");
          else
            memset(&start, 0, 24);

          memset(&duration, 0, 24);
          if (v87)
          {
            objc_msgSend(v138, "objectForKeyedSubscript:", v87);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v93;
            if (v93)
              objc_msgSend(v93, "CMTimeValue");
            else
              memset(&duration, 0, 24);

          }
          else
          {
            *(_OWORD *)&duration.a = *MEMORY[0x1E0CA2E30];
            duration.c = *(CGFloat *)(MEMORY[0x1E0CA2E30] + 16);
          }
          *(_OWORD *)&end.a = *(_OWORD *)&start.a;
          end.c = start.c;
          CMTimeConvertScale((CMTime *)&v156, (CMTime *)&end, 600, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          *(_OWORD *)&start.a = *(_OWORD *)&v156.a;
          start.c = v156.c;
          *(_OWORD *)&end.a = *(_OWORD *)&duration.a;
          end.c = duration.c;
          CMTimeConvertScale((CMTime *)&v156, (CMTime *)&end, 600, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          *(_OWORD *)&duration.a = *(_OWORD *)&v156.a;
          duration.c = v156.c;
          objc_msgSend(MEMORY[0x1E0C8B290], "videoCompositionInstruction");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v172 = v88;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v172, 1);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "setLayerInstructions:", v96);

          *(_OWORD *)&v156.a = *(_OWORD *)&start.a;
          v156.c = start.c;
          *(_OWORD *)&end.a = *(_OWORD *)&duration.a;
          end.c = duration.c;
          CMTimeRangeFromTimeToTime(&v148, (CMTime *)&v156, (CMTime *)&end);
          v147 = v148;
          objc_msgSend(v95, "setTimeRange:", &v147);
          objc_msgSend(v81, "addObject:", v95);

          v13 = v130;
        }
        while (v84++ < objc_msgSend(v130, "count"));
      }
      objc_msgSend(MEMORY[0x1E0C8B288], "videoComposition");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setRenderSize:", v16, v15);
      CMTimeMake(&v146, 1, 30);
      v145 = v146;
      objc_msgSend(v98, "setFrameDuration:", &v145);
      v83 = (void *)objc_msgSend(v81, "copy");
      objc_msgSend(v98, "setInstructions:", v83);
      v5 = v136;
      self = v124;
    }

    v99 = -[PUCompositeVideoGenerator outputType](self, "outputType");
    if (v99 == 1)
    {
      v107 = objc_alloc(MEMORY[0x1E0C8AFC0]);
      v108 = (void *)objc_msgSend(v125, "copy");
      v109 = (void *)objc_msgSend(v107, "initWithAsset:presetName:", v108, *MEMORY[0x1E0C89E20]);

      v110 = (void *)objc_msgSend(v98, "copy");
      objc_msgSend(v109, "setVideoComposition:", v110);

      -[PUCompositeVideoGenerator _workQueue_finishWithExportSession:error:](self, "_workQueue_finishWithExportSession:error:", v109, 0);
      goto LABEL_130;
    }
    if (!v99)
    {
      v144 = v138;
      PXMap();
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = v120;
      PXMap();
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = fabs(v16 / v15);
      objc_msgSend(v13, "firstObject");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v104;
      if (v104)
        v106 = objc_msgSend(v104, "pu_supportsVitality") ^ 1;
      else
        v106 = 0;

      v13 = v130;
      v111 = -[PUMergedLivePhotosVideo initWithAssets:startTimes:keyTimes:videoAsset:videoComposition:videoAspectRatio:options:]([PUMergedLivePhotosVideo alloc], "initWithAssets:startTimes:keyTimes:videoAsset:videoComposition:videoAspectRatio:options:", v130, v100, v101, v125, v98, v106, v102);
      -[PUCompositeVideoGenerator _workQueue_finishWithPlaybackVideo:error:](self, "_workQueue_finishWithPlaybackVideo:error:", v111, 0);

      v109 = v144;
LABEL_130:

    }
  }
  v112 = v116;
  v113 = v112;
  if (v117 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v112))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v113, OS_SIGNPOST_INTERVAL_END, spid, "CompositeVideoGeneration", ", (uint8_t *)&buf, 2u);
  }

}

- (void)_workQueue_finishWithPlaybackVideo:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  px_dispatch_on_main_queue();

}

- (void)_workQueue_finishWithExportSession:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  px_dispatch_on_main_queue();

}

- (void)_workQueue_finishWithError:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

- (NSArray)assets
{
  return self->_assets;
}

- (int64_t)outputType
{
  return self->_outputType;
}

- (BOOL)onlyAllowOverlappingAssets
{
  return self->_onlyAllowOverlappingAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_videoAssetsByAssetGroup, 0);
  objc_storeStrong((id *)&self->_stateQueue_error, 0);
  objc_storeStrong((id *)&self->_stateQueue_exportSession, 0);
  objc_storeStrong((id *)&self->_stateQueue_playbackVideo, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __56__PUCompositeVideoGenerator__workQueue_finishWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackVideo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setExportSession:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
}

uint64_t __70__PUCompositeVideoGenerator__workQueue_finishWithExportSession_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackVideo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setExportSession:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
}

uint64_t __70__PUCompositeVideoGenerator__workQueue_finishWithPlaybackVideo_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackVideo:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setExportSession:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
}

uint64_t __66__PUCompositeVideoGenerator__workQueue_generateVideoWithAVAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

uint64_t __66__PUCompositeVideoGenerator__workQueue_generateVideoWithAVAssets___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

uint64_t __82__PUCompositeVideoGenerator__workQueue_generateVideoWithSingleAssetExportSession___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "keySpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8A9E8]))
  {
    objc_msgSend(v2, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C8AA88]) ^ 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16[2];

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2;
  block[3] = &unk_1E58A92B0;
  block[1] = 3221225472;
  v9 = v7;
  v16[1] = *(id *)(a1 + 56);
  v13 = v9;
  v14 = v5;
  v10 = v5;
  objc_copyWeak(v16, (id *)(a1 + 48));
  v15 = v6;
  v11 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(v16);
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16[2];

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2_148;
  block[3] = &unk_1E58A92B0;
  block[1] = 3221225472;
  v9 = v7;
  v16[1] = *(id *)(a1 + 56);
  v13 = v9;
  v14 = v5;
  v10 = v5;
  objc_copyWeak(v16, (id *)(a1 + 48));
  v15 = v6;
  v11 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(v16);
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_151(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  v6 = a2;
  v7 = a4;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2_152;
  block[3] = &unk_1E58A9328;
  block[1] = 3221225472;
  v16 = v6;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(void **)(a1 + 56);
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v9, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *WeakRetained;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 80);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CompositeVideoFetches", ", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "outputType") == 1)
  {
    v5 = objc_msgSend(*(id *)(a1 + 48), "count");
    if (v5 == objc_msgSend(*(id *)(a1 + 56), "count"))
      goto LABEL_10;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "outputType")
    && objc_msgSend(*(id *)(a1 + 48), "count")
    && (v12 = *(void **)(a1 + 48),
        objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", 0),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "objectForKeyedSubscript:", v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
LABEL_10:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v11 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(WeakRetained, "_workQueue_generateVideoWithAVAssets:", v11);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D7CED0];
    objc_msgSend(*(id *)(a1 + 64), "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_errorWithDomain:code:underlyingError:debugDescription:", v7, -1, v9, CFSTR("Unable to generate merged live photo video because some or all of the assets can't be loaded."));
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v11, "_workQueue_finishWithError:", WeakRetained);
  }

  v15 = *(id *)(a1 + 32);
  v16 = v15;
  v17 = *(_QWORD *)(a1 + 80);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v16, OS_SIGNPOST_INTERVAL_END, v17, "CompositeVideoGenerationProcessing", ", v18, 2u);
  }

}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2_152(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 48));

  }
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2_148(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CompositeVideoFetches", ", buf, 2u);
  }

  v5 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "_workQueue_generateVideoWithSingleAssetExportSession:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_workQueue_finishWithError:", v8);

  }
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 64);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CompositeVideoGenerationProcessing", ", v12, 2u);
  }

}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CompositeVideoFetches", ", buf, 2u);
  }

  v5 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "_workQueue_generateVideoWithSingleAssetPlayerItem:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_workQueue_finishWithError:", v8);

  }
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 64);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CompositeVideoGenerationProcessing", ", v12, 2u);
  }

}

void __38__PUCompositeVideoGenerator_setError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
}

void __46__PUCompositeVideoGenerator_setExportSession___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
}

void __46__PUCompositeVideoGenerator_setPlaybackVideo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
}

void __38__PUCompositeVideoGenerator_setState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __38__PUCompositeVideoGenerator_setState___block_invoke_2;
  block[3] = &unk_1E58A9260;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 104);
  block[1] = 3221225472;
  block[5] = &v8;
  block[6] = v5;
  block[4] = v4;
  dispatch_sync(v6, block);
  if (*((_BYTE *)v9 + 24))
    objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
  _Block_object_dispose(&v8, 8);

}

_QWORD *__38__PUCompositeVideoGenerator_setState___block_invoke_2(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = result[6] != *(_QWORD *)(result[4] + 112);
  *(_QWORD *)(result[4] + 112) = result[6];
  return result;
}

void __34__PUCompositeVideoGenerator_start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workQueue_start");

}

void __34__PUCompositeVideoGenerator_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

void __42__PUCompositeVideoGenerator_exportSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

void __42__PUCompositeVideoGenerator_playbackVideo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

uint64_t __34__PUCompositeVideoGenerator_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 112);
  return result;
}

+ (BOOL)canMergeAsset:(id)a3 withConsecutiveAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  int32_t v11;
  id v12;
  int v13;
  int isKindOfClass;
  int v15;
  id v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  const char *v27;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  CMTime time2;
  CMTime time1;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    objc_msgSend(a1, "_overlapDurationBetweenAsset:andAsset:", v7, v8);
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    v11 = CMTimeCompare(&time1, &time2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "px_descriptionForAssertionMessage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUCompositeVideoGenerator.m"), 126, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("fromAsset"), v31, v32);

      }
      v13 = objc_msgSend(v12, "hasAdjustments") ^ 1;

    }
    else
    {
      v13 = 1;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v15 = (isKindOfClass ^ 1) & v13;
    if (((isKindOfClass ^ 1) & 1) == 0 && v13)
    {
      v16 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "px_descriptionForAssertionMessage");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUCompositeVideoGenerator.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("toAsset"), v35, v36);

      }
      v15 = objc_msgSend(v16, "hasAdjustments") ^ 1;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v9;
    else
      v17 = 0;
    v18 = v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v7;
    else
      v19 = 0;
    v20 = v19;
    if (v18 | v20)
    {
      objc_msgSend((id)v18, "fetchPropertySetsIfNeeded");
      objc_msgSend((id)v20, "fetchPropertySetsIfNeeded");
      if (v15)
      {
        objc_msgSend((id)v18, "photosInfoPanelExtendedProperties");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "semanticStylePreset");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v20, "photosInfoPanelExtendedProperties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "semanticStylePreset");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 == v24)
          LOBYTE(v15) = 1;
        else
          LOBYTE(v15) = objc_msgSend(v22, "isEqual:", v24);

      }
    }
    v25 = objc_msgSend(v7, "canPlayPhotoIris");
    if (v25)
      LOBYTE(v25) = objc_msgSend(v9, "canPlayPhotoIris");
    if (v11 <= 0)
    {
      PLLivePhotoPlaybackGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_38;
      LOWORD(time2.value) = 0;
      v27 = "\tAssets do not overlap.";
    }
    else
    {
      if ((v15 & 1) != 0)
      {
        if ((v25 & 1) != 0)
        {
          v10 = 1;
LABEL_39:

          goto LABEL_40;
        }
        PLLivePhotoPlaybackGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(time2.value) = 0;
          v27 = "\tAssets are not both Live Photos.";
          goto LABEL_37;
        }
LABEL_38:

        v10 = 0;
        goto LABEL_39;
      }
      PLLivePhotoPlaybackGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_38;
      LOWORD(time2.value) = 0;
      v27 = "\tAssets have adjustments.";
    }
LABEL_37:
    _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&time2, 2u);
    goto LABEL_38;
  }
LABEL_40:

  return v10;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_overlapDurationBetweenAsset:(SEL)a3 andAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  Float64 v14;
  CMTimeEpoch v15;
  CMTime *p_duration;
  uint64_t v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v19;
  CMTimeRange otherRange;
  CMTimeRange rhs;
  CMTimeRange duration;
  CMTime lhs;
  CMTime v24;
  CMTimeRange start;
  CMTimeRange v26;
  __int128 v27;
  CMTimeEpoch v28;
  __int128 v29;
  CMTimeEpoch v30;
  __int128 v31;
  CMTimeEpoch v32;
  __int128 v33;
  CMTimeEpoch v34;
  CMTime v35;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(v7, "creationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "playbackStyle") == 3)
    {
      v12 = objc_msgSend(v9, "playbackStyle");
      v13 = objc_msgSend(v10, "compare:", v11);
      if (v12 == 3 && v13 == -1)
      {
        memset(&v35, 0, sizeof(v35));
        objc_msgSend(v11, "timeIntervalSinceDate:", v10);
        CMTimeMakeWithSeconds(&v35, v14, 600);
        v33 = 0uLL;
        v34 = 0;
        objc_msgSend(v7, "photoIrisStillDisplayTime");
        v31 = 0uLL;
        v32 = 0;
        objc_msgSend(v7, "photoIrisVideoDuration");
        v29 = 0uLL;
        v30 = 0;
        objc_msgSend(v9, "photoIrisStillDisplayTime");
        v27 = 0uLL;
        v28 = 0;
        objc_msgSend(v9, "photoIrisVideoDuration");
        memset(&v26, 0, sizeof(v26));
        v19 = *MEMORY[0x1E0CA2E68];
        *(_OWORD *)&start.start.value = *MEMORY[0x1E0CA2E68];
        v15 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        start.start.epoch = v15;
        *(_OWORD *)&duration.start.value = v31;
        duration.start.epoch = v32;
        CMTimeRangeMake(&v26, &start.start, &duration.start);
        memset(&start, 0, sizeof(start));
        *(_OWORD *)&duration.start.value = v33;
        duration.start.epoch = v34;
        rhs.start = v35;
        CMTimeAdd(&lhs, &duration.start, &rhs.start);
        *(_OWORD *)&duration.start.value = v29;
        duration.start.epoch = v30;
        CMTimeSubtract(&v24, &lhs, &duration.start);
        *(_OWORD *)&duration.start.value = v27;
        duration.start.epoch = v28;
        CMTimeRangeMake(&start, &v24, &duration.start);
        rhs = v26;
        memset(&duration, 0, sizeof(duration));
        otherRange = start;
        CMTimeRangeGetIntersection(&duration, &rhs, &otherRange);
        if ((duration.start.flags & 1) == 0
          || (duration.duration.flags & 1) == 0
          || duration.duration.epoch
          || duration.duration.value < 0)
        {
          *(_OWORD *)&retstr->var0 = v19;
          retstr->var3 = v15;
          goto LABEL_15;
        }
        p_duration = &duration.duration;
LABEL_14:
        *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_duration->value;
        retstr->var3 = p_duration->epoch;
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v10, "compare:", v11);
    }
    p_duration = (CMTime *)MEMORY[0x1E0CA2E68];
    goto LABEL_14;
  }
  v17 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E68];
  retstr->var3 = *(_QWORD *)(v17 + 16);
LABEL_16:

  return result;
}

+ ($0FD61D44AD30C1CDCD15B60AC4039C90)conformRange:(SEL)a3 inRange:(id *)a4
{
  int32_t var1;
  __int128 v9;
  __int128 v10;
  $0FD61D44AD30C1CDCD15B60AC4039C90 *result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CMTimeRange v15;
  CMTimeRange duration;
  CMTimeRange time;
  CMTime v18;
  CMTime v19;

  if (a5->var0.var1 <= a5->var1.var1)
    var1 = a5->var1.var1;
  else
    var1 = a5->var0.var1;
  memset(&v19, 0, sizeof(v19));
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
  time.start.epoch = a4->var0.var3;
  CMTimeConvertScale(&v19, &time.start, var1, kCMTimeRoundingMethod_RoundAwayFromZero);
  memset(&v18, 0, sizeof(v18));
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var1.var0;
  time.start.epoch = a4->var1.var3;
  CMTimeConvertScale(&v18, &time.start, var1, kCMTimeRoundingMethod_RoundTowardZero);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  time.start = v19;
  duration.start = v18;
  CMTimeRangeMake((CMTimeRange *)retstr, &time.start, &duration.start);
  v9 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&time.start.epoch = v9;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)&a5->var1.var1;
  v10 = *(_OWORD *)&retstr->var0.var3;
  *(_OWORD *)&duration.start.value = *(_OWORD *)&retstr->var0.var0;
  *(_OWORD *)&duration.start.epoch = v10;
  *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&retstr->var1.var1;
  result = ($0FD61D44AD30C1CDCD15B60AC4039C90 *)CMTimeRangeContainsTimeRange(&time, &duration);
  if (!(_DWORD)result)
  {
    v12 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&duration.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&duration.start.epoch = v12;
    *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&a5->var1.var1;
    v13 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)&v15.start.value = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&v15.start.epoch = v13;
    *(_OWORD *)&v15.duration.timescale = *(_OWORD *)&retstr->var1.var1;
    result = ($0FD61D44AD30C1CDCD15B60AC4039C90 *)CMTimeRangeGetIntersection(&time, &duration, &v15);
    v14 = *(_OWORD *)&time.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&time.start.value;
    *(_OWORD *)&retstr->var0.var3 = v14;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&time.duration.timescale;
  }
  return result;
}

@end

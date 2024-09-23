@implementation PUMergedLivePhotosVideoRequest

- (PUMergedLivePhotosVideoRequest)initWithAssetReference:(id)a3 dataSource:(id)a4 dataCache:(id)a5
{
  id v10;
  id v11;
  id v12;
  PUMergedLivePhotosVideoRequest *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *workQueue;
  PUCompositeVideoGenerator *workQueue_generator;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *stateQueue;
  PUMergedLivePhotosVideo *stateQueue_mergedVideo;
  void *v24;
  void *v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PUMergedLivePhotosVideoRequest;
  v13 = -[PUMergedLivePhotosVideoRequest init](&v26, sel_init);
  if (v13)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v13->_assetReference, a3);
        objc_storeStrong((id *)&v13->_assetsDataSource, a4);
        objc_storeStrong((id *)&v13->_dataCache, a5);
        PLLivePhotoPlaybackGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v13->_requestLogID = os_signpost_id_generate(v14);

        dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = dispatch_queue_create("com.apple.photos.merged-live-photos-video-request.work", v15);
        workQueue = v13->_workQueue;
        v13->_workQueue = (OS_dispatch_queue *)v16;

        workQueue_generator = v13->_workQueue_generator;
        v13->_workQueue_generator = 0;

        dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = dispatch_queue_create("com.apple.photos.merged-live-photos-video-request.state", v19);
        stateQueue = v13->_stateQueue;
        v13->_stateQueue = (OS_dispatch_queue *)v20;

        v13->_stateQueue_state = 0;
        stateQueue_mergedVideo = v13->_stateQueue_mergedVideo;
        v13->_stateQueue_mergedVideo = 0;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PUMergedLivePhotosVideoRequest.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetReference"));

      if (v11)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PUMergedLivePhotosVideoRequest.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

    goto LABEL_4;
  }
LABEL_5:

  return v13;
}

- (void)start
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PUMergedLivePhotosVideoRequest_start__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_barrier_async(stateQueue, block);
}

- (void)cancel
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PUMergedLivePhotosVideoRequest_cancel__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_barrier_async(stateQueue, block);
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
  v5[2] = __39__PUMergedLivePhotosVideoRequest_state__block_invoke;
  v5[3] = &unk_1E58AAE48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (PUMergedLivePhotosVideo)mergedVideo
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PUMergedLivePhotosVideoRequest_mergedVideo__block_invoke;
  v5[3] = &unk_1E58AAE48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PUMergedLivePhotosVideo *)v3;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PUMergedLivePhotosVideoRequest_error__block_invoke;
  v5[3] = &unk_1E58AAE48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  NSObject *workQueue;
  _QWORD v7[4];
  id v8;
  id location;

  if ((a4 & 1) != 0 && (void *)GeneratorContext == a5)
  {
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__PUMergedLivePhotosVideoRequest_observable_didChange_context___block_invoke;
    v7[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v8, &location);
    dispatch_async(workQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_workQueue_start
{
  id v3;

  if (-[PUMergedLivePhotosVideoRequest state](self, "state") == 1)
  {
    -[PUMergedLivePhotosVideoRequest _workQueue_fetchMergeableAssets](self, "_workQueue_fetchMergeableAssets");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PUMergedLivePhotosVideoRequest _workQueue_generateVideoUsingAssets:](self, "_workQueue_generateVideoUsingAssets:", v3);

  }
}

- (id)_workQueue_fetchMergeableAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PUMergedLivePhotosVideoRequest assetsDataSource](self, "assetsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUMergedLivePhotosVideoRequest assetReference](self, "assetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "playbackStyle") == 3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchPropertySetsIfNeeded");
    PLLivePhotoPlaybackGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "Determining mergeable assets from %@", (uint8_t *)&buf, 0xCu);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v6, 0);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    objc_msgSend(v4, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__PUMergedLivePhotosVideoRequest__workQueue_fetchMergeableAssets__block_invoke;
    v14[3] = &unk_1E589ABA0;
    v15 = v3;
    p_buf = &buf;
    v11 = v9;
    v16 = v11;
    objc_msgSend(v15, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v10, 0, v14);

    v12 = (void *)objc_msgSend(v11, "copy");
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (void)_workQueue_generateVideoUsingAssets:(id)a3
{
  PUCompositeVideoGenerator *v4;
  PUCompositeVideoGenerator *workQueue_generator;
  id v6;

  v6 = a3;
  if (-[PUMergedLivePhotosVideoRequest state](self, "state") == 1)
  {
    if (objc_msgSend(v6, "count"))
    {
      v4 = -[PUCompositeVideoGenerator initWithAssets:outputType:onlyAllowOverlappingAssets:dataCache:]([PUCompositeVideoGenerator alloc], "initWithAssets:outputType:onlyAllowOverlappingAssets:dataCache:", v6, 0, 1, self->_dataCache);
      -[PUCompositeVideoGenerator registerChangeObserver:context:](v4, "registerChangeObserver:context:", self, GeneratorContext);
      -[PUCompositeVideoGenerator start](v4, "start");
      workQueue_generator = self->_workQueue_generator;
      self->_workQueue_generator = v4;

    }
    else
    {
      -[PUMergedLivePhotosVideoRequest _workQueue_finishWithMergedVideo:error:](self, "_workQueue_finishWithMergedVideo:error:", 0, 0);
    }
  }

}

- (void)_workQueue_handleGeneratorDidChangeState
{
  void *v3;
  void *v4;
  PUCompositeVideoGenerator *v5;

  v5 = self->_workQueue_generator;
  if (-[PUCompositeVideoGenerator state](v5, "state") == 2)
  {
    -[PUCompositeVideoGenerator playbackVideo](v5, "playbackVideo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCompositeVideoGenerator error](v5, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUMergedLivePhotosVideoRequest _workQueue_finishWithMergedVideo:error:](self, "_workQueue_finishWithMergedVideo:error:", v3, v4);

  }
}

- (void)_workQueue_finishWithMergedVideo:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *stateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PUMergedLivePhotosVideoRequest__workQueue_finishWithMergedVideo_error___block_invoke;
  block[3] = &unk_1E58AB790;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(stateQueue, block);

}

- (void)_stateQueue_signalStateChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PUMergedLivePhotosVideoRequest__stateQueue_signalStateChange__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (PUMergedLivePhotosVideoRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMergedLivePhotosVideoRequest.m"), 223, CFSTR("%s is not available as initializer"), "-[PUMergedLivePhotosVideoRequest init]");

  abort();
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (PUAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_stateQueue_error, 0);
  objc_storeStrong((id *)&self->_stateQueue_mergedVideo, 0);
  objc_storeStrong((id *)&self->_workQueue_generator, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __63__PUMergedLivePhotosVideoRequest__stateQueue_signalStateChange__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PUMergedLivePhotosVideoRequest__stateQueue_signalStateChange__block_invoke_2;
  v3[3] = &unk_1E58AB370;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __63__PUMergedLivePhotosVideoRequest__stateQueue_signalStateChange__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

uint64_t __73__PUMergedLivePhotosVideoRequest__workQueue_finishWithMergedVideo_error___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 128) == 1)
  {
    v2 = result;
    objc_storeStrong((id *)(v1 + 136), *(id *)(result + 40));
    objc_storeStrong((id *)(*(_QWORD *)(v2 + 32) + 144), *(id *)(v2 + 48));
    v3 = 3;
    if (*(_QWORD *)(v2 + 48))
      v3 = 4;
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 128) = v3;
    PLLivePhotoPlaybackGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 96);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v5, OS_SIGNPOST_INTERVAL_END, v6, "LivePhotoRequestProcessing", ", v7, 2u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "_stateQueue_signalStateChange");
  }
  return result;
}

void __65__PUMergedLivePhotosVideoRequest__workQueue_fetchMergeableAssets__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetReferenceAtIndexPath:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  v8 = v9;
  if (v9)
  {
    objc_msgSend(v8, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLLivePhotoPlaybackGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v10, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEBUG, "\tComparing last asset (%@) and candidate asset (%@)", (uint8_t *)&v16, 0x16u);

    }
    if (+[PUCompositeVideoGenerator canMergeAsset:withConsecutiveAsset:](PUCompositeVideoGenerator, "canMergeAsset:withConsecutiveAsset:", v10, v11))
    {
      PLLivePhotoPlaybackGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEBUG, "\t\tTheir durations overlap", (uint8_t *)&v16, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    }
    else
    {
      *a3 = 1;
    }

  }
  else
  {
    objc_storeStrong(v7, v5);
  }

}

void __63__PUMergedLivePhotosVideoRequest_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workQueue_handleGeneratorDidChangeState");

}

void __39__PUMergedLivePhotosVideoRequest_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 144));
}

void __45__PUMergedLivePhotosVideoRequest_mergedVideo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

uint64_t __39__PUMergedLivePhotosVideoRequest_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 128);
  return result;
}

uint64_t __40__PUMergedLivePhotosVideoRequest_cancel__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 128) == 1)
  {
    v2 = result;
    *(_QWORD *)(v1 + 128) = 2;
    PLLivePhotoPlaybackGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 96);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_END, v5, "LivePhotoRequestProcessing", ", v6, 2u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "_stateQueue_signalStateChange");
  }
  return result;
}

void __39__PUMergedLivePhotosVideoRequest_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id buf[2];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 128))
  {
    *(_QWORD *)(v1 + 128) = 1;
    PLLivePhotoPlaybackGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "LivePhotoRequestProcessing", ", (uint8_t *)buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_stateQueue_signalStateChange");
    objc_initWeak(buf, *(id *)(a1 + 32));
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PUMergedLivePhotosVideoRequest_start__block_invoke_137;
    block[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v8, buf);
    dispatch_async(v6, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __39__PUMergedLivePhotosVideoRequest_start__block_invoke_137(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workQueue_start");

}

@end

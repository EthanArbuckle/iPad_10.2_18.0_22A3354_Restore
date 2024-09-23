@implementation PLConstraintsDirector

- (void)cameraWatcherDidChangeState:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  char v6;
  int64_t faceQuickClassificationRequestID;
  int64_t v8;
  char v9;
  NSObject *v10;
  NSObject *bonusTimer;
  OS_dispatch_source *v12;
  uint8_t v13[16];

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  v6 = objc_msgSend(v5, "isCameraRunning");

  if ((v6 & 1) != 0 || self->_deferredProcessingOngoing || self->_outstandingCaptures != 1)
  {
    faceQuickClassificationRequestID = self->_faceQuickClassificationRequestID;
    v8 = +[PLMediaAnalysisServiceRequestAdapter invalidRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidRequestID");
    v9 = v6 ^ 1;
    if (faceQuickClassificationRequestID == v8)
      v9 = 1;
    if ((v9 & 1) == 0)
    {
      PLAssetAnalysisGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "PLConstraintsDirector cancelling mediaAnalysisService face quick classification because Camera is active...", v13, 2u);
      }

      +[PLMediaAnalysisServiceRequestAdapter cancelRequest:](PLMediaAnalysisServiceRequestAdapter, "cancelRequest:", self->_faceQuickClassificationRequestID);
      self->_faceQuickClassificationRequestID = +[PLMediaAnalysisServiceRequestAdapter invalidRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidRequestID");
      bonusTimer = self->_bonusTimer;
      if (bonusTimer)
      {
        dispatch_source_cancel(bonusTimer);
        v12 = self->_bonusTimer;
        self->_bonusTimer = 0;

      }
    }
  }
  else
  {
    -[PLConstraintsDirector _requestMediaAnalysisQuickFaceProcessing](self, "_requestMediaAnalysisQuickFaceProcessing");
  }
}

- (void)_requestMediaAnalysisQuickFaceProcessing
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *bonusTimer;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSURL *photoLibraryURL;
  _QWORD v13[5];
  _QWORD handler[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  self->_outstandingCaptures = 0;
  if (self->_bonusTimer)
  {
    PLAssetAnalysisGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "PLConstraintsDirector skipping processing because timer is already set", buf, 2u);
    }

  }
  else
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_isolationQueue);
    bonusTimer = self->_bonusTimer;
    self->_bonusTimer = v4;

    PLAssetAnalysisGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "PLConstraintsDirector setting up bonus timer", buf, 2u);
    }

    v7 = self->_bonusTimer;
    v8 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v7, v8, 0x2540BE400uLL, 0x3B9ACA00uLL);
    v9 = MEMORY[0x1E0C809B0];
    v10 = self->_bonusTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke;
    handler[3] = &unk_1E3677AA0;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    PLAssetAnalysisGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "PLConstraintsDirector signaling mediaAnalysisService to do face quick classification...", buf, 2u);
    }

    photoLibraryURL = self->_photoLibraryURL;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke_18;
    v13[3] = &unk_1E3674D50;
    v13[4] = self;
    self->_faceQuickClassificationRequestID = +[PLMediaAnalysisServiceRequestAdapter requestQuickFaceIdentificationForPhotoLibraryURL:withOptions:andCompletionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestQuickFaceIdentificationForPhotoLibraryURL:withOptions:andCompletionHandler:", photoLibraryURL, MEMORY[0x1E0C9AA70], v13);
    dispatch_resume((dispatch_object_t)self->_bonusTimer);
  }
}

- (PLConstraintsDirector)initWithPhotoLibraryURL:(id)a3
{
  id v5;
  PLConstraintsDirector *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *isolationQueue;
  uint64_t v10;
  PFCameraViewfinderSessionWatcher *cameraWatcher;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLConstraintsDirector;
  v6 = -[PLConstraintsDirector init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_queue_create_with_fallback_qos();
    v8 = objc_claimAutoreleasedReturnValue();
    isolationQueue = v6->_isolationQueue;
    v6->_isolationQueue = (OS_dispatch_queue *)v8;

    v6->_outstandingCaptures = 0;
    objc_storeStrong((id *)&v6->_photoLibraryURL, a3);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D750E0]), "initWithDispatchQueue:delegate:", v6->_isolationQueue, v6);
    cameraWatcher = v6->_cameraWatcher;
    v6->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v10;

    -[PFCameraViewfinderSessionWatcher startWatching](v6->_cameraWatcher, "startWatching");
  }

  return v6;
}

- (void)informPhotoCapturedThatNeedsQuickFace
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PLConstraintsDirector_informPhotoCapturedThatNeedsQuickFace__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)informPhotoCapturedThatNeedsDeferredProcessing
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PLConstraintsDirector_informPhotoCapturedThatNeedsDeferredProcessing__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)informAssetsFinishedDeferredProcessing
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PLConstraintsDirector_informAssetsFinishedDeferredProcessing__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)informAssetDeferredProcessingOccurring
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PLConstraintsDirector_informAssetDeferredProcessingOccurring__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_bonusTimer, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

int64_t __63__PLConstraintsDirector_informAssetDeferredProcessingOccurring__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int64_t result;
  NSObject *v4;
  uint8_t v5[16];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  result = +[PLMediaAnalysisServiceRequestAdapter invalidRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidRequestID");
  if (v2 != result)
  {
    PLAssetAnalysisGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "PLConstraintsDirector cancelling mediaAnalysisService face quick classification because deferred finalization started", v5, 2u);
    }

    +[PLMediaAnalysisServiceRequestAdapter cancelRequest:](PLMediaAnalysisServiceRequestAdapter, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    result = +[PLMediaAnalysisServiceRequestAdapter invalidRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidRequestID");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = result;
  }
  return result;
}

uint64_t __63__PLConstraintsDirector_informAssetsFinishedDeferredProcessing__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 1;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isCameraRunning");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_requestMediaAnalysisQuickFaceProcessing");
  return result;
}

uint64_t __71__PLConstraintsDirector_informPhotoCapturedThatNeedsDeferredProcessing__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 12) = 2;
  return result;
}

uint64_t __62__PLConstraintsDirector_informPhotoCapturedThatNeedsQuickFace__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_DWORD *)(v1 + 12))
    *(_DWORD *)(v1 + 12) = 1;
  return result;
}

void __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  uint8_t v10[2];
  uint8_t buf[16];

  PLAssetAnalysisGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "PLConstraintsDirector cancelling and nil-ing bonus timer", buf, 2u);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v5 == +[PLMediaAnalysisServiceRequestAdapter invalidRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidRequestID"))
  {
    PLAssetAnalysisGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v7 = "PLConstraintsDirector detected bonus time has expired but mediaAnalysisService has already stopped face quick"
           " classification...";
      v8 = (uint8_t *)&v9;
LABEL_8:
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    +[PLMediaAnalysisServiceRequestAdapter cancelRequest:](PLMediaAnalysisServiceRequestAdapter, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = +[PLMediaAnalysisServiceRequestAdapter invalidRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidRequestID");
    PLAssetAnalysisGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      v7 = "PLConstraintsDirector cancelling mediaAnalysisService face quick classification because bonus time expired...";
      v8 = v10;
      goto LABEL_8;
    }
  }

}

void __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke_2;
  v7[3] = &unk_1E3677C18;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLAssetAnalysisGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "PLConstraintsDirector received completion handler for quick face classification", (uint8_t *)&v8, 2u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    PLAssetAnalysisGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Error requesting quick face identification: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = +[PLMediaAnalysisServiceRequestAdapter invalidRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidRequestID");
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
  if (v5)
  {
    dispatch_source_cancel(v5);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = 0;

  }
}

@end

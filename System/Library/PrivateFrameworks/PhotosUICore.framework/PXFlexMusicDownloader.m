@implementation PXFlexMusicDownloader

- (PXFlexMusicDownloader)initWithAsset:(id)a3 resource:(int64_t)a4
{
  id v7;
  PXFlexMusicDownloader *v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint64_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSProgress *progress;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXFlexMusicDownloader;
  v8 = -[PXFlexMusicDownloader init](&v21, sel_init);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease((id)objc_msgSend(v9, "initWithFormat:", CFSTR("%@-%@"), v11, v7));
    objc_msgSend(v12, "UTF8String");
    px_dispatch_queue_create_serial();
    v13 = objc_claimAutoreleasedReturnValue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v8->_asset, a3);
    v8->_resource = a4;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38A8]), "initWithParent:userInfo:", 0, 0);
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v15;

    -[NSProgress setCancellable:](v8->_progress, "setCancellable:", 1);
    -[NSProgress setTotalUnitCount:](v8->_progress, "setTotalUnitCount:", 100);
    objc_initWeak(&location, v8);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __48__PXFlexMusicDownloader_initWithAsset_resource___block_invoke;
    v18[3] = &unk_1E5148D30;
    objc_copyWeak(&v19, &location);
    -[NSProgress setCancellationHandler:](v8->_progress, "setCancellationHandler:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (PXFlexMusicDownloader)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicDownloader.m"), 59, CFSTR("%s is not available as initializer"), "-[PXFlexMusicDownloader init]");

  abort();
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[PXFlexMusicDownloader asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXFlexMusicDownloader resource](self, "resource");
  v7 = CFSTR("Artwork");
  if (v6 == 2)
    v7 = CFSTR("Audio");
  if (!v6)
    v7 = CFSTR("??");
  v8 = v7;
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; Song: %@; Resource: %@>"), v4, self, v5, v8);

  return (NSString *)v9;
}

- (void)startWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id buf[2];

  v4 = a3;
  PLAudioPlaybackGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXFlexMusicDownloaderDownload", " enableTelemetry=YES ", (uint8_t *)buf, 2u);
    }
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__PXFlexMusicDownloader_startWithCompletion___block_invoke;
  v10[3] = &unk_1E5146480;
  objc_copyWeak(&v12, buf);
  v11 = v4;
  v9 = v4;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *queue;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;
  id location;

  v6 = a4;
  v9 = a3;
  if ((void *)LibraryContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicDownloader.m"), 91, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __54__PXFlexMusicDownloader_observable_didChange_context___block_invoke;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v18, &location);
    dispatch_async(queue, block);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  if ((v6 & 2) != 0)
  {
    objc_initWeak(&location, self);
    v13 = self->_queue;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __54__PXFlexMusicDownloader_observable_didChange_context___block_invoke_2;
    v15[3] = &unk_1E5148D30;
    objc_copyWeak(&v16, &location);
    dispatch_async(v13, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)_queue_startWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int64_t v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  PXExpectation *v14;
  OS_dispatch_queue *queue;
  void *v16;
  PXExpectation *v17;
  PXExpectation *queue_downloadExpectation;
  PXExpectation *v19;
  uint64_t v20;
  NSObject *v21;
  id WeakRetained;
  os_signpost_id_t v23;
  void *v24;
  id queue_completionHandler;
  _QWORD aBlock[4];
  id v27;
  id v28;
  uint8_t v29[8];
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  PXFlexMusicDownloader *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_queue_completionHandler)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "%@ was asked to start multiple times.", buf, 0xCu);
    }

  }
  +[PXAudioSettings sharedInstance](PXAudioSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "flexSimulateDownloadFailure");

  if (v7)
  {
    sleep(2u);
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else
  {
    +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:context:", self, LibraryContext);
    -[PXFlexMusicDownloader asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXFlexMusicDownloader resource](self, "resource");
    v11 = objc_msgSend(v8, "hasLocalResourceForAsset:resourceType:", v9, v10);
    PLAudioPlaybackGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        v33 = self;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Found existing local resource. Skipping download for %{public}@", buf, 0xCu);
      }

      -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", 100);
      self->_queue_isFinished = 1;
      (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        v33 = self;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Starting download for %{public}@", buf, 0xCu);
      }

      v14 = [PXExpectation alloc];
      queue = self->_queue;
      -[PXFlexMusicDownloader description](self, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PXExpectation initWithQueue:labelFormat:](v14, "initWithQueue:labelFormat:", queue, CFSTR("%@"), v16);
      queue_downloadExpectation = self->_queue_downloadExpectation;
      self->_queue_downloadExpectation = v17;

      objc_initWeak((id *)buf, self);
      v19 = self->_queue_downloadExpectation;
      v20 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __52__PXFlexMusicDownloader__queue_startWithCompletion___block_invoke;
      v30[3] = &unk_1E5144F70;
      objc_copyWeak(&v31, (id *)buf);
      -[PXExpectation performWhenFulfilled:timeout:](v19, "performWhenFulfilled:timeout:", v30, 30.0);
      PLAudioPlaybackGetLog();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)buf);
      v23 = os_signpost_id_make_with_pointer(v21, WeakRetained);

      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)v29 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PXFlexMusicDownloaderDownload", " enableTelemetry=YES ", v29, 2u);
      }

      self->_downloadSignpostID = objc_msgSend(MEMORY[0x1E0D09910], "startSignpost");
      objc_msgSend(v8, "requestDownloadForAsset:resourceType:", v9, v10);
      aBlock[0] = v20;
      aBlock[1] = 3221225472;
      aBlock[2] = __52__PXFlexMusicDownloader__queue_startWithCompletion___block_invoke_21;
      aBlock[3] = &unk_1E5141338;
      objc_copyWeak(&v28, (id *)buf);
      v27 = v4;
      v24 = _Block_copy(aBlock);
      queue_completionHandler = self->_queue_completionHandler;
      self->_queue_completionHandler = v24;

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }

  }
}

- (void)_queue_handleDownloadProgressChanged
{
  void *v3;
  id v4;

  if (!self->_queue_isFinished)
  {
    +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXFlexMusicDownloader asset](self, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "downloadProgressForAsset:resourceType:", v3, -[PXFlexMusicDownloader resource](self, "resource"));
    -[PXFlexMusicDownloader setDownloadFractionCompleted:](self, "setDownloadFractionCompleted:");

  }
}

- (void)setDownloadFractionCompleted:(double)a3
{
  NSObject *v5;
  int v6;
  PXFlexMusicDownloader *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_downloadFractionCompleted != a3)
  {
    self->_downloadFractionCompleted = a3;
    PLAudioPlaybackGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543618;
      v7 = self;
      v8 = 2048;
      v9 = a3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ download progress changed: %.f", (uint8_t *)&v6, 0x16u);
    }

    if (a3 == -1.0)
      -[PXExpectation fulfill](self->_queue_downloadExpectation, "fulfill");
    else
      -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (uint64_t)(a3 * 100.0));
    if (a3 >= 1.0)
      -[PXFlexMusicDownloader _queue_finishIfPossible](self, "_queue_finishIfPossible");
  }
}

- (void)_handleCancellation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PXFlexMusicDownloader__handleCancellation__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_queue_finishIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  PXFlexMusicDownloader *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFlexMusicDownloader asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localURLForAsset:resourceType:", v4, -[PXFlexMusicDownloader resource](self, "resource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PLAudioPlaybackGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = self;
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ download finished with URL %{public}@", (uint8_t *)&v7, 0x16u);
    }

    -[PXExpectation fulfill](self->_queue_downloadExpectation, "fulfill");
  }

}

- (void)_queue_handleDownloadFinished:(BOOL)a3 error:(id)a4
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  NSObject *v12;
  int64_t v13;
  const __CFString *v14;
  NSObject *queue_completionHandler;
  PXFlexMusicDownloader *v16;
  void *v17;
  int64_t downloadSignpostID;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  PXFlexMusicDownloader *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!self->_queue_isFinished)
  {
    PLAudioPlaybackGetLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v10, "PXFlexMusicDownloaderDownload", " enableTelemetry=YES ", buf, 2u);
      }
    }

    self->_queue_isFinished = 1;
    if (a3)
    {
      v11 = 0;
    }
    else
    {
      if (objc_msgSend(v7, "px_isDomain:code:", CFSTR("PXExpectationErrorDomain"), 1))
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXFlexMusicDownloaderErrorDomain"), 1, v7, CFSTR("%@ timed out"), self, v24);
      else
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXFlexMusicDownloaderErrorDomain"), 0, v7, CFSTR("%@ encountered an unknown error: %@"), self, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PLAudioPlaybackGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v28 = self;
        v29 = 2114;
        v30 = v11;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "%{public}@ download failed with error %{public}@", buf, 0x16u);
      }

    }
    if (self->_queue_completionHandler)
    {
      v13 = -[PXFlexMusicDownloader resource](self, "resource");
      switch(v13)
      {
        case 1:
          v14 = CFSTR("com.apple.photos.CPAnalytics.flexMusicSongArtworkDownloaded");
          break;
        case 2:
          v14 = CFSTR("com.apple.photos.CPAnalytics.flexMusicSongAudioDownloaded");
          break;
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicDownloader.m"), 204, CFSTR("Code which should be unreachable has been reached"));

          abort();
        default:
          v14 = 0;
          break;
      }
      v17 = (void *)MEMORY[0x1E0D09910];
      downloadSignpostID = self->_downloadSignpostID;
      v19 = *MEMORY[0x1E0D09708];
      v25[0] = *MEMORY[0x1E0D09830];
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = *MEMORY[0x1E0D09850];
      v26[0] = v21;
      v26[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endSignpost:forEventName:withPayload:", downloadSignpostID, v19, v22);

      self->_downloadSignpostID = 0;
      (*((void (**)(void))self->_queue_completionHandler + 2))();
      queue_completionHandler = self->_queue_completionHandler;
      self->_queue_completionHandler = 0;
    }
    else
    {
      PXAssertGetLog();
      queue_completionHandler = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(queue_completionHandler, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v16 = (PXFlexMusicDownloader *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v16;
        _os_log_error_impl(&dword_1A6789000, queue_completionHandler, OS_LOG_TYPE_ERROR, "Unexpected call to %@ with nil completion handler.", buf, 0xCu);

      }
    }

  }
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 48, 1);
}

- (PXFlexMusicAsset)asset
{
  return self->_asset;
}

- (int64_t)resource
{
  return self->_resource;
}

- (double)downloadFractionCompleted
{
  return self->_downloadFractionCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_queue_downloadExpectation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_queue_completionHandler, 0);
}

void __44__PXFlexMusicDownloader__handleCancellation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelDownloadForAsset:resourceType:", v2, objc_msgSend(*(id *)(a1 + 32), "resource"));

}

void __52__PXFlexMusicDownloader__queue_startWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_handleDownloadFinished:error:", a2, v5);

}

void __52__PXFlexMusicDownloader__queue_startWithCompletion___block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  os_signpost_id_t v7;
  uint8_t v8[16];

  v4 = a3;
  PLAudioPlaybackGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = os_signpost_id_make_with_pointer(v5, WeakRetained);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXFlexMusicDownloaderDownload", " enableTelemetry=YES ", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__PXFlexMusicDownloader_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_handleDownloadProgressChanged");

}

void __54__PXFlexMusicDownloader_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_finishIfPossible");

}

void __45__PXFlexMusicDownloader_startWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_startWithCompletion:", *(_QWORD *)(a1 + 32));

}

void __48__PXFlexMusicDownloader_initWithAsset_resource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleCancellation");

}

@end

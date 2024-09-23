@implementation XBApplicationSnapshotImageGenerator

- (XBApplicationSnapshotImageGenerator)initWithScheduler:(id)a3 snapshot:(id)a4 dataProvider:(id)a5 imageDataRequest:(int64_t)a6 loggingPrefix:(id)a7 imageGenerationHandler:(id)a8 imageDataGenerationHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  XBApplicationSnapshotImageGenerator *v23;
  XBApplicationSnapshotImageGenerator *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id didGenerateImageHandler;
  uint64_t v29;
  id didGenerateImageDataHandler;
  uint64_t v31;
  NSString *loggingPrefix;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v41;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotImageGenerator.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheduler"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotImageGenerator.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

LABEL_3:
  objc_msgSend(v16, "groupID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (v17)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotImageGenerator.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[snapshot groupID]"));

    if (v17)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotImageGenerator.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataProvider"));

LABEL_5:
  objc_msgSend(v17, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotImageGenerator.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataProvider context]"));

  }
  v41.receiver = self;
  v41.super_class = (Class)XBApplicationSnapshotImageGenerator;
  v23 = -[XBApplicationSnapshotImageGenerator init](&v41, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_generate_handled_request = 0;
    v23->_generate_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v23->_weak_snapshot, v16);
    objc_storeStrong((id *)&v24->_scheduler, a3);
    objc_storeStrong((id *)&v24->_dataProvider, a5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24->_dataProviderFetchType = 0;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24->_dataProviderFetchType = 1;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24->_dataProviderFetchType = 2;
      XBLogCapture();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[XBApplicationSnapshotImageGenerator initWithScheduler:snapshot:dataProvider:imageDataRequest:loggingPrefix:imageGenerationHandler:imageDataGenerationHandler:].cold.1();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v24, CFSTR("XBApplicationSnapshotImageGenerator.m"), 93, CFSTR("%@ XBSnapshotDataProvider %@ doesn't implement fetch* method"), v24->_loggingPrefix, v17);

    }
    v24->_imageDataRequest = a6;
    v27 = objc_msgSend(v19, "copy");
    didGenerateImageHandler = v24->_didGenerateImageHandler;
    v24->_didGenerateImageHandler = (id)v27;

    v29 = objc_msgSend(v20, "copy");
    didGenerateImageDataHandler = v24->_didGenerateImageDataHandler;
    v24->_didGenerateImageDataHandler = (id)v29;

    v31 = objc_msgSend(v18, "copy");
    loggingPrefix = v24->_loggingPrefix;
    v24->_loggingPrefix = (NSString *)v31;

  }
  return v24;
}

- (void)performAsync:(id)a3
{
  -[XBApplicationSnapshotImageGenerationScheduling performImageGenerationAsync:](self->_scheduler, "performImageGenerationAsync:", a3);
}

- (void)scheduleGeneration
{
  NSObject *v3;
  id WeakRetained;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSString *loggingPrefix;
  XBApplicationSnapshotImageGenerationScheduling *scheduler;
  NSObject *v10;
  NSString *v11;
  uint64_t v12;
  XBApplicationSnapshotImageGenerationScheduling *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_217702000, "XBCapture", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v3, &state);

  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_snapshot);
  v17 = 0;
  v5 = -[XBApplicationSnapshotImageGenerator _shouldGenerateForSnapshot:reason:](self, "_shouldGenerateForSnapshot:reason:", WeakRetained, &v17);
  v6 = v17;
  if (v5)
  {
    XBLogCapture();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      loggingPrefix = self->_loggingPrefix;
      *(_DWORD *)buf = 138543618;
      v20 = loggingPrefix;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_217702000, v7, OS_LOG_TYPE_INFO, "[%{public}@] scheduling asynchronous request to generate image because: %{public}@", buf, 0x16u);
    }

    scheduler = self->_scheduler;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke_22;
    v14[3] = &unk_24D7F4328;
    v14[4] = self;
    -[XBApplicationSnapshotImageGenerationScheduling performImageGenerationAsync:](scheduler, "performImageGenerationAsync:", v14);
  }
  else
  {
    XBLogCapture();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_loggingPrefix;
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_217702000, v10, OS_LOG_TYPE_INFO, "[%{public}@] ignoring asynchronous request to generate image because: %{public}@", buf, 0x16u);
    }

    v12 = MEMORY[0x24BDAC760];
    if (self->_didGenerateImageHandler)
    {
      v13 = self->_scheduler;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke;
      v16[3] = &unk_24D7F4328;
      v16[4] = self;
      -[XBApplicationSnapshotImageGenerationScheduling performImageGenerationAsync:](v13, "performImageGenerationAsync:", v16);
    }
    if (self->_didGenerateImageDataHandler)
    {
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke_2;
      v15[3] = &unk_24D7F4328;
      v15[4] = self;
      -[XBApplicationSnapshotImageGenerator _performImageDataGeneration:withHandler:](self, "_performImageDataGeneration:withHandler:", 0, v15);
    }
  }

  os_activity_scope_leave(&state);
}

uint64_t __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

uint64_t __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

uint64_t __57__XBApplicationSnapshotImageGenerator_scheduleGeneration__block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generate");
}

- (void)generate
{
  NSObject *v3;
  id WeakRetained;
  BOOL v5;
  id v6;
  NSObject *v7;
  XBApplicationSnapshotImageGenerationScheduling *scheduler;
  NSObject *v9;
  NSString *v10;
  uint64_t v11;
  XBApplicationSnapshotImageGenerationScheduling *v12;
  NSString *loggingPrefix;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_217702000, "XBCapture", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v3, &state);

  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_snapshot);
  v18 = 0;
  v5 = -[XBApplicationSnapshotImageGenerator _shouldGenerateForSnapshot:reason:](self, "_shouldGenerateForSnapshot:reason:", WeakRetained, &v18);
  v6 = v18;
  if (v5)
  {
    XBLogCapture();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      loggingPrefix = self->_loggingPrefix;
      objc_msgSend(WeakRetained, "logIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = loggingPrefix;
      v22 = 2114;
      v23 = v14;
      v24 = 2114;
      v25 = v6;
      _os_log_error_impl(&dword_217702000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] CALLED IMAGE GENERATOR FOR %{public}@. This should be considered a last resort, and will likely result in significant blocking of the calling thread! reason: %{public}@", buf, 0x20u);

    }
    scheduler = self->_scheduler;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__XBApplicationSnapshotImageGenerator_generate__block_invoke_23;
    v15[3] = &unk_24D7F4328;
    v15[4] = self;
    -[XBApplicationSnapshotImageGenerationScheduling performImageGenerationAsyncAndWait:](scheduler, "performImageGenerationAsyncAndWait:", v15);
  }
  else
  {
    XBLogCapture();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = self->_loggingPrefix;
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_217702000, v9, OS_LOG_TYPE_INFO, "[%{public}@] ignoring synchronous request to generate image because: %{public}@", buf, 0x16u);
    }

    v11 = MEMORY[0x24BDAC760];
    if (self->_didGenerateImageHandler)
    {
      v12 = self->_scheduler;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __47__XBApplicationSnapshotImageGenerator_generate__block_invoke;
      v17[3] = &unk_24D7F4328;
      v17[4] = self;
      -[XBApplicationSnapshotImageGenerationScheduling performImageGenerationAsyncAndWait:](v12, "performImageGenerationAsyncAndWait:", v17);
    }
    if (self->_didGenerateImageDataHandler)
    {
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __47__XBApplicationSnapshotImageGenerator_generate__block_invoke_2;
      v16[3] = &unk_24D7F4328;
      v16[4] = self;
      -[XBApplicationSnapshotImageGenerator _performImageDataGeneration:withHandler:](self, "_performImageDataGeneration:withHandler:", 0, v16);
    }
  }

  os_activity_scope_leave(&state);
}

uint64_t __47__XBApplicationSnapshotImageGenerator_generate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __47__XBApplicationSnapshotImageGenerator_generate__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

uint64_t __47__XBApplicationSnapshotImageGenerator_generate__block_invoke_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generate");
}

- (void)_performImageDataGeneration:(id)a3 withHandler:(id)a4
{
  int64_t imageDataRequest;
  XBApplicationSnapshotImageGenerationScheduling *scheduler;

  imageDataRequest = self->_imageDataRequest;
  scheduler = self->_scheduler;
  if (imageDataRequest == 2)
    -[XBApplicationSnapshotImageGenerationScheduling performImageDataGenerationAsync:withHandler:](scheduler, "performImageDataGenerationAsync:withHandler:", a3, a4);
  else
    -[XBApplicationSnapshotImageGenerationScheduling performImageDataGenerationAsyncAndWait:withHandler:](scheduler, "performImageDataGenerationAsyncAndWait:withHandler:", a3, a4);
}

- (BOOL)_shouldGenerateForSnapshot:(id)a3 reason:(id *)a4
{
  os_unfair_lock_s *p_generate_lock;
  id v7;

  p_generate_lock = &self->_generate_lock;
  v7 = a3;
  os_unfair_lock_assert_not_owner(p_generate_lock);
  os_unfair_lock_lock(p_generate_lock);
  LOBYTE(a4) = -[XBApplicationSnapshotImageGenerator _generate_lock_shouldGenerateForSnapshot:reason:](self, "_generate_lock_shouldGenerateForSnapshot:reason:", v7, a4);

  os_unfair_lock_unlock(p_generate_lock);
  return (char)a4;
}

- (BOOL)_generate_lock_shouldGenerateForSnapshot:(id)a3 reason:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  __CFString *v9;
  int v11;

  v6 = a3;
  v7 = v6;
  if (self->_generate_handled_request)
  {
    v8 = 0;
    if (a4)
    {
      v9 = CFSTR("already complete");
      goto LABEL_4;
    }
  }
  else
  {
    if (!v6)
    {
      v8 = 0;
      if (!a4)
        goto LABEL_5;
      v9 = CFSTR("snapshot is nil");
      goto LABEL_4;
    }
    if (objc_msgSend(v6, "_isInvalidated"))
    {
      v8 = 0;
      if (!a4)
        goto LABEL_5;
      v9 = CFSTR("snapshot is invalidated");
      goto LABEL_4;
    }
    if (self->_imageDataRequest)
    {
      v8 = 1;
      if (!a4)
        goto LABEL_5;
      v9 = CFSTR("image data requested");
      goto LABEL_4;
    }
    v11 = objc_msgSend(v7, "hasCachedImage");
    v8 = v11 ^ 1;
    v9 = CFSTR("no cached image");
    if (v11)
      v9 = CFSTR("have a cached image and no requests to regenerate");
    if (a4)
LABEL_4:
      *a4 = v9;
  }
LABEL_5:

  return v8;
}

- (id)_generate_imageFromNewDataProvider:(id)a3 forSnapshot:(id)a4 imageDataHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int64_t v13;
  int64_t dataProviderFetchType;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSString *loggingPrefix;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 *v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  XBApplicationSnapshotImageGenerator *v30;
  id v31;
  _QWORD *v32;
  __int128 *p_buf;
  int64_t v34;
  char v35;
  _QWORD v36[4];
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(v9, "hasProtectedContent");
  else
    v12 = 0;
  objc_msgSend(v10, "_setHasProtectedContent:", v12);
  v13 = +[XBApplicationSnapshotManifestImpl _outputFormatForSnapshot:](XBApplicationSnapshotManifestImpl, "_outputFormatForSnapshot:", v10);
  dataProviderFetchType = self->_dataProviderFetchType;
  if (dataProviderFetchType)
  {
    if (dataProviderFetchType != 1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotImageGenerator.m"), 240, CFSTR("%@ somehow we got into this method with the wrong data provider %@"), self->_loggingPrefix, v9);

      v16 = 0;
      if (v11)
        goto LABEL_9;
      goto LABEL_11;
    }
    objc_msgSend(v9, "fetchImage");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "fetchImageForFormat:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
  if (v11)
  {
LABEL_9:
    v22 = v10;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    v41 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v17 = MEMORY[0x24BDAC760];
    v36[3] = 0;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke;
    v28[3] = &unk_24D7F4688;
    v32 = v36;
    v29 = v9;
    v30 = self;
    v35 = v12;
    v31 = v16;
    p_buf = &buf;
    v34 = v13;
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_42;
    v23[3] = &unk_24D7F46B0;
    v25 = v11;
    v26 = &buf;
    v24 = v31;
    v27 = v36;
    -[XBApplicationSnapshotImageGenerator _performImageDataGeneration:withHandler:](self, "_performImageDataGeneration:withHandler:", v28, v23);

    v10 = v22;
    _Block_object_dispose(v36, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_14;
  }
LABEL_11:
  XBLogCapture();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    loggingPrefix = self->_loggingPrefix;
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = loggingPrefix;
    _os_log_impl(&dword_217702000, v19, OS_LOG_TYPE_INFO, "[%{public}@] we don't have requests for imageData. skipping imageData generation", (uint8_t *)&buf, 0xCu);
  }

LABEL_14:
  return v16;
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  objc_class *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  XBLogCapture();
  v2 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));

  XBLogCapture();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
    v10 = "XBImageDataGenerationRequestNone";
    if (v9 == 1)
      v10 = "XBImageDataGenerationRequestSynchronous";
    if (v9 == 2)
      v11 = "XBImageDataGenerationRequestAsynchronous";
    else
      v11 = v10;
    v23 = 138543618;
    v24 = v7;
    v25 = 2082;
    v26 = v11;
    _os_signpost_emit_with_name_impl(&dword_217702000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "GenerateImageData", "dataProvider=%{public}@ imageDataRequest=%{public}s", (uint8_t *)&v23, 0x16u);

  }
  XBLogCapture();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_4(a1, a1 + 32, v12);

  if (*(_QWORD *)(a1 + 48))
  {
    if (*(_BYTE *)(a1 + 80))
    {
      XBLogCapture();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v14;
        v25 = 2114;
        v26 = v16;
        _os_log_impl(&dword_217702000, v13, OS_LOG_TYPE_INFO, "[%{public}@] -[%{public}@<XBSnapshotDataProvider> hasProtectedContent] is YES. skipping imageData generation", (uint8_t *)&v23, 0x16u);

      }
    }
    else if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64))
    {
      +[XBApplicationSnapshot dataForImage:withFormat:](XBApplicationSnapshot, "dataForImage:withFormat:");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "length");
      XBLogCapture();
      v21 = objc_claimAutoreleasedReturnValue();
      v13 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_3();
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_2();
      }
    }
    else
    {
      XBLogCapture();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
        v23 = 138543362;
        v24 = v22;
        _os_log_impl(&dword_217702000, v13, OS_LOG_TYPE_INFO, "[%{public}@] was not asked for imageData. skipping imageData generation", (uint8_t *)&v23, 0xCu);
      }
    }
  }
  else
  {
    XBLogCapture();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_1();
  }

}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_42(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v2 = a1[5];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "length"))
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  else
    v3 = 0;
  (*(void (**)(uint64_t, uint64_t, BOOL))(v2 + 16))(v2, v3, a1[4] != 0);
  XBLogCapture();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_217702000, v5, OS_SIGNPOST_INTERVAL_END, v6, "GenerateImageData", ", v7, 2u);
  }

}

- (id)_generate_imageFromLegacyDataProvider:(id)a3 forSnapshot:(id)a4 imageDataHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  __int128 v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v23[5];
  NSObject *v24;
  id v25;
  id v26;
  os_signpost_id_t v27;
  uint8_t buf[16];
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  XBLogCapture();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, v7);

  XBLogCapture();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v14;
    _os_signpost_emit_with_name_impl(&dword_217702000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "GenerateImageDataLegacy", "dataProvider=%{public}@", buf, 0xCu);

  }
  v15 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)buf = *MEMORY[0x24BDBD8B8];
  v29 = v15;
  v30 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v7, "fetchImageData:", buf);
  v16 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject length](v16, "length"))
  {
    v17 = objc_alloc(MEMORY[0x24BDF6AC8]);
    objc_msgSend(v7, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    v19 = (void *)objc_msgSend(v17, "initWithData:scale:", v16);

    if (v19)
      goto LABEL_12;
    XBLogCapture();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[XBApplicationSnapshotImageGenerator _generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:].cold.2();

    v21 = v16;
    v16 = 0;
  }
  else
  {
    XBLogCapture();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[XBApplicationSnapshotImageGenerator _generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:].cold.1();
  }

  v19 = 0;
LABEL_12:
  if (v8)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __106__XBApplicationSnapshotImageGenerator__generate_imageFromLegacyDataProvider_forSnapshot_imageDataHandler___block_invoke;
    v23[3] = &unk_24D7F46D8;
    v26 = v8;
    v23[4] = self;
    v24 = v16;
    v25 = v19;
    v27 = v10;
    -[XBApplicationSnapshotImageGenerator _performImageDataGeneration:withHandler:](self, "_performImageDataGeneration:withHandler:", 0, v23);

  }
  return v19;
}

void __106__XBApplicationSnapshotImageGenerator__generate_imageFromLegacyDataProvider_forSnapshot_imageDataHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v2 = a1[7];
  if (*(_QWORD *)(a1[4] + 64))
    v3 = a1[5];
  else
    v3 = 0;
  (*(void (**)(uint64_t, uint64_t, BOOL))(v2 + 16))(v2, v3, a1[6] != 0);
  XBLogCapture();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[8];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_217702000, v5, OS_SIGNPOST_INTERVAL_END, v6, "GenerateImageDataLegacy", ", v7, 2u);
  }

}

- (void)_generate
{
  os_unfair_lock_s *p_generate_lock;
  id WeakRetained;
  BOOL v5;
  id v6;
  XBSnapshotDataProvider *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  objc_class *v13;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  void *v19;
  NSObject *v20;
  void (**v21)(id, _QWORD);
  void *v22;
  void *v23;
  void (**didGenerateImageHandler)(id, BOOL);
  NSObject *v25;
  NSObject *v26;
  NSString *loggingPrefix;
  void *v28;
  os_signpost_id_t spid;
  void *v30;
  void *context;
  _QWORD v32[5];
  id v33;
  int64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  NSString *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  p_generate_lock = &self->_generate_lock;
  os_unfair_lock_assert_not_owner(&self->_generate_lock);
  os_unfair_lock_lock(p_generate_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_snapshot);
  v37 = 0;
  v5 = -[XBApplicationSnapshotImageGenerator _generate_lock_shouldGenerateForSnapshot:reason:](self, "_generate_lock_shouldGenerateForSnapshot:reason:", WeakRetained, &v37);
  v6 = v37;
  if (v5)
  {
    context = (void *)MEMORY[0x219A10C5C]();
    v7 = self->_dataProvider;
    XBLogCapture();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_make_with_pointer(v8, WeakRetained);

    XBLogCapture();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = v9 - 1;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v14;
      _os_signpost_emit_with_name_impl(&dword_217702000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "GenerateImage", "dataProvider=%{public}@", buf, 0xCu);

    }
    spid = v9;

    BSContinuousMachTimeNow();
    v16 = v15;
    v30 = (void *)os_transaction_create();
    objc_msgSend(WeakRetained, "logIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[XBApplicationSnapshotManifestImpl _outputFormatForSnapshot:](XBApplicationSnapshotManifestImpl, "_outputFormatForSnapshot:", WeakRetained);
    if (self->_didGenerateImageDataHandler)
    {
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __48__XBApplicationSnapshotImageGenerator__generate__block_invoke_45;
      v32[3] = &unk_24D7F4700;
      v32[4] = self;
      v34 = v18;
      v33 = v17;
      v35 = v16;
      v19 = (void *)MEMORY[0x219A10DF4](v32);

    }
    else
    {
      v19 = 0;
    }
    if (self->_dataProviderFetchType > 1uLL)
      -[XBApplicationSnapshotImageGenerator _generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:](self, "_generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:", v7, WeakRetained, v19);
    else
      -[XBApplicationSnapshotImageGenerator _generate_imageFromNewDataProvider:forSnapshot:imageDataHandler:](self, "_generate_imageFromNewDataProvider:forSnapshot:imageDataHandler:", v7, WeakRetained, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_cacheImage:", v22);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23 = (void *)MEMORY[0x219A10C5C]();
      -[XBSnapshotDataProvider invalidateImage](v7, "invalidateImage");
      objc_autoreleasePoolPop(v23);
    }
    didGenerateImageHandler = (void (**)(id, BOOL))self->_didGenerateImageHandler;
    if (didGenerateImageHandler)
      didGenerateImageHandler[2](didGenerateImageHandler, v22 != 0);
    XBLogCapture();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_217702000, v26, OS_SIGNPOST_INTERVAL_END, spid, "GenerateImage", ", buf, 2u);
    }

    objc_autoreleasePoolPop(context);
  }
  else
  {
    XBLogCapture();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      loggingPrefix = self->_loggingPrefix;
      objc_msgSend(WeakRetained, "logIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = loggingPrefix;
      v40 = 2114;
      v41 = v6;
      v42 = 2114;
      v43 = v28;
      _os_log_error_impl(&dword_217702000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] we needlessly scheduled _generate even though we have nothing to do because: %{public}@; Snapshot: %{public}@",
        buf,
        0x20u);

    }
    v21 = (void (**)(id, _QWORD))self->_didGenerateImageHandler;
    if (v21)
      v21[2](v21, 0);
    if (self->_didGenerateImageDataHandler)
    {
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __48__XBApplicationSnapshotImageGenerator__generate__block_invoke;
      v36[3] = &unk_24D7F4328;
      v36[4] = self;
      -[XBApplicationSnapshotImageGenerator _performImageDataGeneration:withHandler:](self, "_performImageDataGeneration:withHandler:", 0, v36);
    }
  }
  self->_generate_handled_request = 1;
  os_unfair_lock_unlock(p_generate_lock);

}

uint64_t __48__XBApplicationSnapshotImageGenerator__generate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

void __48__XBApplicationSnapshotImageGenerator__generate__block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    XBLogCapture();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      objc_msgSend(v3, "length");
      NSLocalizedFileSizeDescription();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromXBApplicationSnapshotOnDiskFormat(*(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      BSContinuousMachTimeNow();
      v10 = v9 - *(double *)(a1 + 56);
      v11 = 138544386;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_217702000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Generated image data (%{public}@ as %{public}@) for %{public}@ after %.3fs", (uint8_t *)&v11, 0x34u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong(&self->_didGenerateImageDataHandler, 0);
  objc_storeStrong(&self->_didGenerateImageHandler, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_weak_snapshot);
}

- (void)initWithScheduler:snapshot:dataProvider:imageDataRequest:loggingPrefix:imageGenerationHandler:imageDataGenerationHandler:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_217702000, v2, v3, "[%{public}@] %{public}@ implementing deprecated fetchImageData:. rude. inconsiderate.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_217702000, v2, v3, "[%{public}@] -[%{public}@<XBSnapshotDataProvider> fetchImage] returned a nil image. skipping imageData generation", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_217702000, v0, v1, "[%{public}@] +[XBApplicationSnapshot dataForImage:withFormat:] failed to create imageData", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_217702000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] completed snapshot dataForImage", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __103__XBApplicationSnapshotImageGenerator__generate_imageFromNewDataProvider_forSnapshot_imageDataHandler___block_invoke_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint8_t v6[24];

  v4 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_217702000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] -[%{public}@<XBSnapshotDataProvider> fetchImage] doing imageData generation", v6, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_217702000, v0, v1, "[%{public}@] -[<XBSnapshotDataProvider> fetchImageData:] returned nil imageData. Returning nil image and data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_generate_imageFromLegacyDataProvider:forSnapshot:imageDataHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_217702000, v0, v1, "[%{public}@] -[UIImage initWithData:scale:] returned a nil image, so we're not returning the image or its data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end

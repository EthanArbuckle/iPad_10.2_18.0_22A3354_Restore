@implementation _PXStoryExportOperation

- (_PXStoryExportOperation)initWithURL:(id)a3 configuration:(id)a4 qualityOfService:(int64_t)a5 progressHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  dispatch_queue_t v22;
  void *v23;
  dispatch_qos_class_t v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  void *v28;
  dispatch_queue_t v29;
  void *v30;
  dispatch_queue_t v31;
  void *v32;
  dispatch_semaphore_t v33;
  void *v34;
  dispatch_semaphore_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  os_log_t v39;
  void *v40;
  objc_super v42;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v42.receiver = self;
  v42.super_class = (Class)_PXStoryExportOperation;
  v14 = -[_PXStoryExportOperation init](&v42, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v14 + 47);
    *((_QWORD *)v14 + 47) = v16;

    objc_storeStrong((id *)v14 + 49, a3);
    objc_storeStrong((id *)v14 + 48, a4);
    v18 = _Block_copy(v13);
    v19 = (void *)*((_QWORD *)v14 + 52);
    *((_QWORD *)v14 + 52) = v18;

    objc_msgSend(v12, "videoOptions");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v14 + 51);
    *((_QWORD *)v14 + 51) = v20;

    v22 = dispatch_queue_create("com.apple.exportOperation.externalStateQueue", 0);
    v23 = (void *)*((_QWORD *)v14 + 31);
    *((_QWORD *)v14 + 31) = v22;

    *((_QWORD *)v14 + 32) = 0;
    *(_QWORD *)(v14 + 284) = 0;
    *(_QWORD *)(v14 + 292) = 0;
    *(_QWORD *)(v14 + 276) = 0;
    objc_msgSend(v14, "setQualityOfService:", a5);
    v24 = px_dispatch_qos_from_nsqualityofservice();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v25, v24, 0);
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = dispatch_queue_create("com.apple.exportOperation.videoWriterQueue", v26);
    v28 = (void *)*((_QWORD *)v14 + 67);
    *((_QWORD *)v14 + 67) = v27;

    v29 = dispatch_queue_create("com.apple.exportOperation.storyQueue", v26);
    v30 = (void *)*((_QWORD *)v14 + 55);
    *((_QWORD *)v14 + 55) = v29;

    v31 = dispatch_queue_create("com.apple.exportOperation.audioQueue", v26);
    v32 = (void *)*((_QWORD *)v14 + 62);
    *((_QWORD *)v14 + 62) = v31;

    v33 = dispatch_semaphore_create(0);
    v34 = (void *)*((_QWORD *)v14 + 53);
    *((_QWORD *)v14 + 53) = v33;

    v35 = dispatch_semaphore_create(2);
    v36 = (void *)*((_QWORD *)v14 + 54);
    *((_QWORD *)v14 + 54) = v35;

    +[PXStoryExportManager frequentSignpostLog](PXStoryExportManager, "frequentSignpostLog");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)*((_QWORD *)v14 + 44);
    *((_QWORD *)v14 + 44) = v37;

    *((_QWORD *)v14 + 45) = os_signpost_id_make_with_pointer(*((os_log_t *)v14 + 44), v14);
    v39 = os_log_create((const char *)*MEMORY[0x1E0D744D8], "StoryExportSignPost");
    v40 = (void *)*((_QWORD *)v14 + 42);
    *((_QWORD *)v14 + 42) = v39;

    *((_QWORD *)v14 + 43) = os_signpost_id_make_with_pointer(*((os_log_t *)v14 + 42), v14);
    objc_msgSend(v14, "_initializeProgress");

  }
  return (_PXStoryExportOperation *)v14;
}

- (void)dealloc
{
  NSProgress *progress;
  objc_super v4;

  progress = self->_progress;
  if (progress)
    -[NSProgress removeObserver:forKeyPath:](progress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
  v4.receiver = self;
  v4.super_class = (Class)_PXStoryExportOperation;
  -[_PXStoryExportOperation dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PXStoryExportOperation;
  -[_PXStoryExportOperation cancel](&v5, sel_cancel);
  -[_PXStoryExportOperation progress](self, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCancellationHandler:", 0);

  -[_PXStoryExportOperation progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[_PXStoryExportOperation _signalSemaphoresForFailedExport](self, "_signalSemaphoresForFailedExport");
}

- (BOOL)isCancelled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXStoryExportOperation;
  return -[_PXStoryExportOperation isCancelled](&v3, sel_isCancelled);
}

- (BOOL)shouldContinueExporting
{
  void *v3;
  _BOOL4 v4;

  -[_PXStoryExportOperation error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    LOBYTE(v4) = 0;
  else
    v4 = !-[_PXStoryExportOperation isCancelled](self, "isCancelled");

  return v4;
}

- (void)_setError:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___PXStoryExportOperation__setError___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);
  if (v6)
    -[_PXStoryExportOperation _signalSemaphoresForFailedExport](self, "_signalSemaphoresForFailedExport");

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
  v9 = __Block_byref_object_copy__227345;
  v10 = __Block_byref_object_dispose__227346;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32___PXStoryExportOperation_error__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (void)_setStatus:(int64_t)a3
{
  NSObject *stateQueue;
  _QWORD v4[6];

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38___PXStoryExportOperation__setStatus___block_invoke;
  v4[3] = &unk_1E5144EB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

- (int64_t)status
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
  v5[2] = __33___PXStoryExportOperation_status__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasAudioForExport
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44___PXStoryExportOperation_hasAudioForExport__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setHasAudioForExport:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  BOOL v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49___PXStoryExportOperation__setHasAudioForExport___block_invoke;
  v4[3] = &unk_1E5144398;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, v4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exportDuration
{
  NSObject *stateQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1A7E74EE7;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41___PXStoryExportOperation_exportDuration__block_invoke;
  v6[3] = &unk_1E5141AE0;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  dispatch_sync(stateQueue, v6);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)_setExportDuration:(id *)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46___PXStoryExportOperation__setExportDuration___block_invoke;
  v4[3] = &unk_1E51446C8;
  v4[4] = self;
  v5 = *a3;
  dispatch_sync(stateQueue, v4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  NSObject *stateQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1A7E74EE7;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40___PXStoryExportOperation_outroDuration__block_invoke;
  v6[3] = &unk_1E5141AE0;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  dispatch_sync(stateQueue, v6);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (void)_setOutroDuration:(id *)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45___PXStoryExportOperation__setOutroDuration___block_invoke;
  v4[3] = &unk_1E51446C8;
  v4[4] = self;
  v5 = *a3;
  dispatch_sync(stateQueue, v4);
}

- (PXStoryStyle)exportedStyle
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
  v9 = __Block_byref_object_copy__227345;
  v10 = __Block_byref_object_dispose__227346;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40___PXStoryExportOperation_exportedStyle__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PXStoryStyle *)v3;
}

- (void)_setExportedStyle:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___PXStoryExportOperation__setExportedStyle___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

- (void)_signalSemaphoresForFailedExport
{
  NSObject *v3;
  NSObject *v4;

  -[_PXStoryExportOperation layoutCompleteSemaphore](self, "layoutCompleteSemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v3);

  -[_PXStoryExportOperation completedWritingVideoFrameSemaphore](self, "completedWritingVideoFrameSemaphore");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);

}

- (void)main
{
  OS_os_log *v3;
  NSObject *v4;
  os_signpost_id_t signpostID;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  OS_os_log *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  uint64_t v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  _BYTE *v32;
  uint8_t v33[4];
  void *v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = self->_signpostLog;
  v4 = v3;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXStoryExportOperation destinationURL](self, "destinationURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequest", "beginning story export %{public}@ to %@", buf, 0x16u);

  }
  -[_PXStoryExportOperation collectAnalyticsForExportBegin](self, "collectAnalyticsForExportBegin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v36 = __Block_byref_object_copy__227345;
  v37 = __Block_byref_object_dispose__227346;
  v9 = MEMORY[0x1E0C809B0];
  v38 = 0;
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __31___PXStoryExportOperation_main__block_invoke;
  v31 = &unk_1E51482E0;
  v32 = buf;
  px_dispatch_on_main_queue();
  -[_PXStoryExportOperation _setStatus:](self, "_setStatus:", 1);
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    -[_PXStoryExportOperation _setupStoryModel](self, "_setupStoryModel");
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    -[_PXStoryExportOperation _preloadStoryResourcesAndWaitForBuffering](self, "_preloadStoryResourcesAndWaitForBuffering");
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    -[_PXStoryExportOperation _setupAudioExporting](self, "_setupAudioExporting");
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    -[_PXStoryExportOperation _setupWriter](self, "_setupWriter");
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    -[_PXStoryExportOperation _setupStoryLayout](self, "_setupStoryLayout");
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
  {
    if (-[_PXStoryExportOperation hasAudioForExport](self, "hasAudioForExport"))
    {
      v26[0] = v9;
      v26[1] = 3221225472;
      v26[2] = __31___PXStoryExportOperation_main__block_invoke_2;
      v26[3] = &unk_1E5149198;
      v10 = dispatch_semaphore_create(0);
      v27 = v10;
      -[_PXStoryExportOperation _exportAudioWithCompletionHandler:](self, "_exportAudioWithCompletionHandler:", v26);

    }
    else
    {
      v10 = 0;
    }
    -[_PXStoryExportOperation _exportVideo](self, "_exportVideo");
    if (v10)
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
      -[_PXStoryExportOperation _finishWriting](self, "_finishWriting");

  }
  -[_PXStoryExportOperation error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    if (-[_PXStoryExportOperation isCancelled](self, "isCancelled"))
    {
      PLStoryGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v33 = 138412290;
        v34 = v14;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_INFO, "Export %@ cancelled", v33, 0xCu);

      }
      PXStoryErrorCreateWithCodeDebugFormat(11, CFSTR("Export Cancelled"), v15, v16, v17, v18, v19, v20, v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryExportOperation _setError:](self, "_setError:", v21);

    }
    else
    {
      -[_PXStoryExportOperation _setStatus:](self, "_setStatus:", 2);
    }
  }
  px_dispatch_on_main_queue();
  -[_PXStoryExportOperation collectAnalyticsForExportEnd:](self, "collectAnalyticsForExportEnd:", v8);
  v22 = self->_signpostLog;
  v23 = v22;
  v24 = self->_signpostID;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v22))
  {
    *(_WORD *)v33 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v23, OS_SIGNPOST_INTERVAL_END, v24, "StoryExportRequest", ", v33, 2u);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_setupWriter
{
  OS_os_log *v3;
  NSObject *v4;
  os_signpost_id_t signpostID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  OS_os_log *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  id v27;
  id v28;
  uint8_t buf[16];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = self->_signpostLog;
  v4 = v3;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v6;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequestSetupVideoWriter", "begin video writer setup for export %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExportOperation destinationURL](self, "destinationURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "fileExistsAtPath:", v9);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXStoryExportOperation destinationURL](self, "destinationURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v11, "removeItemAtURL:error:", v12, &v28);
    v13 = v28;

    if (v13)
    {
      -[_PXStoryExportOperation _setError:](self, "_setError:", v13);
      goto LABEL_23;
    }
  }
  v14 = objc_alloc(MEMORY[0x1E0C8B018]);
  -[_PXStoryExportOperation destinationURL](self, "destinationURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0C8A2E8];
  v27 = 0;
  v17 = (void *)objc_msgSend(v14, "initWithURL:fileType:error:", v15, v16, &v27);
  v13 = v27;

  if (v13)
    goto LABEL_8;
  -[_PXStoryExportOperation setAssetWriter:](self, "setAssetWriter:", v17);
  -[_PXStoryExportOperation _addVideoInputToAssetWriter:](self, "_addVideoInputToAssetWriter:", v17);
  if (!-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    goto LABEL_18;
  if (-[_PXStoryExportOperation hasAudioForExport](self, "hasAudioForExport"))
    -[_PXStoryExportOperation _addAudioInputToAssetWriter:](self, "_addAudioInputToAssetWriter:", v17);
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    -[_PXStoryExportOperation _addMetadataToAssetWriter:](self, "_addMetadataToAssetWriter:", v17);
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
  {
    if (objc_msgSend(v17, "startWriting"))
    {
      -[_PXStoryExportOperation assetWriter](self, "assetWriter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
      v30 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      objc_msgSend(v23, "startSessionAtSourceTime:", buf);
      v13 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v17, "error");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
LABEL_8:
      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v13, CFSTR("Failed to setup asset writer"), v18, v19, v20, v21, v22, (uint64_t)v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryExportOperation _setError:](self, "_setError:", v23);
LABEL_9:

    }
  }
  else
  {
LABEL_18:
    v13 = 0;
  }
  v24 = self->_signpostLog;
  v25 = v24;
  v26 = self->_signpostID;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v25, OS_SIGNPOST_INTERVAL_END, v26, "StoryExportRequestSetupVideoWriter", ", buf, 2u);
  }

LABEL_23:
}

- (void)_addMetadataToAssetWriter:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C8B278];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setKeySpace:", *MEMORY[0x1E0C8A9E8]);
  objc_msgSend(v5, "setKey:", *MEMORY[0x1E0C8AAB0]);
  objc_msgSend(v5, "setValue:", CFSTR("Memories"));
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:", v6);

}

- (void)_finishWriting
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  dispatch_semaphore_t v18;

  if (-[_PXStoryExportOperation isCancelled](self, "isCancelled"))
  {
    -[_PXStoryExportOperation assetWriter](self, "assetWriter");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject cancelWriting](v3, "cancelWriting");
  }
  else
  {
    v4 = dispatch_semaphore_create(0);
    -[_PXStoryExportOperation assetWriter](self, "assetWriter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41___PXStoryExportOperation__finishWriting__block_invoke;
    v17[3] = &unk_1E5149198;
    v18 = v4;
    v3 = v4;
    objc_msgSend(v5, "finishWritingWithCompletionHandler:", v17);

    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }

  -[_PXStoryExportOperation error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[_PXStoryExportOperation assetWriter](self, "assetWriter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "status");

    if (v8 != 3)
      return;
    -[_PXStoryExportOperation assetWriter](self, "assetWriter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v9, CFSTR("failed to finish writing asset"), v10, v11, v12, v13, v14, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXStoryExportOperation _setError:](self, "_setError:", v15);

  }
}

- (void)_setupStoryModel
{
  NSObject *v4;
  _QWORD v5[6];

  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43___PXStoryExportOperation__setupStoryModel__block_invoke;
  v5[3] = &unk_1E5144EB8;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);

}

- (void)_preloadStoryResourcesAndWaitForBuffering
{
  OS_os_log *v3;
  NSObject *v4;
  os_signpost_id_t signpostID;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  OS_os_log *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  _QWORD v18[5];
  _QWORD v19[7];
  uint8_t v20[16];
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _PXStoryExportOperation *v24;
  _QWORD *v25;
  __int128 *p_buf;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  _QWORD block[7];
  _QWORD v31[5];
  id v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = self->_signpostLog;
  v4 = v3;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequestPreloadStoryResources", "preload story resources for export %{public}@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__227345;
  v36 = __Block_byref_object_dispose__227346;
  v37 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__227345;
  v31[4] = __Block_byref_object_dispose__227346;
  v32 = 0;
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke;
  block[3] = &unk_1E51401A8;
  block[4] = self;
  block[5] = &buf;
  block[6] = v31;
  dispatch_sync(v7, block);

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExportOperation progress](self, "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChild:withPendingUnitCount:", v9, 30);

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__227345;
  v28[4] = __Block_byref_object_dispose__227346;
  v29 = 0;
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_4;
  v22[3] = &unk_1E51391A0;
  v25 = v28;
  p_buf = &buf;
  v27 = 7;
  v12 = v9;
  v23 = v12;
  v24 = self;
  dispatch_sync(v11, v22);

  *(_OWORD *)v20 = *MEMORY[0x1E0CA2E30];
  v21 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  -[_PXStoryExportOperation _waitForStoryStateWhileExportingCanContinueByWatchingChanges:timeout:verificationBlock:](self, "_waitForStoryStateWhileExportingCanContinueByWatchingChanges:timeout:verificationBlock:", 0x200000, v20, &__block_literal_global_251_227498);
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_7;
  v19[3] = &unk_1E5139248;
  v19[4] = v28;
  v19[5] = &buf;
  v19[6] = v31;
  dispatch_sync(v13, v19);

  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
  {
    -[_PXStoryExportOperation storyQueue](self, "storyQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_10;
    v18[3] = &unk_1E5149198;
    v18[4] = self;
    dispatch_sync(v14, v18);

  }
  v15 = self->_signpostLog;
  v16 = v15;
  v17 = self->_signpostID;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v15))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_END, v17, "StoryExportRequestPreloadStoryResources", ", v20, 2u);
  }

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&buf, 8);
}

- (BOOL)_waitForStoryStateWhileExportingCanContinueByWatchingChanges:(unint64_t)a3 timeout:(id *)a4 verificationBlock:(id)a5
{
  id v8;
  dispatch_semaphore_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  char v22;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;
  _QWORD block[5];
  NSObject *v25;
  NSObject *v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD v31[3];
  char v32;
  _QWORD v33[5];
  id v34;

  v8 = a5;
  v9 = dispatch_semaphore_create(0);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__227345;
  v33[4] = __Block_byref_object_dispose__227346;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke;
  block[3] = &unk_1E5139298;
  v28 = v33;
  block[4] = self;
  v30 = a3;
  v12 = v10;
  v25 = v12;
  v13 = v8;
  v27 = v13;
  v29 = v31;
  v14 = v9;
  v26 = v14;
  dispatch_sync(v12, block);
  v23 = *a4;
  LOBYTE(a4) = -[_PXStoryExportOperation _waitWhileExportingCanContinueForSemaphore:timeout:](self, "_waitWhileExportingCanContinueForSemaphore:timeout:", v14, &v23);
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke_3;
  v18[3] = &unk_1E51392C0;
  v22 = (char)a4;
  v20 = v33;
  v21 = v31;
  v19 = v14;
  v16 = v14;
  dispatch_sync(v15, v18);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  return (char)a4;
}

- (PXMediaProvider)storyQueue_mediaProvider
{
  NSObject *v3;
  PXMediaProvider *storyQueue_mediaProvider;
  void *v5;
  void *v6;
  PXMediaProvider *v7;
  PXMediaProvider *v8;

  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  storyQueue_mediaProvider = self->_storyQueue_mediaProvider;
  if (!storyQueue_mediaProvider)
  {
    -[_PXStoryExportOperation configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storyConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "mediaProvider");
    v7 = (PXMediaProvider *)objc_claimAutoreleasedReturnValue();
    v8 = self->_storyQueue_mediaProvider;
    self->_storyQueue_mediaProvider = v7;

    storyQueue_mediaProvider = self->_storyQueue_mediaProvider;
  }
  return storyQueue_mediaProvider;
}

- (void)_setupStoryLayout
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  _QWORD block[5];

  -[_PXStoryExportOperation videoWriterQueue](self, "videoWriterQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___PXStoryExportOperation__setupStoryLayout__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_sync(v4, block);

  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
  {
    -[_PXStoryExportOperation storyQueue](self, "storyQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __44___PXStoryExportOperation__setupStoryLayout__block_invoke_3;
    v7[3] = &unk_1E5144EB8;
    v7[4] = self;
    v7[5] = a2;
    dispatch_sync(v6, v7);

  }
}

- (id)_storyQueue_createStoryModel
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  PXStoryRecipeManager *v15;
  PXStoryResourcesDataSourceManager *v16;
  PXStoryStyleManager *v17;
  void *v18;
  PXStoryStyleManager *v19;
  PXStoryTimelineSpecManager *v20;
  void *v21;
  PXStoryLayoutSpecManager *v22;
  PXStoryModel *v23;

  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_PXStoryExportOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storyConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copyWithStoryQueue:", v6);

  v8 = os_log_create((const char *)*MEMORY[0x1E0D744D8], "Export");
  objc_msgSend(v7, "setLog:", v8);

  objc_msgSend(v7, "setOptions:", 1);
  -[_PXStoryExportOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timelineProducer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    PXStoryTimelineProducerCreateDefault();
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = -[PXStoryRecipeManager initWithConfiguration:]([PXStoryRecipeManager alloc], "initWithConfiguration:", v7);
  v16 = -[PXStoryResourcesDataSourceManager initWithRecipeManager:]([PXStoryResourcesDataSourceManager alloc], "initWithRecipeManager:", v15);
  v17 = [PXStoryStyleManager alloc];
  objc_msgSend(v7, "errorReporter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PXStoryStyleManager initWithRecipeManager:errorReporter:](v17, "initWithRecipeManager:errorReporter:", v15, v18);

  v20 = -[PXStoryTimelineSpecManager initWithExtendedTraitCollection:configuration:]([PXStoryTimelineSpecManager alloc], "initWithExtendedTraitCollection:configuration:", v10, v7);
  +[PXStoryTimelineManager timelineManagerWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:configuration:loadingCoordinator:paperTrailOptions:](PXStoryTimelineManager, "timelineManagerWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:configuration:loadingCoordinator:paperTrailOptions:", v14, v16, v19, v20, v7, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PXStoryLayoutSpecManager initWithExtendedTraitCollection:options:storyConfigurationOptions:]([PXStoryLayoutSpecManager alloc], "initWithExtendedTraitCollection:options:storyConfigurationOptions:", v10, 0, objc_msgSend(v7, "options"));
  v23 = -[PXStoryModel initWithTimelineManager:layoutSpecManager:configuration:]([PXStoryModel alloc], "initWithTimelineManager:layoutSpecManager:configuration:", v21, v22, v7);

  return v23;
}

- (void)_advanceLayoutToStoryTime:(id *)a3
{
  OS_os_log *v5;
  NSObject *v6;
  os_signpost_id_t frequentSignpostID;
  Float64 Seconds;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  int64_t var3;
  CMTime time;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = self->_frequentSignpostLog;
  v6 = v5;
  frequentSignpostID = self->_frequentSignpostID;
  if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    time = (CMTime)*a3;
    Seconds = CMTimeGetSeconds(&time);
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 134218242;
    *(Float64 *)((char *)&time.value + 4) = Seconds;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, frequentSignpostID, "StoryExportLayoutRenderVideoFrame", "request layout render at %f for export %{public}@", (uint8_t *)&time, 0x16u);

  }
  objc_initWeak((id *)&time, self);
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53___PXStoryExportOperation__advanceLayoutToStoryTime___block_invoke;
  v11[3] = &unk_1E5142558;
  objc_copyWeak(&v12, (id *)&time);
  v13 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  dispatch_async(v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&time);
}

- (void)_storyQueue_advanceLayoutToStoryTime:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OS_os_log *v14;
  NSObject *v15;
  os_signpost_id_t frequentSignpostID;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v20[56];
  CMTime v21;
  CMTime rhs;
  CMTime lhs;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[_PXStoryExportOperation storyQueue_pacingController](self, "storyQueue_pacingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  memset(&v21, 0, sizeof(v21));
  if (v7)
    objc_msgSend(v7, "currentTime");
  else
    memset(&v20[32], 0, 24);
  lhs = (CMTime)*a3;
  rhs = *(CMTime *)&v20[32];
  CMTimeSubtract(&v21, &lhs, &rhs);
  if ((objc_msgSend(v6, "canChangePlaybackTime") & 1) == 0)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "reasonPreventingPlaybackTimeChange");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(lhs.value) = 138412290;
      *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v19;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Export is not able to advance playback time as expected because %@", (uint8_t *)&lhs, 0xCu);

    }
  }
  lhs = v21;
  objc_msgSend(v8, "incrementByTime:", &lhs);
  -[_PXStoryExportOperation storyQueue_engine](self, "storyQueue_engine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsUpdate");

  -[_PXStoryExportOperation storyQueue_engine](self, "storyQueue_engine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayLink");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  lhs = v21;
  rhs = v21;
  *(CMTime *)v20 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (!CMTimeCompare(&rhs, (CMTime *)v20))
    CMTimeMake(&lhs, 1, 600);
  rhs = lhs;
  objc_msgSend(v13, "incrementTargetTimeWithInterval:", CMTimeGetSeconds(&rhs));
  v14 = self->_frequentSignpostLog;
  v15 = v14;
  frequentSignpostID = self->_frequentSignpostID;
  if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v14))
  {
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(rhs.value) = 138543362;
    *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)v17;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_BEGIN, frequentSignpostID, "StoryExportLayoutRenderLoadingSpriteContent", "loading layout sprites for export %{public}@", (uint8_t *)&rhs, 0xCu);

  }
  -[_PXStoryExportOperation storyQueue_engine](self, "storyQueue_engine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateIfNeeded");

}

- (void)_storyQueue_processRenderedLayoutPixelBuffer:(__CVBuffer *)a3
{
  NSObject *v5;
  NSObject *v6;
  OS_os_log *v7;
  NSObject *v8;
  os_signpost_id_t frequentSignpostID;
  void *v10;
  void *v11;
  _QWORD v12[3];
  uint8_t buf[16];

  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[_PXStoryExportOperation layoutCompleteSemaphore](self, "layoutCompleteSemaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

  v7 = self->_frequentSignpostLog;
  v8 = v7;
  frequentSignpostID = self->_frequentSignpostID;
  if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, frequentSignpostID, "StoryExportLayoutRenderVideoFrame", ", buf, 2u);
  }

  -[_PXStoryExportOperation storyQueue_pacingController](self, "storyQueue_pacingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "currentTime");
  else
    memset(v12, 0, sizeof(v12));
  -[_PXStoryExportOperation _writeVideoWithPixelBuffer:forStoryTime:](self, "_writeVideoWithPixelBuffer:forStoryTime:", a3, v12);

}

- (void)_addVideoInputToAssetWriter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD block[5];
  id v21;

  v19 = a3;
  -[_PXStoryExportOperation _videoOutputSettings](self, "_videoOutputSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C8B020]);
  v6 = (void *)objc_msgSend(v5, "initWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v4);
  objc_msgSend(v6, "setExpectsMediaDataInRealTime:", 0);
  -[_PXStoryExportOperation pixelBufferAttributes](self, "pixelBufferAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B038]), "initWithAssetWriterInput:sourcePixelBufferAttributes:", v6, v7);
  -[_PXStoryExportOperation videoWriterQueue](self, "videoWriterQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___PXStoryExportOperation__addVideoInputToAssetWriter___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v21 = v8;
  v10 = v8;
  dispatch_sync(v9, block);

  if ((objc_msgSend(v19, "canAddInput:", v6) & 1) == 0)
  {
    PXStoryErrorCreateWithCodeDebugFormat(10, CFSTR("Cannot add video input"), v11, v12, v13, v14, v15, v16, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXStoryExportOperation _setError:](self, "_setError:", v17);

  }
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    objc_msgSend(v19, "addInput:", v6);

}

- (id)_videoOutputSettings
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_PXStoryExportOperation videoOptions](self, "videoOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolutionInPixels");
  v6 = v5;
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C8AF60]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C8AEF0]);

  -[_PXStoryExportOperation videoOptions](self, "videoOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "codec");

  v13 = (_QWORD *)MEMORY[0x1E0C8AE70];
  if (v12)
  {
    if (v12 != 1)
      goto LABEL_6;
    if ((objc_msgSend(MEMORY[0x1E0D75128], "currentDeviceHEVCCapabilities") & 1) != 0)
      v13 = (_QWORD *)MEMORY[0x1E0C8AE78];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v13, *MEMORY[0x1E0C8AE68]);
LABEL_6:
  -[_PXStoryExportOperation videoOptions](self, "videoOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "averageBitratePerSecond");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v19 = *MEMORY[0x1E0C8AE20];
    v20[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0C8AEB8]);

  }
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (id)pixelBufferAttributes
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_PXStoryExportOperation videoOptions](self, "videoOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolutionInPixels");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E53EED48, *MEMORY[0x1E0CA9040]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CA90E0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CA8FD8]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA9010]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (void)_writeVideoWithPixelBuffer:(__CVBuffer *)a3 forStoryTime:(id *)a4
{
  NSObject *v7;
  _QWORD v8[4];
  id v9[2];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  id location;

  CVPixelBufferRetain(a3);
  objc_initWeak(&location, self);
  -[_PXStoryExportOperation videoWriterQueue](self, "videoWriterQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___PXStoryExportOperation__writeVideoWithPixelBuffer_forStoryTime___block_invoke;
  v8[3] = &unk_1E5139328;
  objc_copyWeak(v9, &location);
  v9[1] = a3;
  v10 = *a4;
  dispatch_async(v7, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_videoWriterQueue_writeVideoWithPixelBuffer:(__CVBuffer *)a3 forStoryTime:(id *)a4
{
  NSObject *v7;
  OS_os_log *v8;
  NSObject *v9;
  os_signpost_id_t frequentSignpostID;
  Float64 Seconds;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  OS_os_log *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  _BYTE v29[24];
  CMTime v30;
  __int128 v31;
  int64_t var3;
  char v33;
  CMTime rhs;
  CMTime time;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[_PXStoryExportOperation videoWriterQueue](self, "videoWriterQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = self->_frequentSignpostLog;
  v9 = v8;
  frequentSignpostID = self->_frequentSignpostID;
  if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v8))
  {
    time = (CMTime)*a4;
    Seconds = CMTimeGetSeconds(&time);
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 134218242;
    *(Float64 *)((char *)&time.value + 4) = Seconds;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = v12;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, frequentSignpostID, "StoryExportWriteVideoFrame", "append video frame at %f for export %{public}@", (uint8_t *)&time, 0x16u);

  }
  -[_PXStoryExportOperation videoWriterQueue_pixelBufferWriter](self, "videoWriterQueue_pixelBufferWriter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetWriterInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "isReadyForMoreMediaData") & 1) == 0)
  {
    do
    {
      if (!-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
        break;
      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 0.01);
    }
    while (!objc_msgSend(v14, "isReadyForMoreMediaData"));
  }
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
  {
    -[_PXStoryExportOperation videoQueue_firstWrittenStoryTime](self, "videoQueue_firstWrittenStoryTime");
    if ((v33 & 1) == 0)
    {
      v31 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      -[_PXStoryExportOperation setVideoQueue_firstWrittenStoryTime:](self, "setVideoQueue_firstWrittenStoryTime:", &v31);
    }
    -[_PXStoryExportOperation videoQueue_firstWrittenStoryTime](self, "videoQueue_firstWrittenStoryTime");
    time = (CMTime)*a4;
    rhs = *(CMTime *)v29;
    CMTimeSubtract(&v30, &time, &rhs);
    time = v30;
    -[_PXStoryExportOperation videoWriterQueue_pixelBufferWriter](self, "videoWriterQueue_pixelBufferWriter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    rhs = time;
    v16 = objc_msgSend(v15, "appendPixelBuffer:withPresentationTime:", a3, &rhs);

    if ((v16 & 1) == 0)
    {
      -[_PXStoryExportOperation assetWriter](self, "assetWriter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v18, CFSTR("failed to write sample with assetWriterAdapter"), v19, v20, v21, v22, v23, *(uint64_t *)v29);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryExportOperation _setError:](self, "_setError:", v24);

    }
  }
  -[_PXStoryExportOperation completedWritingVideoFrameSemaphore](self, "completedWritingVideoFrameSemaphore");
  v25 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v25);

  v26 = self->_frequentSignpostLog;
  v27 = v26;
  v28 = self->_frequentSignpostID;
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v26))
  {
    LOWORD(time.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v27, OS_SIGNPOST_INTERVAL_END, v28, "StoryExportWriteVideoFrame", ", (uint8_t *)&time, 2u);
  }

}

- (void)_exportVideo
{
  OS_os_log *v3;
  NSObject *v4;
  os_signpost_id_t signpostID;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double Seconds;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  float v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  intptr_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  OS_os_log *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  _QWORD v34[5];
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  _QWORD block[5];
  id v41;
  id location;
  CMTime time2;
  CMTime buf;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = self->_signpostLog;
  v4 = v3;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138543362;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v6;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportVideo", "exporting video %{public}@", (uint8_t *)&buf, 0xCu);

  }
  objc_initWeak(&location, self);
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39___PXStoryExportOperation__exportVideo__block_invoke;
  block[3] = &unk_1E5147280;
  block[4] = self;
  objc_copyWeak(&v41, &location);
  dispatch_sync(v7, block);

  memset(&v39, 0, sizeof(v39));
  -[_PXStoryExportOperation exportDuration](self, "exportDuration");
  v38.epoch = 0;
  *(_OWORD *)&v38.value = PXStoryTimeZero;
  -[_PXStoryExportOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "videoOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v36, 1, objc_msgSend(v9, "frameRate"));
  v37 = v36;

  buf = v39;
  Seconds = CMTimeGetSeconds(&buf);
  buf = v37;
  v11 = CMTimeGetSeconds(&buf);
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExportOperation progress](self, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addChild:withPendingUnitCount:", v12, 70);

  v14 = 0;
  v15 = Seconds / v11;
  v16 = vcvtps_s32_f32(v15);
  do
  {
    if (!-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
      break;
    buf = v38;
    time2 = v39;
    if ((CMTimeCompare(&buf, &time2) & 0x80000000) == 0)
      break;
    v17 = (void *)MEMORY[0x1A85CE17C]();
    buf = v38;
    -[_PXStoryExportOperation _advanceLayoutToStoryTime:](self, "_advanceLayoutToStoryTime:", &buf);
    -[_PXStoryExportOperation layoutCompleteSemaphore](self, "layoutCompleteSemaphore");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_time(0, 30000000000);
    v20 = dispatch_semaphore_wait(v18, v19);

    if (v20)
    {
      buf = v38;
      *(double *)&v21 = CMTimeGetSeconds(&buf);
      PXStoryErrorCreateWithCodeDebugFormat(10, CFSTR("timed out waiting for layout to complete at time %f"), v22, v23, v24, v25, v26, v27, v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryExportOperation _setError:](self, "_setError:", v28);

    }
    else
    {
      -[_PXStoryExportOperation completedWritingVideoFrameSemaphore](self, "completedWritingVideoFrameSemaphore");
      v29 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);

      buf = v38;
      time2 = v37;
      CMTimeAdd(&v35, &buf, &time2);
      v38 = v35;
      ++v14;
      objc_msgSend(v12, "setCompletedUnitCount:", (uint64_t)(double)(100 * v14 / v16));
      if (__ROR8__(0x888888888888888 - 0x1111111111111111 * v14, 1) <= 0x888888888888888uLL)
      {
        buf = v38;
        -[_PXStoryExportOperation _checkForDriftFromCurrentTime:](self, "_checkForDriftFromCurrentTime:", &buf);
      }
    }
    objc_autoreleasePoolPop(v17);
  }
  while (!v20);
  -[_PXStoryExportOperation videoWriterQueue](self, "videoWriterQueue");
  v30 = objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __39___PXStoryExportOperation__exportVideo__block_invoke_3;
  v34[3] = &unk_1E5149198;
  v34[4] = self;
  dispatch_sync(v30, v34);

  v31 = self->_signpostLog;
  v32 = v31;
  v33 = self->_signpostID;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v31))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v32, OS_SIGNPOST_INTERVAL_END, v33, "StoryExportVideo", ", (uint8_t *)&buf, 2u);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)_checkForDriftFromCurrentTime:(id *)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  id location;

  objc_initWeak(&location, self);
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___PXStoryExportOperation__checkForDriftFromCurrentTime___block_invoke;
  block[3] = &unk_1E5142558;
  objc_copyWeak(&v7, &location);
  v8 = *a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_storyQueue_checkForDriftFromCurrentTime:(id *)a3
{
  void *v5;
  void *v6;
  double Seconds;
  NSObject *v8;
  Float64 v9;
  Float64 v10;
  CMTime v11;
  __int128 v12;
  CMTime time;
  Float64 v14;
  __int16 v15;
  _PXStoryExportOperation *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_storyQueue_hasEncounteredDriftError)
  {
    v12 = 0uLL;
    -[_PXStoryExportOperation storyQueue_storyModel](self, "storyQueue_storyModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "nominalPlaybackTime");
    else
      v12 = 0uLL;

    *(_OWORD *)&time.value = v12;
    time.epoch = 0;
    *(_OWORD *)&v11.value = *(_OWORD *)&a3->var0;
    v11.epoch = a3->var3;
    Seconds = CMTimeGetSeconds(&time);
    time = v11;
    if (vabdd_f64(Seconds, CMTimeGetSeconds(&time)) > 0.5)
    {
      self->_storyQueue_hasEncounteredDriftError = 1;
      PLStoryGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        time = (CMTime)*a3;
        v9 = CMTimeGetSeconds(&time);
        *(_OWORD *)&time.value = v12;
        time.epoch = 0;
        v10 = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 134218754;
        *(CMTimeValue *)((char *)&time.value + 4) = 0x3FE0000000000000;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = v9;
        HIWORD(time.epoch) = 2048;
        v14 = v10;
        v15 = 2112;
        v16 = self;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_FAULT, "Unexpected drift (>%.2fs) between export current time (%.2fs) and story model nominal playback time (%.2fs) during export operation %@", (uint8_t *)&time, 0x2Au);
      }

    }
  }
}

- (void)_setupAudioExporting
{
  PXStoryExportAudioCompositionBuilder *v3;
  PXStoryExportAudioCompositionBuilder *v4;
  NSObject *v5;
  _QWORD v6[4];
  PXStoryExportAudioCompositionBuilder *v7;
  _PXStoryExportOperation *v8;
  char v9[24];
  char v10[24];

  v3 = [PXStoryExportAudioCompositionBuilder alloc];
  -[_PXStoryExportOperation exportDuration](self, "exportDuration");
  -[_PXStoryExportOperation outroDuration](self, "outroDuration");
  v4 = -[PXStoryExportAudioCompositionBuilder initWithMaximumDuration:outroDuration:](v3, "initWithMaximumDuration:outroDuration:", v10, v9);
  -[_PXStoryExportOperation _addSongAssetToAudioCompositionBuilder:](self, "_addSongAssetToAudioCompositionBuilder:", v4);
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    -[_PXStoryExportOperation _addAudioAssetsForVideoHilightsToAudioCompositionBuilder:](self, "_addAudioAssetsForVideoHilightsToAudioCompositionBuilder:", v4);
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
  {
    -[_PXStoryExportOperation audioQueue](self, "audioQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47___PXStoryExportOperation__setupAudioExporting__block_invoke;
    v6[3] = &unk_1E5148D08;
    v7 = v4;
    v8 = self;
    dispatch_sync(v5, v6);

  }
}

- (void)_addSongAssetToAudioCompositionBuilder:(id)a3
{
  id v5;
  OS_os_log *v6;
  NSObject *v7;
  os_signpost_id_t signpostID;
  void *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  OS_os_log *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  CMTime v18;
  CMTime v19;
  _QWORD block[5];
  id v21;
  NSObject *v22;
  __int128 *p_buf;
  uint64_t *v24;
  SEL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_signpostLog;
  v7 = v6;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequestMusicAsset", "requesting music asset for %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v10 = dispatch_semaphore_create(0);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__227345;
  v33 = __Block_byref_object_dispose__227346;
  v34 = 0;
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___PXStoryExportOperation__addSongAssetToAudioCompositionBuilder___block_invoke;
  block[3] = &unk_1E51393A0;
  block[4] = self;
  p_buf = &buf;
  v24 = &v26;
  v25 = a2;
  v12 = v5;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  dispatch_sync(v11, block);

  if (v27[3])
  {
    memset(&v19, 0, sizeof(v19));
    CMTimeMakeWithSeconds(&v19, 120.0, 600);
    v18 = v19;
    if (!-[_PXStoryExportOperation _waitWhileExportingCanContinueForSemaphore:timeout:](self, "_waitWhileExportingCanContinueForSemaphore:timeout:", v13, &v18))
    {
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "cancelRequest:", v27[3]);
      v14 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v13, v14);
    }
  }
  v15 = self->_signpostLog;
  v16 = v15;
  v17 = self->_signpostID;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v15))
  {
    LOWORD(v19.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_END, v17, "StoryExportRequestMusicAsset", ", (uint8_t *)&v19, 2u);
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v26, 8);

}

- (void)_handleMediaRequestCompletedForSongAsset:(id)a3 avAsset:(id)a4 audioMix:(id)a5 info:(id)a6 audioCompositionBuilder:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  _PXStoryExportOperation *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[_PXStoryExportOperation audioQueue](self, "audioQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114___PXStoryExportOperation__handleMediaRequestCompletedForSongAsset_avAsset_audioMix_info_audioCompositionBuilder___block_invoke;
  block[3] = &unk_1E51393C8;
  v24 = v13;
  v25 = self;
  v26 = v15;
  v27 = v12;
  v28 = v16;
  v29 = v14;
  v18 = v14;
  v19 = v16;
  v20 = v12;
  v21 = v15;
  v22 = v13;
  dispatch_sync(v17, block);

}

- (void)_addAudioAssetsForVideoHilightsToAudioCompositionBuilder:(id)a3
{
  void *v4;
  PXVideoRequestOptions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD block[4];
  NSObject *v30;
  _QWORD *v31;
  CMTime v32;
  _QWORD v33[6];
  id v34;
  NSObject *v35;
  _QWORD *v36;
  _QWORD v37[3];
  char v38;
  _OWORD v39[3];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CMTime v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  -[_PXStoryExportOperation _audibleVideoHilightsInStory](self, "_audibleVideoHilightsInStory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v47, 0, sizeof(v47));
    CMTimeMakeWithSeconds(&v47, 30.0, 600);
    v5 = objc_alloc_init(PXVideoRequestOptions);
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXSetupPXVideoRequestOptionsForDeliveryQuality(v5, objc_msgSend(v6, "exportVideoQuality"));

    -[PXVideoRequestOptions setNetworkAccessAllowed:](v5, "setNetworkAccessAllowed:", 1);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v24;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v44;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v7);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v7), "loadingVideoTimeRange");
        }
        else
        {
          v41 = 0u;
          v42 = 0u;
          v40 = 0u;
        }
        v39[0] = v40;
        v39[1] = v41;
        v39[2] = v42;
        -[PXVideoRequestOptions setTimeRange:](v5, "setTimeRange:", v39);
        v37[0] = 0;
        v37[1] = v37;
        v37[2] = 0x2020000000;
        v38 = 0;
        v9 = dispatch_semaphore_create(0);
        objc_msgSend(v8, "asset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXVideoRequestOptions photoKitRequestOptions](v5, "photoKitRequestOptions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke;
        v33[3] = &unk_1E5139418;
        v33[4] = self;
        v33[5] = v8;
        v34 = v28;
        v36 = v37;
        v12 = v9;
        v35 = v12;
        v13 = objc_msgSend(v4, "requestAVAssetForVideo:options:resultHandler:", v10, v11, v33);

        v32 = v47;
        if (!-[_PXStoryExportOperation _waitWhileExportingCanContinueForSemaphore:timeout:](self, "_waitWhileExportingCanContinueForSemaphore:timeout:", v12, &v32))
        {
          -[_PXStoryExportOperation audioQueue](self, "audioQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke_314;
          block[3] = &unk_1E5148AA8;
          v31 = v37;
          v30 = v12;
          dispatch_sync(v14, block);

          objc_msgSend(v4, "cancelImageRequest:", v13);
          if (!-[_PXStoryExportOperation isCancelled](self, "isCancelled"))
          {
            objc_msgSend(v8, "asset");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            PXStoryErrorCreateWithCodeDebugFormat(10, CFSTR("Timed out waiting for asset %@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PXStoryExportOperation _setError:](self, "_setError:", v22);

          }
        }
        v23 = -[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting");

        _Block_object_dispose(v37, 8);
        if (!v23)
          break;
        if (v27 == ++v7)
        {
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v27)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (id)_audibleVideoHilightsInStory
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  SEL v12;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___PXStoryExportOperation__audibleVideoHilightsInStory__block_invoke;
  block[3] = &unk_1E5145560;
  block[4] = self;
  v12 = a2;
  v6 = v4;
  v11 = v6;
  dispatch_sync(v5, block);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (void)_audioWriteQueue_setupAudioReaderWithAudioExportComposition:(id)a3 audioMix:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_os_log *v9;
  NSObject *v10;
  os_signpost_id_t signpostID;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  OS_os_log *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[2];
  _QWORD v49[2];
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_PXStoryExportOperation audioQueue](self, "audioQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = self->_signpostLog;
  v10 = v9;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v9))
  {
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportRequestSetupAudio", "requesting music asset for %{public}@", buf, 0xCu);

  }
  v47 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v6, &v47);
  v19 = v47;
  if (v13)
  {
    -[_PXStoryExportOperation setAudioQueue_assetReader:](self, "setAudioQueue_assetReader:", v13);
    v46 = v6;
    objc_msgSend(v6, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0C89930];
    v48[0] = *MEMORY[0x1E0C898E0];
    v48[1] = v21;
    v49[0] = &unk_1E53EED60;
    v49[1] = &unk_1E53EED78;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFE8]), "initWithAudioTracks:audioSettings:", v20, v45);
    objc_msgSend(v22, "setAudioMix:", v7);
    objc_msgSend(v22, "setAlwaysCopiesSampleData:", 0);
    if ((objc_msgSend(v13, "canAddOutput:", v22) & 1) != 0)
    {
      objc_msgSend(v13, "addOutput:", v22);
      -[_PXStoryExportOperation setAudioQueue_audioMixOutput:](self, "setAudioQueue_audioMixOutput:", v22);
    }
    else
    {
      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v19, CFSTR("cannot add audio mix to asset reader"), v23, v24, v25, v26, v27, v42);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryExportOperation _setError:](self, "_setError:", v28);

    }
    -[_PXStoryExportOperation audioQueue_assetReader](self, "audioQueue_assetReader");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "startReading");

    if ((v30 & 1) == 0)
    {
      -[_PXStoryExportOperation audioQueue_assetReader](self, "audioQueue_assetReader");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "error");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v31, CFSTR("failed to read from audio asset"), v32, v33, v34, v35, v36, (uint64_t)v43);
      v37 = v7;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryExportOperation _setError:](self, "_setError:", v38);

      v7 = v37;
    }
    v39 = self->_signpostLog;
    v40 = v39;
    v41 = self->_signpostID;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v39))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v41, "StoryExportRequestSetupAudio", ", buf, 2u);
    }

    -[_PXStoryExportOperation _setHasAudioForExport:](self, "_setHasAudioForExport:", 1);
    v6 = v46;
  }
  else
  {
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v19, CFSTR("cannot create audio reader"), v14, v15, v16, v17, v18, v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXStoryExportOperation _setError:](self, "_setError:", v20);
  }

}

- (void)_addAudioInputToAssetWriter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD block[5];
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C89930];
  v21[0] = *MEMORY[0x1E0C898E0];
  v21[1] = v5;
  v22[0] = &unk_1E53EED90;
  v22[1] = &unk_1E53EED78;
  v21[2] = *MEMORY[0x1E0C89970];
  v22[2] = &unk_1E53EEDA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C8B020]);
  v8 = (void *)objc_msgSend(v7, "initWithMediaType:outputSettings:", *MEMORY[0x1E0C8A7A0], v6);
  objc_msgSend(v8, "setExpectsMediaDataInRealTime:", 0);
  -[_PXStoryExportOperation audioQueue](self, "audioQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___PXStoryExportOperation__addAudioInputToAssetWriter___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v10 = v8;
  v20 = v10;
  dispatch_sync(v9, block);

  if ((objc_msgSend(v4, "canAddInput:", v10) & 1) == 0)
  {
    PXStoryErrorCreateWithCodeDebugFormat(10, CFSTR("Cannot add audio input"), v11, v12, v13, v14, v15, v16, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXStoryExportOperation _setError:](self, "_setError:", v17);

  }
  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
    objc_msgSend(v4, "addInput:", v10);

}

- (void)_exportAudioWithCompletionHandler:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSObject *v6;
  os_signpost_id_t signpostID;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD block[6];
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_signpostLog;
  v6 = v5;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    -[_PXStoryExportOperation uniqueIdentifier](self, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "StoryExportAudio", "exporting audio %{public}@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__227345;
  v22 = __Block_byref_object_dispose__227346;
  v23 = 0;
  -[_PXStoryExportOperation audioQueue](self, "audioQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___PXStoryExportOperation__exportAudioWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &buf;
  dispatch_sync(v9, block);

  objc_initWeak(&location, self);
  v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  -[_PXStoryExportOperation audioQueue](self, "audioQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __61___PXStoryExportOperation__exportAudioWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E5146480;
  objc_copyWeak(&v16, &location);
  v13 = v4;
  v15 = v13;
  objc_msgSend(v11, "requestMediaDataWhenReadyOnQueue:usingBlock:", v12, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

- (void)_audioWriteQueue_exportAudioWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  opaqueCMSampleBuffer *v9;
  opaqueCMSampleBuffer *v10;
  int32_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  OS_os_log *v31;
  NSObject *v32;
  os_signpost_id_t signpostID;
  uint64_t v34;
  CMTime time2;
  CMTime time1;
  CMTime v37;
  CMTime v38;

  v4 = (void (**)(_QWORD))a3;
  -[_PXStoryExportOperation audioQueue](self, "audioQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
  {
    -[_PXStoryExportOperation audioQueue_audioWriter](self, "audioQueue_audioWriter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXStoryExportOperation audioQueue_audioMixOutput](self, "audioQueue_audioMixOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v38, 0, sizeof(v38));
    -[_PXStoryExportOperation exportDuration](self, "exportDuration");
    if (objc_msgSend(v6, "isReadyForMoreMediaData"))
    {
      while (1)
      {
        v8 = (void *)MEMORY[0x1A85CE17C]();
        v9 = (opaqueCMSampleBuffer *)objc_msgSend(v7, "copyNextSampleBuffer");
        if (!v9)
          break;
        v10 = v9;
        memset(&v37, 0, sizeof(v37));
        CMSampleBufferGetPresentationTimeStamp(&v37, v9);
        time1 = v37;
        time2 = v38;
        v11 = CMTimeCompare(&time1, &time2);
        if (v11 < 0 && (objc_msgSend(v6, "appendSampleBuffer:", v10) & 1) == 0)
        {
          -[_PXStoryExportOperation assetWriter](self, "assetWriter");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "error");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v13, CFSTR("failed to write audio sample"), v14, v15, v16, v17, v18, v34);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PXStoryExportOperation _setError:](self, "_setError:", v19);

        }
        CFRelease(v10);
        v20 = -[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting");
        if ((v11 & 0x80000000) == 0 || !v20)
          goto LABEL_15;
        objc_autoreleasePoolPop(v8);
        if ((objc_msgSend(v6, "isReadyForMoreMediaData") & 1) == 0)
          goto LABEL_19;
      }
      -[_PXStoryExportOperation audioQueue_assetReader](self, "audioQueue_assetReader");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "status");

      if (v22 == 3)
      {
        -[_PXStoryExportOperation audioQueue_assetReader](self, "audioQueue_assetReader");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v24, CFSTR("failed to read audio sample"), v25, v26, v27, v28, v29, v34);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PXStoryExportOperation _setError:](self, "_setError:", v30);

      }
      -[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting");
LABEL_15:
      -[_PXStoryExportOperation _audioWriteQueue_cancelAudioExport](self, "_audioWriteQueue_cancelAudioExport");
      objc_msgSend(v6, "markAsFinished");
      v4[2](v4);
      v31 = self->_signpostLog;
      v32 = v31;
      signpostID = self->_signpostID;
      if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v31))
      {
        LOWORD(v37.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v32, OS_SIGNPOST_INTERVAL_END, signpostID, "StoryExportAudio", ", (uint8_t *)&v37, 2u);
      }

      objc_autoreleasePoolPop(v8);
    }
LABEL_19:

  }
  else
  {
    -[_PXStoryExportOperation _audioWriteQueue_cancelAudioExport](self, "_audioWriteQueue_cancelAudioExport");
    v4[2](v4);
  }

}

- (void)_audioWriteQueue_cancelAudioExport
{
  NSObject *v3;
  void *v4;
  id v5;

  -[_PXStoryExportOperation audioQueue](self, "audioQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_PXStoryExportOperation audioQueue_audioWriter](self, "audioQueue_audioWriter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markAsFinished");

  -[_PXStoryExportOperation audioQueue_assetReader](self, "audioQueue_assetReader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelReading");

}

- (void)_initializeProgress
{
  NSProgress *v3;
  NSProgress *progress;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v3 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v3;

  objc_initWeak(&location, self);
  -[NSProgress setCancellable:](self->_progress, "setCancellable:", 1);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __46___PXStoryExportOperation__initializeProgress__block_invoke;
  v8 = &unk_1E5148D30;
  objc_copyWeak(&v9, &location);
  -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", &v5);
  -[NSProgress addObserver:forKeyPath:options:context:](self->_progress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  -[_PXStoryExportOperation progressHandler](self, "progressHandler", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_PXStoryExportOperation progressHandler](self, "progressHandler");
    v9 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    -[_PXStoryExportOperation progress](self, "progress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8);

  }
}

- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  uint64_t *v28;
  int v29;
  OS_os_log *v30;
  NSObject *v31;
  os_signpost_id_t frequentSignpostID;
  uint8_t v34[16];
  _QWORD v35[5];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  SEL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  -[_PXStoryExportOperation storyQueue_engine](self, "storyQueue_engine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entityManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loadingStatus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_retainAutorelease(v15);
  v17 = objc_msgSend(v16, "states");
  objc_msgSend(v10, "visibleRect");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __61___PXStoryExportOperation_engine_shouldRenderLayout_sprites___block_invoke;
  v35[3] = &unk_1E5139468;
  v39 = v17;
  v40 = a2;
  v35[4] = self;
  v38 = &v41;
  v26 = v16;
  v36 = v26;
  v27 = v10;
  v37 = v27;
  objc_msgSend(v11, "enumerateSpritesInRect:usingBlock:", v35, v19, v21, v23, v25);
  v28 = v42;
  self->_storyQueue_isWaitingForResources = *((_BYTE *)v42 + 24);
  v29 = *((unsigned __int8 *)v28 + 24);
  if (!*((_BYTE *)v28 + 24))
  {
    v30 = self->_frequentSignpostLog;
    v31 = v30;
    frequentSignpostID = self->_frequentSignpostID;
    if (frequentSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v30))
    {
      *(_WORD *)v34 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v31, OS_SIGNPOST_INTERVAL_END, frequentSignpostID, "StoryExportLayoutRenderLoadingSpriteContent", ", v34, 2u);
    }

  }
  _Block_object_dispose(&v41, 8);

  return v29 == 0;
}

- (void)engineSetNeedsUpdate:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (self->_storyQueue_isWaitingForResources)
    objc_msgSend(v5, "updateIfNeeded");

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  NSObject *v5;
  void *v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v9;

  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[_PXStoryExportOperation storyQueue_pacingController](self, "storyQueue_pacingController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "currentTime");
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (PXAudioCueSource)audioCueSource
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_PXStoryExportOperation storyQueue_storyModel](self, "storyQueue_storyModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAudioCueSource *)v6;
}

- (int64_t)cuesVersion
{
  NSObject *v2;

  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return 0;
}

- (id)diagnosticCueStringForSize:(CGSize)a3 withIndicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5
{
  NSObject *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  _OWORD v14[3];
  __int128 v15;
  int64_t var3;
  CMTime duration;
  CMTime start;
  CMTimeRange v19;

  -[_PXStoryExportOperation storyQueue](self, "storyQueue", a3.width, a3.height);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[_PXStoryExportOperation audioCueSource](self, "audioCueSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExportOperation currentTime](self, "currentTime");
  CMTimeMakeWithSeconds(&duration, 3.0, PXAudioDefaultCMTimeScale);
  CMTimeRangeMake(&v19, &start, &duration);
  v10 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v11 = *(_OWORD *)&a5->var0.var3;
  v14[0] = *(_OWORD *)&a5->var0.var0;
  v14[1] = v11;
  v14[2] = *(_OWORD *)&a5->var1.var1;
  v15 = v10;
  objc_msgSend(v9, "diagnosticStringForTimeRange:indicatorTime:rangeIndicatorTimeRange:stringLength:", &v19, &v15, v14, 50);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)collectAnalyticsForExportBegin
{
  void *v2;
  void *v3;

  -[_PXStoryExportOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStoryExportManager collectAnalyticsForExportBeginWithConfiguration:](PXStoryExportManager, "collectAnalyticsForExportBeginWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)collectAnalyticsForExportEnd:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[_PXStoryExportOperation storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___PXStoryExportOperation_collectAnalyticsForExportEnd___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (BOOL)isHUDVisible
{
  void *v2;
  BOOL v3;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "exportHUDType") != 0;

  return v3;
}

- (int64_t)diagnosticHUDType
{
  void *v2;
  int64_t v3;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "exportHUDType");

  return v3;
}

- (PXStoryRelatedController)HUDRelatedController
{
  return 0;
}

- (id)diagnosticHUDContentProviderForType:(int64_t)a3
{
  void *v4;
  void *v5;

  -[_PXStoryExportOperation storyQueue_storyModel](self, "storyQueue_storyModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diagnosticHUDContentProviderForType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXObservable)HUDObservable
{
  return 0;
}

- (unint64_t)HUDVisibiltyChangeDescriptor
{
  return 0;
}

- (unint64_t)HUDContentChangeDescriptor
{
  return 0;
}

- (unint64_t)HUDStoryModelChangeDescriptor
{
  return 0;
}

- (BOOL)_waitWhileExportingCanContinueForSemaphore:(id)a3 timeout:(id *)a4
{
  NSObject *v6;
  dispatch_time_t v7;
  intptr_t v8;
  CMTime v10;
  CMTime lhs;
  CMTime v12;
  CMTime v13;

  v6 = a3;
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&v13, 0.5, 600);
  v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  while (1)
  {
    v7 = dispatch_time(0, 500000000);
    v8 = dispatch_semaphore_wait(v6, v7);
    if (!v8)
      break;
    if (!-[_PXStoryExportOperation shouldContinueExporting](self, "shouldContinueExporting"))
      break;
    if ((a4->var2 & 0x1D) == 1)
    {
      lhs = v12;
      v10 = v13;
      CMTimeAdd(&v12, &lhs, &v10);
      lhs = v12;
      v10 = (CMTime)*a4;
      if ((CMTimeCompare(&lhs, &v10) & 0x80000000) == 0)
        break;
    }
  }

  return v8 == 0;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (PXStoryExportConfiguration)configuration
{
  return self->_configuration;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (PXStoryExportVideoOptions)videoOptions
{
  return self->_videoOptions;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (OS_dispatch_semaphore)layoutCompleteSemaphore
{
  return self->_layoutCompleteSemaphore;
}

- (OS_dispatch_semaphore)completedWritingVideoFrameSemaphore
{
  return self->_completedWritingVideoFrameSemaphore;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (BOOL)storyQueue_isWaitingForResources
{
  return self->_storyQueue_isWaitingForResources;
}

- (PXGEngine)storyQueue_engine
{
  return self->_storyQueue_engine;
}

- (void)setStoryQueue_engine:(id)a3
{
  objc_storeStrong((id *)&self->_storyQueue_engine, a3);
}

- (PXStoryModel)storyQueue_storyModel
{
  return self->_storyQueue_storyModel;
}

- (void)setStoryQueue_storyModel:(id)a3
{
  objc_storeStrong((id *)&self->_storyQueue_storyModel, a3);
}

- (void)setStoryQueue_mediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_storyQueue_mediaProvider, a3);
}

- (PXStoryPacingController)storyQueue_pacingController
{
  return self->_storyQueue_pacingController;
}

- (void)setStoryQueue_pacingController:(id)a3
{
  objc_storeStrong((id *)&self->_storyQueue_pacingController, a3);
}

- (PXStorySongController)storyQueue_songController
{
  return self->_storyQueue_songController;
}

- (void)setStoryQueue_songController:(id)a3
{
  objc_storeStrong((id *)&self->_storyQueue_songController, a3);
}

- (PXGPixelBufferMetalRenderDestination)storyQueue_pixelBufferRenderDestination
{
  return self->_storyQueue_pixelBufferRenderDestination;
}

- (void)setStoryQueue_pixelBufferRenderDestination:(id)a3
{
  objc_storeStrong((id *)&self->_storyQueue_pixelBufferRenderDestination, a3);
}

- (OS_dispatch_queue)audioQueue
{
  return self->_audioQueue;
}

- (AVAssetReader)audioQueue_assetReader
{
  return self->_audioQueue_assetReader;
}

- (void)setAudioQueue_assetReader:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueue_assetReader, a3);
}

- (AVAssetWriterInput)audioQueue_audioWriter
{
  return self->_audioQueue_audioWriter;
}

- (void)setAudioQueue_audioWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueue_audioWriter, a3);
}

- (AVAssetReaderAudioMixOutput)audioQueue_audioMixOutput
{
  return self->_audioQueue_audioMixOutput;
}

- (void)setAudioQueue_audioMixOutput:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueue_audioMixOutput, a3);
}

- (AVAssetWriter)assetWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 528, 1);
}

- (void)setAssetWriter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (OS_dispatch_queue)videoWriterQueue
{
  return self->_videoWriterQueue;
}

- (AVAssetWriterInputPixelBufferAdaptor)videoWriterQueue_pixelBufferWriter
{
  return self->_videoWriterQueue_pixelBufferWriter;
}

- (void)setVideoWriterQueue_pixelBufferWriter:(id)a3
{
  objc_storeStrong((id *)&self->_videoWriterQueue_pixelBufferWriter, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoQueue_firstWrittenStoryTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[23];
  return self;
}

- (void)setVideoQueue_firstWrittenStoryTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_videoQueue_firstWrittenStoryTime.value = *(_OWORD *)&a3->var0;
  self->_videoQueue_firstWrittenStoryTime.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoWriterQueue_pixelBufferWriter, 0);
  objc_storeStrong((id *)&self->_videoWriterQueue, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_audioQueue_audioMixOutput, 0);
  objc_storeStrong((id *)&self->_audioQueue_audioWriter, 0);
  objc_storeStrong((id *)&self->_audioQueue_assetReader, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
  objc_storeStrong((id *)&self->_storyQueue_pixelBufferRenderDestination, 0);
  objc_storeStrong((id *)&self->_storyQueue_songController, 0);
  objc_storeStrong((id *)&self->_storyQueue_pacingController, 0);
  objc_storeStrong((id *)&self->_storyQueue_mediaProvider, 0);
  objc_storeStrong((id *)&self->_storyQueue_storyModel, 0);
  objc_storeStrong((id *)&self->_storyQueue_engine, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_completedWritingVideoFrameSemaphore, 0);
  objc_storeStrong((id *)&self->_layoutCompleteSemaphore, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_videoOptions, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_frequentSignpostLog, 0);
  objc_storeStrong((id *)&self->_signpostLog, 0);
  objc_storeStrong((id *)&self->_stateQueue_exportedStyle, 0);
  objc_storeStrong((id *)&self->_stateQueue_error, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end

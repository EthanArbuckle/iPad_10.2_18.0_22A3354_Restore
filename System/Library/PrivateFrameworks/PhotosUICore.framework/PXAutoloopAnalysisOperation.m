@implementation PXAutoloopAnalysisOperation

- (PXAutoloopAnalysisOperation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAutoloopAnalysisOperation.m"), 39, CFSTR("%s is not available as initializer"), "-[PXAutoloopAnalysisOperation init]");

  abort();
}

- (PXAutoloopAnalysisOperation)initWithEditSource:(id)a3
{
  id v5;
  PXAutoloopAnalysisOperation *v6;
  PXAutoloopAnalysisOperation *v7;
  uint64_t v8;
  NSProgress *progress;
  NSDictionary *recipesByVariationType;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXAutoloopAnalysisOperation;
  v6 = -[PXAutoloopAnalysisOperation init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_editSource, a3);
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 50);
    v8 = objc_claimAutoreleasedReturnValue();
    progress = v7->_progress;
    v7->_progress = (NSProgress *)v8;

    objc_initWeak(&location, v7);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__PXAutoloopAnalysisOperation_initWithEditSource___block_invoke;
    v12[3] = &unk_1E5148D30;
    objc_copyWeak(&v13, &location);
    -[NSProgress setCancellationHandler:](v7->_progress, "setCancellationHandler:", v12);
    recipesByVariationType = v7->_recipesByVariationType;
    v7->_recipesByVariationType = (NSDictionary *)MEMORY[0x1E0C9AA70];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (id)recipeForVariationType:(int64_t)a3
{
  NSDictionary *recipesByVariationType;
  void *v4;
  void *v5;

  recipesByVariationType = self->_recipesByVariationType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](recipesByVariationType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_timeout
{
  void *v3;
  void *v4;
  NSError *v5;
  NSError *error;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if ((-[PXAutoloopAnalysisOperation isFinished](self, "isFinished") & 1) == 0)
  {
    self->_succeeded = 0;
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2D50];
    v8[0] = CFSTR("Recipe generation timed out");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PXAutoloopAnalysisOperationErrorDomain"), 0, v4);
    v5 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v5;

    -[PXAutoloopAnalysisOperation cancel](self, "cancel");
  }
}

- (void)cancel
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  if ((-[PXAutoloopAnalysisOperation isFinished](self, "isFinished") & 1) == 0)
  {
    kdebug_trace();
    PLPhotoEditGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_make_with_pointer(v3, self);
    v5 = v3;
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v4, "VariationsRecipesOperation", ", buf, 2u);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)PXAutoloopAnalysisOperation;
  -[PXAutoloopAnalysisOperation cancel](&v7, sel_cancel);
}

- (void)main
{
  dispatch_time_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  PXAutoloopAnalysisOperation *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSDictionary *analysisResult;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  NSObject *v42;
  uint64_t v43;
  NSNumber *duration;
  void *v45;
  PXAutoloopAnalysisOperation *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  os_signpost_id_t spid;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t v58;
  unsigned int v59;
  CMTime time;
  _QWORD block[4];
  id v62;
  id location;
  uint64_t v64;
  const __CFString *v65;
  _BYTE buf[24];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 30000000000);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PXAutoloopAnalysisOperation_main__block_invoke_2;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v62, &location);
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  v5 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  -[PXAutoloopAnalysisOperation editSource](self, "editSource");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "videoEditSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "videoURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoEditGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_make_with_pointer(v15, self);
  v17 = v15;
  v18 = v17;
  spid = v16;
  v19 = v16 - 1;
  if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VariationsRecipesOperation", ", buf, 2u);
  }

  if (v14)
    objc_msgSend(v14, "duration");
  else
    memset(&time, 0, sizeof(time));
  CMTimeGetSeconds(&time);
  v20 = self;
  kdebug_trace();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:", CFSTR("PXAutoloopAnalysisOperationDidStartNotification"), v20);

  v59 = 0;
  v22 = v14;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = getget_autoloopSettings_forAssetSymbolLoc_ptr;
  v67 = getget_autoloopSettings_forAssetSymbolLoc_ptr;
  if (!getget_autoloopSettings_forAssetSymbolLoc_ptr)
  {
    v24 = (void *)AutoLoopLibrary();
    v23 = dlsym(v24, "get_autoloopSettings_forAsset");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v23;
    getget_autoloopSettings_forAssetSymbolLoc_ptr = v23;
  }
  _Block_object_dispose(buf, 8);
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "struct autoloopSettings *_get_autoloopSettings_forAsset(AVAsset *__strong, autoloopErrorCode *)");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("PXAutoloopSoftLinks.m"), 33, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v25 = ((uint64_t (*)(id, unsigned int *))v23)(v22, &v59);

  if (v59)
  {
    __35__PXAutoloopAnalysisOperation_main__block_invoke(v59);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_DWORD *)&buf[8] = 1;
    *(_QWORD *)buf = 0x200000000;
    v58 = 0;
    -[PXAutoloopAnalysisOperation progress](v20, "progress");
    v55[0] = v4;
    v55[1] = 3221225472;
    v55[2] = __35__PXAutoloopAnalysisOperation_main__block_invoke_155;
    v55[3] = &unk_1E511D4E8;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v56 = v27;
    objc_copyWeak(&v57, &location);
    _runLiveAnalysisPipeline(v25, v10, v22, (uint64_t)buf, (uint64_t)&v58, v55);
    v29 = v28;
    if ((-[PXAutoloopAnalysisOperation isCancelled](v20, "isCancelled") & 1) != 0)
    {
      v26 = 0;
    }
    else if ((_DWORD)v29 || !v58)
    {
      __35__PXAutoloopAnalysisOperation_main__block_invoke(v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _liveAnalysisResultToDictionary(v58);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v30;
      if (v30)
      {
        v31 = objc_msgSend(v30, "copy");
        analysisResult = v20->_analysisResult;
        v20->_analysisResult = (NSDictionary *)v31;

        v26 = 0;
        v20->_succeeded = 1;
      }
      else
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v64 = *MEMORY[0x1E0CB2D50];
        v65 = CFSTR("liveAnalysisResultToDictionary did not return an analysis dictionary");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v33;
        v36 = (void *)v34;
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("PXAutoloopAnalysisOperationErrorDomain"), 0, v34);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = v36;
        v26 = (void *)v37;

      }
    }
    if (v58)
      _liveAnalysisResultDestroy(v58);
    objc_destroyWeak(&v57);

  }
  if (v26)
  {
    objc_storeStrong((id *)&v20->_error, v26);
    v20->_succeeded = 0;
  }
  if (v25)
    _autoloopSettingsDestroy(v25);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "timeIntervalSinceDate:", v54);
  v41 = v40;

  PLUIGetLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v41;
    _os_log_impl(&dword_1A6789000, v42, OS_LOG_TYPE_DEFAULT, "%@ finished generating variation recipes in %.2fs", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
  v43 = objc_claimAutoreleasedReturnValue();
  duration = v20->_duration;
  v20->_duration = (NSNumber *)v43;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "postNotificationName:object:", CFSTR("PXAutoloopAnalysisOperationDidEndNotification"), v20);

  v46 = v20;
  kdebug_trace();

  v47 = v18;
  v48 = v47;
  if (v19 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v48, OS_SIGNPOST_INTERVAL_END, spid, "VariationsRecipesOperation", ", buf, 2u);
  }

  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);

}

- (PLLivePhotoEditSource)editSource
{
  return self->_editSource;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSDictionary)analysisResult
{
  return self->_analysisResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisResult, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_recipesByVariationType, 0);
}

void __35__PXAutoloopAnalysisOperation_main__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timeout");

}

uint64_t __35__PXAutoloopAnalysisOperation_main__block_invoke_155(uint64_t a1, float a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", vcvtms_s32_f32((float)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount") * a2));
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(v3);
    v6 = objc_msgSend(v5, "isCancelled") ^ 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __35__PXAutoloopAnalysisOperation_main__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  _autoloopErrorCodeToString(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRecipeErrorDomain"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __50__PXAutoloopAnalysisOperation_initWithEditSource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

@end

@implementation PLVideoRemaker

- (PLVideoRemaker)initWithPublishingMedia:(id)a3
{
  uint64_t v5;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLVideoRemaker.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("media"));
  v5 = objc_msgSend(a3, "asset");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[PLVideoRemaker initWithAVAsset:](self, "initWithAVAsset:", v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[PLVideoRemaker initWithManagedAsset:applyVideoAdjustments:](self, "initWithManagedAsset:applyVideoAdjustments:", v5, 1);
  else
    return self;
}

- (PLVideoRemaker)initWithAVAsset:(id)a3
{
  PLVideoRemaker *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLVideoRemaker;
  v4 = -[PLVideoRemaker init](&v6, sel_init);
  if (v4)
    v4->__videoAVObjectBuilder = (PFVideoAVObjectBuilder *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", a3, 0);
  return v4;
}

- (PLVideoRemaker)initWithManagedAsset:(id)a3 applyVideoAdjustments:(BOOL)a4
{
  _BOOL8 v4;
  PLVideoRemaker *v6;
  uint64_t v7;
  PFVideoAVObjectBuilder *v8;
  _QWORD v10[5];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLVideoRemaker;
  v6 = -[PLVideoRemaker init](&v15, sel_init);
  if (v6)
  {
    v11 = 0;
    v12 = (double *)&v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(a3, "duration");
    v14 = v7;
    v8 = (PFVideoAVObjectBuilder *)(id)objc_msgSend(MEMORY[0x1E0D71B20], "videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:", a3, v4);
    v6->__videoAVObjectBuilder = v8;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__PLVideoRemaker_initWithManagedAsset_applyVideoAdjustments___block_invoke;
    v10[3] = &unk_1E70B65A0;
    v10[4] = &v11;
    -[PFVideoAVObjectBuilder requestAVAssetWithResultHandler:](v8, "requestAVAssetWithResultHandler:", v10);
    -[PLVideoRemaker setDuration:](v6, "setDuration:", v12[3]);
    _Block_object_dispose(&v11, 8);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PLProgressView removeFromSuperview](self->_progressView, "removeFromSuperview");
  -[NSTimer invalidate](self->_progressTimer, "invalidate");

  self->_progressTimer = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLVideoRemaker;
  -[PLVideoRemaker dealloc](&v3, sel_dealloc);
}

- (id)messageForRemakingProgress
{
  return (id)PLLocalizedFrameworkString();
}

- (id)progressView
{
  PLProgressView *progressView;
  double v4;
  PLProgressView *v5;
  double v6;

  progressView = self->_progressView;
  if (!progressView)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "bounds");
    v5 = -[PLProgressView initWithFrame:]([PLProgressView alloc], "initWithFrame:", 0.0, 0.0, v4, 45.0);
    self->_progressView = v5;
    -[PLProgressView setAutoresizingMask:](v5, "setAutoresizingMask:", 2);
    progressView = self->_progressView;
  }
  -[PLProgressView setLabelText:](progressView, "setLabelText:", -[PLVideoRemaker messageForRemakingProgress](self, "messageForRemakingProgress"));
  *(float *)&v6 = self->_percentComplete;
  -[PLProgressView setPercentComplete:](self->_progressView, "setPercentComplete:", v6);
  return self->_progressView;
}

- (NSString)exportPreset
{
  NSString *result;

  result = -[PLVideoRemaker exportPresetOverride](self, "exportPresetOverride");
  if (!result)
    return (NSString *)AVAssetExportPresetForRemakerMode(self->_mode);
  return result;
}

- (void)_resetProgressTimer
{
  if (!self->_progressTimer)
    self->_progressTimer = (NSTimer *)(id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateProgress, 0, 1, 0.1);
}

- (void)_removeProgressTimer
{
  -[NSTimer invalidate](self->_progressTimer, "invalidate");

  self->_progressTimer = 0;
}

- (void)_updateProgress
{
  float v3;
  id Weak;
  double v5;
  void (**progressHandler)(double);

  -[AVAssetExportSession progress](self->_exportSession, "progress");
  self->_percentComplete = v3;
  -[PLProgressView setPercentComplete:](self->_progressView, "setPercentComplete:");
  if (objc_loadWeak((id *)&self->_delegate))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      Weak = objc_loadWeak((id *)&self->_delegate);
      *(float *)&v5 = self->_percentComplete;
      objc_msgSend(Weak, "videoRemaker:progressDidChange:", self, v5);
    }
  }
  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](self->_percentComplete);
}

- (id)_metadata
{
  id result;
  NSString *customAccessibilityLabel;

  result = (id)objc_msgSend((id)-[PFVideoAVObjectBuilder videoAsset](self->__videoAVObjectBuilder, "videoAsset"), "metadata");
  customAccessibilityLabel = self->_customAccessibilityLabel;
  if (customAccessibilityLabel)
    return (id)objc_msgSend(MEMORY[0x1E0D75280], "addAccessibilityDescription:toAVMetadata:", customAccessibilityLabel, result);
  return result;
}

- (void)remake
{
  _BOOL8 v3;
  void *v4;
  NSString *v5;
  uint64_t v6;
  PFVideoAVObjectBuilder *videoAVObjectBuilder;
  uint64_t v8;
  uint64_t v9;
  double trimStartTime;
  double trimEndTime;
  AVAssetExportSession *exportSession;
  AVAssetExportSession *v13;
  _QWORD v14[7];
  BOOL v15;
  CMTimeRange start;
  CMTime end;
  CMTimeRange v18;
  CMTime v19;
  CMTime v20;
  _QWORD v21[5];

  if (!self->_exportSession)
  {

    v3 = -[PLVideoRemaker shouldExportToPhotoDataDirectory](self, "shouldExportToPhotoDataDirectory");
    self->_trimmedPath = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "tmpFileForVideoTranscodeToPhotoDataDirectory:withExtension:", v3, CFSTR("MOV"));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if (objc_msgSend(v4, "fileExistsAtPath:", self->_trimmedPath))
      objc_msgSend(v4, "removeItemAtPath:error:", self->_trimmedPath, 0);
    v5 = -[PLVideoRemaker exportPreset](self, "exportPreset");
    v6 = MEMORY[0x1E0C809B0];
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __24__PLVideoRemaker_remake__block_invoke;
    v21[3] = &unk_1E70B65C8;
    v21[4] = self;
    -[PFVideoAVObjectBuilder requestExportSessionWithExportPreset:resultHandler:](videoAVObjectBuilder, "requestExportSessionWithExportPreset:resultHandler:", v5, v21);
    v8 = +[PLVideoRemaker fileLengthLimitForRemakerMode:](PLVideoRemaker, "fileLengthLimitForRemakerMode:", self->_mode);
    if (v8 >= 1)
      -[AVAssetExportSession setFileLengthLimit:](self->_exportSession, "setFileLengthLimit:", v8);
    v9 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_trimmedPath, 0);
    -[AVAssetExportSession setOutputFileType:](self->_exportSession, "setOutputFileType:", -[PLVideoRemaker _fileFormatForURL:](self, "_fileFormatForURL:", v9));
    -[AVAssetExportSession setOutputURL:](self->_exportSession, "setOutputURL:", v9);
    -[AVAssetExportSession setMetadata:](self->_exportSession, "setMetadata:", -[PLVideoRemaker _metadata](self, "_metadata"));
    trimStartTime = self->_trimStartTime;
    trimEndTime = self->_trimEndTime;
    if (trimStartTime > 0.0 || trimEndTime > 0.0)
    {
      if (trimEndTime == 0.0)
        trimEndTime = self->_duration;
      memset(&v20, 0, sizeof(v20));
      CMTimeMakeWithSeconds(&v20, trimStartTime, 600);
      memset(&v19, 0, sizeof(v19));
      CMTimeMakeWithSeconds(&v19, trimEndTime, 600);
      memset(&v18, 0, sizeof(v18));
      start.start = v20;
      end = v19;
      CMTimeRangeFromTimeToTime(&v18, &start.start, &end);
      exportSession = self->_exportSession;
      start = v18;
      -[AVAssetExportSession setTimeRange:](exportSession, "setTimeRange:", &start);
    }
    self->_percentComplete = 0.0;
    v18.start.value = 0;
    *(_QWORD *)&v18.start.timescale = &v18;
    v18.start.epoch = 0x2020000000;
    LOBYTE(v18.duration.value) = 0;
    v13 = self->_exportSession;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __24__PLVideoRemaker_remake__block_invoke_2;
    v14[3] = &unk_1E70B6300;
    v14[5] = v9;
    v14[6] = &v18;
    v15 = v3;
    v14[4] = self;
    -[AVAssetExportSession exportAsynchronouslyWithCompletionHandler:](v13, "exportAsynchronouslyWithCompletionHandler:", v14);
    if (!*(_BYTE *)(*(_QWORD *)&v18.start.timescale + 24))
    {
      if (objc_loadWeak((id *)&self->_delegate))
      {
        objc_loadWeak((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(objc_loadWeak((id *)&self->_delegate), "videoRemakerDidBeginRemaking:", self);
      }
      -[PLVideoRemaker _resetProgressTimer](self, "_resetProgressTimer");
    }
    _Block_object_dispose(&v18, 8);
  }
}

- (id)_fileFormatForURL:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "pathExtension"), "lowercaseString");
  if (objc_msgSend(v4, "length"))
  {
    v32 = (void *)MEMORY[0x1E0C99D80];
    v31 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("mov"), 0);
    v30 = *MEMORY[0x1E0C8A2E8];
    v29 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("m4a"), CFSTR("m4p"), CFSTR("m4b"), CFSTR("m4r"), 0);
    v28 = *MEMORY[0x1E0C8A2A8];
    v27 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("m4v"), 0);
    v26 = *MEMORY[0x1E0C8A2B0];
    v25 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("mp4"), CFSTR("aax"), 0);
    v24 = *MEMORY[0x1E0C8A2E0];
    v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("3gp"), CFSTR("3gpp"), 0);
    v6 = *MEMORY[0x1E0C8A270];
    v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("3g2"), CFSTR("3gp2"), 0);
    v8 = *MEMORY[0x1E0C8A278];
    v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("amr"), 0);
    v10 = *MEMORY[0x1E0C8A298];
    v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("wav"), 0);
    v12 = *MEMORY[0x1E0C8A2F0];
    v13 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("aif"), CFSTR("aiff"), 0);
    v14 = (void *)objc_msgSend(v32, "dictionaryWithObjectsAndKeys:", v31, v30, v29, v28, v27, v26, v25, v24, v5, v6, v7, v8, v9, v10, v11, v12, v13,
                    *MEMORY[0x1E0C8A290],
                    0);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = (void *)objc_msgSend(v14, "allKeys");
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "objectForKey:", v21), "containsObject:", v4))
            v18 = v21;
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v17);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (self->_mode == 3)
      v22 = (id *)MEMORY[0x1E0C8A270];
    else
      v22 = (id *)MEMORY[0x1E0C8A2E8];
    return *v22;
  }
  return v18;
}

- (void)_didEndRemakingWithTemporaryPath:(id)a3
{
  PLVideoRemakerDelegate **p_delegate;

  p_delegate = &self->_delegate;
  if (objc_loadWeak((id *)&self->_delegate))
  {
    objc_loadWeak((id *)p_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(objc_loadWeak((id *)p_delegate), "videoRemakerDidEndRemaking:temporaryPath:", self, a3);
  }
}

- (void)cancel
{
  if (self->_exportSession)
    -[AVAssetExportSession cancelExport](self->_exportSession, "cancelExport");
  else
    -[PLVideoRemaker _exportCompletedWithSuccess:](self, "_exportCompletedWithSuccess:", 0);
}

- (void)_exportCompletedWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  PLVideoRemaker *v5;

  v3 = a3;
  -[PLVideoRemaker _removeProgressTimer](self, "_removeProgressTimer");
  -[PLProgressView removeFromSuperview](self->_progressView, "removeFromSuperview");

  self->_progressView = 0;
  v5 = self;
  if (v3)
  {
    -[PLVideoRemaker _didEndRemakingWithTemporaryPath:](self, "_didEndRemakingWithTemporaryPath:", self->_trimmedPath);
  }
  else
  {
    -[PLVideoRemaker _didEndRemakingWithTemporaryPath:](self, "_didEndRemakingWithTemporaryPath:", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", self->_trimmedPath, 0);
  }

  self->_trimmedPath = 0;
  self->_exportSession = 0;
}

- (PLVideoRemakerDelegate)delegate
{
  return (PLVideoRemakerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)shouldExportToPhotoDataDirectory
{
  return self->_shouldExportToPhotoDataDirectory;
}

- (void)setShouldExportToPhotoDataDirectory:(BOOL)a3
{
  self->_shouldExportToPhotoDataDirectory = a3;
}

- (NSString)exportPresetOverride
{
  return self->_exportPresetOverride;
}

- (void)setExportPresetOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (double)trimStartTime
{
  return self->_trimStartTime;
}

- (void)setTrimStartTime:(double)a3
{
  self->_trimStartTime = a3;
}

- (double)trimEndTime
{
  return self->_trimEndTime;
}

- (void)setTrimEndTime:(double)a3
{
  self->_trimEndTime = a3;
}

- (NSString)customAccessibilityLabel
{
  return self->_customAccessibilityLabel;
}

- (void)setCustomAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PFVideoAVObjectBuilder)_videoAVObjectBuilder
{
  return self->__videoAVObjectBuilder;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

id __24__PLVideoRemaker_remake__block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = result;
  return result;
}

uint64_t __24__PLVideoRemaker_remake__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *Log;
  uint64_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "status");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (v2 & 0xFFFFFFFFFFFFFFFELL) == 4;
  if (v2 != 3)
  {
    Log = PLBackendGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
    {
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "asset");
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "error");
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_ERROR, "Video export failed for asset %@: %@", buf, 0x16u);
    }
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    v6 = objc_msgSend(MEMORY[0x1E0D715D8], "markPurgeableForFileAtURL:withUrgency:outInode:", *(_QWORD *)(a1 + 40), 0, 0);
    v7 = PLBackendGetLog();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        v10 = "Marked temp file (%@) as purgeable.";
        v11 = v8;
        v12 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl(&dword_1B9897000, v11, v12, v10, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      v10 = "Unable to mark temp file (%@) purgeable.";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }
  return pl_dispatch_async();
}

uint64_t __24__PLVideoRemaker_remake__block_invoke_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exportCompletedWithSuccess:", *(unsigned __int8 *)(a1 + 40));
}

void __61__PLVideoRemaker_initWithManagedAsset_applyVideoAdjustments___block_invoke(uint64_t a1, void *a2)
{
  CMTime time;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a2)
      objc_msgSend(a2, "duration");
    else
      memset(&time, 0, sizeof(time));
    *(Float64 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CMTimeGetSeconds(&time);
  }
}

+ (int64_t)fileLengthLimitForRemakerMode:(int)a3
{
  if (a3 == 2)
    return 15728640;
  else
    return 0;
}

+ (double)maximumDurationForTrimMode:(int)a3
{
  double result;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[56];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  result = 3.40282347e38;
  switch(a3)
  {
    case 0:
    case 2:
      v5 = objc_msgSend(a1, "fileLengthLimitForRemakerMode:", *(_QWORD *)&a3, 3.40282347e38);
      v8 = CFSTR("fileLengthLimit");
      v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
      v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      memset(&v7[32], 0, 24);
      objc_msgSend(MEMORY[0x1E0C8AFC0], "maximumDurationForPreset:properties:", AVAssetExportPresetForRemakerMode(a3), v6);
      *(CMTime *)v7 = *(CMTime *)&v7[32];
      result = CMTimeGetSeconds((CMTime *)v7);
      break;
    case 1:
    case 3:
      return result;
    case 4:
      result = 900.0;
      break;
    default:
      result = 600.0;
      break;
  }
  return result;
}

+ (int64_t)approximateByteSizeForMode:(int)a3 duration:(double)a4
{
  uint64_t v5;
  void *v6;
  CMTime v8;

  v5 = AVAssetExportPresetForRemakerMode(a3);
  v6 = (void *)MEMORY[0x1E0C8AFC0];
  CMTimeMakeWithSeconds(&v8, a4, 60);
  return objc_msgSend(v6, "estimatedOutputFileLengthForPreset:duration:properties:", v5, &v8, 0);
}

+ (int)getHDRemakerModeForMode:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 4)
    return 5;
  else
    return 0;
}

+ (int)getSDRemakerModeForMode:(int)a3
{
  return 4 * ((a3 & 0xFFFFFFFE) == 4);
}

@end

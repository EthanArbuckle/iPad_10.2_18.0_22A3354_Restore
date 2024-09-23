@implementation RCFileInputWaveformDataSource

- (RCFileInputWaveformDataSource)initWithAVFileURL:(id)a3
{
  return -[RCFileInputWaveformDataSource initWithAVFileURL:savesGeneratedWaveform:segmentFlushInterval:](self, "initWithAVFileURL:savesGeneratedWaveform:segmentFlushInterval:", a3, 1, 30.0);
}

- (RCFileInputWaveformDataSource)initWithAVFileURL:(id)a3 savesGeneratedWaveform:(BOOL)a4 segmentFlushInterval:(double)a5
{
  _BOOL4 v6;
  id v10;
  void *v11;
  RCWaveformGenerator *v12;
  void *v13;
  RCFileInputWaveformDataSource *v14;
  RCFileInputWaveformDataSource *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *serialQueue;
  void *v19;
  objc_super v20;

  v6 = a4;
  v10 = a3;
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCFileInputWaveformDataSource.m"), 32, CFSTR("Invalid parameter"));

  }
  v12 = -[RCWaveformGenerator initWithSegmentFlushInterval:]([RCWaveformGenerator alloc], "initWithSegmentFlushInterval:", a5);
  if (v6)
  {
    +[RCWaveform waveformURLForAVURL:](RCWaveform, "waveformURLForAVURL:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)RCFileInputWaveformDataSource;
  v14 = -[RCWaveformDataSource initWithWaveformGenerator:generatedWaveformOutputURL:](&v20, sel_initWithWaveformGenerator_generatedWaveformOutputURL_, v12, v13);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_AVFileURL, a3);
    v15->_cachedDuration = -1.0;
    v16 = dispatch_queue_create(0, 0);
    serialQueue = v15->_serialQueue;
    v15->_serialQueue = (OS_dispatch_queue *)v16;

  }
  return v15;
}

- (BOOL)savesGeneratedWaveform
{
  void *v2;
  BOOL v3;

  -[RCWaveformDataSource generatedWaveformOutputURL](self, "generatedWaveformOutputURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (float)loadingProgress
{
  NSObject *serialQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__RCFileInputWaveformDataSource_loadingProgress__block_invoke;
  v5[3] = &unk_1E769BF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __48__RCFileInputWaveformDataSource_loadingProgress__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 88);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setLoadingProgress:(float)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  float v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__RCFileInputWaveformDataSource_setLoadingProgress___block_invoke;
  v4[3] = &unk_1E769D9D0;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(serialQueue, v4);
}

float __52__RCFileInputWaveformDataSource_setLoadingProgress___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 88) = result;
  return result;
}

- (void)startLoading
{
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[RCFileInputWaveformDataSource startLoading]";
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl(&dword_1BD830000, a3, OS_LOG_TYPE_DEBUG, "%s -- copying existing loadable waveform from %@ to %@ to avoid re-generating waveform", (uint8_t *)&v7, 0x20u);

}

uint64_t __45__RCFileInputWaveformDataSource_startLoading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingProgress:");
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;
  RCFileInputWaveformDataSource *v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  RCFileInputWaveformDataSource *v14;

  v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__14;
  v13[4] = __Block_byref_object_dispose__14;
  v7 = self;
  v14 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__RCFileInputWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke;
  v10[3] = &unk_1E769DA20;
  v12 = v13;
  v8 = v6;
  v11 = v8;
  v9.receiver = v7;
  v9.super_class = (Class)RCFileInputWaveformDataSource;
  -[RCWaveformDataSource finishLoadingWithCompletionTimeout:completionBlock:](&v9, sel_finishLoadingWithCompletionTimeout_completionBlock_, a3, v10);

  _Block_object_dispose(v13, 8);
}

void __84__RCFileInputWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5 && (_DWORD)a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "saveGeneratedWaveformIfNecessary", 0);
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

- (BOOL)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", v3);

  return 1;
}

- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3
{
  double var1;
  double var0;
  void *v6;
  void *v7;

  var1 = a3.var1;
  var0 = a3.var0;
  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronouslyApproximateWaveformForAVContentURL:byReadingCurrentFileAheadTimeRange:", self->_AVFileURL, var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)saveGeneratedWaveformIfNecessary
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__RCFileInputWaveformDataSource_saveGeneratedWaveformIfNecessary__block_invoke;
  v4[3] = &unk_1E769DA48;
  v4[4] = self;
  -[RCWaveformDataSource updateAccumulatorWaveformSegmentsWithBlock:](self, "updateAccumulatorWaveformSegmentsWithBlock:", v4);
  v3.receiver = self;
  v3.super_class = (Class)RCFileInputWaveformDataSource;
  -[RCWaveformDataSource saveGeneratedWaveformIfNecessary](&v3, sel_saveGeneratedWaveformIfNecessary);
}

id __65__RCFileInputWaveformDataSource_saveGeneratedWaveformIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  __n128 v12;
  void *v13;

  objc_msgSend(a2, "segmentsCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "duration");
    if (v6 <= 0.0)
    {
      v7 = v3;

    }
    else
    {
      v7 = (id)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v5, "timeRange");
      v9 = v8;
      objc_msgSend(*(id *)(a1 + 32), "duration");
      v11 = v10;
      v12.n128_u64[0] = v9;
      v13 = (void *)objc_msgSend(v5, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v12, v11));

      objc_msgSend(v7, "replaceObjectAtIndex:withObject:", objc_msgSend(v3, "count") - 1, v13);
    }
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

- (double)duration
{
  double result;
  void *v4;
  void *v5;
  CMTime time;

  result = self->_cachedDuration;
  if (result < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", self->_AVFileURL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "duration");
    else
      memset(&time, 0, sizeof(time));
    self->_cachedDuration = CMTimeGetSeconds(&time);

    return self->_cachedDuration;
  }
  return result;
}

- (BOOL)shouldMergeLiveWaveform
{
  return 0;
}

- (NSURL)AVFileURL
{
  return self->_AVFileURL;
}

- (double)destinationBeginTime
{
  return self->_destinationBeginTime;
}

- (void)setDestinationBeginTime:(double)a3
{
  self->_destinationBeginTime = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)sourceTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_sourceTimeRange.beginTime;
  endTime = self->_sourceTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (void)setSourceTimeRange:(id)a3
{
  self->_sourceTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AVFileURL, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end

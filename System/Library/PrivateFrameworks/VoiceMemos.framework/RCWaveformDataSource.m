@implementation RCWaveformDataSource

- (RCWaveformDataSource)initWithWaveformGenerator:(id)a3 generatedWaveformOutputURL:(id)a4
{
  id v7;
  id v8;
  RCWaveformDataSource *v9;
  RCWaveformDataSource *v10;
  RCMutableWaveform *v11;
  RCMutableWaveform *accumulatorWaveform;
  uint64_t v13;
  NSHashTable *weakObservers;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RCWaveformDataSource;
  v9 = -[RCWaveformDataSource init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_waveformGenerator, a3);
    v11 = objc_alloc_init(RCMutableWaveform);
    accumulatorWaveform = v10->_accumulatorWaveform;
    v10->_accumulatorWaveform = v11;

    v10->_liveRecordingMergeTime = 0.0;
    objc_storeStrong((id *)&v10->_generatedWaveformOutputURL, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    weakObservers = v10->_weakObservers;
    v10->_weakObservers = (NSHashTable *)v13;

    v15 = dispatch_queue_create("com.apple.waveformDataSourceProcessing", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[RCWaveformGenerator terminateLoadingImmediately](self->_waveformGenerator, "terminateLoadingImmediately");
  v3.receiver = self;
  v3.super_class = (Class)RCWaveformDataSource;
  -[RCWaveformDataSource dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__RCWaveformDataSource_addObserver___block_invoke;
  block[3] = &unk_1E769BEE0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __36__RCWaveformDataSource_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__RCWaveformDataSource_removeObserver___block_invoke;
  block[3] = &unk_1E769BEE0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __39__RCWaveformDataSource_removeObserver___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = dispatch_time(0, 500000000);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__RCWaveformDataSource_removeObserver___block_invoke_2;
  block[3] = &unk_1E769BF30;
  block[4] = v3;
  dispatch_after(v2, v4, block);
}

uint64_t __39__RCWaveformDataSource_removeObserver___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  if (!result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "terminateLoadingImmediately");
  return result;
}

- (void)beginLoading
{
  void *v3;
  void *v4;

  if (!self->_hasStartedLoading)
  {
    self->_hasStartedLoading = 1;
    -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginLoading");

    -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSegmentOutputObserver:", self);

    -[RCWaveformDataSource startLoading](self, "startLoading");
  }
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__RCWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke;
  v9[3] = &unk_1E769C740;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "finishLoadingWithCompletionTimeout:completionBlock:", a3, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __75__RCWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "saveGeneratedWaveformIfNecessary");

  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__RCWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke_2;
  v10[3] = &unk_1E769C718;
  v8 = *(id *)(a1 + 32);
  v13 = a2;
  v11 = v5;
  v12 = v8;
  v9 = v5;
  objc_msgSend(v7, "_performOnObserversBlock:", v10);

}

uint64_t __75__RCWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)cancelLoading
{
  -[RCWaveformGenerator setCanceled:](self->_waveformGenerator, "setCanceled:", 1);
}

- (BOOL)waitUntilFinished
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  _QWORD v6[4];
  dispatch_semaphore_t v7;

  v3 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__RCWaveformDataSource_waitUntilFinished__block_invoke;
  v6[3] = &unk_1E769C768;
  v7 = v3;
  v4 = v3;
  -[RCWaveformDataSource finishLoadingWithCompletionTimeout:completionBlock:](self, "finishLoadingWithCompletionTimeout:completionBlock:", -1, v6);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(self) = !-[RCWaveformGenerator canceled](self->_waveformGenerator, "canceled");

  return (char)self;
}

intptr_t __41__RCWaveformDataSource_waitUntilFinished__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)setPaused:(BOOL)a3
{
  -[RCWaveformGenerator setPaused:](self->_waveformGenerator, "setPaused:", a3);
  return 1;
}

- (BOOL)finished
{
  return -[RCWaveformGenerator finished](self->_waveformGenerator, "finished");
}

- (BOOL)canceled
{
  return -[RCWaveformGenerator canceled](self->_waveformGenerator, "canceled");
}

- (float)loadingProgress
{
  return -1.0;
}

- (double)duration
{
  NSObject *queue;
  void *v3;
  double v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__RCWaveformDataSource_duration__block_invoke;
  v7[3] = &unk_1E769BF80;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  v3 = (void *)v9[5];
  if (v3)
  {
    objc_msgSend(v3, "timeRange");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __32__RCWaveformDataSource_duration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "segments");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight
{
  double v2;
  double v3;
  __n128 v4;
  double v5;
  double v6;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[RCWaveformDataSource duration](self, "duration");
  v3 = v2;
  v4.n128_u64[0] = 0;
  v5 = RCTimeRangeMake(v4, v3);
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)waveformSegmentsInTimeRange:(id)a3
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  $F24F406B2B787EFB06265DBA3D28CBD5 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__RCWaveformDataSource_waveformSegmentsInTimeRange___block_invoke;
  v6[3] = &unk_1E769C790;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __52__RCWaveformDataSource_waveformSegmentsInTimeRange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "accumulatorWaveform");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "segmentsByClippingToTimeRange:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)waveformSegmentsIntersectingTimeRange:(id)a3
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  $F24F406B2B787EFB06265DBA3D28CBD5 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__RCWaveformDataSource_waveformSegmentsIntersectingTimeRange___block_invoke;
  v6[3] = &unk_1E769C790;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __62__RCWaveformDataSource_waveformSegmentsIntersectingTimeRange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "accumulatorWaveform");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "segmentsIntersectingTimeRange:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)segmentsInCompositionByConvertingFromActiveLoadingFragment:(id)a3
{
  return a3;
}

- (double)averagePowerLevelsRate
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__RCWaveformDataSource_averagePowerLevelsRate__block_invoke;
  v5[3] = &unk_1E769BF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __46__RCWaveformDataSource_averagePowerLevelsRate__block_invoke(uint64_t a1)
{
  double result;

  result = (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "averagePowerLevelsRate");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3
{
  return 0;
}

- (void)saveGeneratedWaveformIfNecessary
{
  int v2;
  const char *v3;
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = "-[RCWaveformDataSource saveGeneratedWaveformIfNecessary]";
  v4 = 2112;
  v5 = CFSTR("saved");
  v6 = 2112;
  v7 = a1;
  _os_log_debug_impl(&dword_1BD830000, a2, OS_LOG_TYPE_DEBUG, "%s -- %@ waveform to %@", (uint8_t *)&v2, 0x20u);
}

void __56__RCWaveformDataSource_saveGeneratedWaveformIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "waveformDataSourceRequiresUpdate:", *(_QWORD *)(a1 + 32));

}

- (BOOL)shouldMergeLiveWaveform
{
  return 1;
}

- (void)mergeGeneratedWaveformIfNecessary
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  CFAbsoluteTime Current;
  double v9;
  double v10;
  NSObject *queue;
  id v12;
  _QWORD block[8];

  if (-[RCWaveformDataSource shouldMergeLiveWaveform](self, "shouldMergeLiveWaveform"))
  {
    -[RCWaveform segments](self->_accumulatorWaveform, "segments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "timeRange");
      v5 = v4 + -15.0;
    }
    else
    {
      v5 = -15.0;
    }
    -[RCWaveform segments](self->_accumulatorWaveform, "segments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - self->_liveRecordingMergeTime > 0.0333333333)
      {
        -[RCWaveformDataSource durationPerWaveformSlice](self, "durationPerWaveformSlice");
        v10 = fmin(v9, 1.79769313e308);
        if (v10 < 0.001)
          v10 = 0.001;
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __57__RCWaveformDataSource_mergeGeneratedWaveformIfNecessary__block_invoke;
        block[3] = &unk_1E769C7E0;
        block[4] = self;
        block[5] = 0x403E000000000000;
        *(double *)&block[6] = v5;
        *(double *)&block[7] = v10;
        dispatch_sync(queue, block);
        self->_liveRecordingMergeTime = Current;
      }
    }

  }
}

void __57__RCWaveformDataSource_mergeGeneratedWaveformIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "segments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCWaveformSegment segmentsByMergingSegments:preferredSegmentDuration:beforeTime:andThenUsePreferredSegmentDuration:](RCWaveformSegment, "segmentsByMergingSegments:preferredSegmentDuration:beforeTime:andThenUsePreferredSegmentDuration:", v2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSegments:", v3);

}

- (void)updateAccumulatorWaveformSegmentsWithBlock:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCWaveformDataSource.m"), 276, CFSTR("Invalid parameter"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__RCWaveformDataSource_updateAccumulatorWaveformSegmentsWithBlock___block_invoke;
  block[3] = &unk_1E769C808;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

void __67__RCWaveformDataSource_updateAccumulatorWaveformSegmentsWithBlock___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSegments:", v2);

}

- (void)waveformGeneratorDidFinishLoading:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *queue;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD block[5];

  v5 = a4;
  -[RCWaveformDataSource generatedWaveformOutputURL](self, "generatedWaveformOutputURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    OSLogForCategory(CFSTR("Default"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RCWaveformDataSource waveformGeneratorDidFinishLoading:error:].cold.1((uint64_t)v5, v8);

    if (self->_hasStartedLoading)
    {
      queue = self->_queue;
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke;
      block[3] = &unk_1E769BF30;
      block[4] = self;
      dispatch_sync(queue, block);
      self->_hasStartedLoading = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeItemAtURL:error:", v6, 0);

        v15[0] = v7;
        v15[1] = 3221225472;
        v15[2] = __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke_2;
        v15[3] = &unk_1E769BF30;
        v15[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v15);
      }
    }
  }
  else
  {
    -[RCWaveformDataSource saveGeneratedWaveformIfNecessary](self, "saveGeneratedWaveformIfNecessary");
  }
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke_3;
  v14[3] = &unk_1E769C7B8;
  v14[4] = self;
  -[RCWaveformDataSource _performObserversBlock:](self, "_performObserversBlock:", v14);

}

uint64_t __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllSegments");
}

uint64_t __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginLoading");
}

uint64_t __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waveformDataSourceDidFinishLoading:", *(_QWORD *)(a1 + 32));
}

- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4
{
  id v5;
  NSObject *queue;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  id v13;

  v5 = a4;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RCWaveformDataSource_waveformGenerator_didLoadWaveformSegment___block_invoke;
  block[3] = &unk_1E769BEE0;
  block[4] = self;
  v13 = v5;
  v8 = v5;
  dispatch_sync(queue, block);
  -[RCWaveformDataSource mergeGeneratedWaveformIfNecessary](self, "mergeGeneratedWaveformIfNecessary");
  -[RCWaveformDataSource segmentsInCompositionByConvertingFromActiveLoadingFragment:](self, "segmentsInCompositionByConvertingFromActiveLoadingFragment:", v8);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __65__RCWaveformDataSource_waveformGenerator_didLoadWaveformSegment___block_invoke_2;
  v10[3] = &unk_1E769C830;
  v10[4] = self;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  -[RCWaveformDataSource _performObserversBlock:](self, "_performObserversBlock:", v10);

}

uint64_t __65__RCWaveformDataSource_waveformGenerator_didLoadWaveformSegment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addSegment:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__RCWaveformDataSource_waveformGenerator_didLoadWaveformSegment___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waveformDataSource:didLoadWaveformSegment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_performOnObserversBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)_performObserversBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *queue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RCWaveformDataSource__performObserversBlock___block_invoke;
  block[3] = &unk_1E769BF80;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(queue, block);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v16[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

void __47__RCWaveformDataSource__performObserversBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (RCWaveformGenerator)waveformGenerator
{
  return self->_waveformGenerator;
}

- (RCWaveform)accumulatorWaveform
{
  return &self->_accumulatorWaveform->super;
}

- (double)durationPerWaveformSlice
{
  return self->_durationPerWaveformSlice;
}

- (void)setDurationPerWaveformSlice:(double)a3
{
  self->_durationPerWaveformSlice = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasSavedGeneratedWaveform
{
  return self->_hasSavedGeneratedWaveform;
}

- (void)setHasSavedGeneratedWaveform:(BOOL)a3
{
  self->_hasSavedGeneratedWaveform = a3;
}

- (NSURL)generatedWaveformOutputURL
{
  return self->_generatedWaveformOutputURL;
}

- (NSHashTable)weakObservers
{
  return self->_weakObservers;
}

- (BOOL)hasStartedLoading
{
  return self->_hasStartedLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_generatedWaveformOutputURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_waveformGenerator, 0);
  objc_storeStrong((id *)&self->_accumulatorWaveform, 0);
}

- (void)waveformGeneratorDidFinishLoading:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[RCWaveformDataSource waveformGeneratorDidFinishLoading:error:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1BD830000, a2, OS_LOG_TYPE_ERROR, "%s -- Waveform generator reported loading error! %@", (uint8_t *)&v2, 0x16u);
}

@end

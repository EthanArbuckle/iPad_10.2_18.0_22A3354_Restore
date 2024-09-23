@implementation RCCaptureInputWaveformDataSource

- (RCCaptureInputWaveformDataSource)initWithDestinationComposition:(id)a3 destinationFragment:(id)a4
{
  id v7;
  id v8;
  RCWaveformGenerator *v9;
  RCWaveformGenerator *v10;
  void *v11;
  RCCaptureInputWaveformDataSource *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = [RCWaveformGenerator alloc];
  +[RCDevice audioInputWaveformFlushInterval](RCDevice, "audioInputWaveformFlushInterval");
  v10 = -[RCWaveformGenerator initWithSegmentFlushInterval:](v9, "initWithSegmentFlushInterval:");
  objc_msgSend(v8, "waveformURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)RCCaptureInputWaveformDataSource;
  v12 = -[RCWaveformDataSource initWithWaveformGenerator:generatedWaveformOutputURL:](&v14, sel_initWithWaveformGenerator_generatedWaveformOutputURL_, v10, v11);

  if (v12)
  {
    v12->_updatedCapturedFragmentDuration = -3.40282347e38;
    v12->_finalCapturedFragmentDuration = -1.0;
    v12->_canUpdateCaptureComposition = 1;
    objc_storeStrong((id *)&v12->_destinationComposition, a3);
    objc_storeStrong((id *)&v12->_destinationFragment, a4);
    -[RCCaptureInputWaveformDataSource _initializeCaptureComposition](v12, "_initializeCaptureComposition");
  }

  return v12;
}

- (void)_initializeCaptureComposition
{
  double v3;
  double v4;
  RCMutableCompositionFragment *v5;
  RCMutableCompositionFragment *capturedFragment;
  __n128 v7;
  RCMutableComposition *v8;
  RCMutableComposition *capturedComposition;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  RCComposition *destinationComposition;
  RCCompositionFragment *destinationFragment;
  RCMutableComposition *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  RCComposition *v33;
  __int16 v34;
  RCCompositionFragment *v35;
  __int16 v36;
  RCMutableComposition *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[RCCompositionFragment timeRangeInComposition](self->_destinationFragment, "timeRangeInComposition");
  self->_captureInsertionTimeInComposition = v3;
  self->_captureInsertionDurationInComposition = v4 - v3;
  v5 = (RCMutableCompositionFragment *)-[RCCompositionFragment mutableCopy](self->_destinationFragment, "mutableCopy");
  capturedFragment = self->_capturedFragment;
  self->_capturedFragment = v5;

  v7.n128_u64[0] = *(_QWORD *)&self->_captureInsertionTimeInComposition;
  -[RCCompositionFragment setTimeRangeInComposition:](self->_capturedFragment, "setTimeRangeInComposition:", RCTimeRangeMake(v7, v7.n128_f64[0]));
  -[RCCompositionFragment setTimeRangeInContentToUse:](self->_capturedFragment, "setTimeRangeInContentToUse:", -1.79769313e308, 1.79769313e308);
  v8 = (RCMutableComposition *)-[RCComposition mutableCopy](self->_destinationComposition, "mutableCopy");
  capturedComposition = self->_capturedComposition;
  self->_capturedComposition = v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[RCComposition composedFragments](self->_capturedComposition, "composedFragments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(v10, "addObject:", v18);

        v19 = (void *)objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v11, "addObject:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v14);
  }

  v20 = (void *)-[RCMutableCompositionFragment copy](self->_capturedFragment, "copy");
  objc_msgSend(v10, "addObject:", v20);

  v21 = (void *)-[RCMutableCompositionFragment mutableCopy](self->_capturedFragment, "mutableCopy");
  objc_msgSend(v11, "addObject:", v21);

  -[RCComposition setDecomposedFragments:](self->_capturedComposition, "setDecomposedFragments:", v11);
  objc_storeStrong((id *)&self->_captureInitialDecomposedFragments, v10);
  OSLogForCategory(CFSTR("Default"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    destinationComposition = self->_destinationComposition;
    destinationFragment = self->_destinationFragment;
    v25 = self->_capturedComposition;
    *(_DWORD *)buf = 136315906;
    v31 = "-[RCCaptureInputWaveformDataSource _initializeCaptureComposition]";
    v32 = 2112;
    v33 = destinationComposition;
    v34 = 2112;
    v35 = destinationFragment;
    v36 = 2112;
    v37 = v25;
    _os_log_debug_impl(&dword_1BD830000, v22, OS_LOG_TYPE_DEBUG, "%s -- initializing capture waveform data source.\n  original composition = %@\n  original fragment = %@\n  initial capture composition = %@", buf, 0x2Au);
  }

  -[RCCaptureInputWaveformDataSource _updateCapturedComposition:](self, "_updateCapturedComposition:", 1);
}

- (void)waveformDataSourceDidFinishLoading:(id)a3
{
  id v4;
  RCCompositionWaveformDataSource *baseWaveformDataSource;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__RCCaptureInputWaveformDataSource_waveformDataSourceDidFinishLoading___block_invoke;
  v6[3] = &unk_1E769C7B8;
  v6[4] = self;
  v4 = a3;
  -[RCWaveformDataSource _performObserversBlock:](self, "_performObserversBlock:", v6);
  objc_msgSend(v4, "removeObserver:", self);

  baseWaveformDataSource = self->_baseWaveformDataSource;
  self->_baseWaveformDataSource = 0;

}

uint64_t __71__RCCaptureInputWaveformDataSource_waveformDataSourceDidFinishLoading___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waveformDataSourceDidFinishLoading:", *(_QWORD *)(a1 + 32));
}

- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__RCCaptureInputWaveformDataSource_waveformDataSource_didLoadWaveformSegment___block_invoke;
  v7[3] = &unk_1E769C830;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[RCWaveformDataSource _performObserversBlock:](self, "_performObserversBlock:", v7);

}

uint64_t __78__RCCaptureInputWaveformDataSource_waveformDataSource_didLoadWaveformSegment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waveformDataSource:didLoadWaveformSegment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)waveformDataSourceRequiresUpdate:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__RCCaptureInputWaveformDataSource_waveformDataSourceRequiresUpdate___block_invoke;
  v3[3] = &unk_1E769C7B8;
  v3[4] = self;
  -[RCWaveformDataSource _performObserversBlock:](self, "_performObserversBlock:", v3);
}

void __69__RCCaptureInputWaveformDataSource_waveformDataSourceRequiresUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "waveformDataSourceRequiresUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)cancelLoading
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCCaptureInputWaveformDataSource;
  -[RCWaveformDataSource cancelLoading](&v3, sel_cancelLoading);
  -[RCCompositionWaveformDataSource cancelLoading](self->_baseWaveformDataSource, "cancelLoading");
}

- (void)startLoading
{
  void *v3;
  void *v4;
  uint64_t v5;
  RCWaveform *v6;
  void *baseWaveform;
  RCCompositionWaveformDataSource *v8;
  RCWaveform *v9;
  RCWaveform *v10;
  id v11;

  -[RCComposition composedWaveformURL](self->_destinationComposition, "composedWaveformURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCWaveform waveformWithContentsOfURL:minimumRequiredVersion:](RCMutableWaveform, "waveformWithContentsOfURL:minimumRequiredVersion:", v3, +[RCWaveform version](RCWaveform, "version"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (RCWaveform *)v11;
    baseWaveform = self->_baseWaveform;
    self->_baseWaveform = v6;
  }
  else
  {
    v8 = -[RCCompositionWaveformDataSource initWithComposition:]([RCCompositionWaveformDataSource alloc], "initWithComposition:", self->_destinationComposition);
    -[RCWaveformDataSource addObserver:](v8, "addObserver:", self);
    -[RCWaveformDataSource beginLoading](v8, "beginLoading");
    -[RCWaveformDataSource accumulatorWaveform](v8, "accumulatorWaveform");
    v9 = (RCWaveform *)objc_claimAutoreleasedReturnValue();
    v10 = self->_baseWaveform;
    self->_baseWaveform = v9;

    baseWaveform = self->_baseWaveformDataSource;
    self->_baseWaveformDataSource = v8;
  }

}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCCaptureInputWaveformDataSource.m"), 137, CFSTR("ERROR: use -finishLoadingWithCompletionTimeout:finalizedFragmentDuration:completionBlock: instead"));

}

- (BOOL)waitUntilFinished
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCCaptureInputWaveformDataSource.m"), 142, CFSTR("ERROR: use -waitUntilFinishedWithFinalizedDestinationFragmentDuration: instead"));

  return 0;
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 finalizedFragmentDuration:(double)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;

  v8 = a5;
  -[RCCompositionWaveformDataSource waitUntilSegmentsFinishLoadingWithTimeout:](self->_baseWaveformDataSource, "waitUntilSegmentsFinishLoadingWithTimeout:", a3);
  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__RCCaptureInputWaveformDataSource_finishLoadingWithCompletionTimeout_finalizedFragmentDuration_completionBlock___block_invoke;
  v11[3] = &unk_1E769D7C8;
  v13 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "finishLoadingWithCompletionTimeout:completionBlock:", a3, v11);

}

void __113__RCCaptureInputWaveformDataSource_finishLoadingWithCompletionTimeout_finalizedFragmentDuration_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_captureSesionCompletedWithFinalizedDuration:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "saveGeneratedWaveformIfNecessary");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (BOOL)waitUntilFinishedWithFinalizedDestinationFragmentDuration:(double)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  _QWORD v10[4];
  dispatch_semaphore_t v11;

  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__RCCaptureInputWaveformDataSource_waitUntilFinishedWithFinalizedDestinationFragmentDuration___block_invoke;
  v10[3] = &unk_1E769C768;
  v11 = v5;
  v6 = v5;
  -[RCCaptureInputWaveformDataSource finishLoadingWithCompletionTimeout:finalizedFragmentDuration:completionBlock:](self, "finishLoadingWithCompletionTimeout:finalizedFragmentDuration:completionBlock:", -1, v10, a3);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canceled") ^ 1;

  return v8;
}

intptr_t __94__RCCaptureInputWaveformDataSource_waitUntilFinishedWithFinalizedDestinationFragmentDuration___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)setPaused:(BOOL)a3
{
  return 0;
}

- (id)_captureSegmentsInComponentWaveform:(id)a3 captureTimeRange:(id)a4 componentWaveformSegmentOffset:(double)a5
{
  double var1;
  double var0;
  id v7;
  double v9;
  id v10;
  void *v11;

  var1 = a4.var1;
  var0 = a4.var0;
  if (a5 == 0.0)
  {
    v7 = a3;
    objc_msgSend(v7, "segmentsByClippingToTimeRange:", var0, var1);
  }
  else
  {
    v9 = -a5;
    v10 = a3;
    objc_msgSend(v10, "segmentsByClippingToTimeRange:", RCTimeRangeShift(var0, var1, v9));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    +[RCWaveformSegment segmentsByShiftingSegments:byTimeOffset:](RCWaveformSegment, "segmentsByShiftingSegments:byTimeOffset:", v7, a5);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateCapturedDelta:(double)a3
{
  self->captureDelta = a3;
}

- (id)waveformSegmentsInTimeRange:(id)a3
{
  double var1;
  double var0;
  void *v6;
  __n128 v7;
  double v8;
  __n128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  double v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[10];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  var1 = a3.var1;
  var0 = a3.var0;
  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42.receiver = self;
  v42.super_class = (Class)RCCaptureInputWaveformDataSource;
  -[RCWaveformDataSource duration](&v42, sel_duration);
  if (v7.n128_f64[0] < self->captureDelta)
    v7.n128_u64[0] = *(_QWORD *)&self->captureDelta;
  v8 = self->_captureInsertionTimeInComposition + v7.n128_f64[0];
  v7.n128_u64[0] = *(_QWORD *)&self->_captureInsertionTimeInComposition;
  v10 = RCTimeRangeMake(v7, v8);
  v12 = v11;
  if (var0 < self->_captureInsertionTimeInComposition)
  {
    if (var1 >= v10)
      v13 = v10;
    else
      v13 = var1;
    v9.n128_f64[0] = var0;
    -[RCCaptureInputWaveformDataSource _captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:](self, "_captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:", self->_baseWaveform, RCTimeRangeMake(v9, v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "setIsRendered:", 1);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v15);
    }
    objc_msgSend(v6, "addObjectsFromArray:", v14);

  }
  if (var1 > v10)
  {
    v18 = RCTimeRangeIntersectTimeRange(var0, var1, v10, v12);
    v20 = v19;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__13;
    v36 = __Block_byref_object_dispose__13;
    v37 = 0;
    -[RCWaveformDataSource queue](self, "queue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__RCCaptureInputWaveformDataSource_waveformSegmentsInTimeRange___block_invoke;
    block[3] = &unk_1E769D7F0;
    block[4] = self;
    block[5] = &v32;
    *(double *)&block[6] = v18;
    block[7] = v20;
    *(double *)&block[8] = v10;
    *(double *)&block[9] = v12;
    dispatch_sync(v21, block);

    if (v33[5])
      objc_msgSend(v6, "addObjectsFromArray:");
    _Block_object_dispose(&v32, 8);

  }
  if (var1 > v12)
  {
    if (v12 >= var0)
      v9.n128_f64[0] = v12;
    else
      v9.n128_f64[0] = var0;
    -[RCCaptureInputWaveformDataSource _captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:](self, "_captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:", self->_baseWaveform, RCTimeRangeMake(v9, var1));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "setIsRendered:", 1);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v23);
    }
    objc_msgSend(v6, "addObjectsFromArray:", v22);

  }
  return v6;
}

void __64__RCCaptureInputWaveformDataSource_waveformSegmentsInTimeRange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accumulatorWaveform");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight
{
  double v3;
  double v4;
  __n128 v5;
  double v6;
  double v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[RCCaptureInputWaveformDataSource _fragmentDuration](self, "_fragmentDuration");
  v4 = v3 + self->_captureInsertionTimeInComposition;
  v5.n128_u64[0] = *(_QWORD *)&self->_captureInsertionTimeInComposition;
  v6 = RCTimeRangeMake(v5, v4);
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (id)segmentsInCompositionByConvertingFromActiveLoadingFragment:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCWaveformSegment segmentsByShiftingSegments:byTimeOffset:](RCWaveformSegment, "segmentsByShiftingSegments:byTimeOffset:", v6, self->_captureInsertionTimeInComposition, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (RCMutableComposition)capturedComposition
{
  -[RCCaptureInputWaveformDataSource _updateCapturedComposition:](self, "_updateCapturedComposition:", 0);
  return self->_capturedComposition;
}

- (RCMutableCompositionFragment)capturedFragment
{
  -[RCCaptureInputWaveformDataSource _updateCapturedComposition:](self, "_updateCapturedComposition:", 0);
  return self->_capturedFragment;
}

- (double)duration
{
  double result;

  -[RCCaptureInputWaveformDataSource _updateCapturedComposition:](self, "_updateCapturedComposition:", 0);
  -[RCComposition composedDuration](self->_capturedComposition, "composedDuration");
  return result;
}

- (void)undoCapture
{
  void *v4;
  char v5;
  RCMutableComposition *v6;
  RCMutableComposition *capturedComposition;
  void *v8;

  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "idle");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCCaptureInputWaveformDataSource.m"), 267, CFSTR("Invalid state to perform capture undo, generator has not finished yet."));

  }
  -[RCCompositionFragment deleteFromFilesystem](self->_capturedFragment, "deleteFromFilesystem");
  -[RCCompositionFragment setContentDuration:](self->_capturedFragment, "setContentDuration:", 0.0);
  v6 = (RCMutableComposition *)-[RCComposition mutableCopy](self->_destinationComposition, "mutableCopy");
  capturedComposition = self->_capturedComposition;
  self->_capturedComposition = v6;

  self->_canUpdateCaptureComposition = 0;
}

- (BOOL)appendAveragePowerLevelsByDigestingCapturedSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v4;

  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "appendAveragePowerLevelsByDigestingSampleBuffer:", a3);

  return (char)a3;
}

- (BOOL)appendAveragePowerLevelsByDigestingAudioPCMBuffer:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "appendAveragePowerLevelsByDigestingAudioPCMBuffer:", v4);

  return v6;
}

- (void)flushPendingCapturedSampleBuffers
{
  id v2;

  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushPendingCapturedSampleBuffers");

}

- (void)appendAveragePowerLevelsByDigestingWaveformSegment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendAveragePowerLevelsByDigestingWaveformSegments:", v6);
}

- (void)_captureSesionCompletedWithFinalizedDuration:(double)a3
{
  self->_finalCapturedFragmentDuration = a3;
  -[RCCaptureInputWaveformDataSource _updateCapturedComposition:](self, "_updateCapturedComposition:", 1);
  self->_canUpdateCaptureComposition = 0;
}

- (double)_fragmentDuration
{
  double result;
  objc_super v3;

  result = self->_finalCapturedFragmentDuration;
  if (result < 0.0)
  {
    v3.receiver = self;
    v3.super_class = (Class)RCCaptureInputWaveformDataSource;
    -[RCWaveformDataSource duration](&v3, sel_duration);
  }
  return result;
}

- (void)_updateCapturedComposition:(BOOL)a3
{
  double v6;
  double v7;
  __n128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double finalCapturedFragmentDuration;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[RCCaptureInputWaveformDataSource _fragmentDuration](self, "_fragmentDuration");
  v7 = v6;
  if (a3 || vabdd_f64(v6, self->_updatedCapturedFragmentDuration) >= 0.01)
  {
    self->_updatedCapturedFragmentDuration = v6;
    -[RCCompositionFragment setContentDuration:](self->_capturedFragment, "setContentDuration:", v6);
    v8.n128_u64[0] = *(_QWORD *)&self->_captureInsertionTimeInComposition;
    -[RCCompositionFragment setTimeRangeInComposition:](self->_capturedFragment, "setTimeRangeInComposition:", RCTimeRangeMake(v8, v7 + v8.n128_f64[0]));
    -[RCComposition decomposedFragments](self->_capturedComposition, "decomposedFragments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "removeLastObject");
    objc_msgSend(v10, "addObject:", self->_capturedFragment);
    -[RCComposition setDecomposedFragments:](self->_capturedComposition, "setDecomposedFragments:", v10);
    if (self->_finalCapturedFragmentDuration > 0.0)
    {
      -[RCWaveformDataSource accumulatorWaveform](self, "accumulatorWaveform");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "segmentsCopy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "timeRange");
        finalCapturedFragmentDuration = self->_finalCapturedFragmentDuration;
        if (vabdd_f64(v15, finalCapturedFragmentDuration) > 0.00000011920929)
        {
          objc_msgSend(v13, "timeRange");
          if (finalCapturedFragmentDuration - v16 >= 1.0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCCaptureInputWaveformDataSource.m"), 345, CFSTR("significant mismatch between waveform and m4a durations detected, saved duration is > accumulated waveform duration"));

          }
          objc_msgSend(v13, "timeRange");
          v18 = self->_finalCapturedFragmentDuration;
          if (v18 > 0.00000011920929)
          {
            v19 = v17;
            if (vabdd_f64(v18, v17) >= 0.07)
            {
              objc_msgSend(v13, "timeRange");
              v21 = v20;
              v22 = self->_finalCapturedFragmentDuration;
              OSLogForCategory(CFSTR("Default"));
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                v25 = 136315906;
                v26 = "-[RCCaptureInputWaveformDataSource _updateCapturedComposition:]";
                v27 = 2048;
                v28 = v22;
                v29 = 2048;
                v30 = v21;
                v31 = 2048;
                v32 = v18 - v19;
                _os_log_impl(&dword_1BD830000, v23, OS_LOG_TYPE_INFO, "%s -- DURATION MISMATCH: AVAsset.duration = %.3f, duration derived from samples = %.3f (delta = %.6f)!", (uint8_t *)&v25, 0x2Au);
              }

              v18 = self->_finalCapturedFragmentDuration;
            }
          }
          -[RCCaptureInputWaveformDataSource _modifyAccumulatedWaveformSegmentsToMatchFinalDuration:](self, "_modifyAccumulatedWaveformSegmentsToMatchFinalDuration:", v18);
        }
      }

    }
  }
}

- (void)_modifyAccumulatedWaveformSegmentsToMatchFinalDuration:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  -[RCWaveformDataSource accumulatorWaveform](self, "accumulatorWaveform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "segmentsCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v9)
  {
    objc_msgSend(v9, "timeRange");
    if (v8 >= a3)
      -[RCCaptureInputWaveformDataSource _truncateAccumulatedWaveformSegmentsToEndTime:](self, "_truncateAccumulatedWaveformSegmentsToEndTime:", a3);
    else
      -[RCCaptureInputWaveformDataSource _extendAccumulatedWaveformSegmentsToMatchFinalDuration:](self, "_extendAccumulatedWaveformSegmentsToMatchFinalDuration:", a3);
    v7 = v9;
  }

}

- (void)_extendAccumulatedWaveformSegmentsToMatchFinalDuration:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__RCCaptureInputWaveformDataSource__extendAccumulatedWaveformSegmentsToMatchFinalDuration___block_invoke;
  v3[3] = &unk_1E769D818;
  *(double *)&v3[5] = a3;
  v3[4] = self;
  -[RCWaveformDataSource updateAccumulatorWaveformSegmentsWithBlock:](self, "updateAccumulatorWaveformSegmentsWithBlock:", v3);
}

id __91__RCCaptureInputWaveformDataSource__extendAccumulatedWaveformSegmentsToMatchFinalDuration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  __n128 v6;
  void *v7;
  NSObject *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "segmentsCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v5, "removeLastObject");
  objc_msgSend(v4, "timeRange");
  v7 = (void *)objc_msgSend(v4, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v6, *(double *)(a1 + 40)));
  objc_msgSend(v5, "addObject:", v7);
  OSLogForCategory(CFSTR("Default"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "AVOutputURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 136316162;
    v14 = "-[RCCaptureInputWaveformDataSource _extendAccumulatedWaveformSegmentsToMatchFinalDuration:]_block_invoke";
    v15 = 2112;
    v16 = v11;
    v17 = 2048;
    v18 = v12;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v7;
    _os_log_debug_impl(&dword_1BD830000, v8, OS_LOG_TYPE_DEBUG, "%s -- Modifying waveform segments of %@ to match asset final duration (%.2f) by extending last segment.  Last segment was %@, now %@", (uint8_t *)&v13, 0x34u);

  }
  return v5;
}

- (void)_truncateAccumulatedWaveformSegmentsToEndTime:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__RCCaptureInputWaveformDataSource__truncateAccumulatedWaveformSegmentsToEndTime___block_invoke;
  v3[3] = &unk_1E769D818;
  *(double *)&v3[5] = a3;
  v3[4] = self;
  -[RCWaveformDataSource updateAccumulatorWaveformSegmentsWithBlock:](self, "updateAccumulatorWaveformSegmentsWithBlock:", v3);
}

id __82__RCCaptureInputWaveformDataSource__truncateAccumulatedWaveformSegmentsToEndTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __n128 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "segmentsCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "timeRange");
    objc_msgSend(v3, "segmentsByClippingToTimeRange:", RCTimeRangeMake(v7, *(double *)(a1 + 40)));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    if (v8)
    {
      OSLogForCategory(CFSTR("Default"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "AVOutputURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v8, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 136316162;
        v18 = "-[RCCaptureInputWaveformDataSource _truncateAccumulatedWaveformSegmentsToEndTime:]_block_invoke";
        v19 = 2112;
        v20 = v14;
        v21 = 2048;
        v22 = v15;
        v23 = 2112;
        v24 = v6;
        v25 = 2112;
        v26 = v16;
        _os_log_debug_impl(&dword_1BD830000, v10, OS_LOG_TYPE_DEBUG, "%s -- Modifying waveform segments of %@ to match asset final duration (%.2f) by truncating waveform.  Last segment was %@, now %@", (uint8_t *)&v17, 0x34u);

      }
      v9 = v8;
    }
    v11 = v9;

  }
  else
  {
    v11 = v4;
  }

  return v11;
}

- (BOOL)shouldMergeLiveWaveform
{
  return 1;
}

- (RCComposition)destinationComposition
{
  return self->_destinationComposition;
}

- (RCCompositionFragment)destinationFragment
{
  return self->_destinationFragment;
}

- (RCWaveform)baseWaveform
{
  return self->_baseWaveform;
}

- (RCCompositionWaveformDataSource)baseWaveformDataSource
{
  return self->_baseWaveformDataSource;
}

- (double)updatedCapturedFragmentDuration
{
  return self->_updatedCapturedFragmentDuration;
}

- (double)finalCapturedFragmentDuration
{
  return self->_finalCapturedFragmentDuration;
}

- (BOOL)canUpdateCaptureComposition
{
  return self->_canUpdateCaptureComposition;
}

- (double)captureInsertionTimeInComposition
{
  return self->_captureInsertionTimeInComposition;
}

- (double)captureInsertionDurationInComposition
{
  return self->_captureInsertionDurationInComposition;
}

- (NSArray)captureInitialDecomposedFragments
{
  return self->_captureInitialDecomposedFragments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureInitialDecomposedFragments, 0);
  objc_storeStrong((id *)&self->_baseWaveformDataSource, 0);
  objc_storeStrong((id *)&self->_baseWaveform, 0);
  objc_storeStrong((id *)&self->_destinationFragment, 0);
  objc_storeStrong((id *)&self->_destinationComposition, 0);
  objc_storeStrong((id *)&self->_capturedFragment, 0);
  objc_storeStrong((id *)&self->_capturedComposition, 0);
}

@end

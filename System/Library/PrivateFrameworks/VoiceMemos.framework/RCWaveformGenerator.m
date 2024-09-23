@implementation RCWaveformGenerator

- (RCWaveformGenerator)init
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformGenerator.mm");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("<Unknown File>");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 74, CFSTR("use the class specific designated initializer for %@"), v10, 0, 0, 0, 0);

  return 0;
}

- (RCWaveformGenerator)initWithSegmentFlushInterval:(double)a3
{
  id v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)RCWaveformGenerator;
  v4 = -[RCWaveformGenerator init](&v17, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.VoiceMemos.RCWaveformGenerator.queue", 0);
    v6 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v5;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 3), v4, v4, 0);
    v7 = dispatch_semaphore_create(0);
    v8 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v7;

    dispatch_semaphore_signal(*((dispatch_semaphore_t *)v4 + 2));
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v4 + 6);
    *((_QWORD *)v4 + 6) = v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v4 + 7);
    *((_QWORD *)v4 + 7) = v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = v13;

    *((_QWORD *)v4 + 31) = 160;
    v15 = 0.0333333333;
    if (a3 > 0.0)
      v15 = a3;
    *((double *)v4 + 30) = v15;
  }
  return (RCWaveformGenerator *)v4;
}

- (RCWaveformGenerator)initWithSamplingParametersFromGenerator:(id)a3
{
  double *v4;
  RCWaveformGenerator *v5;

  v4 = (double *)a3;
  v5 = -[RCWaveformGenerator initWithSegmentFlushInterval:](self, "initWithSegmentFlushInterval:", v4[30]);
  if (v5)
    -[RCWaveformGenerator setOverviewUnitsPerSecond:](v5, "setOverviewUnitsPerSecond:", objc_msgSend(v4, "overviewUnitsPerSecond"));

  return v5;
}

- (void)addSegmentOutputObserver:(id)a3
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
  block[2] = __48__RCWaveformGenerator_addSegmentOutputObserver___block_invoke;
  block[3] = &unk_1E769BB60;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __48__RCWaveformGenerator_addSegmentOutputObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)removeSegmentOutputObserver:(id)a3
{
  NSObject *queue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (dispatch_get_specific(self) == self)
  {
    -[NSHashTable removeObject:](self->_weakObservers, "removeObject:", v5);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__RCWaveformGenerator_removeSegmentOutputObserver___block_invoke;
    block[3] = &unk_1E769BB60;
    block[4] = self;
    v7 = v5;
    dispatch_sync(queue, block);

  }
}

uint64_t __51__RCWaveformGenerator_removeSegmentOutputObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)flushPendingCapturedSampleBuffers
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RCWaveformGenerator_flushPendingCapturedSampleBuffers__block_invoke;
  block[3] = &unk_1E769BB88;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__RCWaveformGenerator_flushPendingCapturedSampleBuffers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_flushRemainingData");
}

- (BOOL)appendAveragePowerLevelsByDigestingSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  int v5;

  v5 = _checkCanAppend(self, (objc_selector *)a2);
  if (v5)
    -[RCWaveformGenerator _appendPowerMeterValuesFromSampleBuffer:](self, "_appendPowerMeterValuesFromSampleBuffer:", a3);
  return v5;
}

- (BOOL)appendAveragePowerLevelsByDigestingAudioPCMBuffer:(id)a3
{
  id v5;
  char v6;

  v5 = a3;
  v6 = _checkCanAppend(self, (objc_selector *)a2);
  if ((v6 & 1) != 0)
    -[RCWaveformGenerator _appendPowerMeterValuesFromAudioPCMBuffer:](self, "_appendPowerMeterValuesFromAudioPCMBuffer:", v5);

  return v6;
}

- (BOOL)appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:(id)a3 progressBlock:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((_checkCanAppend(self, (objc_selector *)a2) & 1) != 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCWaveformGenerator appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:progressBlock:].cold.1(v10, (uint64_t)v13, v9);
    }

    v11 = -[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:](self, "_appendPowerMeterValuesFromDataInAudioFile:progressBlock:", v7, v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3
{
  id v5;
  BOOL v6;

  v5 = a3;
  v6 = (_checkCanAppend(self, (objc_selector *)a2) & 1) != 0
    && -[RCWaveformGenerator _appendAveragePowerLevelsByDigestingWaveformSegments:](self, "_appendAveragePowerLevelsByDigestingWaveformSegments:", v5);

  return v6;
}

- (BOOL)appendAveragePowerLevel:(float)a3
{
  int v5;
  double v6;

  v5 = _checkCanAppend(self, (objc_selector *)a2);
  if (v5)
  {
    *(float *)&v6 = a3;
    -[RCWaveformGenerator _appendAveragePowerLevel:](self, "_appendAveragePowerLevel:", v6);
  }
  return v5;
}

- (BOOL)appendAveragePowerLevelsByDigestingWaveform:(id)a3
{
  id v5;
  char v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  v6 = _checkCanAppend(self, (objc_selector *)a2);
  if ((v6 & 1) != 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[RCWaveformGenerator appendAveragePowerLevelsByDigestingWaveform:].cold.1();

    objc_msgSend(v5, "segmentsCopy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCWaveformGenerator _appendAveragePowerLevelsByDigestingWaveformSegments:](self, "_appendAveragePowerLevelsByDigestingWaveformSegments:", v8);

  }
  return v6;
}

- (BOOL)loadable
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__RCWaveformGenerator_loadable__block_invoke;
  v5[3] = &unk_1E769BBB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__RCWaveformGenerator_loadable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8) == 0;
  return result;
}

- (BOOL)finished
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__RCWaveformGenerator_finished__block_invoke;
  v5[3] = &unk_1E769BBB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__RCWaveformGenerator_finished__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8) == 3;
  return result;
}

- (BOOL)idle
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__RCWaveformGenerator_idle__block_invoke;
  v5[3] = &unk_1E769BBB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__RCWaveformGenerator_idle__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;
  char v3;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (v1)
    v2 = v1 == 3;
  else
    v2 = 1;
  v3 = v2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v3;
  return result;
}

- (void)beginLoading
{
  NSObject *queue;
  _QWORD block[7];
  _QWORD v4[3];
  char v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v5 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__RCWaveformGenerator_beginLoading__block_invoke;
  block[3] = &unk_1E769BC00;
  block[4] = self;
  block[5] = v4;
  block[6] = a2;
  dispatch_sync(queue, block);
  _Block_object_dispose(v4, 8);
}

void __35__RCWaveformGenerator_beginLoading__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v3 >= 2)
      _assertInvalidStateMessage(CFSTR("begin loading"), v3, *(objc_selector **)(a1 + 48));
  }
  else
  {
    *(_QWORD *)(v2 + 8) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 216);
    *(_QWORD *)(v4 + 216) = 0;

    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__RCWaveformGenerator_beginLoading__block_invoke_2;
    v7[3] = &unk_1E769BBD8;
    v7[4] = v6;
    objc_msgSend(v6, "_onQueue_performObserversBlock:", v7);
  }
}

void __35__RCWaveformGenerator_beginLoading__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "waveformGeneratorWillBeginLoading:", *(_QWORD *)(a1 + 32));

}

- (void)setPaused:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__RCWaveformGenerator_setPaused___block_invoke;
  v4[3] = &unk_1E769BC28;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

void __33__RCWaveformGenerator_setPaused___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 224);
  if (*(_BYTE *)(a1 + 40))
  {
    *(_QWORD *)(v1 + 224) = v2 + 1;
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v3 + 224) == 1)
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v3 + 16), 0xFFFFFFFFFFFFFFFFLL);
  }
  else if (v2)
  {
    *(_QWORD *)(v1 + 224) = v2 - 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "-[RCWaveformGenerator setPaused:]_block_invoke";
      _os_log_impl(&dword_1BD830000, v4, OS_LOG_TYPE_INFO, "%s -- WARNING: Unbalanced setPaused: detected", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (BOOL)paused
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__RCWaveformGenerator_paused__block_invoke;
  v5[3] = &unk_1E769BBB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__RCWaveformGenerator_paused__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 224) == 0;
  return result;
}

- (void)terminateLoadingImmediately
{
  -[RCWaveformGenerator async_finishLoadingByTerminating:loadingFinishedBlockTimeout:loadingFinishedBlock:](self, "async_finishLoadingByTerminating:loadingFinishedBlockTimeout:loadingFinishedBlock:", 1, 0, 0);
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
  -[RCWaveformGenerator async_finishLoadingByTerminating:loadingFinishedBlockTimeout:loadingFinishedBlock:](self, "async_finishLoadingByTerminating:loadingFinishedBlockTimeout:loadingFinishedBlock:", 0, a3, a4);
}

- (void)async_finishLoadingByTerminating:(BOOL)a3 loadingFinishedBlockTimeout:(unint64_t)a4 loadingFinishedBlock:(id)a5
{
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  unint64_t v15;
  BOOL v16;

  v9 = (void *)objc_msgSend(a5, "copy");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke;
  block[3] = &unk_1E769BCA0;
  block[4] = self;
  v13 = v9;
  v16 = a3;
  v14 = a2;
  v15 = a4;
  v11 = v9;
  dispatch_async(queue, block);

}

void __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  dispatch_semaphore_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  uint64_t v21;
  char v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  v29 = *(id *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8) == 3)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, BOOL, _QWORD))(v3 + 16))(v3, *(_BYTE *)(v2 + 232) == 0, *(_QWORD *)(v2 + 216));
  }
  else
  {
    v4 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke_19;
    v23[3] = &unk_1E769BC50;
    v27 = v28;
    v26 = *(id *)(a1 + 40);
    v7 = v5;
    v24 = v7;
    v8 = v4;
    v25 = v8;
    v9 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v7);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v11 = (void *)MEMORY[0x1C3B76918](v9);
    objc_msgSend(v10, "addObject:", v11);

    v12 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v12 + 232))
      v13 = 1;
    else
      v13 = *(_BYTE *)(a1 + 64) != 0;
    *(_BYTE *)(v12 + 232) = v13;
    v14 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v14 + 8) != 2)
    {
      *(_QWORD *)(v14 + 8) = 2;
      if (_checkCanAppend(*(RCWaveformGenerator **)(a1 + 32), *(objc_selector **)(a1 + 48)))
      {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_flushRemainingData");
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_performInternalFinishedLoadingBlocksAndFinishObservers");
      }
    }
    dispatch_get_global_queue(0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke_2;
    v18[3] = &unk_1E769BC78;
    v22 = *(_BYTE *)(a1 + 64);
    v19 = v8;
    v20 = v9;
    v21 = *(_QWORD *)(a1 + 56);
    v16 = v8;
    v17 = v9;
    dispatch_async(v15, v18);

  }
  _Block_object_dispose(v28, 8);

}

intptr_t __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke_19(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_onQueue_performLoadingFinishedBlock:internalBlockUUID:isTimeout:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t (*v2)(void);
  intptr_t result;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), *(_QWORD *)(a1 + 48));
    if (!result)
      return result;
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v2();
}

- (void)_onQueue_performLoadingFinishedBlock:(id)a3 internalBlockUUID:(id)a4 isTimeout:(BOOL)a5
{
  _BOOL4 v5;
  void (**v8)(id, uint64_t, NSError *);
  id v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 canceled;
  NSError *v13;
  NSError *v14;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  RCWaveformGenerator *v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t, NSError *))a3;
  v9 = a4;
  v10 = -[NSMutableArray indexOfObject:](self->_internalFinishedLoadingBlockUUIDs, "indexOfObject:", v9);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_internalFinishedLoadingBlockUUIDs, "removeObjectAtIndex:", v10);
    -[NSMutableArray removeObjectAtIndex:](self->_internalFinishedLoadingBlocks, "removeObjectAtIndex:", v10);
  }
  if (v5)
  {
    OSLogForCategory(CFSTR("Default"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = 136315394;
      v18 = "-[RCWaveformGenerator _onQueue_performLoadingFinishedBlock:internalBlockUUID:isTimeout:]";
      v19 = 2112;
      v20 = self;
      _os_log_impl(&dword_1BD830000, v11, OS_LOG_TYPE_INFO, "%s -- [FinishLoading] %@ WARNING: Encountered time out while trying to finish loading", (uint8_t *)&v17, 0x16u);
    }

    if (!self->_canceled && !-[NSMutableArray count](self->_internalFinishedLoadingBlockUUIDs, "count"))
      -[RCWaveformGenerator async_finishLoadingByTerminating:loadingFinishedBlockTimeout:loadingFinishedBlock:](self, "async_finishLoadingByTerminating:loadingFinishedBlockTimeout:loadingFinishedBlock:", 1, 0, 0);
  }
  canceled = self->_canceled;
  v13 = self->_loadingError;
  v14 = v13;
  if (v8)
  {
    v16 = !canceled && v13 == 0;
    v8[2](v8, v16, v13);
  }

}

- (void)_onQueue_performInternalFinishedLoadingBlocksAndFinishObservers
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_internalFinishedLoadingBlocks, "copy");
  -[NSHashTable allObjects](self->_weakObservers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeAllObjects](self->_internalFinishedLoadingBlocks, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_internalFinishedLoadingBlockUUIDs, "removeAllObjects");
  self->_state = 3;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global, PowerMeter::Reset(&self->_samplePowerMeter));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "waveformGeneratorDidFinishLoading:error:", self, self->_loadingError, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

uint64_t __86__RCWaveformGenerator__onQueue_performInternalFinishedLoadingBlocksAndFinishObservers__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, 0);
}

- (void)_onQueue_performObserversBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_weakObservers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_appendAveragePowerLevel:(float)a3
{
  NSObject *queue;
  _QWORD v4[5];
  float v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__RCWaveformGenerator__appendAveragePowerLevel___block_invoke;
  v4[3] = &unk_1E769BCE8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __48__RCWaveformGenerator__appendAveragePowerLevel___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushAveragePowerLevel:", a2);
}

- (void)_appendPowerMeterValuesFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  const AudioStreamBasicDescription *v7;
  id v8;
  void *v9;
  id v10;
  AudioBufferList *v11;
  OSStatus AudioBufferListWithRetainedBlockBuffer;
  NSObject *v13;
  NSObject *queue;
  _QWORD v15[7];
  size_t bufferListSizeNeededOut;

  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (StreamBasicDescription)
  {
    v7 = StreamBasicDescription;
    bufferListSizeNeededOut = 0;
    if (!CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a3, &bufferListSizeNeededOut, 0, 0, 0, 0, 0, 0))
    {
      v8 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v9 = (void *)objc_msgSend(v8, "initWithLength:", bufferListSizeNeededOut);
      if (v9)
      {
        bufferListSizeNeededOut = 0;
        v10 = objc_retainAutorelease(v9);
        v11 = (AudioBufferList *)objc_msgSend(v10, "mutableBytes");
        AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a3, 0, v11, objc_msgSend(v10, "length"), 0, 0, 0, (CMBlockBufferRef *)&bufferListSizeNeededOut);
        if (AudioBufferListWithRetainedBlockBuffer)
        {
          OSLogForCategory(CFSTR("Default"));
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[RCWaveformGenerator _appendPowerMeterValuesFromSampleBuffer:].cold.1(AudioBufferListWithRetainedBlockBuffer, v13);

        }
        else
        {
          queue = self->_queue;
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __63__RCWaveformGenerator__appendPowerMeterValuesFromSampleBuffer___block_invoke;
          v15[3] = &unk_1E769BD10;
          v15[5] = v11;
          v15[6] = v7;
          v15[4] = self;
          dispatch_sync(queue, v15);
          CFRelease((CFTypeRef)bufferListSizeNeededOut);
        }

      }
    }
  }
}

uint64_t __63__RCWaveformGenerator__appendPowerMeterValuesFromSampleBuffer___block_invoke(uint64_t result)
{
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *(_DWORD **)(result + 40);
  if (*v1)
  {
    v2 = result;
    v3 = 0;
    v4 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v2 + 32), "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", *(_QWORD *)&v1[v3 + 4], v1[v3 + 2]* (v1[v3 + 3]/ (*(_DWORD *)(*(_QWORD *)(v2 + 48) + 16) / *(_DWORD *)(*(_QWORD *)(v2 + 48) + 20))));
      ++v4;
      v1 = *(_DWORD **)(v2 + 40);
      v3 += 4;
    }
    while (v4 < *v1);
  }
  return result;
}

- (void)_appendPowerMeterValuesFromAudioPCMBuffer:(id)a3
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
  block[2] = __65__RCWaveformGenerator__appendPowerMeterValuesFromAudioPCMBuffer___block_invoke;
  block[3] = &unk_1E769BB60;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __65__RCWaveformGenerator__appendPowerMeterValuesFromAudioPCMBuffer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)objc_msgSend(*(id *)(a1 + 40), "floatChannelData");
  v4 = objc_msgSend(*(id *)(a1 + 40), "frameLength");
  objc_msgSend(*(id *)(a1 + 40), "format");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v3, v4, objc_msgSend(v5, "streamDescription"), 0);

}

- (BOOL)_appendPowerMeterValuesFromDataInAudioFile:(id)a3 progressBlock:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  NSObject *queue;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void (**v26)(_QWORD, float);
  NSObject *v27;
  AVAudioFile *activeAudioFile;
  NSObject *v29;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  RCWaveformGenerator *v35;
  id v36;
  uint64_t *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  _QWORD v46[3];
  int v47;
  _QWORD block[5];
  id v49;
  id v50[2];

  v7 = a3;
  v8 = a4;
  if ((_checkCanAppend(self, (objc_selector *)a2) & 1) != 0)
  {
    if (self->_activeAudioFile)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformGenerator.mm");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("<Unknown File>");
      if (v9)
        v11 = (__CFString *)v9;
      v12 = v11;

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 443, CFSTR("already loading"), 0, 0, 0, 0, 0);

    }
    v50[0] = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A98]), "initForReading:commonFormat:interleaved:error:", v7, 1, 0, v50);
    v15 = v50[0];
    v16 = v15;
    v17 = v14 != 0;
    if (v14)
    {
      v31 = v15;
      v32 = v7;
      v18 = MEMORY[0x1E0C809B0];
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__RCWaveformGenerator__appendPowerMeterValuesFromDataInAudioFile_progressBlock___block_invoke;
      block[3] = &unk_1E769BB60;
      block[4] = self;
      v20 = v14;
      v49 = v20;
      dispatch_sync(queue, block);
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x2020000000;
      v47 = 0;
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2020000000;
      v45[3] = 0;
      v21 = objc_msgSend(v20, "length");
      objc_msgSend(v20, "processingFormat");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(unsigned int *)(objc_msgSend(v22, "streamDescription") + 24);

      v42 = 0;
      v43[0] = &v42;
      v43[1] = 0x3032000000;
      v43[2] = __Block_byref_object_copy_;
      v43[3] = __Block_byref_object_dispose_;
      v44 = 0;
      v24 = self->_queue;
      v33[0] = v18;
      v33[1] = 3221225472;
      v33[2] = __80__RCWaveformGenerator__appendPowerMeterValuesFromDataInAudioFile_progressBlock___block_invoke_2;
      v33[3] = &unk_1E769BD38;
      v25 = v20;
      v34 = v25;
      v35 = self;
      v37 = &v42;
      v38 = v45;
      v40 = v23;
      v26 = (void (**)(_QWORD, float))v8;
      v41 = v21;
      v36 = v26;
      v39 = v46;
      dispatch_sync(v24, v33);
      if (*(_QWORD *)(v43[0] + 40))
      {
        OSLogForCategory(CFSTR("Default"));
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:].cold.1((uint64_t)v25, (uint64_t)v43, v27);

        -[RCWaveformGenerator terminateLoadingImmediately](self, "terminateLoadingImmediately");
      }
      activeAudioFile = self->_activeAudioFile;
      self->_activeAudioFile = 0;

      if (v26)
        v26[2](v26, 1.0);

      _Block_object_dispose(&v42, 8);
      _Block_object_dispose(v45, 8);
      _Block_object_dispose(v46, 8);

      v7 = v32;
      v16 = v31;
    }
    else
    {
      OSLogForCategory(CFSTR("Default"));
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:].cold.2();

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __80__RCWaveformGenerator__appendPowerMeterValuesFromDataInAudioFile_progressBlock___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

void __80__RCWaveformGenerator__appendPowerMeterValuesFromDataInAudioFile_progressBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  unsigned int v9;
  _BYTE *v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v2 = objc_alloc(MEMORY[0x1E0C89AC0]);
  objc_msgSend(*(id *)(a1 + 32), "processingFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithPCMFormat:frameCapacity:", v3, 4096);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v5 = 0;
    while (1)
    {
      v6 = v5;
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 16), 0xFFFFFFFFFFFFFFFFLL);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 16));
      v7 = *(void **)(a1 + 32);
      v21 = v5;
      v8 = objc_msgSend(v7, "readIntoBuffer:error:", v4, &v21);
      v5 = v21;

      if (!v8)
        break;
      v9 = objc_msgSend(v4, "frameLength");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += *(_QWORD *)(a1 + 80) * v9;
      v10 = *(_BYTE **)(a1 + 40);
      if (v10[232])
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v18 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;
        goto LABEL_14;
      }
      if (!v9)
      {
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_flushRemainingData");
        goto LABEL_16;
      }
      v11 = *(_QWORD *)objc_msgSend(v4, "floatChannelData");
      v12 = objc_msgSend(v4, "frameLength");
      objc_msgSend(v4, "format");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v11, v12, objc_msgSend(v13, "streamDescription"), 0);

      if (*(_QWORD *)(a1 + 48))
      {
        v14 = floor((double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)/ (double)*(unint64_t *)(a1 + 88)* 1000.0)/ 1000.0;
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        if (*(float *)(v15 + 24) != v14)
        {
          *(float *)(v15 + 24) = v14;
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }
      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        goto LABEL_16;
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = v5;
    v18 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;
LABEL_14:

    goto LABEL_16;
  }
  v5 = 0;
LABEL_16:

}

- (void)_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4
{
  double var1;
  double var0;
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  double v12;
  double v13;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__RCWaveformGenerator__appendAveragePowerLevelsByDigestingTimeRange_inAudioFile___block_invoke;
  block[3] = &unk_1E769BD60;
  v12 = var0;
  v13 = var1;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_sync(queue, block);

}

uint64_t __81__RCWaveformGenerator__appendAveragePowerLevelsByDigestingTimeRange_inAudioFile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_onQueue_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4
{
  double var1;
  double var0;
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  SEL v13;
  double v14;
  double v15;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__RCWaveformGenerator__onQueue_appendAveragePowerLevelsByDigestingTimeRange_inAudioFile___block_invoke;
  block[3] = &unk_1E769BD88;
  v12 = v8;
  v13 = a2;
  block[4] = self;
  v14 = var0;
  v15 = var1;
  v10 = v8;
  dispatch_sync(queue, block);

}

void __89__RCWaveformGenerator__onQueue_appendAveragePowerLevelsByDigestingTimeRange_inAudioFile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  int v21;
  id v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  if (_checkCanAppend(*(RCWaveformGenerator **)(a1 + 32), *(objc_selector **)(a1 + 48)))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "framePosition");
    if ((v2 & 0x8000000000000000) == 0)
    {
      v3 = v2;
      objc_msgSend(*(id *)(a1 + 40), "processingFormat");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sampleRate");
      v5 = v4;
      v6 = *(double *)(a1 + 56);
      v7 = v6 + -10.0;
      if (v6 + -10.0 < 0.0)
        v7 = 0.0;
      v8 = (uint64_t)(v5 * v7);
      v9 = vcvtd_n_s64_f64(fmod((double)v8 * 0.000244140625, 1.0), 0xCuLL);
      objc_msgSend(*(id *)(a1 + 40), "setFramePosition:", (uint64_t)fmaxf((float)(v8 - v9), 0.0));
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", v27, 4096);
      if (v9 >= 1)
      {
        do
        {
          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));
          if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 232))
            break;
          v11 = *(void **)(a1 + 40);
          if (v9 >= 0x1000)
            v12 = 4096;
          else
            v12 = v9;
          v29 = 0;
          v13 = objc_msgSend(v11, "readIntoBuffer:frameCount:error:", v10, v12, &v29);
          v14 = v29;
          if (!v13 || (v15 = objc_msgSend(v10, "frameLength")) == 0)
          {

            break;
          }
          v16 = *(void **)(a1 + 32);
          v17 = *(_QWORD *)objc_msgSend(v10, "floatChannelData");
          objc_msgSend(v10, "format");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v17, v15, objc_msgSend(v18, "streamDescription"), 1);
          v9 -= v15;

        }
        while (v9 > 0);
      }
      objc_msgSend(*(id *)(a1 + 40), "setFramePosition:", (uint64_t)(v5 * v6));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = 0;
      while (1)
      {
        v19 = *(double *)(*(_QWORD *)(a1 + 32) + 40);
        if (v19 >= RCTimeRangeDeltaWithExactPrecision(*(double *)(a1 + 56), *(double *)(a1 + 64)))
          break;
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 232))
          break;
        v20 = *(void **)(a1 + 40);
        v28 = 0;
        v21 = objc_msgSend(v20, "readIntoBuffer:frameCount:error:", v10, 4096, &v28);
        v22 = v28;
        if (!v21 || (v23 = objc_msgSend(v10, "frameLength")) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_flushRemainingData");

          break;
        }
        v24 = *(void **)(a1 + 32);
        v25 = *(_QWORD *)objc_msgSend(v10, "floatChannelData");
        objc_msgSend(v10, "format");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v25, v23, objc_msgSend(v26, "streamDescription"), 0);

      }
      objc_msgSend(*(id *)(a1 + 40), "setFramePosition:", v3);

    }
  }
}

- (id)synchronouslyApproximateWaveformForAVContentURL:(id)a3 byReadingCurrentFileAheadTimeRange:(id)a4
{
  double var1;
  double var0;
  id v7;
  NSObject *queue;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  BOOL v15;
  RCWaveformGenerator *v16;
  RCWaveformSegmentAccumulator *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  double v24;
  double v25;
  _QWORD block[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__RCWaveformGenerator_synchronouslyApproximateWaveformForAVContentURL_byReadingCurrentFileAheadTimeRange___block_invoke;
  block[3] = &unk_1E769BBB0;
  block[4] = self;
  block[5] = &v27;
  dispatch_sync(queue, block);
  v10 = (void *)v28[5];
  if (v10
    && (objc_msgSend(v10, "url"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v7),
        v11,
        (v12 & 1) != 0)
    && !-[RCWaveformGenerator finished](self, "finished"))
  {
    v15 = -[RCWaveformGenerator paused](self, "paused");
    if (!v15)
      -[RCWaveformGenerator setPaused:](self, "setPaused:", 1);
    v16 = -[RCWaveformGenerator initWithSamplingParametersFromGenerator:]([RCWaveformGenerator alloc], "initWithSamplingParametersFromGenerator:", self);
    v17 = -[RCWaveformSegmentAccumulator initWithWaveformGenerator:]([RCWaveformSegmentAccumulator alloc], "initWithWaveformGenerator:", v16);
    -[RCWaveformGenerator _appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:](v16, "_appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:", v28[5], var0, var1);
    -[RCWaveformSegmentAccumulator waitUntilFinished](v17, "waitUntilFinished");
    v18 = (void *)MEMORY[0x1E0C99DE8];
    -[RCWaveformSegmentAccumulator segments](v17, "segments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[RCWaveformSegmentAccumulator segments](v17, "segments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __106__RCWaveformGenerator_synchronouslyApproximateWaveformForAVContentURL_byReadingCurrentFileAheadTimeRange___block_invoke_2;
    v22[3] = &unk_1E769BDB0;
    v24 = var0;
    v25 = var1;
    v13 = v20;
    v23 = v13;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v22);

    if (!v15)
      -[RCWaveformGenerator setPaused:](self, "setPaused:", 0);

  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __106__RCWaveformGenerator_synchronouslyApproximateWaveformForAVContentURL_byReadingCurrentFileAheadTimeRange___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

void __106__RCWaveformGenerator_synchronouslyApproximateWaveformForAVContentURL_byReadingCurrentFileAheadTimeRange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = (id)objc_msgSend(v3, "copyWithTimeRangeOffsetByTimeOffset:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (BOOL)_appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3
{
  id v5;
  NSObject *queue;
  BOOL v7;
  _QWORD block[4];
  id v10;
  RCWaveformGenerator *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  if ((_checkCanAppend(self, (objc_selector *)a2) & 1) != 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__RCWaveformGenerator__appendAveragePowerLevelsByDigestingWaveformSegments___block_invoke;
    block[3] = &unk_1E769BDD8;
    v10 = v5;
    v11 = self;
    v12 = &v13;
    dispatch_sync(queue, block);
    v7 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __76__RCWaveformGenerator__appendAveragePowerLevelsByDigestingWaveformSegments___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v4)
        objc_enumerationMutation(v2);
      v6 = *(_BYTE **)(a1 + 40);
      if (v6[232])
        break;
      objc_msgSend(v6, "_onQueue_appendSegment:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5++), (_QWORD)v8);
      if (v3 == v5)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

  result = objc_msgSend(*(id *)(a1 + 40), "_onQueue_flushRemainingData");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)_onQueue_flushWaveformSegment:(id)a3
{
  id v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  if ((_checkCanAppend(self, (objc_selector *)a2) & 1) != 0)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      objc_msgSend(v5, "timeRange");
      if (v6 >= self->_totalFlushedTime)
      {
        -[RCWaveformGenerator _onQueue_flushRemainingData](self, "_onQueue_flushRemainingData");
      }
      else
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(v5, "timeRange");
        objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid endTime (segment end time %f is less than total flushed time %f. Will regenerate waveform."), v8, *(_QWORD *)&self->_totalFlushedTime);
      }
      self->_framesConsumedSinceLastFlush = 0;
      objc_msgSend(v5, "timeRange");
      v9 = MEMORY[0x1E0C809B0];
      self->_totalFlushedTime = v10;
      v11[0] = v9;
      v11[1] = 3221225472;
      v11[2] = __53__RCWaveformGenerator__onQueue_flushWaveformSegment___block_invoke;
      v11[3] = &unk_1E769BE00;
      v11[4] = self;
      v12 = v5;
      -[RCWaveformGenerator _onQueue_performObserversBlock:](self, "_onQueue_performObserversBlock:", v11);
      self->_powerLevelBuffer.__end_ = self->_powerLevelBuffer.__begin_;

    }
  }

}

uint64_t __53__RCWaveformGenerator__onQueue_flushWaveformSegment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waveformGenerator:didLoadWaveformSegment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_onQueue_flushWithNextSegmentWithEndTime:(double)a3 isPredigest:(BOOL)a4
{
  __n128 v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  float *begin;
  float *end;
  uint64_t v18;
  float *value;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  float *v26;
  float *v27;
  float *v28;
  uint64_t v29;
  float *v30;
  int v31;
  RCWaveformSegment *v32;
  double v33;
  uint64_t v34;
  RCWaveformSegment *v35;
  _QWORD v36[5];
  RCWaveformSegment *v37;

  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      v7.n128_u64[0] = *(_QWORD *)&self->_totalFlushedTime;
      if (v7.n128_f64[0] > a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformGenerator.mm");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = CFSTR("<Unknown File>");
        if (v8)
          v10 = (__CFString *)v8;
        v11 = v10;

        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 698, CFSTR("Invalid endTime"), 0, 0, 0, 0, 0);

        v7.n128_u64[0] = *(_QWORD *)&self->_totalFlushedTime;
      }
      v13 = RCTimeRangeMake(v7, a3);
      v15 = v14;
      begin = self->_powerLevelBuffer.__begin_;
      end = self->_powerLevelBuffer.__end_;
      v18 = (char *)end - (char *)begin;
      if (end == begin)
      {
        value = self->_powerLevelBuffer.__end_cap_.__value_;
        if (end >= value)
        {
          v21 = v18 >> 2;
          v22 = (char *)value - (char *)begin;
          if (v22 >> 1 <= (unint64_t)((v18 >> 2) + 1))
            v23 = v21 + 1;
          else
            v23 = v22 >> 1;
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL)
            v24 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v24 = v23;
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&self->_powerLevelBuffer.__end_cap_, v24);
          v26 = self->_powerLevelBuffer.__begin_;
          v27 = self->_powerLevelBuffer.__end_;
          v28 = (float *)&v25[4 * v21];
          v30 = (float *)&v25[4 * v29];
          *v28 = self->_powerLevelBufferLastPushedValue;
          v20 = v28 + 1;
          while (v27 != v26)
          {
            v31 = *((_DWORD *)v27-- - 1);
            *((_DWORD *)v28-- - 1) = v31;
          }
          self->_powerLevelBuffer.__begin_ = v28;
          self->_powerLevelBuffer.__end_ = v20;
          self->_powerLevelBuffer.__end_cap_.__value_ = v30;
          if (v26)
            operator delete(v26);
        }
        else
        {
          *end = self->_powerLevelBufferLastPushedValue;
          v20 = end + 1;
        }
        self->_powerLevelBuffer.__end_ = v20;
      }
      v32 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelVector:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelVector:", &self->_powerLevelBuffer, v13, v15);
      -[RCWaveformSegment timeRange](v32, "timeRange");
      self->_totalFlushedTime = v33;
      v34 = MEMORY[0x1E0C809B0];
      self->_powerLevelsConsumedSinceLastFlush = 0;
      self->_framesConsumedSinceLastFlush = 0;
      v36[0] = v34;
      v36[1] = 3221225472;
      v36[2] = __76__RCWaveformGenerator__onQueue_flushWithNextSegmentWithEndTime_isPredigest___block_invoke;
      v36[3] = &unk_1E769BE00;
      v36[4] = self;
      v35 = v32;
      v37 = v35;
      -[RCWaveformGenerator _onQueue_performObserversBlock:](self, "_onQueue_performObserversBlock:", v36);
      self->_powerLevelBuffer.__end_ = self->_powerLevelBuffer.__begin_;

    }
  }
}

uint64_t __76__RCWaveformGenerator__onQueue_flushWithNextSegmentWithEndTime_isPredigest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waveformGenerator:didLoadWaveformSegment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_onQueue_flushRemainingData
{
  double totalFlushedTime;
  double v4;

  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    totalFlushedTime = self->_totalFlushedTime;
    v4 = self->_totalDigestedTime - totalFlushedTime;
    if (v4 > 0.0)
      -[RCWaveformGenerator _onQueue_flushWithNextSegmentWithEndTime:isPredigest:](self, "_onQueue_flushWithNextSegmentWithEndTime:isPredigest:", 0, totalFlushedTime + v4);
  }
}

- (void)_onQueue_digestAveragePowerLevel:(float)a3
{
  float *value;
  float *end;
  float *v7;
  float *begin;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  float *v14;
  float *v15;
  int v16;

  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      value = self->_powerLevelBuffer.__end_cap_.__value_;
      self->_powerLevelBufferLastPushedValue = a3;
      end = self->_powerLevelBuffer.__end_;
      if (end >= value)
      {
        begin = self->_powerLevelBuffer.__begin_;
        v9 = end - begin;
        if ((unint64_t)(v9 + 1) >> 62)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v10 = (char *)value - (char *)begin;
        v11 = ((char *)value - (char *)begin) >> 1;
        if (v11 <= v9 + 1)
          v11 = v9 + 1;
        if (v10 >= 0x7FFFFFFFFFFFFFFCLL)
          v12 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v12 = v11;
        if (v12)
        {
          v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&self->_powerLevelBuffer.__end_cap_, v12);
          begin = self->_powerLevelBuffer.__begin_;
          end = self->_powerLevelBuffer.__end_;
        }
        else
        {
          v13 = 0;
        }
        v14 = (float *)&v13[4 * v9];
        v15 = (float *)&v13[4 * v12];
        *v14 = a3;
        v7 = v14 + 1;
        while (end != begin)
        {
          v16 = *((_DWORD *)end-- - 1);
          *((_DWORD *)v14-- - 1) = v16;
        }
        self->_powerLevelBuffer.__begin_ = v14;
        self->_powerLevelBuffer.__end_ = v7;
        self->_powerLevelBuffer.__end_cap_.__value_ = v15;
        if (begin)
          operator delete(begin);
      }
      else
      {
        *end = a3;
        v7 = end + 1;
      }
      self->_powerLevelBuffer.__end_ = v7;
    }
  }
}

- (void)_onQueue_pushAveragePowerLevel:(float)a3
{
  unint64_t v5;
  double totalFlushedTime;
  double segmentFlushInterval;
  double v8;
  BOOL v9;
  double v10;
  double v11;

  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      v5 = self->_powerLevelsConsumedSinceLastFlush + 1;
      self->_powerLevelsConsumedSinceLastFlush = v5;
      totalFlushedTime = self->_totalFlushedTime;
      segmentFlushInterval = self->_segmentFlushInterval;
      v8 = totalFlushedTime + (double)v5 / (double)self->_overviewUnitsPerSecond;
      self->_totalDigestedTime = v8;
      v9 = v8 - totalFlushedTime < segmentFlushInterval + 4.4408921e-16;
      v10 = -1.0;
      if (v9)
        v11 = -1.0;
      else
        v11 = v8;
      *(float *)&v10 = a3;
      -[RCWaveformGenerator _onQueue_digestAveragePowerLevel:](self, "_onQueue_digestAveragePowerLevel:", v10);
      if (v11 > 0.0)
        -[RCWaveformGenerator _onQueue_flushWithNextSegmentWithEndTime:isPredigest:](self, "_onQueue_flushWithNextSegmentWithEndTime:isPredigest:", 0, v11);
    }
  }
}

- (void)_onQueue_appendSegment:(id)a3
{
  id v5;

  v5 = a3;
  if ((_checkCanAppend(self, (objc_selector *)a2) & 1) != 0)
    -[RCWaveformGenerator _onQueue_flushWaveformSegment:](self, "_onQueue_flushWaveformSegment:", v5);

}

- (void)_onQueue_appendPowerMeterValuesFromRawAudioData:(void *)a3 frameCount:(int64_t)a4 format:(const AudioStreamBasicDescription *)a5 isPredigest:(BOOL)a6
{
  intptr_t v9;
  _BOOL4 v10;
  double mSampleRate;
  double v12;
  uint64_t i;
  int64_t framesNeededForNextDB;
  UInt32 mBitsPerChannel;
  float *v16;
  uint64_t v17;
  char *v18;
  size_t v19;
  uint64_t v20;
  char *v21;
  int v22;
  uint64_t v23;
  UInt32 mChannelsPerFrame;
  unint64_t framesConsumedSinceLastFlush;
  int64_t v26;
  int64_t framesNeededForNextFlush;
  unint64_t v28;
  long double mMaxPeak;
  long double v30;
  NSObject *v31;
  uint64_t v32;
  float *v33;
  int64_t v34;
  _BOOL4 v35;
  float *v36;
  uint64_t v37;

  v35 = a6;
  v36 = (float *)a3;
  v37 = *MEMORY[0x1E0C80C00];
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v9 = dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      v10 = a5->mChannelsPerFrame >= 2 && a5->mBytesPerFrame > a5->mBytesPerPacket;
      mSampleRate = self->_samplePowerMeter.mSampleRate;
      if (!self->_isSampleRateKnown)
      {
        self->_isSampleRateKnown = 1;
        mSampleRate = a5->mSampleRate;
        PowerMeter::SetSampleRate(&self->_samplePowerMeter, a5->mSampleRate);
        v12 = mSampleRate * self->_segmentFlushInterval;
        self->_framesNeededForNextDB = (uint64_t)(mSampleRate / (double)self->_overviewUnitsPerSecond);
        self->_framesNeededForNextFlush = (uint64_t)v12;
      }
      if (a4 >= 1)
      {
        v33 = &v36[a4];
        v34 = 2 * a4;
        for (i = a4; i > 0; i -= v17 >> 32)
        {
          framesNeededForNextDB = i;
          if (self->_overviewUnitsPerSecond)
          {
            if (self->_framesNeededForNextDB >= i)
              framesNeededForNextDB = i;
            else
              framesNeededForNextDB = self->_framesNeededForNextDB;
          }
          if ((int)framesNeededForNextDB >= 1 && self->_canceled)
            break;
          mBitsPerChannel = a5->mBitsPerChannel;
          if (mBitsPerChannel == 16)
          {
            v18 = (char *)v36 + 2 * (a4 - i);
            v17 = framesNeededForNextDB << 32;
            MEMORY[0x1E0C80A78](v9);
            v16 = (float *)((char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
            bzero(v16, v19);
            if (v10 || a5->mChannelsPerFrame < 2)
            {
              if ((int)framesNeededForNextDB >= 1)
              {
                v23 = 0;
                do
                {
                  v16[v23] = (float)*(__int16 *)&v18[2 * v23] / 32767.0;
                  ++v23;
                }
                while (framesNeededForNextDB != v23);
              }
            }
            else if ((int)framesNeededForNextDB >= 1)
            {
              v20 = 0;
              v21 = (char *)v33 - 2 * i;
              do
              {
                v22 = *(__int16 *)&v18[2 * v20];
                if (v22 <= *(__int16 *)&v21[2 * v20])
                  v22 = *(__int16 *)&v21[2 * v20];
                v16[v20++] = (float)v22 / 32767.0;
              }
              while (framesNeededForNextDB != v20);
            }
          }
          else
          {
            if (mBitsPerChannel != 32)
            {
              OSLogForCategory(CFSTR("Default"));
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                -[RCWaveformGenerator _onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:].cold.1(v31);

              return;
            }
            if (!v10 && a5->mChannelsPerFrame >= 2)
              PowerMeter::Process(&self->_samplePowerMeter, &v36[v34 - i], 1, framesNeededForNextDB);
            v16 = &v36[a4 - i];
            v17 = framesNeededForNextDB << 32;
          }
          mChannelsPerFrame = 1;
          PowerMeter::Process(&self->_samplePowerMeter, v16, 1, framesNeededForNextDB);
          framesConsumedSinceLastFlush = self->_framesConsumedSinceLastFlush;
          v26 = self->_framesNeededForNextDB - (v17 >> 32);
          framesNeededForNextFlush = self->_framesNeededForNextFlush - (v17 >> 32);
          self->_framesNeededForNextDB = v26;
          self->_framesNeededForNextFlush = framesNeededForNextFlush;
          v28 = framesConsumedSinceLastFlush + (v17 >> 32);
          self->_framesConsumedSinceLastFlush = v28;
          if (v10)
            mChannelsPerFrame = a5->mChannelsPerFrame;
          self->_totalDigestedTime = self->_totalFlushedTime + (double)v28 / mSampleRate / (double)mChannelsPerFrame;
          if (v26 <= 0)
          {
            mMaxPeak = self->_samplePowerMeter.mMaxPeak;
            if (mMaxPeak <= 0.000001)
              v30 = -120.0;
            else
              v30 = log10(mMaxPeak) * 20.0;
            if (!v35)
            {
              *(float *)&v30 = v30;
              -[RCWaveformGenerator _onQueue_digestAveragePowerLevel:](self, "_onQueue_digestAveragePowerLevel:", (double)v30);
            }
            PowerMeter::Reset(&self->_samplePowerMeter);
            self->_framesNeededForNextDB = (uint64_t)(mSampleRate / (double)self->_overviewUnitsPerSecond);
            framesNeededForNextFlush = self->_framesNeededForNextFlush;
          }
          if (framesNeededForNextFlush <= 0)
          {
            v9 = -[RCWaveformGenerator _onQueue_flushWithNextSegmentWithEndTime:isPredigest:](self, "_onQueue_flushWithNextSegmentWithEndTime:isPredigest:", v35, self->_totalDigestedTime);
            self->_framesNeededForNextFlush = (uint64_t)(mSampleRate * self->_segmentFlushInterval);
          }
        }
      }
    }
  }
}

- (double)segmentFlushInterval
{
  return self->_segmentFlushInterval;
}

- (int64_t)overviewUnitsPerSecond
{
  return self->_overviewUnitsPerSecond;
}

- (void)setOverviewUnitsPerSecond:(int64_t)a3
{
  self->_overviewUnitsPerSecond = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  float *begin;

  objc_storeStrong((id *)&self->_loadingError, 0);
  begin = self->_powerLevelBuffer.__begin_;
  if (begin)
  {
    self->_powerLevelBuffer.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_activeAudioFile, 0);
  objc_storeStrong((id *)&self->_internalFinishedLoadingBlocks, 0);
  objc_storeStrong((id *)&self->_internalFinishedLoadingBlockUUIDs, 0);
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_digestPausedSemaphore, 0);
}

- (id).cxx_construct
{
  PowerMeter::PowerMeter(&self->_samplePowerMeter);
  self->_powerLevelBuffer.__begin_ = 0;
  self->_powerLevelBuffer.__end_ = 0;
  self->_powerLevelBuffer.__end_cap_.__value_ = 0;
  return self;
}

- (void)appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:(NSObject *)a3 progressBlock:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315394;
  *(_QWORD *)(a2 + 4) = "-[RCWaveformGenerator appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:progressBlock:]";
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_2(&dword_1BD830000, a3, (uint64_t)a3, "%s -- loading waveform data from audioFile %@", (uint8_t *)a2);

}

- (void)appendAveragePowerLevelsByDigestingWaveform:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- loading waveform data from %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

- (void)_appendPowerMeterValuesFromSampleBuffer:(int)a1 .cold.1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[RCWaveformGenerator _appendPowerMeterValuesFromSampleBuffer:]";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1BD830000, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR:  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer failed:  rv = %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)_appendPowerMeterValuesFromDataInAudioFile:(os_log_t)log progressBlock:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 136315650;
  v5 = "-[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:]";
  v6 = 2112;
  v7 = a1;
  v8 = 2112;
  v9 = v3;
  _os_log_debug_impl(&dword_1BD830000, log, OS_LOG_TYPE_DEBUG, "%s -- ERROR: encountered error while attempting to read from audio file %@, error = %@ canceling further operations..", (uint8_t *)&v4, 0x20u);
}

- (void)_appendPowerMeterValuesFromDataInAudioFile:progressBlock:.cold.2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BD830000, v0, OS_LOG_TYPE_ERROR, "%s -- audioError = %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)_onQueue_appendPowerMeterValuesFromRawAudioData:(os_log_t)log frameCount:format:isPredigest:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[RCWaveformGenerator _onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:]";
  _os_log_error_impl(&dword_1BD830000, log, OS_LOG_TYPE_ERROR, "%s -- ERROR: unable to process samples", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end

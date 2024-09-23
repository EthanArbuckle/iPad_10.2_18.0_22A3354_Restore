@implementation RCCompositionWaveformDataSource

- (RCCompositionWaveformDataSource)initWithComposition:(id)a3
{
  id v5;
  RCWaveformGenerator *v6;
  void *v7;
  RCCompositionWaveformDataSource *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  dispatch_group_t v11;
  OS_dispatch_group *loadingGroup;
  objc_super v14;

  v5 = a3;
  v6 = -[RCWaveformGenerator initWithSegmentFlushInterval:]([RCWaveformGenerator alloc], "initWithSegmentFlushInterval:", 30.0);
  objc_msgSend(v5, "composedWaveformURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)RCCompositionWaveformDataSource;
  v8 = -[RCWaveformDataSource initWithWaveformGenerator:generatedWaveformOutputURL:](&v14, sel_initWithWaveformGenerator_generatedWaveformOutputURL_, v6, v7);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_composition, a3);
    v9 = dispatch_queue_create("RCCompositionWaveformDataSourceQueue", 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_group_create();
    loadingGroup = v8->_loadingGroup;
    v8->_loadingGroup = (OS_dispatch_group *)v11;

  }
  return v8;
}

- (void)cancelLoading
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCCompositionWaveformDataSource;
  -[RCWaveformDataSource cancelLoading](&v4, sel_cancelLoading);
  -[RCCompositionWaveformDataSource activeFragmentDataSource](self, "activeFragmentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelLoading");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[RCCompositionWaveformDataSource activeFragmentDataSource](self, "activeFragmentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waveformGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanceled:", 1);

  -[RCCompositionWaveformDataSource setActiveFragmentDataSource:](self, "setActiveFragmentDataSource:", 0);
  v5.receiver = self;
  v5.super_class = (Class)RCCompositionWaveformDataSource;
  -[RCWaveformDataSource dealloc](&v5, sel_dealloc);
}

- (void)startLoading
{
  RCCompositionWaveformDataSource *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *serialQueue;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  _QWORD *v20;
  SEL v21;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[5];
  RCCompositionWaveformDataSource *v30;

  dispatch_group_enter((dispatch_group_t)self->_loadingGroup);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__12;
  v29[4] = __Block_byref_object_dispose__12;
  v4 = self;
  v30 = v4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__12;
  v27 = __Block_byref_object_dispose__12;
  v28 = 0;
  -[RCComposition composedFragments](v4->_composition, "composedFragments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || v4->_preferLoadingFragmentWaveforms)
  {
    v4->_progressWeightPerFragment = 1.0 / (float)(unint64_t)objc_msgSend(v5, "count");
    -[RCCompositionWaveformDataSource activeFragmentDataSource](v4, "activeFragmentDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "waveformGenerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCanceled:", 1);

    serialQueue = v4->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__RCCompositionWaveformDataSource_startLoading__block_invoke_3;
    block[3] = &unk_1E769D760;
    v20 = v29;
    v21 = a2;
    block[4] = v4;
    v19 = v5;
    dispatch_async(serialQueue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCComposition composedAVURL](v4->_composition, "composedAVURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v11, 0);

    if (v12)
    {
      v4->_progressWeightPerFragment = 1.0;
      -[RCCompositionWaveformDataSource activeFragmentDataSource](v4, "activeFragmentDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cancelLoading");

      -[RCComposition composedAVURL](v4->_composition, "composedAVURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCCompositionWaveformDataSource _dataSourceForAVContentURL:isDecomposedFragment:sourceTimeRange:destinationTime:](v4, "_dataSourceForAVContentURL:isDecomposedFragment:sourceTimeRange:destinationTime:", v14, 0, -1.79769313e308, 1.79769313e308, 0.0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v24[5];
      v24[5] = v15;

      -[RCCompositionWaveformDataSource setActiveFragmentDataSource:](v4, "setActiveFragmentDataSource:", v24[5]);
      v17 = v4->_serialQueue;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __47__RCCompositionWaveformDataSource_startLoading__block_invoke;
      v22[3] = &unk_1E769D738;
      v22[6] = v29;
      v22[4] = v4;
      v22[5] = &v23;
      dispatch_async(v17, v22);
    }
    else
    {
      dispatch_group_leave((dispatch_group_t)self->_loadingGroup);
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v29, 8);

}

void __47__RCCompositionWaveformDataSource_startLoading__block_invoke(uint64_t a1)
{
  uint64_t (**v2)(void);
  void *v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__RCCompositionWaveformDataSource_startLoading__block_invoke_2;
  v5[3] = &unk_1E769D710;
  v6 = *(_OWORD *)(a1 + 40);
  v2 = (uint64_t (**)(void))MEMORY[0x1C3B76918](v5);
  if ((v2[2]() & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_synchronouslyAppendSegmentsFromDataSource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "activeFragmentDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

    if (v3 == v4)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setActiveFragmentDataSource:", 0);
  }
  if ((((uint64_t (*)(uint64_t (**)(void)))v2[2])(v2) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "finishLoadingWithCompletionTimeout:completionBlock:", -1, 0);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));

}

uint64_t __47__RCCompositionWaveformDataSource_startLoading__block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "canceled") & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "canceled") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finished");
  }
}

void __47__RCCompositionWaveformDataSource_startLoading__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "accumulatorWaveform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "segmentCount");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("RCCompositionWaveformDataSource.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("weakSelf.accumulatorWaveform.segmentCount == 0"));

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "activeFragmentDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "canceled") & 1) != 0)
        {

LABEL_18:
          goto LABEL_19;
        }
        v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "canceled");

        if ((v11 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "contentDuration");
        if (v12 > 0.0)
        {
          v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(v9, "AVOutputURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "timeRangeInContentToUse");
          v16 = v15;
          v18 = v17;
          objc_msgSend(v9, "timeRangeInComposition");
          objc_msgSend(v13, "_dataSourceForAVContentURL:isDecomposedFragment:sourceTimeRange:destinationTime:", v14, 1, v16, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setActiveFragmentDataSource:", v20);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_synchronouslyAppendSegmentsFromDataSource:", v20);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "activeFragmentDataSource");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 == v20)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setActiveFragmentDataSource:", 0);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "finishLoadingWithCompletionTimeout:completionBlock:", -1, 0);
LABEL_19:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)waitUntilSegmentsFinishLoadingWithTimeout:(unint64_t)a3
{
  dispatch_group_wait((dispatch_group_t)self->_loadingGroup, a3);
}

- (float)loadingProgress
{
  _RCTimeRangeFileInputWaveformDataSource *activeFragmentDataSource;
  float v4;

  activeFragmentDataSource = self->_activeFragmentDataSource;
  if (activeFragmentDataSource)
    -[RCFileInputWaveformDataSource loadingProgress](activeFragmentDataSource, "loadingProgress");
  else
    v4 = 0.0;
  return v4 + self->_progressOfFinishedFragments;
}

- (id)_dataSourceForAVContentURL:(id)a3 isDecomposedFragment:(BOOL)a4 sourceTimeRange:(id)a5 destinationTime:(double)a6
{
  double var1;
  double var0;
  _BOOL8 v9;
  id v11;
  __n128 v12;
  double v13;
  _RCTimeRangeFileInputWaveformDataSource *v14;

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a4;
  v11 = a3;
  if (RCTimeRangeEqualToTimeRange(-1.79769313e308, 1.79769313e308, var0, var1))
  {
    v12.n128_u64[0] = 0;
    var0 = RCTimeRangeMake(v12, 1.79769313e308);
    var1 = v13;
  }
  v14 = -[RCFileInputWaveformDataSource initWithAVFileURL:]([_RCTimeRangeFileInputWaveformDataSource alloc], "initWithAVFileURL:", v11);

  -[RCFileInputWaveformDataSource setSourceTimeRange:](v14, "setSourceTimeRange:", var0, var1);
  -[RCFileInputWaveformDataSource setDestinationBeginTime:](v14, "setDestinationBeginTime:", a6);
  -[_RCTimeRangeFileInputWaveformDataSource setIsDecomposedFragment:](v14, "setIsDecomposedFragment:", v9);
  -[RCWaveformDataSource addObserver:](v14, "addObserver:", self);
  return v14;
}

- (BOOL)_synchronouslyAppendSegmentsFromDataSource:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  objc_msgSend(v4, "beginLoading");
  v5 = objc_msgSend(v4, "waitUntilFinished");

  if (v5)
    self->_progressOfFinishedFragments = self->_progressWeightPerFragment + self->_progressOfFinishedFragments;
  return v5;
}

- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3
{
  double var1;
  double var0;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  var1 = a3.var1;
  var0 = a3.var0;
  -[RCCompositionWaveformDataSource activeFragmentDataSource](self, "activeFragmentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "waveformGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCComposition composedAVURL](self->_composition, "composedAVURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronouslyApproximateWaveformForAVContentURL:byReadingCurrentFileAheadTimeRange:", v8, var0, var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)duration
{
  double result;

  -[RCComposition composedDuration](self->_composition, "composedDuration");
  return result;
}

- (id)saveableWaveform
{
  objc_super v4;

  if (!self->_saveGeneratedWaveform && (RCIsVoiceMemosApplication() & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)RCCompositionWaveformDataSource;
  -[RCWaveformDataSource saveableWaveform](&v4, sel_saveableWaveform);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (self->_highlightLastDecomposedFragment
    && (-[RCComposition decomposedFragments](self->_composition, "decomposedFragments"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "lastObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    objc_msgSend(v4, "timeRangeInComposition");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)RCCompositionWaveformDataSource;
    -[RCWaveformDataSource timeRangeToHighlight](&v11, sel_timeRangeToHighlight);
  }
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (BOOL)shouldMergeLiveWaveform
{
  return 0;
}

- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[RCWaveformDataSource canceled](self, "canceled"))
  {
    objc_msgSend(v6, "waveformGenerator");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "terminateLoadingImmediately");
  }
  else
  {
    v8 = v6;
    objc_msgSend(v8, "sourceTimeRange");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v7, "timeRange");
    if (RCTimeRangeIntersectsRange(v10, v12, v13, v14))
    {
      objc_msgSend(v7, "segmentByClippingToTimeRange:", v10, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v8, "destinationBeginTime");
        v17 = (void *)objc_msgSend(v15, "copyWithTimeRangeOffsetByTimeOffset:", v16 - v10);
        -[RCWaveformDataSource waveformGenerator](self, "waveformGenerator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendAveragePowerLevelsByDigestingWaveformSegments:", v19);

      }
    }
  }

}

- (RCComposition)composition
{
  return self->_composition;
}

- (BOOL)preferLoadingFragmentWaveforms
{
  return self->_preferLoadingFragmentWaveforms;
}

- (BOOL)saveGeneratedWaveform
{
  return self->_saveGeneratedWaveform;
}

- (void)setSaveGeneratedWaveform:(BOOL)a3
{
  self->_saveGeneratedWaveform = a3;
}

- (BOOL)highlightLastDecomposedFragment
{
  return self->_highlightLastDecomposedFragment;
}

- (void)setHighlightLastDecomposedFragment:(BOOL)a3
{
  self->_highlightLastDecomposedFragment = a3;
}

- (_RCTimeRangeFileInputWaveformDataSource)activeFragmentDataSource
{
  return (_RCTimeRangeFileInputWaveformDataSource *)objc_getProperty(self, a2, 104, 1);
}

- (void)setActiveFragmentDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_dispatch_group)loadingGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLoadingGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingGroup, 0);
  objc_storeStrong((id *)&self->_activeFragmentDataSource, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end

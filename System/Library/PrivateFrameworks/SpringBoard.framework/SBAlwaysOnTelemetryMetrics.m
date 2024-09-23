@implementation SBAlwaysOnTelemetryMetrics

- (SBAlwaysOnTelemetryMetrics)init
{
  SBAlwaysOnTelemetryMetrics *v2;
  uint64_t v3;
  NSMutableDictionary *stopWatches;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBAlwaysOnTelemetryMetrics;
  v2 = -[SBAlwaysOnTelemetryMetrics init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    stopWatches = v2->_stopWatches;
    v2->_stopWatches = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setBacklightState:(int64_t)a3
{
  void *v5;
  NSMutableDictionary *stateChangeCounts;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  uint64_t v14;

  -[SBAlwaysOnTelemetryMetrics _stopWatchForBacklightState:]((uint64_t)self, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlwaysOnTelemetryMetrics _activateStopWatch:]((uint64_t)self, v5);

  stateChangeCounts = self->_stateChangeCounts;
  if (stateChangeCounts)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](stateChangeCounts, "objectForKeyedSubscript:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue") + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_stateChangeCounts;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

    v12 = (NSMutableDictionary *)v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = self->_stateChangeCounts;
    self->_stateChangeCounts = v13;
  }

}

- (_SBMachContinuousStopwatch)_stopWatchForBacklightState:(uint64_t)a1
{
  void *v4;
  void *v5;
  _SBMachContinuousStopwatch *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (_SBMachContinuousStopwatch *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v6 = objc_alloc_init(_SBMachContinuousStopwatch);
      v7 = *(void **)(a1 + 8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_activateStopWatch:(uint64_t)a1
{
  _BYTE *v4;
  id *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;

  v4 = a2;
  if (a1)
  {
    v7 = *(_BYTE **)(a1 + 24);
    v5 = (id *)(a1 + 24);
    v6 = v7;
    if (v7 != v4)
    {
      v10 = v4;
      if (v6)
      {
        v8 = mach_continuous_time();
        v6[8] = 0;
        *((_QWORD *)v6 + 3) += v8 - *((_QWORD *)v6 + 2);
      }
      objc_storeStrong(v5, a2);
      v9 = *v5;
      v4 = v10;
      if (v9)
      {
        v9[8] = 1;
        *((_QWORD *)v9 + 2) = mach_continuous_time();
        v4 = v10;
      }
    }
  }

}

- (void)accumulateRenderHistogram:(id)a3
{
  unint64_t renderedFrameCount;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSNumber *minimumAPL;
  void *v18;
  void *v19;
  NSNumber *v20;
  NSNumber *v21;
  NSNumber *maximumAPL;
  void *v23;
  void *v24;
  NSNumber *v25;
  NSNumber *v26;
  float v27;
  float v28;
  NSNumber *averageAPL;
  double v30;
  double v31;
  void *v32;
  unint64_t v33;
  NSNumber *v34;
  NSNumber *v35;
  NSNumber *minimumAPLDimming;
  void *v37;
  void *v38;
  NSNumber *v39;
  NSNumber *v40;
  NSNumber *maximumAPLDimming;
  void *v42;
  void *v43;
  NSNumber *v44;
  NSNumber *v45;
  float v46;
  float v47;
  NSNumber *averageAPLDimming;
  double v49;
  double v50;
  void *v51;
  unint64_t v52;
  NSNumber *v53;
  NSNumber *v54;
  id v55;

  v55 = a3;
  renderedFrameCount = self->_renderedFrameCount;
  self->_renderedFrameCount = renderedFrameCount + objc_msgSend(v55, "totalCount");
  objc_msgSend(v55, "presentationDuration");
  self->_renderedPartialMinuteCount = (unint64_t)(ceil(v5 / 60.0) + (double)self->_renderedPartialMinuteCount);
  objc_msgSend(v55, "presentationTimeHistogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  switch(v7)
  {
    case 0:
      goto LABEL_11;
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    default:
      if (v7 >= 7)
      {
        v9 = 6;
        do
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          self->_renderedFramesMoreThan6Min += objc_msgSend(v10, "unsignedIntegerValue");

          ++v9;
        }
        while (v8 != v9);
      }
LABEL_5:
      objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_renderedFrames5to6Min += objc_msgSend(v11, "unsignedIntegerValue");

LABEL_6:
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_renderedFrames4to5Min += objc_msgSend(v12, "unsignedIntegerValue");

LABEL_7:
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self->_renderedFrames3to4Min += objc_msgSend(v13, "unsignedIntegerValue");

LABEL_8:
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_renderedFrames2to3Min += objc_msgSend(v14, "unsignedIntegerValue");

LABEL_9:
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_renderedFrames1to2Min += objc_msgSend(v15, "unsignedIntegerValue");

LABEL_10:
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_renderedFramesLessThan1Min += objc_msgSend(v16, "unsignedIntegerValue");

LABEL_11:
      minimumAPL = self->_minimumAPL;
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v55, "lowestAPL");
      objc_msgSend(v18, "numberWithFloat:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSNumberDoubleMin(minimumAPL, v19);
      v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v21 = self->_minimumAPL;
      self->_minimumAPL = v20;

      maximumAPL = self->_maximumAPL;
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v55, "highestAPL");
      objc_msgSend(v23, "numberWithFloat:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSNumberDoubleMax(maximumAPL, v24);
      v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v26 = self->_maximumAPL;
      self->_maximumAPL = v25;

      objc_msgSend(v55, "averageAPL");
      v28 = v27;
      if (self->_averageAPL)
        averageAPL = self->_averageAPL;
      else
        averageAPL = (NSNumber *)&unk_1E91CFA58;
      -[NSNumber doubleValue](averageAPL, "doubleValue");
      v31 = v30;
      if (objc_msgSend(v55, "totalCount"))
      {
        v32 = (void *)MEMORY[0x1E0CB37E8];
        v33 = objc_msgSend(v55, "totalCount");
        objc_msgSend(v32, "numberWithDouble:", (double)v33 / ((double)renderedFrameCount + (double)v33) * v28+ (double)renderedFrameCount / ((double)renderedFrameCount + (double)v33) * v31);
        v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v35 = self->_averageAPL;
        self->_averageAPL = v34;

      }
      minimumAPLDimming = self->_minimumAPLDimming;
      v37 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v55, "lowestAPLDimming");
      objc_msgSend(v37, "numberWithFloat:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      NSNumberDoubleMin(minimumAPLDimming, v38);
      v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v40 = self->_minimumAPLDimming;
      self->_minimumAPLDimming = v39;

      maximumAPLDimming = self->_maximumAPLDimming;
      v42 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v55, "highestAPLDimming");
      objc_msgSend(v42, "numberWithFloat:");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      NSNumberDoubleMax(maximumAPLDimming, v43);
      v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v45 = self->_maximumAPLDimming;
      self->_maximumAPLDimming = v44;

      objc_msgSend(v55, "averageAPLDimming");
      v47 = v46;
      if (self->_averageAPLDimming)
        averageAPLDimming = self->_averageAPLDimming;
      else
        averageAPLDimming = (NSNumber *)&unk_1E91CFA58;
      -[NSNumber doubleValue](averageAPLDimming, "doubleValue");
      v50 = v49;
      if (objc_msgSend(v55, "totalCount"))
      {
        v51 = (void *)MEMORY[0x1E0CB37E8];
        v52 = objc_msgSend(v55, "totalCount");
        objc_msgSend(v51, "numberWithDouble:", (double)v52 / ((double)renderedFrameCount + (double)v52) * v47+ (double)renderedFrameCount / ((double)renderedFrameCount + (double)v52) * v50);
        v53 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v54 = self->_averageAPLDimming;
        self->_averageAPLDimming = v53;

      }
      return;
  }
}

- (void)accumulateInvalidationHistogram:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "totalCount");
  v6 = objc_msgSend(v4, "countLessThan1Min");
  v7 = v5 - (v6 + objc_msgSend(v4, "count1to2Min"));
  v8 = v7 - objc_msgSend(v4, "count2to3Min");
  v9 = v8 - objc_msgSend(v4, "count3to4Min");
  LODWORD(v6) = objc_msgSend(v4, "count4to5Min");

  v10 = self->_invalidatedFramesUpTo3mStale + v7;
  self->_invalidatedFramesUpTo2mStale += v5;
  self->_invalidatedFramesUpTo3mStale = v10;
  v11 = self->_invalidatedFramesUpTo5mStale + v9;
  self->_invalidatedFramesUpTo4mStale += v8;
  self->_invalidatedFramesUpTo5mStale = v11;
  self->_invalidatedFramesUpTo6mStale += v9 - v6;
}

- (void)accumulateDiscardHistogram:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "totalCount");
  v6 = objc_msgSend(v4, "countLessThan1Min");
  v7 = v5 - (v6 + objc_msgSend(v4, "count1to2Min"));
  v8 = v7 - objc_msgSend(v4, "count2to3Min");
  v9 = v8 - objc_msgSend(v4, "count3to4Min");
  LODWORD(v6) = objc_msgSend(v4, "count4to5Min");

  v10 = self->_discardedFramesUpTo3mStale + v7;
  self->_discardedFramesUpTo2mStale += v5;
  self->_discardedFramesUpTo3mStale = v10;
  v11 = self->_discardedFramesUpTo5mStale + v9;
  self->_discardedFramesUpTo4mStale += v8;
  self->_discardedFramesUpTo5mStale = v11;
  self->_discardedFramesUpTo6mStale += v9 - v6;
}

- (void)accumulatePresentationSources:(id)a3
{
  id v4;
  NSMutableSet *presentationSources;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  presentationSources = self->_presentationSources;
  v8 = v4;
  if (!presentationSources)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_presentationSources;
    self->_presentationSources = v6;

    v4 = v8;
    presentationSources = self->_presentationSources;
  }
  -[NSMutableSet unionSet:](presentationSources, "unionSet:", v4);

}

- (id)dataForPowerlogEvent:(id)a3
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t averageAPL;
  NSNumber *minimumAPL;
  uint64_t v11;
  NSNumber *maximumAPL;
  void *v13;
  NSNumber *averageAPLDimming;
  void *v15;
  NSNumber *minimumAPLDimming;
  void *v17;
  NSNumber *maximumAPLDimming;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[31];
  _QWORD v52[33];

  v52[31] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("FlipbookStatistics")))
  {
    v20 = 0;
    return v20;
  }
  v4 = -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 4);
  v5 = v4 + -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 2);
  v6 = v5 + -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 3);
  v51[0] = CFSTR("contentIdentifiers");
  -[NSMutableSet allObjects](self->_presentationSources, "allObjects");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C9AA60];
  v50 = (void *)v7;
  if (v7)
    v8 = v7;
  v52[0] = v8;
  v51[1] = CFSTR("invalidatedFramesUpTo2mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_invalidatedFramesUpTo2mStale);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v49;
  v51[2] = CFSTR("invalidatedFramesUpTo3mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_invalidatedFramesUpTo3mStale);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v48;
  v51[3] = CFSTR("invalidatedFramesUpTo4mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_invalidatedFramesUpTo4mStale);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v47;
  v51[4] = CFSTR("invalidatedFramesUpTo5mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_invalidatedFramesUpTo5mStale);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v46;
  v51[5] = CFSTR("invalidatedFramesUpTo6mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_invalidatedFramesUpTo6mStale);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v45;
  v51[6] = CFSTR("discardedFramesUpTo2mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_discardedFramesUpTo2mStale);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v44;
  v51[7] = CFSTR("discardedFramesUpTo3mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_discardedFramesUpTo3mStale);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v43;
  v51[8] = CFSTR("discardedFramesUpTo4mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_discardedFramesUpTo4mStale);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v42;
  v51[9] = CFSTR("discardedFramesUpTo5mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_discardedFramesUpTo5mStale);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v41;
  v51[10] = CFSTR("discardedFramesUpTo6mStale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_discardedFramesUpTo6mStale);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v40;
  v51[11] = CFSTR("renderedFramesLessThan1Min");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_renderedFramesLessThan1Min);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v39;
  v51[12] = CFSTR("renderedFrames1to2Min");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_renderedFrames1to2Min);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[12] = v38;
  v51[13] = CFSTR("renderedFrames2to3Min");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_renderedFrames2to3Min);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[13] = v37;
  v51[14] = CFSTR("renderedFrames3to4Min");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_renderedFrames3to4Min);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[14] = v36;
  v51[15] = CFSTR("renderedFrames4to5Min");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_renderedFrames4to5Min);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[15] = v35;
  v51[16] = CFSTR("renderedFrames5to6Min");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_renderedFrames5to6Min);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[16] = v34;
  v51[17] = CFSTR("renderedFramesMoreThan6Min");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_renderedFramesMoreThan6Min);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v52[17] = v33;
  v51[18] = CFSTR("renderedFrameCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_renderedFrameCount);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[18] = v32;
  v51[19] = CFSTR("renderedPartialMinuteCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_renderedPartialMinuteCount);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v52[19] = v31;
  v51[20] = CFSTR("millisecondsDisplayOff");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 0) * 1000.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52[20] = v30;
  v51[21] = CFSTR("millisecondsDisplayOn");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 5) * 1000.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[21] = v29;
  v51[22] = CFSTR("millisecondsDisplayDimmed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 6) * 1000.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52[22] = v28;
  v51[23] = CFSTR("millisecondsShowingAOT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * 1000.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v52[23] = v27;
  v51[24] = CFSTR("millisecondsSuppressed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 1) * 1000.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[24] = v26;
  v51[25] = CFSTR("averageAPL");
  averageAPL = (uint64_t)self->_averageAPL;
  v25 = averageAPL;
  if (!averageAPL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    averageAPL = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)averageAPL;
  v52[25] = averageAPL;
  v51[26] = CFSTR("minimumAPL");
  minimumAPL = self->_minimumAPL;
  v11 = (uint64_t)minimumAPL;
  if (!minimumAPL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v22 = v11;
  v52[26] = v11;
  v51[27] = CFSTR("maximumAPL");
  maximumAPL = self->_maximumAPL;
  v13 = maximumAPL;
  if (!maximumAPL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52[27] = v13;
  v51[28] = CFSTR("averageAPLDimming");
  averageAPLDimming = self->_averageAPLDimming;
  v15 = averageAPLDimming;
  if (!averageAPLDimming)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52[28] = v15;
  v51[29] = CFSTR("minimumAPLDimming");
  minimumAPLDimming = self->_minimumAPLDimming;
  v17 = minimumAPLDimming;
  if (!minimumAPLDimming)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52[29] = v17;
  v51[30] = CFSTR("maximumAPLDimming");
  maximumAPLDimming = self->_maximumAPLDimming;
  v19 = maximumAPLDimming;
  if (!maximumAPLDimming)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52[30] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 31, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (maximumAPLDimming)
  {
    if (minimumAPLDimming)
      goto LABEL_18;
  }
  else
  {

    if (minimumAPLDimming)
    {
LABEL_18:
      if (averageAPLDimming)
        goto LABEL_19;
      goto LABEL_28;
    }
  }

  if (averageAPLDimming)
  {
LABEL_19:
    if (maximumAPL)
      goto LABEL_20;
LABEL_29:

    if (minimumAPL)
      goto LABEL_21;
LABEL_30:

    goto LABEL_21;
  }
LABEL_28:

  if (!maximumAPL)
    goto LABEL_29;
LABEL_20:
  if (!minimumAPL)
    goto LABEL_30;
LABEL_21:
  if (!v25)

  return v20;
}

- (double)_timeForBacklightState:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  if (!a1)
    return 0.0;
  v2 = *(void **)(a1 + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_SBMachContinuousStopwatch activeTime]((uint64_t)v4);

  return v5;
}

- (id)dataForAnalyticsEvent:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.springboard.alwayson.flipbookstatistics")))
  {
    -[SBAlwaysOnTelemetryMetrics dataForPowerlogEvent:](self, "dataForPowerlogEvent:", CFSTR("FlipbookStatistics"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageAPLDimming, 0);
  objc_storeStrong((id *)&self->_maximumAPLDimming, 0);
  objc_storeStrong((id *)&self->_minimumAPLDimming, 0);
  objc_storeStrong((id *)&self->_averageAPL, 0);
  objc_storeStrong((id *)&self->_maximumAPL, 0);
  objc_storeStrong((id *)&self->_minimumAPL, 0);
  objc_storeStrong((id *)&self->_presentationSources, 0);
  objc_storeStrong((id *)&self->_activeStopWatch, 0);
  objc_storeStrong((id *)&self->_stateChangeCounts, 0);
  objc_storeStrong((id *)&self->_stopWatches, 0);
}

@end

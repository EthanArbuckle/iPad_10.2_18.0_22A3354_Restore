@implementation _UIMotionEffectEngineLogger

- (_UIMotionEffectEngineLogger)initWithFastUpdateInterval:(double)a3 slowUpdateInterval:(double)a4
{
  _UIMotionEffectEngineLogger *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIMotionEffectEngineLogger;
  result = -[_UIMotionEffectEngineLogger init](&v7, sel_init);
  if (result)
  {
    _MergedGlobals_898 = (uint64_t)(1.0 / a3);
    qword_1ECD75E18 = (uint64_t)(1.0 / a4);
    result->_updateFreqency = (uint64_t)(1.0 / a3);
    result->_lastUpdateTimeStamp = -1.0;
  }
  return result;
}

- (void)recordMotionMagnitude:(double)a3 atTimestamp:(double)a4
{
  double lastUpdateTimeStamp;
  uint64_t updateFreqency;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t sampleCount;

  lastUpdateTimeStamp = self->_lastUpdateTimeStamp;
  if (lastUpdateTimeStamp != a4)
  {
    if (lastUpdateTimeStamp == -1.0)
    {
      updateFreqency = self->_updateFreqency;
    }
    else if (lastUpdateTimeStamp == 0.0)
    {
      updateFreqency = 0;
    }
    else
    {
      v9 = (uint64_t)(1.0 / (a4 - lastUpdateTimeStamp));
      v10 = _MergedGlobals_898;
      if (_MergedGlobals_898 <= v9)
      {
        updateFreqency = _MergedGlobals_898;
      }
      else
      {
        v11 = qword_1ECD75E18;
        if (qword_1ECD75E18 <= v9 || (updateFreqency = 1, v10 = qword_1ECD75E18, v11 = 1, v9 >= 1))
        {
          if (v10 - v9 <= v9 - v11)
            updateFreqency = v10;
          else
            updateFreqency = v11;
        }
      }
    }
    if (updateFreqency != self->_updateFreqency)
    {
      -[_UIMotionEffectEngineLogger _dumpToAggregated](self, "_dumpToAggregated");
      self->_updateFreqency = updateFreqency;
    }
    if (a3 <= 0.01)
    {
      v12 = 0;
    }
    else if (a3 <= 0.015)
    {
      v12 = 1;
    }
    else if (a3 <= 0.02)
    {
      v12 = 2;
    }
    else if (a3 <= 0.025)
    {
      v12 = 3;
    }
    else if (a3 <= 0.03)
    {
      v12 = 4;
    }
    else if (a3 <= 0.04)
    {
      v12 = 5;
    }
    else
    {
      v12 = 6;
      if (a3 > 0.05)
        v12 = 7;
    }
    ++self->_motionLevelSamples[v12];
    self->_lastUpdateTimeStamp = a4;
    sampleCount = self->_sampleCount;
    self->_sampleCount = sampleCount + 1;
    if (sampleCount >= 59)
      -[_UIMotionEffectEngineLogger _dumpToAggregated](self, "_dumpToAggregated");
  }
}

- (void)_dumpToAggregated
{
  void *v3;
  uint64_t i;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  _UIMainBundleIdentifier();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_updateFreqency);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 8; ++i)
  {
    v5 = CFSTR("unknown");
    if ((i & 0xFFFFFFF8) == 0)
      v5 = off_1E16D9448[i];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v3, v5, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.UIKit.motion."), "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    ADClientAddValueForScalarKey();
    self->_motionLevelSamples[i] = 0;

  }
  self->_sampleCount = 0;

}

@end

@implementation _UIDictationAudioLevelSmoother

- (_UIDictationAudioLevelSmoother)initWithMinimumPower:(float)a3 maximumPower:(float)a4 historyLength:(int64_t)a5
{
  _UIDictationAudioLevelSmoother *result;

  result = -[_UIDictationAudioLevelSmoother _initWithHistoryLength:](self, "_initWithHistoryLength:", a5);
  if (result)
  {
    result->_minimumPower = a3;
    result->_maximumPower = a4;
  }
  return result;
}

- (_UIDictationAudioLevelSmoother)initWithMinimumPower:(float)a3 maximumPower:(float)a4 historyLength:(int64_t)a5 attackSpeed:(float)a6 decaySpeed:(float)a7
{
  _UIDictationAudioLevelSmoother *result;

  result = -[_UIDictationAudioLevelSmoother initWithMinimumPower:maximumPower:historyLength:](self, "initWithMinimumPower:maximumPower:historyLength:", a5);
  if (result)
  {
    *(_QWORD *)&result->_attackVelocity = 0;
    result->_previousLevel = 0.0;
    result->_attackSpeed = a6;
    result->_decaySpeed = a7;
    result->_usesAttackAndDecaySpeed = 1;
  }
  return result;
}

- (_UIDictationAudioLevelSmoother)initWithBaseValue:(float)a3 exponentMultiplier:(float)a4 historyLength:(int64_t)a5
{
  _UIDictationAudioLevelSmoother *result;

  result = -[_UIDictationAudioLevelSmoother _initWithHistoryLength:](self, "_initWithHistoryLength:", a5);
  if (result)
  {
    result->_baseValue = a3;
    result->_exponentMultiplier = a4;
    result->_usesExponentialCurve = 1;
  }
  return result;
}

- (id)_initWithHistoryLength:(int64_t)a3
{
  _UIDictationAudioLevelSmoother *v4;
  float *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDictationAudioLevelSmoother;
  v4 = -[_UIDictationAudioLevelSmoother init](&v7, sel_init);
  if (v4)
  {
    v5 = (float *)malloc_type_calloc(4uLL, a3, 0xA1B92A31uLL);
    v4->_samplesSinceLastCleared = 0;
    v4->_runningPowerLevels = v5;
    v4->_powerPointer = 0;
    v4->_historyLength = a3;
  }
  return v4;
}

- (void)clearHistory
{
  bzero(self->_runningPowerLevels, 4 * self->_historyLength);
  self->_powerPointer = 0;
  self->_samplesSinceLastCleared = 0;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_runningPowerLevels);
  v3.receiver = self;
  v3.super_class = (Class)_UIDictationAudioLevelSmoother;
  -[_UIDictationAudioLevelSmoother dealloc](&v3, sel_dealloc);
}

- (float)_updateMedianWithNewValue:(float)a3
{
  float *runningPowerLevels;
  uint64_t powerPointer;
  int64_t v6;
  int64_t historyLength;
  int64_t samplesSinceLastCleared;
  float *v9;
  int64_t v10;
  uint64_t v11;
  float *v12;
  int64_t v13;
  float v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  float v18;

  runningPowerLevels = self->_runningPowerLevels;
  powerPointer = self->_powerPointer;
  v6 = (powerPointer + 1);
  self->_powerPointer = v6;
  runningPowerLevels[powerPointer] = a3;
  historyLength = self->_historyLength;
  if (historyLength <= v6)
    self->_powerPointer = 0;
  samplesSinceLastCleared = self->_samplesSinceLastCleared;
  if (samplesSinceLastCleared < historyLength)
  {
    historyLength = samplesSinceLastCleared + 1;
    self->_samplesSinceLastCleared = samplesSinceLastCleared + 1;
  }
  v9 = (float *)malloc_type_calloc(4uLL, historyLength, 0xFFFDA854uLL);
  v10 = historyLength - 1;
  if (historyLength >= 1)
  {
    v11 = 0;
    v12 = self->_runningPowerLevels;
    do
    {
      v13 = 0;
      v14 = v12[v11];
      while (v14 >= v9[v13])
      {
        if (historyLength == ++v13)
        {
          v9[v10] = v14;
          goto LABEL_15;
        }
      }
      v15 = historyLength;
      if (v10 > v13)
      {
        do
        {
          v9[v15 - 1] = v9[v15 - 2];
          v16 = v15 - 2;
          --v15;
        }
        while (v16 > v13);
        v14 = v12[v11];
      }
      v9[v13] = v14;
LABEL_15:
      ++v11;
    }
    while (v11 != historyLength);
  }
  if (historyLength >= 0)
    v17 = historyLength;
  else
    v17 = historyLength + 1;
  v18 = *(float *)((char *)v9 + ((v17 << 31 >> 30) & 0xFFFFFFFFFFFFFFFCLL));
  free(v9);
  return v18;
}

- (float)smoothedLevelForMicPower:(float)minimumPower
{
  double v4;
  float v5;
  float v6;
  float previousLevel;
  float v8;

  v4 = minimumPower;
  if (minimumPower >= -0.01)
    minimumPower = self->_minimumPower;
  -[_UIDictationAudioLevelSmoother _updateMedianWithNewValue:](self, "_updateMedianWithNewValue:", *(double *)&minimumPower, v4);
  if (self->_usesExponentialCurve)
  {
    v6 = powf(self->_baseValue, v5 * self->_exponentMultiplier);
  }
  else
  {
    v6 = (float)(v5 - self->_minimumPower) / (float)(self->_maximumPower - self->_minimumPower);
    if (self->_usesAttackAndDecaySpeed)
    {
      previousLevel = self->_previousLevel;
      v8 = self->_attackVelocity
         + (float)(self->_attackSpeed * (float)(fmaxf(v6 - previousLevel, 0.0) - self->_attackVelocity));
      v6 = previousLevel + v8;
      self->_previousLevel = self->_decaySpeed * (float)(previousLevel + v8);
      self->_attackVelocity = v8;
    }
  }
  if (v6 > 1.0)
    v6 = 1.0;
  return fmaxf(v6, 0.0);
}

- (BOOL)usesExponentialCurve
{
  return self->_usesExponentialCurve;
}

- (BOOL)usesAttackAndDecaySpeed
{
  return self->_usesAttackAndDecaySpeed;
}

- (float)minimumPower
{
  return self->_minimumPower;
}

- (void)setMinimumPower:(float)a3
{
  self->_minimumPower = a3;
}

- (float)maximumPower
{
  return self->_maximumPower;
}

- (void)setMaximumPower:(float)a3
{
  self->_maximumPower = a3;
}

- (float)attackSpeed
{
  return self->_attackSpeed;
}

- (void)setAttackSpeed:(float)a3
{
  self->_attackSpeed = a3;
}

- (float)decaySpeed
{
  return self->_decaySpeed;
}

- (void)setDecaySpeed:(float)a3
{
  self->_decaySpeed = a3;
}

- (float)baseValue
{
  return self->_baseValue;
}

- (void)setBaseValue:(float)a3
{
  self->_baseValue = a3;
}

- (float)exponentMultiplier
{
  return self->_exponentMultiplier;
}

- (void)setExponentMultiplier:(float)a3
{
  self->_exponentMultiplier = a3;
}

@end

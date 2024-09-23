@implementation PCMultiStageGrowthAlgorithm

- (NSString)description
{
  void *v3;
  void *v4;
  double currentKeepAliveInterval;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PCMultiStageGrowthAlgorithm;
  -[PCMultiStageGrowthAlgorithm description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  currentKeepAliveInterval = self->_currentKeepAliveInterval;
  -[PCMultiStageGrowthAlgorithm _stringForStage:](self, "_stringForStage:", self->_growthStage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{keep alive interval = %g, state = %@, next recalibration date = %@}"), v4, *(_QWORD *)&currentKeepAliveInterval, v6, self->_leaveSteadyStateDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setIsServerOriginatedKeepAlive:(BOOL)a3
{
  self->_isServerOriginatedKeepAlive = a3;
}

- (unint64_t)countOfGrowthActions
{
  return self->_countOfGrowthActions;
}

- (int)previousAction
{
  return self->_previousAction;
}

- (double)currentKeepAliveInterval
{
  return self->_currentKeepAliveInterval;
}

- (void)processNextAction:(int)a3
{
  uint64_t v3;
  NSObject *logObject;
  NSString *algorithmName;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  int v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    algorithmName = self->_algorithmName;
    v7 = logObject;
    -[PCMultiStageGrowthAlgorithm _stringForAction:](self, "_stringForAction:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCMultiStageGrowthAlgorithm _stringForStage:](self, "_stringForStage:", self->_growthStage);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = algorithmName;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1CBC1B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: received action %{public}@ while in stage %{public}@", (uint8_t *)&v13, 0x20u);

  }
  if ((_DWORD)v3)
  {
    -[PCMultiStageGrowthAlgorithm _adjustGrowthAlgorithmMode](self, "_adjustGrowthAlgorithmMode");
    if ((_DWORD)v3 == 3)
    {
      -[PCMultiStageGrowthAlgorithm minimumKeepAliveInterval](self, "minimumKeepAliveInterval");
      -[PCMultiStageGrowthAlgorithm _resetAlgorithmToInterval:](self, "_resetAlgorithmToInterval:");
      return;
    }
  }
  else
  {
    ++self->_countOfGrowthActions;
    -[PCMultiStageGrowthAlgorithm _adjustGrowthAlgorithmMode](self, "_adjustGrowthAlgorithmMode");
  }
  if (self->_growthStage == 4)
  {
LABEL_8:
    -[PCMultiStageGrowthAlgorithm _processMinimumIntervalFallbackStateAction:](self, "_processMinimumIntervalFallbackStateAction:", v3);
LABEL_9:
    self->_lastKeepAliveAlgorithmMode = self->_currentKeepAliveAlgorithmMode;
    -[PCMultiStageGrowthAlgorithm setPreviousAction:](self, "setPreviousAction:", v3);
    return;
  }
  -[PCMultiStageGrowthAlgorithm maximumKeepAliveInterval](self, "maximumKeepAliveInterval");
  v11 = v10;
  -[PCMultiStageGrowthAlgorithm minimumKeepAliveInterval](self, "minimumKeepAliveInterval");
  if (v11 - v12 > *(double *)&PCRefinedGrowthIncrement)
  {
    switch(self->_growthStage)
    {
      case 0:
        -[PCMultiStageGrowthAlgorithm _processInitialGrowthAction:](self, "_processInitialGrowthAction:", v3);
        break;
      case 1:
        -[PCMultiStageGrowthAlgorithm _processRefinedGrowthAction:](self, "_processRefinedGrowthAction:", v3);
        break;
      case 2:
        -[PCMultiStageGrowthAlgorithm _processSteadyStateAction:](self, "_processSteadyStateAction:", v3);
        break;
      case 3:
        -[PCMultiStageGrowthAlgorithm _processBackoffAction:](self, "_processBackoffAction:", v3);
        break;
      case 4:
        goto LABEL_8;
      case 5:
        -[PCMultiStageGrowthAlgorithm _processInitialShrinkAction:](self, "_processInitialShrinkAction:", v3);
        break;
      case 6:
        -[PCMultiStageGrowthAlgorithm _processRefinedShrinkAction:](self, "_processRefinedShrinkAction:", v3);
        break;
      default:
        goto LABEL_9;
    }
    goto LABEL_9;
  }
  self->_growthStage = 2;
}

- (id)_stringForStage:(int)a3
{
  if (a3 > 6)
    return 0;
  else
    return off_1E87432F0[a3];
}

- (void)setPreviousAction:(int)a3
{
  self->_previousAction = a3;
}

- (double)minimumKeepAliveInterval
{
  double result;

  result = self->_serverStatsMinKeepAliveInterval;
  if (result <= 0.0)
    return self->_minimumKeepAliveInterval;
  return result;
}

- (double)maximumKeepAliveInterval
{
  double result;

  result = self->_serverStatsMaxKeepAliveInterval;
  if (result <= 0.0)
    return self->_maximumKeepAliveInterval;
  return result;
}

- (id)_stringForAction:(int)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1E87432D0[a3];
}

- (void)_processInitialGrowthAction:(int)a3
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t currentKeepAliveInterval;
  NSObject *logObject;
  NSString *algorithmName;
  int v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2:
      if (self->_isServerOriginatedKeepAlive)
        -[PCMultiStageGrowthAlgorithm _fallbackToLastSuccessfulKeepAliveInterval](self, "_fallbackToLastSuccessfulKeepAliveInterval");
      break;
    case 1:
      currentKeepAliveInterval = (uint64_t)self->_currentKeepAliveInterval;
      -[PCMultiStageGrowthAlgorithm _fallbackToLastSuccessfulKeepAliveInterval](self, "_fallbackToLastSuccessfulKeepAliveInterval");
      logObject = self->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        algorithmName = self->_algorithmName;
        v13 = 138543362;
        v14 = algorithmName;
        _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: leaving the initial growth stage for refined growth", (uint8_t *)&v13, 0xCu);
      }
      self->_growthStage = 1;
      -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:", self->_currentKeepAliveInterval >= (double)currentKeepAliveInterval);
      break;
    case 0:
      v4 = self->_currentKeepAliveInterval;
      -[PCMultiStageGrowthAlgorithm maximumKeepAliveInterval](self, "maximumKeepAliveInterval");
      if (v4 >= v5)
        self->_growthStage = 2;
      v6 = self->_currentKeepAliveInterval;
      v7 = (uint64_t)(v6 + *(double *)&PCInitialGrowthIncrement);
      if (v6 > self->_highWatermark)
        self->_highWatermark = v6;
      v8 = (double)v7;
      if (self->_initialGrowthStageHighWatermark < (double)v7)
        self->_initialGrowthStageLastAttempt = v8;
      if (self->_currentKeepAliveAlgorithmMode == 1)
      {
        -[PCMultiStageGrowthAlgorithm serverStatsExpectedKeepAliveInterval](self, "serverStatsExpectedKeepAliveInterval");
        if (v9 < v8)
          self->_growthStage = 1;
      }
      -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 1, v8);
      break;
  }
}

- (void)_fallbackToLastSuccessfulKeepAliveInterval
{
  double lastSuccessfulKeepAliveInterval;

  lastSuccessfulKeepAliveInterval = self->_lastSuccessfulKeepAliveInterval;
  if (lastSuccessfulKeepAliveInterval > 2.22044605e-16
    && lastSuccessfulKeepAliveInterval < self->_currentKeepAliveInterval)
  {
    -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 0);
  }
}

- (void)_adjustGrowthAlgorithmMode
{
  int lastKeepAliveAlgorithmMode;
  int v4;
  NSObject *logObject;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  PCMultiStageGrowthAlgorithm *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  lastKeepAliveAlgorithmMode = self->_lastKeepAliveAlgorithmMode;
  if (lastKeepAliveAlgorithmMode == 2)
  {
    if (self->_serverStatsExpectedKeepAliveInterval >= 2.22044605e-16)
    {
      if (self->_usingServerStatsAggressively)
        goto LABEL_15;
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  if (lastKeepAliveAlgorithmMode == 1)
  {
    if (self->_usingServerStatsAggressively)
    {
LABEL_11:
      -[PCMultiStageGrowthAlgorithm _resetAlgorithmToInterval:stage:](self, "_resetAlgorithmToInterval:stage:", 5, self->_serverStatsMaxKeepAliveInterval);
      v4 = 2;
      goto LABEL_14;
    }
    if (self->_serverStatsExpectedKeepAliveInterval >= 2.22044605e-16)
      goto LABEL_15;
LABEL_13:
    v4 = 0;
    goto LABEL_14;
  }
  if (lastKeepAliveAlgorithmMode)
    goto LABEL_15;
  if (self->_usingServerStatsAggressively)
    goto LABEL_11;
  if (self->_serverStatsExpectedKeepAliveInterval <= 2.22044605e-16)
    goto LABEL_15;
  -[PCMultiStageGrowthAlgorithm _resetAlgorithmToInterval:stage:](self, "_resetAlgorithmToInterval:stage:", 2);
LABEL_9:
  v4 = 1;
LABEL_14:
  self->_currentKeepAliveAlgorithmMode = v4;
LABEL_15:
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_lastKeepAliveAlgorithmMode;
    v7 = logObject;
    -[PCMultiStageGrowthAlgorithm _stringForMode:](self, "_stringForMode:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCMultiStageGrowthAlgorithm _stringForMode:](self, "_stringForMode:", self->_currentKeepAliveAlgorithmMode);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1CBC1B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: adjustGrowthAlgorithmMode. {lastMode: %@, currentMode: %@}", (uint8_t *)&v10, 0x20u);

  }
}

- (id)_stringForMode:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1E8743328[a3];
}

- (int)growthStage
{
  return self->_growthStage;
}

- (PCMultiStageGrowthAlgorithm)initWithCacheInfo:(id)a3 loggingIdentifier:(id)a4 algorithmName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  NSObject *v23;
  const __CFString *v24;
  objc_super v26;
  uint8_t buf[4];
  double v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[PCMultiStageGrowthAlgorithm _loadDefaults](PCMultiStageGrowthAlgorithm, "_loadDefaults");
  v26.receiver = self;
  v26.super_class = (Class)PCMultiStageGrowthAlgorithm;
  v11 = -[PCMultiStageGrowthAlgorithm init](&v26, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("multiStateGrowth.%@"), v9);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    +[PCLog logWithCategory:](PCLog, "logWithCategory:", objc_msgSend(v12, "UTF8String"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v11 + 15);
    *((_QWORD *)v11 + 15) = v13;

    v15 = objc_msgSend(v10, "copy");
    v16 = (void *)*((_QWORD *)v11 + 13);
    *((_QWORD *)v11 + 13) = v15;

    v17 = PCDefaultMaximumKeepAliveInterval;
    *((_QWORD *)v11 + 2) = PCDefaultMinimumKeepAliveInterval;
    *((_QWORD *)v11 + 3) = v17;
    *((_DWORD *)v11 + 45) = 0;
    *((_QWORD *)v11 + 18) = 0;
    *((_QWORD *)v11 + 19) = 0;
    *((_QWORD *)v11 + 20) = 0;
    *((_QWORD *)v11 + 21) = 0x40F5180000000000;
    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("keepAliveInterval"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      objc_msgSend(v8, "objectForKey:", CFSTR("inInitialGrowth"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      v23 = *((_QWORD *)v11 + 15);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = CFSTR("NO");
        *(_DWORD *)buf = 134218498;
        v28 = v20;
        v29 = 2114;
        if (v22)
          v24 = CFSTR("YES");
        v30 = v24;
        v31 = 2114;
        v32 = v8;
        _os_log_impl(&dword_1CBC1B000, v23, OS_LOG_TYPE_DEFAULT, "Using cached keep alive interval of %g seconds inInitialGrowth? %{public}@ from [%{public}@]", buf, 0x20u);
      }
      if (v22)
      {
        objc_msgSend(v11, "_resetAlgorithmToInterval:stage:", 0, v20);
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v20 = 0.0;
    }
    objc_msgSend(v11, "_resetAlgorithmToInterval:", v20);
    goto LABEL_11;
  }
LABEL_12:

  return (PCMultiStageGrowthAlgorithm *)v11;
}

- (void)setMaximumKeepAliveInterval:(double)a3
{
  double v5;

  self->_maximumKeepAliveInterval = a3;
  -[PCMultiStageGrowthAlgorithm minimumKeepAliveInterval](self, "minimumKeepAliveInterval");
  if (v5 > a3)
    -[PCMultiStageGrowthAlgorithm setMinimumKeepAliveInterval:](self, "setMinimumKeepAliveInterval:", a3);
  -[PCMultiStageGrowthAlgorithm currentKeepAliveInterval](self, "currentKeepAliveInterval");
  -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 0);
}

- (void)setMinimumKeepAliveInterval:(double)a3
{
  double v5;

  self->_minimumKeepAliveInterval = a3;
  -[PCMultiStageGrowthAlgorithm maximumKeepAliveInterval](self, "maximumKeepAliveInterval");
  if (v5 < a3)
    -[PCMultiStageGrowthAlgorithm setMaximumKeepAliveInterval:](self, "setMaximumKeepAliveInterval:", a3);
  -[PCMultiStageGrowthAlgorithm currentKeepAliveInterval](self, "currentKeepAliveInterval");
  -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 0);
}

- (void)_setCurrentKeepAliveInterval:(double)a3 varianceMode:(unsigned int)a4 allowRoundUp:(BOOL)a5
{
  _BOOL4 v5;
  double v8;
  double v9;
  double v10;
  double v11;
  double duration;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  double start;
  uint32_t v18;
  uint32_t v19;
  NSObject *v20;
  NSString *algorithmName;
  uint64_t growthStage;
  double v23;
  double currentKeepAliveInterval;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  NSObject *logObject;
  double v31;
  double v32;
  int v33;
  PCMultiStageGrowthAlgorithm *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v5 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
    v8 = *(double *)&PCDefaultInitialKeepAliveInterval;
  else
    v8 = a3;
  -[PCMultiStageGrowthAlgorithm minimumKeepAliveInterval](self, "minimumKeepAliveInterval");
  if (v8 < v9)
  {
    -[PCMultiStageGrowthAlgorithm minimumKeepAliveInterval](self, "minimumKeepAliveInterval");
LABEL_8:
    v8 = v10;
    a4 = 0;
    goto LABEL_9;
  }
  -[PCMultiStageGrowthAlgorithm maximumKeepAliveInterval](self, "maximumKeepAliveInterval");
  if (v8 > v11)
  {
    -[PCMultiStageGrowthAlgorithm maximumKeepAliveInterval](self, "maximumKeepAliveInterval");
    goto LABEL_8;
  }
LABEL_9:
  duration = self->_signalAvoidanceRange.duration;
  if (duration == 0.0
    || ((v13 = self->_signalAvoidanceRange.start, v14 = v13 + duration, v13 != 0.0) ? (v15 = v13 < v8) : (v15 = 0),
        v15 ? (v16 = v14 <= v8) : (v16 = 1),
        v16))
  {
    start = v8;
  }
  else
  {
    growthStage = self->_growthStage;
    v23 = 0.5;
    if (growthStage <= 6)
      v23 = dbl_1CBC3A918[growthStage];
    if (v5)
    {
      currentKeepAliveInterval = self->_currentKeepAliveInterval;
      v25 = (v8 - v13) / duration;
      if (v8 <= currentKeepAliveInterval)
      {
        if (v25 <= v23)
        {
          start = self->_signalAvoidanceRange.start;
        }
        else
        {
          if (v14 >= currentKeepAliveInterval)
            v27 = self->_currentKeepAliveInterval;
          else
            v27 = v14;
          if (v14 == currentKeepAliveInterval)
            start = self->_signalAvoidanceRange.start;
          else
            start = v27;
        }
      }
      else
      {
        start = v14;
        if (v25 <= v23)
        {
          v26 = v13 == currentKeepAliveInterval;
          if (v13 < currentKeepAliveInterval)
            v13 = self->_currentKeepAliveInterval;
          if (v26)
            start = v14;
          else
            start = v13;
        }
      }
      -[PCMultiStageGrowthAlgorithm maximumKeepAliveInterval](self, "maximumKeepAliveInterval", v13);
      if (start <= v28)
      {
        -[PCMultiStageGrowthAlgorithm minimumKeepAliveInterval](self, "minimumKeepAliveInterval");
        if (start < v29)
          start = v14;
      }
      else
      {
        start = self->_signalAvoidanceRange.start;
      }
    }
    else
    {
      start = self->_signalAvoidanceRange.start;
    }
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_signalAvoidanceRange.start;
      v32 = self->_signalAvoidanceRange.duration;
      v33 = 138413570;
      v34 = self;
      v35 = 2048;
      v36 = v8;
      v37 = 2048;
      v38 = start;
      v39 = 2048;
      v40 = v31;
      v41 = 2048;
      v42 = v32;
      v43 = 2048;
      v44 = v23;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@: triggered signaling avoidance {interval: %g, adjustedInterval: %g, _signalAvoidanceRange.start: %g, _signalAvoidanceRange.duration: %g, roundUpRatio: %g}", (uint8_t *)&v33, 0x3Eu);
    }
  }
  if (a4 == 2)
  {
    v19 = arc4random();
    start = start
          - -(*(double *)&PCIncrementRandomVariance
            - ((double)v19 / 4294967300.0 + (double)v19 / 4294967300.0) * *(double *)&PCIncrementRandomVariance);
  }
  else if (a4 == 1)
  {
    v18 = arc4random();
    start = start
          - (*(double *)&PCIncrementRandomVariance
           - ((double)v18 / 4294967300.0 + (double)v18 / 4294967300.0) * *(double *)&PCIncrementRandomVariance);
  }
  if (self->_currentKeepAliveInterval != start)
  {
    v20 = self->_logObject;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      algorithmName = self->_algorithmName;
      v33 = 138543618;
      v34 = (PCMultiStageGrowthAlgorithm *)algorithmName;
      v35 = 2048;
      v36 = start;
      _os_log_impl(&dword_1CBC1B000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: setting current interval to %g seconds", (uint8_t *)&v33, 0x16u);
    }
    self->_lastKeepAliveInterval = self->_currentKeepAliveInterval;
    self->_currentKeepAliveInterval = start;
  }
}

- (void)_setCurrentKeepAliveInterval:(double)a3 varianceMode:(unsigned int)a4
{
  -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:allowRoundUp:](self, "_setCurrentKeepAliveInterval:varianceMode:allowRoundUp:", *(_QWORD *)&a4, 1, a3);
}

- (void)setLastSuccessfulKeepAliveInterval:(double)a3
{
  NSObject *logObject;
  NSString *algorithmName;
  int v7;
  NSString *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_lastSuccessfulKeepAliveInterval != a3)
  {
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      algorithmName = self->_algorithmName;
      v7 = 138543618;
      v8 = algorithmName;
      v9 = 2048;
      v10 = a3;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: setting lastSuccessfulKeepAliveInterval to %g seconds", (uint8_t *)&v7, 0x16u);
    }
    self->_lastSuccessfulKeepAliveInterval = a3;
  }
}

- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *logObject;
  const __CFString *v6;
  NSDate *leaveMinimumIntervalFallbackStateDate;
  int v8;
  PCMultiStageGrowthAlgorithm *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_minimumIntervalFallbackEnabled != a3)
  {
    v3 = a3;
    self->_minimumIntervalFallbackEnabled = a3;
    logObject = self->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%@ minimumIntervalFallbackEnabled changed to %@", (uint8_t *)&v8, 0x16u);
    }
    if (!self->_minimumIntervalFallbackEnabled)
    {
      leaveMinimumIntervalFallbackStateDate = self->_leaveMinimumIntervalFallbackStateDate;
      if (leaveMinimumIntervalFallbackStateDate)
      {
        self->_leaveMinimumIntervalFallbackStateDate = 0;

      }
    }
  }
}

- (BOOL)useIntervalIfImprovement:(double)a3
{
  NSObject *logObject;
  double lastKeepAliveInterval;
  double currentKeepAliveInterval;
  double v8;
  double v10;
  int v12;
  PCMultiStageGrowthAlgorithm *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    lastKeepAliveInterval = self->_lastKeepAliveInterval;
    currentKeepAliveInterval = self->_currentKeepAliveInterval;
    v12 = 138544130;
    v13 = self;
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = lastKeepAliveInterval;
    v18 = 2048;
    v19 = currentKeepAliveInterval;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: useIntervalIfImprovement %f   lastKeepAliveInterval: %f  currentKeepAliveInterval: %f", (uint8_t *)&v12, 0x2Au);
  }
  v8 = self->_lastKeepAliveInterval;
  if (v8 >= self->_currentKeepAliveInterval || v8 <= 2.22044605e-16)
    v10 = self->_currentKeepAliveInterval;
  else
    v10 = self->_lastKeepAliveInterval;
  if (v10 < a3)
    -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:allowRoundUp:](self, "_setCurrentKeepAliveInterval:varianceMode:allowRoundUp:", 0, 0, a3);
  return v10 < a3;
}

- (NSDictionary)cacheInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_currentKeepAliveInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_growthStage == 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("keepAliveInterval"), v5, CFSTR("inInitialGrowth"), v6, CFSTR("cacheDate"), 0);

  return (NSDictionary *)v7;
}

- (void)_resetAlgorithmToInterval:(double)a3 stage:(int)a4
{
  uint64_t v4;
  NSObject *logObject;
  NSObject *v8;
  void *v9;
  NSDate *leaveSteadyStateDate;
  NSDate *leaveMinimumIntervalFallbackStateDate;
  int v12;
  PCMultiStageGrowthAlgorithm *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x1E0C80C00];
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = logObject;
    -[PCMultiStageGrowthAlgorithm _stringForStage:](self, "_stringForStage:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = self;
    v14 = 2048;
    v15 = a3;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1CBC1B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: resetAlgorithmToInterval: %g state: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  self->_growthStage = v4;
  self->_highWatermark = 0.0;
  self->_initialGrowthStageHighWatermark = 0.0;
  leaveSteadyStateDate = self->_leaveSteadyStateDate;
  self->_initialGrowthStageLastAttempt = 0.0;
  self->_leaveSteadyStateDate = 0;

  leaveMinimumIntervalFallbackStateDate = self->_leaveMinimumIntervalFallbackStateDate;
  self->_leaveMinimumIntervalFallbackStateDate = 0;

  -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 0, a3);
}

- (void)_resetAlgorithmToInterval:(double)a3
{
  -[PCMultiStageGrowthAlgorithm _resetAlgorithmToInterval:stage:](self, "_resetAlgorithmToInterval:stage:", 2 * (a3 > 2.22044605e-16));
}

- (void)_processBackoffAction:(int)a3
{
  switch(a3)
  {
    case 2:
      if (self->_isServerOriginatedKeepAlive)
        -[PCMultiStageGrowthAlgorithm _fallbackToLastSuccessfulKeepAliveInterval](self, "_fallbackToLastSuccessfulKeepAliveInterval");
      break;
    case 1:
      -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 0, self->_currentKeepAliveInterval * *(double *)&PCBackoffMultiple);
      break;
    case 0:
      self->_growthStage = 0;
      -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:");
      break;
  }
}

- (void)_processSteadyStateAction:(int)a3
{
  uint64_t v3;
  NSDate *v5;
  double v6;
  NSObject *logObject;
  NSString *algorithmName;
  NSDate *v9;
  NSDate *leaveSteadyStateDate;
  double highWatermark;
  NSObject *v12;
  NSString *v13;
  double v14;
  double v15;
  double v16;
  NSDate *v17;
  NSDate *v18;
  NSObject *v19;
  NSString *v20;
  NSDate *v21;
  double v22;
  NSDate *v23;
  NSDate *leaveMinimumIntervalFallbackStateDate;
  int v25;
  NSString *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v3 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      leaveSteadyStateDate = self->_leaveSteadyStateDate;
      self->_leaveSteadyStateDate = 0;

      if (self->_minimumIntervalFallbackEnabled && !self->_leaveMinimumIntervalFallbackStateDate)
      {
        -[PCMultiStageGrowthAlgorithm maximumKeepAliveInterval](self, "maximumKeepAliveInterval");
        self->_previousMaximumKeepAliveInterval = v22;
        -[PCMultiStageGrowthAlgorithm setMaximumKeepAliveInterval:](self, "setMaximumKeepAliveInterval:", self->_minimumKeepAliveInterval);
        v23 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", self->_minimumIntervalFallbackStateTimeout);
        leaveMinimumIntervalFallbackStateDate = self->_leaveMinimumIntervalFallbackStateDate;
        self->_leaveMinimumIntervalFallbackStateDate = v23;

        self->_growthStage = 4;
      }
      else
      {
        self->_growthStage = 3;
        -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:", 1);
      }
      return;
    }
    if (a3)
      return;
  }
  v5 = self->_leaveSteadyStateDate;
  if (v5)
  {
    -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
    if (v6 < 0.0)
    {
      logObject = self->_logObject;
      if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      {
        algorithmName = self->_algorithmName;
        v25 = 138543362;
        v26 = algorithmName;
        _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: leaving the steady state and trying to grow again", (uint8_t *)&v25, 0xCu);
      }
      self->_growthStage = 1;
      v9 = self->_leaveSteadyStateDate;
      self->_leaveSteadyStateDate = 0;

      -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:", v3);
      return;
    }
    if (self->_leaveSteadyStateDate)
      return;
  }
  highWatermark = self->_highWatermark;
  if (highWatermark > 0.0 && self->_currentKeepAliveInterval >= highWatermark - *(double *)&PCHighWatermarkThreshold)
  {
    -[PCMultiStageGrowthAlgorithm _steadyStateTimeout](self, "_steadyStateTimeout");
    v15 = v16;
  }
  else
  {
    v12 = self->_logObject;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_algorithmName;
      v14 = self->_highWatermark;
      v25 = 138543618;
      v26 = v13;
      v27 = 2048;
      v28 = v14;
      _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: using double the current interval for the steady state timer interval since we are significantly below the high watermark of %g seconds", (uint8_t *)&v25, 0x16u);
    }
    v15 = self->_currentKeepAliveInterval + self->_currentKeepAliveInterval;
    self->_highWatermark = 0.0;
  }
  v17 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", v15);
  v18 = self->_leaveSteadyStateDate;
  self->_leaveSteadyStateDate = v17;

  v19 = self->_logObject;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = self->_algorithmName;
    v21 = self->_leaveSteadyStateDate;
    v25 = 138543618;
    v26 = v20;
    v27 = 2114;
    v28 = *(double *)&v21;
    _os_log_impl(&dword_1CBC1B000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: set the steady state expiration date to %{public}@", (uint8_t *)&v25, 0x16u);
  }
}

- (void)_processMinimumIntervalFallbackStateAction:(int)a3
{
  uint64_t v3;
  NSDate *leaveMinimumIntervalFallbackStateDate;
  NSDate *v6;
  double v7;
  NSDate *v8;
  NSDate *v9;
  NSDate *v10;
  NSObject *v11;
  NSDate *v12;
  double previousMaximumKeepAliveInterval;
  double v14;
  NSObject *logObject;
  double v16;
  const char *v17;
  double v18;
  NSDate *v19;
  double v20;
  double v21;
  double v22;
  NSDate *v23;
  NSDate *v24;
  NSObject *v25;
  NSDate *v26;
  _BYTE v27[24];
  NSDate *v28;
  uint64_t v29;

  v3 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  leaveMinimumIntervalFallbackStateDate = self->_leaveMinimumIntervalFallbackStateDate;
  if (!leaveMinimumIntervalFallbackStateDate)
  {
    previousMaximumKeepAliveInterval = self->_previousMaximumKeepAliveInterval;
    -[PCMultiStageGrowthAlgorithm maximumKeepAliveInterval](self, "maximumKeepAliveInterval");
    if (previousMaximumKeepAliveInterval <= v14)
      goto LABEL_17;
    -[PCMultiStageGrowthAlgorithm setMaximumKeepAliveInterval:](self, "setMaximumKeepAliveInterval:", self->_previousMaximumKeepAliveInterval);
    logObject = self->_logObject;
    if (!os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v16 = self->_previousMaximumKeepAliveInterval;
    *(_DWORD *)v27 = 138412546;
    *(_QWORD *)&v27[4] = self;
    *(_WORD *)&v27[12] = 2048;
    *(double *)&v27[14] = v16;
    v17 = "%@ _leaveMinimumIntervalFallbackStateDate is nil. Leave minimumIntervalFallbackState. Changing maximum keep al"
          "ive interval back to %f";
    goto LABEL_9;
  }
  -[NSDate timeIntervalSinceNow](leaveMinimumIntervalFallbackStateDate, "timeIntervalSinceNow");
  v6 = self->_leaveMinimumIntervalFallbackStateDate;
  if (v7 > self->_minimumIntervalFallbackStateTimeout)
  {
    v8 = v6;
    v9 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", self->_minimumIntervalFallbackStateTimeout);
    v10 = self->_leaveMinimumIntervalFallbackStateDate;
    self->_leaveMinimumIntervalFallbackStateDate = v9;

    v11 = self->_logObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_leaveMinimumIntervalFallbackStateDate;
      *(_DWORD *)v27 = 138412802;
      *(_QWORD *)&v27[4] = self;
      *(_WORD *)&v27[12] = 2112;
      *(_QWORD *)&v27[14] = v8;
      *(_WORD *)&v27[22] = 2112;
      v28 = v12;
      _os_log_impl(&dword_1CBC1B000, v11, OS_LOG_TYPE_DEFAULT, "%@ Unexpected _leaveMinimumIntervalFallbackStateDate %@ in MinimumIntervalFallbackState, changing to %@", v27, 0x20u);
    }

    return;
  }
  -[NSDate timeIntervalSinceNow](v6, "timeIntervalSinceNow");
  if (v18 >= 0.0)
    return;
  if ((_DWORD)v3 == 2)
  {
LABEL_14:
    v19 = self->_leaveMinimumIntervalFallbackStateDate;
    self->_leaveMinimumIntervalFallbackStateDate = 0;

    v20 = self->_previousMaximumKeepAliveInterval;
    -[PCMultiStageGrowthAlgorithm maximumKeepAliveInterval](self, "maximumKeepAliveInterval");
    if (v20 <= v21)
      goto LABEL_17;
    -[PCMultiStageGrowthAlgorithm setMaximumKeepAliveInterval:](self, "setMaximumKeepAliveInterval:", self->_previousMaximumKeepAliveInterval);
    logObject = self->_logObject;
    if (!os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v22 = self->_previousMaximumKeepAliveInterval;
    *(_DWORD *)v27 = 138412546;
    *(_QWORD *)&v27[4] = self;
    *(_WORD *)&v27[12] = 2048;
    *(double *)&v27[14] = v22;
    v17 = "%@ Leave minimumIntervalFallbackState. Changing maximum keep alive interval back to %f";
LABEL_9:
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, v17, v27, 0x16u);
LABEL_17:
    self->_growthStage = 1;
    -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:", v3, *(_OWORD *)v27, *(_QWORD *)&v27[16]);
    return;
  }
  if ((_DWORD)v3 != 1)
  {
    if ((_DWORD)v3)
      return;
    goto LABEL_14;
  }
  v23 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", self->_minimumIntervalFallbackStateTimeout);
  v24 = self->_leaveMinimumIntervalFallbackStateDate;
  self->_leaveMinimumIntervalFallbackStateDate = v23;

  v25 = self->_logObject;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = self->_leaveMinimumIntervalFallbackStateDate;
    *(_DWORD *)v27 = 138412546;
    *(_QWORD *)&v27[4] = self;
    *(_WORD *)&v27[12] = 2112;
    *(_QWORD *)&v27[14] = v26;
    _os_log_impl(&dword_1CBC1B000, v25, OS_LOG_TYPE_DEFAULT, "%@ receive shrink right after previous MinimumIntervalFallbackState ends, extend leaveMinimumIntervalFallbackStateDate to %@", v27, 0x16u);
  }
}

- (void)_processRefinedGrowthAction:(int)a3
{
  double currentKeepAliveInterval;
  double v5;
  BOOL v6;
  NSObject *logObject;
  NSString *algorithmName;
  double initialGrowthStageLastAttempt;
  int v11;
  NSString *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2:
      if (self->_isServerOriginatedKeepAlive)
        -[PCMultiStageGrowthAlgorithm _fallbackToLastSuccessfulKeepAliveInterval](self, "_fallbackToLastSuccessfulKeepAliveInterval");
      break;
    case 1:
      -[PCMultiStageGrowthAlgorithm _fallbackToLastSuccessfulKeepAliveInterval](self, "_fallbackToLastSuccessfulKeepAliveInterval");
      self->_growthStage = 2;
      -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:", 0);
      break;
    case 0:
      currentKeepAliveInterval = self->_currentKeepAliveInterval;
      if (self->_currentKeepAliveAlgorithmMode == 1
        || ((v5 = self->_initialGrowthStageLastAttempt, currentKeepAliveInterval >= v5)
          ? (v6 = v5 <= 2.22044605e-16)
          : (v6 = 1),
            v6))
      {
        if (currentKeepAliveInterval > self->_highWatermark)
          self->_highWatermark = currentKeepAliveInterval;
        -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 1, (double)(uint64_t)(currentKeepAliveInterval + *(double *)&PCRefinedGrowthIncrement));
      }
      else
      {
        logObject = self->_logObject;
        if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
        {
          algorithmName = self->_algorithmName;
          initialGrowthStageLastAttempt = self->_initialGrowthStageLastAttempt;
          v11 = 138543618;
          v12 = algorithmName;
          v13 = 2048;
          v14 = initialGrowthStageLastAttempt;
          _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: surpassed where the previous initial growth stopped at %g; reverting to initial growth.",
            (uint8_t *)&v11,
            0x16u);
        }
        self->_growthStage = 0;
        -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:", 0);
      }
      break;
  }
}

- (void)_processInitialShrinkAction:(int)a3
{
  double currentKeepAliveInterval;

  if (a3 == 1)
  {
    if (self->_serverStatsExpectedKeepAliveInterval >= (double)(uint64_t)(self->_currentKeepAliveInterval + -300.0))
      self->_growthStage = 6;
    -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 2);
  }
  else if (!a3)
  {
    self->_growthStage = 2;
    currentKeepAliveInterval = self->_currentKeepAliveInterval;
    if (currentKeepAliveInterval > self->_highWatermark)
      self->_highWatermark = currentKeepAliveInterval;
    -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:", 0);
  }
}

- (void)_processRefinedShrinkAction:(int)a3
{
  double currentKeepAliveInterval;

  if (a3 == 1)
  {
    if (self->_serverStatsExpectedKeepAliveInterval >= (double)(uint64_t)(self->_currentKeepAliveInterval + -120.0))
      self->_growthStage = 6;
    -[PCMultiStageGrowthAlgorithm _setCurrentKeepAliveInterval:varianceMode:](self, "_setCurrentKeepAliveInterval:varianceMode:", 2);
  }
  else if (!a3)
  {
    self->_growthStage = 2;
    currentKeepAliveInterval = self->_currentKeepAliveInterval;
    if (currentKeepAliveInterval > self->_highWatermark)
      self->_highWatermark = currentKeepAliveInterval;
    -[PCMultiStageGrowthAlgorithm processNextAction:](self, "processNextAction:", 0);
  }
}

- (double)_steadyStateTimeout
{
  double v3;
  NSObject *logObject;
  NSString *algorithmName;
  double currentKeepAliveInterval;
  int v8;
  NSString *v9;
  __int16 v10;
  double v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_currentKeepAliveInterval * 24.0 >= 3600.0)
    v3 = self->_currentKeepAliveInterval * 24.0;
  else
    v3 = 3600.0;
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    algorithmName = self->_algorithmName;
    currentKeepAliveInterval = self->_currentKeepAliveInterval;
    v8 = 138543874;
    v9 = algorithmName;
    v10 = 2048;
    v11 = v3;
    v12 = 2048;
    v13 = currentKeepAliveInterval;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@: using a steady state timeout of %g for current interval %g", (uint8_t *)&v8, 0x20u);
  }
  return v3;
}

+ (void)_loadDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PCMultiStageGrowthAlgorithm__loadDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_loadDefaults_pred != -1)
    dispatch_once(&_loadDefaults_pred, block);
}

uint64_t __44__PCMultiStageGrowthAlgorithm__loadDefaults__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadDefaultValue:forKey:", &PCDefaultMinimumKeepAliveInterval, CFSTR("PCDefaultMinimumKeepAliveInterval"));
  objc_msgSend(*(id *)(a1 + 32), "_loadDefaultValue:forKey:", &PCDefaultMaximumKeepAliveInterval, CFSTR("PCDefaultMaximumKeepAliveInterval"));
  objc_msgSend(*(id *)(a1 + 32), "_loadDefaultValue:forKey:", &PCDefaultInitialKeepAliveInterval, CFSTR("PCDefaultInitialKeepAliveInterval"));
  objc_msgSend(*(id *)(a1 + 32), "_loadDefaultValue:forKey:", &PCInitialGrowthIncrement, CFSTR("PCInitialGrowthIncrement"));
  objc_msgSend(*(id *)(a1 + 32), "_loadDefaultValue:forKey:", &PCRefinedGrowthIncrement, CFSTR("PCRefinedGrowthIncrement"));
  objc_msgSend(*(id *)(a1 + 32), "_loadDefaultValue:forKey:", &PCIncrementRandomVariance, CFSTR("PCIncrementRandomVariance"));
  objc_msgSend(*(id *)(a1 + 32), "_loadDefaultValue:forKey:", &PCBackoffMultiple, CFSTR("PCBackoffMultiple"));
  return objc_msgSend(*(id *)(a1 + 32), "_loadDefaultValue:forKey:", &PCHighWatermarkThreshold, CFSTR("PCHighWatermarkThreshold"));
}

+ (void)_loadDefaultValue:(double *)a3 forKey:(__CFString *)a4
{
  void *v6;
  const void *v7;
  double v8;
  double v9;
  NSObject *v10;
  int v11;
  __CFString *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void *)CFPreferencesCopyAppValue(a4, CFSTR("com.apple.persistentconnection"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "doubleValue");
    v9 = v8;
    if (v8 > 2.22044605e-16)
    {
      +[PCLog timer](PCLog, "timer");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = a4;
        v13 = 2048;
        v14 = v9;
        _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %0.2f", (uint8_t *)&v11, 0x16u);
      }

      *a3 = v9;
    }
    CFRelease(v7);
  }
}

- (double)lastSuccessfulKeepAliveInterval
{
  return self->_lastSuccessfulKeepAliveInterval;
}

- (BOOL)isServerOriginatedKeepAlive
{
  return self->_isServerOriginatedKeepAlive;
}

- (BOOL)minimumIntervalFallbackEnabled
{
  return self->_minimumIntervalFallbackEnabled;
}

- (double)serverStatsMinKeepAliveInterval
{
  return self->_serverStatsMinKeepAliveInterval;
}

- (void)setServerStatsMinKeepAliveInterval:(double)a3
{
  self->_serverStatsMinKeepAliveInterval = a3;
}

- (double)serverStatsExpectedKeepAliveInterval
{
  return self->_serverStatsExpectedKeepAliveInterval;
}

- (void)setServerStatsExpectedKeepAliveInterval:(double)a3
{
  self->_serverStatsExpectedKeepAliveInterval = a3;
}

- (double)serverStatsMaxKeepAliveInterval
{
  return self->_serverStatsMaxKeepAliveInterval;
}

- (void)setServerStatsMaxKeepAliveInterval:(double)a3
{
  self->_serverStatsMaxKeepAliveInterval = a3;
}

- (BOOL)usingServerStatsAggressively
{
  return self->_usingServerStatsAggressively;
}

- (void)setUsingServerStatsAggressively:(BOOL)a3
{
  self->_usingServerStatsAggressively = a3;
}

- (double)minimumIntervalFallbackStateTimeout
{
  return self->_minimumIntervalFallbackStateTimeout;
}

- (void)setMinimumIntervalFallbackStateTimeout:(double)a3
{
  self->_minimumIntervalFallbackStateTimeout = a3;
}

- (_PCTimeRange)signalAvoidanceRange
{
  double start;
  double duration;
  _PCTimeRange result;

  start = self->_signalAvoidanceRange.start;
  duration = self->_signalAvoidanceRange.duration;
  result.duration = duration;
  result.start = start;
  return result;
}

- (void)setSignalAvoidanceRange:(_PCTimeRange)a3
{
  self->_signalAvoidanceRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logObject, 0);
  objc_storeStrong((id *)&self->_algorithmName, 0);
  objc_storeStrong((id *)&self->_leaveMinimumIntervalFallbackStateDate, 0);
  objc_storeStrong((id *)&self->_leaveSteadyStateDate, 0);
}

@end

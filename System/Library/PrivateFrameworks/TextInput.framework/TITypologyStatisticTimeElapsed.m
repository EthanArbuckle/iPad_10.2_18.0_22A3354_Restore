@implementation TITypologyStatisticTimeElapsed

- (id)aggregateReport
{
  void *v3;
  double v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypologyStatisticTimeElapsed adjustedElapsedTime](self, "adjustedElapsedTime");
  *(float *)&v4 = v4;
  if (*(float *)&v4 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("typingDuration.distr"));

  }
  return v3;
}

- (double)adjustedElapsedTime
{
  void *v2;
  double v3;
  double v4;

  -[TITypologyStatisticTimeElapsed adjustedTimer](self, "adjustedTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elapsedTime");
  v4 = v3;

  return v4;
}

- (TITypologyTimer)adjustedTimer
{
  return self->_adjustedTimer;
}

- (TITypologyStatisticTimeElapsed)init
{
  TITypologyStatisticTimeElapsed *v2;
  TITypologyTimer *v3;
  TITypologyTimer *timer;
  TITypologyTimer *v5;
  TITypologyTimer *adjustedTimer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TITypologyStatisticTimeElapsed;
  v2 = -[TITypologyStatisticTimeElapsed init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TITypologyTimer);
    timer = v2->_timer;
    v2->_timer = v3;

    v5 = objc_alloc_init(TITypologyTimer);
    adjustedTimer = v2->_adjustedTimer;
    v2->_adjustedTimer = v5;

    -[TITypologyTimer setMaxTimeIntervalBetweenInputs:](v2->_adjustedTimer, "setMaxTimeIntervalBetweenInputs:", 2.0);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustedTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (id)structuredReport
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("Time Elapsed");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[TITypologyStatisticTimeElapsed elapsedTime](self, "elapsedTime");
  *(float *)&v4 = v4;
  objc_msgSend(v3, "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Adjusted Time Elapsed");
  v12[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[TITypologyStatisticTimeElapsed adjustedElapsedTime](self, "adjustedElapsedTime");
  *(float *)&v7 = v7;
  objc_msgSend(v6, "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)elapsedTime
{
  void *v2;
  double v3;
  double v4;

  -[TITypologyStatisticTimeElapsed timer](self, "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elapsedTime");
  v4 = v3;

  return v4;
}

- (void)visitRecordKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v4 = a3;
  -[TITypologyStatisticTimeElapsed timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v5, "addInputEventWithTimestamp:");

  -[TITypologyStatisticTimeElapsed adjustedTimer](self, "adjustedTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v7 = v6;

  objc_msgSend(v8, "addInputEventWithTimestamp:", v7);
}

- (TITypologyTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void)setAdjustedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_adjustedTimer, a3);
}

@end

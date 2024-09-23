@implementation SBPressCollector

- (SBPressCollector)init
{
  char *v2;
  id v3;
  void *v4;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBPressCollector;
  v2 = -[SBPressCollector init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    __asm { FMOV            V0.2D, #2.0 }
    *(_OWORD *)(v2 + 56) = _Q0;
  }
  return (SBPressCollector *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_hardEndTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBPressCollector;
  -[SBPressCollector dealloc](&v3, sel_dealloc);
}

+ (double)currentTimeStamp
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUptime");
  v4 = v3;

  return v4;
}

- (void)registerPressUpWithTimeStamp:(double)a3
{
  -[SBPressCollector _resetTimersIfNecessary](self, "_resetTimersIfNecessary");
  -[SBPressCollector _handlePressUpWithTimeStamp:](self, "_handlePressUpWithTimeStamp:", a3);
}

- (void)registerPressDownWithTimeStamp:(double)a3
{
  -[SBPressCollector _resetTimersIfNecessary](self, "_resetTimersIfNecessary");
  -[SBPressCollector _handlePressDownWithTimeStamp:](self, "_handlePressDownWithTimeStamp:", a3);
}

- (void)endCurrentSequence
{
  double v3;
  SBPressTuple *currentTuple;
  SBPressTuple *v5;

  +[SBPressCollector currentTimeStamp](SBPressCollector, "currentTimeStamp");
  currentTuple = self->_currentTuple;
  if (currentTuple)
  {
    -[SBPressTuple setDurationUp:](currentTuple, "setDurationUp:", v3 - self->_lastHandledUpEvent);
    v5 = self->_currentTuple;
    self->_currentTuple = 0;

  }
  -[SBPressCollector _end](self, "_end");
}

- (void)_handlePressDownWithTimeStamp:(double)a3
{
  double v5;
  double v6;
  SBPressTuple *currentTuple;
  double v8;

  v5 = a3 - self->_lastHandledUpEvent;
  if (!self->_currentTuple)
  {
    if (!-[NSMutableArray count](self->_currentSequence, "count"))
      goto LABEL_8;
    if (!self->_currentTuple)
      goto LABEL_6;
  }
  -[SBPressCollector maxPressUpDuration](self, "maxPressUpDuration");
  if (v5 <= v6)
  {
    -[SBPressTuple setDurationUp:](self->_currentTuple, "setDurationUp:", v5);
    currentTuple = self->_currentTuple;
    self->_currentTuple = 0;

  }
  else
  {
LABEL_6:
    -[SBPressCollector maxPressUpDuration](self, "maxPressUpDuration");
    if (v5 > v8)
      -[SBPressCollector _end](self, "_end");
  }
LABEL_8:
  self->_lastHandledDownEvent = a3;
  -[SBPressCollector maxPressDownDuration](self, "maxPressDownDuration");
  -[SBPressCollector _fireEndTimerWithDelay:isButtonDown:](self, "_fireEndTimerWithDelay:isButtonDown:", 1);
}

- (void)_handlePressUpWithTimeStamp:(double)a3
{
  double v5;
  double v6;
  SBPressTuple *v7;
  SBPressTuple *currentTuple;

  if (!self->_currentTuple)
  {
    v5 = a3 - self->_lastHandledDownEvent;
    -[SBPressCollector maxPressDownDuration](self, "maxPressDownDuration");
    if (v5 <= v6)
    {
      v7 = -[SBPressTuple initWithDurationDown:durationUp:]([SBPressTuple alloc], "initWithDurationDown:durationUp:", v5, 0.0);
      currentTuple = self->_currentTuple;
      self->_currentTuple = v7;

      -[NSMutableArray addObject:](self->_currentSequence, "addObject:", self->_currentTuple);
    }
  }
  self->_lastHandledUpEvent = a3;
  -[SBPressCollector maxPressUpDuration](self, "maxPressUpDuration");
  -[SBPressCollector _fireEndTimerWithDelay:isButtonDown:](self, "_fireEndTimerWithDelay:isButtonDown:", 0);
}

- (void)_resetTimersIfNecessary
{
  BSAbsoluteMachTimer *hardEndTimer;
  BSAbsoluteMachTimer *v4;

  hardEndTimer = self->_hardEndTimer;
  if (hardEndTimer)
  {
    -[BSAbsoluteMachTimer invalidate](hardEndTimer, "invalidate");
    v4 = self->_hardEndTimer;
    self->_hardEndTimer = 0;

  }
}

- (void)_fireEndTimerWithDelay:(double)a3 isButtonDown:(BOOL)a4
{
  BSAbsoluteMachTimer *v6;
  BSAbsoluteMachTimer *hardEndTimer;
  BSAbsoluteMachTimer *v8;
  _QWORD v9[5];

  v6 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBPressCollector.hardEndTimer"));
  hardEndTimer = self->_hardEndTimer;
  self->_hardEndTimer = v6;

  v8 = self->_hardEndTimer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SBPressCollector__fireEndTimerWithDelay_isButtonDown___block_invoke;
  v9[3] = &unk_1E8EA1428;
  v9[4] = self;
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v9, a3, 0.0);
}

uint64_t __56__SBPressCollector__fireEndTimerWithDelay_isButtonDown___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_end");
}

- (void)_end
{
  SBPressTuple *currentTuple;
  void *v4;
  void *v5;

  currentTuple = self->_currentTuple;
  if (currentTuple)
  {
    -[SBPressCollector maxPressUpDuration](self, "maxPressUpDuration");
    -[SBPressTuple setDurationUp:](currentTuple, "setDurationUp:");
  }
  -[SBPressCollector delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_currentSequence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pressCollector:didCollectSequence:", self, v5);

  -[SBPressCollector _reset](self, "_reset");
}

- (void)_reset
{
  SBPressTuple *currentTuple;

  currentTuple = self->_currentTuple;
  self->_currentTuple = 0;

  -[NSMutableArray removeAllObjects](self->_currentSequence, "removeAllObjects");
  -[SBPressCollector _resetTimersIfNecessary](self, "_resetTimersIfNecessary");
}

- (SBPressCollectorDelegate)delegate
{
  return (SBPressCollectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)maxPressDownDuration
{
  return self->_maxPressDownDuration;
}

- (void)setMaxPressDownDuration:(double)a3
{
  self->_maxPressDownDuration = a3;
}

- (double)maxPressUpDuration
{
  return self->_maxPressUpDuration;
}

- (void)setMaxPressUpDuration:(double)a3
{
  self->_maxPressUpDuration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentTuple, 0);
  objc_storeStrong((id *)&self->_currentSequence, 0);
  objc_storeStrong((id *)&self->_hardEndTimer, 0);
}

@end

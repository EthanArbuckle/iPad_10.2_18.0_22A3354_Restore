@implementation SBPressSequenceRecognizer

- (SBPressSequenceRecognizer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPressSequenceRecognizer.m"), 35, CFSTR("Use initWithValidator:"));

  return -[SBPressSequenceRecognizer initWithValidator:numberOfPresses:](self, "initWithValidator:numberOfPresses:", 0, 0);
}

- (SBPressSequenceRecognizer)initWithValidator:(id)a3 numberOfPresses:(unint64_t)a4
{
  id v8;
  SBPressSequenceRecognizer *v9;
  SBPressSequenceRecognizer *v10;
  NSMutableArray *v11;
  NSMutableArray *currentSequence;
  void *v14;
  objc_super v15;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPressSequenceRecognizer.m"), 40, CFSTR("SBPressSequenceRecognizer must be given non nil validator"));

  }
  v15.receiver = self;
  v15.super_class = (Class)SBPressSequenceRecognizer;
  v9 = -[SBPressSequenceRecognizer init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_validator, a3);
    v10->_numberOfPresses = a4;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentSequence = v10->_currentSequence;
    v10->_currentSequence = v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_watchdogTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBPressSequenceRecognizer;
  -[SBPressSequenceRecognizer dealloc](&v3, sel_dealloc);
}

- (void)registerPressDownWithTimestamp:(double)a3
{
  id WeakRetained;

  if (self->_currentPressTuple)
  {
    -[SBPressSequenceRecognizer _handlePressDownWithTimestamp:](self, "_handlePressDownWithTimestamp:", a3);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pressSequenceRecognizer:didBeginPressDownAtIndex:", self, 0);

  }
  self->_lastPressDownEvent = a3;
}

- (void)registerPressUpWithTimestamp:(double)a3
{
  if (!self->_currentPressTuple && (BSFloatIsZero() & 1) == 0)
    -[SBPressSequenceRecognizer _handlePressUpWithTimestamp:](self, "_handlePressUpWithTimestamp:", a3);
  self->_lastPressUpEvent = a3;
}

- (void)resetWithNewValidator:(id)a3 numberOfPresses:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_validator, a3);
  self->_numberOfPresses = a4;
  -[SBPressSequenceRecognizer _resetAndNotify](self, "_resetAndNotify");
}

- (void)_handlePressDownWithTimestamp:(double)a3
{
  double v5;
  SBPressSequenceValidator *validator;
  void *v7;
  id WeakRetained;
  SBPressTuple *currentPressTuple;
  double v10;
  NSObject *v11;

  -[SBPressSequenceRecognizer _resetWatchdogIfNecessary](self, "_resetWatchdogIfNecessary");
  v5 = a3 - self->_lastPressUpEvent;
  validator = self->_validator;
  v7 = (void *)-[NSMutableArray copy](self->_currentSequence, "copy");
  LODWORD(validator) = -[SBPressSequenceValidator pressEventIsValidInSequence:endingDownEvent:duration:](validator, "pressEventIsValidInSequence:endingDownEvent:duration:", v7, 0, v5);

  if ((_DWORD)validator)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pressSequenceRecognizer:didBeginPressDownAtIndex:", self, -[NSMutableArray indexOfObject:](self->_currentSequence, "indexOfObject:", self->_currentPressTuple) + 1);

    -[SBPressTuple setDurationUp:](self->_currentPressTuple, "setDurationUp:", v5);
    currentPressTuple = self->_currentPressTuple;
    self->_currentPressTuple = 0;

    -[SBPressSequenceValidator timeUntilNextPressEventIsInValidInSequence:lastPressEventInSequenceIsDown:](self->_validator, "timeUntilNextPressEventIsInValidInSequence:lastPressEventInSequenceIsDown:", self->_currentSequence, 0);
  }
  else
  {
    SBLogButtonsCombo();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SBPressSequenceRecognizer _handlePressDownWithTimestamp:].cold.1();

    v10 = 0.0;
  }
  -[SBPressSequenceRecognizer _resetAfterDelay:](self, "_resetAfterDelay:", v10);
}

- (void)_handlePressUpWithTimestamp:(double)a3
{
  double v5;
  uint64_t (**v6)(void);
  int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  -[SBPressSequenceRecognizer _resetWatchdogIfNecessary](self, "_resetWatchdogIfNecessary");
  v5 = a3 - self->_lastPressDownEvent;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke;
  v10[3] = &unk_1E8EBB080;
  v10[4] = self;
  *(double *)&v10[5] = v5;
  v6 = (uint64_t (**)(void))MEMORY[0x1D17E5550](v10);
  v7 = v6[2]();
  v8 = -[NSMutableArray count](self->_currentSequence, "count");
  v9 = v8;
  if (!v7)
  {
    -[SBPressSequenceRecognizer _reset](self, "_reset");
    if (v9)
    {
      -[SBPressSequenceRecognizer _resetAndNotify](self, "_resetAndNotify");
      goto LABEL_8;
    }
    if ((((uint64_t (*)(uint64_t (**)(void)))v6[2])(v6) & 1) == 0)
      goto LABEL_8;
LABEL_7:
    -[SBPressSequenceValidator timeUntilNextPressEventIsInValidInSequence:lastPressEventInSequenceIsDown:](self->_validator, "timeUntilNextPressEventIsInValidInSequence:lastPressEventInSequenceIsDown:", self->_currentSequence, 1);
    -[SBPressSequenceRecognizer _resetAfterDelay:](self, "_resetAfterDelay:");
    goto LABEL_8;
  }
  if (v8 != self->_numberOfPresses)
    goto LABEL_7;
  -[SBPressSequenceRecognizer _complete](self, "_complete");
LABEL_8:

}

uint64_t __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  SBPressTuple *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v2 + 56);
  v5 = (void *)objc_msgSend(*(id *)(v2 + 40), "copy");
  v6 = objc_msgSend(v4, "pressEventIsValidInSequence:endingDownEvent:duration:", v5, 1, *(double *)(v3 + 8));

  if ((_DWORD)v6)
  {
    v7 = -[SBPressTuple initWithDurationDown:durationUp:]([SBPressTuple alloc], "initWithDurationDown:durationUp:", *(double *)(a1 + 40), 0.0);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    SBLogButtonsCombo();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke_cold_1(v3, v10);
  }
  else
  {
    SBLogButtonsCombo();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke_cold_2();
  }

  return v6;
}

- (void)_complete
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pressSequenceRecognizerDidCompleteSequence:", self);

  -[SBPressSequenceRecognizer _reset](self, "_reset");
}

- (void)_reset
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "%{public}@ - Reset", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)_resetAndNotify
{
  id WeakRetained;

  -[SBPressSequenceRecognizer _reset](self, "_reset");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pressSequenceRecognizerDidFail:", self);

}

- (void)_resetWatchdogIfNecessary
{
  BSAbsoluteMachTimer *watchdogTimer;
  BSAbsoluteMachTimer *v4;

  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    -[BSAbsoluteMachTimer invalidate](watchdogTimer, "invalidate");
    v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;

  }
}

- (void)_resetAfterDelay:(double)a3
{
  BSAbsoluteMachTimer *v5;
  BSAbsoluteMachTimer *watchdogTimer;
  BSAbsoluteMachTimer *v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (BSFloatLessThanOrEqualToFloat())
  {
    -[SBPressSequenceRecognizer _resetAndNotify](self, "_resetAndNotify");
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBPressSequenceRecognizer.watchdogTimer"));
    watchdogTimer = self->_watchdogTimer;
    self->_watchdogTimer = v5;

    v7 = self->_watchdogTimer;
    -[SBPressSequenceRecognizer _watchdogTimeIntervalFromDelay:](self, "_watchdogTimeIntervalFromDelay:", a3);
    v9 = v8;
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__SBPressSequenceRecognizer__resetAfterDelay___block_invoke;
    v12[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v13, &location);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v7, "scheduleWithFireInterval:leewayInterval:queue:handler:", v10, v12, v9, 0.0);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __46__SBPressSequenceRecognizer__resetAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetAndNotify");

}

- (double)_watchdogTimeIntervalFromDelay:(double)a3
{
  return a3 * 10.0;
}

- (SBPressSequenceRecognizerDelegate)delegate
{
  return (SBPressSequenceRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBPressSequenceValidator)validator
{
  return self->_validator;
}

- (unint64_t)numberOfPresses
{
  return self->_numberOfPresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentSequence, 0);
  objc_storeStrong((id *)&self->_currentPressTuple, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
}

- (void)_handlePressDownWithTimestamp:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "%{public}@ - press down event is not valid.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

void __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;

  v4 = (objc_class *)OUTLINED_FUNCTION_2_20();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(*(_QWORD *)a1 + 40), "count");
  v7 = 138543618;
  v8 = v5;
  v9 = 1024;
  v10 = v6;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ - Added press tuple on press up. Current sequence count: %d.", (uint8_t *)&v7, 0x12u);

}

void __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke_cold_2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_20();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "%{public}@ - press up event is not valid.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end

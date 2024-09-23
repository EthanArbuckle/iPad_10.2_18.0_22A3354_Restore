@implementation SBHIDButtonStateArbiter

- (SBHIDButtonStateArbiter)init
{
  SBHIDButtonStateArbiter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIDButtonStateArbiter;
  result = -[SBHIDButtonStateArbiter init](&v3, sel_init);
  if (result)
    *(int64x2_t *)&result->_repeatedPressCount = vdupq_n_s64(1uLL);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_longPressTimer, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_repeatedPressTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBHIDButtonStateArbiter;
  -[SBHIDButtonStateArbiter dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  BSAbsoluteMachTimer *longPressTimer;
  BSAbsoluteMachTimer *repeatedPressTimer;

  if (self)
  {
    -[BSAbsoluteMachTimer invalidate](self->_longPressTimer, "invalidate");
    longPressTimer = self->_longPressTimer;
    self->_longPressTimer = 0;

    -[BSAbsoluteMachTimer invalidate](self->_repeatedPressTimer, "invalidate");
    repeatedPressTimer = self->_repeatedPressTimer;
    self->_repeatedPressTimer = 0;

  }
  self->_recognizedLongPress = 0;
  self->_downTime = 0;
  self->_previousUpTime = 0;
  self->_longPressTimeoutAtDownEvent = 0.0;
  self->_repeatedPressTimeoutAtUpEvent = 0.0;
  self->_downEventSenderID = 0;
}

- (void)_invalidateLongPressTimer
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "invalidate");
    v2 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

- (void)_invalidateRepeatedPressTimer
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v2 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
}

- (BOOL)isLongPressDisabled
{
  return self->_longPressTimeout <= 0.0;
}

- (void)_startLongPressTimerWithTimeout:(double *)val
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (val)
  {
    if (a2 > 0.0)
    {
      val[6] = a2;
      objc_initWeak(&location, val);
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBHIDButtonStateArbiter.longPressTimer"));
      v5 = (void *)*((_QWORD *)val + 3);
      *((_QWORD *)val + 3) = v4;

      v6 = (void *)*((_QWORD *)val + 3);
      v7 = MEMORY[0x1E0C80D38];
      v8 = MEMORY[0x1E0C80D38];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __59__SBHIDButtonStateArbiter__startLongPressTimerWithTimeout___block_invoke;
      v9[3] = &unk_1E8E9EEC8;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v6, "scheduleWithFireInterval:leewayInterval:queue:handler:", v7, v9, a2, 0.0);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __59__SBHIDButtonStateArbiter__startLongPressTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBHIDButtonStateArbiter _longPressTimeoutDidOccur]((uint64_t)WeakRetained);

}

- (void)_longPressTimeoutDidOccur
{
  id WeakRetained;
  void *v3;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 24))
    {
      *(_BYTE *)(a1 + 16) = 1;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
      objc_msgSend(WeakRetained, "performActionsForButtonLongPress:", a1);

      *(_QWORD *)(a1 + 48) = 0;
      objc_msgSend(*(id *)(a1 + 24), "invalidate");
      v3 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

    }
  }
}

- (BOOL)isRepeatedPressDisabled
{
  return self->_repeatedPressTimeout <= 0.0 || self->_maximumRepeatedPressCount == 1;
}

- (void)_startRepeatedPressTimerWithTimeout:(double *)val
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (val)
  {
    if (a2 > 0.0)
    {
      val[7] = a2;
      objc_initWeak(&location, val);
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBHIDButtonStateArbiter.repeatedPressTimer"));
      v5 = (void *)*((_QWORD *)val + 4);
      *((_QWORD *)val + 4) = v4;

      v6 = (void *)*((_QWORD *)val + 4);
      v7 = MEMORY[0x1E0C80D38];
      v8 = MEMORY[0x1E0C80D38];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63__SBHIDButtonStateArbiter__startRepeatedPressTimerWithTimeout___block_invoke;
      v9[3] = &unk_1E8E9EEC8;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v6, "scheduleWithFireInterval:leewayInterval:queue:handler:", v7, v9, a2, 0.0);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __63__SBHIDButtonStateArbiter__startRepeatedPressTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBHIDButtonStateArbiter _repeatedPressTimeoutDidOccur]((uint64_t)WeakRetained);

}

- (uint64_t)_repeatedPressTimeoutDidOccur
{
  _QWORD *v1;
  id WeakRetained;

  if (result)
  {
    v1 = (_QWORD *)result;
    if (*(_QWORD *)(result + 32))
    {
      WeakRetained = objc_loadWeakRetained((id *)(result + 120));
      objc_msgSend(WeakRetained, "performActionsForButtonUp:", v1);

      v1[14] = 0;
      v1[9] = 1;
      return objc_msgSend(v1, "reset");
    }
  }
  return result;
}

- (BOOL)_canIncrementRepeatedPressCount
{
  unint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 80);
    return !v1 || *(_QWORD *)(result + 72) < v1;
  }
  return result;
}

- (void)processEvent:(__IOHIDEvent *)a3
{
  unint64_t SenderID;
  uint64_t IntegerValue;
  id WeakRetained;
  unint64_t TimeStamp;
  double repeatedPressTimeoutAtUpEvent;
  double v9;
  double v10;
  unint64_t repeatedPressCount;
  BSAbsoluteMachTimer *longPressTimer;
  unint64_t v13;
  double longPressTimeoutAtDownEvent;
  double v15;
  double repeatedPressTimeout;
  unint64_t v17;
  id v18;

  SenderID = IOHIDEventGetSenderID();
  IntegerValue = IOHIDEventGetIntegerValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (IntegerValue)
  {
    v18 = WeakRetained;
    TimeStamp = IOHIDEventGetTimeStamp();
    repeatedPressTimeoutAtUpEvent = self->_repeatedPressTimeoutAtUpEvent;
    if (repeatedPressTimeoutAtUpEvent <= 0.0)
    {
      -[SBHIDButtonStateArbiter reset](self, "reset");
      self->_downEventSenderID = SenderID;
      ++self->_pressSequence;
      self->_downTime = TimeStamp;
    }
    else
    {
      BSMonotonicReferencedTimeFromMachTime();
      if (v9 > repeatedPressTimeoutAtUpEvent)
        -[SBHIDButtonStateArbiter _repeatedPressTimeoutDidOccur]((uint64_t)self);
      -[SBHIDButtonStateArbiter reset](self, "reset");
      self->_downEventSenderID = SenderID;
      ++self->_pressSequence;
      self->_downTime = TimeStamp;
      BSMonotonicReferencedTimeFromMachTime();
      if (v10 < repeatedPressTimeoutAtUpEvent)
      {
        repeatedPressCount = self->_repeatedPressCount;
        if (self->_maximumRepeatedPressCount - 1 >= repeatedPressCount)
        {
          self->_repeatedPressCount = repeatedPressCount + 1;
          -[BSAbsoluteMachTimer invalidate](self->_longPressTimer, "invalidate");
          longPressTimer = self->_longPressTimer;
          self->_longPressTimer = 0;

LABEL_18:
          WeakRetained = v18;
          goto LABEL_19;
        }
      }
    }
    self->_repeatedPressCount = 1;
    -[SBHIDButtonStateArbiter _startLongPressTimerWithTimeout:]((double *)self, self->_longPressTimeout);
    objc_msgSend(v18, "performActionsForButtonDown:", self);
    goto LABEL_18;
  }
  if (self->_downEventSenderID == SenderID)
  {
    v18 = WeakRetained;
    v13 = IOHIDEventGetTimeStamp();
    longPressTimeoutAtDownEvent = self->_longPressTimeoutAtDownEvent;
    if (longPressTimeoutAtDownEvent > 0.0)
    {
      BSMonotonicReferencedTimeFromMachTime();
      if (v15 > longPressTimeoutAtDownEvent)
        -[SBHIDButtonStateArbiter _longPressTimeoutDidOccur]((uint64_t)self);
    }
    repeatedPressTimeout = self->_repeatedPressTimeout;
    if (repeatedPressTimeout <= 0.0
      || self->_recognizedLongPress
      || (v17 = self->_repeatedPressCount, self->_maximumRepeatedPressCount - 1 < v17))
    {
      objc_msgSend(v18, "performActionsForButtonUp:", self);
      self->_repeatedPressInitialDownTime = 0;
      -[SBHIDButtonStateArbiter reset](self, "reset");
    }
    else
    {
      if (v17 == 1)
        self->_repeatedPressInitialDownTime = self->_downTime;
      -[SBHIDButtonStateArbiter reset](self, "reset");
      self->_previousUpTime = v13;
      -[SBHIDButtonStateArbiter _startRepeatedPressTimerWithTimeout:]((double *)self, repeatedPressTimeout);
    }
    goto LABEL_18;
  }
LABEL_19:

}

- (double)longPressTimeout
{
  return self->_longPressTimeout;
}

- (void)setLongPressTimeout:(double)a3
{
  self->_longPressTimeout = a3;
}

- (unint64_t)repeatedPressCount
{
  return self->_repeatedPressCount;
}

- (unint64_t)maximumRepeatedPressCount
{
  return self->_maximumRepeatedPressCount;
}

- (void)setMaximumRepeatedPressCount:(unint64_t)a3
{
  self->_maximumRepeatedPressCount = a3;
}

- (double)repeatedPressTimeout
{
  return self->_repeatedPressTimeout;
}

- (void)setRepeatedPressTimeout:(double)a3
{
  self->_repeatedPressTimeout = a3;
}

- (int64_t)pressSequence
{
  return self->_pressSequence;
}

- (unint64_t)downTime
{
  return self->_downTime;
}

- (unint64_t)repeatedPressInitialDownTime
{
  return self->_repeatedPressInitialDownTime;
}

- (SBHIDButtonStateDelegate)delegate
{
  return (SBHIDButtonStateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_repeatedPressTimer, 0);
  objc_storeStrong((id *)&self->_longPressTimer, 0);
}

@end

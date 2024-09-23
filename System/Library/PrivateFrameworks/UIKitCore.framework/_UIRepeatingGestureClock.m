@implementation _UIRepeatingGestureClock

- (void)dealloc
{
  objc_super v3;

  -[_UIRepeatingGestureClock _cancelTimer](self, "_cancelTimer");
  v3.receiver = self;
  v3.super_class = (Class)_UIRepeatingGestureClock;
  -[_UIRepeatingGestureClock dealloc](&v3, sel_dealloc);
}

- (void)startClock
{
  self->_delayIndex = 0;
  -[_UIRepeatingGestureClock _scheduleTimer](self, "_scheduleTimer");
}

- (void)_cancelTimer
{
  if (self->_timerOn)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__createTick_, 0);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performTick_, 0);
  }
  self->_timerOn = 0;
}

- (void)_scheduleTimer
{
  unint64_t delayIndex;
  double v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[_UIRepeatingGestureClock _cancelTimer](self, "_cancelTimer");
  self->_timerOn = 1;
  delayIndex = self->_delayIndex;
  self->_delayIndex = delayIndex + 1;
  if (delayIndex >= 3)
    delayIndex = 3;
  v4 = kDelayTable[delayIndex];
  v6[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRepeatingGestureClock performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__createTick_, 0, v5, v4);

}

- (void)_createTick:(id)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRepeatingGestureClock performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__performTick_, 0, v4, 0.0);

}

- (void)_performTick:(id)a3
{
  void *v4;
  id v5;

  if (self->_timerOn)
  {
    -[_UIRepeatingGestureClock delegate](self, "delegate", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "repeatingGestureClockDidTick:", self);
      -[_UIRepeatingGestureClock _scheduleTimer](self, "_scheduleTimer");
    }
    else
    {
      -[_UIRepeatingGestureClock _cancelTimer](self, "_cancelTimer");
    }

  }
}

- (_UIRepeatingGestureClockDelegate)delegate
{
  return (_UIRepeatingGestureClockDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

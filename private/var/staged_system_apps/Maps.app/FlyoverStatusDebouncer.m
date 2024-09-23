@implementation FlyoverStatusDebouncer

- (void)setInput:(unint64_t)a3
{
  if (self->_input != a3)
  {
    self->_input = a3;
    if (!self->_timer)
      -[FlyoverStatusDebouncer updateOutput](self, "updateOutput");
  }
}

- (void)setOutput:(unint64_t)a3
{
  double v4;
  NSTimer *v5;
  NSTimer *timer;
  void *v7;
  char v8;
  id v9;

  if (self->_output != a3)
  {
    self->_output = a3;
    -[FlyoverStatusDebouncer minimumDurationForOutput:](self, "minimumDurationForOutput:");
    if (v4 > 0.0)
    {
      v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timerFired:", 0, 0));
      timer = self->_timer;
      self->_timer = v5;

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusDebouncer delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "statusDebouncerOutputDidChange:");

    if ((v8 & 1) != 0)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverStatusDebouncer delegate](self, "delegate"));
      objc_msgSend(v9, "statusDebouncerOutputDidChange:", self);

    }
  }
}

- (void)updateOutput
{
  -[FlyoverStatusDebouncer setOutput:](self, "setOutput:", -[FlyoverStatusDebouncer input](self, "input"));
}

- (void)timerFired:(id)a3
{
  NSTimer *timer;

  timer = self->_timer;
  self->_timer = 0;

  -[FlyoverStatusDebouncer updateOutput](self, "updateOutput");
}

- (double)minimumDurationForOutput:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 - 2 < 3)
    return 2.0;
  return result;
}

- (StatusDebouncerDelegate)delegate
{
  return (StatusDebouncerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)input
{
  return self->_input;
}

- (unint64_t)output
{
  return self->_output;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end

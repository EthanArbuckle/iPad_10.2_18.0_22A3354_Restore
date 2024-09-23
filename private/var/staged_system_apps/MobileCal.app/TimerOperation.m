@implementation TimerOperation

+ (id)operationWithTimeInterval:(double)a3
{
  return -[TimerOperation initWithTimeInterval:]([TimerOperation alloc], "initWithTimeInterval:", a3);
}

- (TimerOperation)initWithTimeInterval:(double)a3
{
  TimerOperation *v4;
  TimerOperation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TimerOperation;
  v4 = -[TimerOperation init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_executing = 0;
    v4->_finished = 0;
    -[TimerOperation setTimeInterval:](v4, "setTimeInterval:", a3);
  }
  return v5;
}

- (TimerOperation)init
{
  return -[TimerOperation initWithTimeInterval:](self, "initWithTimeInterval:", 0.0);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)finish
{
  -[TimerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[TimerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_executing = 0;
  self->_finished = 1;
  -[TimerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[TimerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)start
{
  const __CFString *v3;
  int *v4;

  if (-[TimerOperation isCancelled](self, "isCancelled"))
  {
    v3 = CFSTR("isFinished");
    -[TimerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    v4 = &OBJC_IVAR___TimerOperation__finished;
  }
  else
  {
    v3 = CFSTR("isExecuting");
    -[TimerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    -[TimerOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "main", 0, 0);
    v4 = &OBJC_IVAR___TimerOperation__executing;
  }
  *((_BYTE *)&self->super.super.isa + *v4) = 1;
  -[TimerOperation didChangeValueForKey:](self, "didChangeValueForKey:", v3);
}

- (void)timerFired:(id)a3
{
  if ((-[TimerOperation isCancelled](self, "isCancelled", a3) & 1) == 0)
    -[TimerOperation finish](self, "finish");
}

- (void)main
{
  id v3;

  -[TimerOperation timeInterval](self, "timeInterval");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timerFired:", 0, 0));
  -[TimerOperation setTimer:](self, "setTimer:", v3);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TimerOperation timer](self, "timer"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)TimerOperation;
  -[TimerOperation cancel](&v4, "cancel");
  -[TimerOperation finish](self, "finish");
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end

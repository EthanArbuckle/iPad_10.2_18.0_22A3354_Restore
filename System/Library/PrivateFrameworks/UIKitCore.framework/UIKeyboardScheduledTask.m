@implementation UIKeyboardScheduledTask

- (void)dealloc
{
  objc_super v3;

  -[_UIActionWhenIdle invalidate](self->_deferredAction, "invalidate");
  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardScheduledTask;
  -[UIKeyboardScheduledTask dealloc](&v3, sel_dealloc);
}

- (void)handleDeferredTimerFiredEvent
{
  void *v3;
  void *v4;
  _QWORD aBlock[5];
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id location;

  objc_initWeak(&location, self);
  v7 = 0;
  v8 = (id *)&v7;
  v9 = 0x3042000000;
  v10 = __Block_byref_object_copy__133;
  v11 = __Block_byref_object_dispose__133;
  aBlock[0] = MEMORY[0x1E0C809B0];
  v12 = 0;
  aBlock[2] = __56__UIKeyboardScheduledTask_handleDeferredTimerFiredEvent__block_invoke;
  aBlock[3] = &unk_1E16D7130;
  aBlock[1] = 3221225472;
  objc_copyWeak(&v6, &location);
  aBlock[4] = &v7;
  v3 = _Block_copy(aBlock);
  objc_storeWeak(v8 + 5, v3);
  -[UIKeyboardScheduledTask setEnqueuedTask:](self, "setEnqueuedTask:", v3);
  -[UIKeyboardScheduledTask taskQueue](self, "taskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTask:", v3);

  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (UIKeyboardTaskQueue)taskQueue
{
  return self->_taskQueue;
}

- (void)invalidate
{
  void *v2;
  void *v3;
  UIKeyboardScheduledTask *v4;

  v4 = self;
  -[UIKeyboardScheduledTask timer](v4, "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  -[UIKeyboardScheduledTask setTimer:](v4, "setTimer:", 0);
  -[UIKeyboardScheduledTask deferredAction](v4, "deferredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIKeyboardScheduledTask setDeferredAction:](v4, "setDeferredAction:", 0);
  -[UIKeyboardScheduledTask setEnqueuedTask:](v4, "setEnqueuedTask:", 0);

}

- (void)setEnqueuedTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIKeyboardScheduledTask)initWithTaskQueue:(id)a3 timeInterval:(double)a4 repeats:(BOOL)a5 task:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  UIKeyboardScheduledTask *v13;
  UIKeyboardScheduledTask *v14;
  uint64_t v15;
  id task;
  void *v17;
  objc_super v19;

  v7 = a5;
  v11 = a3;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardScheduledTask;
  v13 = -[UIKeyboardScheduledTask init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_timeInterval = a4;
    v15 = objc_msgSend(v12, "copy");
    task = v14->_task;
    v14->_task = (id)v15;

    objc_storeStrong((id *)&v14->_taskQueue, a3);
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v14, sel_timerFired_, 0, v7, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardScheduledTask setTimer:](v14, "setTimer:", v17);

  }
  return v14;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void)resetTimer
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 793, CFSTR("%s may only be called from the main thread."), "-[UIKeyboardScheduledTask resetTimer]");

  }
  if (-[UIKeyboardScheduledTask isValid](self, "isValid"))
  {
    -[UIKeyboardScheduledTask timer](self, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isValid");

    if (v5)
    {
      -[UIKeyboardScheduledTask timer](self, "timer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99D68];
      -[UIKeyboardScheduledTask timeInterval](self, "timeInterval");
      objc_msgSend(v7, "dateWithTimeIntervalSinceNow:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFireDate:", v8);

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99E88];
      -[UIKeyboardScheduledTask timeInterval](self, "timeInterval");
      objc_msgSend(v9, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timerFired_, 0, -[UIKeyboardScheduledTask repeats](self, "repeats"), v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardScheduledTask setTimer:](self, "setTimer:", v6);
    }

    -[UIKeyboardScheduledTask deferredAction](self, "deferredAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[UIKeyboardScheduledTask setDeferredAction:](self, "setDeferredAction:", 0);
    -[UIKeyboardScheduledTask setEnqueuedTask:](self, "setEnqueuedTask:", 0);
  }
}

- (void)setDeferredAction:(id)a3
{
  objc_storeStrong((id *)&self->_deferredAction, a3);
}

- (_UIActionWhenIdle)deferredAction
{
  return self->_deferredAction;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[UIKeyboardScheduledTask timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isValid") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UIKeyboardScheduledTask deferredAction](self, "deferredAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isValid") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[UIKeyboardScheduledTask enqueuedTask](self, "enqueuedTask");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

void __56__UIKeyboardScheduledTask_handleDeferredTimerFiredEvent__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "enqueuedTask"),
        v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4 == v5)
    && (objc_msgSend(WeakRetained, "task"),
        v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        objc_msgSend(WeakRetained, "setEnqueuedTask:", 0),
        v6))
  {
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
  else
  {
    objc_msgSend(v7, "returnExecutionToParent");
  }

}

- (void)timerFired:(id)a3
{
  void *v4;
  id v5;

  -[UIKeyboardScheduledTask deferredAction](self, "deferredAction", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isValid") & 1) == 0)
  {
    -[UIKeyboardScheduledTask enqueuedTask](self, "enqueuedTask");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return;
    +[_UIActionWhenIdle actionWhenIdleWithTarget:selector:object:](_UIActionWhenIdle, "actionWhenIdleWithTarget:selector:object:", self, sel_handleDeferredTimerFiredEvent, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardScheduledTask setDeferredAction:](self, "setDeferredAction:");
  }

}

- (id)enqueuedTask
{
  return self->_enqueuedTask;
}

- (id)task
{
  return self->_task;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_enqueuedTask, 0);
  objc_storeStrong((id *)&self->_deferredAction, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong(&self->_task, 0);
}

- (BOOL)repeats
{
  void *v2;
  double v3;
  BOOL v4;

  -[UIKeyboardScheduledTask timer](self, "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeInterval");
  v4 = v3 > 0.0;

  return v4;
}

@end

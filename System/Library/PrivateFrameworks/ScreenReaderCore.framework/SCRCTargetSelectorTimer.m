@implementation SCRCTargetSelectorTimer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__runThread, a1, 0);
}

+ (void)_runThread
{
  CFRunLoopRef Current;
  CFAbsoluteTime v4;
  __CFRunLoopTimer *v5;
  CFRunLoopTimerContext v6;

  objc_msgSend(a1, "_assignThreadPriority");
  Current = CFRunLoopGetCurrent();
  _TimerRunLoop = (uint64_t)CFRetain(Current);
  v6.version = 0;
  memset(&v6.retain, 0, 24);
  v6.info = a1;
  v4 = CFAbsoluteTimeGetCurrent();
  v5 = CFRunLoopTimerCreate(0, v4 + 630720000.0, 630720000.0, 0, 0, (CFRunLoopTimerCallBack)_handlerMainThread, &v6);
  CFRunLoopAddTimer((CFRunLoopRef)_TimerRunLoop, v5, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  _HaveTimerRunLoop = 1;
  CFRunLoopRunSpecific();
  __assert_rtn("+[SCRCTargetSelectorTimer _runThread]", "SCRCTargetSelectorTimer.m", 76, "false");
}

+ (void)_assignThreadPriority
{
  int64_t v2;
  int v3;
  _opaque_pthread_t *v4;
  _opaque_pthread_t *v5;
  int v6;
  sched_param v7;

  v2 = +[SCRCThread defaultThreadPriority](SCRCThread, "defaultThreadPriority");
  if (v2)
  {
    v3 = v2;
    v7 = 0;
    v6 = 0;
    v4 = pthread_self();
    pthread_getschedparam(v4, &v6, &v7);
    v7.sched_priority = v3;
    v5 = pthread_self();
    pthread_setschedparam(v5, 2, &v7);
  }
}

- (SCRCTargetSelectorTimer)initWithTarget:(id)a3 selector:(SEL)a4
{
  return -[SCRCTargetSelectorTimer initWithTarget:selector:threadKey:](self, "initWithTarget:selector:threadKey:", a3, a4, 0);
}

- (BOOL)_createdTimer
{
  return self->_createdTimer;
}

- (id)_initWithTarget:(id)a3 selector:(SEL)a4 threadKeyOrThread:(id)a5
{
  id v8;
  id v9;
  SCRCTargetSelectorTimer *v10;
  SCRCTargetSelectorTimer *v11;
  id *p_key;
  NSLock *v13;
  NSLock *lock;
  char isKindOfClass;
  double v16;
  void (__cdecl *v17)(CFRunLoopTimerRef, void *);
  __CFRunLoopTimer *timer;
  uint64_t v19;
  CFRunLoopTimerContext context;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SCRCTargetSelectorTimer;
  v10 = -[SCRCTargetSelector initWithTarget:selector:](&v22, sel_initWithTarget_selector_, v8, a4);
  v11 = v10;
  if (v10)
  {
    p_key = &v10->_key;
    objc_storeStrong(&v10->_key, a5);
    v11->_isCanceled = 1;
    v13 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v11->_lock;
    v11->_lock = v13;

    context.version = 0;
    context.info = v11;
    context.retain = (const void *(__cdecl *)(const void *))_timerRetain;
    context.release = (void (__cdecl *)(const void *))_timerRelease;
    context.copyDescription = 0;
    v11->_createdTimer = 0;
    if (*p_key)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v16 = CFAbsoluteTimeGetCurrent() + 630720000.0;
      if ((isKindOfClass & 1) != 0)
        v17 = (void (__cdecl *)(CFRunLoopTimerRef, void *))_handlerSCRCThread;
      else
        v17 = (void (__cdecl *)(CFRunLoopTimerRef, void *))_handler;
    }
    else
    {
      v16 = CFAbsoluteTimeGetCurrent() + 630720000.0;
      v17 = (void (__cdecl *)(CFRunLoopTimerRef, void *))_handlerMainThread;
    }
    timer = CFRunLoopTimerCreate(0, v16, 630720000.0, 0, 0, v17, &context);
    v11->_timer = timer;
    v11->_createdTimer = 1;
    if ((_HaveTimerRunLoop & 1) != 0)
    {
      v19 = 0;
    }
    else
    {
      v19 = 0;
      while (v19 != 200)
      {
        ++v19;
        usleep(0xC350u);
        if (_HaveTimerRunLoop == 1)
          goto LABEL_14;
      }
      v19 = 201;
LABEL_14:
      timer = v11->_timer;
    }
    if (!timer)
      -[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:].cold.1();
    if (!_TimerRunLoop)
      -[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:].cold.2();
    if (v19 >= 201)
      -[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:].cold.3();
    CFRunLoopAddTimer((CFRunLoopRef)_TimerRunLoop, timer, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  }

  return v11;
}

- (void)invalidate
{
  __CFRunLoopTimer *timer;
  NSLock *lock;
  id object;
  id v6;
  id v7;
  NSLock *v8;

  -[NSLock lock](self->_lock, "lock");
  timer = self->_timer;
  if (timer)
  {
    CFRunLoopTimerInvalidate(timer);
    CFRelease(self->_timer);
    self->_timer = 0;
  }
  self->_isCanceled = 1;
  self->_isPending = 0;
  lock = self->_lock;
  object = self->_object;
  self->_lock = 0;
  v6 = object;
  v8 = lock;

  v7 = self->_object;
  self->_object = 0;

  -[NSLock unlock](v8, "unlock");
}

- (void)dealloc
{
  objc_super v3;

  -[SCRCTargetSelectorTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SCRCTargetSelectorTimer;
  -[SCRCTargetSelectorTimer dealloc](&v3, sel_dealloc);
}

- (void)dispatchAfterDelay:(double)a3
{
  id object;
  __CFRunLoopTimer *timer;
  CFAbsoluteTime Current;
  id v8;

  -[NSLock lock](self->_lock, "lock");
  if (self->_timer)
  {
    v8 = self->_object;
    object = self->_object;
    self->_object = 0;

    self->_isCanceled = 0;
    self->_isPending = 1;
    timer = self->_timer;
    Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(timer, Current + a3);
  }
  else
  {
    v8 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)dispatchAfterDelay:(double)a3 withBlock:(id)a4
{
  void *v6;
  id block;
  __CFRunLoopTimer *timer;
  CFAbsoluteTime Current;
  id v10;

  v10 = a4;
  -[NSLock lock](self->_lock, "lock");
  if (self->_timer)
  {
    v6 = (void *)MEMORY[0x212BD44B0](v10);
    block = self->_block;
    self->_block = v6;

    self->_isCanceled = 0;
    self->_isPending = 1;
    timer = self->_timer;
    Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(timer, Current + a3);
  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)dispatchAfterDelay:(double)a3 withObject:(id)a4
{
  id v7;
  __CFRunLoopTimer *timer;
  CFAbsoluteTime Current;
  id v10;

  v10 = a4;
  -[NSLock lock](self->_lock, "lock");
  v7 = self->_object;
  objc_storeStrong(&self->_object, a4);
  timer = self->_timer;
  if (timer)
  {
    self->_isCanceled = 0;
    self->_isPending = 1;
    Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(timer, Current + a3);
  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)cancel
{
  id block;
  __CFRunLoopTimer *timer;
  CFAbsoluteTime Current;
  id object;
  id v7;

  -[NSLock lock](self->_lock, "lock");
  if (self->_isCanceled)
  {
    v7 = 0;
  }
  else
  {
    block = self->_block;
    self->_block = 0;

    self->_isCanceled = 1;
    timer = self->_timer;
    if (timer)
    {
      Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerSetNextFireDate(timer, Current + 630720000.0);
    }
    v7 = self->_object;
    object = self->_object;
    self->_object = 0;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (BOOL)isCancelled
{
  return self->_isCanceled;
}

- (BOOL)isPending
{
  BOOL isPending;

  -[NSLock lock](self->_lock, "lock");
  isPending = self->_isPending;
  -[NSLock unlock](self->_lock, "unlock");
  return isPending;
}

- (id)threadKey
{
  return self->_key;
}

- (void)_dispatchThreadHelper:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)_dispatch
{
  id object;
  id key;
  void *v5;
  void *block;
  id v7;

  -[NSLock lock](self->_lock, "lock");
  v7 = self->_object;
  object = self->_object;
  self->_object = 0;

  -[NSLock unlock](self->_lock, "unlock");
  if (self->_block)
  {
    key = self->_key;
    v5 = (void *)MEMORY[0x212BD44B0]();
    -[NSObject performSelector:withThreadKey:count:objects:](self, "performSelector:withThreadKey:count:objects:", sel__dispatchThreadHelper_, key, 1, v5);

    block = self->_block;
    self->_block = 0;
  }
  else
  {
    -[SCRCTargetSelector target](self, "target");
    block = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(block, "performSelector:withThreadKey:count:objects:", -[SCRCTargetSelector selector](self, "selector"), self->_key, 1, v7);
  }

  -[NSLock lock](self->_lock, "lock");
  self->_isPending = 0;
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)_dispatchMainThread
{
  id object;
  void *block;
  id v5;

  -[NSLock lock](self->_lock, "lock");
  v5 = self->_object;
  object = self->_object;
  self->_object = 0;

  -[NSLock unlock](self->_lock, "unlock");
  if (self->_block)
  {
    dispatch_async(MEMORY[0x24BDAC9B8], self->_block);
    block = self->_block;
    self->_block = 0;
  }
  else
  {
    -[SCRCTargetSelector target](self, "target");
    block = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(block, "performSelectorOnMainThread:withObject:waitUntilDone:", -[SCRCTargetSelector selector](self, "selector"), v5, 0);
  }

  -[NSLock lock](self->_lock, "lock");
  self->_isPending = 0;
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)_dispatchSCRCThread
{
  id object;
  id key;
  void *v5;
  void *block;
  const char *v7;
  id v8;

  -[NSLock lock](self->_lock, "lock");
  v8 = self->_object;
  object = self->_object;
  self->_object = 0;

  -[NSLock unlock](self->_lock, "unlock");
  key = self->_key;
  if (self->_block)
  {
    v5 = (void *)MEMORY[0x212BD44B0]();
    objc_msgSend(key, "performSelector:onTarget:count:objects:", sel__runTimerBlock_, self, 1, v5);

    block = self->_block;
    self->_block = 0;
  }
  else
  {
    v7 = -[SCRCTargetSelector selector](self, "selector");
    -[SCRCTargetSelector target](self, "target");
    block = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(key, "performSelector:onTarget:count:objects:", v7, block, 1, v8);
  }

  -[NSLock lock](self->_lock, "lock");
  self->_isPending = 0;
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)_runTimerBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

- (void)_initWithTarget:selector:threadKeyOrThread:.cold.1()
{
  __assert_rtn("-[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:]", "SCRCTargetSelectorTimer.m", 155, "_timer != nil");
}

- (void)_initWithTarget:selector:threadKeyOrThread:.cold.2()
{
  __assert_rtn("-[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:]", "SCRCTargetSelectorTimer.m", 156, "_TimerRunLoop");
}

- (void)_initWithTarget:selector:threadKeyOrThread:.cold.3()
{
  __assert_rtn("-[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:]", "SCRCTargetSelectorTimer.m", 157, "checkCount <= checkCountLimit");
}

@end

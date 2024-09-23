@implementation _UIScrollViewGestureSimulator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___UIScrollViewGestureSimulator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD824E8 != -1)
    dispatch_once(&qword_1ECD824E8, block);
  return (id)qword_1ECD824E0;
}

- (_UIScrollViewGestureSimulator)init
{
  _UIScrollViewGestureSimulator *v2;
  _UIScrollViewGestureSimulator *v3;
  __CFRunLoop *Main;
  NSMutableArray *v5;
  NSMutableArray *simulatedGestures;
  CFRunLoopSourceContext v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIScrollViewGestureSimulator;
  v2 = -[_UIScrollViewGestureSimulator init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v8.version = 0;
    memset(&v8.retain, 0, 56);
    v8.info = v2;
    v8.perform = (void (__cdecl *)(void *))_updateSimulation;
    v2->_mainThreadRunLoopSource = CFRunLoopSourceCreate(0, -1, &v8);
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v3->_mainThreadRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(v3->_mainThreadRunLoopSource);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    simulatedGestures = v3->_simulatedGestures;
    v3->_simulatedGestures = v5;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CFRunLoopSourceInvalidate(self->_mainThreadRunLoopSource);
  self->_mainThreadRunLoopSource = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewGestureSimulator;
  -[_UIScrollViewGestureSimulator dealloc](&v3, sel_dealloc);
}

- (void)simulateGestureWithDuration:(double)a3 begin:(id)a4 update:(id)a5 end:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSThread *v13;
  NSThread *workThread;
  _UIScrollViewSimulatedGesture *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v15 = -[_UIScrollViewSimulatedGesture initWithDuration:begin:update:end:]([_UIScrollViewSimulatedGesture alloc], "initWithDuration:begin:update:end:", v12, v11, v10, a3);

  -[NSMutableArray addObject:](self->_simulatedGestures, "addObject:", v15);
  if (self->_workThread)
  {
    if (-[NSMutableArray count](self->_simulatedGestures, "count") == 1)
      -[_UIScrollViewGestureSimulator performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__setHasSimulatedGestures_, self->_workThread, MEMORY[0x1E0C9AAB0], 0);
  }
  else
  {
    self->_hasSimulatedGestures = 1;
    v13 = (NSThread *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel__threadMain, 0);
    workThread = self->_workThread;
    self->_workThread = v13;

    -[NSThread setQualityOfService:](self->_workThread, "setQualityOfService:", 33);
    -[NSThread setName:](self->_workThread, "setName:", CFSTR("com.apple.uikit.simulated-scrollview-gesture-thread"));
    -[NSThread start](self->_workThread, "start");
  }

}

- (void)_threadMain
{
  void *v3;
  CADisplayLink *v4;
  CADisplayLink *displayLink;
  double v6;
  CADisplayLink *v7;
  double v8;
  id v9;
  void *v10;
  NSTimer *v11;
  NSTimer *timer;
  void *v13;
  CADisplayLink *v14;
  CADisplayLink *v15;
  NSTimer *v16;
  NSTimer *v17;
  NSThread *workThread;
  _QWORD v19[5];

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ECD82500 != -1)
    dispatch_once(&qword_1ECD82500, &__block_literal_global_165_3);
  if (_MergedGlobals_1324)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkDidFire_);
    v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v4;

    -[CADisplayLink maximumRefreshRate](self->_displayLink, "maximumRefreshRate");
    if ((uint64_t)llround(1.0 / v6) >= 61)
    {
      v7 = self->_displayLink;
      -[CADisplayLink maximumRefreshRate](v7, "maximumRefreshRate");
      if (v8 != 0.0)
        -[CADisplayLink setPreferredFramesPerSecond:](v7, "setPreferredFramesPerSecond:", llround(1.0 / v8));
    }
    -[CADisplayLink addToRunLoop:forMode:](self->_displayLink, "addToRunLoop:forMode:", v3, *MEMORY[0x1E0C99860]);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99E88]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __44___UIScrollViewGestureSimulator__threadMain__block_invoke;
    v19[3] = &unk_1E16C4358;
    v19[4] = self;
    v11 = (NSTimer *)objc_msgSend(v9, "initWithFireDate:interval:repeats:block:", v10, 1, v19, 0.0166666667);
    timer = self->_timer;
    self->_timer = v11;

    objc_msgSend(v3, "addTimer:forMode:", self->_timer, *MEMORY[0x1E0C99860]);
  }
  self->_lastWakeUpTime = CACurrentMediaTime();
  do
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "runUntilDate:", v13);

    }
    while (self->_hasSimulatedGestures);
  }
  while (CACurrentMediaTime() - self->_lastWakeUpTime < 5.0);
  v14 = self->_displayLink;
  if (v14)
  {
    -[CADisplayLink invalidate](v14, "invalidate");
    v15 = self->_displayLink;
    self->_displayLink = 0;

  }
  v16 = self->_timer;
  if (v16)
  {
    -[NSTimer invalidate](v16, "invalidate");
    v17 = self->_timer;
    self->_timer = 0;

  }
  workThread = self->_workThread;
  self->_workThread = 0;

}

- (void)_signalMainThreadIfNecessary
{
  __CFRunLoop *Main;

  if (self->_hasSimulatedGestures)
  {
    CFRunLoopSourceSignal(self->_mainThreadRunLoopSource);
    Main = CFRunLoopGetMain();
    CFRunLoopWakeUp(Main);
    self->_lastWakeUpTime = CACurrentMediaTime();
  }
}

- (void)_setHasSimulatedGestures:(id)a3
{
  self->_hasSimulatedGestures = objc_msgSend(a3, "BOOLValue");
}

- (void)_update
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_simulatedGestures, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = (void *)-[NSMutableArray copy](self->_simulatedGestures, "copy", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (objc_msgSend(v8, "updateSimulation"))
            -[NSMutableArray removeObjectIdenticalTo:](self->_simulatedGestures, "removeObjectIdenticalTo:", v8);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    if (self->_workThread)
    {
      if (!-[NSMutableArray count](self->_simulatedGestures, "count"))
        -[_UIScrollViewGestureSimulator performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__setHasSimulatedGestures_, self->_workThread, MEMORY[0x1E0C9AAA0], 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_workThread, 0);
  objc_storeStrong((id *)&self->_simulatedGestures, 0);
}

@end

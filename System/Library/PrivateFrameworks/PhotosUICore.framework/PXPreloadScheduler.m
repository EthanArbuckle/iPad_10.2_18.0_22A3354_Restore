@implementation PXPreloadScheduler

uint64_t __33__PXPreloadScheduler__setActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runLoopWillStartWaiting");
}

- (void)_updateIsActive
{
  -[PXPreloadScheduler _setActive:](self, "_setActive:", -[NSMutableArray count](self->_pendingBlocks, "count") != 0);
}

- (void)_setActive:(BOOL)a3
{
  id v4;
  PXDisplayLink *v5;
  PXDisplayLink *displayLink;
  __CFRunLoopObserver *v7;
  __CFRunLoop *Main;
  PXDisplayLink *v9;
  __CFRunLoop *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD block[5];

  if (self->__isActive != a3)
  {
    self->__isActive = a3;
    if (a3)
    {
      v4 = objc_alloc((Class)off_1E50B2330);
      v5 = (PXDisplayLink *)objc_msgSend(v4, "initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:", self, sel__displayLinkTick_, 0, *MEMORY[0x1E0C99748], 0);
      displayLink = self->_displayLink;
      self->_displayLink = v5;

      -[PXDisplayLink setFrameRateRangeType:](self->_displayLink, "setFrameRateRangeType:", 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__PXPreloadScheduler__setActive___block_invoke;
      block[3] = &unk_1E512BA08;
      block[4] = self;
      v7 = CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 1u, 2000001, block);
      self->_runloopObserver = v7;
      if (v7)
      {
        Main = CFRunLoopGetMain();
        CFRunLoopAddObserver(Main, self->_runloopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      }
      else
      {
        PLUIGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "PXPreloadScheduler failed to create a run loop observer, deferred tasks will be dropped on the floor", v12, 2u);
        }

      }
    }
    else
    {
      -[PXDisplayLink invalidate](self->_displayLink, "invalidate");
      v9 = self->_displayLink;
      self->_displayLink = 0;

      if (self->_runloopObserver)
      {
        v10 = CFRunLoopGetMain();
        CFRunLoopRemoveObserver(v10, self->_runloopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
        CFRelease(self->_runloopObserver);
        self->_runloopObserver = 0;
      }
    }
  }
}

- (void)_runLoopWillStartWaiting
{
  void (**v3)(_QWORD);

  if (-[NSMutableArray count](self->_pendingBlocks, "count")
    && -[PXPreloadScheduler _shouldExecutePendingBlock](self, "_shouldExecutePendingBlock"))
  {
    -[NSMutableArray firstObject](self->_pendingBlocks, "firstObject");
    v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_pendingBlocks, "removeObjectAtIndex:", 0);
      v3[2](v3);
    }

  }
  -[PXPreloadScheduler _updateIsActive](self, "_updateIsActive");
}

- (BOOL)_shouldExecutePendingBlock
{
  double v3;
  double v4;
  CFTimeInterval v5;
  double waitStartTime;
  NSObject *v8;
  double v9;
  double v10;
  BOOL v11;
  BOOL result;
  uint8_t v13[16];

  -[PXDisplayLink duration](self->_displayLink, "duration");
  if (v3 <= 0.0)
    return 0;
  v4 = v3;
  v5 = CACurrentMediaTime();
  if (!self->_shouldIgnoreDisplayLinkTimestamps)
  {
    waitStartTime = self->_waitStartTime;
    if (waitStartTime != 0.0 && v5 > waitStartTime + 10.0)
    {
      self->_shouldIgnoreDisplayLinkTimestamps = 1;
      PLUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "PXPreloadScheduler timed out waiting for space in a frame, ignoring CADisplayLink timestamps from now on.", v13, 2u);
      }

    }
  }
  -[PXDisplayLink targetTimestamp](self->_displayLink, "targetTimestamp");
  if ((v9 - v5) / v4 > 0.8 || (v10 = self->_waitStartTime, self->_shouldIgnoreDisplayLinkTimestamps) && v5 > v10 + 0.05)
  {
    if (!self->_shouldIgnoreDisplayLinkTimestamps)
      v5 = 0.0;
    v11 = 1;
    goto LABEL_16;
  }
  v11 = 0;
  result = 0;
  if (v10 == 0.0)
  {
LABEL_16:
    self->_waitStartTime = v5;
    return v11;
  }
  return result;
}

intptr_t __51__PXPreloadScheduler_scheduleMainQueueTaskAndWait___block_invoke(uint64_t a1)
{
  kdebug_trace();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  kdebug_trace();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __56__PXPreloadScheduler_scheduleDeferredTaskWithQoS_block___block_invoke(_QWORD *a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  void *v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;

  v2 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXPreloadScheduler_scheduleDeferredTaskWithQoS_block___block_invoke_2;
  block[3] = &unk_1E5148F60;
  v4 = (void *)a1[5];
  v3 = a1[6];
  block[4] = a1[4];
  v7 = v3;
  v6 = v4;
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

- (void)_didExecuteTaskWithQoS:(unint64_t)a3
{
  if (!a3)
    dispatch_group_leave((dispatch_group_t)self->_pendingUtilityTasks);
}

+ (PXPreloadScheduler)sharedScheduler
{
  if (sharedScheduler_onceToken != -1)
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global_133354);
  return (PXPreloadScheduler *)(id)sharedScheduler_scheduler;
}

- (void)scheduleDeferredTaskWithQoS:(unint64_t)a3 block:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  -[PXPreloadScheduler _willScheduleTaskWithQoS:](self, "_willScheduleTaskWithQoS:", a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXPreloadScheduler_scheduleDeferredTaskWithQoS_block___block_invoke;
  v8[3] = &unk_1E5148F60;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[PXPreloadScheduler scheduleMainQueueTask:](self, "scheduleMainQueueTask:", v8);

}

- (void)scheduleMainQueueTask:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PXPreloadScheduler_scheduleMainQueueTask___block_invoke;
  v6[3] = &unk_1E5148CE0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXPreloadScheduler scheduleTaskWithQoS:block:](self, "scheduleTaskWithQoS:block:", 0, v6);

}

- (void)scheduleTaskWithQoS:(unint64_t)a3 block:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  OS_dispatch_group *pendingUtilityTasks;
  NSObject *v9;
  OS_dispatch_group *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD block[5];
  id v14;
  unint64_t v15;

  v6 = a4;
  if (a3)
  {
    v7 = self->_backgroundQueue;
    pendingUtilityTasks = self->_pendingUtilityTasks;
    v9 = pendingUtilityTasks;
  }
  else
  {
    v9 = 0;
    pendingUtilityTasks = self->_utilityQueue;
    v7 = pendingUtilityTasks;
  }
  v10 = pendingUtilityTasks;
  -[PXPreloadScheduler _willScheduleTaskWithQoS:](self, "_willScheduleTaskWithQoS:", a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PXPreloadScheduler_scheduleTaskWithQoS_block___block_invoke;
  block[3] = &unk_1E5148F60;
  block[4] = self;
  v11 = v6;
  v14 = v11;
  v15 = a3;
  v12 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  if (v9)
    dispatch_group_notify(v9, (dispatch_queue_t)v7, v12);
  else
    dispatch_async((dispatch_queue_t)v7, v12);

}

- (void)_willScheduleTaskWithQoS:(unint64_t)a3
{
  if (!a3)
    dispatch_group_enter((dispatch_group_t)self->_pendingUtilityTasks);
}

- (void)scheduleTaskAfterCATransactionCommits:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __51__PXPreloadScheduler_scheduleMainQueueTaskAndWait___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v2, "addObject:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_updateIsActive");
}

uint64_t __48__PXPreloadScheduler_scheduleTaskWithQoS_block___block_invoke(uint64_t a1)
{
  kdebug_trace();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  kdebug_trace();
  return objc_msgSend(*(id *)(a1 + 32), "_didExecuteTaskWithQoS:", *(_QWORD *)(a1 + 48));
}

uint64_t __44__PXPreloadScheduler_scheduleMainQueueTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleMainQueueTaskAndWait:", *(_QWORD *)(a1 + 40));
}

- (void)scheduleMainQueueTaskAndWait:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD aBlock[5];
  dispatch_semaphore_t v13;
  id v14;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXPreloadScheduler_scheduleMainQueueTaskAndWait___block_invoke;
  aBlock[3] = &unk_1E5145688;
  v13 = v5;
  v14 = v4;
  aBlock[4] = self;
  v7 = v5;
  v8 = v4;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __51__PXPreloadScheduler_scheduleMainQueueTaskAndWait___block_invoke_2;
  block[3] = &unk_1E5148CE0;
  block[4] = self;
  v11 = _Block_copy(aBlock);
  v9 = v11;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

}

void __37__PXPreloadScheduler_sharedScheduler__block_invoke()
{
  PXPreloadScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(PXPreloadScheduler);
  v1 = (void *)sharedScheduler_scheduler;
  sharedScheduler_scheduler = (uint64_t)v0;

}

- (PXPreloadScheduler)init
{
  PXPreloadScheduler *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *utilityQueue;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *backgroundQueue;
  PXPreloadScheduler *v11;
  dispatch_group_t v12;
  OS_dispatch_group *pendingUtilityTasks;
  NSMutableArray *v14;
  NSMutableArray *pendingBlocks;
  _QWORD block[4];
  PXPreloadScheduler *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PXPreloadScheduler;
  v2 = -[PXPreloadScheduler init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.photos.preload-utility", v4);
    utilityQueue = v2->_utilityQueue;
    v2->_utilityQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.photos.preload-background", v8);
    backgroundQueue = v2->_backgroundQueue;
    v2->_backgroundQueue = (OS_dispatch_queue *)v9;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__PXPreloadScheduler_init__block_invoke;
    block[3] = &unk_1E5149198;
    v11 = v2;
    v18 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v12 = dispatch_group_create();
    pendingUtilityTasks = v11->_pendingUtilityTasks;
    v11->_pendingUtilityTasks = (OS_dispatch_group *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingBlocks = v11->_pendingBlocks;
    v11->_pendingBlocks = v14;

  }
  return v2;
}

- (void)_activateQueues
{
  dispatch_activate((dispatch_object_t)self->_utilityQueue);
  dispatch_activate((dispatch_object_t)self->_backgroundQueue);
}

- (void)dealloc
{
  __CFRunLoopObserver *runloopObserver;
  objc_super v4;

  runloopObserver = self->_runloopObserver;
  if (runloopObserver)
    CFRelease(runloopObserver);
  v4.receiver = self;
  v4.super_class = (Class)PXPreloadScheduler;
  -[PXPreloadScheduler dealloc](&v4, sel_dealloc);
}

- (void)scheduleDeferredMainQueueTask:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PXPreloadScheduler_scheduleDeferredMainQueueTask___block_invoke;
  v6[3] = &unk_1E5148CE0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXPreloadScheduler scheduleDeferredTaskWithQoS:block:](self, "scheduleDeferredTaskWithQoS:block:", 1, v6);

}

- (BOOL)_isActive
{
  return self->__isActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_pendingUtilityTasks, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
}

void __60__PXPreloadScheduler_scheduleTaskAfterCATransactionCommits___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", *(_QWORD *)(a1 + 32));

}

uint64_t __56__PXPreloadScheduler_scheduleDeferredTaskWithQoS_block___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "scheduleTaskWithQoS:block:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_didExecuteTaskWithQoS:", *(_QWORD *)(a1 + 48));
}

uint64_t __52__PXPreloadScheduler_scheduleDeferredMainQueueTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleMainQueueTaskAndWait:", *(_QWORD *)(a1 + 40));
}

uint64_t __26__PXPreloadScheduler_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateQueues");
}

@end

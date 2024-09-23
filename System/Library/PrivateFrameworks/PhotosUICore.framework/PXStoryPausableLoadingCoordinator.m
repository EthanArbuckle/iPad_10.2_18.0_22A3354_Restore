@implementation PXStoryPausableLoadingCoordinator

- (PXStoryPausableLoadingCoordinator)init
{
  PXStoryPausableLoadingCoordinator *v2;
  dispatch_group_t v3;
  OS_dispatch_group *timelineWorkGroup;
  const char *v5;
  objc_class *v6;
  id v7;
  os_log_t v8;
  OS_os_log *log;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXStoryPausableLoadingCoordinator;
  v2 = -[PXStoryPausableLoadingCoordinator init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    timelineWorkGroup = v2->_timelineWorkGroup;
    v2->_timelineWorkGroup = (OS_dispatch_group *)v3;

    v5 = (const char *)*MEMORY[0x1E0D744D8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = os_log_create(v5, (const char *)objc_msgSend(v7, "UTF8String"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v8;

  }
  return v2;
}

- (void)dealloc
{
  int64_t pauseCount;
  NSObject *timelineWorkGroup;
  objc_super v5;

  pauseCount = self->_pauseCount;
  if (pauseCount >= 1)
  {
    timelineWorkGroup = self->_timelineWorkGroup;
    do
    {
      dispatch_group_leave(timelineWorkGroup);
      --pauseCount;
    }
    while (pauseCount);
  }
  v5.receiver = self;
  v5.super_class = (Class)PXStoryPausableLoadingCoordinator;
  -[PXStoryPausableLoadingCoordinator dealloc](&v5, sel_dealloc);
}

- (void)pauseTimelineWork
{
  int64_t pauseCount;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t pausedSignpostID;
  uint8_t v8[16];

  pauseCount = self->_pauseCount;
  if (!pauseCount)
  {
    -[PXStoryPausableLoadingCoordinator log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    self->_pausedSignpostID = os_signpost_id_make_with_pointer(v4, self);

    -[PXStoryPausableLoadingCoordinator log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    pausedSignpostID = self->_pausedSignpostID;
    if (pausedSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, pausedSignpostID, "StoryLoadingCoordinatorPaused", ", v8, 2u);
    }

    pauseCount = self->_pauseCount;
  }
  self->_pauseCount = pauseCount + 1;
  dispatch_group_enter((dispatch_group_t)self->_timelineWorkGroup);
}

- (void)resumeTimelineWork
{
  NSObject *timelineWorkGroup;
  OS_dispatch_group **p_timelineWorkGroup;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t pausedSignpostID;
  uint8_t v8[16];

  p_timelineWorkGroup = &self->_timelineWorkGroup;
  timelineWorkGroup = self->_timelineWorkGroup;
  self->_pauseCount = (int64_t)p_timelineWorkGroup[1] - 1;
  dispatch_group_leave(timelineWorkGroup);
  if (!self->_pauseCount)
  {
    -[PXStoryPausableLoadingCoordinator log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    pausedSignpostID = self->_pausedSignpostID;
    if (pausedSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, pausedSignpostID, "StoryLoadingCoordinatorPaused", ", v8, 2u);
    }

  }
}

- (void)dispatchTimelineWorkAsyncOnQueue:(id)a3 block:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *timelineWorkGroup;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a4;
  v7 = a3;
  objc_initWeak(&location, self);
  timelineWorkGroup = self->_timelineWorkGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXStoryPausableLoadingCoordinator_dispatchTimelineWorkAsyncOnQueue_block___block_invoke;
  block[3] = &unk_1E5146480;
  objc_copyWeak(&v12, &location);
  v11 = v6;
  v9 = v6;
  dispatch_group_notify(timelineWorkGroup, v7, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_timelineWorkGroup, 0);
}

void __76__PXStoryPausableLoadingCoordinator_dispatchTimelineWorkAsyncOnQueue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

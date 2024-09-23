@implementation PXStoryTimelineManager

- (PXStoryTimelineManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineManager.m"), 64, CFSTR("%s is not available as initializer"), "-[PXStoryTimelineManager init]");

  abort();
}

- (PXStoryTimelineManager)initWithTimelineProducer:(id)a3 resourcesDataSourceManager:(id)a4 styleManager:(id)a5 specManager:(id)a6 loadingCoordinator:(id)a7 errorReporter:(id)a8 options:(unint64_t)a9 paperTrailOptions:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  PXStoryTimelineManager *v20;
  PXStoryTimelineManager *v21;
  uint64_t v22;
  OS_dispatch_queue *storyQueue;
  uint64_t v24;
  PXUpdater *updater;
  void *v26;
  uint64_t v27;
  NSMutableArray *targetTimelineResultsPaperTrail;
  uint64_t v29;
  NSMutableArray *timelinesPaperTrail;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  PXStoryTimelineManager *v36;
  objc_super v37;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v37.receiver = self;
  v37.super_class = (Class)PXStoryTimelineManager;
  v20 = -[PXStoryTimelineManager init](&v37, sel_init);
  v21 = v20;
  if (v20)
  {
    -[PXStoryTimelineManager copyLogConfigurationFrom:](v20, "copyLogConfigurationFrom:", v18);
    objc_storeStrong((id *)&v21->_timelineProducer, a3);
    objc_storeStrong((id *)&v21->_resourcesDataSourceManager, a4);
    -[PXStoryResourcesDataSourceManager registerChangeObserver:context:](v21->_resourcesDataSourceManager, "registerChangeObserver:context:", v21, ResourcesDataSourceManagerObservationContext_159023);
    objc_storeStrong((id *)&v21->_styleManager, a5);
    -[PXStoryStyleManager registerChangeObserver:context:](v21->_styleManager, "registerChangeObserver:context:", v21, StyleManagerObservationContext_159024);
    objc_storeStrong((id *)&v21->_specManager, a6);
    -[PXStoryTimelineSpecManager registerChangeObserver:context:](v21->_specManager, "registerChangeObserver:context:", v21, SpecManagerObservationContext_159025);
    objc_msgSend(v18, "storyQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    storyQueue = v21->_storyQueue;
    v21->_storyQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v21->_loadingCoordinator, a7);
    objc_storeStrong((id *)&v21->_errorReporter, a8);
    v21->_options = a9;
    v21->_paperTrailOptions = a10;
    v24 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v21, sel__setNeedsUpdate);
    updater = v21->_updater;
    v21->_updater = (PXUpdater *)v24;

    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateTargetTimeline);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updatePendingVisibleSegmentIdentifiers);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateTimeline);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateTimelineAttributes);
    if ((a10 & 1) != 0)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v21->_paperTrailLength = objc_msgSend(v26, "timelineManagerPaperTrailLength");

      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21->_paperTrailLength);
      targetTimelineResultsPaperTrail = v21->_targetTimelineResultsPaperTrail;
      v21->_targetTimelineResultsPaperTrail = (NSMutableArray *)v27;

      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21->_paperTrailLength);
      timelinesPaperTrail = v21->_timelinesPaperTrail;
      v21->_timelinesPaperTrail = (NSMutableArray *)v29;

    }
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __162__PXStoryTimelineManager_initWithTimelineProducer_resourcesDataSourceManager_styleManager_specManager_loadingCoordinator_errorReporter_options_paperTrailOptions___block_invoke;
    v35[3] = &unk_1E51479C8;
    v36 = v21;
    -[PXStoryTimelineManager performChanges:](v36, "performChanges:", v35);

  }
  return v21;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress cancel](self->_targetTimelineProgress, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineManager;
  -[PXStoryTimelineManager dealloc](&v3, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXStoryTimelineManager storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryTimelineManager;
  -[PXStoryTimelineManager performChanges:](&v6, sel_performChanges_, v4);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryTimelineManager;
  -[PXStoryTimelineManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryTimelineManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)setTargetTimelineResult:(id)a3
{
  PXStoryProducerResult *v5;
  BOOL v6;
  PXStoryProducerResult *v7;

  v7 = (PXStoryProducerResult *)a3;
  v5 = self->_targetTimelineResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryProducerResult isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_targetTimelineResult, a3);
      -[PXStoryTimelineManager setIsTargetTimelineFinal:](self, "setIsTargetTimelineFinal:", -[PXStoryProducerResult isDegraded](v7, "isDegraded") ^ 1);
      -[PXStoryTimelineManager _invalidatePendingVisibleSegmentIdentifiers](self, "_invalidatePendingVisibleSegmentIdentifiers");
      -[PXStoryTimelineManager _invalidateTimeline](self, "_invalidateTimeline");
    }
  }

}

- (void)setIsTargetTimelineFinal:(BOOL)a3
{
  if (self->_isTargetTimelineFinal != a3)
  {
    self->_isTargetTimelineFinal = a3;
    -[PXStoryTimelineManager _invalidateTimelineAttributes](self, "_invalidateTimelineAttributes");
  }
}

- (void)setTimeline:(id)a3
{
  PXStoryTimeline *v5;
  char v6;
  PXStoryTimeline *v7;

  v7 = (PXStoryTimeline *)a3;
  v5 = self->_timeline;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryTimeline isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timeline, a3);
      -[PXStoryTimelineManager signalChange:](self, "signalChange:", 1);
      -[NSMutableArray px_addObject:removingFirstObjectIfNeededToKeepMaximumCount:](self->_timelinesPaperTrail, "px_addObject:removingFirstObjectIfNeededToKeepMaximumCount:", self->_timeline, self->_paperTrailLength);
    }
  }

}

- (void)setTimelineAttributes:(unint64_t)a3
{
  if (self->_timelineAttributes != a3)
  {
    self->_timelineAttributes = a3;
    -[PXStoryTimelineManager signalChange:](self, "signalChange:", 4);
    -[PXStoryTimelineManager setIsTimelineFinal:](self, "setIsTimelineFinal:", (self->_timelineAttributes >> 1) & 1);
  }
}

- (void)setIsTimelineFinal:(BOOL)a3
{
  if (self->_isTimelineFinal != a3)
  {
    self->_isTimelineFinal = a3;
    -[PXStoryTimelineManager signalChange:](self, "signalChange:", 2);
  }
}

- (BOOL)requiresUpdatedTargetTimelineImmediately
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  char v16;
  BOOL v17;

  -[PXStoryTimelineManager targetTimelineResult](self, "targetTimelineResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_11;
  objc_msgSend(v4, "size");
  if (v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    goto LABEL_11;
  objc_msgSend(v4, "size");
  v9 = v8;
  v11 = v10;
  -[PXStoryTimelineManager specManager](self, "specManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timelineSpec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewportSize");
  if (v9 == v15 && v11 == v14)
  {

LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  v16 = -[PXStoryTimelineManager options](self, "options");

  if ((v16 & 4) != 0)
    goto LABEL_11;
  v17 = 1;
LABEL_12:

  return v17;
}

- (void)setTargetTimelineProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *targetTimelineProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  targetTimelineProgress = self->_targetTimelineProgress;
  if (targetTimelineProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](targetTimelineProgress, "cancel");
    objc_storeStrong((id *)&self->_targetTimelineProgress, a3);
    -[PXStoryTimelineManager _invalidateTimelineAttributes](self, "_invalidateTimelineAttributes");
    v5 = v7;
  }

}

- (_NSRange)_rangeOfVisibleDisplayAssetsInResourcesDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  _NSRange result;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3010000000;
  v20 = &unk_1A7E74EE7;
  v21 = xmmword_1A7C0C330;
  -[PXStoryTimelineManager timeline](self, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineManager visibleSegmentIdentifiers](self, "visibleSegmentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__PXStoryTimelineManager__rangeOfVisibleDisplayAssetsInResourcesDataSource___block_invoke;
  v13[3] = &unk_1E512F440;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  v15 = v8;
  v16 = &v17;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v13);

  v9 = v18[4];
  v10 = v18[5];

  _Block_object_dispose(&v17, 8);
  v11 = v9;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (void)setVisibleSegmentIdentifiers:(id)a3
{
  NSIndexSet *v4;
  char v5;
  NSIndexSet *v6;
  NSIndexSet *visibleSegmentIdentifiers;
  NSIndexSet *v8;

  v8 = (NSIndexSet *)a3;
  v4 = self->_visibleSegmentIdentifiers;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSIndexSet isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSIndexSet *)-[NSIndexSet copy](v8, "copy");
      visibleSegmentIdentifiers = self->_visibleSegmentIdentifiers;
      self->_visibleSegmentIdentifiers = v6;

      -[PXStoryTimelineManager setPendingVisibleSegmentIdentifiers:](self, "setPendingVisibleSegmentIdentifiers:", 0);
      if (!self->_isUpdatingTimeline)
        -[PXStoryTimelineManager _invalidateTimeline](self, "_invalidateTimeline");
    }
  }

}

- (void)setVisibleSegmentIdentifiers:(id)a3 afterUpdatePass:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    if (v6)
    {
      -[PXStoryTimelineManager setPendingVisibleSegmentIdentifiers:](self, "setPendingVisibleSegmentIdentifiers:", v6);
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
      -[PXStoryTimelineManager setPendingVisibleSegmentIdentifiers:](self, "setPendingVisibleSegmentIdentifiers:", v8);

    }
    objc_initWeak(&location, self);
    -[PXStoryTimelineManager storyQueue](self, "storyQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__PXStoryTimelineManager_setVisibleSegmentIdentifiers_afterUpdatePass___block_invoke;
    v10[3] = &unk_1E5148D30;
    objc_copyWeak(&v11, &location);
    dispatch_async(v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PXStoryTimelineManager setVisibleSegmentIdentifiers:](self, "setVisibleSegmentIdentifiers:", v6);
  }

}

- (void)_applyPendingVisibleSegmentIdentifiers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__PXStoryTimelineManager__applyPendingVisibleSegmentIdentifiers__block_invoke;
  v2[3] = &unk_1E512F468;
  v2[4] = self;
  -[PXStoryTimelineManager performChanges:](self, "performChanges:", v2);
}

- (void)_setNeedsUpdate
{
  -[PXStoryTimelineManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateTargetTimeline
{
  id v2;

  -[PXStoryTimelineManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTargetTimeline);

}

- (void)_updateTargetTimeline
{
  void *v3;
  void *v4;
  PXStoryDummyTimeline *v5;
  PXStoryDummyTimeline *v6;
  PXStoryProducerResult *v7;
  PXStoryTimelineProducerConfiguration *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  PXStoryTimelineProducerConfiguration *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  id v30[3];
  char v31;
  id location;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  if ((-[PXStoryTimelineManager timelineAttributes](self, "timelineAttributes") & 2) == 0
    || (-[PXStoryTimelineManager options](self, "options") & 1) == 0)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__159037;
    v37 = __Block_byref_object_dispose__159038;
    v38 = 0;
    -[PXStoryTimelineManager specManager](self, "specManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timelineSpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "viewportSize");
    if (PXSizeIsNull())
    {
      v5 = [PXStoryDummyTimeline alloc];
      v6 = -[PXStoryDummyTimeline initWithSize:](v5, "initWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v7 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v6);
      -[PXStoryProducerResult flags:](v7, "flags:", 1);
      v8 = (PXStoryTimelineProducerConfiguration *)objc_claimAutoreleasedReturnValue();
      -[PXStoryTimelineManager setTargetTimelineResult:](self, "setTargetTimelineResult:", v8);
    }
    else
    {
      v9 = -[PXStoryTimelineManager options](self, "options");
      -[PXStoryTimelineManager resourcesDataSourceManager](self, "resourcesDataSourceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataSource");
      v6 = (PXStoryDummyTimeline *)objc_claimAutoreleasedReturnValue();

      -[PXStoryTimelineManager styleManager](self, "styleManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentStyle");
      v7 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();

      v12 = [PXStoryTimelineProducerConfiguration alloc];
      -[PXStoryTimelineManager loadingCoordinator](self, "loadingCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryTimelineManager errorReporter](self, "errorReporter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PXStoryTimelineProducerConfiguration initWithResourcesDataSource:style:spec:options:loadingCoordinator:errorReporter:](v12, "initWithResourcesDataSource:style:spec:options:loadingCoordinator:errorReporter:", v6, v7, v4, (v9 >> 1) & 1, v13, v14);

      if (-[PXStoryTimelineManager requiresUpdatedTargetTimelineImmediately](self, "requiresUpdatedTargetTimelineImmediately"))
      {
        v15 = -[PXStoryTimelineManager _rangeOfVisibleDisplayAssetsInResourcesDataSource:](self, "_rangeOfVisibleDisplayAssetsInResourcesDataSource:", v6);
        -[PXStoryTimelineProducerConfiguration setRangeOfPrioritizedDisplayAssetResources:](v8, "setRangeOfPrioritizedDisplayAssetResources:", v15, v16);
        LOBYTE(v17) = 0;
        v18 = 3;
      }
      else if ((v9 & 1) != 0)
      {
        LOBYTE(v17) = 0;
        v18 = 2;
      }
      else if ((-[PXStoryTimelineManager timelineAttributes](self, "timelineAttributes") & 2) != 0)
      {
        LOBYTE(v17) = 0;
        v18 = 4;
      }
      else
      {
        v17 = (v9 >> 3) & 1;
        v18 = (v9 & 8) >> 1;
      }
      objc_initWeak(&location, self);
      -[PXStoryTimelineManager storyQueue](self, "storyQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)PXSyncCallbackBegin();
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v22 = v21;
      -[PXStoryTimelineManager timelineProducer](self, "timelineProducer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __47__PXStoryTimelineManager__updateTargetTimeline__block_invoke;
      v27[3] = &unk_1E512F490;
      v30[1] = v22;
      v30[2] = v20;
      v31 = v17;
      objc_copyWeak(v30, &location);
      v24 = v19;
      v28 = v24;
      v29 = &v33;
      objc_msgSend(v23, "requestTimelineWithConfiguration:options:resultHandler:", v8, v18, v27);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v34[5];
      v34[5] = v25;

      PXSyncCallbackEnd();
      objc_destroyWeak(v30);

      objc_destroyWeak(&location);
    }

    -[PXStoryTimelineManager setTargetTimelineProgress:](self, "setTargetTimelineProgress:", v34[5]);
    _Block_object_dispose(&v33, 8);

  }
}

- (void)_handleUpdatedTargetTimelineResult:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  PXStoryTimelineManager *v10;
  id v11;

  v4 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __61__PXStoryTimelineManager__handleUpdatedTargetTimelineResult___block_invoke;
  v9 = &unk_1E512F4B8;
  v10 = self;
  v11 = v4;
  v5 = v4;
  -[PXStoryTimelineManager performChanges:](self, "performChanges:", &v6);
  -[NSMutableArray px_addObject:removingFirstObjectIfNeededToKeepMaximumCount:](self->_targetTimelineResultsPaperTrail, "px_addObject:removingFirstObjectIfNeededToKeepMaximumCount:", v5, self->_paperTrailLength, v6, v7, v8, v9, v10);

}

- (void)_invalidatePendingVisibleSegmentIdentifiers
{
  id v2;

  -[PXStoryTimelineManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePendingVisibleSegmentIdentifiers);

}

- (void)_updatePendingVisibleSegmentIdentifiers
{
  void *v3;
  void *v4;

  -[PXStoryTimelineManager pendingVisibleSegmentIdentifiers](self, "pendingVisibleSegmentIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PXStoryTimelineManager setVisibleSegmentIdentifiers:](self, "setVisibleSegmentIdentifiers:", v3);
    -[PXStoryTimelineManager setPendingVisibleSegmentIdentifiers:](self, "setPendingVisibleSegmentIdentifiers:", 0);
    v3 = v4;
  }

}

- (void)_invalidateTimeline
{
  id v2;

  -[PXStoryTimelineManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTimeline);

}

- (void)_updateTimeline
{
  BOOL isUpdatingTimeline;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  isUpdatingTimeline = self->_isUpdatingTimeline;
  self->_isUpdatingTimeline = 1;
  -[PXStoryTimelineManager timeline](self, "timeline");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineManager visibleSegmentIdentifiers](self, "visibleSegmentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineManager targetTimelineResult](self, "targetTimelineResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXStoryRecombinedTimeline timelineByRecombiningSourceTimeline:withTargetTimeline:visibleSegmentIdentifiers:](PXStoryRecombinedTimeline, "timelineByRecombiningSourceTimeline:withTargetTimeline:visibleSegmentIdentifiers:", v12, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v9 = v8;
  if (objc_msgSend(v8, "count"))
  {
    v9 = v8;
    if ((objc_msgSend(v7, "containsAllSegmentsWithIdentifiers:", v8) & 1) == 0)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __41__PXStoryTimelineManager__updateTimeline__block_invoke;
      v13[3] = &unk_1E51489A0;
      v14 = v7;
      v15 = v12;
      v16 = v10;
      v11 = v10;
      objc_msgSend(v8, "enumerateIndexesUsingBlock:", v13);
      v9 = (void *)objc_msgSend(v11, "copy");

    }
  }
  -[PXStoryTimelineManager setTimeline:](self, "setTimeline:", v7);
  -[PXStoryTimelineManager setVisibleSegmentIdentifiers:](self, "setVisibleSegmentIdentifiers:", v9);
  self->_isUpdatingTimeline = isUpdatingTimeline;

}

- (void)_invalidateTimelineAttributes
{
  id v2;

  -[PXStoryTimelineManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTimelineAttributes);

}

- (void)_updateTimelineAttributes
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  char v7;
  uint64_t v8;

  -[PXStoryTimelineManager targetTimelineProgress](self, "targetTimelineProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PXStoryTimelineManager resourcesDataSourceManager](self, "resourcesDataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isDataSourceFinal"))
    {
      v5 = -[PXStoryTimelineManager isTargetTimelineFinal](self, "isTargetTimelineFinal");

      if (v5)
      {
        -[PXStoryTimelineManager styleManager](self, "styleManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "currentStyleAttributes");

        v8 = v7 & 3;
LABEL_7:
        -[PXStoryTimelineManager setTimelineAttributes:](self, "setTimelineAttributes:", v8);
        return;
      }
    }
    else
    {

    }
    v8 = 0;
    goto LABEL_7;
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PXStoryTimelineManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5140090;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXStoryTimelineManager performChanges:](self, "performChanges:", v5);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  PXStoryTimelineManager *v21;
  id v22;
  PXStoryDurationFormatter *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v23 = objc_alloc_init(PXStoryDurationFormatter);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = self;
  v5 = self->_targetTimelineResultsPaperTrail;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "diagnosticDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isDegraded");
        objc_msgSend(v10, "productionDuration");
        -[PXStoryDurationFormatter stringFromTimeInterval:](v23, "stringFromTimeInterval:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("Timeline: %@\n Is Degraded: %d\nProduction Duration: %@\n\n\n"), v12, v13, v14, v21);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  objc_msgSend(v22, "addAttachmentWithText:name:", v4, CFSTR("TimelineManagerTargetTimelineResults"));
  v15 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v21->_timelinesPaperTrail;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v15, "appendFormat:", CFSTR("%@\n\n\n"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v18);
  }

  objc_msgSend(v22, "addAttachmentWithText:name:", v4, CFSTR("TimelineManagerTimelines"));
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (NSIndexSet)visibleSegmentIdentifiers
{
  return self->_visibleSegmentIdentifiers;
}

- (PXStoryTimelineSpecManager)specManager
{
  return self->_specManager;
}

- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager
{
  return self->_resourcesDataSourceManager;
}

- (PXStoryStyleManager)styleManager
{
  return self->_styleManager;
}

- (PXStoryLoadingCoordinator)loadingCoordinator
{
  return self->_loadingCoordinator;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)paperTrailOptions
{
  return self->_paperTrailOptions;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (unint64_t)timelineAttributes
{
  return self->_timelineAttributes;
}

- (BOOL)isTimelineFinal
{
  return self->_isTimelineFinal;
}

- (PXStoryTimelineProducer)timelineProducer
{
  return self->_timelineProducer;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryProducerResult)targetTimelineResult
{
  return self->_targetTimelineResult;
}

- (BOOL)isTargetTimelineFinal
{
  return self->_isTargetTimelineFinal;
}

- (NSProgress)targetTimelineProgress
{
  return self->_targetTimelineProgress;
}

- (NSIndexSet)pendingVisibleSegmentIdentifiers
{
  return self->_pendingVisibleSegmentIdentifiers;
}

- (void)setPendingVisibleSegmentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingVisibleSegmentIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingVisibleSegmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_targetTimelineProgress, 0);
  objc_storeStrong((id *)&self->_targetTimelineResult, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_timelineProducer, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_loadingCoordinator, 0);
  objc_storeStrong((id *)&self->_styleManager, 0);
  objc_storeStrong((id *)&self->_resourcesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_visibleSegmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_timelinesPaperTrail, 0);
  objc_storeStrong((id *)&self->_targetTimelineResultsPaperTrail, 0);
}

void __55__PXStoryTimelineManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == ResourcesDataSourceManagerObservationContext_159023)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v8 = v3;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetTimeline");
      v3 = v8;
      v5 = *(_QWORD *)(a1 + 48);
    }
    if ((v5 & 2) == 0)
      goto LABEL_15;
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "_invalidateTimelineAttributes");
    goto LABEL_14;
  }
  if (v4 == StyleManagerObservationContext_159024)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v8 = v3;
    if ((v6 & 4) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetTimeline");
      v3 = v8;
      v6 = *(_QWORD *)(a1 + 48);
    }
    if ((v6 & 8) == 0)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (v4 != SpecManagerObservationContext_159025)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryTimelineManager.m"), 403, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v8 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetTimeline");
LABEL_14:
    v3 = v8;
  }
LABEL_15:

}

uint64_t __41__PXStoryTimelineManager__updateTimeline__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "identifierOfSegmentClosestToSegmentWithIdentifier:inTimeline:", a2, *(_QWORD *)(a1 + 40));
  if (result)
    return objc_msgSend(*(id *)(a1 + 48), "addIndex:", result);
  return result;
}

uint64_t __61__PXStoryTimelineManager__handleUpdatedTargetTimelineResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setTargetTimelineResult:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isDegraded");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setTargetTimelineProgress:", 0);
  return result;
}

void __47__PXStoryTimelineManager__updateTargetTimeline__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  uint8_t buf[16];

  v3 = a2;
  v4 = (id)objc_msgSend(v3, "deliveredNowWithRequestTime:", *(double *)(a1 + 56));
  if (PXIsSyncCallback())
  {
    if (*(_BYTE *)(a1 + 72))
    {
      PXAssertGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "unexpected synchronous production, performance might be impacted", buf, 2u);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_handleUpdatedTargetTimelineResult:", v3);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PXStoryTimelineManager__updateTargetTimeline__block_invoke_31;
    block[3] = &unk_1E5135228;
    v7 = *(NSObject **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    objc_copyWeak(&v11, (id *)(a1 + 48));
    v9 = v3;
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
  }

}

void __47__PXStoryTimelineManager__updateTargetTimeline__block_invoke_31(uint64_t a1)
{
  id WeakRetained;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_handleUpdatedTargetTimelineResult:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __64__PXStoryTimelineManager__applyPendingVisibleSegmentIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePendingVisibleSegmentIdentifiers");
}

void __71__PXStoryTimelineManager_setVisibleSegmentIdentifiers_afterUpdatePass___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_applyPendingVisibleSegmentIdentifiers");

}

void __76__PXStoryTimelineManager__rangeOfVisibleDisplayAssetsInResourcesDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  NSRange *v3;
  NSRange *v4;
  id v5;
  NSRange v6;
  NSRange v7;

  objc_msgSend(*(id *)(a1 + 32), "indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:", 1, *(_QWORD *)(a1 + 40), a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v3 = *(NSRange **)(*(_QWORD *)(a1 + 48) + 8);
    v6.location = objc_msgSend(v5, "firstIndex");
    v6.length = 1;
    *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = NSUnionRange(v3[2], v6);
    v4 = *(NSRange **)(*(_QWORD *)(a1 + 48) + 8);
    v7.location = objc_msgSend(v5, "lastIndex");
    v7.length = 1;
    *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = NSUnionRange(v4[2], v7);
  }

}

uint64_t __162__PXStoryTimelineManager_initWithTimelineProducer_resourcesDataSourceManager_styleManager_specManager_loadingCoordinator_errorReporter_options_paperTrailOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetTimeline");
}

+ (PXStoryTimelineManager)timelineManagerWithTimelineProducer:(id)a3 resourcesDataSourceManager:(id)a4 styleManager:(id)a5 specManager:(id)a6 configuration:(id)a7 loadingCoordinator:(id)a8 paperTrailOptions:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  PXStoryTimelineManager *v22;
  void *v23;
  PXStoryTimelineManager *v24;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_msgSend(v15, "options");
  if ((objc_msgSend(v15, "options") & 0xC) != 0)
    v21 = v20 & 3 | 8;
  else
    v21 = v20 & 3;
  v22 = [PXStoryTimelineManager alloc];
  objc_msgSend(v15, "errorReporter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[PXStoryTimelineManager initWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:loadingCoordinator:errorReporter:options:paperTrailOptions:](v22, "initWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:loadingCoordinator:errorReporter:options:paperTrailOptions:", v19, v18, v17, v16, v14, v23, v21, a9);
  return v24;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  PXStoryTimelineManager *v25;
  id v26;
  id v27;
  int64_t v28;
  _QWORD v29[5];
  void *v30;
  id v31;
  int64_t v32;
  _BYTE v33[48];

  -[PXStoryTimelineManager styleManager](self, "styleManager", a4.width, a4.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "autoEditDecisionList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (v8)
    {
      objc_msgSend(v9, "appendFormat:", CFSTR("Auto-Edit decision list contains: %ld clips\n"), objc_msgSend(v8, "numberOfClips"));
      goto LABEL_6;
    }
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  }
  objc_msgSend(v9, "appendString:", CFSTR("No Auto-Edit decision list present\n"));
  v8 = 0;
LABEL_6:
  objc_msgSend(v7, "originalColorGradeCategory");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("-");
  if (v10)
    v12 = (const __CFString *)v10;
  objc_msgSend(v9, "appendFormat:", CFSTR("Color grade category: %@\n"), v12);
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  -[PXStoryTimelineManager timeline](self, "timeline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "useVerboseStyleHUDText"))
  {
    if (v13)
      objc_msgSend(v13, "timeRange");
    else
      memset(v33, 0, sizeof(v33));
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __76__PXStoryTimelineManager_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke;
    v29[3] = &unk_1E5135380;
    v29[4] = self;
    v30 = v8;
    v31 = v9;
    v32 = a3;
    v19 = v9;
    v20 = v8;
    objc_msgSend(v13, "enumerateSegmentsInTimeRange:usingBlock:", v33, v29);

    v18 = v30;
  }
  else
  {
    -[PXStoryTimelineManager visibleSegmentIdentifiers](self, "visibleSegmentIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76__PXStoryTimelineManager_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke_2;
    v23[3] = &unk_1E51353A8;
    v24 = v13;
    v25 = self;
    v27 = v9;
    v28 = a3;
    v26 = v8;
    v16 = v9;
    v17 = v8;
    objc_msgSend(v15, "enumerateIndexesUsingBlock:", v23);

    v18 = v24;
  }

  v21 = (void *)objc_msgSend(v9, "copy");
  return v21;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)_diagnosticTextForSegmentIdentifier:(int64_t)a3 segmentTimeRange:(id *)a4 HUDType:(int64_t)a5 decisionList:(id)a6
{
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  __int128 v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  PXStoryTimelineManager *v34;
  _QWORD *v35;
  SEL v36;
  int64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  _QWORD v42[3];
  int v43;

  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v12, "appendFormat:", CFSTR("Segment: %ld\n"), a3);
  -[PXStoryTimelineManager timeline](self, "timeline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  PXRectWithOriginAndSize();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v22 = MEMORY[0x1E0C809B0];
  v43 = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __113__PXStoryTimelineManager_Diagnostics___diagnosticTextForSegmentIdentifier_segmentTimeRange_HUDType_decisionList___block_invoke;
  v41[3] = &unk_1E51353D0;
  v41[4] = v42;
  v23 = *(_OWORD *)&a4->var0.var3;
  v38 = *(_OWORD *)&a4->var0.var0;
  v39 = v23;
  v40 = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v13, "enumerateClipsInTimeRange:rect:usingBlock:", &v38, v41, v14, v17);
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __113__PXStoryTimelineManager_Diagnostics___diagnosticTextForSegmentIdentifier_segmentTimeRange_HUDType_decisionList___block_invoke_2;
  v30[3] = &unk_1E51353F8;
  v24 = v13;
  v31 = v24;
  v25 = v12;
  v32 = v25;
  v26 = v11;
  v33 = v26;
  v34 = self;
  v36 = a2;
  v37 = a5;
  v35 = v42;
  v27 = *(_OWORD *)&a4->var0.var3;
  v38 = *(_OWORD *)&a4->var0.var0;
  v39 = v27;
  v40 = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v24, "enumerateClipsInTimeRange:rect:usingBlock:", &v38, v30, v15, v17, v19, v21);
  v28 = v25;

  _Block_object_dispose(v42, 8);
  return v28;
}

- (id)_diagnosticStyleTextForClipInfo:(id *)a3 segmentClipCount:(int)a4 autoEditClip:(id)a5
{
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int64_t var5;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  CMTime v27;
  CMTime v28;
  CMTime time2;
  CMTime time1;
  CMTime v31;
  CMTime v32;
  CMTime var1;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CMTime v37;

  v7 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v34 = *(_OWORD *)&a3->var4.var1.var0;
  *(_QWORD *)&v35 = a3->var4.var1.var3;
  PXStoryTimeDescription((CMTime *)&v34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("    Duration=%@"), v9);

  if (v7)
  {
    v36 = 0u;
    memset(&v37, 0, sizeof(v37));
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v7, "durationInfo");
    var1 = (CMTime)a3->var4.var1;
    *(_OWORD *)&v32.value = v34;
    v32.epoch = v35;
    v31 = v37;
    *(_OWORD *)&time1.value = v34;
    time1.epoch = v35;
    time2 = (CMTime)a3->var4.var1;
    v10 = CFSTR("🟥");
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      time1 = var1;
      time2 = v31;
      if (CMTimeCompare(&time1, &time2) < 1)
        v10 = CFSTR("✅");
    }
    v28 = v32;
    PXStoryTimeDescription(&v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v31;
    PXStoryTimeDescription(&v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(", AE (min=%@/max=%@): %@"), v11, v12, v10);

    v13 = v7;
    objc_msgSend(v13, "durationMultiplier");
    v15 = v14;

    objc_msgSend(v8, "appendFormat:", CFSTR(", baked-in multiplier: %.2f"), v15);
  }
  else
  {
    objc_msgSend(v8, "appendString:", CFSTR(" (AE: N/A)"));
  }
  objc_msgSend(v8, "appendString:", CFSTR("\n"));
  PXDisplayAssetPlaybackStyleDescription();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("    Style: %@"), v16);

  if (!v7)
  {
    v23 = CFSTR(" (AE: N/A)");
    goto LABEL_18;
  }
  v17 = objc_msgSend(v7, "playbackStyle");
  var5 = a3->var5;
  if (a4 != 1)
  {
    PXDisplayAssetPlaybackStyleDescription();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" AE: %@"), v24);

    if (var5 == v17)
      goto LABEL_19;
    v23 = CFSTR(" 🟧");
LABEL_18:
    objc_msgSend(v8, "appendString:", v23);
    goto LABEL_19;
  }
  PXDisplayAssetPlaybackStyleDescription();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (var5 == v17)
    v21 = CFSTR("==");
  else
    v21 = CFSTR("!=");
  v22 = CFSTR("🟥");
  if (var5 == v17)
    v22 = CFSTR("✅");
  objc_msgSend(v8, "appendFormat:", CFSTR(" %@ AE: %@ %@"), v21, v19, v22);

LABEL_19:
  v25 = (void *)objc_msgSend(v8, "copy");

  return v25;
}

- (id)_diagnosticMovementTextForClipInfo:(id *)a3 segmentClipCount:(int)a4 autoEditClip:(id)a5
{
  id v5;
  id v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v15;

  v5 = a5;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if ((PXStoryRectIsEmpty() & 1) != 0 || (PXStoryRectIsEmpty() & 1) != 0)
  {
    v7 = CFSTR("  Movement: Invalid source and/or target rect 🟥");
  }
  else
  {
    if ((PXStoryRectEqualToRect() & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      PXStoryRectDecompose();
      PXStoryRectDecompose();
      v8 = 1;
    }
    PFStoryRecipeClipMotionStyleDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("    Motion: %@"), v9);

    if (v5)
    {
      objc_msgSend(v5, "motionInfo");
      v10 = CFSTR("🟥");
      if (v8 == v15)
      {
        v10 = CFSTR("✅");
        v11 = CFSTR("==");
      }
      else
      {
        v11 = CFSTR("!=");
      }
      v12 = v10;
      PFStoryRecipeClipMotionStyleDescription();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" %@ AE: %@ %@"), v11, v13, v12);

    }
    else
    {
      objc_msgSend(v6, "appendString:", CFSTR(" (AE: N/A)"));
    }
    v7 = (__CFString *)objc_msgSend(v6, "copy");
  }

  return v7;
}

uint64_t __113__PXStoryTimelineManager_Diagnostics___diagnosticTextForSegmentIdentifier_segmentTimeRange_HUDType_decisionList___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  if (a2 >= 1)
  {
    v5 = (_QWORD *)(a5 + 152);
    do
    {
      if (*(v5 - 18) == 1 && *v5 != 0)
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
      v5 += 96;
      --a2;
    }
    while (a2);
  }
  return result;
}

void __113__PXStoryTimelineManager_Diagnostics___diagnosticTextForSegmentIdentifier_segmentTimeRange_HUDType_decisionList___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[608];
  _BYTE __dst[608];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  if (a2 >= 1)
  {
    v52 = v5;
    v53 = v6;
    v8 = a2;
    while (1)
    {
      v11 = *a5;
      v10 = a5[1];
      v12 = *((_OWORD *)a5 + 8);
      v49 = *((_OWORD *)a5 + 7);
      v50 = v12;
      v13 = a5[19];
      v51 = a5[18];
      v14 = *((_OWORD *)a5 + 4);
      v45 = *((_OWORD *)a5 + 3);
      v46 = v14;
      v15 = *((_OWORD *)a5 + 6);
      v47 = *((_OWORD *)a5 + 5);
      v48 = v15;
      v16 = *((_OWORD *)a5 + 2);
      v43 = *((_OWORD *)a5 + 1);
      v44 = v16;
      memcpy(__dst, a5 + 20, sizeof(__dst));
      objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v10 != 1 || !v13)
        goto LABEL_14;
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("  Clip %6ld\n"), objc_msgSend(v17, "identifier"));
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(v18, "resource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "px_storyResourceDisplayAsset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "clipForDisplayAsset:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = 0;
      }
      v22 = *(_QWORD *)(a1 + 80);
      if (v22 == 11)
        break;
      v23 = &stru_1E5149688;
      if (v22 == 7)
      {
        v24 = *(void **)(a1 + 56);
        v25 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v29 = v11;
        v30 = 1;
        v37 = v49;
        v38 = v50;
        v39 = v51;
        v33 = v45;
        v34 = v46;
        v35 = v47;
        v36 = v48;
        v31 = v43;
        v32 = v44;
        v40 = v13;
        memcpy(v41, __dst, sizeof(v41));
        objc_msgSend(v24, "_diagnosticStyleTextForClipInfo:segmentClipCount:autoEditClip:", &v29, v25, v21);
        v26 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v23 = (__CFString *)v26;
      }
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%@\n"), v23);

LABEL_14:
      a5 += 96;
      if (!--v8)
        return;
    }
    v27 = *(void **)(a1 + 56);
    v28 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v29 = v11;
    v30 = 1;
    v37 = v49;
    v38 = v50;
    v39 = v51;
    v33 = v45;
    v34 = v46;
    v35 = v47;
    v36 = v48;
    v31 = v43;
    v32 = v44;
    v40 = v13;
    memcpy(v41, __dst, sizeof(v41));
    objc_msgSend(v27, "_diagnosticMovementTextForClipInfo:segmentClipCount:autoEditClip:", &v29, v28, v21);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
}

void __76__PXStoryTimelineManager_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  void *v12;
  _OWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  if (a2 >= 1)
  {
    v14 = v4;
    v15 = v5;
    v8 = a2;
    do
    {
      v10 = *a4;
      a4 += 25;
      v11 = a3[1];
      v13[0] = *a3;
      v13[1] = v11;
      v13[2] = a3[2];
      objc_msgSend(*(id *)(a1 + 32), "_diagnosticTextForSegmentIdentifier:segmentTimeRange:HUDType:decisionList:", v10, v13, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "appendFormat:", CFSTR("%@\n"), v12);

      a3 += 3;
      --v8;
    }
    while (v8);
  }
}

void __76__PXStoryTimelineManager_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "timeRangeForSegmentWithIdentifier:", a2);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  objc_msgSend(v6, "_diagnosticTextForSegmentIdentifier:segmentTimeRange:HUDType:decisionList:", a2, v9, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "appendFormat:", CFSTR("%@\n"), v8);

}

@end

@implementation PXStoryValidationController

- (PXStoryValidationController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryValidationController.m"), 38, CFSTR("%s is not available as initializer"), "-[PXStoryValidationController initWithObservableModel:]");

  abort();
}

- (PXStoryValidationController)initWithViewModel:(id)a3
{
  id v4;
  PXStoryValidationController *v5;
  PXStoryValidationController *v6;
  id v7;
  uint64_t v8;
  PXStoryValidationController *v9;
  objc_class *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  id WeakRetained;
  uint64_t v18;
  PXStoryErrorReporter *errorReporter;
  _QWORD v21[4];
  PXStoryValidationController *v22;
  _QWORD v23[4];
  PXStoryValidationController *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PXStoryValidationController;
  v5 = -[PXStoryController initWithObservableModel:](&v25, sel_initWithObservableModel_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_viewModel, v4);
    v8 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __49__PXStoryValidationController_initWithViewModel___block_invoke;
    v23[3] = &unk_1E5146E78;
    v9 = v6;
    v24 = v9;
    objc_msgSend(v4, "performChanges:", v23);

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v12, v14);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v15;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_viewModel);
    objc_msgSend(WeakRetained, "errorReporter");
    v18 = objc_claimAutoreleasedReturnValue();
    errorReporter = v9->_errorReporter;
    v9->_errorReporter = (PXStoryErrorReporter *)v18;

    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __49__PXStoryValidationController_initWithViewModel___block_invoke_2;
    v21[3] = &unk_1E511D588;
    v22 = v9;
    -[PXStoryController performChanges:](v22, "performChanges:", v21);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress cancel](self->_timelineValidationProgress, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryValidationController;
  -[PXStoryValidationController dealloc](&v3, sel_dealloc);
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryValidationController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateModel, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateTimelineToValidate);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateTimelineValidation);

}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryValidationController _invalidateTimelineValidation](self, "_invalidateTimelineValidation");
  }
}

- (void)setModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *model;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  model = self->_model;
  if (model != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](model, "unregisterChangeObserver:context:", self, ModelObservationContext_47851);
    objc_storeStrong((id *)&self->_model, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_model, "registerChangeObserver:context:", self, ModelObservationContext_47851);
    -[PXStoryValidationController _invalidateTimelineToValidate](self, "_invalidateTimelineToValidate");
    v5 = v7;
  }

}

- (void)setTimelineToValidate:(id)a3
{
  PXStoryTimeline *v5;
  char v6;
  PXStoryTimeline *v7;

  v7 = (PXStoryTimeline *)a3;
  v5 = self->_timelineToValidate;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryTimeline isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timelineToValidate, a3);
      -[PXStoryValidationController _invalidateTimelineValidation](self, "_invalidateTimelineValidation");
    }
  }

}

- (void)setTimelineValidationProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_timelineValidationProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_timelineValidationProgress = &self->_timelineValidationProgress;
  if (*p_timelineValidationProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_timelineValidationProgress, "cancel");
    objc_storeStrong((id *)p_timelineValidationProgress, a3);
    v5 = v7;
  }

}

- (void)setTimelineValidationError:(id)a3
{
  NSError *v5;
  NSError **p_timelineValidationError;
  void *v7;
  NSError *v8;

  v5 = (NSError *)a3;
  p_timelineValidationError = &self->_timelineValidationError;
  if (self->_timelineValidationError != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_timelineValidationError, a3);
    -[PXStoryValidationController errorReporter](self, "errorReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setError:forComponent:", *p_timelineValidationError, CFSTR("TimelineValidation"));

    v5 = v8;
  }

}

- (void)_invalidateModel
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateModel);

}

- (void)_updateModel
{
  void *v3;
  id v4;

  -[PXStoryValidationController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryValidationController setModel:](self, "setModel:", v3);

}

- (void)_invalidateTimelineToValidate
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTimelineToValidate);

}

- (void)_updateTimelineToValidate
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PXStoryValidationController model](self, "model");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "validationShouldWaitForTimelineToBeReadyToPlay"))
  {

    goto LABEL_5;
  }
  v4 = objc_msgSend(v6, "timelineAttributes") & 3;

  if (v4)
  {
LABEL_5:
    objc_msgSend(v6, "timeline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v5 = 0;
LABEL_6:
  -[PXStoryValidationController setTimelineToValidate:](self, "setTimelineToValidate:", v5);

}

- (void)_invalidateTimelineValidation
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTimelineValidation);

}

- (void)_updateTimelineValidation
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  PXStoryValidationController *v10;
  id v11;
  id location;

  if (-[PXStoryValidationController isActive](self, "isActive"))
  {
    -[PXStoryValidationController timelineToValidate](self, "timelineToValidate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      -[PXStoryValidationController workQueue](self, "workQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__PXStoryValidationController__updateTimelineValidation__block_invoke;
      block[3] = &unk_1E51429B8;
      v6 = v4;
      v8 = v6;
      v9 = v3;
      v10 = self;
      objc_copyWeak(&v11, &location);
      dispatch_async(v5, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      v6 = 0;
    }
    -[PXStoryValidationController setTimelineValidationProgress:](self, "setTimelineValidationProgress:", v6);

  }
}

- (void)_handleTimelineValidationError:(id)a3 progress:(id)a4
{
  id v6;

  v6 = a3;
  if ((objc_msgSend(a4, "isCancelled") & 1) == 0)
  {
    -[PXStoryValidationController setTimelineValidationProgress:](self, "setTimelineValidationProgress:", 0);
    -[PXStoryValidationController setTimelineValidationError:](self, "setTimelineValidationError:", v6);
    -[PXStoryValidationController setTimelineValidationCount:](self, "setTimelineValidationCount:", -[PXStoryValidationController timelineValidationCount](self, "timelineValidationCount") + 1);
  }

}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[PXStoryValidationController isActive](self, "isActive"))
  {
    -[PXStoryValidationController timelineToValidate](self, "timelineToValidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PXStoryValidationController timelineValidationProgress](self, "timelineValidationProgress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = CFSTR("Validating…");
      }
      else
      {
        -[PXStoryValidationController timelineValidationError](self, "timelineValidationError");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_alloc(MEMORY[0x1E0CB3940]);
        v11 = v10;
        if (v9)
        {
          -[PXStoryValidationController timelineValidationError](self, "timelineValidationError");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          PXStoryErrorDetailsDescription(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (__CFString *)objc_msgSend(v11, "initWithFormat:", CFSTR("❌ %@"), v13);

        }
        else
        {
          v8 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR("✅"));
        }
      }
    }
    else
    {
      v8 = CFSTR("Waiting…");
    }
    objc_msgSend(v5, "appendFormat:", CFSTR("Timeline: %@\n"), v8);
    objc_msgSend(v5, "appendFormat:", CFSTR("Validation Count: %li\n"), -[PXStoryValidationController timelineValidationCount](self, "timelineValidationCount"));

  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("⚠️ Inactive"));
  }
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  -[PXStoryValidationController timelineValidationError](self, "timelineValidationError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("TimelineValidation"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (void)handleModelChange:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXStoryValidationController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  if ((v3 & 0x40) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__PXStoryValidationController_handleModelChange___block_invoke;
    v5[3] = &unk_1E511D588;
    v5[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v5);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[5];

  v8 = a3;
  if ((void *)ModelObservationContext_47851 == a5)
  {
    if ((a4 & 0x20000010) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __60__PXStoryValidationController_observable_didChange_context___block_invoke;
      v10[3] = &unk_1E511D588;
      v10[4] = self;
      -[PXStoryController performChanges:](self, "performChanges:", v10);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryValidationController;
    -[PXStoryController observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (PXStoryViewModel)viewModel
{
  return (PXStoryViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryTimeline)timelineToValidate
{
  return self->_timelineToValidate;
}

- (NSProgress)timelineValidationProgress
{
  return self->_timelineValidationProgress;
}

- (NSError)timelineValidationError
{
  return self->_timelineValidationError;
}

- (int64_t)timelineValidationCount
{
  return self->_timelineValidationCount;
}

- (void)setTimelineValidationCount:(int64_t)a3
{
  self->_timelineValidationCount = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timelineValidationError, 0);
  objc_storeStrong((id *)&self->_timelineValidationProgress, 0);
  objc_storeStrong((id *)&self->_timelineToValidate, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

uint64_t __60__PXStoryValidationController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTimelineToValidate");
}

uint64_t __49__PXStoryValidationController_handleModelChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateModel");
}

void __56__PXStoryValidationController__updateTimelineValidation__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    +[PXStoryValidationController _validateTimeline:progress:](PXStoryValidationController, "_validateTimeline:progress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "storyQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PXStoryValidationController__updateTimelineValidation__block_invoke_2;
    block[3] = &unk_1E5147B18;
    objc_copyWeak(&v8, (id *)(a1 + 56));
    v6 = v2;
    v7 = *(id *)(a1 + 32);
    v4 = v2;
    dispatch_async(v3, block);

    objc_destroyWeak(&v8);
  }
}

void __56__PXStoryValidationController__updateTimelineValidation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleTimelineValidationError:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __49__PXStoryValidationController_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 16);
}

uint64_t __49__PXStoryValidationController_initWithViewModel___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateModel");
}

+ (id)_validateTimeline:(id)a3 progress:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD v33[3];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "size");
  PXRectWithOriginAndSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (v4)
    objc_msgSend(v4, "timeRange");
  else
    memset(v33, 0, sizeof(v33));
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke;
  v26[3] = &unk_1E51252D8;
  v14 = v5;
  v27 = v14;
  v28 = v4;
  v29 = v7;
  v30 = v9;
  v31 = v11;
  v32 = v13;
  v15 = v4;
  objc_msgSend(v15, "enumerateSegmentsInTimeRange:usingBlock:", v33, v26);
  if (objc_msgSend(v14, "count"))
  {
    v16 = objc_msgSend(v14, "count");
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeDebugFormat(21, CFSTR("%li cinematic validation issues:\n%@"), v17, v18, v19, v20, v21, v22, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __58__PXStoryValidationController__validateTimeline_progress___block_invoke(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t i;
  uint64_t v7;
  _QWORD *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  void (*v12)(_QWORD *, uint64_t, __int128 *, _QWORD);
  void *v13;
  uint64_t v14;
  void (*v15)(_QWORD *, uint64_t, _OWORD *, uint64_t);
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _QWORD v34[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD aBlock[4];
  id v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = 0;
  v46 = PXStoryTransitionInfoNone;
  v47 = xmmword_1A7C0B7D8;
  if (a2 >= 1)
  {
    for (i = 0; i != a2; ++i)
    {
      v7 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_2;
      aBlock[3] = &unk_1E511D5D8;
      v44 = *(id *)(a1 + 32);
      v45 = i;
      v8 = _Block_copy(aBlock);
      v9 = a3[1];
      v21 = *a3;
      v22 = v9;
      v23 = a3[2];
      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v42 = 0;
      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v38 = 0;
      v10 = *(void **)(a1 + 40);
      v34[0] = v7;
      v34[1] = 3221225472;
      v34[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_6;
      v34[3] = &unk_1E511D600;
      v34[4] = &v39;
      v34[5] = &v35;
      objc_msgSend(v10, "enumerateClipsInTimeRange:rect:usingBlock:", &v21, v34, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
      if (v40[3] == 1)
        v11 = v36[3];
      else
        v11 = 0;
      v12 = (void (*)(_QWORD *, uint64_t, __int128 *, _QWORD))v8[2];
      v21 = v46;
      v22 = v47;
      *(_QWORD *)&v23 = v48;
      v12(v8, v11, &v21, 0);
      v33 = 0;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v13 = *(void **)(a1 + 40);
      v14 = objc_msgSend(v13, "identifierForSegmentAtIndex:", i);
      if (v13)
      {
        objc_msgSend(v13, "infoForSegmentWithIdentifier:", v14);
      }
      else
      {
        v33 = 0;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
      }
      v18 = v24;
      v19 = v25;
      v20 = v26;
      v15 = (void (*)(_QWORD *, uint64_t, _OWORD *, uint64_t))v8[2];
      v16[0] = v24;
      v16[1] = v25;
      v17 = v26;
      v15(v8, v11, v16, 1);
      v46 = v18;
      v47 = v19;
      v48 = v20;
      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(&v39, 8);

      a3 += 3;
    }
  }
}

void __58__PXStoryValidationController__validateTimeline_progress___block_invoke_2(uint64_t a1, uint64_t a2, unsigned __int8 *a3, char a4)
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[4];
  id v23;
  uint64_t v24;
  char v25;

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_3;
  aBlock[3] = &unk_1E511D5B0;
  v9 = *(id *)(a1 + 32);
  v25 = a4;
  v10 = *(_QWORD *)(a1 + 40);
  v23 = v9;
  v24 = v10;
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_4;
  v20[3] = &unk_1E5148A40;
  v11 = _Block_copy(aBlock);
  v21 = v11;
  v12 = _Block_copy(v20);
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_5;
  v18[3] = &unk_1E5148A40;
  v19 = v11;
  v13 = v11;
  v14 = _Block_copy(v18);
  v15 = v14;
  if (*a3 <= 0xAuLL)
  {
    switch(*a3)
    {
      case 5u:
        switch(a3[29])
        {
          case 1u:
            if ((unint64_t)(a2 - 6) < 2)
              goto LABEL_27;
            v14 = v12;
            if (a2 == 5)
              goto LABEL_27;
            break;
          case 2u:
            if ((unint64_t)(a2 - 6) < 2)
              goto LABEL_27;
            v14 = v12;
            if (a2 == 4)
              goto LABEL_27;
            break;
          case 3u:
            if ((unint64_t)(a2 - 4) < 2)
              goto LABEL_27;
            v14 = v12;
            if (a2 == 7)
              goto LABEL_27;
            break;
          case 4u:
            if ((unint64_t)(a2 - 4) < 2)
              goto LABEL_27;
            v14 = v12;
            if (a2 == 6)
              goto LABEL_27;
            break;
          default:
            goto LABEL_28;
        }
        break;
      case 6u:
      case 9u:
        v16 = (char)a3[29];
        if (v16 == 2)
        {
          v14 = v12;
          if (a2 == 2)
            goto LABEL_27;
        }
        else if (v16 == 1)
        {
          v14 = v12;
          if (a2 == 3)
            goto LABEL_27;
        }
        break;
      case 7u:
        v17 = (char)a3[29];
        if (v17 == 2)
        {
          v14 = v12;
          if ((unint64_t)(a2 - 11) > 2)
            break;
        }
        else
        {
          if (v17 != 1)
            break;
          v14 = v12;
          if ((unint64_t)(a2 - 8) >= 3)
            break;
        }
LABEL_27:
        (*((void (**)(void))v14 + 2))();
        break;
      default:
        break;
    }
  }
LABEL_28:

}

uint64_t __58__PXStoryValidationController__validateTimeline_progress___block_invoke_6(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13[7];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a2 >= 1)
  {
    v15 = v5;
    v16 = v6;
    v8 = a2;
    v9 = result;
    do
    {
      if (*(_QWORD *)(a5 + 8) == 1)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 32) + 8) + 24);
        v10 = *(_OWORD *)(a5 + 632);
        v13[4] = *(_OWORD *)(a5 + 616);
        v13[5] = v10;
        v13[6] = *(_OWORD *)(a5 + 648);
        v14 = *(_QWORD *)(a5 + 664);
        v11 = *(_OWORD *)(a5 + 568);
        v13[0] = *(_OWORD *)(a5 + 552);
        v13[1] = v11;
        v12 = *(_OWORD *)(a5 + 600);
        v13[2] = *(_OWORD *)(a5 + 584);
        v13[3] = v12;
        result = PXStoryClipKenBurnsAnimationInfoGetMovementType(v13);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 40) + 8) + 24) = result;
      }
      a5 += 768;
      --v8;
    }
    while (v8);
  }
  return result;
}

void __58__PXStoryValidationController__validateTimeline_progress___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  objc_class *v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a2;
  v6 = [v4 alloc];
  v7 = CFSTR("after");
  if (!*(_BYTE *)(a1 + 48))
    v7 = CFSTR("before");
  v8 = (id)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ (%@ segment #%li)"), v5, v7, *(_QWORD *)(a1 + 40));

  objc_msgSend(v3, "addObject:", v8);
}

uint64_t __58__PXStoryValidationController__validateTimeline_progress___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__PXStoryValidationController__validateTimeline_progress___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

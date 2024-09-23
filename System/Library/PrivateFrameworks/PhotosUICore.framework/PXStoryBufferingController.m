@implementation PXStoryBufferingController

- (PXStoryBufferingController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryBufferingController.m"), 88, CFSTR("%s is not available as initializer"), "-[PXStoryBufferingController initWithObservableModel:]");

  abort();
}

- (PXStoryBufferingController)initWithModel:(id)a3
{
  id v4;
  PXStoryBufferingController *v5;
  PXStoryBufferingController *v6;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *bufferingReasonsStore;
  $175F2685EF764341F5DD80B75CC65478 *v9;
  uint64_t v10;
  _QWORD *p_var0;
  _QWORD v13[4];
  PXStoryBufferingController *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryBufferingController;
  v5 = -[PXStoryController initWithObservableModel:](&v15, sel_initWithObservableModel_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    bufferingReasonsStore = v6->_bufferingReasonsStore;
    v6->_bufferingReasonsStore = v7;

    v9 = ($175F2685EF764341F5DD80B75CC65478 *)malloc_type_malloc(0x40uLL, 0x1000040451B5BE8uLL);
    v10 = 0;
    v6->_bufferingDurationsPerReason = v9;
    do
    {
      p_var0 = (_QWORD *)&v6->_bufferingDurationsPerReason[v10].var0;
      *p_var0 = 0;
      p_var0[1] = 0;
      ++v10;
    }
    while (v10 != 4);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__PXStoryBufferingController_initWithModel___block_invoke;
    v13[3] = &unk_1E5135D50;
    v14 = v6;
    -[PXStoryController performChanges:](v14, "performChanges:", v13);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_bufferingDurationsPerReason);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryBufferingController;
  -[PXStoryBufferingController dealloc](&v3, sel_dealloc);
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryBufferingController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateOverallReadinessStatus, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateModelProperties);

}

- (void)setIsActive:(BOOL)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    if (a3)
    {
      -[PXStoryBufferingController log](self, "log");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = os_signpost_id_make_with_pointer(v4, self);
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v6 = v5;
        if (os_signpost_enabled(v4))
        {
          v7 = 134217984;
          v8 = -[PXStoryBufferingController logContext](self, "logContext");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_EVENT, v6, "PXStoryBufferingControllerIsActive", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v7, 0xCu);
        }
      }

      self->_activatedTime = mach_absolute_time();
    }
    -[PXStoryBufferingController _invalidateOverallReadinessStatus](self, "_invalidateOverallReadinessStatus");
  }
}

- (double)totalBufferingTimeInterval
{
  $CC1E7D1A50A87664DAE4296FAD1A1368 *p_overallBufferingDuration;
  uint64_t v3;
  double previousDuration;
  unint64_t currentStartTime;
  double v6;
  double v7;
  double v8;

  p_overallBufferingDuration = &self->_overallBufferingDuration;
  v3 = mach_absolute_time();
  previousDuration = p_overallBufferingDuration->previousDuration;
  currentStartTime = p_overallBufferingDuration->currentStartTime;
  if (currentStartTime)
  {
    v6 = (double)(uint64_t)(v3 - currentStartTime);
    PXTimebaseConversionFactor();
    v8 = v7 * v6;
  }
  else
  {
    v8 = 0.0;
  }
  return previousDuration + v8;
}

- (double)lastNoncriticalBufferingDuration
{
  $CC1E7D1A50A87664DAE4296FAD1A1368 *p_lastNoncriticalBufferingDurationStore;
  uint64_t v3;
  double previousDuration;
  unint64_t currentStartTime;
  double v6;
  double v7;
  double v8;

  p_lastNoncriticalBufferingDurationStore = &self->_lastNoncriticalBufferingDurationStore;
  v3 = mach_absolute_time();
  previousDuration = p_lastNoncriticalBufferingDurationStore->previousDuration;
  currentStartTime = p_lastNoncriticalBufferingDurationStore->currentStartTime;
  if (currentStartTime)
  {
    v6 = (double)(uint64_t)(v3 - currentStartTime);
    PXTimebaseConversionFactor();
    v8 = v7 * v6;
  }
  else
  {
    v8 = 0.0;
  }
  return previousDuration + v8;
}

- (double)lastCriticalBufferingDuration
{
  $CC1E7D1A50A87664DAE4296FAD1A1368 *p_lastCriticalBufferingDurationStore;
  uint64_t v3;
  double previousDuration;
  unint64_t currentStartTime;
  double v6;
  double v7;
  double v8;

  p_lastCriticalBufferingDurationStore = &self->_lastCriticalBufferingDurationStore;
  v3 = mach_absolute_time();
  previousDuration = p_lastCriticalBufferingDurationStore->previousDuration;
  currentStartTime = p_lastCriticalBufferingDurationStore->currentStartTime;
  if (currentStartTime)
  {
    v6 = (double)(uint64_t)(v3 - currentStartTime);
    PXTimebaseConversionFactor();
    v8 = v7 * v6;
  }
  else
  {
    v8 = 0.0;
  }
  return previousDuration + v8;
}

- (NSIndexSet)bufferingReasons
{
  void *v2;
  void *v3;

  -[PXStoryBufferingController bufferingReasonsStore](self, "bufferingReasonsStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSIndexSet *)v3;
}

- (NSDictionary)totalBufferingTimeIntervalsPerReason
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  $175F2685EF764341F5DD80B75CC65478 *v7;
  double var0;
  unint64_t var1;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = mach_absolute_time();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = 0;
  for (i = 0; i != 4; ++i)
  {
    v7 = &self->_bufferingDurationsPerReason[v5];
    var0 = v7->var0;
    var1 = v7->var1;
    if (var1)
    {
      v10 = (double)(uint64_t)(v3 - var1);
      PXTimebaseConversionFactor();
      v12 = v11 * v10;
    }
    else
    {
      v12 = 0.0;
    }
    if (var0 + v12 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

    }
    ++v5;
  }
  v15 = (void *)objc_msgSend(v4, "copy");

  return (NSDictionary *)v15;
}

- (void)handleModelChange:(unint64_t)a3
{
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryBufferingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PXStoryBufferingController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5135D78;
  v5[4] = self;
  v5[5] = a3;
  -[PXStoryController performChanges:](self, "performChanges:", v5);
}

- (void)_invalidateOverallReadinessStatus
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateOverallReadinessStatus);

}

- (void)_updateOverallReadinessStatus
{
  char v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t activatedTime;
  double v13;
  char v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  BOOL v19;
  id v20;

  if (-[PXStoryBufferingController isActive](self, "isActive"))
  {
    -[PXStoryBufferingController model](self, "model");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v20, "isExporting");
    v4 = objc_msgSend(v20, "contentReadinessStatus");
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v20, "activeSongResource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 3;
      if (v5)
        v7 = 3;
      else
        v7 = 1;

      v8 = objc_msgSend(v20, "timelineAttributes") & 2 | 1;
    }
    else
    {
      v8 = 3;
      if (objc_msgSend(v20, "musicReadinessStatus"))
        v6 = 3;
      else
        v6 = 1;
      v7 = objc_msgSend(v20, "musicReadinessStatus");
      if ((objc_msgSend(v20, "timelineAttributes") & 1) == 0)
        v8 = 1;
    }
    -[PXStoryBufferingController _accountForReason:status:](self, "_accountForReason:status:", 0, v6);
    -[PXStoryBufferingController _accountForReason:status:](self, "_accountForReason:status:", 1, v7);
    -[PXStoryBufferingController _accountForReason:status:](self, "_accountForReason:status:", 3, v8);
    -[PXStoryBufferingController _accountForReason:status:](self, "_accountForReason:status:", 2, v4);
    v9 = PXStoryPlaybackReadinessStatusCombine(v4, v7);
    v10 = PXStoryPlaybackReadinessStatusCombine(v9, v8);
    v11 = mach_absolute_time();
    activatedTime = self->_activatedTime;
    PXTimebaseConversionFactor();
    if (v10 > 1)
    {
      v14 = 1;
    }
    else
    {
      v10 = 1;
      v14 = v3;
    }
    if ((v14 & 1) == 0)
    {
      v15 = v13;
      v16 = objc_msgSend(v20, "currentSegmentIdentifier");
      objc_msgSend(v20, "timeline");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == objc_msgSend(v17, "firstSegmentIdentifier"))
      {
        -[PXStoryBufferingController noncriticalBufferingTimeout](self, "noncriticalBufferingTimeout");
        v19 = v15 * (double)(uint64_t)(v11 - activatedTime) < v18;

        if (v19)
          v10 = 2;
      }
      else
      {

      }
    }
    -[PXStoryBufferingController setOverallReadinessStatus:](self, "setOverallReadinessStatus:", v10);
    -[PXStoryBufferingController setIsBuffering:](self, "setIsBuffering:", v10 != 3);

  }
}

- (void)_invalidateModelProperties
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateModelProperties);

}

- (void)_updateModelProperties
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryBufferingController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PXStoryBufferingController__updateModelProperties__block_invoke;
  v4[3] = &unk_1E5142E50;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_accountForReason:(int64_t)a3 status:(int64_t)a4
{
  void *v7;
  void *v8;
  $175F2685EF764341F5DD80B75CC65478 *v9;
  uint64_t v10;
  double var0;
  unint64_t var1;
  double v13;
  double v14;
  double v15;
  $175F2685EF764341F5DD80B75CC65478 *v16;
  unint64_t *p_var1;
  unint64_t v18;

  -[PXStoryBufferingController bufferingReasonsStore](self, "bufferingReasonsStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 3)
  {
    objc_msgSend(v7, "removeIndex:", a3);

    v9 = &self->_bufferingDurationsPerReason[a3];
    v10 = mach_absolute_time();
    var0 = v9->var0;
    var1 = v9->var1;
    if (var1)
    {
      v13 = (double)(uint64_t)(v10 - var1);
      PXTimebaseConversionFactor();
      v15 = v14 * v13;
    }
    else
    {
      v15 = 0.0;
    }
    v9->var0 = var0 + v15;
    v9->var1 = 0;
  }
  else
  {
    objc_msgSend(v7, "addIndex:", a3);

    if (a4)
    {
      v16 = &self->_bufferingDurationsPerReason[a3];
      v18 = v16->var1;
      p_var1 = &v16->var1;
      if (!v18)
        *p_var1 = mach_absolute_time();
    }
  }
}

- (void)setIsBuffering:(BOOL)a3
{
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void (**v12)(void);
  _QWORD v13[4];
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_isBuffering != a3)
  {
    self->_isBuffering = a3;
    if (a3)
    {
      -[PXStoryBufferingController log](self, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = -[PXStoryBufferingController logContext](self, "logContext");
      v6 = os_signpost_id_make_with_pointer(v4, self);
      v7 = v4;
      v8 = v7;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_DWORD *)buf = 134217984;
        v19 = v5;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PXStoryBufferingController.PlaybackBuffering", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }

      v9 = objc_msgSend(MEMORY[0x1E0D09910], "startSignpost");
      PLStoryGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Buffering started", buf, 2u);
      }

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __45__PXStoryBufferingController_setIsBuffering___block_invoke;
      v13[3] = &unk_1E51446C8;
      v14 = v8;
      v15 = v6;
      v16 = v5;
      v17 = v9;
      v11 = v8;
      -[PXStoryBufferingController setOnBufferingEnd:](self, "setOnBufferingEnd:", v13);

    }
    else
    {
      -[PXStoryBufferingController onBufferingEnd](self, "onBufferingEnd");
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v12[2]();

      -[PXStoryBufferingController setOnBufferingEnd:](self, "setOnBufferingEnd:", 0);
    }
  }
}

- (void)setOverallReadinessStatus:(int64_t)a3
{
  int64_t overallReadinessStatus;
  $CC1E7D1A50A87664DAE4296FAD1A1368 *p_overallBufferingDuration;
  uint64_t v6;
  double previousDuration;
  unint64_t currentStartTime;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  unint64_t activatedTime;
  double v14;
  double v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (**v23)(void *, uint64_t);
  unsigned int (**v24)(void *, uint64_t);
  double v25;
  dispatch_time_t v26;
  NSObject *v27;
  uint64_t v28;
  double v29;
  unint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  $CC1E7D1A50A87664DAE4296FAD1A1368 *p_lastCriticalBufferingDurationStore;
  double v36;
  unint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  _QWORD block[4];
  id v42;
  _QWORD v43[6];
  _QWORD aBlock[6];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  overallReadinessStatus = self->_overallReadinessStatus;
  if (overallReadinessStatus != a3)
  {
    self->_overallReadinessStatus = a3;
    -[PXStoryBufferingController _invalidateModelProperties](self, "_invalidateModelProperties");
    a3 = self->_overallReadinessStatus;
  }
  p_overallBufferingDuration = &self->_overallBufferingDuration;
  if (a3 == 3)
  {
    v6 = mach_absolute_time();
    previousDuration = p_overallBufferingDuration->previousDuration;
    currentStartTime = self->_overallBufferingDuration.currentStartTime;
    if (currentStartTime)
    {
      v9 = (double)(uint64_t)(v6 - currentStartTime);
      PXTimebaseConversionFactor();
      v11 = v10 * v9;
    }
    else
    {
      v11 = 0.0;
    }
    p_overallBufferingDuration->previousDuration = previousDuration + v11;
    self->_overallBufferingDuration.currentStartTime = 0;
  }
  else
  {
    if (!self->_overallBufferingDuration.currentStartTime)
      self->_overallBufferingDuration.currentStartTime = mach_absolute_time();
    v12 = mach_absolute_time();
    activatedTime = self->_activatedTime;
    PXTimebaseConversionFactor();
    v15 = v14;
    -[PXStoryBufferingController log](self, "log");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_make_with_pointer(v16, self);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v18 = v17;
      if (os_signpost_enabled(v16))
      {
        v19 = v15 * (double)(uint64_t)(v12 - activatedTime);
        v20 = -[PXStoryBufferingController logContext](self, "logContext");
        -[PXStoryBufferingController totalBufferingTimeInterval](self, "totalBufferingTimeInterval");
        *(_DWORD *)buf = 134218496;
        v46 = v20;
        v47 = 2048;
        v48 = v21;
        v49 = 2048;
        v50 = v19;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_EVENT, v18, "PXStoryBufferingControllerTimeFromActivation", "Context=%{signpost.telemetry:string2}lu totalBufferingTimeInterval=%f \nfromActivation=%f", buf, 0x20u);
      }
    }

  }
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke;
  aBlock[3] = &unk_1E5135DA0;
  aBlock[4] = self;
  aBlock[5] = overallReadinessStatus;
  v23 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
  v43[0] = v22;
  v43[1] = 3221225472;
  v43[2] = __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_2;
  v43[3] = &unk_1E5135DA0;
  v43[4] = self;
  v43[5] = overallReadinessStatus;
  v24 = (unsigned int (**)(void *, uint64_t))_Block_copy(v43);
  if (v23[2](v23, 2))
  {
    self->_lastNoncriticalBufferingDurationStore.previousDuration = 0.0;
    self->_lastNoncriticalBufferingDurationStore.currentStartTime = 0;
    self->_lastNoncriticalBufferingDurationStore.currentStartTime = mach_absolute_time();
    objc_initWeak((id *)buf, self);
    -[PXStoryBufferingController noncriticalBufferingTimeout](self, "noncriticalBufferingTimeout");
    v26 = dispatch_time(0, (uint64_t)(v25 * 1000000000.0));
    -[PXStoryController storyQueue](self, "storyQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_3;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v42, (id *)buf);
    dispatch_after(v26, v27, block);

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);
  }
  else if (v24[2](v24, 2))
  {
    v28 = mach_absolute_time();
    v29 = self->_lastNoncriticalBufferingDurationStore.previousDuration;
    v30 = self->_lastNoncriticalBufferingDurationStore.currentStartTime;
    if (v30)
    {
      v31 = v28;
      PXTimebaseConversionFactor();
      v33 = v32 * (double)(uint64_t)(v31 - v30);
    }
    else
    {
      v33 = 0.0;
    }
    self->_lastNoncriticalBufferingDurationStore.previousDuration = v29 + v33;
    self->_lastNoncriticalBufferingDurationStore.currentStartTime = 0;
  }
  if (v23[2](v23, 1))
  {
    self->_lastCriticalBufferingDurationStore.previousDuration = 0.0;
    self->_lastCriticalBufferingDurationStore.currentStartTime = 0;
    self->_lastCriticalBufferingDurationStore.currentStartTime = mach_absolute_time();
  }
  else if (v24[2](v24, 1))
  {
    v34 = mach_absolute_time();
    p_lastCriticalBufferingDurationStore = &self->_lastCriticalBufferingDurationStore;
    v36 = p_lastCriticalBufferingDurationStore->previousDuration;
    v37 = p_lastCriticalBufferingDurationStore->currentStartTime;
    if (v37)
    {
      v38 = v34;
      PXTimebaseConversionFactor();
      v40 = v39 * (double)(uint64_t)(v38 - v37);
    }
    else
    {
      v40 = 0.0;
    }
    p_lastCriticalBufferingDurationStore->previousDuration = v36 + v40;
    p_lastCriticalBufferingDurationStore->currentStartTime = 0;
  }

}

- (double)noncriticalBufferingTimeout
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PXStoryBufferingController model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noncriticalBufferingTimeout");
  v5 = v4;

  return v5;
}

- (PXStoryModel)model
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (void)setModel:(id)a3
{
  objc_storeWeak((id *)&self->_model, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)isBuffering
{
  return self->_isBuffering;
}

- (id)onBufferingEnd
{
  return self->_onBufferingEnd;
}

- (void)setOnBufferingEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (int64_t)overallReadinessStatus
{
  return self->_overallReadinessStatus;
}

- (NSMutableIndexSet)bufferingReasonsStore
{
  return self->_bufferingReasonsStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferingReasonsStore, 0);
  objc_storeStrong(&self->_onBufferingEnd, 0);
  objc_destroyWeak((id *)&self->_model);
}

BOOL __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 40) != a2 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) == a2;
}

BOOL __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 40) == a2 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) != a2;
}

void __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_4;
  v3[3] = &unk_1E5135DC8;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "performChanges:", v3);

  objc_destroyWeak(&v4);
}

void __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateOverallReadinessStatus");

}

void __45__PXStoryBufferingController_setIsBuffering___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    v14 = v5;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PXStoryBufferingController.PlaybackBuffering", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0D09910];
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *MEMORY[0x1E0D09708];
  v11 = *MEMORY[0x1E0D09850];
  v12 = CFSTR("com.apple.photos.memory.interactiveMemoryPlaybackBuffering");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endSignpost:forEventName:withPayload:", v7, v8, v9);

  PLStoryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Buffering ended", buf, 2u);
  }

}

void __52__PXStoryBufferingController__updateModelProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setReadinessStatus:", objc_msgSend(v2, "overallReadinessStatus"));

}

uint64_t __48__PXStoryBufferingController_handleModelChange___block_invoke(uint64_t result)
{
  if ((*(_DWORD *)(result + 40) & 0x201004A2) != 0)
    return objc_msgSend(*(id *)(result + 32), "_invalidateOverallReadinessStatus");
  return result;
}

uint64_t __44__PXStoryBufferingController_initWithModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateOverallReadinessStatus");
}

@end

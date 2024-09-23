@implementation PXStoryRelatedController

- (PXStoryRelatedController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedController.m"), 41, CFSTR("%s is not available as initializer"), "-[PXStoryRelatedController initWithObservableModel:]");

  abort();
}

- (PXStoryRelatedController)initWithViewModel:(id)a3
{
  void *v3;
  id v5;
  PXStoryRelatedController *v6;
  PXStoryRelatedController *v7;
  id v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id *v16;
  _QWORD v17[4];
  id *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryRelatedController;
  v6 = -[PXStoryController initWithObservableModel:](&v19, sel_initWithObservableModel_, v5);
  v7 = v6;
  if (v6)
  {
    v8 = objc_storeWeak((id *)&v6->_viewModel, v5);
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__PXStoryRelatedController_initWithViewModel___block_invoke;
    v17[3] = &unk_1E5146E78;
    v10 = v7;
    v18 = v10;
    objc_msgSend(v5, "performChanges:", v17);

    objc_msgSend(v5, "mainConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "relatedProducer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      objc_msgSend(v5, "viewLayoutSpec");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryRelatedProducerCreateDefaultWithTargetUpNextCount(objc_msgSend(v3, "upNextTargetMemoryCount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong(v10 + 19, v13);
    if (!v12)
    {

    }
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __46__PXStoryRelatedController_initWithViewModel___block_invoke_2;
    v15[3] = &unk_1E51351D8;
    v16 = v10;
    objc_msgSend(v16, "performChanges:", v15);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress cancel](self->_progress, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedController;
  -[PXStoryRelatedController dealloc](&v3, sel_dealloc);
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryRelatedController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateMainConfiguration, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateMainModel);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateCanStartProducingRelated);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateRelatedConfigurations);

}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    if (!a3)
      -[PXStoryRelatedController setIsProductionEnabled:](self, "setIsProductionEnabled:", 0);
    -[PXStoryRelatedController _invalidateCanStartProducingRelated](self, "_invalidateCanStartProducingRelated");
  }
}

- (void)setMainConfiguration:(id)a3
{
  PXStoryConfiguration *v5;
  char v6;
  PXStoryConfiguration *v7;

  v7 = (PXStoryConfiguration *)a3;
  v5 = self->_mainConfiguration;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryConfiguration isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mainConfiguration, a3);
      -[PXStoryRelatedController setIsProductionEnabled:](self, "setIsProductionEnabled:", 0);
      -[PXStoryRelatedController setCanStartProducingRelated:](self, "setCanStartProducingRelated:", 0);
      -[PXStoryRelatedController setResult:](self, "setResult:", 0);
    }
  }

}

- (void)setMainModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *mainModel;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](mainModel, "unregisterChangeObserver:context:", self, MainModelObservationContext_201117);
    objc_storeStrong((id *)&self->_mainModel, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_mainModel, "registerChangeObserver:context:", self, MainModelObservationContext_201117);
    -[PXStoryRelatedController _invalidateCanStartProducingRelated](self, "_invalidateCanStartProducingRelated");
    v5 = v7;
  }

}

- (void)setCanStartProducingRelated:(BOOL)a3
{
  if (self->_canStartProducingRelated != a3)
  {
    self->_canStartProducingRelated = a3;
    -[PXStoryRelatedController signalChange:](self, "signalChange:", 1);
    if (self->_canStartProducingRelated)
      -[PXStoryRelatedController setIsProductionEnabled:](self, "setIsProductionEnabled:", 1);
  }
}

- (void)setIsProductionEnabled:(BOOL)a3
{
  if (self->_isProductionEnabled != a3)
  {
    self->_isProductionEnabled = a3;
    -[PXStoryRelatedController signalChange:](self, "signalChange:", 2);
    -[PXStoryRelatedController _invalidateRelatedConfigurations](self, "_invalidateRelatedConfigurations");
  }
}

- (void)setProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *progress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](progress, "cancel");
    objc_storeStrong((id *)&self->_progress, a3);
    -[PXStoryRelatedController signalChange:](self, "signalChange:", 4);
    v5 = v7;
  }

}

- (void)setResult:(id)a3
{
  PXStoryProducerResult *v5;
  id *p_result;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (PXStoryProducerResult *)a3;
  p_result = (id *)&self->_result;
  if (self->_result != v5)
  {
    objc_storeStrong((id *)&self->_result, a3);
    PLStoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *p_result;
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "related results: %@", buf, 0xCu);
    }

    -[PXStoryRelatedController signalChange:](self, "signalChange:", 8);
    objc_msgSend(*p_result, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "storyConfigurations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRelatedController viewModel](self, "viewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __38__PXStoryRelatedController_setResult___block_invoke;
      v14[3] = &unk_1E5146E78;
      v15 = v11;
      v13 = v11;
      objc_msgSend(v12, "performChanges:", v14);

    }
  }

}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
  NSSet *v4;
  NSSet *recentlyUsedFlexSongIDs;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  recentlyUsedFlexSongIDs = self->_recentlyUsedFlexSongIDs;
  self->_recentlyUsedFlexSongIDs = v4;

}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
  NSSet *v4;
  NSSet *recentlyUsedAppleMusicSongIDs;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  recentlyUsedAppleMusicSongIDs = self->_recentlyUsedAppleMusicSongIDs;
  self->_recentlyUsedAppleMusicSongIDs = v4;

}

- (void)_invalidateMainConfiguration
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainConfiguration);

}

- (void)_updateMainConfiguration
{
  void *v3;
  id v4;

  -[PXStoryRelatedController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRelatedController setMainConfiguration:](self, "setMainConfiguration:", v3);

}

- (void)_invalidateMainModel
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainModel);

}

- (void)_updateMainModel
{
  void *v3;
  id v4;

  -[PXStoryRelatedController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRelatedController setMainModel:](self, "setMainModel:", v3);

}

- (void)_invalidateCanStartProducingRelated
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCanStartProducingRelated);

}

- (void)_updateCanStartProducingRelated
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  id v11;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXStoryRelatedController isActive](self, "isActive")
    && (-[PXStoryRelatedController viewModel](self, "viewModel"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "playbackFractionCompleted"),
        v5 = v4,
        objc_msgSend(v11, "relatedProductionPlaybackFractionCompletedThreshold"),
        v7 = v6,
        v3,
        v5 > v7))
  {
    if ((objc_msgSend(v11, "allowRelatedProductionBeforeReadyToPlay") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[PXStoryRelatedController mainModel](self, "mainModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "readinessStatus");

      v8 = v10 == 3;
    }
  }
  else
  {
    v8 = 0;
  }
  -[PXStoryRelatedController setCanStartProducingRelated:](self, "setCanStartProducingRelated:", v8);

}

- (void)_invalidateRelatedConfigurations
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRelatedConfigurations);

}

- (void)_updateRelatedConfigurations
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  PXStoryRelatedMusicCurationParameters *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  NSObject *v26;
  id v27;
  uint64_t *v28;
  id v29[4];
  id location;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__201074;
  v35 = __Block_byref_object_dispose__201075;
  v36 = 0;
  -[PXStoryRelatedController mainConfiguration](self, "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXStoryRelatedController isProductionEnabled](self, "isProductionEnabled");
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  if (v5)
  {
    -[PXStoryRelatedController result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v9 = v8;
      -[PXStoryController storyQueue](self, "storyQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      -[PXStoryRelatedController log](self, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)-[PXStoryRelatedController logContext](self, "logContext");
      v13 = (char *)os_signpost_id_make_with_pointer(v11, self);
      v14 = v11;
      v15 = v14;
      if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 134217984;
        v38 = v12;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "PXStoryRelatedControllerProduction", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }

      v16 = objc_alloc_init(PXStoryRelatedMusicCurationParameters);
      -[PXStoryRelatedController recentlyUsedFlexSongIDs](self, "recentlyUsedFlexSongIDs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRelatedMusicCurationParameters setRecentlyUsedFlexSongIDs:](v16, "setRecentlyUsedFlexSongIDs:", v17);

      -[PXStoryRelatedController recentlyUsedAppleMusicSongIDs](self, "recentlyUsedAppleMusicSongIDs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRelatedMusicCurationParameters setRecentlyUsedAppleMusicSongIDs:](v16, "setRecentlyUsedAppleMusicSongIDs:", v18);

      -[PXStoryRelatedController relatedProducer](self, "relatedProducer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke;
      v24[3] = &unk_1E5135250;
      v29[1] = v9;
      v25 = v3;
      v20 = v15;
      v26 = v20;
      v29[2] = v13;
      v29[3] = v12;
      v21 = v10;
      v27 = v21;
      v28 = &v31;
      objc_copyWeak(v29, &location);
      objc_msgSend(v19, "requestConfigurationsRelatedToConfiguration:withOptions:musicCurationParameters:resultHandler:", v25, 2, v16, v24);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v32[5];
      v32[5] = v22;

      objc_destroyWeak(v29);
      objc_destroyWeak(&location);

    }
  }
  -[PXStoryRelatedController setProgress:](self, "setProgress:", v32[5]);

  _Block_object_dispose(&v31, 8);
}

- (void)_handleResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PXStoryRelatedController__handleResult___block_invoke;
  v6[3] = &unk_1E5135278;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXStoryController performChanges:](self, "performChanges:", v6);

}

- (void)handleModelChange:(unint64_t)a3
{
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryRelatedController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PXStoryRelatedController_handleModelChange___block_invoke;
  v5[3] = &unk_1E51352A0;
  v5[4] = self;
  v5[5] = a3;
  -[PXStoryController performChanges:](self, "performChanges:", v5);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  objc_super v5;
  _QWORD v6[6];

  if ((void *)MainModelObservationContext_201117 == a5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__PXStoryRelatedController_observable_didChange_context___block_invoke;
    v6[3] = &unk_1E51352A0;
    v6[4] = self;
    v6[5] = a4;
    -[PXStoryController performChanges:](self, "performChanges:", v6);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXStoryRelatedController;
    -[PXStoryController observable:didChange:context:](&v5, sel_observable_didChange_context_, a3, a4);
  }
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  PXStoryDurationFormatter *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXStoryRelatedController relatedProducer](self, "relatedProducer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Producer: %@\n"), v8);

  -[PXStoryRelatedController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "wantsRelatedOverlayVisible"))
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  objc_msgSend(v9, "relatedOverlayVisibilityFraction");
  objc_msgSend(v5, "appendFormat:", CFSTR("Wants Overlay: %@ (Opacity: %0.0f%%)\n"), v10, v11 * 100.0);
  -[PXStoryRelatedController result](self, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("Failed: ❌ %@\n"), v16);
    }
    else
    {
      objc_msgSend(v13, "object");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      if (v19)
      {
        objc_msgSend(v19, "storyConfigurations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("Result: ✅ %lu\n"), objc_msgSend(v20, "count"));
        v21 = objc_alloc_init(PXStoryDurationFormatter);
        objc_msgSend(v13, "productionDuration");
        -[PXStoryDurationFormatter stringFromTimeInterval:](v21, "stringFromTimeInterval:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\t%@\n"), v22);

        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __65__PXStoryRelatedController_diagnosticTextForHUDType_displaySize___block_invoke;
        v27[3] = &unk_1E51352E8;
        v23 = v5;
        v28 = v23;
        objc_msgSend(v20, "enumerateObjectsUsingBlock:", v27);
        objc_msgSend(v16, "debugInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "appendFormat:", CFSTR("Debug Info: %@\n"), v24);

      }
      else
      {
        objc_msgSend(v5, "appendString:", CFSTR("Result: ❌ None \n"));
      }
    }

  }
  else
  {
    -[PXStoryRelatedController progress](self, "progress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = CFSTR("Loading…\n");
    }
    else if (-[PXStoryRelatedController isActive](self, "isActive"))
    {
      if (-[PXStoryRelatedController canStartProducingRelated](self, "canStartProducingRelated"))
        v18 = CFSTR("❌ Unexpected state\n");
      else
        v18 = CFSTR("Waiting…\n");
    }
    else
    {
      v18 = CFSTR("Inactive\n");
    }
    objc_msgSend(v5, "appendString:", v18);
  }
  v25 = (void *)objc_msgSend(v5, "copy");

  return v25;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  -[PXStoryRelatedController result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Related"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (id)detailedDebugInformation
{
  dispatch_group_t v3;
  void *v4;
  PXStoryRelatedMusicCurationParameters *v5;
  void *v6;
  NSObject *v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  __CFString *v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__201074;
  v19 = __Block_byref_object_dispose__201075;
  v20 = CFSTR("{error: \"Debug info could not be fetched in time\"}");
  v3 = dispatch_group_create();
  -[PXStoryRelatedController mainConfiguration](self, "mainConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(PXStoryRelatedMusicCurationParameters);
  -[PXStoryRelatedController relatedProducer](self, "relatedProducer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__PXStoryRelatedController_detailedDebugInformation__block_invoke;
  v12[3] = &unk_1E5135310;
  v14 = &v15;
  v7 = v3;
  v13 = v7;
  v8 = (id)objc_msgSend(v6, "requestConfigurationsRelatedToConfiguration:withOptions:musicCurationParameters:resultHandler:", v4, 8, v5, v12);

  dispatch_group_enter(v7);
  v9 = dispatch_time(0, 8000000000);
  dispatch_group_wait(v7, v9);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXStoryRelatedController result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("result"));

  -[PXStoryRelatedController detailedDebugInformation](self, "detailedDebugInformation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("upNextDebugInfo"));

}

- (PXStoryViewModel)viewModel
{
  return (PXStoryViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (NSSet)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (NSSet)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (PXStoryRelatedProducer)relatedProducer
{
  return self->_relatedProducer;
}

- (PXStoryConfiguration)mainConfiguration
{
  return self->_mainConfiguration;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (BOOL)canStartProducingRelated
{
  return self->_canStartProducingRelated;
}

- (BOOL)isProductionEnabled
{
  return self->_isProductionEnabled;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (PXStoryProducerResult)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_mainConfiguration, 0);
  objc_storeStrong((id *)&self->_relatedProducer, 0);
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

void __52__PXStoryRelatedController_detailedDebugInformation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "debugInfo");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("{error: \"%@\"}"), v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __65__PXStoryRelatedController_diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "assetCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  PXStoryDisplayAssetCollectionShortTitle(v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%li: “%@”\n\t\t%@\n"), a3, v6, v7);

}

void __57__PXStoryRelatedController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x200000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCanStartProducingRelated");
    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 0x20000000000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldAutoReplayPreference");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "performChanges:", &__block_literal_global_201121);

    }
  }

}

void __57__PXStoryRelatedController_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setWantsRelatedOverlayVisible:", 1);
  objc_msgSend(v2, "setShouldCountDownToUpNext:", 0);

}

void __46__PXStoryRelatedController_handleModelChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x80) == 0)
  {
    if ((v3 & 0x40) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "_invalidateMainModel");
    if ((*(_QWORD *)(a1 + 40) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 32), "_invalidateMainConfiguration");
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x40) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v3 & 4) != 0)
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCanStartProducingRelated");
LABEL_5:

}

uint64_t __42__PXStoryRelatedController__handleResult___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setResult:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setProgress:", 0);
}

void __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXStoryRelatedResult *v10;
  void *v11;
  PXStoryRelatedResult *v12;
  PXStoryProducerResult *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26[5];
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)objc_msgSend(v3, "deliveredNowWithRequestTime:", *(double *)(a1 + 72));
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0C809B0];
  if (v5)
  {
    objc_msgSend(v5, "storyConfigurations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v7;
    v26[2] = (id)3221225472;
    v26[3] = __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke_2;
    v26[4] = &unk_1E5135200;
    v27 = *(id *)(a1 + 32);
    PXMap();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [PXStoryRelatedResult alloc];
    objc_msgSend(v6, "debugInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXStoryRelatedResult initWithStoryConfigurations:debugInfo:](v10, "initWithStoryConfigurations:debugInfo:", v9, v11);

    v13 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v12);
    -[PXStoryProducerResult flags:](v13, "flags:", objc_msgSend(v3, "flags"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "error:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v16;
  }
  v17 = *(id *)(a1 + 40);
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 80);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v20 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 134218242;
    v29 = v20;
    v30 = 2114;
    v31 = v3;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PXStoryRelatedControllerProduction", "Context=%{signpost.telemetry:string2}lu Result=%{signpost.description:attribute,public}@", buf, 0x16u);
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke_23;
  v23[3] = &unk_1E5135228;
  v21 = *(NSObject **)(a1 + 48);
  v25 = *(_QWORD *)(a1 + 56);
  objc_copyWeak(v26, (id *)(a1 + 64));
  v24 = v3;
  v22 = v3;
  dispatch_async(v21, v23);

  objc_destroyWeak(v26);
}

id __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke_2(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithParentConfiguration:", *(_QWORD *)(a1 + 32));
}

void __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke_23(uint64_t a1)
{
  id WeakRetained;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_handleResult:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __38__PXStoryRelatedController_setResult___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRelatedConfigurations:", *(_QWORD *)(a1 + 32));
}

uint64_t __46__PXStoryRelatedController_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 12);
}

uint64_t __46__PXStoryRelatedController_initWithViewModel___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateMainConfiguration");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateMainModel");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCanStartProducingRelated");
}

@end
